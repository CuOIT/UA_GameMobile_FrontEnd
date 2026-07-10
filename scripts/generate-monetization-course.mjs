import { mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const courseId = "monetization-30d";
const root = join("content", "courses", courseId);
const lessonRoot = join(root, "lessons");
const assetRoot = join(root, "assets", "usecases");

mkdirSync(lessonRoot, { recursive: true });
mkdirSync(assetRoot, { recursive: true });

const references = [
  {
    id: "admob-unity-start",
    title: "Google AdMob Unity quick start",
    url: "https://developers.google.com/admob/unity/quick-start",
    note: "Unity integration entry point for mobile ad monetization."
  },
  {
    id: "admob-unity-privacy",
    title: "Google AdMob Unity privacy strategies",
    url: "https://developers.google.com/admob/unity/privacy/strategies",
    note: "Consent and privacy implementation considerations for Unity games using ads."
  },
  {
    id: "unity-iap",
    title: "Unity In-App Purchasing package",
    url: "https://docs.unity3d.com/Packages/com.unity.purchasing@latest",
    note: "Unity package documentation for product configuration and purchase flows."
  },
  {
    id: "google-play-billing",
    title: "Google Play Billing overview",
    url: "https://developer.android.com/google/play/billing",
    note: "Android billing concepts that shape IAP implementation and compliance."
  },
  {
    id: "apple-subscriptions",
    title: "Apple auto-renewable subscriptions",
    url: "https://developer.apple.com/app-store/subscriptions/",
    note: "Subscription design, offers, retention and platform rules for iOS."
  },
  {
    id: "play-data-safety",
    title: "Google Play Data safety",
    url: "https://support.google.com/googleplay/android-developer/answer/10787469",
    note: "Store disclosure expectations for SDKs and collected data."
  }
];

const lessons = [
  [1, "Monetization as a player-value loop", "Week 1 - Monetization fundamentals", "Monetization thesis", "Frame ads and IAP as a value exchange tied to puzzle motivation, session rhythm and trust.", "hypothesis", ["Value exchange", "ARPDAU", "IAP"], "Decide what the game is allowed to monetize before adding SDKs or offers."],
  [2, "Puzzle economy roles: ads, IAP and progression", "Week 1 - Monetization fundamentals", "Economy role map", "Separate helper, convenience, cosmetic and content roles so monetization does not damage puzzle clarity.", "audience", ["Economy", "Rewarded ad", "Progression"], "Choose the monetization role that matches the puzzle loop and target player."],
  [3, "Audience willingness-to-pay map", "Week 1 - Monetization fundamentals", "WTP motivation map", "Map player motivations to likely ad tolerance and purchase triggers without guessing demographics.", "audience", ["WTP", "Motivation", "Segment"], "Identify which players should see ads, offers or neither in the first test."],
  [4, "Session design for ad-friendly puzzle games", "Week 1 - Monetization fundamentals", "Session rhythm map", "Place ad opportunities around natural puzzle breaks instead of interrupting solve flow.", "metricTargets", ["Session length", "Interstitial", "Rewarded ad"], "Choose where ads can appear without breaking player trust."],
  [5, "First monetization hypothesis", "Week 1 - Monetization fundamentals", "Monetization hypothesis card", "Compress value, placement, metric and next action into one testable monetization hypothesis.", "hypothesis", ["Hypothesis", "ARPDAU", "Retention"], "Write the first monetization hypothesis that can drive implementation."],
  [6, "Ads format choice for Unity puzzle", "Week 1 - Monetization fundamentals", "Ad format decision matrix", "Compare rewarded, interstitial, banner and app-open ads for early puzzle prototypes.", "creativeMatrix", ["Rewarded ad", "Interstitial", "Banner"], "Choose a first ad format based on player control, session rhythm and measurement quality."],
  [7, "Week 1 synthesis: monetization guardrails", "Week 1 - Monetization fundamentals", "Monetization guardrail sheet", "Turn the first week into non-negotiable rules for trust, pacing and test scope.", "killCriteria", ["Guardrail", "Retention", "Trust"], "Define what monetization must not do to the game experience."],
  [8, "Ad SDK integration plan without gameplay coupling", "Week 2 - Unity implementation and tracking", "Ad integration boundary plan", "Plan Unity ad integration with events, services and ScriptableObject config instead of gameplay/UI coupling.", "tracking", ["SDK", "Event", "ScriptableObject"], "Decide the technical boundary for ad loading, showing and analytics."],
  [9, "Rewarded ad placement and reward economy", "Week 2 - Unity implementation and tracking", "Rewarded placement spec", "Design rewarded ads where the reward helps recovery or convenience without becoming mandatory.", "creativeMatrix", ["Rewarded ad", "Reward", "Economy sink"], "Choose one rewarded placement and define its reward rules."],
  [10, "Interstitial pacing and fatigue control", "Week 2 - Unity implementation and tracking", "Interstitial pacing rule", "Set interstitial timing with cooldowns, session caps and fail-safe rules.", "killCriteria", ["Interstitial", "Cooldown", "Ad fatigue"], "Write a pacing rule that protects retention before revenue."],
  [11, "IAP product ladder for puzzle games", "Week 2 - Unity implementation and tracking", "IAP product ladder", "Build a small product ladder from starter pack to convenience pack without bloating SKU count.", "creativeMatrix", ["IAP", "SKU", "Starter pack"], "Select the minimum viable IAP catalog for a soft launch."],
  [12, "Store products and receipt readiness", "Week 2 - Unity implementation and tracking", "Store product readiness checklist", "Plan Android-first IAP setup and receipt validation assumptions before live testing.", "tracking", ["Receipt", "Billing", "Catalog"], "Decide which store-product readiness checks block a monetization test."],
  [13, "Monetization event taxonomy", "Week 2 - Unity implementation and tracking", "Monetization event taxonomy", "Define events for ad request, impression, reward, purchase attempt and purchase result.", "tracking", ["Event taxonomy", "Impression", "Purchase"], "Create the minimum event set needed to read monetization safely."],
  [14, "QA monetization in Unity release builds", "Week 2 - Unity implementation and tracking", "Release build QA script", "Validate ads, purchases, consent and events in a real Android release build before spend.", "tracking", ["QA", "Release build", "Consent"], "Decide whether the build is monetization-test ready."],
  [15, "Week 2 synthesis: monetization test build", "Week 2 - Unity implementation and tracking", "Test build acceptance card", "Summarize integration, placements, events and QA into a single acceptance card.", "successCriteria", ["Acceptance criteria", "QA", "Build"], "Define the pass/fail rules for a monetization-ready build."],
  [16, "ARPDAU, impressions and fill rate", "Week 3 - Metrics and diagnosis", "Ad revenue metric map", "Read ARPDAU through impressions, eCPM, fill, show rate and session depth.", "metricTargets", ["ARPDAU", "eCPM", "Fill rate"], "Diagnose whether weak ad revenue is demand, placement or engagement."],
  [17, "Purchase funnel from offer view to paid user", "Week 3 - Metrics and diagnosis", "IAP funnel map", "Break IAP performance into offer exposure, intent, checkout and successful purchase.", "metricTargets", ["Purchase funnel", "Conversion", "ARPPU"], "Identify which purchase-funnel link needs fixing first."],
  [18, "Retention vs monetization tradeoff", "Week 3 - Metrics and diagnosis", "Retention tradeoff board", "Separate good revenue from revenue that quietly damages D1/D7 retention.", "killCriteria", ["Retention", "D1", "D7"], "Set guardrails for monetization changes that should be rolled back."],
  [19, "Cohort reading for ads plus light IAP", "Week 3 - Metrics and diagnosis", "Cohort readout template", "Read revenue and retention by install cohort instead of blending noisy users.", "metricTargets", ["Cohort", "LTV", "Payback"], "Choose which cohort signal is strong enough for a next action."],
  [20, "Ad mediation and waterfall basics", "Week 3 - Metrics and diagnosis", "Mediation readiness note", "Understand when mediation is helpful and when it is premature for a small puzzle test.", "nextAction", ["Mediation", "Waterfall", "Bidding"], "Decide whether to keep one network or prepare mediation later."],
  [21, "Monetization dashboard readout", "Week 3 - Metrics and diagnosis", "Daily monetization readout", "Create a daily readout that combines retention, ads, purchases and technical health.", "metricTargets", ["Dashboard", "Readout", "Anomaly"], "Write the first dashboard readout without overclaiming from small data."],
  [22, "Week 3 synthesis: metric decision rules", "Week 3 - Metrics and diagnosis", "Metric decision rules", "Convert metric patterns into iterate, hold, rollback or expand decisions.", "successCriteria", ["Decision rule", "Rollback", "Scale"], "Define how monetization metrics will trigger action."],
  [23, "Offer design: starter packs and boosters", "Week 4 - Offers, LiveOps and operations", "Offer design spec", "Design a starter offer that solves a clear player problem without paywalling fun.", "creativeMatrix", ["Offer", "Starter pack", "Booster"], "Choose one offer concept and its player-value proof."],
  [24, "Ad removal and no-ads offers", "Week 4 - Offers, LiveOps and operations", "No-ads offer policy", "Decide whether no-ads fits the game and how it changes future ad economics.", "budget", ["No ads", "IAP", "Ad LTV"], "Choose whether to test no-ads now, later or never."],
  [25, "Pricing and regional assumptions", "Week 4 - Offers, LiveOps and operations", "Pricing assumption sheet", "Set simple price tiers and regional assumptions without pretending early data is precise.", "budget", ["Price tier", "Regional pricing", "LTV"], "Pick first price points and caveats for Android-first testing."],
  [26, "LiveOps cadence for monetization tests", "Week 4 - Offers, LiveOps and operations", "Monetization cadence calendar", "Plan weekly tests, cooldowns and readouts so economy changes do not thrash the game.", "nextAction", ["LiveOps", "Cadence", "Experiment"], "Choose the first four-week monetization operating rhythm."],
  [27, "Compliance, consent and data safety", "Week 4 - Offers, LiveOps and operations", "Compliance risk checklist", "Connect ad SDKs, IAP, consent and store disclosure to launch readiness.", "tracking", ["Consent", "Data safety", "Privacy"], "Decide which compliance tasks must block release."],
  [28, "Monetization post-mortem and learning log", "Week 4 - Offers, LiveOps and operations", "Monetization learning log", "Turn weak or strong results into reusable learning instead of dashboard archaeology.", "nextAction", ["Post-mortem", "Learning log", "Experiment"], "Write a monetization post-mortem that leads to the next test."],
  [29, "Build the one-page monetization plan", "Capstone", "One-page monetization plan", "Assemble value exchange, placements, events, offers, metrics and guardrails.", "successCriteria", ["Plan", "Guardrail", "Soft launch"], "Create a one-page monetization plan ready for team review."],
  [30, "Stress-test monetization risks and next action", "Capstone", "Monetization risk register", "Stress-test the plan and choose the smallest action that reduces the largest risk.", "nextAction", ["Risk register", "Rollback", "Readout"], "Choose launch, hold, reduce scope or rollback before touching live players."]
].map(([day, title, module, artifact, summary, planField, terms, outcome]) => ({
  day,
  title,
  module,
  summary,
  stages: day <= 7 ? ["idea", "prototype"] : day <= 15 ? ["prototype", "live"] : ["live", "prototype"],
  difficulty: day <= 7 ? "Beginner" : day <= 22 ? "Practical" : "Operator",
  artifact,
  planField,
  caseIds: [],
  toolIds: [],
  estimatedMinutes: 30,
  glossaryTerms: terms,
  quizId: `m${String(day).padStart(2, "0")}`,
  checklistId: `mc${String(day).padStart(2, "0")}`,
  markdown: `lessons/day-${String(day).padStart(2, "0")}.md`,
  learningOutcome: outcome,
  referenceIds: referenceIdsForDay(day)
}));

function referenceIdsForDay(day) {
  if (day <= 7) return ["admob-unity-start", "unity-iap"];
  if (day <= 15) return ["admob-unity-start", "unity-iap", "google-play-billing"];
  if (day <= 22) return ["admob-unity-start", "admob-unity-privacy"];
  if (day <= 28) return ["admob-unity-privacy", "play-data-safety", "google-play-billing"];
  return ["admob-unity-start", "unity-iap", "admob-unity-privacy", "play-data-safety"];
}

function svgFor(lesson) {
  const title = escapeXml(`Day ${lesson.day}: ${lesson.title}`);
  const boxes = [
    ["Player value", "Motivation, session moment, trust"],
    ["Monetization touch", "Ad, offer, price, cooldown"],
    ["Metric signal", "Retention, ARPDAU, funnel, QA"],
    ["Next action", "Keep, iterate, rollback, hold"]
  ];
  const boxSvg = boxes.map(([head, copy], index) => {
    const x = 54 + index * 250;
    const fill = ["#eef6ff", "#f4f0ff", "#effaf2", "#fff7e8"][index];
    return `<g><rect x="${x}" y="130" width="200" height="126" rx="12" fill="${fill}" stroke="#283044" stroke-width="2"/><text x="${x + 18}" y="165" font-size="20" font-family="Arial" fill="#1e2433" font-weight="700">${head}</text><text x="${x + 18}" y="198" font-size="15" font-family="Arial" fill="#3d4658">${copy}</text></g>`;
  }).join("");
  const arrows = [0, 1, 2].map((index) => {
    const x = 264 + index * 250;
    return `<path d="M${x} 192 H${x + 28}" stroke="#283044" stroke-width="3"/><path d="M${x + 28} 192 l-9 -8 v16z" fill="#283044"/>`;
  }).join("");
  return `<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="360" viewBox="0 0 1080 360">
  <rect width="1080" height="360" fill="#fbfcff"/>
  <text x="54" y="68" font-size="30" font-family="Arial" fill="#171b26" font-weight="700">${title}</text>
  <text x="54" y="100" font-size="18" font-family="Arial" fill="#566075">Mobile puzzle monetization decision chain</text>
  ${boxSvg}
  ${arrows}
  <text x="54" y="312" font-size="16" font-family="Arial" fill="#566075">Rule: revenue change is not a win until the player-value chain and metric readout still make sense.</text>
</svg>`;
}

function lessonMarkdown(lesson) {
  const padded = String(lesson.day).padStart(2, "0");
  const visual = `content/courses/${courseId}/assets/usecases/day-${padded}-monetization-chain.svg`;
  return `---
day: ${lesson.day}
title: "${lesson.title}"
module: "${lesson.module}"
stages: [${lesson.stages.join(", ")}]
related_terms: [${lesson.glossaryTerms.join(", ")}]
artifact: "${lesson.artifact}"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **${lesson.artifact}** cho game Mobile Puzzle làm bằng Unity. Quyết định chính: ${lesson.learningOutcome}

Artifact này cập nhật field **${lesson.planField}** trong Final Monetization Plan. Bạn không cần trở thành monetization specialist; bạn cần biết chỗ nào nên đặt ads/IAP, event nào phải đo, và khi nào phải rollback vì revenue đang làm hỏng retention hoặc trust.

## Why this matters

Với team Unity Mobile nhỏ, monetization thường bị xử lý quá muộn: build xong mới gắn SDK, thêm rewarded ad vào chỗ dễ code nhất, hoặc tạo IAP catalog theo cảm giác. Cách đó dễ tạo số revenue nhìn có vẻ tốt nhưng làm yếu session, giảm D1/D7, hoặc khiến report không đọc được.

Mobile puzzle nhạy với nhịp chơi. Người chơi cần cảm giác kiểm soát, tiến bộ và giải được bài. Monetization tốt phải đi theo value exchange: người chơi hiểu họ nhận gì, game hiểu metric nào chứng minh điều đó, và team biết next action nếu số xấu.

## Core model: value -> placement -> signal -> action

Đừng hỏi "nên bật monetization gì?". Hãy hỏi theo thứ tự:

1. Người chơi đang ở khoảnh khắc nào của puzzle loop?
2. Monetization touch có giúp hoặc ít nhất không phá khoảnh khắc đó không?
3. Event nào chứng minh player saw, accepted, ignored, paid hoặc churned?
4. Nếu revenue tăng nhưng retention giảm, team sẽ keep, iterate hay rollback?

## ${lesson.artifact} mẫu

| Field | Điền gì | Dùng để quyết định |
| --- | --- | --- |
| Player moment | Người chơi vừa thắng, thua, kẹt, quay lại hay mở offer | Monetization có đúng ngữ cảnh không |
| Value exchange | Người chơi nhận hint, booster, continue, no-ads, cosmetic hay convenience | Offer/ad có lý do tồn tại không |
| Technical trigger | Unity event hoặc state machine transition kích hoạt touchpoint | Có tránh gameplay/UI coupling không |
| Metric signal | Retention, ARPDAU, impression/user, purchase conversion, refund/error | Đọc được tác động thật không |
| Guardrail | Cooldown, cap, rollback rule, no-show state | Có bảo vệ trust không |
| Next action | Keep, change placement, change reward, reduce frequency, rollback | Team biết làm gì sau readout |

## Operating visual

![${lesson.title}](${visual})

**Inspect:** đọc từ trái sang phải: player value phải có trước monetization touch, metric signal phải có trước next action.

**Conclude:** nếu một placement hoặc offer không nối được đủ bốn ô, nó chưa sẵn sàng để test live.

**Do not infer:** diagram này không nói format nào luôn thắng. Rewarded ad, interstitial, IAP và no-ads đều phụ thuộc session rhythm, audience và tracking quality.

## Hướng dẫn đọc số

| Pattern | First suspicion | Next action |
| --- | --- | --- |
| ARPDAU tăng, D1/D7 giảm | Monetization đang lấy value từ retention | Rollback hoặc giảm frequency trước khi scale |
| Rewarded impressions thấp | Placement không đủ visible hoặc reward không đáng | Sửa trigger/reward, không vội thêm network |
| Offer views cao, purchase thấp | Value hoặc price chưa rõ | Sửa offer copy, bundle, price tier |
| Purchase attempts có lỗi | Store setup, receipt, network hoặc product id sai | Block launch cho tới khi QA pass |
| Revenue thấp nhưng retention ổn | Monetization chưa đủ exposure hoặc demand yếu | Tăng test có kiểm soát, không phá guardrail |

Các range phải là scenario-specific. Đừng dùng một benchmark chung để phán puzzle game của bạn tốt hay xấu.

## Worked example

Một game match puzzle đặt interstitial sau mỗi level fail. Ngày đầu ARPDAU tăng nhẹ, nhưng tutorial completion giảm và D1 yếu hơn cohort không có interstitial.

Diagnosis: placement xuất hiện ở khoảnh khắc người chơi đang thất bại, làm mất cảm giác kiểm soát. Đây không phải chỉ là vấn đề eCPM. Next action hợp lý là chuyển interstitial sang sau win streak hoặc sau cụm level, thêm cooldown, rồi đọc lại D1 và impressions/user.

Tradeoff: team có thể mất revenue ngắn hạn, nhưng giữ được test có thể đọc. Nếu cứ scale vì ARPDAU tăng, cohort sau sẽ cho tín hiệu retention méo.

## Unity implementation checklist

| Area | Check |
| --- | --- |
| Config | Placement id, reward amount, cooldown và cap nằm trong ScriptableObject hoặc remote config layer, không hard-code rải trong scene |
| Events | Gửi event cho request, loaded, shown, clicked, rewarded, failed, purchase_started, purchase_success, purchase_failed |
| Coupling | Gameplay phát signal; ad/IAP service quyết định show; UI chỉ hiển thị trạng thái |
| Pooling | Reward animation, popup và feedback dùng pool nếu xuất hiện nhiều lần trong session |
| No Update rule | Không poll ad readiness mỗi frame nếu SDK có callback/event |
| QA | Android release build phải chứng minh event và store/ad callback thật |

## Real usecases đã đối chiếu nguồn

| Source | Dùng để học gì | Cách áp dụng cho bài này |
| --- | --- | --- |
| Google AdMob Unity docs | Ad SDK lifecycle, privacy và implementation concepts | Dùng để kiểm tra placement/event/consent readiness |
| Unity IAP package docs | Product setup và purchase flow | Dùng để thiết kế IAP catalog nhỏ, testable |
| Google Play Billing docs | Billing behavior và Android store requirements | Dùng để tránh lỗi product id, purchase state và receipt assumption |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Chọn placement vì dễ code | Chọn placement theo player moment và metric cần đọc |
| Đọc ARPDAU một mình | Luôn đọc cùng retention, session depth và error/fail events |
| Tạo quá nhiều SKU hoặc ad placements | Test ít touchpoint nhưng event đầy đủ |
| Gắn monetization trực tiếp vào gameplay script | Dùng service/event boundary để gameplay không phụ thuộc SDK |
| Không có rollback rule | Viết rollback rule trước khi bật test |

## English Terms You Should Keep

- **ARPDAU**: average revenue per daily active user.
- **eCPM**: estimated ad revenue per thousand impressions.
- **Fill rate**: tỷ lệ ad request có ad trả về.
- **Rewarded ad**: ad người chơi chủ động xem để nhận reward.
- **Purchase funnel**: chuỗi offer view -> intent -> checkout -> success/fail.
- **Rollback**: quay lại cấu hình cũ khi guardrail bị vi phạm.

## Lab output example

\`\`\`text
${lesson.artifact}
- Player moment:
- Monetization touch:
- Value exchange:
- Unity trigger/event:
- Primary metric:
- Guardrail:
- Rollback rule:
- Next action:
\`\`\`

## Practical Lab

1. Chọn một touchpoint monetization duy nhất cho game puzzle của bạn.
2. Viết value exchange bằng một câu người chơi có thể hiểu.
3. Liệt kê events cần đo trước khi test.
4. Viết guardrail: metric nào xấu thì rollback.
5. Cập nhật Final Monetization Plan field **${lesson.planField}**.

## Final UA Plan Update

Thêm một đoạn ngắn vào **${lesson.planField}**:

\`\`\`text
Monetization decision:
We will test [touchpoint] at [player moment] because [value exchange].
Primary signal is [metric], protected by [guardrail].
If [bad pattern], next action is [rollback/iterate/hold].
\`\`\`

## Checklist Focus

- Artifact có player moment rõ, không chỉ tên ad/IAP.
- Có event hoặc QA evidence để đọc kết quả.
- Có guardrail bảo vệ retention/trust.
- Next action không mơ hồ.

## Curated References

${lesson.referenceIds.map((id) => {
  const ref = references.find((item) => item.id === id);
  return `- [${ref.title}](${ref.url}) - ${ref.note}`;
}).join("\n")}
`;
}

function escapeXml(value) {
  return value.replace(/[&<>"]/g, (char) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[char]));
}

function writeJson(path, value) {
  writeFileSync(path, `${JSON.stringify(value, null, 2)}\n`, "utf8");
}

const course = {
  meta: {
    id: courseId,
    title: "30-Day Mobile Puzzle Monetization Bootcamp for Unity Developers",
    audience: "Unity mobile developers building Android-first, iOS-aware puzzle games with ads plus light IAP.",
    capstone: "One-page monetization plan with placements, IAP ladder, tracking, guardrails and next action.",
    format: "25-35 minute workshop lessons with decision artifacts."
  },
  references,
  lessons
};

const quizzes = Object.fromEntries(lessons.map((lesson) => [lesson.quizId, {
  question: `Day ${lesson.day}: What is the main decision in "${lesson.title}"?`,
  options: [
    lesson.learningOutcome,
    "Add every available ad format before measuring retention",
    "Judge monetization only from total revenue",
    "Delay tracking until after the first paid traffic test"
  ],
  answer: 0,
  explanation: "The course treats monetization as a testable value exchange with metrics and rollback rules."
}]));

const checklists = Object.fromEntries(lessons.map((lesson) => [lesson.checklistId, [
  `Create the ${lesson.artifact}.`,
  "Name the player moment and value exchange.",
  "List the required Unity events or QA evidence.",
  `Update Final Monetization Plan field: ${lesson.planField}.`,
  "Write the next action and rollback rule."
]]));

writeJson(join(root, "course.json"), course);
writeJson(join(root, "quizzes.json"), quizzes);
writeJson(join(root, "checklists.json"), checklists);
writeJson(join(root, "glossary.json"), {});
writeJson(join(root, "cases.json"), []);
writeJson(join(root, "calculators.json"), []);
writeJson(join(root, "version.json"), {
  appVersion: "1.5.7",
  contentVersion: "monetization-1.0.0",
  updatedAt: "2026-07-10",
  changeLevel: "minor",
  notes: "Adds a 30-day Mobile Puzzle Monetization course for Unity developers."
});

for (const lesson of lessons) {
  const padded = String(lesson.day).padStart(2, "0");
  writeFileSync(join(assetRoot, `day-${padded}-monetization-chain.svg`), svgFor(lesson), "utf8");
  writeFileSync(join(lessonRoot, `day-${padded}.md`), lessonMarkdown(lesson), "utf8");
}
