import { existsSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const contentRoot = join(root, "content");
const lessonCount = 30;
const args = new Set(process.argv.slice(2));
const dryRun = args.has("--dry-run");
const chunkSize = Number(readArg("--chunk-size") || 5);

if (!Number.isInteger(chunkSize) || chunkSize < 1 || chunkSize > 30) {
  fail("Invalid --chunk-size. Use a number from 1 to 30.");
}

const config = readJson(join(contentRoot, "app-config.json"));
const version = readJson(join(contentRoot, "version.json"))?.contentVersion || "current";
const supabaseUrl = cleanUrl(process.env.SUPABASE_URL || config?.supabaseUrl);
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;
const rows = buildLessonRows();

console.log(`Prepared ${rows.length} lessons for Supabase sync.`);
console.log(`Content version: ${version}`);
console.log(`Target: ${supabaseUrl || "missing SUPABASE_URL/content app-config supabaseUrl"}`);

if (dryRun) {
  console.log("Dry run only. No Supabase write was attempted.");
  process.exit(0);
}

if (!supabaseUrl) {
  fail("Missing Supabase URL. Set SUPABASE_URL or content/app-config.json supabaseUrl.");
}

if (!serviceRoleKey) {
  fail([
    "Missing SUPABASE_SERVICE_ROLE_KEY.",
    "PowerShell example:",
    '$env:SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"',
    "node .\\scripts\\sync-lessons-to-supabase.mjs"
  ].join("\n"));
}

await syncRows(rows);
await verifySamples(rows);

console.log(`Synced ${rows.length} optimized lessons to Supabase.`);

function buildLessonRows() {
  const builtRows = [];
  const updatedAt = new Date().toISOString();

  for (let day = 1; day <= lessonCount; day += 1) {
    const padded = String(day).padStart(2, "0");
    const contentKey = `lessons/day-${padded}.md`;
    const lessonPath = join(contentRoot, "lessons", `day-${padded}.md`);

    if (!existsSync(lessonPath)) fail(`Missing lesson file: ${lessonPath}`);

    const markdown = readFileSync(lessonPath, "utf8").replace(/^\uFEFF/, "");
    validateLesson(contentKey, markdown);

    builtRows.push({
      content_key: contentKey,
      content_type: "markdown",
      json_content: null,
      text_content: markdown,
      updated_at: updatedAt
    });
  }

  return builtRows;
}

function validateLesson(contentKey, markdown) {
  const h2Count = (markdown.match(/^## /gm) || []).length;
  const imageCount = (markdown.match(/!\[[^\]]*]\(/g) || []).length;
  const placeholderCount = (markdown.match(/\[(VISUAL|IMAGE|THIRD-PARTY VISUAL) PLACEHOLDER/gi) || []).length;

  if (h2Count !== 17) fail(`${contentKey}: expected 17 H2 sections, found ${h2Count}.`);
  if (imageCount > 0) fail(`${contentKey}: contains ${imageCount} markdown image(s); keep visuals as placeholders.`);
  if (placeholderCount < 2) fail(`${contentKey}: expected at least 2 visual placeholders, found ${placeholderCount}.`);
}

async function syncRows(allRows) {
  for (let index = 0; index < allRows.length; index += chunkSize) {
    const chunk = allRows.slice(index, index + chunkSize);
    const response = await fetch(`${supabaseUrl}/rest/v1/ua_content_files?on_conflict=content_key`, {
      method: "POST",
      headers: authHeaders({
        "Content-Type": "application/json",
        Prefer: "resolution=merge-duplicates,return=minimal"
      }),
      body: JSON.stringify(chunk)
    });

    if (!response.ok) {
      const body = await response.text();
      fail(`Supabase upsert failed for rows ${index + 1}-${index + chunk.length}: ${response.status} ${body}`);
    }

    console.log(`Uploaded rows ${index + 1}-${index + chunk.length}`);
  }
}

async function verifySamples(allRows) {
  const sampleKeys = [allRows[0].content_key, allRows[14].content_key, allRows[29].content_key];

  for (const contentKey of sampleKeys) {
    const url = new URL(`${supabaseUrl}/rest/v1/ua_content_files`);
    url.searchParams.set("select", "content_key,text_content,updated_at");
    url.searchParams.set("content_key", `eq.${contentKey}`);

    const response = await fetch(url, {
      headers: authHeaders({ Accept: "application/json" })
    });

    if (!response.ok) {
      const body = await response.text();
      fail(`Supabase verification failed for ${contentKey}: ${response.status} ${body}`);
    }

    const rowsForKey = await response.json();
    const remoteText = rowsForKey?.[0]?.text_content;
    const localText = allRows.find((row) => row.content_key === contentKey)?.text_content;

    if (remoteText !== localText) fail(`Supabase verification mismatch for ${contentKey}.`);
    console.log(`Verified ${contentKey}`);
  }
}

function authHeaders(extra = {}) {
  return {
    apikey: serviceRoleKey,
    Authorization: `Bearer ${serviceRoleKey}`,
    ...extra
  };
}

function readJson(path) {
  try {
    return JSON.parse(readFileSync(path, "utf8"));
  } catch {
    return null;
  }
}

function readArg(name) {
  const index = process.argv.indexOf(name);
  if (index === -1) return "";
  return process.argv[index + 1] || "";
}

function cleanUrl(value) {
  return value ? value.replace(/\/+$/, "") : "";
}

function fail(message) {
  console.error(message);
  process.exit(1);
}
