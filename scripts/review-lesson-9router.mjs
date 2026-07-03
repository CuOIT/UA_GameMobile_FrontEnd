import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const contentRoot = join(root, "content");
const reviewsRoot = join(contentRoot, "reviews");
const outputsRoot = join(reviewsRoot, "outputs");

loadEnv(join(root, ".env.local"));
loadEnv(join(root, ".env"));

const args = parseArgs(process.argv.slice(2));
const day = Number(args.day || args.d);
const round = String(args.round || "review-1");

if (!Number.isInteger(day) || day < 1 || day > 30) {
  fail("Usage: node scripts/review-lesson-9router.mjs --day 4 [--round review-1] [--model cuo-combo]");
}

const baseUrl = trimTrailingSlash(process.env.NINEROUTER_BASE_URL || "http://localhost:20128/v1");
const apiKey = process.env.NINEROUTER_API_KEY;
const model = args.model || process.env.NINEROUTER_MODEL || "cuo-combo";
const maxTokens = Number(args.maxTokens || process.env.NINEROUTER_MAX_TOKENS || 3500);

if (!apiKey) {
  fail("Missing NINEROUTER_API_KEY. Put it in frontend/.env.local.");
}

const lessonPath = join(contentRoot, "lessons", `day-${String(day).padStart(2, "0")}.md`);
if (!existsSync(lessonPath)) {
  fail(`Missing lesson file: ${lessonPath}`);
}

const course = readJson("course.json");
const cases = readJson("cases.json");
const quizzes = readJson("quizzes.json");
const checklists = readJson("checklists.json");
const calculators = readJson("calculators.json");
const glossary = readJson("glossary.json");

const lessonMeta = course.lessons.find((item) => item.day === day);
if (!lessonMeta) {
  fail(`Missing lesson metadata for day ${day} in course.json.`);
}

const lessonMarkdown = readFileSync(lessonPath, "utf8");
const relatedCases = pickByIds(cases, lessonMeta.caseIds);
const relatedTools = pickByIds(calculators, lessonMeta.toolIds);
const relatedTerms = pickTerms(glossary, lessonMeta.glossaryTerms || lessonMeta.related_terms || []);
const quiz = quizzes[lessonMeta.quizId];
const checklist = checklists[lessonMeta.checklistId];

const prompt = buildPrompt({
  courseMeta: course.meta,
  lessonMeta,
  lessonMarkdown,
  relatedCases,
  relatedTools,
  relatedTerms,
  quiz,
  checklist
});

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
          "Review lessons for Unity indie developers preparing a micro soft-launch for a mobile puzzle game.",
          "Be concrete, skeptical, and evidence-driven.",
          "Write the review in Vietnamese with accents.",
          "Do not rewrite the whole lesson. Produce actionable review notes and exact edit recommendations."
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

function buildPrompt(context) {
  return [
    "# Review target",
    `Day: ${context.lessonMeta.day}`,
    `Title: ${context.lessonMeta.title}`,
    `Module: ${context.lessonMeta.module}`,
    `Artifact: ${context.lessonMeta.artifact}`,
    `Plan field: ${context.lessonMeta.planField}`,
    "",
    "# Course outcome",
    JSON.stringify(context.courseMeta, null, 2),
    "",
    "# Lesson markdown",
    context.lessonMarkdown,
    "",
    "# Related cases",
    JSON.stringify(context.relatedCases, null, 2),
    "",
    "# Related tools/calculators",
    JSON.stringify(context.relatedTools, null, 2),
    "",
    "# Related glossary terms",
    JSON.stringify(context.relatedTerms, null, 2),
    "",
    "# Quiz",
    JSON.stringify(context.quiz, null, 2),
    "",
    "# Checklist",
    JSON.stringify(context.checklist, null, 2),
    "",
    "# Review rubric",
    "Score the lesson from 1-5 for each category:",
    "1. UA correctness and decision usefulness.",
    "2. Practicality for a non-UA Unity indie developer.",
    "3. Depth of teaching content beyond generic advice.",
    "4. Real case/usecase quality and source/readout clarity.",
    "5. Metrics table/chart/visualization usefulness.",
    "6. Common mistake coverage.",
    "7. Lab/checklist/quiz alignment with the artifact.",
    "8. Fit with the final 1-page UA soft-launch plan.",
    "",
    "# Required output structure",
    "## Verdict",
    "Say whether this lesson is ready, needs minor edits, or needs major rewrite.",
    "",
    "## Scorecard",
    "Markdown table: category, score, evidence, required fix.",
    "",
    "## Highest-risk gaps",
    "List the top 5 issues that would make a beginner misunderstand UA or make a bad soft-launch decision.",
    "",
    "## Concrete edit plan",
    "Give exact sections to add/remove/rewrite. Include suggested headings and what each section must teach.",
    "",
    "## Metrics / visuals needed",
    "Specify any metric table, chart, fake cohort table, funnel diagram, or image block that should be added.",
    "",
    "## Quiz/checklist fixes",
    "Say whether quiz/checklist should change and why.",
    "",
    "## Final UA Plan impact",
    "Explain how this lesson should update the final plan field."
  ].join("\n");
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

function pickByIds(collection, ids = []) {
  if (!ids.length) return [];
  const values = Array.isArray(collection) ? collection : Object.values(collection);
  return ids.map((id) => values.find((item) => item.id === id)).filter(Boolean);
}

function pickTerms(collection, terms = []) {
  const values = Array.isArray(collection) ? collection : Object.values(collection);
  return terms.map((term) => values.find((item) => item.term === term || item.en === term)).filter(Boolean);
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



