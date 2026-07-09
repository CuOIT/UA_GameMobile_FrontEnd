const contentRoot = "./content";
const stateKey = "uaBootcampState.v1";
const appVersion = "1.5.7";
const contentVersion = appVersion;

const defaultState = {
  stage: "all",
  completedLessons: [],
  bookmarks: [],
  quizResults: {},
  checklist: {},
  lessonReviews: {},
  chat: {
    providerUrl: "",
    apiKey: "",
    model: "gpt-4o-mini",
    memory: "Learner is a Unity developer studying mobile game UA marketing.",
    messages: []
  },
  plan: {
    hypothesis: "",
    audience: "",
    metricTargets: "",
    tracking: "",
    creativeMatrix: "",
    budget: "",
    successCriteria: "",
    killCriteria: "",
    nextAction: ""
  }
};

const stageLabels = {
  all: "All stages",
  idea: "No game yet",
  prototype: "Prototype / pre-launch",
  live: "Newly live game"
};

const app = document.querySelector("#app");
const title = document.querySelector("#pageTitle");
const stageSelect = document.querySelector("#stageSelect");
const versionNote = document.querySelector("#appVersionNote");
const navLinks = [...document.querySelectorAll("[data-nav]")];
let data = {};
let state = loadState();
let supabaseClient = null;
let currentUser = null;
let authReady = false;
let cloudStatus = "Local progress only";
let cloudSaveTimer = null;
let toastTimer = null;
let readingProgressCleanup = null;

init();
window.addEventListener("load", hydrateIcons);

async function init() {
  renderLoading();
  data = await loadContent();
  renderVersionNote();
  applyConfiguredDefaults();
  await initAuth();
  stageSelect.value = state.stage;
  stageSelect.addEventListener("change", () => {
    state.stage = stageSelect.value;
    saveState();
    renderRoute();
  });
  document.querySelector("#topbarLogoutBtn").addEventListener("click", signOutAccount);
  updateAuthActions();
  window.addEventListener("hashchange", renderRoute);
  if (!location.hash) location.hash = "#dashboard";
  renderRoute();
}

async function loadContent() {
  const config = await fetchOptionalJson("app-config.json");
  const [course, glossary, quizzes, calculators, checklists, cases, version, dbContent] = await Promise.all([
    fetchJson("course.json"),
    fetchJson("glossary.json"),
    fetchJson("quizzes.json"),
    fetchJson("calculators.json"),
    fetchJson("checklists.json"),
    fetchJson("cases.json"),
    fetchOptionalJson("version.json"),
    fetchDbContent(config)
  ]);
  const useDbContent = isCurrentDbContent(course, dbContent);
  const dbLessonMarkdown = dbContent.lessonMarkdown || {};
  if (hasMeaningfulDbContent(dbContent) && !useDbContent) {
    console.warn("Keeping static JSON content because DB course content is missing or legacy. DB lesson markdown can still be used.");
  }
  return {
    course: useDbContent && dbContent.course ? dbContent.course : course,
    glossary: useDbContent && dbContent.glossary ? dbContent.glossary : glossary,
    quizzes: useDbContent && dbContent.quizzes ? dbContent.quizzes : quizzes,
    calculators: useDbContent && dbContent.calculators ? dbContent.calculators : calculators,
    checklists: useDbContent && dbContent.checklists ? dbContent.checklists : checklists,
    cases: useDbContent && dbContent.cases ? dbContent.cases : cases,
    lessonMarkdown: dbLessonMarkdown,
    version: version?.appVersion ? version : { appVersion, contentVersion, updatedAt: "2026-07-03" },
    config
  };
}

function isCurrentDbContent(staticCourse, dbContent = {}) {
  if (!dbContent.course) return false;
  return dbContent.course?.meta?.title && dbContent.course.meta.title === staticCourse?.meta?.title;
}

function hasMeaningfulDbContent(dbContent = {}) {
  return Boolean(
    dbContent.course ||
    dbContent.glossary ||
    dbContent.quizzes ||
    dbContent.calculators ||
    dbContent.checklists ||
    dbContent.cases ||
    Object.keys(dbContent.lessonMarkdown || {}).length
  );
}

function withContentVersion(url) {
  return `${url}${url.includes("?") ? "&" : "?"}v=${contentVersion}`;
}
async function fetchOptionalJson(file) {
  try {
    return await fetchJson(file);
  } catch {
    return {};
  }
}

async function fetchJson(file) {
  const response = await fetch(withContentVersion(`${contentRoot}/${file}`));
  if (!response.ok) throw new Error(`Could not load ${file}`);
  return response.json();
}

async function getSupabaseClient(config) {
  if (supabaseClient) return supabaseClient;
  if (!config?.supabaseUrl || !config?.supabaseAnonKey) return null;
  const { createClient } = await import("https://esm.sh/@supabase/supabase-js@2");
  supabaseClient = createClient(config.supabaseUrl, config.supabaseAnonKey, {
    auth: { persistSession: true, autoRefreshToken: true }
  });
  return supabaseClient;
}

async function fetchDbContent(config) {
  try {
    const client = await getSupabaseClient(config);
    if (!client) return {};

    const { data: rows, error } = await client
      .from("ua_content_files")
      .select("content_key, content_type, json_content, text_content");

    if (error || !rows?.length) {
      if (error) console.warn("Could not load DB course content", error);
      return {};
    }

    const jsonKeys = {
      "course.json": "course",
      "glossary.json": "glossary",
      "quizzes.json": "quizzes",
      "calculators.json": "calculators",
      "checklists.json": "checklists",
      "cases.json": "cases"
    };
    const content = { lessonMarkdown: {} };

    for (const row of rows) {
      const jsonKey = jsonKeys[row.content_key];
      if (jsonKey && row.content_type === "json") content[jsonKey] = row.json_content;

      const lessonMatch = row.content_key.match(/^lessons\/day-(\d{2})\.md$/);
      if (lessonMatch && row.content_type === "markdown") {
        content.lessonMarkdown[lessonMatch[1]] = row.text_content;
      }
    }

    return content;
  } catch (error) {
    console.warn("Falling back to static course content", error);
    return {};
  }
}

async function fetchLesson(day) {
  const padded = String(day).padStart(2, "0");
  const dbMarkdown = data.lessonMarkdown?.[padded];
  if (typeof dbMarkdown === "string" && dbMarkdown.length) return dbMarkdown;

  try {
    const response = await fetch(withContentVersion(`${contentRoot}/lessons/day-${padded}.md`));
    if (response.ok) return await response.text();
  } catch (err) {
    console.warn(`Could not load static day-${padded}.md`, err);
  }
  throw new Error(`Could not load day-${padded}.md`);
}

function loadState() {
  try {
    const parsed = JSON.parse(localStorage.getItem(stateKey) || "{}");
    return {
      ...defaultState,
      ...parsed,
      chat: { ...defaultState.chat, ...(parsed.chat || {}) },
      plan: { ...defaultState.plan, ...(parsed.plan || {}) },
      lessonReviews: { ...(parsed.lessonReviews || {}) }
    };
  } catch {
    return structuredClone(defaultState);
  }
}

function saveState(options = {}) {
  localStorage.setItem(stateKey, JSON.stringify(state));
  if (!options.skipCloud) scheduleCloudSave();
}

function renderVersionNote() {
  if (!versionNote) return;
  const version = data.version?.appVersion || appVersion;
  const updatedAt = data.version?.updatedAt ? ` · ${data.version.updatedAt}` : "";
  versionNote.textContent = `Version ${version}${updatedAt}`;
}

function renderLoading() {
  app.replaceChildren(document.querySelector("#loadingTemplate").content.cloneNode(true));
}
function notify(message, variant = "info") {
  cloudStatus = `[${new Date().toLocaleTimeString()}] ${message}`;
  let toast = document.querySelector("#appToast");
  if (!toast) {
    toast = document.createElement("div");
    toast.id = "appToast";
    toast.className = "app-toast";
    document.body.appendChild(toast);
  }
  toast.className = `app-toast ${variant}`;
  toast.textContent = cloudStatus;
  toast.dataset.visible = "true";
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => {
    toast.dataset.visible = "false";
  }, 4200);
}

function renderRoute() {
  teardownReadingProgress();
  const route = location.hash.replace("#", "") || "dashboard";
  
  let cleanRoute = route;
  let termParam = "";
  if (route.includes("?")) {
    const parts = route.split("?");
    cleanRoute = parts[0];
    const params = new URLSearchParams(parts[1]);
    termParam = params.get("term") || "";
  }

  navLinks.forEach((link) => link.classList.toggle("active", cleanRoute.startsWith(link.dataset.nav)));

  if (cleanRoute.startsWith("lesson-")) {
    const day = Number(cleanRoute.split("-")[1]);
    renderLesson(day);
    return;
  }

  const routes = {
    dashboard: renderDashboard,
    lessons: renderLessons,
    glossary: () => renderGlossary(termParam),
    tools: renderTools,
    cases: renderCases,
    chat: renderChat,
    plan: renderPlan,
    account: renderAccount,
    signin: () => renderAuthPage("signin"),
    signup: () => renderAuthPage("signup")
  };
  updateAuthActions();
  (routes[cleanRoute] || renderDashboard)();
  hydrateIcons();
}

function icon(name, className = "") {
  return `<i data-lucide="${name}"${className ? ` class="${className}"` : ""}></i>`;
}

function hydrateIcons() {
  if (window.lucide?.createIcons) {
    window.lucide.createIcons({ attrs: { "aria-hidden": "true" } });
  }
}

function applyConfiguredDefaults() {
  const apiBaseUrl = (data.config?.apiBaseUrl || "").replace(/\/$/, "");
  if (apiBaseUrl && !state.chat.providerUrl) {
    state.chat.providerUrl = `${apiBaseUrl}/api/chat`;
    saveState({ skipCloud: true });
  }
}
async function initAuth() {
  const config = data.config || {};
  if (!config.supabaseUrl || !config.supabaseAnonKey) {
    cloudStatus = "Cloud login is not configured. Fill content/app-config.json to enable Supabase sync.";
    authReady = true;
    return;
  }

  try {
    supabaseClient = await getSupabaseClient(config);
    const { data: sessionData } = await supabaseClient.auth.getSession();
    currentUser = sessionData.session?.user || null;
    cloudStatus = currentUser ? `Signed in as ${currentUser.email}` : "Cloud login ready.";

    supabaseClient.auth.onAuthStateChange(async (_event, session) => {
      currentUser = session?.user || null;
      cloudStatus = currentUser ? `Signed in as ${currentUser.email}` : "Signed out. Local progress is still available.";
      if (currentUser) await pullCloudProgress();
      renderRoute();
    });

    if (currentUser) await pullCloudProgress();
  } catch (error) {
    cloudStatus = `Supabase client failed to load: ${error.message}`;
  } finally {
    authReady = true;
  }
}

function cloudProgressFromState() {
  return {
    stage: state.stage,
    completedLessons: state.completedLessons,
    bookmarks: state.bookmarks,
    quizResults: state.quizResults,
    checklist: state.checklist,
    lessonReviews: state.lessonReviews,
    plan: state.plan,
    chat: { memory: state.chat?.memory || "" }
  };
}

function mergeCloudProgress(progress = {}) {
  const local = state;
  const mergedPlan = { ...defaultState.plan, ...(progress.plan || {}) };
  for (const [key, value] of Object.entries(local.plan || {})) {
    if (String(value || "").trim()) mergedPlan[key] = value;
  }

  state = {
    ...defaultState,
    ...local,
    stage: local.stage || progress.stage || defaultState.stage,
    completedLessons: [...new Set([...(progress.completedLessons || []), ...(local.completedLessons || [])])].sort((a, b) => a - b),
    bookmarks: [...new Set([...(progress.bookmarks || []), ...(local.bookmarks || [])])].sort((a, b) => a - b),
    quizResults: { ...(progress.quizResults || {}), ...(local.quizResults || {}) },
    checklist: { ...(progress.checklist || {}), ...(local.checklist || {}) },
    lessonReviews: { ...(progress.lessonReviews || {}), ...(local.lessonReviews || {}) },
    plan: mergedPlan,
    chat: {
      ...defaultState.chat,
      ...(local.chat || {}),
      memory: local.chat?.memory || progress.chat?.memory || defaultState.chat.memory,
      apiKey: local.chat?.apiKey || "",
      messages: local.chat?.messages || []
    }
  };
  saveState({ skipCloud: true });
}

async function pullCloudProgress() {
  if (!supabaseClient || !currentUser) return;
  cloudStatus = "Loading cloud progress...";
  const { data: row, error } = await supabaseClient
    .from("ua_user_progress")
    .select("progress")
    .eq("user_id", currentUser.id)
    .maybeSingle();

  if (error) {
    cloudStatus = `Could not load cloud progress: ${error.message}`;
    return;
  }

  if (row?.progress) {
    mergeCloudProgress(row.progress);
    await pushCloudProgress();
    cloudStatus = `Cloud progress merged for ${currentUser.email}`;
  } else {
    await pushCloudProgress();
  }
}

async function pushCloudProgress() {
  if (!supabaseClient || !currentUser) return;
  const payload = cloudProgressFromState();
  const { error } = await supabaseClient.from("ua_user_progress").upsert({
    user_id: currentUser.id,
    progress: payload,
    updated_at: new Date().toISOString()
  }, { onConflict: "user_id" });
  cloudStatus = error ? `Could not save cloud progress: ${error.message}` : `Cloud progress saved for ${currentUser.email}`;
  if (error) console.warn("Supabase progress save failed", error);
  return !error;
}

function scheduleCloudSave() {
  if (!supabaseClient || !currentUser) return;
  clearTimeout(cloudSaveTimer);
  cloudSaveTimer = setTimeout(() => {
    pushCloudProgress().then(() => {
      if (location.hash === "#account") renderAccount();
      updateAuthActions();
    });
  }, 900);
}
function filteredLessons() {
  if (state.stage === "all") return data.course.lessons;
  return data.course.lessons.filter((lesson) => lesson.stages.includes(state.stage));
}

function completionPercent() {
  return Math.round((state.completedLessons.length / data.course.lessons.length) * 100);
}

function nextLesson() {
  return data.course.lessons.find((lesson) => !state.completedLessons.includes(lesson.day)) || data.course.lessons[29];
}

function renderDashboard() {
  title.textContent = "Dashboard";
  const next = nextLesson();
  const planFields = Object.values(state.plan).filter((value) => value.trim()).length;
  const progressSyncNote = currentUser 
    ? "Tiến độ khóa học của bạn đã được đồng bộ hóa trực tuyến qua tài khoản."
    : "Tiến độ khóa học hiện đang lưu tạm thời. Hãy Đăng nhập để đồng bộ hóa trực tuyến.";
  app.innerHTML = `
    <section class="metric-row">
      <div class="metric">${icon("book-check")}<strong>${state.completedLessons.length}/30</strong><span>lessons completed</span></div>
      <div class="metric">${icon("activity")}<strong>${completionPercent()}%</strong><span>course progress</span></div>
      <div class="metric">${icon("clipboard-check")}<strong>${planFields}/9</strong><span>UA plan sections</span></div>
      <div class="metric">${icon("badge-check")}<strong>${Object.keys(state.quizResults).length}</strong><span>quizzes attempted</span></div>
    </section>
    <section class="panel">
      <h2>Learning progress</h2>
      <p>${progressSyncNote}</p>
      <div class="progress-bar" aria-label="Course progress">
        <div class="progress-fill" style="width:${completionPercent()}%"></div>
      </div>
    </section>
    <section class="grid two">
      <article class="panel">
        <p class="eyebrow">Next lesson</p>
        <h2>Day ${next.day}: ${escapeHtml(next.title)}</h2>
        <p>${escapeHtml(next.summary)}</p>
        <div class="tag-row">${renderTags(next.stages.map((stage) => stageLabels[stage]), "blue")}</div>
        <a class="button" href="#lesson-${next.day}">${icon("arrow-right")}Continue</a>
      </article>
      <article class="panel">
        <p class="eyebrow">Unity dev lens</p>
        <h2>UA is a product feedback loop</h2>
        <p>Trang này dạy UA như một vòng lặp giữa creative, store, tracking, retention và economy. Bạn không cần code SDK trong MVP, nhưng cần biết event nào phải đo và quyết định nào phụ thuộc vào data.</p>
        <a class="button" href="#plan">${icon("clipboard-list")}Open Final UA Plan</a>
      </article>
    </section>
    <section class="grid three">
      ${dashboardShortcut("Glossary", "CPI, LTV, ROAS, SKAN, cohort và các thuật ngữ được giải thích bằng tiếng Việt.", "#glossary", "languages")}
      ${dashboardShortcut("Tools", "Máy tính break-even CPI, LTV rough estimate, ROAS target và test budget.", "#tools", "calculator")}
      ${dashboardShortcut("Case Studies", "Đọc dữ liệu mẫu và chọn scale, iterate hoặc kill campaign.", "#cases", "file-search")}
      ${dashboardShortcut("AI Chat", "Hỏi đáp theo context bài học, glossary và memory cục bộ.", "#chat", "messages-square")}
    </section>
  `;
}

function dashboardShortcut(name, copy, href, iconName) {
  return `
    <article class="panel">
      <h3>${icon(iconName)}${name}</h3>
      <p>${copy}</p>
      <a class="button ghost-button" href="${href}">${icon("arrow-up-right")}Open</a>
    </article>
  `;
}

function renderLessons() {
  title.textContent = "30-Day Lessons";
  const lessons = filteredLessons();
  app.innerHTML = `
    <section class="panel">
      <h2>Course path</h2>
      <p>Current stage filter: <strong>${stageLabels[state.stage]}</strong>. Mỗi bài có nội dung song ngữ, glossary liên quan, quiz ngắn và checklist thực hành.</p>
    </section>
    <section class="lesson-list">
      ${lessons.map(renderLessonCard).join("")}
    </section>
  `;
}

function renderLessonCard(lesson) {
  const done = state.completedLessons.includes(lesson.day);
  return `
    <article class="lesson-card ${done ? "done" : ""}">
      <div class="tag-row">
        <span class="tag ${done ? "ok" : "warn"}">${done ? "Done" : `Day ${lesson.day}`}</span>
        <span class="tag">${lesson.module}</span>
      </div>
      <h3>${escapeHtml(lesson.title)}</h3>
      <p>${escapeHtml(lesson.summary)}</p>
      ${lesson.artifact ? `<p><strong>Artifact:</strong> ${escapeHtml(lesson.artifact)}</p>` : ""}
      <div class="tag-row">${renderTags(lesson.stages.map((stage) => stageLabels[stage]), "blue")}</div>
      <a class="button" href="#lesson-${lesson.day}">${icon("book-open")}Open lesson</a>
    </article>
  `;
}

async function renderLesson(day) {
  const lesson = data.course.lessons.find((item) => item.day === day);
  if (!lesson) {
    renderLessons();
    return;
  }

  title.textContent = `Day ${lesson.day}: ${lesson.title}`;
  renderLoading();
  const markdown = await fetchLesson(day);
  const quiz = data.quizzes[lesson.quizId];
  const checklist = data.checklists[lesson.checklistId] || [];
  const relatedCases = relatedItems(data.cases, lesson.caseIds);
  const relatedTools = relatedItems(data.calculators, lesson.toolIds);
  const relatedReferences = relatedItems(data.course.references || [], lesson.referenceIds);
  const qualityReview = state.lessonReviews?.[day];
  const lessonIndex = data.course.lessons.findIndex((item) => item.day === day);
  const previousLesson = lessonIndex > 0 ? data.course.lessons[lessonIndex - 1] : null;
  const nextLesson = lessonIndex >= 0 && lessonIndex < data.course.lessons.length - 1 ? data.course.lessons[lessonIndex + 1] : null;
  const lessonMarkdown = stripFrontmatter(markdown);
  const toc = extractLessonToc(lessonMarkdown);
  const relatedCount = relatedCases.length + relatedTools.length + relatedReferences.length;
  app.innerHTML = `
    <section class="lesson-layout">
      <article class="lesson-body">
        <div class="panel lesson-hero">
          <div class="lesson-hero-top">
            <div class="tag-row">
              <span class="tag warn">Day ${lesson.day}</span>
              <span class="tag">${lesson.module}</span>
              <span class="tag">${lesson.difficulty}</span>
              <span class="tag">${icon("clock")} ${lesson.estimatedMinutes} min</span>
            </div>
            <span class="lesson-position">${lessonIndex + 1}/${data.course.lessons.length}</span>
          </div>
          <div class="lesson-hero-grid">
            <div class="lesson-hero-copy">
              <p>${escapeHtml(lesson.summary)}</p>
              ${lesson.learningOutcome ? `<p><strong>Outcome:</strong> ${escapeHtml(lesson.learningOutcome)}</p>` : ""}
              ${lesson.artifact ? `<p><strong>Artifact:</strong> ${escapeHtml(lesson.artifact)}</p>` : ""}
            </div>
            <div class="lesson-focus-card">
              <span>${icon("target")}Lesson focus</span>
              <strong>${escapeHtml(lesson.artifact || lesson.learningOutcome || lesson.title)}</strong>
              <small>${toc.length} sections · ${checklist.length} checks · ${quiz ? "1 quiz" : "no quiz"}</small>
            </div>
          </div>
          <div class="lesson-actions">
            <button id="completeLessonBtn" type="button">${icon(state.completedLessons.includes(day) ? "rotate-ccw" : "check-circle-2")}${state.completedLessons.includes(day) ? "Mark as incomplete" : "Mark lesson done"}</button>
            <button class="ghost-button" id="bookmarkLessonBtn" type="button">${icon(state.bookmarks.includes(day) ? "bookmark-minus" : "bookmark-plus")}${state.bookmarks.includes(day) ? "Remove bookmark" : "Bookmark"}</button>
          </div>
        </div>
        ${renderLessonToc(toc, "inline")}
        <div class="markdown" id="lessonReader">${renderMarkdown(lessonMarkdown)}</div>
        ${renderLessonNav(previousLesson, nextLesson)}
      </article>
      <aside class="side-stack">
        ${renderLessonSnapshot(lesson, toc, lessonIndex, checklist.length, Boolean(quiz), relatedCount)}
        ${renderLessonToc(toc, "side")}
        <section class="panel">
          <h2>${icon("languages")}Related glossary</h2>
          <div class="tag-row">
            ${lesson.glossaryTerms.map((term) => `<a class="tag blue" href="#glossary" data-term="${term}">${term}</a>`).join("")}
          </div>
        </section>
        <section class="panel">
          <h2>${icon("list-checks")}Checklist</h2>
          <div class="checklist">
            ${checklist.map((item, index) => renderCheckItem(lesson.checklistId, index, item)).join("")}
          </div>
        </section>
        <section class="panel">
          <h2>${icon("circle-help")}Quiz</h2>
          ${renderQuiz(lesson.quizId, quiz)}
        </section>
        <section class="panel ai-review-panel">
          <h2>${icon("sparkles")}AI quality review</h2>
          <p class="status-line">Chấm lesson theo rubric: decision clarity, teaching depth, metric visuals, mistake coverage, lab output và actionability.</p>
          <button id="reviewLessonBtn" type="button">${icon("wand-sparkles")}Review this lesson</button>
          <div class="review-output">${qualityReview ? escapeHtml(qualityReview) : "No AI review yet."}</div>
        </section>
        ${relatedCases.length ? `
        <section class="panel">
          <h2>${icon("file-search")}Related cases</h2>
          <div class="mini-list">
            ${relatedCases.map((item) => `<p><strong>${escapeHtml(item.title)}</strong><br>${escapeHtml(item.recommendation)}</p>`).join("")}
          </div>
        </section>` : ""}
        ${relatedTools.length ? `
        <section class="panel">
          <h2>${icon("calculator")}Useful tools</h2>
          <div class="mini-list">
            ${relatedTools.map((item) => `<p><a href="#tools"><strong>${escapeHtml(item.name)}</strong></a><br>${escapeHtml(item.description)}</p>`).join("")}
          </div>
        </section>` : ""}
        ${relatedReferences.length ? `
        <section class="panel">
          <h2>${icon("library")}Curated references</h2>
          <div class="mini-list">
            ${relatedReferences.map((item) => `<p><a href="${escapeHtml(item.url)}" target="_blank" rel="noreferrer"><strong>${escapeHtml(item.title)}</strong></a><br>${escapeHtml(item.note)}</p>`).join("")}
          </div>
        </section>` : ""}
      </aside>
    </section>
  `;

  document.querySelector("#completeLessonBtn").addEventListener("click", () => toggleLesson(day));
  document.querySelector("#bookmarkLessonBtn").addEventListener("click", () => toggleBookmark(day));
  document.querySelector("#reviewLessonBtn")?.addEventListener("click", () => reviewLessonQuality(lesson, markdown));
  document.querySelectorAll("[data-check]").forEach((input) => {
    input.addEventListener("change", (event) => {
      state.checklist[event.target.dataset.check] = event.target.checked;
      saveState();
    });
  });
  document.querySelectorAll("[data-quiz-option]").forEach((button) => {
    button.addEventListener("click", () => answerQuiz(lesson.quizId, Number(button.dataset.index)));
  });
  document.querySelectorAll("[data-toc-target]").forEach((link) => {
    link.addEventListener("click", (event) => {
      event.preventDefault();
      document.getElementById(link.dataset.tocTarget)?.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });
  setupLessonProgress();
  hydrateIcons();
}

function renderLessonToc(toc, variant = "side") {
  if (!toc.length) return "";
  const variantClass = variant === "inline" ? "lesson-toc-inline" : "lesson-toc-side";
  return `
    <nav class="panel lesson-toc ${variantClass}" aria-label="Lesson table of contents">
      <h2>${icon("list-tree")}On this lesson</h2>
      <div>
        ${toc.map((item) => `<a href="#${item.id}" data-toc-target="${item.id}">${escapeHtml(item.title)}</a>`).join("")}
      </div>
    </nav>
  `;
}

function renderLessonSnapshot(lesson, toc, lessonIndex, checklistCount, hasQuiz, relatedCount) {
  const total = data.course.lessons.length || 30;
  const position = Math.max(lessonIndex + 1, 1);
  const progress = Math.min(Math.max((position / total) * 100, 2), 100).toFixed(1);
  return `
    <section class="panel lesson-snapshot" aria-label="Lesson snapshot">
      <div class="lesson-snapshot-head">
        <span>${icon("layers-3")}Lesson depth</span>
        <strong>Day ${lesson.day}</strong>
      </div>
      <div class="lesson-depth-track" aria-hidden="true"><span style="width: ${progress}%"></span></div>
      <div class="lesson-depth-grid">
        <div><span>Sections</span><strong>${toc.length}</strong></div>
        <div><span>Checks</span><strong>${checklistCount}</strong></div>
        <div><span>Quiz</span><strong>${hasQuiz ? "Yes" : "No"}</strong></div>
        <div><span>Resources</span><strong>${relatedCount}</strong></div>
      </div>
      <p>${escapeHtml(lesson.learningOutcome || lesson.summary)}</p>
    </section>
  `;
}

function renderLessonNav(previousLesson, nextLesson) {
  if (!previousLesson && !nextLesson) return "";
  const previous = previousLesson
    ? `<a class="lesson-nav-link previous" href="#lesson-${previousLesson.day}"><span>Previous lesson</span><strong>Day ${previousLesson.day}: ${escapeHtml(previousLesson.title)}</strong></a>`
    : `<span class="lesson-nav-link disabled"><span>Previous lesson</span><strong>No previous lesson</strong></span>`;
  const next = nextLesson
    ? `<a class="lesson-nav-link next" href="#lesson-${nextLesson.day}"><span>Next lesson</span><strong>Day ${nextLesson.day}: ${escapeHtml(nextLesson.title)}</strong></a>`
    : `<span class="lesson-nav-link disabled"><span>Next lesson</span><strong>No next lesson</strong></span>`;
  return `
    <nav class="lesson-nav" aria-label="Lesson navigation">
      ${previous}
      ${next}
    </nav>
  `;
}

function relatedItems(items = [], ids = []) {
  const wanted = new Set(ids || []);
  return items.filter((item) => wanted.has(item.id));
}

function renderCheckItem(checklistId, index, item) {
  const key = `${checklistId}:${index}`;
  return `
    <label class="check-item">
      <input type="checkbox" data-check="${key}" ${state.checklist[key] ? "checked" : ""} />
      <span>${escapeHtml(item)}</span>
    </label>
  `;
}

function renderQuiz(quizId, quiz) {
  if (!quiz) return `<p class="empty">No quiz for this lesson.</p>`;
  const result = state.quizResults[quizId];
  return `
    <p><strong>${escapeHtml(quiz.question)}</strong></p>
    <div class="quiz-options">
      ${quiz.options
        .map((option, index) => {
          const cls =
            result === undefined ? "" : index === quiz.answer ? "correct" : index === result ? "wrong" : "";
          return `<button class="quiz-option ${cls}" data-quiz-option="${quizId}" data-index="${index}" type="button">${escapeHtml(option)}</button>`;
        })
        .join("")}
    </div>
    ${result === undefined ? "" : `<p>${escapeHtml(quiz.explanation)}</p>`}
  `;
}

async function answerQuiz(quizId, answer) {
  state.quizResults[quizId] = answer;
  saveState({ skipCloud: true });
  if (currentUser) await pushCloudProgress();
  renderRoute();
}

async function toggleLesson(day) {
  const set = new Set(state.completedLessons);
  set.has(day) ? set.delete(day) : set.add(day);
  state.completedLessons = [...set].sort((a, b) => a - b);
  saveState({ skipCloud: true });
  if (currentUser) await pushCloudProgress();
  renderRoute();
}

async function toggleBookmark(day) {
  const set = new Set(state.bookmarks);
  set.has(day) ? set.delete(day) : set.add(day);
  state.bookmarks = [...set].sort((a, b) => a - b);
  saveState({ skipCloud: true });
  if (currentUser) await pushCloudProgress();
  renderRoute();
}

function renderGlossary(termParam = "") {
  title.textContent = "Glossary";
  app.innerHTML = `
    <section class="panel">
      <h2>${icon("languages")}UA terms, explained for Unity developers</h2>
      <div class="search-row">
        <input id="termSearch" type="search" placeholder="Search terms: CPI, LTV, ROAS, SKAN..." />
      </div>
    </section>
    <section class="term-grid" id="termGrid">
      ${renderTermCards(data.glossary)}
    </section>
  `;
  const searchInput = document.querySelector("#termSearch");
  searchInput.addEventListener("input", (event) => {
    const query = event.target.value.trim().toLowerCase();
    const terms = data.glossary.filter((term) =>
      [term.term, term.vi, term.en, term.analogy].join(" ").toLowerCase().includes(query)
    );
    document.querySelector("#termGrid").innerHTML = renderTermCards(terms);
  });

  if (termParam) {
    setTimeout(() => {
      const card = document.getElementById(`term-${termParam.toLowerCase()}`);
      if (card) {
        card.scrollIntoView({ behavior: "smooth", block: "center" });
        card.style.borderColor = "var(--accent)";
        card.style.boxShadow = "0 0 12px var(--accent)";
        searchInput.value = termParam;
      }
    }, 150);
  }
}

function renderTermCards(terms) {
  return terms
    .map(
      (term) => `
      <article class="term-card" id="term-${term.term.toLowerCase()}">
        <h3>${escapeHtml(term.term)}</h3>
        <p>${escapeHtml(term.vi)}</p>
        <p><strong>EN:</strong> ${escapeHtml(term.en)}</p>
        ${term.formula ? `<p><span class="formula">${escapeHtml(term.formula)}</span></p>` : ""}
        <p><strong>Unity lens:</strong> ${escapeHtml(term.analogy)}</p>
      </article>
    `
    )
    .join("");
}

function renderTools() {
  title.textContent = "Tools";
  app.innerHTML = `
    <section class="panel">
      <h2>${icon("calculator")}Static calculators</h2>
      <p>Các công cụ này dùng công thức đơn giản để giúp beginner hiểu quyết định UA. Kết quả là learning aid, không phải forecast tài chính chính thức.</p>
    </section>
    <section class="tool-grid">
      ${data.calculators.map(renderTool).join("")}
    </section>
  `;
  data.calculators.forEach((tool) => {
    document.querySelector(`#${tool.id} button`).addEventListener("click", () => calculateTool(tool));
  });
}

function renderTool(tool) {
  return `
    <article class="tool-card" id="${tool.id}">
      <h3>${icon("gauge")} ${escapeHtml(tool.name)}</h3>
      <p>${escapeHtml(tool.description)}</p>
      <div class="tool-fields">
        ${tool.fields
          .map(
            (field) => `
          <label class="tool-field">
            <span>${escapeHtml(field.label)}</span>
            <input type="number" step="0.01" value="${field.default}" data-field="${field.key}" />
          </label>
        `
          )
          .join("")}
      </div>
      <button type="button">${icon("equal")}Calculate</button>
      <div class="tool-result" data-result>Result appears here.</div>
    </article>
  `;
}

function calculateTool(tool) {
  const root = document.querySelector(`#${tool.id}`);
  const values = {};
  root.querySelectorAll("[data-field]").forEach((input) => {
    values[input.dataset.field] = Number(input.value);
  });
  let result = "";
  if (tool.id === "breakEvenCpi") {
    result = `Break-even CPI ≈ $${(values.ltv * values.grossMargin).toFixed(2)} per install`;
  }
  if (tool.id === "sampleSize") {
    const installs = values.budget / values.cpi;
    const perCell = installs / values.cells;
    result = `Estimated installs ≈ ${installs.toFixed(0)} total, ${perCell.toFixed(0)} per creative cell. ${perCell < 30 ? "Reduce cells or treat results as very directional." : "Enough for directional creative learning, not final scale proof."}`;
  }
  if (tool.id === "cohortReadout") {
    const d1 = (values.d1Users / values.installs) * 100;
    const d7 = (values.d7Users / values.installs) * 100;
    const cpi = values.spend / values.installs;
    const roas = (values.revenueD7 / values.spend) * 100;
    result = `D1 ${d1.toFixed(1)}%, D7 ${d7.toFixed(1)}%, CPI $${cpi.toFixed(2)}, D7 ROAS ${roas.toFixed(1)}%. Read with cohort size and attribution caveats.`;
  }
  if (tool.id === "testBudget") {
    result = `Suggested test budget ≈ $${(values.cpi * values.installsPerCreative * values.creatives).toFixed(2)}`;
  }
  root.querySelector("[data-result]").textContent = result;
}

function renderCases() {
  title.textContent = "Case Studies";
  app.innerHTML = `
    <section class="panel">
      <h2>${icon("file-search")}Read the signal, then choose</h2>
      <p>Mỗi case dùng dữ liệu mẫu để luyện tư duy: scale, iterate hay kill. Không cần backend; dữ liệu nằm trong JSON.</p>
    </section>
    <section class="case-grid">
      ${data.cases.map(renderCase).join("")}
    </section>
  `;
}

function renderChat() {
  title.textContent = "AI Chat";
  app.innerHTML = `
    <section class="chat-layout">
      <article class="panel chat-window">
        <div>
          <h2>${icon("messages-square")}Ask about your lessons</h2>
          <p class="status-line">The chatbot uses context from 30 lessons, glossary, case studies, local memory, chat history, and your Final UA Plan. For production, point Provider URL to a Vercel/Netlify serverless proxy so the API key is not exposed in the browser.</p>
        </div>
        <div class="chat-log" id="chatLog">
          ${renderMessages()}
        </div>
        <form class="chat-input" id="chatForm">
          <textarea id="chatPrompt" placeholder="Example: My puzzle game has D1 retention 28% and CPI $0.55. Should I iterate creative or fix tutorial?"></textarea>
          <button type="submit">${icon("send")}Send</button>
        </form>
      </article>
      <aside class="panel settings-stack">
        <h2>${icon("settings-2")}Provider + memory</h2>
        <label class="field">
          <span>Provider URL</span>
          <input id="providerUrl" value="${escapeHtml(state.chat.providerUrl)}" placeholder="https://api.openai.com/v1/chat/completions or /api/chat" />
        </label>
        <label class="field">
          <span>Model</span>
          <input id="chatModel" value="${escapeHtml(state.chat.model)}" placeholder="gpt-4o-mini" />
        </label>
        <label class="field">
          <span>API key</span>
          <input id="chatApiKey" type="password" value="${escapeHtml(state.chat.apiKey)}" placeholder="Stored only in this browser" />
        </label>
        <label class="field">
          <span>Memory notes</span>
          <textarea id="chatMemory" placeholder="Learner background, current game, preferred genre, constraints...">${escapeHtml(state.chat.memory)}</textarea>
        </label>
        <button id="saveChatSettings" type="button">${icon("save")}Save settings</button>
        <button class="ghost-button" id="clearChatHistory" type="button">${icon("trash-2")}Clear chat history</button>
        <p class="status-line">Direct third-party provider URLs can fail because of CORS and would store the API key in localStorage. A serverless proxy is the right option for public deploys.</p>
      </aside>
    </section>
  `;

  document.querySelector("#saveChatSettings").addEventListener("click", saveChatSettings);
  document.querySelector("#clearChatHistory").addEventListener("click", () => {
    state.chat.messages = [];
    saveState();
    renderChat();
  });
  document.querySelector("#chatForm").addEventListener("submit", sendChatMessage);
  scrollChatToBottom();
}

function renderMessages() {
  if (!state.chat.messages.length) {
    return `<p class="empty">No messages yet. Ask about a metric, lesson, checklist, creative test, or your final UA plan.</p>`;
  }
  return state.chat.messages
    .map((message) => `<div class="message ${message.role}">${escapeHtml(message.content)}</div>`)
    .join("");
}

function saveChatSettings() {
  state.chat.providerUrl = document.querySelector("#providerUrl").value.trim();
  state.chat.model = document.querySelector("#chatModel").value.trim() || "gpt-4o-mini";
  state.chat.apiKey = document.querySelector("#chatApiKey").value.trim();
  state.chat.memory = document.querySelector("#chatMemory").value.trim();
  saveState();
}

async function sendChatMessage(event) {
  event.preventDefault();
  saveChatSettings();
  const prompt = document.querySelector("#chatPrompt").value.trim();
  if (!prompt) return;
  if (!state.chat.providerUrl) {
    state.chat.messages.push({
      role: "assistant",
      content: "Please set a Provider URL first. For public deploy, use a serverless proxy such as /api/chat."
    });
    saveState();
    renderChat();
    return;
  }

  state.chat.messages.push({ role: "user", content: prompt });
  state.chat.messages.push({ role: "assistant", content: "Thinking with lesson context..." });
  saveState();
  renderChat();

  try {
    const context = await buildChatContext(prompt);
    const messages = [
      {
        role: "system",
        content:
          "You are a bilingual Vietnamese-first mobile game UA tutor for Unity developers. Answer with practical, beginner-friendly guidance. Use English industry terms but explain them in Vietnamese. Do not invent numbers beyond the provided context; say when a value is an assumption."
      },
      { role: "system", content: `Learner memory:\n${state.chat.memory || "No memory notes yet."}` },
      { role: "system", content: `Course context:\n${context}` },
      ...state.chat.messages
        .filter((message) => message.content !== "Thinking with lesson context...")
        .slice(-10)
    ];
    const answer = await callAiProvider(messages, 0.4);

    state.chat.messages[state.chat.messages.length - 1] = { role: "assistant", content: answer };
  } catch (error) {
    state.chat.messages[state.chat.messages.length - 1] = {
      role: "assistant",
      content: `Could not call provider: ${error.message}. Check Provider URL, CORS, API key, or use a serverless proxy.`
    };
  }
  saveState();
  renderChat();
}

async function reviewLessonQuality(lesson, markdown) {
  if (!state.chat.providerUrl) {
    state.lessonReviews[lesson.day] = "Chưa cấu hình Provider URL. Vào AI Chat để set Provider URL hoặc dùng backend /api/chat trước khi review lesson.";
    saveState();
    renderLesson(lesson.day);
    return;
  }

  state.lessonReviews[lesson.day] = "AI đang đánh giá chất lượng lesson...";
  saveState();
  renderLesson(lesson.day);

  const rubric = `
Bạn là curriculum reviewer cho khóa UA Marketing dành cho Unity indie/dev không chuyên UA.
Hãy đánh giá lesson theo thang 1-5 và trả lời bằng tiếng Việt có dấu, ngắn nhưng cụ thể.
Không khen chung chung. Chỉ ra điểm thiếu có thể sửa được.

Rubric:
1. Decision clarity: bài có dạy một quyết định cụ thể không?
2. Teaching depth: giải thích đủ sâu cho người không biết UA chưa?
3. Metric literacy: có bảng số, biểu đồ, cách đọc số, thứ tự đọc funnel không?
4. Mistake coverage: có lỗi thường gặp và correction không?
5. Worked example: có ví dụ mẫu đủ cụ thể để bắt chước không?
6. Lab output: người học có biết output cuối bài trông như thế nào không?
7. Actionability: đọc xong có biết làm gì tiếp theo không?

Output format bắt buộc:
## Scorecard
- Decision clarity: x/5 - lý do
- Teaching depth: x/5 - lý do
- Metric literacy: x/5 - lý do
- Mistake coverage: x/5 - lý do
- Worked example: x/5 - lý do
- Lab output: x/5 - lý do
- Actionability: x/5 - lý do

## Top 5 fixes
1. ...

## Missing visuals/tables
- ...

## Rewrite priority
Nêu 1-3 section cần sửa trước.
`;

  const messages = [
    { role: "system", content: rubric },
    {
      role: "user",
      content: `Lesson metadata:\n\${JSON.stringify(lesson, null, 2)}\n\nLesson markdown:\n\${stripFrontmatter(markdown).slice(0, 12000)}`
    }
  ];

  try {
    const answer = await callAiProvider(messages, 0.2);
    state.lessonReviews[lesson.day] = answer;
  } catch (error) {
    state.lessonReviews[lesson.day] = `Không gọi được AI provider: \${error.message}. Kiểm tra Provider URL/API key hoặc dùng backend /api/chat.`;
  }

  saveState();
  renderLesson(lesson.day);
}

async function callAiProvider(messages, temperature = 0.4) {
  const response = await fetch(state.chat.providerUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      ...(state.chat.apiKey ? { Authorization: `Bearer ${state.chat.apiKey}` } : {})
    },
    body: JSON.stringify({
      model: state.chat.model || "gpt-4o-mini",
      messages,
      temperature
    })
  });
  if (!response.ok) throw new Error(`Provider returned ${response.status}`);
  const json = await response.json();
  return (
    json?.choices?.[0]?.message?.content ||
    json?.message?.content ||
    json?.output_text ||
    "Provider response did not include a recognized answer field."
  );
}
async function buildChatContext(prompt) {
  const query = prompt.toLowerCase();
  const lessonScores = data.course.lessons
    .map((lesson) => ({
      lesson,
      score: scoreText(query, [lesson.title, lesson.summary, lesson.module, lesson.learningOutcome, lesson.artifact, lesson.glossaryTerms.join(" ")].join(" "))
    }))
    .sort((a, b) => b.score - a.score)
    .slice(0, 3);

  const lessonTexts = await Promise.all(
    lessonScores.map(async ({ lesson }) => {
      const markdown = await fetchLesson(lesson.day);
      return `Day ${lesson.day}: ${lesson.title}\n${stripFrontmatter(markdown).slice(0, 1800)}`;
    })
  );
  const glossary = data.glossary
    .filter((term) => query.includes(term.term.toLowerCase()) || scoreText(query, `${term.vi} ${term.en}`) > 0)
    .slice(0, 8)
    .map((term) => `${term.term}: ${term.vi} Formula: ${term.formula || "n/a"}`)
    .join("\n");
  const plan = Object.entries(state.plan)
    .filter(([, value]) => value.trim())
    .map(([key, value]) => `${key}: ${value}`)
    .join("\n");

  return [
    `Relevant lessons:\n${lessonTexts.join("\n\n---\n\n")}`,
    `Relevant glossary:\n${glossary || "No exact glossary match."}`,
    `Learner UA plan draft:\n${plan || "No plan fields filled yet."}`
  ].join("\n\n");
}

function scoreText(query, text) {
  const tokens = query.split(/[^a-z0-9$%.]+/i).filter((token) => token.length > 2);
  const haystack = text.toLowerCase();
  return tokens.reduce((score, token) => score + (haystack.includes(token) ? 1 : 0), 0);
}

function scrollChatToBottom() {
  const log = document.querySelector("#chatLog");
  if (log) log.scrollTop = log.scrollHeight;
}
function renderCase(item) {
  return `
    <article class="case-card">
      <div class="tag-row">${renderTags(item.tags, "blue")}</div>
      <h3>${icon("clipboard-check")} ${escapeHtml(item.title)}</h3>
      <p>${escapeHtml(item.context)}</p>
      <p><span class="formula">${escapeHtml(item.metrics)}</span></p>
      <p><strong>Recommended call:</strong> ${escapeHtml(item.recommendation)}</p>
      <p>${escapeHtml(item.reason)}</p>
      ${item.decision ? `<p><strong>Decision:</strong> ${escapeHtml(item.decision)}</p>` : ""}
    </article>
  `;
}

async function submitAccountAuth(mode) {
  if (!supabaseClient) {
    notify("Login is not configured yet.", "error");
    renderAuthPage(mode);
    return;
  }

  const email = document.querySelector("#accountEmail")?.value.trim();
  const password = document.querySelector("#accountPassword")?.value;
  const confirmPassword = document.querySelector("#accountConfirmPassword")?.value;
  if (!email || !password) {
    notify("Enter email and password first.", "error");
    renderAuthPage(mode);
    return;
  }

  if (mode === "signup" && password !== confirmPassword) {
    notify("Password confirmation does not match.", "error");
    renderAuthPage(mode);
    return;
  }

  let result = mode === "signup"
    ? await supabaseClient.auth.signUp({ email, password })
    : await supabaseClient.auth.signInWithPassword({ email, password });

  if (mode === "signup" && !result.error && !result.data.session) {
    result = await supabaseClient.auth.signInWithPassword({ email, password });
  }

  if (result.error) {
    notify(result.error.message, "error");
    renderAuthPage(mode);
    return;
  }

  currentUser = result.data.session?.user || null;
  if (!currentUser) {
    notify("Check your email to confirm the account, then sign in.", "warn");
    updateAuthActions();
    renderAuthPage("signin");
    return;
  }

  notify(`Signed in as ${currentUser.email}`, "success");
  await pullCloudProgress();
  location.hash = "#dashboard";
  updateAuthActions();
}

async function signInWithGoogle() {
  if (!supabaseClient) {
    notify("Login is not configured yet.", "error");
    return;
  }

  const { error } = await supabaseClient.auth.signInWithOAuth({
    provider: "google",
    options: {
      redirectTo: `${window.location.origin}${window.location.pathname}`
    }
  });

  if (error) notify(error.message, "error");
}
async function signOutAccount() {
  if (!supabaseClient) return;
  await supabaseClient.auth.signOut();
  currentUser = null;
  notify("Signed out. Local progress is still available.", "info");
  updateAuthActions();
  location.hash = "#dashboard";
  renderRoute();
}

function updateAuthActions() {
  const signedIn = Boolean(currentUser);
  document.querySelector("#topbarSignInBtn")?.classList.toggle("hidden", signedIn);
  document.querySelector("#topbarSignUpBtn")?.classList.toggle("hidden", signedIn);
  document.querySelector("#topbarLogoutBtn")?.classList.toggle("hidden", !signedIn);
}

function renderAuthPage(mode) {
  const isSignup = mode === "signup";
  title.textContent = isSignup ? "Sign up" : "Sign in";

  if (currentUser) {
    app.innerHTML = `
      <section class="panel settings-stack">
        <h2>${icon("circle-user-round")}Signed in</h2>
        <p><strong>${escapeHtml(currentUser.email || currentUser.id)}</strong></p>
        <button class="ghost-button danger" id="authPageLogoutBtn" type="button">Log out</button>
      </section>
    `;
    document.querySelector("#authPageLogoutBtn")?.addEventListener("click", signOutAccount);
    return;
  }

  app.innerHTML = `
    <section class="grid two">
      <form class="panel settings-stack" id="authForm">
        <h2>${icon("shield-check")}${isSignup ? "Create account" : "Sign in"}</h2>
        <p class="status-line">${escapeHtml(cloudStatus)}</p>
        <label class="field">
          <span>Email</span>
          <input id="accountEmail" type="email" autocomplete="email" placeholder="you@example.com" required />
        </label>
        <label class="field">
          <span>Password</span>
          <input id="accountPassword" type="password" autocomplete="${isSignup ? "new-password" : "current-password"}" placeholder="At least 6 characters" required />
        </label>
        ${isSignup ? `
          <label class="field">
            <span>Confirm password</span>
            <input id="accountConfirmPassword" type="password" autocomplete="new-password" placeholder="Repeat password" required />
          </label>
        ` : ""}
        <button type="submit">${icon("log-in")}${isSignup ? "Sign up" : "Sign in"}</button>
        <button class="ghost-button" id="googleAuthBtn" type="button">${icon("chrome")}Continue with Google</button>
        <a class="button ghost-button" href="#${isSignup ? "signin" : "signup"}">${icon("arrow-right-left")}${isSignup ? "Already have an account? Sign in" : "Need an account? Sign up"}</a>
      </form>
      <article class="panel">
        <h2>${icon("cloud-check")}Cloud progress</h2>
        <p>Signing in syncs lessons, quizzes, checklists, Final UA Plan, bookmarks, and chatbot memory with Supabase.</p>
      </article>
    </section>
  `;

  document.querySelector("#authForm")?.addEventListener("submit", (event) => {
    event.preventDefault();
    submitAccountAuth(mode);
  });
  document.querySelector("#googleAuthBtn")?.addEventListener("click", signInWithGoogle);
}
function renderAccount() {
  title.textContent = "Account";
  const configured = Boolean(data.config?.supabaseUrl && data.config?.supabaseAnonKey);
  const completed = state.completedLessons.length;
  const planFields = Object.values(state.plan).filter((value) => value.trim()).length;

  if (!configured) {
    app.innerHTML = `
      <section class="grid two">
        <article class="panel">
          <h2>${icon("cloud-off")}Login is not configured yet</h2>
          <p>This app is still using localStorage only. To enable login and cloud progress sync, create a Supabase project, run <code>supabase-schema.sql</code>, then fill <code>content/app-config.json</code>.</p>
          <p class="status-line">Current local progress: ${completed}/30 lessons, ${planFields}/9 UA plan sections.</p>
        </article>
        <article class="panel">
          <h2>${icon("database")}Why Supabase?</h2>
          <p>Supabase gives you Auth plus Postgres. The browser uses the public anon key, while row-level security ensures each user can read and write only their own progress row.</p>
        </article>
      </section>
    `;
    return;
  }

  const signedIn = Boolean(currentUser);
  app.innerHTML = `
    <section class="grid two">
      <article class="panel settings-stack">
        <h2>${icon("circle-user-round")}${signedIn ? "Signed in" : "Account"}</h2>
        <p class="status-line">${escapeHtml(cloudStatus)}</p>
        ${signedIn ? `
          <p><strong>${escapeHtml(currentUser.email || currentUser.id)}</strong></p>
          <button id="pushProgressBtn" type="button">${icon("cloud-upload")}Save local progress to cloud</button>
          <button class="ghost-button" id="pullProgressBtn" type="button">${icon("cloud-download")}Load cloud progress</button>
          <button class="ghost-button danger" id="signOutBtn" type="button">${icon("log-out")}Sign out</button>
        ` : `
          <p>Use the Sign in or Sign up buttons in the top bar to enable cloud progress sync.</p>
        `}
      </article>
      <article class="panel">
        <h2>${icon("refresh-cw")}Progress sync</h2>
        <p>Local progress is always saved immediately in this browser. When signed in, the app also syncs lesson completion, bookmarks, quizzes, checklists, Final UA Plan, and chatbot memory to Supabase.</p>
        <div class="metric-row">
          <div class="metric"><strong>${completed}/30</strong><span>lessons</span></div>
          <div class="metric"><strong>${Object.keys(state.quizResults).length}</strong><span>quizzes</span></div>
          <div class="metric"><strong>${planFields}/9</strong><span>plan fields</span></div>
          <div class="metric"><strong>${Object.values(state.checklist).filter(Boolean).length}</strong><span>checks</span></div>
        </div>
      </article>
    </section>
  `;

  document.querySelector("#signOutBtn")?.addEventListener("click", signOutAccount);
  document.querySelector("#pushProgressBtn")?.addEventListener("click", async () => {
    await pushCloudProgress();
    renderAccount();
  });
  document.querySelector("#pullProgressBtn")?.addEventListener("click", async () => {
    await pullCloudProgress();
    renderAccount();
  });
}
function renderPlan() {
  title.textContent = "Final UA Plan";
  app.innerHTML = `
    <section class="plan-shell">
      <form class="panel plan-form" id="planForm">
        <h2>${icon("clipboard-list")}Build your UA / soft-launch plan</h2>
        ${planField("hypothesis", "Game hypothesis", "Genre, core loop, why players should care.")}
        ${planField("audience", "Target audience", "Player segment, motivation, region, competitor references.")}
        ${planField("metricTargets", "Metric targets", "CPI, retention, ARPDAU, LTV, ROAS, payback window.")}
        ${planField("tracking", "Tracking checklist", "Key events: install, tutorial, level, session, purchase, ad impression.")}
        ${planField("creativeMatrix", "Creative matrix", "Hooks, ad formats, variants, learning goal per creative.")}
        ${planField("budget", "Budget", "Daily spend, test budget, channel split, stop-loss rule.")}
        ${planField("successCriteria", "Success criteria", "What must be true to iterate or scale.")}
        ${planField("killCriteria", "Kill criteria", "What tells you to stop, change audience, or change game.")}
        ${planField("nextAction", "Next action", "Smallest dated action after this plan: owner, deadline, evidence needed.")}
      </form>
      <section class="panel">
        <h2>${icon("scan-text")}Preview</h2>
        <pre class="plan-preview" id="planPreview"></pre>
      </section>
    </section>
  `;
  document.querySelectorAll("[data-plan-field]").forEach((field) => {
    field.addEventListener("input", (event) => {
      state.plan[event.target.dataset.planField] = event.target.value;
      saveState();
      updatePlanPreview();
    });
  });
  updatePlanPreview();
}

function planField(key, label, placeholder) {
  return `
    <label class="field">
      <span>${label}</span>
      <textarea data-plan-field="${key}" placeholder="${placeholder}">${escapeHtml(state.plan[key] || "")}</textarea>
    </label>
  `;
}

function updatePlanPreview() {
  const lines = [
    "# UA / Soft-launch Plan",
    "",
    `## Game hypothesis\n${state.plan.hypothesis || "[empty]"}`,
    `## Target audience\n${state.plan.audience || "[empty]"}`,
    `## Metric targets\n${state.plan.metricTargets || "[empty]"}`,
    `## Tracking checklist\n${state.plan.tracking || "[empty]"}`,
    `## Creative matrix\n${state.plan.creativeMatrix || "[empty]"}`,
    `## Budget\n${state.plan.budget || "[empty]"}`,
    `## Success criteria\n${state.plan.successCriteria || "[empty]"}`,
    `## Kill criteria\n${state.plan.killCriteria || "[empty]"}`,
    `## Next action\n${state.plan.nextAction || "[empty]"}`
  ];
  document.querySelector("#planPreview").textContent = lines.join("\n\n");
}

function resetState() {
  if (!confirm("Reset all local progress and UA plan answers?")) return;
  state = structuredClone(defaultState);
  localStorage.removeItem(stateKey);
  stageSelect.value = state.stage;
  renderRoute();
}

function exportState() {
  const blob = new Blob([JSON.stringify(state, null, 2)], { type: "application/json" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = "ua-bootcamp-progress.json";
  link.click();
  URL.revokeObjectURL(url);
}

function renderTags(tags, variant = "") {
  return tags.map((tag) => `<span class="tag ${variant}">${escapeHtml(tag)}</span>`).join("");
}

function stripFrontmatter(markdown) {
  return markdown.replace(/^---[\s\S]*?---\s*/, "");
}

function plainMarkdown(value) {
  return String(value || "")
    .replace(/\*\*(.*?)\*\*/g, "$1")
    .replace(/`([^`]+)`/g, "$1")
    .replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
    .trim();
}

function createHeadingId(title, used = new Map()) {
  const base = plainMarkdown(title)
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "") || "section";
  const count = used.get(base) || 0;
  used.set(base, count + 1);
  return count ? `${base}-${count + 1}` : base;
}

function extractLessonToc(markdown) {
  const used = new Map();
  return markdown
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter((line) => line.startsWith("## "))
    .map((line) => {
      const title = line.slice(3);
      return { title: plainMarkdown(title), id: createHeadingId(title, used) };
    });
}

function lessonSectionMeta(title, index) {
  const normalized = plainMarkdown(title).toLowerCase();
  if (/goal|mục tiêu|outcome/.test(normalized)) return { iconName: "flag", kicker: "Learning target" };
  if (/why|matters|vì sao/.test(normalized)) return { iconName: "sparkles", kicker: "Strategic context" };
  if (/model|framework|core/.test(normalized)) return { iconName: "boxes", kicker: "Mental model" };
  if (/example|worked|usecase|case/.test(normalized)) return { iconName: "clipboard-check", kicker: "Applied example" };
  if (/checklist|lab|practice|exercise/.test(normalized)) return { iconName: "list-checks", kicker: "Practice path" };
  if (/data|metric|visual|number|số/.test(normalized)) return { iconName: "chart-no-axes-combined", kicker: "Metric lens" };
  if (/source|reference|nguồn/.test(normalized)) return { iconName: "library", kicker: "Evidence" };
  return { iconName: "book-open", kicker: `Section ${String(index).padStart(2, "0")}` };
}

function renderMarkdown(markdown) {
  const lines = markdown.split(/\r?\n/);
  const html = [];
  let inList = false;
  let listTag = "ul";
  let inSection = false;
  let sectionIndex = 0;
  let tableRows = [];
  let chartRows = [];
  let inChart = false;
  let inCodeFence = false;
  let codeFenceLanguage = "";
  let codeRows = [];
  const seenTerms = new Set();
  const usedHeadings = new Map();

  const closeList = () => {
    if (inList) {
      html.push(`</${listTag}>`);
      inList = false;
      listTag = "ul";
    }
  };

  const closeSection = () => {
    if (inSection) {
      html.push("</section>");
      inSection = false;
    }
  };

  const closeTable = () => {
    if (tableRows.length) {
      html.push(renderMarkdownTable(tableRows, seenTerms));
      tableRows = [];
    }
  };

  const closeChart = () => {
    if (chartRows.length) {
      html.push(renderMarkdownChart(chartRows));
      chartRows = [];
    }
    inChart = false;
  };

  const closeCodeFence = () => {
    const code = codeRows.join("\n");
    html.push(renderCodeBlock(code, codeFenceLanguage));
    codeRows = [];
    codeFenceLanguage = "";
    inCodeFence = false;
  };

  for (const rawLine of lines) {
    const line = rawLine.trim();

    if (inCodeFence) {
      if (line.startsWith("```")) {
        closeCodeFence();
      } else {
        codeRows.push(rawLine);
      }
      continue;
    }

    if (inChart) {
      if (line === ":::") {
        closeChart();
      } else if (line) {
        chartRows.push(line);
      }
      continue;
    }

    if (line.startsWith("```")) {
      closeList();
      closeTable();
      codeFenceLanguage = line.slice(3).trim();
      inCodeFence = true;
      continue;
    }

    if (line === ":::chart") {
      closeList();
      closeTable();
      inChart = true;
      continue;
    }

    if (line.startsWith("|") && line.endsWith("|")) {
      closeList();
      tableRows.push(line);
      continue;
    }

    if (!line) {
      closeList();
      closeTable();
      continue;
    }

    closeTable();

    if (/^(-{3,}|\*{3,}|_{3,})$/.test(line)) {
      closeList();
      html.push('<hr class="markdown-rule">');
      continue;
    }

    const imageMatch = line.match(/^!\[([^\]]*)\]\(([^)\s]+)(?:\s+"([^"]+)")?\)$/);
    if (imageMatch) {
      closeList();
      html.push(renderMarkdownImage(imageMatch[1], imageMatch[2], imageMatch[3], seenTerms));
      continue;
    }
    if (line.startsWith("## ")) {
      closeList();
      closeSection();
      sectionIndex += 1;
      const heading = line.slice(3);
      const sectionId = createHeadingId(heading, usedHeadings);
      const meta = lessonSectionMeta(heading, sectionIndex);
      html.push(`
        <section class="lesson-section" id="${sectionId}">
          <div class="lesson-section-heading">
            <span class="lesson-section-icon">${icon(meta.iconName)}</span>
            <div>
              <p class="section-kicker">${escapeHtml(meta.kicker)}</p>
              <h2>${inlineMarkdown(heading, seenTerms)}</h2>
            </div>
            <span class="section-number">${String(sectionIndex).padStart(2, "0")}</span>
          </div>
      `);
      inSection = true;
      continue;
    }
    if (line.startsWith("### ")) {
      closeList();
      html.push(`<h3>${inlineMarkdown(line.slice(4), seenTerms)}</h3>`);
      continue;
    }
    if (line.startsWith("> ")) {
      closeList();
      html.push(`<blockquote>${inlineMarkdown(line.slice(2), seenTerms)}</blockquote>`);
      continue;
    }
    const unorderedMatch = line.match(/^[-*]\s+(.*)$/);
    if (unorderedMatch) {
      if (!inList || listTag !== "ul") {
        closeList();
        html.push("<ul>");
        inList = true;
        listTag = "ul";
      }
      html.push(`<li>${inlineMarkdown(unorderedMatch[1], seenTerms)}</li>`);
      continue;
    }
    const orderedMatch = line.match(/^\d+\.\s+(.*)$/);
    if (orderedMatch) {
      if (!inList || listTag !== "ol") {
        closeList();
        html.push("<ol>");
        inList = true;
        listTag = "ol";
      }
      html.push(`<li>${inlineMarkdown(orderedMatch[1], seenTerms)}</li>`);
      continue;
    }
    closeList();
    html.push(`<p>${inlineMarkdown(line, seenTerms)}</p>`);
  }
  closeList();
  closeTable();
  closeChart();
  if (inCodeFence) closeCodeFence();
  closeSection();
  return html.join("");
}

function renderCodeBlock(code, language = "") {
  if (isVisualPlaceholderBlock(code)) return renderVisualPlaceholder(code);
  const lang = language ? `<figcaption>${escapeHtml(language)}</figcaption>` : "";
  return `
    <figure class="markdown-pre">
      ${lang}
      <pre><code>${escapeHtml(code)}</code></pre>
    </figure>
  `;
}

function renderVisualPlaceholder(code) {
  const lines = code.split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
  const title = (lines.find((line) => /\[(VISUAL|IMAGE|THIRD-PARTY VISUAL) PLACEHOLDER/i.test(line)) || "[VISUAL PLACEHOLDER]")
    .replace(/^\[/, "")
    .replace(/\]$/, "");
  const details = lines.filter((line) => !/\[(VISUAL|IMAGE|THIRD-PARTY VISUAL) PLACEHOLDER/i.test(line));
  return `
    <figure class="visual-placeholder">
      <figcaption class="visual-placeholder-header">
        ${icon("image-plus")}
        <span>${escapeHtml(title)}</span>
      </figcaption>
      <div class="visual-placeholder-body">
        ${details.map((line) => {
          const [label, ...rest] = line.split(":");
          return rest.length
            ? `<p><strong>${escapeHtml(label)}:</strong>${escapeHtml(rest.join(":"))}</p>`
            : `<p>${escapeHtml(line)}</p>`;
        }).join("")}
      </div>
    </figure>
  `;
}

function isVisualPlaceholderBlock(code) {
  return /\[(VISUAL|IMAGE|THIRD-PARTY VISUAL) PLACEHOLDER/i.test(code);
}

function normalizeMarkdownAssetPath(src) {
  if (/^(https?:)?\/\//.test(src) || src.startsWith("data:")) return escapeHtml(src);
  const normalized = src.replace(/^\.\//, "");
  return escapeHtml(normalized.startsWith("content/") ? normalized : `${contentRoot}/${normalized}`);
}

function renderMarkdownImage(alt, src, title = "", seenTerms = null) {
  const cleanSrc = String(src || "").trim();
  const safeSrc = normalizeMarkdownAssetPath(cleanSrc);
  const caption = title || alt;
  return `
    <figure class="markdown-figure">
      <img src="${safeSrc}" alt="${escapeHtml(alt || "Lesson visual")}" width="1200" height="620" decoding="async" loading="lazy">
      ${caption ? `<figcaption>${inlineMarkdown(caption, seenTerms)}</figcaption>` : ""}
    </figure>
  `;
}

function renderMarkdownTable(rows, seenTerms = null) {
  const parsed = rows
    .map((row) => row.split("|").slice(1, -1).map((cell) => cell.trim()))
    .filter((cells) => cells.some(Boolean));
  if (parsed.length < 2) return parsed.map((cells) => `<p>${inlineMarkdown(cells.join(" | "), seenTerms)}</p>`).join("");
  const separatorIndex = parsed.findIndex((cells) => cells.every((cell) => /^:?-{3,}:?$/.test(cell)));
  const header = parsed[0];
  const body = parsed.filter((_, index) => index !== 0 && index !== separatorIndex);
  return `
    <div class="markdown-table-wrap">
      <table class="markdown-table">
        <thead><tr>${header.map((cell) => `<th>${inlineMarkdown(cell, seenTerms)}</th>`).join("")}</tr></thead>
        <tbody>${body.map((row) => `<tr>${row.map((cell) => `<td>${inlineMarkdown(cell, seenTerms)}</td>`).join("")}</tr>`).join("")}</tbody>
      </table>
    </div>
  `;
}

function renderMarkdownChart(rows) {
  let title = "Metric visualization";
  const points = [];
  for (const row of rows) {
    if (row.toLowerCase().startsWith("title:")) {
      title = row.slice(6).trim();
      continue;
    }
    const [label, rawValue, note = ""] = row.split("|").map((part) => part.trim());
    const value = Number(rawValue);
    if (label && Number.isFinite(value)) points.push({ label, value, note });
  }
  if (!points.length) return "";
  const max = Math.max(...points.map((point) => point.value), 1);
  return `
    <figure class="metric-chart">
      <figcaption>${escapeHtml(title)}</figcaption>
      ${points.map((point) => `
        <div class="metric-chart-row">
          <span class="metric-chart-label">${escapeHtml(point.label)}</span>
          <div class="metric-chart-track"><span style="width: ${Math.max((point.value / max) * 100, 2).toFixed(1)}%"></span></div>
          <strong>${escapeHtml(point.value)}</strong>
          ${point.note ? `<em>${escapeHtml(point.note)}</em>` : ""}
        </div>
      `).join("")}
    </figure>
  `;
}

function setupLessonProgress() {
  const bar = document.querySelector("#readingProgress span");
  const reader = document.querySelector("#lessonReader");
  if (!bar || !reader) return;
  const sections = [...reader.querySelectorAll(".lesson-section[id]")];
  const tocLinks = [...document.querySelectorAll(".lesson-toc a[data-toc-target]")];

  const update = () => {
    const rect = reader.getBoundingClientRect();
    const total = Math.max(reader.offsetHeight - window.innerHeight * 0.65, 1);
    const read = Math.min(Math.max(-rect.top + 24, 0), total);
    bar.style.width = `${(read / total) * 100}%`;
    const activeSection =
      sections
        .map((section) => ({ id: section.id, top: section.getBoundingClientRect().top }))
        .filter((section) => section.top <= 120)
        .pop() || sections[0];
    tocLinks.forEach((link) => {
      link.classList.toggle("active", link.dataset.tocTarget === activeSection?.id);
    });
  };

  window.addEventListener("scroll", update, { passive: true });
  window.addEventListener("resize", update);
  readingProgressCleanup = () => {
    window.removeEventListener("scroll", update);
    window.removeEventListener("resize", update);
    bar.style.width = "0%";
  };
  update();
}

function teardownReadingProgress() {
  if (readingProgressCleanup) {
    readingProgressCleanup();
    readingProgressCleanup = null;
  }
}

function inlineMarkdown(value, seenTerms = null) {
  const codeSpans = [];
  const withCodeTokens = String(value).replace(/`([^`]+)`/g, (_match, code) => {
    const token = `@@CODE${codeSpans.length}@@`;
    codeSpans.push(`<code>${escapeHtml(code)}</code>`);
    return token;
  });
  let html = escapeHtml(withCodeTokens)
    .replace(/\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g, '<a href="$2" target="_blank" rel="noreferrer">$1</a>')
    .replace(/\*\*(.*?)\*\*/g, "<strong>$1</strong>");
  codeSpans.forEach((code, index) => {
    html = html.replace(`@@CODE${index}@@`, code);
  });
  return parseGlossaryTerms(html, seenTerms);
}

function parseGlossaryTerms(text, seenTerms = null) {
  if (!data || !data.glossary) return text;
  
  let result = text;
  const sortedTerms = [...data.glossary].sort((a, b) => b.term.length - a.term.length);
  
  for (const termObj of sortedTerms) {
    const term = termObj.term;
    if (seenTerms && seenTerms.has(term)) {
      continue;
    }
    const escapedTerm = term.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    const tokens = result.split(/(<[^>]+>)/g);
    let matched = false;
    for (let i = 0; i < tokens.length; i++) {
      if (!tokens[i].startsWith("<")) {
        const regex = new RegExp(`\\b(${escapedTerm})\\b`, 'i');
        if (regex.test(tokens[i])) {
          matched = true;
          const tooltipHtml = `
            <a class="glossary-link" href="#glossary?term=$1">
              $1
              <span class="glossary-tooltip">
                <strong style="color:var(--accent);display:block;margin-bottom:4px;font-size:0.95rem;">${escapeHtml(termObj.en)}</strong>
                <span style="color:#e2e8f0;display:block;font-size:0.85rem;line-height:1.3;">${escapeHtml(termObj.vi)}</span>
                ${termObj.formula && termObj.formula !== "n/a" ? `<span class="glossary-tooltip-formula" style="margin-top:6px;font-family:monospace;color:#fb7185;background-color:#0f172a;padding:2px 6px;border-radius:4px;display:inline-block;font-size:0.75rem;">${escapeHtml(termObj.formula)}</span>` : ""}
              </span>
            </a>
          `.trim().replace(/\s+/g, " ");
          tokens[i] = tokens[i].replace(regex, tooltipHtml);
          break;
        }
      }
    }
    if (matched) {
      result = tokens.join("");
      if (seenTerms) {
        seenTerms.add(term);
      }
    }
  }
  return result;
}

function escapeHtml(value) {
  return String(value)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}
