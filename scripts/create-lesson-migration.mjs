import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const contentRoot = join(root, "content");
const versionPath = join(contentRoot, "version.json");
const version = readJson(versionPath)?.contentVersion || "current";
const defaultOut = `supabase-migrate-lessons-v${version}.sql`;
const outPath = resolveOutPath(process.argv, defaultOut);
const lessonCount = 30;

const rows = [];
const warnings = [];

for (let day = 1; day <= lessonCount; day += 1) {
  const padded = String(day).padStart(2, "0");
  const contentKey = `lessons/day-${padded}.md`;
  const lessonPath = join(contentRoot, "lessons", `day-${padded}.md`);

  if (!existsSync(lessonPath)) {
    throw new Error(`Missing lesson file: ${lessonPath}`);
  }

  const markdown = readFileSync(lessonPath, "utf8").replace(/^\uFEFF/, "");
  const h2Count = (markdown.match(/^## /gm) || []).length;
  const imageCount = (markdown.match(/!\[[^\]]*]\(/g) || []).length;
  const placeholderCount = (markdown.match(/\[(VISUAL|IMAGE|THIRD-PARTY VISUAL) PLACEHOLDER/gi) || []).length;

  if (h2Count !== 17) warnings.push(`${contentKey}: expected 17 H2 sections, found ${h2Count}`);
  if (imageCount > 0) warnings.push(`${contentKey}: contains ${imageCount} markdown image(s)`);
  if (placeholderCount < 2) warnings.push(`${contentKey}: expected at least 2 visual placeholders, found ${placeholderCount}`);

  rows.push(`  ('${contentKey}', 'markdown', null, '${sqlString(markdown)}', now())`);
}

const lessonKeys = Array.from({ length: lessonCount }, (_, index) => {
  return `'lessons/day-${String(index + 1).padStart(2, "0")}.md'`;
}).join(", ");

const sql = `-- Upsert the 30 optimized UA lesson markdown files into Supabase.
-- Source: content/lessons/day-01.md ... day-30.md
-- Version: ${version}
-- Generated: ${new Date().toISOString()}
-- Run supabase-schema.sql first if public.ua_content_files does not exist.

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
${rows.join(",\n")}
on conflict (content_key)
do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = now();

commit;

-- Quick verification after running this migration:
select count(*) as migrated_lessons
from public.ua_content_files
where content_key in (${lessonKeys});

select content_key, char_length(text_content) as lesson_chars, updated_at
from public.ua_content_files
where content_key in ('lessons/day-01.md', 'lessons/day-15.md', 'lessons/day-30.md')
order by content_key;
`;

writeFileSync(outPath, sql, "utf8");

console.log(`Created ${outPath}`);
console.log(`Lessons included: ${lessonCount}`);
if (warnings.length) {
  console.warn("Warnings:");
  for (const warning of warnings) console.warn(`- ${warning}`);
}

function readJson(path) {
  try {
    return JSON.parse(readFileSync(path, "utf8"));
  } catch {
    return null;
  }
}

function resolveOutPath(args, fallback) {
  const outIndex = args.indexOf("--out");
  if (outIndex === -1) return join(root, fallback);

  const value = args[outIndex + 1];
  if (!value || value.startsWith("--")) {
    throw new Error("Usage: node scripts/create-lesson-migration.mjs --out <file.sql>");
  }

  return join(root, value);
}

function sqlString(value) {
  return value.replaceAll("'", "''");
}
