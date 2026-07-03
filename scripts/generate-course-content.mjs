import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const contentRoot = join(root, "content");
const lessonRoot = join(contentRoot, "lessons");

const references = [
  {
    id: "android-attribution",
    title: "Android Attribution Reporting for mobile",
    url: "https://privacysandbox.google.com/private-advertising/attribution-reporting/android",
    note: "Privacy-preserving attribution design for Android apps and app-to-web measurement."
  },
  {
    id: "admob-unity-privacy",
    title: "Google AdMob Unity privacy strategies",
    url: "https://developers.google.com/admob/unity/privacy/strategies",
    note: "Unity-specific consent and privacy implementation considerations for ad monetization."
  },
  {
    id: "apple-adattributionkit",
    title: "Apple AdAttributionKit",
    url: "https://developer.apple.com/documentation/AdAttributionKit",
    note: "Apple attribution framework to understand alongside ATT and SKAN-era signal loss."
  },
  {
    id: "google-play-data-safety",
    title: "Google Play Data safety",
    url: "https://support.google.com/googleplay/android-developer/answer/10787469",
    note: "Disclosure thinking for SDKs, data collection, and store readiness."
  }
];

const moduleRefs = {
  "Week 1 - UA fundamentals": [],
  "Week 2 - Metrics and measurement": ["android-attribution", "apple-adattributionkit"],
  "Week 3 - Creative and store readiness": ["google-play-data-safety"],
  "Week 4 - Campaign operation": ["android-attribution", "admob-unity-privacy"],
  Capstone: ["android-attribution", "admob-unity-privacy", "apple-adattributionkit"]
};

const lessons = [
  {
    day: 1,
    title: "UA as a product learning loop",
    module: "Week 1 - UA fundamentals",
    summary: "Frame UA as a build-measure-learn loop between ad promise, store page, onboarding and metrics.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Beginner",
    terms: ["UA", "Funnel", "CPI"],
    artifact: "UA learning loop map",
    planField: "hypothesis",
    caseIds: ["puzzle-onboarding-leak"],
    toolIds: [],
    outcome: "Explain what your first UA test is trying to learn before any spend is committed.",
    core: "For a Unity indie/dev, UA is not a marketing department bolted onto the game. Treat it like a product feedback loop: an ad creates a promise, the store page confirms that promise, the first session proves or breaks it, and analytics tells you where the promise leaked.",
    example: "A puzzle prototype promises 'relaxing brain challenge in 10 seconds'. If players click the ad but quit during level 2, the UA problem may be onboarding clarity, not the ad network.",
    decisionRule: "Do not spend until the test has one learning question, one primary metric and one next action for both good and bad results.",
    lab: "Draw a four-step loop for your puzzle game: ad promise, store proof, first-session proof, metric signal. Write the weakest link.",
    planUpdate: "Write the first version of your game hypothesis in one sentence: player, motivation, promise and proof.",
    quiz: {
      question: "Day 1: What makes a first UA test useful for a Unity indie/dev?",
      options: [
        "It answers one product learning question with a predefined next action",
        "It buys as many cheap installs as possible before the game is instrumented",
        "It proves the ad network is good or bad from CPI alone",
        "It avoids writing a hypothesis so the result stays flexible"
      ],
      answer: 0,
      explanation: "A micro-budget test must produce a decision artifact, not just a dashboard screenshot."
    },
    checks: [
      "Write one learning question for your first UA test.",
      "Connect that question to one metric and one game/store/creative action.",
      "Add the first hypothesis sentence to Final UA Plan.",
      "Mark the biggest unknown: audience, creative, store, tracking or product."
    ]
  },
  {
    day: 2,
    title: "Puzzle market thesis and genre fit",
    module: "Week 1 - UA fundamentals",
    summary: "Turn genre, audience, region and monetization assumptions into a testable market thesis.",
    stages: ["idea", "prototype"],
    difficulty: "Beginner",
    terms: ["Genre-market fit", "CPI", "LTV"],
    artifact: "Puzzle market thesis",
    planField: "audience",
    caseIds: ["hybrid-cheap-traffic"],
    toolIds: ["breakEvenCpi"],
    outcome: "Define why this puzzle game has a reachable audience before choosing channels.",
    core: "Genre fit is the match between player motivation, market expectation, monetization and production capability. Puzzle is attractive for small teams because creatives can be clear and sessions are short, but it is also competitive and often needs strong retention or ad depth to pay back.",
    example: "A block puzzle with calm daily challenges can target different motivations than a fast fail-and-retry puzzle. The same CPI can be good for one and dangerous for the other depending on retention and ARPDAU.",
    decisionRule: "A market thesis is not 'people like puzzle games'. It must name the player motivation, comparable games, region assumption and monetization path.",
    lab: "Pick two reference puzzle games. Compare promise, audience, monetization and store presentation. Write what your game does differently.",
    planUpdate: "Add target audience, motivation, region and competitor references to Final UA Plan.",
    quiz: {
      question: "Day 2: Which statement is a usable market thesis?",
      options: [
        "Puzzle is popular, so CPI should be cheap",
        "Adults who want calm daily logic challenges may respond to clear before/after puzzle ads in tier-2 Android markets",
        "The game has many levels, so it has high LTV",
        "We will test every region and let the network decide everything"
      ],
      answer: 1,
      explanation: "A useful thesis names audience, motivation, creative angle and region instead of relying on genre popularity."
    },
    checks: [
      "List two competitor/reference games and their visible promise.",
      "Write the player motivation your puzzle game is built around.",
      "Choose an initial region assumption for micro-budget testing.",
      "Update the audience field in Final UA Plan."
    ]
  },
  {
    day: 3,
    title: "Audience motivation map",
    module: "Week 1 - UA fundamentals",
    summary: "Map player motivations into ad hooks, store proof and first-session expectations.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Beginner",
    terms: ["Audience", "Motivation", "Hook"],
    artifact: "Audience motivation map",
    planField: "audience",
    caseIds: ["puzzle-store-mismatch"],
    toolIds: [],
    outcome: "Separate demographic guesses from behavior and motivation signals.",
    core: "UA targeting is weaker when it starts with age/gender stereotypes. For a puzzle game, the better starting point is motivation: relax, prove skill, clear chaos, beat a timer, collect progress or solve a satisfying visual problem.",
    example: "The hook 'only 1% can solve this' attracts challenge seekers. The hook 'clean the board and relax' attracts a different audience, even if both are puzzle players.",
    decisionRule: "Every creative hook should map to one expected first-session behavior. If the hook promises challenge, tutorial and level pacing must prove challenge quickly.",
    lab: "Create three motivation rows: player wants, ad hook, store proof, first-session proof, metric that would validate it.",
    planUpdate: "Refine the audience field with the strongest motivation, not just demographic labels.",
    quiz: {
      question: "Day 3: Why map motivation before creative production?",
      options: [
        "It lets you make more unrelated creatives quickly",
        "It ties ad hooks to store proof and first-session behavior",
        "It replaces the need for retention metrics",
        "It guarantees the lowest CPI"
      ],
      answer: 1,
      explanation: "Motivation mapping keeps creative, store page and gameplay promise aligned."
    },
    checks: [
      "Write three possible player motivations for your puzzle game.",
      "Attach one ad hook to each motivation.",
      "Define what the first session must prove for the strongest hook.",
      "Update target audience with behavior and motivation signals."
    ]
  },
  {
    day: 4,
    title: "Funnel from impression to retained player",
    module: "Week 1 - UA fundamentals",
    summary: "Trace the complete funnel so CPI, CVR and retention are read as connected signals.",
    stages: ["prototype", "live"],
    difficulty: "Beginner",
    terms: ["Funnel", "IPM", "CVR"],
    artifact: "Funnel leak map",
    planField: "metricTargets",
    caseIds: ["puzzle-store-mismatch", "puzzle-onboarding-leak"],
    toolIds: ["cohortReadout"],
    outcome: "Identify which part of the funnel is probably leaking from a simple metric pattern.",
    core: "The UA funnel is a chain: impression, click, store view, install, first open, tutorial, session depth, return and revenue. A weak metric is usually a clue about one link, not a final verdict on the game.",
    example: "High CTR and low store CVR suggests the ad hook got attention but the store did not confirm it. Low CPI and low D1 may mean the promise attracted the wrong player or the first session failed.",
    decisionRule: "Never optimize the nearest visible metric without asking which funnel link produced it.",
    lab: "Create a funnel leak map with one metric per link. Mark which links your current build can measure today.",
    planUpdate: "Add metric targets as decision ranges: attention, install conversion, early retention and revenue signal.",
    quiz: {
      question: "Day 4: CTR is high but store CVR is weak. What is the first suspicion?",
      options: [
        "The store page does not confirm the ad promise",
        "The tutorial has too many analytics events",
        "D7 retention is already proven",
        "The game should immediately scale budget"
      ],
      answer: 0,
      explanation: "High click intent with low install conversion often points to promise mismatch at the store listing."
    },
    checks: [
      "Write your funnel from impression to D1 return.",
      "Mark which events/metrics you can measure now.",
      "Add one decision range for store conversion or early retention.",
      "Name the funnel link you expect to be weakest."
    ]
  },
  {
    day: 5,
    title: "Micro soft-launch strategy",
    module: "Week 1 - UA fundamentals",
    summary: "Design a small launch test that reduces risk without pretending micro-budget data is perfect.",
    stages: ["prototype", "live"],
    difficulty: "Beginner",
    terms: ["Soft launch", "Retention", "Cohort"],
    artifact: "Micro soft-launch outline",
    planField: "budget",
    caseIds: ["micro-budget-false-positive"],
    toolIds: ["sampleSize"],
    outcome: "Choose what a $100-500 test can and cannot decide.",
    core: "A micro soft-launch is not a miniature global launch. It is a controlled learning sprint. With small spend, you can detect obvious promise, tracking and onboarding problems; you usually cannot prove long-term scale economics.",
    example: "A $300 Android puzzle test may show whether first-session retention is broken and whether one hook earns installs. It should not be used to claim stable ROAS across channels.",
    decisionRule: "Use micro-budget to eliminate bad assumptions, not to declare a winner from tiny cohorts.",
    lab: "Write a 7-day test outline: region, channel, creatives, daily cap, stop-loss rule and what evidence would justify another test.",
    planUpdate: "Add initial budget, daily cap and stop-loss rule to Final UA Plan.",
    quiz: {
      question: "Day 5: What is the safest use of a $100-500 soft-launch test?",
      options: [
        "Prove global scale and stable LTV",
        "Find obvious funnel, creative or tracking problems before larger spend",
        "Skip retention because sample size is small",
        "Run every possible creative and audience"
      ],
      answer: 1,
      explanation: "Micro-budget testing is best for risk reduction and next-step decisions."
    },
    checks: [
      "Pick a micro-budget range and daily cap.",
      "Define what the test is allowed to conclude.",
      "Write one stop-loss rule for bad early signal.",
      "Update the budget field in Final UA Plan."
    ]
  },
  {
    day: 6,
    title: "Channel map for small Unity teams",
    module: "Week 1 - UA fundamentals",
    summary: "Compare Meta, Google, Unity/AppLovin-style networks, ASO and organic validation for a small test.",
    stages: ["prototype", "live"],
    difficulty: "Beginner",
    terms: ["Ad network", "Campaign", "Optimization"],
    artifact: "Channel selection note",
    planField: "budget",
    caseIds: ["idle-creative-spike"],
    toolIds: ["testBudget"],
    outcome: "Choose a first channel based on learning goal, budget and creative readiness.",
    core: "Channels are not interchangeable. Some are better for creative learning, some for intent, some for scale, and some require more conversion volume than a micro-budget can provide. For a first puzzle test, the question is often which channel can teach you fastest without requiring a mature account.",
    example: "If you have three clean video hooks, a creative-friendly social channel may teach promise quickly. If your store page is weak, ASO and listing cleanup may be the better first move.",
    decisionRule: "Pick one primary channel for the first learning sprint. Splitting tiny budget across many channels usually creates noise.",
    lab: "Score three channels from 1-5 on budget fit, creative fit, measurement complexity and speed of learning.",
    planUpdate: "Add the first channel choice and why it matches your learning goal.",
    quiz: {
      question: "Day 6: Why avoid splitting a $300 test across many channels?",
      options: [
        "It creates too little signal per channel to make a decision",
        "It always increases ROAS",
        "It removes the need for creative variants",
        "It makes attribution perfect"
      ],
      answer: 0,
      explanation: "Micro-budget needs concentrated learning, not fragmented noise."
    },
    checks: [
      "List three possible channels and one reason for each.",
      "Choose one primary channel for the first sprint.",
      "Write why the channel matches your creative and budget.",
      "Record what you will not test yet."
    ]
  },
  {
    day: 7,
    title: "Week 1 synthesis: first UA hypothesis",
    module: "Week 1 - UA fundamentals",
    summary: "Compress audience, funnel, channel and budget assumptions into one testable hypothesis.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Beginner",
    terms: ["UA", "Funnel", "Soft launch"],
    artifact: "First UA hypothesis card",
    planField: "hypothesis",
    caseIds: ["puzzle-onboarding-leak"],
    toolIds: ["sampleSize"],
    outcome: "Create a one-card hypothesis that can drive Week 2 measurement choices.",
    core: "The end of Week 1 should produce a hypothesis card, not a pile of notes. The card should say who the test is for, what promise will be tested, where the signal appears and what action follows.",
    example: "For a calming block puzzle: 'Adults seeking low-pressure brain breaks will install from a 10-second satisfying-clear hook; if D1 and tutorial completion are weak, we revise first-session clarity before new creatives.'",
    decisionRule: "If the hypothesis does not name a decision rule, it is still just an idea.",
    lab: "Write the card in five lines: player, promise, channel, metric, action.",
    planUpdate: "Replace the rough hypothesis with the Week 1 hypothesis card.",
    quiz: {
      question: "Day 7: What must a hypothesis card include to be actionable?",
      options: [
        "Player, promise, signal and next action",
        "Only the game genre and planned spend",
        "A guarantee that CPI will be low",
        "All possible audiences at once"
      ],
      answer: 0,
      explanation: "The card must connect the test to a decision."
    },
    checks: [
      "Write the five-line hypothesis card.",
      "Remove vague phrases like 'everyone' or 'fun gameplay'.",
      "Add a next action for good and bad signal.",
      "Confirm Week 2 measurement needs."
    ]
  },
  {
    day: 8,
    title: "Metric map for puzzle UA",
    module: "Week 2 - Metrics and measurement",
    summary: "Connect acquisition, retention, monetization and creative metrics into one decision map.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["CPI", "Retention", "ARPDAU"],
    artifact: "Metric decision map",
    planField: "metricTargets",
    caseIds: ["live-roas-shortfall"],
    toolIds: ["cohortReadout", "breakEvenCpi"],
    outcome: "Know which metric answers which business or product question.",
    core: "Metrics are useful only when attached to decisions. CPI answers cost of entry, IPM answers creative-market fit, retention answers product promise, ARPDAU answers monetization depth, and ROAS answers whether paid growth may eventually pay back.",
    example: "A puzzle game can have acceptable CPI but poor D1 because players do not understand the first board. That is not a media buying problem yet.",
    decisionRule: "Define a primary metric per learning question and supporting metrics to prevent false confidence.",
    lab: "Make a table with question, primary metric, supporting metric and action for four decisions.",
    planUpdate: "Update metric targets as ranges tied to decisions, not universal benchmarks.",
    quiz: {
      question: "Day 8: Which metric best tests whether the first-session promise is working?",
      options: ["D1 retention or early return signal", "Campaign name", "Number of SDKs", "Store icon file size"],
      answer: 0,
      explanation: "Retention and early return behavior show whether players found value after install."
    },
    checks: [
      "Map four metrics to four decisions.",
      "Separate acquisition, retention and monetization signals.",
      "Write one supporting metric for each primary metric.",
      "Update metric targets in Final UA Plan."
    ]
  },
  {
    day: 9,
    title: "CPI, CTR, CVR and IPM without vanity traps",
    module: "Week 2 - Metrics and measurement",
    summary: "Read acquisition efficiency while avoiding decisions from surface metrics alone.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["CPI", "CTR", "CVR", "IPM"],
    artifact: "Acquisition signal readout",
    planField: "metricTargets",
    caseIds: ["puzzle-store-mismatch", "idle-creative-spike"],
    toolIds: ["testBudget"],
    outcome: "Diagnose whether an acquisition metric points to creative, store or audience issues.",
    core: "CTR tells you whether the ad earns attention. CVR tells you whether the store page turns interest into installs. IPM combines impression-to-install efficiency. CPI tells you cost, but it does not prove user quality.",
    example: "A shocking puzzle fail ad may get high CTR, but if screenshots show a different game style, CVR and retention can collapse.",
    decisionRule: "A cheap CPI is not a win until retention or revenue quality supports it.",
    lab: "Write three metric patterns and likely diagnosis: high CTR/low CVR, low CTR/high CVR, low CPI/low D1.",
    planUpdate: "Add acquisition metric ranges and the diagnosis you will apply to each pattern.",
    quiz: {
      question: "Day 9: CPI drops sharply while D1 also drops. What is the safest read?",
      options: [
        "Traffic quality or promise fit may have worsened",
        "The campaign is automatically ready to scale",
        "Store screenshots are definitely perfect",
        "Retention no longer matters"
      ],
      answer: 0,
      explanation: "Lower cost can be dangerous if user quality falls with it."
    },
    checks: [
      "Write definitions for CPI, CTR, CVR and IPM in your own words.",
      "Attach each metric to a funnel link.",
      "Define one bad-pattern diagnosis.",
      "Update metric decision ranges."
    ]
  },
  {
    day: 10,
    title: "Retention cohorts and first-session proof",
    module: "Week 2 - Metrics and measurement",
    summary: "Use D1/D7 and early funnel behavior to judge whether players found value.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["Retention", "Cohort", "Onboarding"],
    artifact: "First-session proof checklist",
    planField: "tracking",
    caseIds: ["puzzle-onboarding-leak"],
    toolIds: ["cohortReadout"],
    outcome: "Connect retention movement to onboarding, level pacing and promise delivery.",
    core: "Retention is not just a number on day 1 or day 7. It is a cohort story: which group installed, what promise they saw, what happened in the first session and whether they had a reason to return.",
    example: "If many players leave before level 4, a puzzle game may need clearer early wins, faster board satisfaction or better difficulty ramp before buying more traffic.",
    decisionRule: "Before blaming traffic, inspect whether the first session proves the ad promise within the first few minutes.",
    lab: "Write your first-session proof checklist: first board clear, tutorial completion, level 3 reach, second session hook.",
    planUpdate: "Add required retention/first-session events to tracking.",
    quiz: {
      question: "Day 10: What should you inspect before blaming an ad network for weak D1?",
      options: [
        "Whether the first session delivered the creative promise",
        "Whether the app icon uses enough colors",
        "Whether there are more dashboards available",
        "Whether the campaign name includes the genre"
      ],
      answer: 0,
      explanation: "Weak retention often reflects promise or onboarding issues that media metrics cannot fix."
    },
    checks: [
      "Define the first-session proof events.",
      "Mark the earliest point players can feel the core puzzle value.",
      "Write one onboarding risk.",
      "Update tracking checklist."
    ]
  },
  {
    day: 11,
    title: "ARPDAU, LTV and payback for ads plus light IAP",
    module: "Week 2 - Metrics and measurement",
    summary: "Estimate economic ceiling without pretending early LTV is precise.",
    stages: ["live"],
    difficulty: "Core",
    terms: ["ARPDAU", "LTV", "Payback window"],
    artifact: "Rough economics note",
    planField: "metricTargets",
    caseIds: ["live-roas-shortfall"],
    toolIds: ["breakEvenCpi"],
    outcome: "Use rough LTV logic to set guardrails for spend and payback windows.",
    core: "For a puzzle game with ads plus light IAP, early monetization is usually noisy. ARPDAU and retention together create a rough ceiling. The goal is not perfect finance; it is knowing when CPI is clearly too high for your current economy.",
    example: "A game with good D1 but low rewarded-ad engagement may need monetization placement work before campaign scale.",
    decisionRule: "Do not scale spend just because retention is acceptable if payback math has no plausible path.",
    lab: "Estimate rough LTV with conservative, expected and optimistic assumptions. Write which product change could move each input.",
    planUpdate: "Add rough economics and payback assumptions to metric targets.",
    quiz: {
      question: "Day 11: Why use conservative LTV assumptions in a micro soft-launch?",
      options: [
        "Early revenue data is noisy and easy to overread",
        "It makes all campaigns look successful",
        "It removes the need for retention",
        "It proves IAP-heavy monetization automatically"
      ],
      answer: 0,
      explanation: "Conservative assumptions prevent tiny early revenue spikes from causing overconfidence."
    },
    checks: [
      "Write conservative, expected and optimistic LTV assumptions.",
      "Identify whether ads or light IAP is the main early revenue driver.",
      "Set a payback window assumption.",
      "Update metric targets with economics guardrails."
    ]
  },
  {
    day: 12,
    title: "ROAS windows and signal delay",
    module: "Week 2 - Metrics and measurement",
    summary: "Define how soon a campaign must show enough signal without overreacting to delayed revenue.",
    stages: ["live"],
    difficulty: "Core",
    terms: ["ROAS", "LTV", "Payback window"],
    artifact: "ROAS decision window",
    planField: "successCriteria",
    caseIds: ["live-roas-shortfall", "micro-budget-false-positive"],
    toolIds: ["cohortReadout"],
    outcome: "Write scale/hold/kill rules that respect measurement delay.",
    core: "ROAS is a time-window metric. Day 0, Day 3, Day 7 and Day 30 can tell different stories. With micro-budget, use ROAS as a directional guardrail alongside retention and monetization behavior.",
    example: "A puzzle game with D7 ROAS below target but strong D1 and ad engagement may deserve a monetization iteration, not immediate creative abandonment.",
    decisionRule: "Every ROAS target must include a time window, sample caveat and action.",
    lab: "Write three rules: hold, iterate or stop based on D1/D7 retention, CPI and early revenue.",
    planUpdate: "Add success criteria with time windows and sample caveats.",
    quiz: {
      question: "Day 12: What is missing from the statement 'ROAS target is 20%'?",
      options: ["The time window and action rule", "The app icon size", "The number of store screenshots only", "The developer machine name"],
      answer: 0,
      explanation: "ROAS without a window and decision rule is not operational."
    },
    checks: [
      "Choose the first ROAS window you will inspect.",
      "Write one hold rule and one stop rule.",
      "Pair ROAS with retention and CPI.",
      "Update success criteria."
    ]
  },
  {
    day: 13,
    title: "Attribution, ATT, SKAN and Android privacy signals",
    module: "Week 2 - Metrics and measurement",
    summary: "Understand why mobile measurement is incomplete and how to make decisions with partial signal.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["Attribution", "ATT", "SKAN"],
    artifact: "Measurement risk note",
    planField: "tracking",
    caseIds: ["privacy-sdk-readiness"],
    toolIds: [],
    outcome: "Explain signal loss and document how it affects your test decisions.",
    core: "Modern mobile UA measurement is privacy-constrained. iOS ATT and SKAN/AdAttributionKit-era reporting reduce user-level certainty. Android privacy changes also move attribution toward protected, aggregated or delayed reporting. Your plan must assume missing, delayed or modeled data.",
    example: "If two dashboards disagree, the right response is not panic. Check windows, attribution source, event definitions and whether the decision can be made from directional signal.",
    decisionRule: "When attribution is incomplete, make smaller decisions and write confidence level beside the metric.",
    lab: "Create a measurement risk note: which metrics are direct, delayed, modeled or unavailable in your first test.",
    planUpdate: "Add measurement limitations and confidence notes to tracking.",
    quiz: {
      question: "Day 13: What is a healthy response to privacy-driven signal loss?",
      options: [
        "Use directional evidence with written confidence levels",
        "Assume every dashboard number is perfectly comparable",
        "Ignore consent and platform policy",
        "Stop measuring retention"
      ],
      answer: 0,
      explanation: "Modern UA decisions need confidence notes and smaller next actions when signal is incomplete."
    },
    checks: [
      "List metrics likely to be delayed or modeled.",
      "Write one dashboard reconciliation risk.",
      "Add a confidence label to your key decision metric.",
      "Update tracking with privacy/attribution caveats."
    ]
  },
  {
    day: 14,
    title: "Event taxonomy for Unity games",
    module: "Week 2 - Metrics and measurement",
    summary: "Choose conceptual events before SDK implementation so UA decisions have usable logs.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["Event taxonomy", "Attribution", "Cohort"],
    artifact: "Unity event taxonomy v1",
    planField: "tracking",
    caseIds: ["privacy-sdk-readiness"],
    toolIds: [],
    outcome: "Draft a lean event taxonomy that supports UA decisions without over-logging.",
    core: "A Unity event taxonomy should be designed from decisions backward. Names must be stable, parameters limited and meaningful, and events must map to funnel questions: install quality, tutorial proof, level depth, session return, ad monetization and purchase behavior.",
    example: "For puzzle: first_open, tutorial_complete, level_start, level_complete, fail, hint_used, rewarded_ad_watched, interstitial_shown, purchase_complete and session_start may be enough for the first test.",
    decisionRule: "If an event will not change a UA/product decision, keep it out of v1.",
    lab: "Write ten v1 events with event purpose, required parameters and the decision each event supports.",
    planUpdate: "Replace the tracking checklist with event taxonomy v1.",
    quiz: {
      question: "Day 14: What makes an event taxonomy useful for UA?",
      options: [
        "Each event supports a decision and has stable naming",
        "It logs every variable in the game",
        "It uses random names per build",
        "It exists only after campaigns have ended"
      ],
      answer: 0,
      explanation: "A lean taxonomy supports decisions and remains stable across builds."
    },
    checks: [
      "Write ten v1 events for the first test.",
      "Add one purpose and one key parameter per event.",
      "Remove events that do not support a decision.",
      "Update tracking in Final UA Plan."
    ]
  },
  {
    day: 15,
    title: "Creative hooks from player motivation",
    module: "Week 3 - Creative and store readiness",
    summary: "Turn player motivations into ad hooks that can be tested cleanly.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Core",
    terms: ["Creative testing", "CTR", "IPM"],
    artifact: "Hook bank",
    planField: "creativeMatrix",
    caseIds: ["idle-creative-spike"],
    toolIds: ["testBudget"],
    outcome: "Create a small hook bank that tests motivations rather than random visuals.",
    core: "A hook is the first promise a player sees. Good hooks are specific enough to test: impossible challenge, satisfying clear, relaxing daily routine, clever trick, progression reward or social proof.",
    example: "For puzzle, 'Can you clear this impossible board?' and 'Clean the chaos in one move' test different motivations and should not be mixed in the same learning cell.",
    decisionRule: "One creative cell should test one motivation, not five ideas at once.",
    lab: "Write six hooks: two challenge, two satisfaction, one relaxation and one progression hook.",
    planUpdate: "Start the creative matrix with hooks, promise and expected signal.",
    quiz: {
      question: "Day 15: What should one creative hook test?",
      options: ["One player motivation", "Every possible feature", "Only the logo", "The full tutorial"],
      answer: 0,
      explanation: "Single-motivation hooks make test results easier to interpret."
    },
    checks: [
      "Write six hooks grouped by motivation.",
      "Choose three hooks for the first test.",
      "Define expected signal for each hook.",
      "Update creative matrix."
    ]
  },
  {
    day: 16,
    title: "Video, static and playable concepts",
    module: "Week 3 - Creative and store readiness",
    summary: "Choose ad formats based on clarity, production cost and what the test needs to learn.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["Playable ad", "Creative testing", "IPM"],
    artifact: "Format selection matrix",
    planField: "creativeMatrix",
    caseIds: ["hybrid-cheap-traffic"],
    toolIds: ["testBudget"],
    outcome: "Pick first creative formats without overproducing assets.",
    core: "Format choice is a learning decision. Static can test promise cheaply. Short video can show before/after and motion clarity. Playable concepts can prove interaction but cost more and can mislead if the playable differs from the real game.",
    example: "A puzzle game may start with three short videos showing board setup, one satisfying move and result screen before building any playable.",
    decisionRule: "Use the cheapest format that can honestly prove the hook.",
    lab: "For your top three hooks, choose static, video or playable concept and write why.",
    planUpdate: "Add format and production cost notes to the creative matrix.",
    quiz: {
      question: "Day 16: When is a playable ad risky for a small puzzle team?",
      options: [
        "When it promises interaction the real build cannot deliver",
        "When it uses the same core mechanic honestly",
        "When it has a clear learning goal",
        "When it is tested after store readiness"
      ],
      answer: 0,
      explanation: "A playable that overpromises can create retention mismatch."
    },
    checks: [
      "Choose a format for each top hook.",
      "Write what each format can prove.",
      "Avoid formats that overpromise the build.",
      "Update creative matrix with production scope."
    ]
  },
  {
    day: 17,
    title: "Creative test matrix",
    module: "Week 3 - Creative and store readiness",
    summary: "Design variants so each test has one learning goal and a clear interpretation.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["Creative testing", "CTR", "CVR"],
    artifact: "Creative test matrix v1",
    planField: "creativeMatrix",
    caseIds: ["idle-creative-spike"],
    toolIds: ["testBudget", "sampleSize"],
    outcome: "Build a small matrix of hooks, variants, metric reads and actions.",
    core: "A test matrix prevents random creative iteration. Rows should define hook, format, variant change, learning goal, primary metric and next action. If two variants differ in hook, visual style and CTA, the result will be hard to interpret.",
    example: "Variant A shows the board before the satisfying move. Variant B starts after the move. Same hook, different opening. That is interpretable.",
    decisionRule: "Change one major variable per cell when the budget is small.",
    lab: "Create a 3x2 matrix: three hooks, two variants each, one primary learning goal per row.",
    planUpdate: "Replace rough creative notes with matrix v1.",
    quiz: {
      question: "Day 17: Why avoid changing hook, art style and CTA all at once?",
      options: [
        "The result becomes hard to diagnose",
        "It always lowers CPI",
        "It removes creative fatigue",
        "It guarantees store conversion"
      ],
      answer: 0,
      explanation: "Too many simultaneous changes make the learning unclear."
    },
    checks: [
      "Build a 3x2 creative matrix.",
      "Define one primary metric for each row.",
      "Write the action for win, weak signal or loss.",
      "Update creative matrix in Final UA Plan."
    ]
  },
  {
    day: 18,
    title: "ASO and store promise continuity",
    module: "Week 3 - Creative and store readiness",
    summary: "Align icon, screenshots, title and description with the ad promise before buying traffic.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Core",
    terms: ["ASO", "CVR", "Store listing"],
    artifact: "Store promise checklist",
    planField: "creativeMatrix",
    caseIds: ["puzzle-store-mismatch"],
    toolIds: [],
    outcome: "Audit the store page as part of the UA funnel, not as a separate branding task.",
    core: "The store page is the bridge between ad interest and install. If screenshots, icon or description do not confirm the ad promise, CVR suffers and traffic may be misread as low quality.",
    example: "An ad showing colorful block clears should not land on screenshots dominated by menus, meta progression or old art.",
    decisionRule: "Every top creative hook needs matching store proof.",
    lab: "Write a store promise checklist: icon signal, first screenshot, first sentence, gameplay proof and privacy/data safety readiness.",
    planUpdate: "Add store continuity notes to creative matrix or success criteria.",
    quiz: {
      question: "Day 18: What should the first store screenshot do after a user clicks an ad?",
      options: [
        "Confirm the same promise that earned the click",
        "Show only settings screens",
        "Hide gameplay until later",
        "Contradict the ad to surprise users"
      ],
      answer: 0,
      explanation: "Store continuity protects CVR and retention quality."
    },
    checks: [
      "Match each top hook to one store proof element.",
      "Audit icon and first screenshot for promise continuity.",
      "Write one store risk before spend.",
      "Update creative/store readiness notes."
    ]
  },
  {
    day: 19,
    title: "Competitor teardown without copying",
    module: "Week 3 - Creative and store readiness",
    summary: "Analyze competitor store pages and creatives to find testable patterns, not clone work.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Core",
    terms: ["Genre-market fit", "ASO", "Creative testing"],
    artifact: "Competitor teardown sheet",
    planField: "audience",
    caseIds: ["puzzle-store-mismatch"],
    toolIds: [],
    outcome: "Extract market patterns while preserving your game's own promise.",
    core: "Competitor teardown is useful when it separates pattern from asset. Patterns include promise type, difficulty ramp, screenshot order, reward framing and monetization expectation. Copying visuals does not explain why the market responds.",
    example: "Three successful puzzle listings may all show a near-fail board state in screenshot one. The pattern is 'immediate solvable tension', not a specific board design to copy.",
    decisionRule: "Copy patterns of player motivation and proof, not protected creative execution.",
    lab: "Teardown three puzzle competitors: promise, first visual proof, monetization hint, weak spot and what you will test differently.",
    planUpdate: "Update audience and creative notes with market patterns.",
    quiz: {
      question: "Day 19: What should you extract from competitor teardown?",
      options: [
        "Patterns of promise and proof",
        "Exact copied screenshots",
        "A guarantee of low CPI",
        "Only app names"
      ],
      answer: 0,
      explanation: "The value is in patterns that inform your own test."
    },
    checks: [
      "Teardown three puzzle competitors.",
      "Write one repeated market pattern.",
      "Write one way your game differs honestly.",
      "Update audience or creative matrix."
    ]
  },
  {
    day: 20,
    title: "Creative fatigue and iteration cadence",
    module: "Week 3 - Creative and store readiness",
    summary: "Recognize when a creative stops learning, stops scaling or needs a new angle.",
    stages: ["live"],
    difficulty: "Core",
    terms: ["Creative fatigue", "CTR", "ROAS"],
    artifact: "Creative iteration rule",
    planField: "successCriteria",
    caseIds: ["idle-creative-spike"],
    toolIds: ["testBudget"],
    outcome: "Write rules for refreshing creatives without reacting to every noisy day.",
    core: "Creative fatigue happens when the same asset stops reaching responsive users or the audience has seen it too often. Small teams should define iteration cadence in advance so they do not rebuild everything after one bad day.",
    example: "If the same hook keeps good retention but CTR decays, build variations around the winning motivation. If retention is weak, changing colors may not fix the problem.",
    decisionRule: "Iterate around proven motivation; pivot only when the motivation itself fails.",
    lab: "Write three iteration rules: refresh, variant, pivot. Attach each to a metric pattern.",
    planUpdate: "Add creative iteration rules to success criteria.",
    quiz: {
      question: "Day 20: If CTR decays but retained users remain strong, what is the better first move?",
      options: [
        "Make variants around the same motivation",
        "Kill the whole game immediately",
        "Ignore creative and only add SDKs",
        "Change every funnel link at once"
      ],
      answer: 0,
      explanation: "Strong retained users suggest the promise is good; the asset may need refresh."
    },
    checks: [
      "Define refresh, variant and pivot conditions.",
      "Attach each condition to a metric pattern.",
      "Write how many new creatives are realistic per week.",
      "Update success criteria."
    ]
  },
  {
    day: 21,
    title: "Week 3 synthesis: creative and store readiness",
    module: "Week 3 - Creative and store readiness",
    summary: "Prepare the minimum creative set and store checklist for a real micro soft-launch.",
    stages: ["prototype", "live"],
    difficulty: "Core",
    terms: ["ASO", "Creative testing", "Soft launch"],
    artifact: "Creative readiness packet",
    planField: "creativeMatrix",
    caseIds: ["puzzle-store-mismatch", "idle-creative-spike"],
    toolIds: ["testBudget"],
    outcome: "Finish a ready-to-test packet: hooks, variants, store proof and acceptance rules.",
    core: "By the end of Week 3, the game should have a small creative packet, not a backlog of vague ad ideas. The packet includes hooks, assets, store proof and rules for reading the result.",
    example: "For puzzle: three hooks, two video variants each, updated screenshots, one store description aligned to the main promise and a decision matrix.",
    decisionRule: "Do not launch traffic to a creative promise the store page cannot confirm.",
    lab: "Assemble your readiness packet and remove any creative that does not have matching store proof.",
    planUpdate: "Finalize creative matrix v1 and store readiness notes.",
    quiz: {
      question: "Day 21: What blocks a creative from entering the first test?",
      options: [
        "The store page cannot confirm its promise",
        "It has a clear learning goal",
        "It maps to a player motivation",
        "It has a matching screenshot"
      ],
      answer: 0,
      explanation: "Promise continuity is required before paid traffic."
    },
    checks: [
      "Finalize three hooks and six variants or a smaller honest set.",
      "Confirm store proof for each top hook.",
      "Write acceptance and rejection rules.",
      "Update creative matrix in Final UA Plan."
    ]
  },
  {
    day: 22,
    title: "Campaign structure for a micro test",
    module: "Week 4 - Campaign operation",
    summary: "Structure the first campaign around one learning goal, limited budget and readable reporting.",
    stages: ["prototype", "live"],
    difficulty: "Practical",
    terms: ["Campaign", "Ad set", "ROAS"],
    artifact: "Campaign structure note",
    planField: "budget",
    caseIds: ["micro-budget-false-positive"],
    toolIds: ["sampleSize", "testBudget"],
    outcome: "Create a first campaign structure that does not fragment signal.",
    core: "Campaign structure should reflect the learning goal. For micro-budget, keep structure simple: one channel, one region cluster, limited creative cells and clear naming. Complexity belongs after signal appears.",
    example: "A first Android puzzle test might use one campaign, one broad audience/region setup and six creatives grouped by hook, not ten tiny ad sets.",
    decisionRule: "Do not create more campaign cells than the budget can feed with meaningful installs.",
    lab: "Write campaign name, channel, region, budget cap, creative cells and reporting columns.",
    planUpdate: "Add campaign structure to budget and success criteria.",
    quiz: {
      question: "Day 22: What is the main danger of over-segmenting a micro campaign?",
      options: [
        "Each cell gets too little signal",
        "The app becomes smaller",
        "Attribution becomes perfect",
        "Creative fatigue disappears"
      ],
      answer: 0,
      explanation: "Too many cells turn a small test into unreadable noise."
    },
    checks: [
      "Write one campaign structure for the first sprint.",
      "Limit cells to what budget can feed.",
      "Define naming convention for reports.",
      "Update budget and success criteria."
    ]
  },
  {
    day: 23,
    title: "Budget and sample-size sanity",
    module: "Week 4 - Campaign operation",
    summary: "Avoid conclusions from tiny data while keeping spend controlled.",
    stages: ["prototype", "live"],
    difficulty: "Practical",
    terms: ["CPI", "Cohort", "Sample size"],
    artifact: "Budget sanity sheet",
    planField: "budget",
    caseIds: ["micro-budget-false-positive"],
    toolIds: ["sampleSize", "testBudget"],
    outcome: "Estimate whether the budget can support the decision you want to make.",
    core: "Sample size is not a magic number, but tiny cohorts are easy to misread. A $100-500 test should focus on strong directional signals and obvious failures. The budget must match the number of variants.",
    example: "If expected CPI is $0.80 and you test eight creatives with $200, each creative may get too few installs for confidence.",
    decisionRule: "If the budget cannot feed the matrix, reduce variants before increasing conclusions.",
    lab: "Use the sample-size tool to compare 3, 6 and 9 creative cells under your budget.",
    planUpdate: "Update budget with installs-per-variant expectation and confidence caveat.",
    quiz: {
      question: "Day 23: Budget is fixed and expected CPI is higher than planned. What is the cleanest adjustment?",
      options: [
        "Reduce variants or narrow the decision",
        "Keep all variants and trust tiny samples",
        "Ignore install count",
        "Declare ROAS stable immediately"
      ],
      answer: 0,
      explanation: "The decision scope must fit the budget and expected CPI."
    },
    checks: [
      "Estimate installs per creative cell.",
      "Reduce the matrix if cells are underfed.",
      "Write confidence caveats for micro sample size.",
      "Update budget in Final UA Plan."
    ]
  },
  {
    day: 24,
    title: "Reading campaign reports",
    module: "Week 4 - Campaign operation",
    summary: "Separate creative signal, audience signal, store signal and product signal in a simple report.",
    stages: ["live"],
    difficulty: "Practical",
    terms: ["CTR", "IPM", "Retention", "ROAS"],
    artifact: "Report readout template",
    planField: "successCriteria",
    caseIds: ["puzzle-store-mismatch", "puzzle-onboarding-leak", "live-roas-shortfall"],
    toolIds: ["cohortReadout"],
    outcome: "Write a report readout that recommends one action instead of listing metrics.",
    core: "A report is useful when it explains signal by source: creative earned attention, store converted it, product retained it, monetization paid for it. Mixing these together creates bad fixes.",
    example: "High IPM with weak D1 means the creative may be efficient at attracting installs, but the product promise or user quality needs inspection.",
    decisionRule: "Every report readout must end with one recommended call: scale, iterate creative, fix store, fix product, fix tracking or stop.",
    lab: "Write a one-page readout from a sample metric pattern using diagnosis, evidence, confidence and next action.",
    planUpdate: "Add report readout criteria to success criteria.",
    quiz: {
      question: "Day 24: What should a campaign readout end with?",
      options: [
        "One recommended call and confidence level",
        "Every raw metric copied without interpretation",
        "A new unrelated feature idea",
        "Only the best-looking chart"
      ],
      answer: 0,
      explanation: "Reports must drive decisions, not just archive numbers."
    },
    checks: [
      "Separate metrics into creative, store, product and monetization buckets.",
      "Write diagnosis and confidence level.",
      "Choose one recommended call.",
      "Update success criteria."
    ]
  },
  {
    day: 25,
    title: "Scale, iterate or kill decision rules",
    module: "Week 4 - Campaign operation",
    summary: "Use predefined rules to reduce emotional campaign decisions.",
    stages: ["live"],
    difficulty: "Practical",
    terms: ["ROAS", "Retention", "Creative testing"],
    artifact: "Scale-iterate-kill rules",
    planField: "killCriteria",
    caseIds: ["live-roas-shortfall", "idle-creative-spike"],
    toolIds: ["cohortReadout", "breakEvenCpi"],
    outcome: "Write decision rules before seeing the report.",
    core: "Scale, iterate or kill should not depend on how optimistic the team feels that day. Predefined rules protect small teams from chasing noise or killing a promising signal too early.",
    example: "Scale cautiously if acquisition and retention both beat decision ranges. Iterate creative if attention is weak but retained users are good. Fix product if installs are cheap but first-session proof fails.",
    decisionRule: "A rule must include condition, action, owner and review date.",
    lab: "Write three decision rules for scale, iterate and stop using metric patterns from your plan.",
    planUpdate: "Add kill criteria and scale/iterate conditions.",
    quiz: {
      question: "Day 25: What belongs in a good kill criterion?",
      options: [
        "Metric condition, action and review point",
        "A vague bad feeling",
        "Only CPI with no retention context",
        "A promise to decide later"
      ],
      answer: 0,
      explanation: "Decision rules need specific conditions and actions."
    },
    checks: [
      "Write one scale rule.",
      "Write one iterate rule.",
      "Write one stop or pause rule.",
      "Update kill criteria."
    ]
  },
  {
    day: 26,
    title: "SDK, privacy and store-risk readiness",
    module: "Week 4 - Campaign operation",
    summary: "Treat ad, analytics and attribution SDKs as product architecture and compliance decisions.",
    stages: ["prototype", "live"],
    difficulty: "Practical",
    terms: ["ATT", "SKAN", "Event taxonomy"],
    artifact: "SDK readiness checklist",
    planField: "tracking",
    caseIds: ["privacy-sdk-readiness"],
    toolIds: [],
    outcome: "Identify SDK/data risks before public testing.",
    core: "For Unity devs, UA readiness includes SDK count, consent flow, store data disclosures, ad placement behavior, build performance and event validation. This course stays conceptual, but the checklist should be concrete enough to hand to implementation.",
    example: "Adding analytics, ads and attribution can change startup time, privacy disclosures and event quality. Those are launch risks, not just plugin tasks.",
    decisionRule: "No paid traffic before consent, event validation and store disclosure risks are reviewed.",
    lab: "Write an SDK readiness checklist: SDKs, purpose, data collected, consent need, event validation and rollback plan.",
    planUpdate: "Add SDK/privacy readiness notes to tracking.",
    quiz: {
      question: "Day 26: Why treat SDK choices as architecture decisions?",
      options: [
        "They affect data, privacy, performance and launch risk",
        "They are invisible to users and stores",
        "They never change app behavior",
        "They replace event taxonomy"
      ],
      answer: 0,
      explanation: "SDKs influence compliance, measurement quality and runtime behavior."
    },
    checks: [
      "List SDKs and purpose.",
      "Write data/consent risk per SDK.",
      "Define event validation before campaign launch.",
      "Update tracking checklist."
    ]
  },
  {
    day: 27,
    title: "Post-mortem and learning log",
    module: "Week 4 - Campaign operation",
    summary: "Document what each UA test taught about product, creative, store and market.",
    stages: ["prototype", "live"],
    difficulty: "Practical",
    terms: ["Cohort", "Creative testing", "UA"],
    artifact: "Learning log entry",
    planField: "successCriteria",
    caseIds: ["micro-budget-false-positive"],
    toolIds: [],
    outcome: "Turn every test into reusable knowledge instead of a yes/no memory.",
    core: "Small teams lose learning when decisions are not logged. A learning log captures hypothesis, setup, metrics, confidence, interpretation and next action. It also prevents the team from retesting the same vague idea later.",
    example: "Instead of 'hook A won', write 'satisfying clear hook had stronger IPM but weak D1, so it may attract curiosity without enough first-session proof.'",
    decisionRule: "A post-mortem must say which assumption changed.",
    lab: "Write a learning log template and fill it with one hypothetical Week 1-3 test result.",
    planUpdate: "Add reporting cadence and learning log expectation to success criteria.",
    quiz: {
      question: "Day 27: What is the most important output of a post-mortem?",
      options: [
        "Which assumption changed and what action follows",
        "A longer list of dashboards",
        "A blame assignment",
        "A promise to spend more immediately"
      ],
      answer: 0,
      explanation: "Learning is reusable only when assumptions and actions are explicit."
    },
    checks: [
      "Create a learning log template.",
      "Fill one hypothetical test result.",
      "Write which assumption changed.",
      "Update success criteria or next-action notes."
    ]
  },
  {
    day: 28,
    title: "Weekly UA operating rhythm",
    module: "Week 4 - Campaign operation",
    summary: "Create a weekly cadence for creative production, reporting, build changes and decisions.",
    stages: ["prototype", "live"],
    difficulty: "Practical",
    terms: ["Campaign", "ROAS", "Soft launch"],
    artifact: "Weekly operating cadence",
    planField: "nextAction",
    caseIds: ["idle-creative-spike", "privacy-sdk-readiness"],
    toolIds: ["testBudget"],
    outcome: "Plan a repeatable operating loop for a small Unity team.",
    core: "UA operation is a rhythm: choose question, ship build/store changes, launch assets, read signal, decide, log learning and prepare the next sprint. For indie teams, cadence matters because production time is the bottleneck.",
    example: "Monday choose decision, Tuesday export creatives, Wednesday launch, Friday read early signal, next Monday decide whether the build or creative changes.",
    decisionRule: "A cadence is valid only if it names owner, deadline and decision meeting.",
    lab: "Write a weekly cadence with day-by-day responsibilities for build, creative, reporting and decision.",
    planUpdate: "Add the immediate next action and weekly cadence.",
    quiz: {
      question: "Day 28: What makes a weekly UA rhythm practical for a small team?",
      options: [
        "Owners, deadlines and decision points are named",
        "Every task waits for perfect data",
        "Creative production has no limit",
        "Reports are written only when results are good"
      ],
      answer: 0,
      explanation: "Small teams need cadence that turns learning into scheduled action."
    },
    checks: [
      "Write a weekly cadence.",
      "Assign owner/deadline for build, creative and report tasks.",
      "Add next decision meeting.",
      "Update next action."
    ]
  },
  {
    day: 29,
    title: "Build the one-page UA launch plan",
    module: "Capstone",
    summary: "Assemble hypothesis, audience, tracking, creative, budget and decision rules into one page.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Practical",
    terms: ["UA", "Soft launch", "Event taxonomy"],
    artifact: "One-page launch plan",
    planField: "nextAction",
    caseIds: ["micro-budget-false-positive", "puzzle-onboarding-leak"],
    toolIds: ["sampleSize", "testBudget", "breakEvenCpi"],
    outcome: "Produce a launch plan that can guide the first micro soft-launch.",
    core: "The capstone is not a long strategy deck. It is a one-page operating plan: who the game is for, what promise is tested, how the build measures it, what assets run, how much is spent and what decision rules apply.",
    example: "For puzzle, the page should make it obvious whether the next sprint is creative production, tracking validation, store cleanup or campaign launch.",
    decisionRule: "If a plan field does not affect a launch decision, shorten it.",
    lab: "Fill every Final UA Plan field and cut each field until the preview fits one readable page.",
    planUpdate: "Complete all plan fields, especially next action.",
    quiz: {
      question: "Day 29: What should the capstone plan optimize for?",
      options: [
        "A clear first test and decision rules",
        "Maximum length and every possible idea",
        "A guaranteed ROAS target",
        "Only creative inspiration"
      ],
      answer: 0,
      explanation: "The plan should guide a real first test."
    },
    checks: [
      "Fill every Final UA Plan field.",
      "Remove details that do not affect launch decisions.",
      "Check budget, tracking and creative are aligned.",
      "Write the first next action."
    ]
  },
  {
    day: 30,
    title: "Stress-test risks and choose next action",
    module: "Capstone",
    summary: "Review weak assumptions, measurement risks and the smallest real-world next step.",
    stages: ["idea", "prototype", "live"],
    difficulty: "Practical",
    terms: ["Payback window", "ROAS", "Retention"],
    artifact: "Risk register and next action",
    planField: "nextAction",
    caseIds: ["privacy-sdk-readiness", "live-roas-shortfall"],
    toolIds: ["cohortReadout", "breakEvenCpi"],
    outcome: "Leave the course with one concrete next action and a risk register.",
    core: "The final review should attack the plan. Look for weak assumptions: the promise may be unclear, tracking may be incomplete, store proof may be weak, budget may underfeed variants, or monetization may not support CPI.",
    example: "If the strongest risk is event validation, the next action is not launching ads. It is running a build QA checklist and verifying events before spend.",
    decisionRule: "The next action must be small, dated and measurable.",
    lab: "Write top five risks, mitigation for each and the smallest next action with owner/date.",
    planUpdate: "Finalize next action, kill criteria and risk notes.",
    quiz: {
      question: "Day 30: What makes the final next action strong?",
      options: [
        "It is small, dated and measurable",
        "It says 'improve UA' generally",
        "It depends on perfect data",
        "It avoids naming a risk"
      ],
      answer: 0,
      explanation: "A concrete next action makes the course operational."
    },
    checks: [
      "Write top five launch risks.",
      "Add mitigation for each risk.",
      "Choose one smallest next action with date/owner.",
      "Finalize the one-page plan."
    ]
  }
];

const cases = [
  {
    id: "puzzle-onboarding-leak",
    title: "Puzzle soft-launch: cheap installs, weak D1",
    tags: ["puzzle", "retention", "prototype"],
    context: "A calming block puzzle gets affordable Android installs, but many users leave before completing the third board.",
    metrics: "CPI $0.42, CTR 1.8%, store CVR 32%, tutorial_complete 54%, D1 22%, D7 4%",
    recommendation: "Pause scale and fix first-session proof before producing more traffic.",
    reason: "Acquisition is promising, but the cohort fails before the game proves its core promise.",
    decision: "Fix onboarding/level pacing, then rerun the same best hook to isolate product change."
  },
  {
    id: "puzzle-store-mismatch",
    title: "Puzzle ad hook wins clicks, store loses installs",
    tags: ["puzzle", "store", "creative"],
    context: "A satisfying-clear video earns clicks, but the store page shows old menu screenshots and no clear gameplay proof.",
    metrics: "CTR 3.9%, CVR 11%, CPI $1.10, D1 29%, first screenshot shows meta menu",
    recommendation: "Update store assets before blaming traffic quality.",
    reason: "The ad creates interest, but store continuity breaks the promise.",
    decision: "Replace first screenshot and short description, then retest the same creative."
  },
  {
    id: "idle-creative-spike",
    title: "Idle RPG creative spike with stable cohorts",
    tags: ["idle", "creative", "scale"],
    context: "A combat-progression hook beats economy-focused creatives and retained users monetize at the same rate.",
    metrics: "IPM 18 vs account avg 7, CPI $0.65, D1 38%, D7 16%, early ROAS direction stable",
    recommendation: "Scale cautiously and produce variants around the same motivation.",
    reason: "Creative signal and cohort quality both support a controlled scale test.",
    decision: "Increase daily cap gradually and build three variants around combat progression."
  },
  {
    id: "hybrid-cheap-traffic",
    title: "Hybrid-casual runner: low CPI, low intent",
    tags: ["hybrid-casual", "audience", "quality"],
    context: "A fast fail compilation gets cheap installs but players churn before seeing meta progression.",
    metrics: "CPI $0.28, CTR 2.6%, level_3_reach 31%, D1 18%, rewarded_ad_watched 5%",
    recommendation: "Treat cheap traffic as low-intent until first-session depth improves.",
    reason: "The ad may be attracting curiosity clicks rather than the intended player motivation.",
    decision: "Test a progression hook and improve early depth before increasing spend."
  },
  {
    id: "live-roas-shortfall",
    title: "Live puzzle game: retention acceptable, ROAS short",
    tags: ["live", "roas", "monetization"],
    context: "A puzzle game has acceptable early retention but weak rewarded-ad engagement and slow payback.",
    metrics: "CPI $0.80, D1 34%, D7 16%, D7 ROAS 8%, target direction 15-20%",
    recommendation: "Do not scale yet; test monetization placement and lower-cost creative angles.",
    reason: "Retention is not the main blocker, but economics do not support scale.",
    decision: "Run monetization UX changes and retest with the same audience."
  },
  {
    id: "privacy-sdk-readiness",
    title: "SDK readiness blocks launch",
    tags: ["privacy", "sdk", "tracking"],
    context: "The team added analytics, ads and attribution SDKs, but event names differ between builds and store data disclosure is incomplete.",
    metrics: "first_open duplicated, tutorial_complete missing on Android 14 test device, consent copy not reviewed",
    recommendation: "Delay paid traffic until event validation and disclosure review are complete.",
    reason: "Bad measurement creates false campaign decisions and store/privacy risk.",
    decision: "Run SDK readiness checklist and lock taxonomy before launch."
  },
  {
    id: "micro-budget-false-positive",
    title: "Micro-budget false positive",
    tags: ["budget", "sample-size", "decision"],
    context: "One creative looks like a winner after 18 installs, but the next day its retention regresses toward the group average.",
    metrics: "Creative A: 18 installs, D1 44%; Creative B: 72 installs, D1 31%; group D1 30%",
    recommendation: "Log the signal as interesting but avoid scale until more installs or repeated evidence exists.",
    reason: "Tiny cohorts can exaggerate wins and losses.",
    decision: "Reduce variant count and rerun the top two concepts with clearer sample expectations."
  }
];

const calculators = [
  {
    id: "sampleSize",
    name: "Sample-size sanity check",
    description: "Estimate whether a micro budget can feed the number of creative cells you want to test.",
    fields: [
      { label: "Budget ($)", key: "budget", default: 300 },
      { label: "Expected CPI ($)", key: "cpi", default: 0.6 },
      { label: "Creative cells", key: "cells", default: 6 }
    ]
  },
  {
    id: "breakEvenCpi",
    name: "Break-even CPI guardrail",
    description: "Estimate a rough CPI ceiling from LTV and gross margin assumptions.",
    fields: [
      { label: "Rough LTV ($)", key: "ltv", default: 1.2 },
      { label: "Gross margin", key: "grossMargin", default: 0.7 }
    ]
  },
  {
    id: "testBudget",
    name: "Creative test budget",
    description: "Estimate spend needed for first-pass creative learning.",
    fields: [
      { label: "Expected CPI ($)", key: "cpi", default: 0.6 },
      { label: "Installs per cell", key: "installsPerCreative", default: 50 },
      { label: "Creative cells", key: "creatives", default: 6 }
    ]
  },
  {
    id: "cohortReadout",
    name: "D1/D7 cohort readout",
    description: "Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.",
    fields: [
      { label: "Installs", key: "installs", default: 300 },
      { label: "D1 returning users", key: "d1Users", default: 90 },
      { label: "D7 returning users", key: "d7Users", default: 45 },
      { label: "Spend ($)", key: "spend", default: 180 },
      { label: "D7 revenue ($)", key: "revenueD7", default: 25 }
    ]
  }
];

const glossary = [
  ["UA", "User Acquisition", "Cach dua nguoi choi moi vao game bang paid, organic, store va product loops.", "n/a"],
  ["Funnel", "Funnel", "Chuoi hanh vi tu impression den install, first session, return va revenue.", "n/a"],
  ["CPI", "Cost per install", "Chi phi trung binh de co mot install.", "Spend / Installs"],
  ["CTR", "Click-through rate", "Ty le nguoi click sau khi thay quang cao.", "Clicks / Impressions"],
  ["CVR", "Conversion rate", "Ty le chuyen doi, thuong la click sang install hoac store view sang install.", "Installs / Clicks"],
  ["IPM", "Installs per mille", "So install tren 1000 impressions, dung de doc creative efficiency.", "Installs / Impressions * 1000"],
  ["Retention", "Retention", "Ty le nguoi choi quay lai sau mot khoang thoi gian.", "Returning users / Cohort size"],
  ["Cohort", "Cohort", "Nhom user cung ngay install, channel, creative hoac dieu kien test.", "n/a"],
  ["ARPDAU", "Average revenue per daily active user", "Doanh thu trung binh tren moi active user trong ngay.", "Daily revenue / DAU"],
  ["LTV", "Lifetime value", "Gia tri ky vong mot user tao ra trong vong doi su dung game.", "Revenue per user over lifetime"],
  ["ROAS", "Return on ad spend", "Doanh thu attributed so voi spend trong mot time window.", "Attributed revenue / Spend"],
  ["Payback window", "Payback window", "Khoang thoi gian ky vong campaign thu hoi du chi phi.", "n/a"],
  ["Soft launch", "Soft launch", "Ra mat gioi han de hoc truoc khi scale rong.", "n/a"],
  ["Genre-market fit", "Genre-market fit", "Do phu hop giua genre, audience, monetization va kha nang san xuat.", "n/a"],
  ["Creative testing", "Creative testing", "Thu nghiem hook/format/variant de hoc dong luc nao keo user chat luong.", "n/a"],
  ["Creative fatigue", "Creative fatigue", "Khi asset quang cao giam hieu qua do lap lai hoac het audience phu hop.", "n/a"],
  ["Playable ad", "Playable ad", "Quang cao co trai nghiem tuong tac mo phong gameplay.", "n/a"],
  ["ASO", "App Store Optimization", "Toi uu store listing de tang discoverability va install conversion.", "n/a"],
  ["Campaign", "Campaign", "Cau truc chay ads gom muc tieu, budget, channel, audience va creatives.", "n/a"],
  ["Event taxonomy", "Event taxonomy", "He thong ten event va parameter on dinh phuc vu measurement.", "n/a"],
  ["Attribution", "Attribution", "Gan install/event/revenue ve nguon quang cao hoac channel.", "n/a"],
  ["ATT", "App Tracking Transparency", "Co che iOS yeu cau user consent cho cross-app tracking.", "n/a"],
  ["SKAN", "SKAdNetwork", "He thong attribution bao ve privacy cua Apple cho install va post-install signal.", "n/a"],
  ["AdAttributionKit", "AdAttributionKit", "Framework attribution cua Apple can hieu trong boi canh iOS privacy.", "n/a"],
  ["Sample size", "Sample size", "So observation/install du de doc signal voi do tin cay phu hop.", "n/a"],
  ["Hook", "Hook", "Loi hua/angle dau tien trong creative de keo su chu y cua player.", "n/a"],
  ["Store listing", "Store listing", "Trang store gom icon, screenshot, video, title, description va disclosure.", "n/a"],
  ["Onboarding", "Onboarding", "Trai nghiem dau tien giup player hieu va cam gia tri cua game.", "n/a"],
  ["Data safety", "Data safety", "Thong tin store/conpliance ve du lieu app thu thap va chia se.", "n/a"]
].map(([term, en, vi, formula]) => ({ term, en, vi, formula }));

function planFieldLabel(key) {
  return {
    hypothesis: "giả thuyết game",
    audience: "chân dung người chơi",
    metricTargets: "mốc metric quyết định",
    tracking: "tracking và event taxonomy",
    creativeMatrix: "creative matrix",
    budget: "ngân sách micro test",
    successCriteria: "tiêu chí scale/iterate",
    killCriteria: "điều kiện pause/kill",
    nextAction: "hành động tiếp theo"
  }[key] || "UA plan";
}

function vietnameseLead(lesson) {
  return `Bài này dùng **${lesson.artifact}** để làm rõ phần **${planFieldLabel(lesson.planField)}** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.`;
}
function lessonMarkdown(lesson) {
  const refs = lesson.referenceIds
    .map((id) => references.find((item) => item.id === id))
    .filter(Boolean);
  const caseLines = lesson.caseIds
    .map((id) => cases.find((item) => item.id === id))
    .filter(Boolean)
    .map((item) => `- ${item.title}: ${item.recommendation}`)
    .join("\n");
  const toolLines = lesson.toolIds
    .map((id) => calculators.find((item) => item.id === id))
    .filter(Boolean)
    .map((item) => `- ${item.name}: ${item.description}`)
    .join("\n");
  const refLines = refs.map((item) => `- ${item.title}: ${item.url}`).join("\n");

  return `---
day: ${lesson.day}
title: "${lesson.title}"
module: "${lesson.module}"
stages: [${lesson.stages.join(", ")}]
related_terms: [${lesson.glossaryTerms.join(", ")}]
artifact: "${lesson.artifact}"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **${lesson.artifact}** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
${vietnameseLead(lesson)}

${lesson.core}

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

${lesson.example}

## Decision Rule
Quy tắc quyết định cho bài này:

${lesson.decisionRule}

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

${lesson.lab}

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

${lesson.planUpdate}

## Checklist Focus
${lesson.checks.map((item) => `- ${item}`).join("\n")}

## Case / Tool Link
${caseLines || "- Khong co case rieng cho bai nay; ap dung truc tiep vao game cua ban."}
${toolLines ? `\n${toolLines}` : ""}

## English Terms You Should Keep
${lesson.glossaryTerms.map((term) => `- **${term}**`).join("\n")}

## Curated References
${refLines || "- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab."}

> Practical rule: ${lesson.decisionRule}
`;
}

for (const lesson of lessons) {
  lesson.estimatedMinutes = 30;
  lesson.glossaryTerms = lesson.terms;
  lesson.quizId = `q${String(lesson.day).padStart(2, "0")}`;
  lesson.checklistId = `c${String(lesson.day).padStart(2, "0")}`;
  lesson.markdown = `lessons/day-${String(lesson.day).padStart(2, "0")}.md`;
  lesson.learningOutcome = lesson.outcome;
  lesson.referenceIds = [...new Set([...(lesson.referenceIds || []), ...(moduleRefs[lesson.module] || [])])];
  lesson.content = {
    core: lesson.core,
    example: lesson.example,
    decisionRule: lesson.decisionRule,
    lab: lesson.lab,
    planUpdate: lesson.planUpdate
  };
  delete lesson.terms;
  delete lesson.core;
  delete lesson.example;
  delete lesson.decisionRule;
  delete lesson.lab;
  delete lesson.planUpdate;
  delete lesson.outcome;
}

const courseLessons = lessons.map(({ quiz, checks, content, ...lesson }) => lesson);

const course = {
  meta: {
    title: "30-Day UA Marketing Bootcamp for Unity Indie Developers",
    audience: "Unity indie/dev preparing an Android-first, iOS-aware mobile puzzle micro soft-launch.",
    capstone: "One-page UA / soft-launch plan for a $100-500 test.",
    format: "25-35 minute workshop lessons with decision artifacts."
  },
  references,
  lessons: courseLessons
};

const quizzes = Object.fromEntries(lessons.map((lesson) => [lesson.quizId, lesson.quiz]));
const checklists = Object.fromEntries(lessons.map((lesson) => [lesson.checklistId, lesson.checks]));

mkdirSync(lessonRoot, { recursive: true });
writeJson("course.json", course);
writeJson("quizzes.json", quizzes);
writeJson("checklists.json", checklists);
writeJson("calculators.json", calculators);
writeJson("cases.json", cases);
writeJson("glossary.json", glossary);

for (const sourceLesson of lessons) {
  const lesson = {
    ...course.lessons.find((item) => item.day === sourceLesson.day),
    checks: sourceLesson.checks,
    quiz: sourceLesson.quiz,
    core: sourceLesson.content.core,
    example: sourceLesson.content.example,
    decisionRule: sourceLesson.content.decisionRule,
    lab: sourceLesson.content.lab,
    planUpdate: sourceLesson.content.planUpdate
  };
  writeFileSync(join(contentRoot, lesson.markdown), lessonMarkdown(lesson), "utf8");
}

writeSeed();

function writeJson(file, value) {
  writeFileSync(join(contentRoot, file), `${JSON.stringify(value, null, 2)}\n`, "utf8");
}

function sqlString(value) {
  return value.replaceAll("'", "''");
}

function writeSeed() {
  const rows = [];
  for (const file of ["course.json", "glossary.json", "quizzes.json", "calculators.json", "checklists.json", "cases.json"]) {
    const json = JSON.stringify(JSON.parse(readGenerated(file)), null, 2);
    rows.push(`  ('${file}', 'json', '${sqlString(json)}'::jsonb, null, now())`);
  }
  for (const lesson of course.lessons) {
    const text = readGenerated(lesson.markdown);
    rows.push(`  ('${lesson.markdown}', 'markdown', null, '${sqlString(text)}', now())`);
  }

  const seed = `-- Seed UA Marketing course content into Supabase.
-- Run supabase-schema.sql first, then this file.

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
${rows.join(",\n")}
on conflict (content_key) do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = excluded.updated_at;

commit;
`;
  writeFileSync(join(root, "supabase-content-seed.sql"), seed, "utf8");
}

function readGenerated(file) {
  return readFileSync(join(contentRoot, file), "utf8");
}



