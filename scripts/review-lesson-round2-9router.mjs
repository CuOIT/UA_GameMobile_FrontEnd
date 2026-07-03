import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const contentRoot = join(root, "content");
const reviewsRoot = join(contentRoot, "reviews");
const outputsRoot = join(reviewsRoot, "outputs");

loadEnv(join(root, ".env.local"));
loadEnv(join(root, ".env"));

const args = parseArgs(process.argv.slice(2));
const day = Number(args.day || args.d);
const round = String(args.round || "review-2");

if (!Number.isInteger(day) || day < 1 || day > 30) {
  fail("Usage: node scripts/review-lesson-round2-9router.mjs --day 4 --review-file <round1> --codex-file <rebuttal> [--round review-2]");
}

const reviewFile = resolveRequired(args.reviewFile || args["review-file"], "Missing --review-file");
const codexFile = resolveRequired(args.codexFile || args["codex-file"], "Missing --codex-file");
const baseUrl = trimTrailingSlash(process.env.NINEROUTER_BASE_URL || "http://localhost:20128/v1");
const apiKey = process.env.NINEROUTER_API_KEY;
const model = args.model || process.env.NINEROUTER_MODEL || "xai/grok-code-fast-1";
const maxTokens = Number(args.maxTokens || process.env.NINEROUTER_MAX_TOKENS || 3500);

if (!apiKey) {
  fail("Missing NINEROUTER_API_KEY. Put it in frontend/.env.local.");
}
if (!existsSync(reviewFile)) {
  fail(`Missing review file: ${reviewFile}`);
}
if (!existsSync(codexFile)) {
  fail(`Missing codex file: ${codexFile}`);
}

const lessonPath = join(contentRoot, "lessons", `day-${String(day).padStart(2, "0")}.md`);
if (!existsSync(lessonPath)) {
  fail(`Missing lesson file: ${lessonPath}`);
}

const course = readJson("course.json");
const lessonMeta = course.lessons.find((item) => item.day === day);
if (!lessonMeta) {
  fail(`Missing lesson metadata for day ${day} in course.json.`);
}

const lessonMarkdown = readFileSync(lessonPath, "utf8");
const round1Review = readFileSync(reviewFile, "utf8");
const codexRebuttal = readFileSync(codexFile, "utf8");

const prompt = [
  "# Task",
  "Review the original lesson again after reading the first external review and the Codex rebuttal/decision note.",
  "Your job is not to repeat round 1. Judge whether the Codex response is technically sound and whether the lesson still needs more changes.",
  "",
  "# Original lesson",
  lessonMarkdown,
  "",
  "# Round 1 review",
  round1Review,
  "",
  "# Codex rebuttal / action note",
  codexRebuttal,
  "",
  "# Required output structure",
  "## Verdict",
  "Say one of: approve Codex plan, approve with cautions, or reject and explain why.",
  "",
  "## Agreement check",
  "List which round-1 criticisms were correctly accepted, partially accepted, or rejected by Codex.",
  "",
  "## Remaining gaps",
  "List only unresolved issues that still matter for a beginner UA learner.",
  "",
  "## Must-edit now",
  "List exact lesson edits that should still happen before the lesson is considered strong.",
  "",
  "## Final recommendation",
  "Say whether the lesson can move forward after Codex edits or needs another rewrite cycle."
].join("\n");

const response = await fetch(`${baseUrl}/chat/completions`, {
  method: "POST",
  headers: {
    Authorization: `Bearer ${apiKey}`,
    "Content-Type": "application/json"
  },
  body: JSON.stringify({
    model,
    messages: [
      {
        role: "system",
        content: [
          "You are an expert UA marketing curriculum reviewer.",
          "Evaluate the Codex rebuttal against the lesson and prior review.",
          "Write in Vietnamese with accents.",
          "Be concise, skeptical, and concrete."
        ].join(" ")
      },
      {
        role: "user",
        content: prompt
      }
    ],
    temperature: 0.2,
    max_tokens: maxTokens
  })
});

const bodyText = await response.text();
if (!response.ok) {
  fail(`9Router request failed: ${response.status} ${response.statusText}\n${bodyText}`);
}

let parsed;
try {
  parsed = JSON.parse(stripTrailingDone(bodyText));
} catch {
  fail(`9Router returned non-JSON response:\n${bodyText}`);
}

const content = parsed.choices?.[0]?.message?.content;
if (!content) {
  fail(`9Router response did not contain choices[0].message.content:\n${bodyText}`);
}

mkdirSync(outputsRoot, { recursive: true });
const outPath = join(outputsRoot, `day-${String(day).padStart(2, "0")}.${round}.md`);
writeFileSync(outPath, formatReview({ day, round, model, baseUrl, content }), "utf8");
console.log(outPath);

function resolveRequired(value, errorText) {
  if (!value) fail(errorText);
  return value;
}

function formatReview({ day, round, model, baseUrl, content }) {
  return [
    "---",
    `day: ${day}`,
    `round: ${JSON.stringify(round)}`,
    `model: ${JSON.stringify(model)}`,
    `provider: ${JSON.stringify(baseUrl)}`,
    `createdAt: ${JSON.stringify(new Date().toISOString())}`,
    "---",
    "",
    content.trim(),
    ""
  ].join("\n");
}

function readJson(file) {
  return JSON.parse(readFileSync(join(contentRoot, file), "utf8"));
}

function parseArgs(values) {
  const result = {};
  for (let index = 0; index < values.length; index += 1) {
    const item = values[index];
    if (!item.startsWith("--")) continue;
    const key = item.slice(2);
    const next = values[index + 1];
    if (!next || next.startsWith("--")) {
      result[key] = true;
    } else {
      result[key] = next;
      index += 1;
    }
  }
  return result;
}

function loadEnv(path) {
  if (!existsSync(path)) return;
  const text = readFileSync(path, "utf8");
  for (const rawLine of text.split(/\r?\n/)) {
    const line = rawLine.trim();
    if (!line || line.startsWith("#")) continue;
    const equals = line.indexOf("=");
    if (equals === -1) continue;
    const key = line.slice(0, equals).trim();
    const value = line.slice(equals + 1).trim().replace(/^["']|["']$/g, "");
    if (!process.env[key]) process.env[key] = value;
  }
}

function trimTrailingSlash(value) {
  return value.replace(/\/+$/, "");
}

function stripTrailingDone(value) {
  const markerIndex = value.indexOf("data: [DONE]");
  return (markerIndex === -1 ? value : value.slice(0, markerIndex)).trim();
}

function fail(message) {
  console.error(message);
  process.exit(1);
}

