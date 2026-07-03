-- Seed UA Marketing course content into Supabase.
-- Run supabase-schema.sql first, then this file.

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
  ('course.json', 'json', '{
  "meta": {
    "title": "30-Day UA Marketing Bootcamp for Unity Indie Developers",
    "audience": "Unity indie/dev preparing an Android-first, iOS-aware mobile puzzle micro soft-launch.",
    "capstone": "One-page UA / soft-launch plan for a $100-500 test.",
    "format": "25-35 minute workshop lessons with decision artifacts."
  },
  "references": [
    {
      "id": "android-attribution",
      "title": "Android Attribution Reporting for mobile",
      "url": "https://privacysandbox.google.com/private-advertising/attribution-reporting/android",
      "note": "Privacy-preserving attribution design for Android apps and app-to-web measurement."
    },
    {
      "id": "admob-unity-privacy",
      "title": "Google AdMob Unity privacy strategies",
      "url": "https://developers.google.com/admob/unity/privacy/strategies",
      "note": "Unity-specific consent and privacy implementation considerations for ad monetization."
    },
    {
      "id": "apple-adattributionkit",
      "title": "Apple AdAttributionKit",
      "url": "https://developer.apple.com/documentation/AdAttributionKit",
      "note": "Apple attribution framework to understand alongside ATT and SKAN-era signal loss."
    },
    {
      "id": "google-play-data-safety",
      "title": "Google Play Data safety",
      "url": "https://support.google.com/googleplay/android-developer/answer/10787469",
      "note": "Disclosure thinking for SDKs, data collection, and store readiness."
    }
  ],
  "lessons": [
    {
      "day": 1,
      "title": "UA as a product learning loop",
      "module": "Week 1 - UA fundamentals",
      "summary": "Frame UA as a build-measure-learn loop between ad promise, store page, onboarding and metrics.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "UA learning loop map",
      "planField": "hypothesis",
      "caseIds": [
        "puzzle-onboarding-leak"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "UA",
        "Funnel",
        "CPI"
      ],
      "quizId": "q01",
      "checklistId": "c01",
      "markdown": "lessons/day-01.md",
      "learningOutcome": "Explain what your first UA test is trying to learn before any spend is committed.",
      "referenceIds": []
    },
    {
      "day": 2,
      "title": "Puzzle market thesis and genre fit",
      "module": "Week 1 - UA fundamentals",
      "summary": "Turn genre, audience, region and monetization assumptions into a testable market thesis.",
      "stages": [
        "idea",
        "prototype"
      ],
      "difficulty": "Beginner",
      "artifact": "Puzzle market thesis",
      "planField": "audience",
      "caseIds": [
        "hybrid-cheap-traffic"
      ],
      "toolIds": [
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Genre-market fit",
        "CPI",
        "LTV"
      ],
      "quizId": "q02",
      "checklistId": "c02",
      "markdown": "lessons/day-02.md",
      "learningOutcome": "Define why this puzzle game has a reachable audience before choosing channels.",
      "referenceIds": []
    },
    {
      "day": 3,
      "title": "Audience motivation map",
      "module": "Week 1 - UA fundamentals",
      "summary": "Map player motivations into ad hooks, store proof and first-session expectations.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "Audience motivation map",
      "planField": "audience",
      "caseIds": [
        "puzzle-store-mismatch"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Audience",
        "Motivation",
        "Hook"
      ],
      "quizId": "q03",
      "checklistId": "c03",
      "markdown": "lessons/day-03.md",
      "learningOutcome": "Separate demographic guesses from behavior and motivation signals.",
      "referenceIds": []
    },
    {
      "day": 4,
      "title": "Funnel from impression to retained player",
      "module": "Week 1 - UA fundamentals",
      "summary": "Trace the complete funnel so CPI, CVR and retention are read as connected signals.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "Funnel leak map",
      "planField": "metricTargets",
      "caseIds": [
        "puzzle-store-mismatch",
        "puzzle-onboarding-leak"
      ],
      "toolIds": [
        "cohortReadout"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Funnel",
        "IPM",
        "CVR"
      ],
      "quizId": "q04",
      "checklistId": "c04",
      "markdown": "lessons/day-04.md",
      "learningOutcome": "Identify which part of the funnel is probably leaking from a simple metric pattern.",
      "referenceIds": []
    },
    {
      "day": 5,
      "title": "Micro soft-launch strategy",
      "module": "Week 1 - UA fundamentals",
      "summary": "Design a small launch test that reduces risk without pretending micro-budget data is perfect.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "Micro soft-launch outline",
      "planField": "budget",
      "caseIds": [
        "micro-budget-false-positive"
      ],
      "toolIds": [
        "sampleSize"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Soft launch",
        "Retention",
        "Cohort"
      ],
      "quizId": "q05",
      "checklistId": "c05",
      "markdown": "lessons/day-05.md",
      "learningOutcome": "Choose what a $100-500 test can and cannot decide.",
      "referenceIds": []
    },
    {
      "day": 6,
      "title": "Channel map for small Unity teams",
      "module": "Week 1 - UA fundamentals",
      "summary": "Compare Meta, Google, Unity/AppLovin-style networks, ASO and organic validation for a small test.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "Channel selection note",
      "planField": "budget",
      "caseIds": [
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Ad network",
        "Campaign",
        "Optimization"
      ],
      "quizId": "q06",
      "checklistId": "c06",
      "markdown": "lessons/day-06.md",
      "learningOutcome": "Choose a first channel based on learning goal, budget and creative readiness.",
      "referenceIds": []
    },
    {
      "day": 7,
      "title": "Week 1 synthesis: first UA hypothesis",
      "module": "Week 1 - UA fundamentals",
      "summary": "Compress audience, funnel, channel and budget assumptions into one testable hypothesis.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Beginner",
      "artifact": "First UA hypothesis card",
      "planField": "hypothesis",
      "caseIds": [
        "puzzle-onboarding-leak"
      ],
      "toolIds": [
        "sampleSize"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "UA",
        "Funnel",
        "Soft launch"
      ],
      "quizId": "q07",
      "checklistId": "c07",
      "markdown": "lessons/day-07.md",
      "learningOutcome": "Create a one-card hypothesis that can drive Week 2 measurement choices.",
      "referenceIds": []
    },
    {
      "day": 8,
      "title": "Metric map for puzzle UA",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Connect acquisition, retention, monetization and creative metrics into one decision map.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Metric decision map",
      "planField": "metricTargets",
      "caseIds": [
        "live-roas-shortfall"
      ],
      "toolIds": [
        "cohortReadout",
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "CPI",
        "Retention",
        "ARPDAU"
      ],
      "quizId": "q08",
      "checklistId": "c08",
      "markdown": "lessons/day-08.md",
      "learningOutcome": "Know which metric answers which business or product question.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 9,
      "title": "CPI, CTR, CVR and IPM without vanity traps",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Read acquisition efficiency while avoiding decisions from surface metrics alone.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Acquisition signal readout",
      "planField": "metricTargets",
      "caseIds": [
        "puzzle-store-mismatch",
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "CPI",
        "CTR",
        "CVR",
        "IPM"
      ],
      "quizId": "q09",
      "checklistId": "c09",
      "markdown": "lessons/day-09.md",
      "learningOutcome": "Diagnose whether an acquisition metric points to creative, store or audience issues.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 10,
      "title": "Retention cohorts and first-session proof",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Use D1/D7 and early funnel behavior to judge whether players found value.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "First-session proof checklist",
      "planField": "tracking",
      "caseIds": [
        "puzzle-onboarding-leak"
      ],
      "toolIds": [
        "cohortReadout"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Retention",
        "Cohort",
        "Onboarding"
      ],
      "quizId": "q10",
      "checklistId": "c10",
      "markdown": "lessons/day-10.md",
      "learningOutcome": "Connect retention movement to onboarding, level pacing and promise delivery.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 11,
      "title": "ARPDAU, LTV and payback for ads plus light IAP",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Estimate economic ceiling without pretending early LTV is precise.",
      "stages": [
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Rough economics note",
      "planField": "metricTargets",
      "caseIds": [
        "live-roas-shortfall"
      ],
      "toolIds": [
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ARPDAU",
        "LTV",
        "Payback window"
      ],
      "quizId": "q11",
      "checklistId": "c11",
      "markdown": "lessons/day-11.md",
      "learningOutcome": "Use rough LTV logic to set guardrails for spend and payback windows.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 12,
      "title": "ROAS windows and signal delay",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Define how soon a campaign must show enough signal without overreacting to delayed revenue.",
      "stages": [
        "live"
      ],
      "difficulty": "Core",
      "artifact": "ROAS decision window",
      "planField": "successCriteria",
      "caseIds": [
        "live-roas-shortfall",
        "micro-budget-false-positive"
      ],
      "toolIds": [
        "cohortReadout"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ROAS",
        "LTV",
        "Payback window"
      ],
      "quizId": "q12",
      "checklistId": "c12",
      "markdown": "lessons/day-12.md",
      "learningOutcome": "Write scale/hold/kill rules that respect measurement delay.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 13,
      "title": "Attribution, ATT, SKAN and Android privacy signals",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Understand why mobile measurement is incomplete and how to make decisions with partial signal.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Measurement risk note",
      "planField": "tracking",
      "caseIds": [
        "privacy-sdk-readiness"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Attribution",
        "ATT",
        "SKAN"
      ],
      "quizId": "q13",
      "checklistId": "c13",
      "markdown": "lessons/day-13.md",
      "learningOutcome": "Explain signal loss and document how it affects your test decisions.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 14,
      "title": "Event taxonomy for Unity games",
      "module": "Week 2 - Metrics and measurement",
      "summary": "Choose conceptual events before SDK implementation so UA decisions have usable logs.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Unity event taxonomy v1",
      "planField": "tracking",
      "caseIds": [
        "privacy-sdk-readiness"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Event taxonomy",
        "Attribution",
        "Cohort"
      ],
      "quizId": "q14",
      "checklistId": "c14",
      "markdown": "lessons/day-14.md",
      "learningOutcome": "Draft a lean event taxonomy that supports UA decisions without over-logging.",
      "referenceIds": [
        "android-attribution",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 15,
      "title": "Creative hooks from player motivation",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Turn player motivations into ad hooks that can be tested cleanly.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Hook bank",
      "planField": "creativeMatrix",
      "caseIds": [
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Creative testing",
        "CTR",
        "IPM"
      ],
      "quizId": "q15",
      "checklistId": "c15",
      "markdown": "lessons/day-15.md",
      "learningOutcome": "Create a small hook bank that tests motivations rather than random visuals.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 16,
      "title": "Video, static and playable concepts",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Choose ad formats based on clarity, production cost and what the test needs to learn.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Format selection matrix",
      "planField": "creativeMatrix",
      "caseIds": [
        "hybrid-cheap-traffic"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Playable ad",
        "Creative testing",
        "IPM"
      ],
      "quizId": "q16",
      "checklistId": "c16",
      "markdown": "lessons/day-16.md",
      "learningOutcome": "Pick first creative formats without overproducing assets.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 17,
      "title": "Creative test matrix",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Design variants so each test has one learning goal and a clear interpretation.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Creative test matrix v1",
      "planField": "creativeMatrix",
      "caseIds": [
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget",
        "sampleSize"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Creative testing",
        "CTR",
        "CVR"
      ],
      "quizId": "q17",
      "checklistId": "c17",
      "markdown": "lessons/day-17.md",
      "learningOutcome": "Build a small matrix of hooks, variants, metric reads and actions.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 18,
      "title": "ASO and store promise continuity",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Align icon, screenshots, title and description with the ad promise before buying traffic.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Store promise checklist",
      "planField": "creativeMatrix",
      "caseIds": [
        "puzzle-store-mismatch"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ASO",
        "CVR",
        "Store listing"
      ],
      "quizId": "q18",
      "checklistId": "c18",
      "markdown": "lessons/day-18.md",
      "learningOutcome": "Audit the store page as part of the UA funnel, not as a separate branding task.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 19,
      "title": "Competitor teardown without copying",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Analyze competitor store pages and creatives to find testable patterns, not clone work.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Competitor teardown sheet",
      "planField": "audience",
      "caseIds": [
        "puzzle-store-mismatch"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Genre-market fit",
        "ASO",
        "Creative testing"
      ],
      "quizId": "q19",
      "checklistId": "c19",
      "markdown": "lessons/day-19.md",
      "learningOutcome": "Extract market patterns while preserving your game''s own promise.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 20,
      "title": "Creative fatigue and iteration cadence",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Recognize when a creative stops learning, stops scaling or needs a new angle.",
      "stages": [
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Creative iteration rule",
      "planField": "successCriteria",
      "caseIds": [
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Creative fatigue",
        "CTR",
        "ROAS"
      ],
      "quizId": "q20",
      "checklistId": "c20",
      "markdown": "lessons/day-20.md",
      "learningOutcome": "Write rules for refreshing creatives without reacting to every noisy day.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 21,
      "title": "Week 3 synthesis: creative and store readiness",
      "module": "Week 3 - Creative and store readiness",
      "summary": "Prepare the minimum creative set and store checklist for a real micro soft-launch.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Core",
      "artifact": "Creative readiness packet",
      "planField": "creativeMatrix",
      "caseIds": [
        "puzzle-store-mismatch",
        "idle-creative-spike"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ASO",
        "Creative testing",
        "Soft launch"
      ],
      "quizId": "q21",
      "checklistId": "c21",
      "markdown": "lessons/day-21.md",
      "learningOutcome": "Finish a ready-to-test packet: hooks, variants, store proof and acceptance rules.",
      "referenceIds": [
        "google-play-data-safety"
      ]
    },
    {
      "day": 22,
      "title": "Campaign structure for a micro test",
      "module": "Week 4 - Campaign operation",
      "summary": "Structure the first campaign around one learning goal, limited budget and readable reporting.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Campaign structure note",
      "planField": "budget",
      "caseIds": [
        "micro-budget-false-positive"
      ],
      "toolIds": [
        "sampleSize",
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Campaign",
        "Ad set",
        "ROAS"
      ],
      "quizId": "q22",
      "checklistId": "c22",
      "markdown": "lessons/day-22.md",
      "learningOutcome": "Create a first campaign structure that does not fragment signal.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 23,
      "title": "Budget and sample-size sanity",
      "module": "Week 4 - Campaign operation",
      "summary": "Avoid conclusions from tiny data while keeping spend controlled.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Budget sanity sheet",
      "planField": "budget",
      "caseIds": [
        "micro-budget-false-positive"
      ],
      "toolIds": [
        "sampleSize",
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "CPI",
        "Cohort",
        "Sample size"
      ],
      "quizId": "q23",
      "checklistId": "c23",
      "markdown": "lessons/day-23.md",
      "learningOutcome": "Estimate whether the budget can support the decision you want to make.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 24,
      "title": "Reading campaign reports",
      "module": "Week 4 - Campaign operation",
      "summary": "Separate creative signal, audience signal, store signal and product signal in a simple report.",
      "stages": [
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Report readout template",
      "planField": "successCriteria",
      "caseIds": [
        "puzzle-store-mismatch",
        "puzzle-onboarding-leak",
        "live-roas-shortfall"
      ],
      "toolIds": [
        "cohortReadout"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "CTR",
        "IPM",
        "Retention",
        "ROAS"
      ],
      "quizId": "q24",
      "checklistId": "c24",
      "markdown": "lessons/day-24.md",
      "learningOutcome": "Write a report readout that recommends one action instead of listing metrics.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 25,
      "title": "Scale, iterate or kill decision rules",
      "module": "Week 4 - Campaign operation",
      "summary": "Use predefined rules to reduce emotional campaign decisions.",
      "stages": [
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Scale-iterate-kill rules",
      "planField": "killCriteria",
      "caseIds": [
        "live-roas-shortfall",
        "idle-creative-spike"
      ],
      "toolIds": [
        "cohortReadout",
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ROAS",
        "Retention",
        "Creative testing"
      ],
      "quizId": "q25",
      "checklistId": "c25",
      "markdown": "lessons/day-25.md",
      "learningOutcome": "Write decision rules before seeing the report.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 26,
      "title": "SDK, privacy and store-risk readiness",
      "module": "Week 4 - Campaign operation",
      "summary": "Treat ad, analytics and attribution SDKs as product architecture and compliance decisions.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "SDK readiness checklist",
      "planField": "tracking",
      "caseIds": [
        "privacy-sdk-readiness"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "ATT",
        "SKAN",
        "Event taxonomy"
      ],
      "quizId": "q26",
      "checklistId": "c26",
      "markdown": "lessons/day-26.md",
      "learningOutcome": "Identify SDK/data risks before public testing.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 27,
      "title": "Post-mortem and learning log",
      "module": "Week 4 - Campaign operation",
      "summary": "Document what each UA test taught about product, creative, store and market.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Learning log entry",
      "planField": "successCriteria",
      "caseIds": [
        "micro-budget-false-positive"
      ],
      "toolIds": [],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Cohort",
        "Creative testing",
        "UA"
      ],
      "quizId": "q27",
      "checklistId": "c27",
      "markdown": "lessons/day-27.md",
      "learningOutcome": "Turn every test into reusable knowledge instead of a yes/no memory.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 28,
      "title": "Weekly UA operating rhythm",
      "module": "Week 4 - Campaign operation",
      "summary": "Create a weekly cadence for creative production, reporting, build changes and decisions.",
      "stages": [
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Weekly operating cadence",
      "planField": "nextAction",
      "caseIds": [
        "idle-creative-spike",
        "privacy-sdk-readiness"
      ],
      "toolIds": [
        "testBudget"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Campaign",
        "ROAS",
        "Soft launch"
      ],
      "quizId": "q28",
      "checklistId": "c28",
      "markdown": "lessons/day-28.md",
      "learningOutcome": "Plan a repeatable operating loop for a small Unity team.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy"
      ]
    },
    {
      "day": 29,
      "title": "Build the one-page UA launch plan",
      "module": "Capstone",
      "summary": "Assemble hypothesis, audience, tracking, creative, budget and decision rules into one page.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "One-page launch plan",
      "planField": "nextAction",
      "caseIds": [
        "micro-budget-false-positive",
        "puzzle-onboarding-leak"
      ],
      "toolIds": [
        "sampleSize",
        "testBudget",
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "UA",
        "Soft launch",
        "Event taxonomy"
      ],
      "quizId": "q29",
      "checklistId": "c29",
      "markdown": "lessons/day-29.md",
      "learningOutcome": "Produce a launch plan that can guide the first micro soft-launch.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy",
        "apple-adattributionkit"
      ]
    },
    {
      "day": 30,
      "title": "Stress-test risks and choose next action",
      "module": "Capstone",
      "summary": "Review weak assumptions, measurement risks and the smallest real-world next step.",
      "stages": [
        "idea",
        "prototype",
        "live"
      ],
      "difficulty": "Practical",
      "artifact": "Risk register and next action",
      "planField": "nextAction",
      "caseIds": [
        "privacy-sdk-readiness",
        "live-roas-shortfall"
      ],
      "toolIds": [
        "cohortReadout",
        "breakEvenCpi"
      ],
      "estimatedMinutes": 30,
      "glossaryTerms": [
        "Payback window",
        "ROAS",
        "Retention"
      ],
      "quizId": "q30",
      "checklistId": "c30",
      "markdown": "lessons/day-30.md",
      "learningOutcome": "Leave the course with one concrete next action and a risk register.",
      "referenceIds": [
        "android-attribution",
        "admob-unity-privacy",
        "apple-adattributionkit"
      ]
    }
  ]
}'::jsonb, null, now()),
  ('glossary.json', 'json', '[
  {
    "term": "UA",
    "en": "User Acquisition",
    "vi": "Cach dua nguoi choi moi vao game bang paid, organic, store va product loops.",
    "formula": "n/a"
  },
  {
    "term": "Funnel",
    "en": "Funnel",
    "vi": "Chuoi hanh vi tu impression den install, first session, return va revenue.",
    "formula": "n/a"
  },
  {
    "term": "CPI",
    "en": "Cost per install",
    "vi": "Chi phi trung binh de co mot install.",
    "formula": "Spend / Installs"
  },
  {
    "term": "CTR",
    "en": "Click-through rate",
    "vi": "Ty le nguoi click sau khi thay quang cao.",
    "formula": "Clicks / Impressions"
  },
  {
    "term": "CVR",
    "en": "Conversion rate",
    "vi": "Ty le chuyen doi, thuong la click sang install hoac store view sang install.",
    "formula": "Installs / Clicks"
  },
  {
    "term": "IPM",
    "en": "Installs per mille",
    "vi": "So install tren 1000 impressions, dung de doc creative efficiency.",
    "formula": "Installs / Impressions * 1000"
  },
  {
    "term": "Retention",
    "en": "Retention",
    "vi": "Ty le nguoi choi quay lai sau mot khoang thoi gian.",
    "formula": "Returning users / Cohort size"
  },
  {
    "term": "Cohort",
    "en": "Cohort",
    "vi": "Nhom user cung ngay install, channel, creative hoac dieu kien test.",
    "formula": "n/a"
  },
  {
    "term": "ARPDAU",
    "en": "Average revenue per daily active user",
    "vi": "Doanh thu trung binh tren moi active user trong ngay.",
    "formula": "Daily revenue / DAU"
  },
  {
    "term": "LTV",
    "en": "Lifetime value",
    "vi": "Gia tri ky vong mot user tao ra trong vong doi su dung game.",
    "formula": "Revenue per user over lifetime"
  },
  {
    "term": "ROAS",
    "en": "Return on ad spend",
    "vi": "Doanh thu attributed so voi spend trong mot time window.",
    "formula": "Attributed revenue / Spend"
  },
  {
    "term": "Payback window",
    "en": "Payback window",
    "vi": "Khoang thoi gian ky vong campaign thu hoi du chi phi.",
    "formula": "n/a"
  },
  {
    "term": "Soft launch",
    "en": "Soft launch",
    "vi": "Ra mat gioi han de hoc truoc khi scale rong.",
    "formula": "n/a"
  },
  {
    "term": "Genre-market fit",
    "en": "Genre-market fit",
    "vi": "Do phu hop giua genre, audience, monetization va kha nang san xuat.",
    "formula": "n/a"
  },
  {
    "term": "Creative testing",
    "en": "Creative testing",
    "vi": "Thu nghiem hook/format/variant de hoc dong luc nao keo user chat luong.",
    "formula": "n/a"
  },
  {
    "term": "Creative fatigue",
    "en": "Creative fatigue",
    "vi": "Khi asset quang cao giam hieu qua do lap lai hoac het audience phu hop.",
    "formula": "n/a"
  },
  {
    "term": "Playable ad",
    "en": "Playable ad",
    "vi": "Quang cao co trai nghiem tuong tac mo phong gameplay.",
    "formula": "n/a"
  },
  {
    "term": "ASO",
    "en": "App Store Optimization",
    "vi": "Toi uu store listing de tang discoverability va install conversion.",
    "formula": "n/a"
  },
  {
    "term": "Campaign",
    "en": "Campaign",
    "vi": "Cau truc chay ads gom muc tieu, budget, channel, audience va creatives.",
    "formula": "n/a"
  },
  {
    "term": "Event taxonomy",
    "en": "Event taxonomy",
    "vi": "He thong ten event va parameter on dinh phuc vu measurement.",
    "formula": "n/a"
  },
  {
    "term": "Attribution",
    "en": "Attribution",
    "vi": "Gan install/event/revenue ve nguon quang cao hoac channel.",
    "formula": "n/a"
  },
  {
    "term": "ATT",
    "en": "App Tracking Transparency",
    "vi": "Co che iOS yeu cau user consent cho cross-app tracking.",
    "formula": "n/a"
  },
  {
    "term": "SKAN",
    "en": "SKAdNetwork",
    "vi": "He thong attribution bao ve privacy cua Apple cho install va post-install signal.",
    "formula": "n/a"
  },
  {
    "term": "AdAttributionKit",
    "en": "AdAttributionKit",
    "vi": "Framework attribution cua Apple can hieu trong boi canh iOS privacy.",
    "formula": "n/a"
  },
  {
    "term": "Sample size",
    "en": "Sample size",
    "vi": "So observation/install du de doc signal voi do tin cay phu hop.",
    "formula": "n/a"
  },
  {
    "term": "Hook",
    "en": "Hook",
    "vi": "Loi hua/angle dau tien trong creative de keo su chu y cua player.",
    "formula": "n/a"
  },
  {
    "term": "Store listing",
    "en": "Store listing",
    "vi": "Trang store gom icon, screenshot, video, title, description va disclosure.",
    "formula": "n/a"
  },
  {
    "term": "Onboarding",
    "en": "Onboarding",
    "vi": "Trai nghiem dau tien giup player hieu va cam gia tri cua game.",
    "formula": "n/a"
  },
  {
    "term": "Data safety",
    "en": "Data safety",
    "vi": "Thong tin store/conpliance ve du lieu app thu thap va chia se.",
    "formula": "n/a"
  }
]'::jsonb, null, now()),
  ('quizzes.json', 'json', '{
  "q01": {
    "question": "Day 1: What makes a first UA test useful for a Unity indie/dev?",
    "options": [
      "It answers one product learning question with a predefined next action",
      "It buys as many cheap installs as possible before the game is instrumented",
      "It proves the ad network is good or bad from CPI alone",
      "It avoids writing a hypothesis so the result stays flexible"
    ],
    "answer": 0,
    "explanation": "A micro-budget test must produce a decision artifact, not just a dashboard screenshot."
  },
  "q02": {
    "question": "Day 2: Which statement is a usable market thesis?",
    "options": [
      "Puzzle is popular, so CPI should be cheap",
      "Adults who want calm daily logic challenges may respond to clear before/after puzzle ads in tier-2 Android markets",
      "The game has many levels, so it has high LTV",
      "We will test every region and let the network decide everything"
    ],
    "answer": 1,
    "explanation": "A useful thesis names audience, motivation, creative angle and region instead of relying on genre popularity."
  },
  "q03": {
    "question": "Day 3: Why map motivation before creative production?",
    "options": [
      "It lets you make more unrelated creatives quickly",
      "It ties ad hooks to store proof and first-session behavior",
      "It replaces the need for retention metrics",
      "It guarantees the lowest CPI"
    ],
    "answer": 1,
    "explanation": "Motivation mapping keeps creative, store page and gameplay promise aligned."
  },
  "q04": {
    "question": "Day 4: CTR is high but store CVR is weak. What is the first suspicion?",
    "options": [
      "The store page does not confirm the ad promise",
      "The tutorial has too many analytics events",
      "D7 retention is already proven",
      "The game should immediately scale budget"
    ],
    "answer": 0,
    "explanation": "High click intent with low install conversion often points to promise mismatch at the store listing."
  },
  "q05": {
    "question": "Day 5: What is the safest use of a $100-500 soft-launch test?",
    "options": [
      "Prove global scale and stable LTV",
      "Find obvious funnel, creative or tracking problems before larger spend",
      "Skip retention because sample size is small",
      "Run every possible creative and audience"
    ],
    "answer": 1,
    "explanation": "Micro-budget testing is best for risk reduction and next-step decisions."
  },
  "q06": {
    "question": "Day 6: Why avoid splitting a $300 test across many channels?",
    "options": [
      "It creates too little signal per channel to make a decision",
      "It always increases ROAS",
      "It removes the need for creative variants",
      "It makes attribution perfect"
    ],
    "answer": 0,
    "explanation": "Micro-budget needs concentrated learning, not fragmented noise."
  },
  "q07": {
    "question": "Day 7: What must a hypothesis card include to be actionable?",
    "options": [
      "Player, promise, signal and next action",
      "Only the game genre and planned spend",
      "A guarantee that CPI will be low",
      "All possible audiences at once"
    ],
    "answer": 0,
    "explanation": "The card must connect the test to a decision."
  },
  "q08": {
    "question": "Day 8: Which metric best tests whether the first-session promise is working?",
    "options": [
      "D1 retention or early return signal",
      "Campaign name",
      "Number of SDKs",
      "Store icon file size"
    ],
    "answer": 0,
    "explanation": "Retention and early return behavior show whether players found value after install."
  },
  "q09": {
    "question": "Day 9: CPI drops sharply while D1 also drops. What is the safest read?",
    "options": [
      "Traffic quality or promise fit may have worsened",
      "The campaign is automatically ready to scale",
      "Store screenshots are definitely perfect",
      "Retention no longer matters"
    ],
    "answer": 0,
    "explanation": "Lower cost can be dangerous if user quality falls with it."
  },
  "q10": {
    "question": "Day 10: What should you inspect before blaming an ad network for weak D1?",
    "options": [
      "Whether the first session delivered the creative promise",
      "Whether the app icon uses enough colors",
      "Whether there are more dashboards available",
      "Whether the campaign name includes the genre"
    ],
    "answer": 0,
    "explanation": "Weak retention often reflects promise or onboarding issues that media metrics cannot fix."
  },
  "q11": {
    "question": "Day 11: Why use conservative LTV assumptions in a micro soft-launch?",
    "options": [
      "Early revenue data is noisy and easy to overread",
      "It makes all campaigns look successful",
      "It removes the need for retention",
      "It proves IAP-heavy monetization automatically"
    ],
    "answer": 0,
    "explanation": "Conservative assumptions prevent tiny early revenue spikes from causing overconfidence."
  },
  "q12": {
    "question": "Day 12: What is missing from the statement ''ROAS target is 20%''?",
    "options": [
      "The time window and action rule",
      "The app icon size",
      "The number of store screenshots only",
      "The developer machine name"
    ],
    "answer": 0,
    "explanation": "ROAS without a window and decision rule is not operational."
  },
  "q13": {
    "question": "Day 13: What is a healthy response to privacy-driven signal loss?",
    "options": [
      "Use directional evidence with written confidence levels",
      "Assume every dashboard number is perfectly comparable",
      "Ignore consent and platform policy",
      "Stop measuring retention"
    ],
    "answer": 0,
    "explanation": "Modern UA decisions need confidence notes and smaller next actions when signal is incomplete."
  },
  "q14": {
    "question": "Day 14: What makes an event taxonomy useful for UA?",
    "options": [
      "Each event supports a decision and has stable naming",
      "It logs every variable in the game",
      "It uses random names per build",
      "It exists only after campaigns have ended"
    ],
    "answer": 0,
    "explanation": "A lean taxonomy supports decisions and remains stable across builds."
  },
  "q15": {
    "question": "Day 15: What should one creative hook test?",
    "options": [
      "One player motivation",
      "Every possible feature",
      "Only the logo",
      "The full tutorial"
    ],
    "answer": 0,
    "explanation": "Single-motivation hooks make test results easier to interpret."
  },
  "q16": {
    "question": "Day 16: When is a playable ad risky for a small puzzle team?",
    "options": [
      "When it promises interaction the real build cannot deliver",
      "When it uses the same core mechanic honestly",
      "When it has a clear learning goal",
      "When it is tested after store readiness"
    ],
    "answer": 0,
    "explanation": "A playable that overpromises can create retention mismatch."
  },
  "q17": {
    "question": "Day 17: Why avoid changing hook, art style and CTA all at once?",
    "options": [
      "The result becomes hard to diagnose",
      "It always lowers CPI",
      "It removes creative fatigue",
      "It guarantees store conversion"
    ],
    "answer": 0,
    "explanation": "Too many simultaneous changes make the learning unclear."
  },
  "q18": {
    "question": "Day 18: What should the first store screenshot do after a user clicks an ad?",
    "options": [
      "Confirm the same promise that earned the click",
      "Show only settings screens",
      "Hide gameplay until later",
      "Contradict the ad to surprise users"
    ],
    "answer": 0,
    "explanation": "Store continuity protects CVR and retention quality."
  },
  "q19": {
    "question": "Day 19: What should you extract from competitor teardown?",
    "options": [
      "Patterns of promise and proof",
      "Exact copied screenshots",
      "A guarantee of low CPI",
      "Only app names"
    ],
    "answer": 0,
    "explanation": "The value is in patterns that inform your own test."
  },
  "q20": {
    "question": "Day 20: If CTR decays but retained users remain strong, what is the better first move?",
    "options": [
      "Make variants around the same motivation",
      "Kill the whole game immediately",
      "Ignore creative and only add SDKs",
      "Change every funnel link at once"
    ],
    "answer": 0,
    "explanation": "Strong retained users suggest the promise is good; the asset may need refresh."
  },
  "q21": {
    "question": "Day 21: What blocks a creative from entering the first test?",
    "options": [
      "The store page cannot confirm its promise",
      "It has a clear learning goal",
      "It maps to a player motivation",
      "It has a matching screenshot"
    ],
    "answer": 0,
    "explanation": "Promise continuity is required before paid traffic."
  },
  "q22": {
    "question": "Day 22: What is the main danger of over-segmenting a micro campaign?",
    "options": [
      "Each cell gets too little signal",
      "The app becomes smaller",
      "Attribution becomes perfect",
      "Creative fatigue disappears"
    ],
    "answer": 0,
    "explanation": "Too many cells turn a small test into unreadable noise."
  },
  "q23": {
    "question": "Day 23: Budget is fixed and expected CPI is higher than planned. What is the cleanest adjustment?",
    "options": [
      "Reduce variants or narrow the decision",
      "Keep all variants and trust tiny samples",
      "Ignore install count",
      "Declare ROAS stable immediately"
    ],
    "answer": 0,
    "explanation": "The decision scope must fit the budget and expected CPI."
  },
  "q24": {
    "question": "Day 24: What should a campaign readout end with?",
    "options": [
      "One recommended call and confidence level",
      "Every raw metric copied without interpretation",
      "A new unrelated feature idea",
      "Only the best-looking chart"
    ],
    "answer": 0,
    "explanation": "Reports must drive decisions, not just archive numbers."
  },
  "q25": {
    "question": "Day 25: What belongs in a good kill criterion?",
    "options": [
      "Metric condition, action and review point",
      "A vague bad feeling",
      "Only CPI with no retention context",
      "A promise to decide later"
    ],
    "answer": 0,
    "explanation": "Decision rules need specific conditions and actions."
  },
  "q26": {
    "question": "Day 26: Why treat SDK choices as architecture decisions?",
    "options": [
      "They affect data, privacy, performance and launch risk",
      "They are invisible to users and stores",
      "They never change app behavior",
      "They replace event taxonomy"
    ],
    "answer": 0,
    "explanation": "SDKs influence compliance, measurement quality and runtime behavior."
  },
  "q27": {
    "question": "Day 27: What is the most important output of a post-mortem?",
    "options": [
      "Which assumption changed and what action follows",
      "A longer list of dashboards",
      "A blame assignment",
      "A promise to spend more immediately"
    ],
    "answer": 0,
    "explanation": "Learning is reusable only when assumptions and actions are explicit."
  },
  "q28": {
    "question": "Day 28: What makes a weekly UA rhythm practical for a small team?",
    "options": [
      "Owners, deadlines and decision points are named",
      "Every task waits for perfect data",
      "Creative production has no limit",
      "Reports are written only when results are good"
    ],
    "answer": 0,
    "explanation": "Small teams need cadence that turns learning into scheduled action."
  },
  "q29": {
    "question": "Day 29: What should the capstone plan optimize for?",
    "options": [
      "A clear first test and decision rules",
      "Maximum length and every possible idea",
      "A guaranteed ROAS target",
      "Only creative inspiration"
    ],
    "answer": 0,
    "explanation": "The plan should guide a real first test."
  },
  "q30": {
    "question": "Day 30: What makes the final next action strong?",
    "options": [
      "It is small, dated and measurable",
      "It says ''improve UA'' generally",
      "It depends on perfect data",
      "It avoids naming a risk"
    ],
    "answer": 0,
    "explanation": "A concrete next action makes the course operational."
  }
}'::jsonb, null, now()),
  ('calculators.json', 'json', '[
  {
    "id": "sampleSize",
    "name": "Sample-size sanity check",
    "description": "Estimate whether a micro budget can feed the number of creative cells you want to test.",
    "fields": [
      {
        "label": "Budget ($)",
        "key": "budget",
        "default": 300
      },
      {
        "label": "Expected CPI ($)",
        "key": "cpi",
        "default": 0.6
      },
      {
        "label": "Creative cells",
        "key": "cells",
        "default": 6
      }
    ]
  },
  {
    "id": "breakEvenCpi",
    "name": "Break-even CPI guardrail",
    "description": "Estimate a rough CPI ceiling from LTV and gross margin assumptions.",
    "fields": [
      {
        "label": "Rough LTV ($)",
        "key": "ltv",
        "default": 1.2
      },
      {
        "label": "Gross margin",
        "key": "grossMargin",
        "default": 0.7
      }
    ]
  },
  {
    "id": "testBudget",
    "name": "Creative test budget",
    "description": "Estimate spend needed for first-pass creative learning.",
    "fields": [
      {
        "label": "Expected CPI ($)",
        "key": "cpi",
        "default": 0.6
      },
      {
        "label": "Installs per cell",
        "key": "installsPerCreative",
        "default": 50
      },
      {
        "label": "Creative cells",
        "key": "creatives",
        "default": 6
      }
    ]
  },
  {
    "id": "cohortReadout",
    "name": "D1/D7 cohort readout",
    "description": "Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.",
    "fields": [
      {
        "label": "Installs",
        "key": "installs",
        "default": 300
      },
      {
        "label": "D1 returning users",
        "key": "d1Users",
        "default": 90
      },
      {
        "label": "D7 returning users",
        "key": "d7Users",
        "default": 45
      },
      {
        "label": "Spend ($)",
        "key": "spend",
        "default": 180
      },
      {
        "label": "D7 revenue ($)",
        "key": "revenueD7",
        "default": 25
      }
    ]
  }
]'::jsonb, null, now()),
  ('checklists.json', 'json', '{
  "c01": [
    "Write one learning question for your first UA test.",
    "Connect that question to one metric and one game/store/creative action.",
    "Add the first hypothesis sentence to Final UA Plan.",
    "Mark the biggest unknown: audience, creative, store, tracking or product."
  ],
  "c02": [
    "List two competitor/reference games and their visible promise.",
    "Write the player motivation your puzzle game is built around.",
    "Choose an initial region assumption for micro-budget testing.",
    "Update the audience field in Final UA Plan."
  ],
  "c03": [
    "Write three possible player motivations for your puzzle game.",
    "Attach one ad hook to each motivation.",
    "Define what the first session must prove for the strongest hook.",
    "Update target audience with behavior and motivation signals."
  ],
  "c04": [
    "Write your funnel from impression to D1 return.",
    "Mark which events/metrics you can measure now.",
    "Add one decision range for store conversion or early retention.",
    "Name the funnel link you expect to be weakest."
  ],
  "c05": [
    "Pick a micro-budget range and daily cap.",
    "Define what the test is allowed to conclude.",
    "Write one stop-loss rule for bad early signal.",
    "Update the budget field in Final UA Plan."
  ],
  "c06": [
    "List three possible channels and one reason for each.",
    "Choose one primary channel for the first sprint.",
    "Write why the channel matches your creative and budget.",
    "Record what you will not test yet."
  ],
  "c07": [
    "Write the five-line hypothesis card.",
    "Remove vague phrases like ''everyone'' or ''fun gameplay''.",
    "Add a next action for good and bad signal.",
    "Confirm Week 2 measurement needs."
  ],
  "c08": [
    "Map four metrics to four decisions.",
    "Separate acquisition, retention and monetization signals.",
    "Write one supporting metric for each primary metric.",
    "Update metric targets in Final UA Plan."
  ],
  "c09": [
    "Write definitions for CPI, CTR, CVR and IPM in your own words.",
    "Attach each metric to a funnel link.",
    "Define one bad-pattern diagnosis.",
    "Update metric decision ranges."
  ],
  "c10": [
    "Define the first-session proof events.",
    "Mark the earliest point players can feel the core puzzle value.",
    "Write one onboarding risk.",
    "Update tracking checklist."
  ],
  "c11": [
    "Write conservative, expected and optimistic LTV assumptions.",
    "Identify whether ads or light IAP is the main early revenue driver.",
    "Set a payback window assumption.",
    "Update metric targets with economics guardrails."
  ],
  "c12": [
    "Choose the first ROAS window you will inspect.",
    "Write one hold rule and one stop rule.",
    "Pair ROAS with retention and CPI.",
    "Update success criteria."
  ],
  "c13": [
    "List metrics likely to be delayed or modeled.",
    "Write one dashboard reconciliation risk.",
    "Add a confidence label to your key decision metric.",
    "Update tracking with privacy/attribution caveats."
  ],
  "c14": [
    "Write ten v1 events for the first test.",
    "Add one purpose and one key parameter per event.",
    "Remove events that do not support a decision.",
    "Update tracking in Final UA Plan."
  ],
  "c15": [
    "Write six hooks grouped by motivation.",
    "Choose three hooks for the first test.",
    "Define expected signal for each hook.",
    "Update creative matrix."
  ],
  "c16": [
    "Choose a format for each top hook.",
    "Write what each format can prove.",
    "Avoid formats that overpromise the build.",
    "Update creative matrix with production scope."
  ],
  "c17": [
    "Build a 3x2 creative matrix.",
    "Define one primary metric for each row.",
    "Write the action for win, weak signal or loss.",
    "Update creative matrix in Final UA Plan."
  ],
  "c18": [
    "Match each top hook to one store proof element.",
    "Audit icon and first screenshot for promise continuity.",
    "Write one store risk before spend.",
    "Update creative/store readiness notes."
  ],
  "c19": [
    "Teardown three puzzle competitors.",
    "Write one repeated market pattern.",
    "Write one way your game differs honestly.",
    "Update audience or creative matrix."
  ],
  "c20": [
    "Define refresh, variant and pivot conditions.",
    "Attach each condition to a metric pattern.",
    "Write how many new creatives are realistic per week.",
    "Update success criteria."
  ],
  "c21": [
    "Finalize three hooks and six variants or a smaller honest set.",
    "Confirm store proof for each top hook.",
    "Write acceptance and rejection rules.",
    "Update creative matrix in Final UA Plan."
  ],
  "c22": [
    "Write one campaign structure for the first sprint.",
    "Limit cells to what budget can feed.",
    "Define naming convention for reports.",
    "Update budget and success criteria."
  ],
  "c23": [
    "Estimate installs per creative cell.",
    "Reduce the matrix if cells are underfed.",
    "Write confidence caveats for micro sample size.",
    "Update budget in Final UA Plan."
  ],
  "c24": [
    "Separate metrics into creative, store, product and monetization buckets.",
    "Write diagnosis and confidence level.",
    "Choose one recommended call.",
    "Update success criteria."
  ],
  "c25": [
    "Write one scale rule.",
    "Write one iterate rule.",
    "Write one stop or pause rule.",
    "Update kill criteria."
  ],
  "c26": [
    "List SDKs and purpose.",
    "Write data/consent risk per SDK.",
    "Define event validation before campaign launch.",
    "Update tracking checklist."
  ],
  "c27": [
    "Create a learning log template.",
    "Fill one hypothetical test result.",
    "Write which assumption changed.",
    "Update success criteria or next-action notes."
  ],
  "c28": [
    "Write a weekly cadence.",
    "Assign owner/deadline for build, creative and report tasks.",
    "Add next decision meeting.",
    "Update next action."
  ],
  "c29": [
    "Fill every Final UA Plan field.",
    "Remove details that do not affect launch decisions.",
    "Check budget, tracking and creative are aligned.",
    "Write the first next action."
  ],
  "c30": [
    "Write top five launch risks.",
    "Add mitigation for each risk.",
    "Choose one smallest next action with date/owner.",
    "Finalize the one-page plan."
  ]
}'::jsonb, null, now()),
  ('cases.json', 'json', '[
  {
    "id": "puzzle-onboarding-leak",
    "title": "Puzzle soft-launch: cheap installs, weak D1",
    "tags": [
      "puzzle",
      "retention",
      "prototype"
    ],
    "context": "A calming block puzzle gets affordable Android installs, but many users leave before completing the third board.",
    "metrics": "CPI $0.42, CTR 1.8%, store CVR 32%, tutorial_complete 54%, D1 22%, D7 4%",
    "recommendation": "Pause scale and fix first-session proof before producing more traffic.",
    "reason": "Acquisition is promising, but the cohort fails before the game proves its core promise.",
    "decision": "Fix onboarding/level pacing, then rerun the same best hook to isolate product change."
  },
  {
    "id": "puzzle-store-mismatch",
    "title": "Puzzle ad hook wins clicks, store loses installs",
    "tags": [
      "puzzle",
      "store",
      "creative"
    ],
    "context": "A satisfying-clear video earns clicks, but the store page shows old menu screenshots and no clear gameplay proof.",
    "metrics": "CTR 3.9%, CVR 11%, CPI $1.10, D1 29%, first screenshot shows meta menu",
    "recommendation": "Update store assets before blaming traffic quality.",
    "reason": "The ad creates interest, but store continuity breaks the promise.",
    "decision": "Replace first screenshot and short description, then retest the same creative."
  },
  {
    "id": "idle-creative-spike",
    "title": "Idle RPG creative spike with stable cohorts",
    "tags": [
      "idle",
      "creative",
      "scale"
    ],
    "context": "A combat-progression hook beats economy-focused creatives and retained users monetize at the same rate.",
    "metrics": "IPM 18 vs account avg 7, CPI $0.65, D1 38%, D7 16%, early ROAS direction stable",
    "recommendation": "Scale cautiously and produce variants around the same motivation.",
    "reason": "Creative signal and cohort quality both support a controlled scale test.",
    "decision": "Increase daily cap gradually and build three variants around combat progression."
  },
  {
    "id": "hybrid-cheap-traffic",
    "title": "Hybrid-casual runner: low CPI, low intent",
    "tags": [
      "hybrid-casual",
      "audience",
      "quality"
    ],
    "context": "A fast fail compilation gets cheap installs but players churn before seeing meta progression.",
    "metrics": "CPI $0.28, CTR 2.6%, level_3_reach 31%, D1 18%, rewarded_ad_watched 5%",
    "recommendation": "Treat cheap traffic as low-intent until first-session depth improves.",
    "reason": "The ad may be attracting curiosity clicks rather than the intended player motivation.",
    "decision": "Test a progression hook and improve early depth before increasing spend."
  },
  {
    "id": "live-roas-shortfall",
    "title": "Live puzzle game: retention acceptable, ROAS short",
    "tags": [
      "live",
      "roas",
      "monetization"
    ],
    "context": "A puzzle game has acceptable early retention but weak rewarded-ad engagement and slow payback.",
    "metrics": "CPI $0.80, D1 34%, D7 16%, D7 ROAS 8%, target direction 15-20%",
    "recommendation": "Do not scale yet; test monetization placement and lower-cost creative angles.",
    "reason": "Retention is not the main blocker, but economics do not support scale.",
    "decision": "Run monetization UX changes and retest with the same audience."
  },
  {
    "id": "privacy-sdk-readiness",
    "title": "SDK readiness blocks launch",
    "tags": [
      "privacy",
      "sdk",
      "tracking"
    ],
    "context": "The team added analytics, ads and attribution SDKs, but event names differ between builds and store data disclosure is incomplete.",
    "metrics": "first_open duplicated, tutorial_complete missing on Android 14 test device, consent copy not reviewed",
    "recommendation": "Delay paid traffic until event validation and disclosure review are complete.",
    "reason": "Bad measurement creates false campaign decisions and store/privacy risk.",
    "decision": "Run SDK readiness checklist and lock taxonomy before launch."
  },
  {
    "id": "micro-budget-false-positive",
    "title": "Micro-budget false positive",
    "tags": [
      "budget",
      "sample-size",
      "decision"
    ],
    "context": "One creative looks like a winner after 18 installs, but the next day its retention regresses toward the group average.",
    "metrics": "Creative A: 18 installs, D1 44%; Creative B: 72 installs, D1 31%; group D1 30%",
    "recommendation": "Log the signal as interesting but avoid scale until more installs or repeated evidence exists.",
    "reason": "Tiny cohorts can exaggerate wins and losses.",
    "decision": "Reduce variant count and rerun the top two concepts with clearer sample expectations."
  }
]'::jsonb, null, now()),
  ('lessons/day-01.md', 'markdown', null, '---
day: 1
title: "UA as a product learning loop"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
artifact: "UA learning loop map"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **UA learning loop map** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **UA learning loop map** để làm rõ phần **giả thuyết game** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

For a Unity indie/dev, UA is not a marketing department bolted onto the game. Treat it like a product feedback loop: an ad creates a promise, the store page confirms that promise, the first session proves or breaks it, and analytics tells you where the promise leaked.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A puzzle prototype promises ''relaxing brain challenge in 10 seconds''. If players click the ad but quit during level 2, the UA problem may be onboarding clarity, not the ad network.

## Decision Rule
Quy tắc quyết định cho bài này:

Do not spend until the test has one learning question, one primary metric and one next action for both good and bad results.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Draw a four-step loop for your puzzle game: ad promise, store proof, first-session proof, metric signal. Write the weakest link.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Write the first version of your game hypothesis in one sentence: player, motivation, promise and proof.

## Checklist Focus
- Write one learning question for your first UA test.
- Connect that question to one metric and one game/store/creative action.
- Add the first hypothesis sentence to Final UA Plan.
- Mark the biggest unknown: audience, creative, store, tracking or product.

## Case / Tool Link
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.


## English Terms You Should Keep
- **UA**
- **Funnel**
- **CPI**

## Curated References
- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab.

> Practical rule: Do not spend until the test has one learning question, one primary metric and one next action for both good and bad results.
', now()),
  ('lessons/day-02.md', 'markdown', null, '---
day: 2
title: "Puzzle market thesis and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
artifact: "Puzzle market thesis"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Puzzle market thesis**: một giả thuyết thị trường đủ cụ thể để biết game puzzle của bạn nên test với ai, lời hứa nào, ở market nào, và vì sao monetization hiện tại có cơ hội pay back.

Kết quả cần có sau bài:

- Một target player segment rõ hơn “người thích puzzle”.
- Một motivation chính: relax, challenge, mastery, satisfying clear, daily habit hoặc collection.
- Hai đến ba reference games để so sánh promise/store/monetization.
- Một market assumption cho micro test, ví dụ Android tier-2/3, English-speaking broad, hoặc Vietnam/SEA soft signal.
- Một risk note: market thesis yếu nhất ở đâu?

## Why this matters

Nhiều team nhỏ làm puzzle game vì nghĩ “puzzle dễ hiểu, audience rộng, CPI chắc rẻ”. Đây là giả định nguy hiểm. Puzzle đúng là dễ truyền tải trong creative, nhưng cũng là genre rất đông đối thủ, dễ bị copy về visual promise, và thường cần retention hoặc ad depth tốt để có LTV đủ trả CPI.

Market thesis giúp bạn không test mù. Nó buộc bạn trả lời: người chơi nào sẽ quan tâm, họ quan tâm vì động lực gì, họ đang quen với loại store promise nào, và game của bạn có đủ production/monetization để phục vụ kỳ vọng đó không.

Một market thesis tốt không cần đúng 100%. Nó cần đủ rõ để chạy test nhỏ và biết phải sửa gì nếu sai.

## Core model: market thesis không phải genre label

“Puzzle” chỉ là genre label. Nó không nói người chơi muốn gì.

Một market thesis có 5 phần:

| Thành phần | Câu hỏi cần trả lời | Ví dụ tốt | Ví dụ yếu |
| --- | --- | --- | --- |
| Player segment | Ai có khả năng quan tâm? | Người lớn muốn brain break ngắn, ít áp lực | Mọi người chơi puzzle |
| Motivation | Họ chơi vì cảm giác nào? | Satisfying clear, calm logic, daily mastery | Vì game vui |
| Promise | Creative/store hứa điều gì? | Clear a messy board in one smart move | Nhiều level hấp dẫn |
| Market context | Test ở đâu trước? | Android SEA/tier-2 với CPI guardrail thấp | Test toàn cầu ngay |
| Monetization path | Vì sao có thể pay back? | Ads + light IAP nếu session depth và rewarded engagement đủ | Có ads nên chắc có tiền |

## Puzzle market map

Dùng bảng này để phân biệt các hướng puzzle thường gặp. Các dòng dưới đây không phải phân loại tuyệt đối, nhưng giúp bạn tránh gom tất cả puzzle vào một nhóm.

| Puzzle angle | Player motivation | Creative hook thường hợp | Metric cần xem sớm | Monetization risk |
| --- | --- | --- | --- | --- |
| Calm daily puzzle | Relax, routine | “A 2-minute brain break” | D1/D7, daily challenge return | Session ngắn, ad depth thấp |
| Satisfying clear puzzle | Visual satisfaction | “Clear chaos in one move” | CTR, IPM, level depth | Hook kéo curiosity nhưng D1 yếu |
| Hard challenge puzzle | Mastery, pride | “Only 1% solve this” | CTR, fail/retry, D1 | Attract rage-click, churn cao |
| Collection/meta puzzle | Completion, progress | “Unlock rooms/collections” | Session length, ad engagement | Production scope nặng |
| Fast fail puzzle | Adrenaline, retry | “Can you beat this?” | CPI, early churn, level retry | Low intent traffic, weak LTV |

:::chart
title: Market fit scorecard example, 1-5
Audience clarity|4|Clear relaxing brain-break target
Creative clarity|5|Board clear is visual in 1 second
Production fit|3|Need many polished boards
Retention path|2|Daily habit not proven yet
Monetization path|3|Ads plus light IAP possible
:::

Cách đọc chart: điểm thấp nhất là nơi thesis dễ vỡ. Trong ví dụ này, creative rất dễ hiểu nhưng retention path yếu. Nghĩa là test đầu tiên không nên chỉ hỏi “CPI có rẻ không?”, mà phải hỏi “player có quay lại vì daily habit không?”.

## Worked example: market thesis cho puzzle game

Giả sử game của bạn là block puzzle có cảm giác dọn dẹp board rất đã tay. Dưới đây là bảng phân tích giả thuyết thị trường (market thesis) mẫu được chuẩn hóa:

| Thành phần | Chi tiết giả thuyết mẫu | Ý nghĩa kiểm chứng thực tế |
| :--- | :--- | :--- |
| **Target segment** | Adults who want a calm but satisfying 2-minute brain break | Tập trung vào động lực nghỉ ngơi và cảm giác thỏa mãn ngắn hạn. |
| **Initial market** | Android SEA / tier-2 (ngân sách siêu nhỏ) | Kiểm tra độ rõ ràng của creative trước khi target thị trường đắt đỏ. |
| **Validation pattern** | CTR/IPM đạt mức chấp nhận, Store CVR không bị gãy, D1 & level depth ổn định | Chứng minh lời hứa từ ad kéo được người chơi thực sự. |
| **Failure condition** | Giá install (CPI) rẻ nhưng level depth và D1 cực kỳ yếu | Tín hiệu cho thấy ad hút tò mò ảo (curiosity) nhưng thiếu độ khớp game. |

Bảng phân tích trên tốt hơn câu nói chung chung “game puzzle cho mọi người” vì nó phân rã rõ ràng phân khúc, động lực, lời hứa quảng cáo, giả định thị trường, tín hiệu số liệu và điều kiện thất bại.

## Hướng dẫn đọc số cho genre fit

### 1. Đừng dùng CPI để chứng minh genre fit một mình

CPI thấp chỉ nói bạn mua được install rẻ. Nó chưa nói người chơi có phù hợp với game. Nếu CPI thấp nhưng level depth thấp và D1 yếu, bạn có thể đang mua curiosity traffic, không phải target player.

### 2. Đọc CPI cùng retention và engagement

Nếu CPI cao hơn kỳ vọng nhưng D1/engagement tốt, thesis có thể vẫn đáng test tiếp bằng creative/store optimization. Nếu CPI thấp nhưng retention hỏng, thesis có thể sai audience hoặc sai promise.

### 3. Đọc market thesis bằng pattern, không bằng một số đơn lẻ

| Pattern | Cách đọc | Action nên làm |
| --- | --- | --- |
| CPI thấp + D1 thấp | Cheap traffic nhưng fit yếu | Kiểm creative promise và onboarding trước khi scale |
| CTR cao + CVR thấp | Hook có attention, store proof yếu | Sửa first screenshot/description |
| D1 tốt + ARPDAU thấp | Có product interest nhưng monetization yếu | Test ad placement/rewarded economy |
| CPI cao + D1 tốt | Audience có thể đúng nhưng creative/store chưa efficient | Tối ưu creative angle trước khi bỏ thesis |
| CTR thấp + D1 tốt ở cohort nhỏ | Product có thể ổn, hook chưa truyền được | Làm lại opening 1-3 giây đầu |

## Competitor teardown mẫu

Bạn không cần phân tích 20 đối thủ. Với beginner, 3 reference games là đủ để bắt đầu.

> [!TIP]
> **Cách tự tìm game đối thủ (competitor scope) trên Store**: 
> Hãy gõ từ khóa chính của gameplay của bạn (ví dụ: "block sort", "screw sort") lên thanh tìm kiếm Google Play hoặc App Store. Tìm các game có lượt tải từ **10,000 đến 500,000** (cùng quy mô indie/studio vừa) để phân tích, tránh chỉ chọn các game top 1 có hàng triệu USD ngân sách live ops.

| Reference | Visible promise | Store proof | Monetization hint | Pattern học được | Không nên copy |
| --- | --- | --- | --- | --- | --- |
| Calm block puzzle | Relaxing daily board clear | Screenshot sạch, ít UI | Ads nhẹ, remove ads/IAP | Calm + routine | Tone art y hệt |
| Hard logic puzzle | Challenge and mastery | Level khó, fail state rõ | Hints/IAP | Pride hook | Claim “1% solve” nếu game không khó |
| Decor/meta puzzle | Solve to unlock room | Before/after room visual | Ads + bundles | Progression proof | Meta scope quá lớn nếu team nhỏ |

Cách đọc competitor đúng: tìm pattern của promise và proof. Đừng copy art, board, tagline hoặc screenshot. Bạn cần hiểu “vì sao người chơi tin lời hứa này trên store?”.

## LTV và monetization fit ở mức beginner

Bạn chưa cần forecast LTV phức tạp. Nhưng bạn cần biết monetization path có hợp genre angle không.

| Thesis angle | LTV driver có thể có | Câu hỏi cần kiểm tra sớm |
| --- | --- | --- |
| Calm daily puzzle | D7/D14 habit, light ads | Người chơi có quay lại hàng ngày không? |
| Satisfying clear | Ad engagement, session count | Sau khi thỏa mãn 1 lần, họ có chơi tiếp không? |
| Hard challenge | Hints, retry, rewarded ads | Fail có làm họ muốn thử lại hay rời game? |
| Collection/meta | Long-term progression, bundles | Team có sản xuất đủ content không? |

Nếu thesis cần LTV cao nhưng game chỉ có session rất ngắn và không có return hook, bạn đang tự đặt campaign vào thế khó.

## Real usecases đã đối chiếu nguồn

Ở bài market thesis, case thực tế chỉ hữu ích khi bạn tách **genre label** khỏi **motivation + proof + monetization path**.

![Day 2 market thesis visual](content/assets/usecases/day-02-market-thesis-visual.svg)

*Visual minh họa: không phải dữ liệu campaign chính thức. Dùng để tách genre label khỏi motivation, proof và monetization path theo case Candy Crush + Bravestars.*

### Global case: Candy Crush Saga

![Candy Crush public Google Play screenshot](https://play-lh.googleusercontent.com/bcz89tC10CC6pqGtuFuwl7zmYO87Y2UsKYGNC1-L2gG-v00HcWT6XndwwUu1eLrPzOf_XuKIRqNTfEZkM4EVMg=w720-h1280)

*Public screenshot readout: ảnh Google Play cho thấy board objective, booster, combo visual và progression flavor. Dùng để đọc market thesis về level objective + reward loop, không dùng để suy benchmark. Nguồn ảnh: [Candy Crush Saga on Google Play](https://play.google.com/store/apps/details?id=com.king.candycrushsaga).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Candy Crush Saga là free-to-play tile-matching game của King, phát hành trên Facebook rồi iOS/Android; gameplay là swap candy để match 3+, qua nhiều level với mục tiêu khác nhau. Nguồn: [Wikipedia - Candy Crush Saga](https://en.wikipedia.org/wiki/Candy_Crush_Saga) | “Match-3” không phải market thesis đủ dùng. Thesis mạnh hơn phải nói rõ level objective, progression, fail/retry, booster hoặc daily habit tạo lý do chơi tiếp. | Không suy ra benchmark CPI/D1 hiện tại của Candy Crush hoặc dùng doanh thu lịch sử để chứng minh game indie sẽ payback. |
| Nguồn ghi game dùng freemium model và có in-app purchase giúp vượt board khó. | Monetization path phải khớp với friction của genre: nếu game có challenge/fail state hợp lý, hint/booster/IAP hoặc rewarded support mới có logic. | Không copy hệ thống monetization nếu game của bạn chưa có depth/fail/retry đủ thuyết phục. |

**Decision rule học được:** market thesis không nên viết “puzzle popular”. Hãy viết: người chơi nào, động lực nào, level proof nào, và monetization path nào có thể hợp với động lực đó.

### Vietnam case: Bravestars Games

![Bravestars Wooden Slide public Google Play screenshot](https://play-lh.googleusercontent.com/cMA97sLm9Z-l5tCQTmT_y-6UUc89T93h5Ffu5yyJ2n4YFSPPXhV2rCq5TeBpxiaQTQKX11yPsPb75MoYeELDTA=w720-h1280)

*Public screenshot readout: ảnh Google Play của Wooden Slide cho thấy sub-genre promise khác với match-3: block escape, spatial logic, path clearing. Dùng để nhắc rằng casual puzzle không phải một audience duy nhất. Nguồn ảnh: [Wooden Slide on Google Play](https://play.google.com/store/apps/details?id=slide.color.block.puzzle).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Google Play developer page của Bravestars Games liệt kê nhiều casual/puzzle-like products như Wooden Slide: Block Escape, Nuts and Bolts Woody Puzzle, Woolloop! Color Puzzle, Goods Mix Puzzle Master, Save The Pets, Draw Bridge Puzzle. Nguồn: [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games) | Một portfolio có nhiều sub-genre cho thấy “casual puzzle” không phải một audience duy nhất. Mỗi title hứa một motivation khác: block escape, nuts/bolts logic, color/wool, goods matching, rescue/drawing. | Không suy ra ranking, doanh thu, campaign spend hoặc tỷ lệ thành công của từng game nếu Google Play page không công bố. |
| Nguồn public thể hiện nhiều promise bằng title/action rất cụ thể. | Khi chọn reference games, hãy so theo promise gần nhất với game của bạn, không chỉ chọn game top nổi tiếng. | Không gom tất cả thành “người chơi Bravestars-style”; phải viết motivation row riêng cho từng promise muốn test. |

**Decision rule học được:** nếu thesis của bạn có thể áp vào mọi game casual/puzzle trong portfolio, thesis đó quá rộng. Thu hẹp bằng motivation và proof cụ thể.

## Common mistakes

### Mistake 1: “Puzzle audience rất rộng”

Audience rộng không có nghĩa bạn biết ai sẽ install và quay lại. Broad audience có thể giúp network tìm traffic, nhưng plan của bạn vẫn cần motivation rõ để đọc creative signal.

Correction: viết audience bằng motivation, không chỉ bằng genre. Ví dụ “người muốn brain break nhẹ trong 2 phút” tốt hơn “người thích puzzle”.

### Mistake 2: Chọn competitor quá nổi nhưng không cùng scope

Nếu bạn so game indie prototype với một puzzle game top grossing có hàng năm live ops, meta system và production budget lớn, bạn sẽ học sai.

Correction: chọn reference theo promise và scope gần hơn, không chỉ theo doanh thu hoặc ranking.

### Mistake 3: Nghĩ store screenshot đẹp là đủ

Screenshot đẹp nhưng không chứng minh creative promise thì vẫn có thể làm CVR yếu.

Correction: screenshot đầu tiên phải trả lời “người vừa click ad có thấy đúng thứ họ mong không?”.

### Mistake 4: Không viết failure condition hoặc đặt KPI thất bại quá khắt khe

Market thesis phải có điều kiện sai để biết khi nào cần dừng. Tuy nhiên, nếu bạn đặt ranh giới thất bại quá ngặt nghèo ngay lần chạy đầu (ví dụ: D1 retention phải >50%), bạn sẽ dễ nản lòng và khai tử game quá sớm.

Correction: Viết rõ điều kiện sai dựa trên tính logic của phễu. Đặt mốc Failure vừa phải (ví dụ: D1 < 20% hoặc CTR < 1%), tập trung vào việc tìm tín hiệu định hướng (directional signals) để tối ưu hơn là sự hoàn hảo.

## Lab output example

| Field | Example output |
| --- | --- |
| Target segment | Adults who want a calm 2-minute brain break. |
| Motivation | Relaxing satisfaction from clearing a messy board. |
| Reference games | Calm block puzzle, hard logic puzzle, decor/meta puzzle. |
| Initial market | Android SEA/tier-2, micro-budget, broad interest. |
| Creative promise | Clear chaos in one smart move. |
| Monetization path | Ads + light IAP if D1 and rewarded engagement are acceptable. |
| Fit risk | Hook may attract curiosity but not daily retention. |
| Failure condition | CPI cheap but level depth and D1 weak. |

## Practical Lab

Làm trực tiếp trên game của bạn:

1. Chọn 3 reference games gần với game của bạn nhất về promise, không chỉ về genre.
2. Với mỗi reference, ghi promise, first screenshot proof, monetization hint và pattern bạn học được.
3. Viết target segment bằng motivation.
4. Chọn một initial market cho test nhỏ và viết lý do.
5. Viết một failure condition cho market thesis.

## Final UA Plan Update

Cập nhật field **Target audience** theo format:

```text
Target segment: [ai]
Motivation: [vì sao họ chơi]
Reference games: [2-3 game/pattern]
Initial market: [region/platform/channel assumption]
Monetization fit: [ads/IAP path]
Main risk: [điểm thesis dễ sai]
Failure condition: [metric pattern làm thesis yếu]
```

## Checklist Focus

- Viết target segment bằng motivation, không chỉ bằng genre.
- Chọn 3 reference games và ghi visible promise của từng game.
- Ghi store proof: icon/screenshot/title chứng minh promise thế nào.
- Chọn initial market cho micro-budget test và nêu lý do.
- Viết monetization path và risk lớn nhất.
- Viết failure condition để biết khi nào thesis sai.

## English Terms You Should Keep

- **Genre-market fit**: mức độ phù hợp giữa genre, audience, promise, market và monetization.
- **CPI**: cost per install, cần đọc cùng retention/engagement.
- **LTV**: lifetime value, ở bài này chỉ dùng như hướng suy nghĩ monetization path, chưa cần forecast chính xác.
- **Market thesis**: giả thuyết về ai sẽ thích game, vì sao, ở đâu, và game có thể kiếm tiền bằng cách nào.

## Curated References

- Chưa cần đọc reference ngoài trước khi làm lab. Với bài này, reference quan trọng nhất là store pages và creatives của 3 game bạn chọn để teardown.

> Practical rule: Market thesis tốt phải có segment, motivation, reference pattern, initial market, monetization path và failure condition. Nếu thiếu failure condition, bạn chưa có thesis để test.
', now()),
  ('lessons/day-03.md', 'markdown', null, '---
day: 3
title: "Audience motivation map"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [Audience, Motivation, Hook]
artifact: "Audience motivation map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Audience motivation map**: một bảng nối giữa động lực người chơi, ad hook, store proof, first-session proof và metric cần đọc.

Kết quả cần có sau bài:

- Không còn viết audience kiểu “nam nữ 18-45 thích puzzle”.
- Chọn được 2-3 motivation có thể test bằng creative.
- Biết mỗi motivation cần gameplay proof nào trong session đầu.
- Biết đọc tín hiệu khi ad hook thắng click nhưng game/store không giữ được người chơi.
- Cập nhật field **Target audience** trong Final UA Plan bằng behavior + motivation.

## Why this matters

Với budget $100-500, bạn không có đủ tiền để test audience bằng cách bắn thật rộng rồi đợi thuật toán tự tìm “người đúng”. Bạn cần một cách nghĩ rõ hơn: **mỗi audience là một động lực chơi**, và mỗi động lực phải được chứng minh ở 3 nơi: ad, store page và first session.

Ví dụ, cùng là puzzle:

- Người muốn relax sẽ phản ứng với “calm 2-minute brain break”.
- Người thích thử thách sẽ phản ứng với “only 1% can solve this”.
- Người thích cảm giác dọn dẹp sẽ phản ứng với “clear chaos in one smart move”.
- Người thích tiến trình sẽ phản ứng với “solve puzzles to unlock rooms”.

Nếu bạn gom tất cả vào “puzzle player”, bạn sẽ không biết lỗi nằm ở creative, store page hay game khi số xấu.

## Core model: audience là motivation, không phải demographic

Demographic như tuổi, giới tính, quốc gia chỉ là thông tin phụ. UA decision tốt hơn thường bắt đầu từ motivation.

| Sai cách | Vì sao yếu | Cách viết tốt hơn |
| --- | --- | --- |
| Women 25-45 who like puzzle | Stereotype, không nói vì sao họ chơi | Adults who want a calm brain break after work |
| Casual gamers | Quá rộng, không gắn với hook | Players who like satisfying board clear moments |
| People who play hard games | Không nói proof cần có | Challenge seekers who want to prove they can solve a tricky level |
| Everyone who likes mobile games | Không test được | Commuter players who want short, low-pressure sessions |

Practical rule: nếu audience statement không gợi ra được một ad hook cụ thể, nó chưa đủ rõ để dùng trong UA plan.

## Motivation map mẫu cho puzzle game

Bảng này là artifact chính của bài. Hãy đọc theo hàng ngang: động lực nào thì cần hook, store proof, gameplay proof và metric nào.

| Motivation | Player wants | Ad hook | Store proof | First-session proof | Metric cần đọc |
| --- | --- | --- | --- | --- | --- |
| Relax | Nghỉ não ngắn, ít áp lực | “A 2-minute puzzle break” | Screenshot sạch, tone nhẹ, no clutter | Tutorial chậm, level đầu dễ hiểu | D1, session count, tutorial completion |
| Satisfying clear | Cảm giác dọn board đã tay | “Clear chaos in one smart move” | Before/after board, combo visual | Level 1-3 có clear moment rõ | CTR, IPM, level depth |
| Challenge | Chứng minh kỹ năng | “Only 1% solve this” | Level khó, fail state rõ | Có challenge sớm nhưng không unfair | CTR, fail/retry, D1 |
| Mastery | Cải thiện qua từng level | “Can you find the perfect move?” | Progression/level map | Người chơi hiểu skill curve | Level depth, D3/D7 signal |
| Collection/meta | Mở khóa, hoàn thiện bộ sưu tập | “Solve to unlock the room” | Room/collection before-after | Meta reward xuất hiện sớm | Session length, ad engagement, return |

:::chart
title: Example motivation confidence, 1-5
Relax|4|Audience clear, product proof easy
Satisfying clear|5|Strong visual hook, easy to show in ads
Challenge|3|High CTR possible but churn risk
Mastery|2|Needs more level depth proof
Collection/meta|2|Scope may be too heavy for prototype
:::

Cách đọc chart: motivation có điểm cao không phải vì “hay hơn”, mà vì nó phù hợp hơn với product hiện tại và dễ chứng minh bằng creative/store/session đầu. Với prototype puzzle nhỏ, “satisfying clear” có thể đáng test trước “collection/meta” vì cần ít production hơn.

## Hướng dẫn đọc số theo motivation

Bạn không đọc metric một cách độc lập. Bạn đọc metric theo lời hứa của hook.

| Metric pattern | Cách đọc | Next action đúng | Next action sai thường gặp |
| --- | --- | --- | --- |
| CTR cao, CVR thấp | Hook thu hút nhưng store không chứng minh promise | Sửa icon/screenshot/first description theo đúng hook | Đổi audience ngay |
| CTR thấp, D1 tốt | Game có thể ổn nhưng hook truyền tải yếu | Làm lại 3 giây đầu creative | Tăng budget vì retention tốt |
| CPI thấp, level depth thấp | Traffic rẻ nhưng motivation không ăn với gameplay | Kiểm first-session proof và onboarding | Scale vì CPI rẻ |
| Challenge hook CTR cao, D1 thấp | Hook gây tò mò nhưng experience có thể unfair | Làm level đầu công bằng hơn, giảm bait | Làm hook còn cực đoan hơn |
| Relax hook CTR thấp, D1 ổn | Promise nhẹ có thể khó kéo click nhưng giữ đúng người | Test visual satisfaction angle gần với relax | Bỏ relax thesis quá sớm |

## Worked example: từ hook đến diagnosis

Giả sử bạn chạy 2 creative cho cùng một puzzle prototype.

*Ghi chú công thức*: **IPM** (Installs per Mille - Số lượt cài đặt trên 1000 lượt hiển thị) = `CTR * CVR * 10`. Chỉ số này giúp đánh giá năng lực thu hút và cài đặt thực tế của quảng cáo.

| Creative | Promise | CTR | Store CVR | IPM | D1 | Level depth | Diagnosis |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: | :--- |
| **A: “Only 1% solve this”** | Challenge | 4.5% | 15% | **6.7** | 12% | Thấp | Hook kéo tò mò tốt nhưng trải nghiệm gameplay không phù hợp thực tế của nhóm challenge seeker. |
| **B: “Clear the board and relax”** | Relax/satisfying | 2.5% | 35% | **8.7** | 28% | Tốt | Trải nghiệm game đáp ứng đúng lời hứa thư giãn, tạo hiệu quả chuyển đổi thực tế cao hơn (IPM cao hơn). |

Với beginner, kết luận không phải “A thắng vì CTR cao”. Kết luận hợp lý hơn là: A có attention nhưng motivation mismatch; B có thể là direction tốt hơn cho soft-launch nếu D1/level depth giữ được.

## First-session proof

First-session proof là bằng chứng trong 1-5 phút đầu rằng game thực sự làm được điều creative đã hứa.

### Bảng đối chiếu Event cần theo dõi:

| Hook promise | First-session phải chứng minh | Event nên track trong Unity |
| :--- | :--- | :--- |
| **Calm brain break** | Người chơi hiểu luật nhanh, ít fail/friction | `tutorial_complete`, `level_1_complete` |
| **Clear chaos** | Có board clear moment (khoảnh khắc dọn bảng) sớm | `first_clear_moment`, `level_complete` |
| **Only 1% solve this** | Có thử thách rõ nhưng không làm người chơi thấy bị lừa | `level_fail`, `level_retry`, `hint_used` |
| **Unlock room** | Meta reward xuất hiện đủ sớm để hiểu mục tiêu | `meta_unlock_view`, `reward_claim` |

> [!TIP]
> **Mẫu code gọi Event Unity (Analytics)**:
> Bạn có thể gọi ghi nhận sự kiện trong code C# của game như sau (thay thế bằng SDK Analytics của bạn):
> * `Analytics.LogEvent("tutorial_complete");`
> * `Analytics.LogEvent("level_complete", "level_index", 1);`

## Real usecases đã đối chiếu nguồn

Ở bài audience motivation map, usecase thực tế nên giúp bạn hỏi: **người chơi click vì động lực nào**, không chỉ “game này nổi tiếng”.

![Day 3 motivation map visual](content/assets/usecases/day-03-motivation-map-visual.svg)

*Visual minh họa: không phải official screenshot hay official campaign dashboard. Dùng để map hook -> motivation -> first-session proof theo case Monopoly GO! + Zego Studio.*

### Global case: Monopoly GO!

![Monopoly GO public screenshot](https://www.talkandroid.com/wp-content/uploads/2023/11/Monopoly-go-basics-e1701304768282-484x1024.jpeg)

*Public screenshot readout: ảnh bài viết TalkAndroid, credit Scopely, cho thấy board, dice, events/timers và navigation surface. Dùng để đọc motivation map: progression, completion, event urgency, social/light competition. Nguồn ảnh: [TalkAndroid Monopoly GO guide](https://www.talkandroid.com/37581-monopoly-go-beginners-guide/).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Monopoly GO! là mobile board game của Scopely, phát hành Android/iOS ngày 11/04/2023, dựa trên IP Monopoly; nguồn ghi có hơn 150 triệu downloads và 5 tỷ USD revenue từ khi launch. Nguồn: [Wikipedia - Monopoly GO!](https://en.wikipedia.org/wiki/Monopoly_Go%21) | Genre label “board game” không đủ để hiểu UA. Motivation có thể là collection, progression, social light competition, event urgency, completion. | Không suy ra game puzzle indie nên dùng IP lớn, ngân sách lớn, hay expectation revenue tương tự. |
| Nguồn mô tả loop: roll dice, earn money, upgrade landmarks, event như bank heist/take-down, Treasure Hunting theo thời gian giới hạn. | Motivation map phải nối hook với behavior: collection/progression hook cần first-session proof bằng landmark/reward/event, không chỉ core action. | Không copy liveops/event pressure nếu team chưa có capacity vận hành và nội dung. |

**Decision rule học được:** audience statement tốt không phải “người thích board game”; nó là “người thích hoàn thiện board/landmark, nhận reward theo event ngắn, và quay lại để tiến trình không bị ngắt”.

### Vietnam case: Zego Studio

![Zego Screw Sort public Google Play screenshot](https://play-lh.googleusercontent.com/sQsS9wAQxfcPO7s0oIcyEIZV_GaIGhxX84xbuq0iuzoeu1OhmeTd7OYPSoJXa5h1s7A1OwNn2RWNHOasNXYU=w720-h1280)

*Public screenshot readout: ảnh Google Play của Screw Sort 3D cho thấy object/action promise “screw sort” rất cụ thể. Dùng để map hook verb -> motivation -> first-session proof. Nguồn ảnh: [Screw Sort 3D on Google Play](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Google Play developer page của Zego Studio có nhiều hook khác nhau: Wool Sort, Kingdom Rescue Puzzle, Screw Sort 3D, Color Yarn Puzzle, Tile Match 3D, Grill Sort, Color Hoop. Nguồn: [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Cùng một publisher vẫn có nhiều motivation rows: sort/organize, rescue urgency, color/yarn satisfaction, tile match completion, object sorting. | Không suy ra mọi game trong catalog cùng audience hoặc cùng creative strategy. |
| Các tên game thường đưa action/object lên ngay trong title. | Với beginner, đây là bài học về clarity: hook nên chỉ ra action người chơi muốn làm và cảm giác họ sẽ nhận. | Không copy title structure máy móc nếu game của bạn không deliver đúng action đó trong first session. |

**Decision rule học được:** khi viết motivation map, thêm cột “real game pattern” và ghi nguồn. Nếu không tìm được nguồn public cho pattern, hạ confidence của motivation đó.

## Common mistakes

### Mistake 1: Dùng demographic thay cho motivation

“Nam nữ 18-45” không cho bạn biết phải làm creative nào, store screenshot nào, hay tutorial cần chứng minh gì.

Correction: viết audience bằng hành vi và nhu cầu. Ví dụ: “người muốn puzzle nhẹ để nghỉ não trong phiên ngắn”.

### Mistake 2: Một creative hứa nhiều motivation cùng lúc

Một ad vừa nói relax, vừa nói hard challenge, vừa nói unlock room có thể làm thông điệp loạn. Người click không biết kỳ vọng gì.

Correction: mỗi creative test nên có một motivation chính. Nếu muốn test nhiều motivation, dùng nhiều creative rows.

### Mistake 3: Không nối store page với hook

Ad hứa “clear chaos” nhưng screenshot đầu chỉ là level map hoặc UI menu. Người click không thấy bằng chứng ngay.

Correction: first screenshot phải xác nhận lời hứa chính của ad.

### Mistake 4: Đọc CTR như bằng chứng audience fit (Bẫy quảng cáo Clickbait)

CTR cao chỉ chứng minh quảng cáo gây tò mò tốt. Nhiều game mắc bẫy thiết kế video clickbait (quảng cáo không có trong game) khiến CTR tăng vọt, nhưng khi người chơi vào trang cửa hàng hoặc tải game, họ nhận ra sự khác biệt lớn (Store mismatch). Điều này dẫn tới CVR cực kỳ thấp và D1 gần như bằng 0.

Correction: Luôn đánh giá chất lượng ad bằng chỉ số tổng hợp IPM. Nếu CTR cao mà CVR thấp, hãy chẩn đoán ngay xem ad có đang overpromise hoặc dùng mồi nhử clickbait lệch tông với game thật hay không để điều chỉnh ad hook hoặc bổ sung nội dung game tương ứng.

## Lab output example

| Field | Example output |
| --- | --- |
| Primary motivation | Satisfying clear |
| Target audience | Adults who want a short, low-pressure puzzle with a clear visual payoff |
| Main hook | Clear chaos in one smart move |
| Store proof | First screenshot shows before/after board clear, not menu UI |
| First-session proof | Level 1-3 create one obvious clear moment within 90 seconds |
| Validation pattern | CTR/IPM acceptable, CVR not broken, level depth stronger than challenge hook |
| Risk | Hook creates curiosity but not daily habit |
| If weak | Test relax hook or improve early clear moment before changing market |

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Viết 5 motivation candidates: relax, satisfying clear, challenge, mastery, collection/meta.
2. Chấm confidence 1-5 cho từng motivation theo product hiện tại.
3. Chọn 2 motivation đáng test trước.
4. Với mỗi motivation, viết ad hook, store proof và first-session proof.
5. Viết metric pattern sẽ làm bạn giữ, sửa hoặc bỏ motivation đó.

## Final UA Plan Update

Cập nhật field **Target audience** theo format:

```text
Primary motivation: [motivation chính]
Audience statement: [người chơi + nhu cầu + ngữ cảnh chơi]
Main hook: [creative promise]
Store proof: [asset nào chứng minh promise]
First-session proof: [game phải chứng minh gì]
Validation pattern: [metric pattern cho thấy motivation fit]
Weak signal: [metric pattern cho thấy mismatch]
```

## Checklist Focus

- Viết audience bằng motivation, không bằng demographic chung chung.
- Tạo ít nhất 5 motivation candidates cho puzzle game.
- Chấm confidence 1-5 cho từng motivation dựa trên product hiện tại.
- Chọn 2 motivation đáng test trước với micro-budget.
- Gắn mỗi motivation với một ad hook riêng.
- Gắn mỗi hook với store proof and first-session proof.
- Viết metric pattern cho giữ/sửa/bỏ motivation.

## English Terms You Should Keep

- **Audience**: nhóm người chơi được định nghĩa bằng nhu cầu/hành vi, không chỉ demographic.
- **Motivation**: lý do cảm xúc hoặc hành vi khiến người chơi click, install và chơi tiếp.
- **Hook**: lời hứa ngắn trong creative để kéo attention.
- **Store proof**: bằng chứng trên store page xác nhận lời hứa từ ad.
- **First-session proof**: bằng chứng trong phiên đầu rằng game deliver đúng promise.

## Curated References

- Bài này không cần đọc tài liệu platform trước. Reference tốt nhất là creative + store page của 3 game puzzle bạn chọn ở Lesson 2.

> Practical rule: Every creative hook should map to one expected first-session behavior. If the hook promises challenge, tutorial and level pacing must prove challenge quickly.
', now()),
  ('lessons/day-04.md', 'markdown', null, '---
day: 4
title: "Funnel from impression to retained player"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Funnel, IPM, CVR]
artifact: "Funnel leak map"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Funnel leak map** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Funnel leak map** để làm rõ phần **mốc metric quyết định** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

The UA funnel is a chain: impression, click, store view, install, first open, tutorial, session depth, return and revenue. A weak metric is usually a clue about one link, not a final verdict on the game.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

High CTR and low store CVR suggests the ad hook got attention but the store did not confirm it. Low CPI and low D1 may mean the promise attracted the wrong player or the first session failed.

## Decision Rule
Quy tắc quyết định cho bài này:

Never optimize the nearest visible metric without asking which funnel link produced it.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Create a funnel leak map with one metric per link. Mark which links your current build can measure today.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add metric targets as decision ranges: attention, install conversion, early retention and revenue signal.

## Checklist Focus
- Write your funnel from impression to D1 return.
- Mark which events/metrics you can measure now.
- Add one decision range for store conversion or early retention.
- Name the funnel link you expect to be weakest.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.

## English Terms You Should Keep
- **Funnel**
- **IPM**
- **CVR**

## Curated References
- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab.

> Practical rule: Never optimize the nearest visible metric without asking which funnel link produced it.
', now()),
  ('lessons/day-05.md', 'markdown', null, '---
day: 5
title: "Micro soft-launch strategy"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Soft launch, Retention, Cohort]
artifact: "Micro soft-launch outline"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Micro soft-launch outline** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Micro soft-launch outline** để làm rõ phần **ngân sách micro test** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

A micro soft-launch is not a miniature global launch. It is a controlled learning sprint. With small spend, you can detect obvious promise, tracking and onboarding problems; you usually cannot prove long-term scale economics.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A $300 Android puzzle test may show whether first-session retention is broken and whether one hook earns installs. It should not be used to claim stable ROAS across channels.

## Decision Rule
Quy tắc quyết định cho bài này:

Use micro-budget to eliminate bad assumptions, not to declare a winner from tiny cohorts.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write a 7-day test outline: region, channel, creatives, daily cap, stop-loss rule and what evidence would justify another test.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add initial budget, daily cap and stop-loss rule to Final UA Plan.

## Checklist Focus
- Pick a micro-budget range and daily cap.
- Define what the test is allowed to conclude.
- Write one stop-loss rule for bad early signal.
- Update the budget field in Final UA Plan.

## Case / Tool Link
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.

- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.

## English Terms You Should Keep
- **Soft launch**
- **Retention**
- **Cohort**

## Curated References
- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab.

> Practical rule: Use micro-budget to eliminate bad assumptions, not to declare a winner from tiny cohorts.
', now()),
  ('lessons/day-06.md', 'markdown', null, '---
day: 6
title: "Channel map for small Unity teams"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Ad network, Campaign, Optimization]
artifact: "Channel selection note"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Channel selection note** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Channel selection note** để làm rõ phần **ngân sách micro test** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Channels are not interchangeable. Some are better for creative learning, some for intent, some for scale, and some require more conversion volume than a micro-budget can provide. For a first puzzle test, the question is often which channel can teach you fastest without requiring a mature account.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If you have three clean video hooks, a creative-friendly social channel may teach promise quickly. If your store page is weak, ASO and listing cleanup may be the better first move.

## Decision Rule
Quy tắc quyết định cho bài này:

Pick one primary channel for the first learning sprint. Splitting tiny budget across many channels usually creates noise.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Score three channels from 1-5 on budget fit, creative fit, measurement complexity and speed of learning.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add the first channel choice and why it matches your learning goal.

## Checklist Focus
- List three possible channels and one reason for each.
- Choose one primary channel for the first sprint.
- Write why the channel matches your creative and budget.
- Record what you will not test yet.

## Case / Tool Link
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Ad network**
- **Campaign**
- **Optimization**

## Curated References
- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab.

> Practical rule: Pick one primary channel for the first learning sprint. Splitting tiny budget across many channels usually creates noise.
', now()),
  ('lessons/day-07.md', 'markdown', null, '---
day: 7
title: "Week 1 synthesis: first UA hypothesis"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, Soft launch]
artifact: "First UA hypothesis card"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **First UA hypothesis card** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **First UA hypothesis card** để làm rõ phần **giả thuyết game** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

The end of Week 1 should produce a hypothesis card, not a pile of notes. The card should say who the test is for, what promise will be tested, where the signal appears and what action follows.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

For a calming block puzzle: ''Adults seeking low-pressure brain breaks will install from a 10-second satisfying-clear hook; if D1 and tutorial completion are weak, we revise first-session clarity before new creatives.''

## Decision Rule
Quy tắc quyết định cho bài này:

If the hypothesis does not name a decision rule, it is still just an idea.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write the card in five lines: player, promise, channel, metric, action.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Replace the rough hypothesis with the Week 1 hypothesis card.

## Checklist Focus
- Write the five-line hypothesis card.
- Remove vague phrases like ''everyone'' or ''fun gameplay''.
- Add a next action for good and bad signal.
- Confirm Week 2 measurement needs.

## Case / Tool Link
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.

- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.

## English Terms You Should Keep
- **UA**
- **Funnel**
- **Soft launch**

## Curated References
- Module này ưu tiên thực hành trên plan của bạn, không cần đọc reference ngoài trước khi làm lab.

> Practical rule: If the hypothesis does not name a decision rule, it is still just an idea.
', now()),
  ('lessons/day-08.md', 'markdown', null, '---
day: 8
title: "Metric map for puzzle UA"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, Retention, ARPDAU]
artifact: "Metric decision map"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Metric decision map** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Metric decision map** để làm rõ phần **mốc metric quyết định** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Metrics are useful only when attached to decisions. CPI answers cost of entry, IPM answers creative-market fit, retention answers product promise, ARPDAU answers monetization depth, and ROAS answers whether paid growth may eventually pay back.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A puzzle game can have acceptable CPI but poor D1 because players do not understand the first board. That is not a media buying problem yet.

## Decision Rule
Quy tắc quyết định cho bài này:

Define a primary metric per learning question and supporting metrics to prevent false confidence.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Make a table with question, primary metric, supporting metric and action for four decisions.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Update metric targets as ranges tied to decisions, not universal benchmarks.

## Checklist Focus
- Map four metrics to four decisions.
- Separate acquisition, retention and monetization signals.
- Write one supporting metric for each primary metric.
- Update metric targets in Final UA Plan.

## Case / Tool Link
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.
- Break-even CPI guardrail: Estimate a rough CPI ceiling from LTV and gross margin assumptions.

## English Terms You Should Keep
- **CPI**
- **Retention**
- **ARPDAU**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: Define a primary metric per learning question and supporting metrics to prevent false confidence.
', now()),
  ('lessons/day-09.md', 'markdown', null, '---
day: 9
title: "CPI, CTR, CVR and IPM without vanity traps"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, CTR, CVR, IPM]
artifact: "Acquisition signal readout"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Acquisition signal readout** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Acquisition signal readout** để làm rõ phần **mốc metric quyết định** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

CTR tells you whether the ad earns attention. CVR tells you whether the store page turns interest into installs. IPM combines impression-to-install efficiency. CPI tells you cost, but it does not prove user quality.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A shocking puzzle fail ad may get high CTR, but if screenshots show a different game style, CVR and retention can collapse.

## Decision Rule
Quy tắc quyết định cho bài này:

A cheap CPI is not a win until retention or revenue quality supports it.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write three metric patterns and likely diagnosis: high CTR/low CVR, low CTR/high CVR, low CPI/low D1.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add acquisition metric ranges and the diagnosis you will apply to each pattern.

## Checklist Focus
- Write definitions for CPI, CTR, CVR and IPM in your own words.
- Attach each metric to a funnel link.
- Define one bad-pattern diagnosis.
- Update metric decision ranges.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **CPI**
- **CTR**
- **CVR**
- **IPM**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: A cheap CPI is not a win until retention or revenue quality supports it.
', now()),
  ('lessons/day-10.md', 'markdown', null, '---
day: 10
title: "Retention cohorts and first-session proof"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Retention, Cohort, Onboarding]
artifact: "First-session proof checklist"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **First-session proof checklist** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **First-session proof checklist** để làm rõ phần **tracking và event taxonomy** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Retention is not just a number on day 1 or day 7. It is a cohort story: which group installed, what promise they saw, what happened in the first session and whether they had a reason to return.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If many players leave before level 4, a puzzle game may need clearer early wins, faster board satisfaction or better difficulty ramp before buying more traffic.

## Decision Rule
Quy tắc quyết định cho bài này:

Before blaming traffic, inspect whether the first session proves the ad promise within the first few minutes.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write your first-session proof checklist: first board clear, tutorial completion, level 3 reach, second session hook.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add required retention/first-session events to tracking.

## Checklist Focus
- Define the first-session proof events.
- Mark the earliest point players can feel the core puzzle value.
- Write one onboarding risk.
- Update tracking checklist.

## Case / Tool Link
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.

## English Terms You Should Keep
- **Retention**
- **Cohort**
- **Onboarding**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: Before blaming traffic, inspect whether the first session proves the ad promise within the first few minutes.
', now()),
  ('lessons/day-11.md', 'markdown', null, '---
day: 11
title: "ARPDAU, LTV and payback for ads plus light IAP"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ARPDAU, LTV, Payback window]
artifact: "Rough economics note"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Rough economics note** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Rough economics note** để làm rõ phần **mốc metric quyết định** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

For a puzzle game with ads plus light IAP, early monetization is usually noisy. ARPDAU and retention together create a rough ceiling. The goal is not perfect finance; it is knowing when CPI is clearly too high for your current economy.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A game with good D1 but low rewarded-ad engagement may need monetization placement work before campaign scale.

## Decision Rule
Quy tắc quyết định cho bài này:

Do not scale spend just because retention is acceptable if payback math has no plausible path.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Estimate rough LTV with conservative, expected and optimistic assumptions. Write which product change could move each input.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add rough economics and payback assumptions to metric targets.

## Checklist Focus
- Write conservative, expected and optimistic LTV assumptions.
- Identify whether ads or light IAP is the main early revenue driver.
- Set a payback window assumption.
- Update metric targets with economics guardrails.

## Case / Tool Link
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.

- Break-even CPI guardrail: Estimate a rough CPI ceiling from LTV and gross margin assumptions.

## English Terms You Should Keep
- **ARPDAU**
- **LTV**
- **Payback window**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: Do not scale spend just because retention is acceptable if payback math has no plausible path.
', now()),
  ('lessons/day-12.md', 'markdown', null, '---
day: 12
title: "ROAS windows and signal delay"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ROAS, LTV, Payback window]
artifact: "ROAS decision window"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **ROAS decision window** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **ROAS decision window** để làm rõ phần **tiêu chí scale/iterate** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

ROAS is a time-window metric. Day 0, Day 3, Day 7 and Day 30 can tell different stories. With micro-budget, use ROAS as a directional guardrail alongside retention and monetization behavior.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A puzzle game with D7 ROAS below target but strong D1 and ad engagement may deserve a monetization iteration, not immediate creative abandonment.

## Decision Rule
Quy tắc quyết định cho bài này:

Every ROAS target must include a time window, sample caveat and action.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write three rules: hold, iterate or stop based on D1/D7 retention, CPI and early revenue.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add success criteria with time windows and sample caveats.

## Checklist Focus
- Choose the first ROAS window you will inspect.
- Write one hold rule and one stop rule.
- Pair ROAS with retention and CPI.
- Update success criteria.

## Case / Tool Link
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.

## English Terms You Should Keep
- **ROAS**
- **LTV**
- **Payback window**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: Every ROAS target must include a time window, sample caveat and action.
', now()),
  ('lessons/day-13.md', 'markdown', null, '---
day: 13
title: "Attribution, ATT, SKAN and Android privacy signals"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Attribution, ATT, SKAN]
artifact: "Measurement risk note"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Measurement risk note** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Measurement risk note** để làm rõ phần **tracking và event taxonomy** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Modern mobile UA measurement is privacy-constrained. iOS ATT and SKAN/AdAttributionKit-era reporting reduce user-level certainty. Android privacy changes also move attribution toward protected, aggregated or delayed reporting. Your plan must assume missing, delayed or modeled data.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If two dashboards disagree, the right response is not panic. Check windows, attribution source, event definitions and whether the decision can be made from directional signal.

## Decision Rule
Quy tắc quyết định cho bài này:

When attribution is incomplete, make smaller decisions and write confidence level beside the metric.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Create a measurement risk note: which metrics are direct, delayed, modeled or unavailable in your first test.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add measurement limitations and confidence notes to tracking.

## Checklist Focus
- List metrics likely to be delayed or modeled.
- Write one dashboard reconciliation risk.
- Add a confidence label to your key decision metric.
- Update tracking with privacy/attribution caveats.

## Case / Tool Link
- SDK readiness blocks launch: Delay paid traffic until event validation and disclosure review are complete.


## English Terms You Should Keep
- **Attribution**
- **ATT**
- **SKAN**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: When attribution is incomplete, make smaller decisions and write confidence level beside the metric.
', now()),
  ('lessons/day-14.md', 'markdown', null, '---
day: 14
title: "Event taxonomy for Unity games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Event taxonomy, Attribution, Cohort]
artifact: "Unity event taxonomy v1"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Unity event taxonomy v1** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Unity event taxonomy v1** để làm rõ phần **tracking và event taxonomy** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

A Unity event taxonomy should be designed from decisions backward. Names must be stable, parameters limited and meaningful, and events must map to funnel questions: install quality, tutorial proof, level depth, session return, ad monetization and purchase behavior.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

For puzzle: first_open, tutorial_complete, level_start, level_complete, fail, hint_used, rewarded_ad_watched, interstitial_shown, purchase_complete and session_start may be enough for the first test.

## Decision Rule
Quy tắc quyết định cho bài này:

If an event will not change a UA/product decision, keep it out of v1.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write ten v1 events with event purpose, required parameters and the decision each event supports.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Replace the tracking checklist with event taxonomy v1.

## Checklist Focus
- Write ten v1 events for the first test.
- Add one purpose and one key parameter per event.
- Remove events that do not support a decision.
- Update tracking in Final UA Plan.

## Case / Tool Link
- SDK readiness blocks launch: Delay paid traffic until event validation and disclosure review are complete.


## English Terms You Should Keep
- **Event taxonomy**
- **Attribution**
- **Cohort**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: If an event will not change a UA/product decision, keep it out of v1.
', now()),
  ('lessons/day-15.md', 'markdown', null, '---
day: 15
title: "Creative hooks from player motivation"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Creative testing, CTR, IPM]
artifact: "Hook bank"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Hook bank** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Hook bank** để làm rõ phần **creative matrix** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

A hook is the first promise a player sees. Good hooks are specific enough to test: impossible challenge, satisfying clear, relaxing daily routine, clever trick, progression reward or social proof.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

For puzzle, ''Can you clear this impossible board?'' and ''Clean the chaos in one move'' test different motivations and should not be mixed in the same learning cell.

## Decision Rule
Quy tắc quyết định cho bài này:

One creative cell should test one motivation, not five ideas at once.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write six hooks: two challenge, two satisfaction, one relaxation and one progression hook.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Start the creative matrix with hooks, promise and expected signal.

## Checklist Focus
- Write six hooks grouped by motivation.
- Choose three hooks for the first test.
- Define expected signal for each hook.
- Update creative matrix.

## Case / Tool Link
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Creative testing**
- **CTR**
- **IPM**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: One creative cell should test one motivation, not five ideas at once.
', now()),
  ('lessons/day-16.md', 'markdown', null, '---
day: 16
title: "Video, static and playable concepts"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Playable ad, Creative testing, IPM]
artifact: "Format selection matrix"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Format selection matrix** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Format selection matrix** để làm rõ phần **creative matrix** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Format choice is a learning decision. Static can test promise cheaply. Short video can show before/after and motion clarity. Playable concepts can prove interaction but cost more and can mislead if the playable differs from the real game.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A puzzle game may start with three short videos showing board setup, one satisfying move and result screen before building any playable.

## Decision Rule
Quy tắc quyết định cho bài này:

Use the cheapest format that can honestly prove the hook.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

For your top three hooks, choose static, video or playable concept and write why.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add format and production cost notes to the creative matrix.

## Checklist Focus
- Choose a format for each top hook.
- Write what each format can prove.
- Avoid formats that overpromise the build.
- Update creative matrix with production scope.

## Case / Tool Link
- Hybrid-casual runner: low CPI, low intent: Treat cheap traffic as low-intent until first-session depth improves.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Playable ad**
- **Creative testing**
- **IPM**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Use the cheapest format that can honestly prove the hook.
', now()),
  ('lessons/day-17.md', 'markdown', null, '---
day: 17
title: "Creative test matrix"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Creative testing, CTR, CVR]
artifact: "Creative test matrix v1"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Creative test matrix v1** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Creative test matrix v1** để làm rõ phần **creative matrix** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

A test matrix prevents random creative iteration. Rows should define hook, format, variant change, learning goal, primary metric and next action. If two variants differ in hook, visual style and CTA, the result will be hard to interpret.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Variant A shows the board before the satisfying move. Variant B starts after the move. Same hook, different opening. That is interpretable.

## Decision Rule
Quy tắc quyết định cho bài này:

Change one major variable per cell when the budget is small.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Create a 3x2 matrix: three hooks, two variants each, one primary learning goal per row.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Replace rough creative notes with matrix v1.

## Checklist Focus
- Build a 3x2 creative matrix.
- Define one primary metric for each row.
- Write the action for win, weak signal or loss.
- Update creative matrix in Final UA Plan.

## Case / Tool Link
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.
- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.

## English Terms You Should Keep
- **Creative testing**
- **CTR**
- **CVR**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Change one major variable per cell when the budget is small.
', now()),
  ('lessons/day-18.md', 'markdown', null, '---
day: 18
title: "ASO and store promise continuity"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [ASO, CVR, Store listing]
artifact: "Store promise checklist"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Store promise checklist** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Store promise checklist** để làm rõ phần **creative matrix** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

The store page is the bridge between ad interest and install. If screenshots, icon or description do not confirm the ad promise, CVR suffers and traffic may be misread as low quality.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

An ad showing colorful block clears should not land on screenshots dominated by menus, meta progression or old art.

## Decision Rule
Quy tắc quyết định cho bài này:

Every top creative hook needs matching store proof.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write a store promise checklist: icon signal, first screenshot, first sentence, gameplay proof and privacy/data safety readiness.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add store continuity notes to creative matrix or success criteria.

## Checklist Focus
- Match each top hook to one store proof element.
- Audit icon and first screenshot for promise continuity.
- Write one store risk before spend.
- Update creative/store readiness notes.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.


## English Terms You Should Keep
- **ASO**
- **CVR**
- **Store listing**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Every top creative hook needs matching store proof.
', now()),
  ('lessons/day-19.md', 'markdown', null, '---
day: 19
title: "Competitor teardown without copying"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Genre-market fit, ASO, Creative testing]
artifact: "Competitor teardown sheet"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Competitor teardown sheet** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Competitor teardown sheet** để làm rõ phần **chân dung người chơi** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Competitor teardown is useful when it separates pattern from asset. Patterns include promise type, difficulty ramp, screenshot order, reward framing and monetization expectation. Copying visuals does not explain why the market responds.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Three successful puzzle listings may all show a near-fail board state in screenshot one. The pattern is ''immediate solvable tension'', not a specific board design to copy.

## Decision Rule
Quy tắc quyết định cho bài này:

Copy patterns of player motivation and proof, not protected creative execution.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Teardown three puzzle competitors: promise, first visual proof, monetization hint, weak spot and what you will test differently.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Update audience and creative notes with market patterns.

## Checklist Focus
- Teardown three puzzle competitors.
- Write one repeated market pattern.
- Write one way your game differs honestly.
- Update audience or creative matrix.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.


## English Terms You Should Keep
- **Genre-market fit**
- **ASO**
- **Creative testing**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Copy patterns of player motivation and proof, not protected creative execution.
', now()),
  ('lessons/day-20.md', 'markdown', null, '---
day: 20
title: "Creative fatigue and iteration cadence"
module: "Week 3 - Creative and store readiness"
stages: [live]
related_terms: [Creative fatigue, CTR, ROAS]
artifact: "Creative iteration rule"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Creative iteration rule** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Creative iteration rule** để làm rõ phần **tiêu chí scale/iterate** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Creative fatigue happens when the same asset stops reaching responsive users or the audience has seen it too often. Small teams should define iteration cadence in advance so they do not rebuild everything after one bad day.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If the same hook keeps good retention but CTR decays, build variations around the winning motivation. If retention is weak, changing colors may not fix the problem.

## Decision Rule
Quy tắc quyết định cho bài này:

Iterate around proven motivation; pivot only when the motivation itself fails.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write three iteration rules: refresh, variant, pivot. Attach each to a metric pattern.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add creative iteration rules to success criteria.

## Checklist Focus
- Define refresh, variant and pivot conditions.
- Attach each condition to a metric pattern.
- Write how many new creatives are realistic per week.
- Update success criteria.

## Case / Tool Link
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Creative fatigue**
- **CTR**
- **ROAS**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Iterate around proven motivation; pivot only when the motivation itself fails.
', now()),
  ('lessons/day-21.md', 'markdown', null, '---
day: 21
title: "Week 3 synthesis: creative and store readiness"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [ASO, Creative testing, Soft launch]
artifact: "Creative readiness packet"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Creative readiness packet** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Creative readiness packet** để làm rõ phần **creative matrix** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

By the end of Week 3, the game should have a small creative packet, not a backlog of vague ad ideas. The packet includes hooks, assets, store proof and rules for reading the result.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

For puzzle: three hooks, two video variants each, updated screenshots, one store description aligned to the main promise and a decision matrix.

## Decision Rule
Quy tắc quyết định cho bài này:

Do not launch traffic to a creative promise the store page cannot confirm.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Assemble your readiness packet and remove any creative that does not have matching store proof.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Finalize creative matrix v1 and store readiness notes.

## Checklist Focus
- Finalize three hooks and six variants or a smaller honest set.
- Confirm store proof for each top hook.
- Write acceptance and rejection rules.
- Update creative matrix in Final UA Plan.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **ASO**
- **Creative testing**
- **Soft launch**

## Curated References
- Google Play Data safety: https://support.google.com/googleplay/android-developer/answer/10787469

> Practical rule: Do not launch traffic to a creative promise the store page cannot confirm.
', now()),
  ('lessons/day-22.md', 'markdown', null, '---
day: 22
title: "Campaign structure for a micro test"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, Ad set, ROAS]
artifact: "Campaign structure note"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Campaign structure note** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Campaign structure note** để làm rõ phần **ngân sách micro test** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Campaign structure should reflect the learning goal. For micro-budget, keep structure simple: one channel, one region cluster, limited creative cells and clear naming. Complexity belongs after signal appears.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

A first Android puzzle test might use one campaign, one broad audience/region setup and six creatives grouped by hook, not ten tiny ad sets.

## Decision Rule
Quy tắc quyết định cho bài này:

Do not create more campaign cells than the budget can feed with meaningful installs.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write campaign name, channel, region, budget cap, creative cells and reporting columns.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add campaign structure to budget and success criteria.

## Checklist Focus
- Write one campaign structure for the first sprint.
- Limit cells to what budget can feed.
- Define naming convention for reports.
- Update budget and success criteria.

## Case / Tool Link
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.

- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.
- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Campaign**
- **Ad set**
- **ROAS**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: Do not create more campaign cells than the budget can feed with meaningful installs.
', now()),
  ('lessons/day-23.md', 'markdown', null, '---
day: 23
title: "Budget and sample-size sanity"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [CPI, Cohort, Sample size]
artifact: "Budget sanity sheet"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Budget sanity sheet** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Budget sanity sheet** để làm rõ phần **ngân sách micro test** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Sample size is not a magic number, but tiny cohorts are easy to misread. A $100-500 test should focus on strong directional signals and obvious failures. The budget must match the number of variants.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If expected CPI is $0.80 and you test eight creatives with $200, each creative may get too few installs for confidence.

## Decision Rule
Quy tắc quyết định cho bài này:

If the budget cannot feed the matrix, reduce variants before increasing conclusions.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Use the sample-size tool to compare 3, 6 and 9 creative cells under your budget.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Update budget with installs-per-variant expectation and confidence caveat.

## Checklist Focus
- Estimate installs per creative cell.
- Reduce the matrix if cells are underfed.
- Write confidence caveats for micro sample size.
- Update budget in Final UA Plan.

## Case / Tool Link
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.

- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.
- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **CPI**
- **Cohort**
- **Sample size**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: If the budget cannot feed the matrix, reduce variants before increasing conclusions.
', now()),
  ('lessons/day-24.md', 'markdown', null, '---
day: 24
title: "Reading campaign reports"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [CTR, IPM, Retention, ROAS]
artifact: "Report readout template"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Report readout template** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Report readout template** để làm rõ phần **tiêu chí scale/iterate** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

A report is useful when it explains signal by source: creative earned attention, store converted it, product retained it, monetization paid for it. Mixing these together creates bad fixes.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

High IPM with weak D1 means the creative may be efficient at attracting installs, but the product promise or user quality needs inspection.

## Decision Rule
Quy tắc quyết định cho bài này:

Every report readout must end with one recommended call: scale, iterate creative, fix store, fix product, fix tracking or stop.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write a one-page readout from a sample metric pattern using diagnosis, evidence, confidence and next action.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add report readout criteria to success criteria.

## Checklist Focus
- Separate metrics into creative, store, product and monetization buckets.
- Write diagnosis and confidence level.
- Choose one recommended call.
- Update success criteria.

## Case / Tool Link
- Puzzle ad hook wins clicks, store loses installs: Update store assets before blaming traffic quality.
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.

## English Terms You Should Keep
- **CTR**
- **IPM**
- **Retention**
- **ROAS**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: Every report readout must end with one recommended call: scale, iterate creative, fix store, fix product, fix tracking or stop.
', now()),
  ('lessons/day-25.md', 'markdown', null, '---
day: 25
title: "Scale, iterate or kill decision rules"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [ROAS, Retention, Creative testing]
artifact: "Scale-iterate-kill rules"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Scale-iterate-kill rules** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Scale-iterate-kill rules** để làm rõ phần **điều kiện pause/kill** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Scale, iterate or kill should not depend on how optimistic the team feels that day. Predefined rules protect small teams from chasing noise or killing a promising signal too early.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Scale cautiously if acquisition and retention both beat decision ranges. Iterate creative if attention is weak but retained users are good. Fix product if installs are cheap but first-session proof fails.

## Decision Rule
Quy tắc quyết định cho bài này:

A rule must include condition, action, owner and review date.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write three decision rules for scale, iterate and stop using metric patterns from your plan.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add kill criteria and scale/iterate conditions.

## Checklist Focus
- Write one scale rule.
- Write one iterate rule.
- Write one stop or pause rule.
- Update kill criteria.

## Case / Tool Link
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.
- Break-even CPI guardrail: Estimate a rough CPI ceiling from LTV and gross margin assumptions.

## English Terms You Should Keep
- **ROAS**
- **Retention**
- **Creative testing**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: A rule must include condition, action, owner and review date.
', now()),
  ('lessons/day-26.md', 'markdown', null, '---
day: 26
title: "SDK, privacy and store-risk readiness"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [ATT, SKAN, Event taxonomy]
artifact: "SDK readiness checklist"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **SDK readiness checklist** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **SDK readiness checklist** để làm rõ phần **tracking và event taxonomy** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

For Unity devs, UA readiness includes SDK count, consent flow, store data disclosures, ad placement behavior, build performance and event validation. This course stays conceptual, but the checklist should be concrete enough to hand to implementation.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Adding analytics, ads and attribution can change startup time, privacy disclosures and event quality. Those are launch risks, not just plugin tasks.

## Decision Rule
Quy tắc quyết định cho bài này:

No paid traffic before consent, event validation and store disclosure risks are reviewed.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write an SDK readiness checklist: SDKs, purpose, data collected, consent need, event validation and rollback plan.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add SDK/privacy readiness notes to tracking.

## Checklist Focus
- List SDKs and purpose.
- Write data/consent risk per SDK.
- Define event validation before campaign launch.
- Update tracking checklist.

## Case / Tool Link
- SDK readiness blocks launch: Delay paid traffic until event validation and disclosure review are complete.


## English Terms You Should Keep
- **ATT**
- **SKAN**
- **Event taxonomy**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: No paid traffic before consent, event validation and store disclosure risks are reviewed.
', now()),
  ('lessons/day-27.md', 'markdown', null, '---
day: 27
title: "Post-mortem and learning log"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Cohort, Creative testing, UA]
artifact: "Learning log entry"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Learning log entry** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Learning log entry** để làm rõ phần **tiêu chí scale/iterate** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

Small teams lose learning when decisions are not logged. A learning log captures hypothesis, setup, metrics, confidence, interpretation and next action. It also prevents the team from retesting the same vague idea later.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Instead of ''hook A won'', write ''satisfying clear hook had stronger IPM but weak D1, so it may attract curiosity without enough first-session proof.''

## Decision Rule
Quy tắc quyết định cho bài này:

A post-mortem must say which assumption changed.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write a learning log template and fill it with one hypothetical Week 1-3 test result.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add reporting cadence and learning log expectation to success criteria.

## Checklist Focus
- Create a learning log template.
- Fill one hypothetical test result.
- Write which assumption changed.
- Update success criteria or next-action notes.

## Case / Tool Link
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.


## English Terms You Should Keep
- **Cohort**
- **Creative testing**
- **UA**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: A post-mortem must say which assumption changed.
', now()),
  ('lessons/day-28.md', 'markdown', null, '---
day: 28
title: "Weekly UA operating rhythm"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, ROAS, Soft launch]
artifact: "Weekly operating cadence"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Weekly operating cadence** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Weekly operating cadence** để làm rõ phần **hành động tiếp theo** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

UA operation is a rhythm: choose question, ship build/store changes, launch assets, read signal, decide, log learning and prepare the next sprint. For indie teams, cadence matters because production time is the bottleneck.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

Monday choose decision, Tuesday export creatives, Wednesday launch, Friday read early signal, next Monday decide whether the build or creative changes.

## Decision Rule
Quy tắc quyết định cho bài này:

A cadence is valid only if it names owner, deadline and decision meeting.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write a weekly cadence with day-by-day responsibilities for build, creative, reporting and decision.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Add the immediate next action and weekly cadence.

## Checklist Focus
- Write a weekly cadence.
- Assign owner/deadline for build, creative and report tasks.
- Add next decision meeting.
- Update next action.

## Case / Tool Link
- Idle RPG creative spike with stable cohorts: Scale cautiously and produce variants around the same motivation.
- SDK readiness blocks launch: Delay paid traffic until event validation and disclosure review are complete.

- Creative test budget: Estimate spend needed for first-pass creative learning.

## English Terms You Should Keep
- **Campaign**
- **ROAS**
- **Soft launch**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies

> Practical rule: A cadence is valid only if it names owner, deadline and decision meeting.
', now()),
  ('lessons/day-29.md', 'markdown', null, '---
day: 29
title: "Build the one-page UA launch plan"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [UA, Soft launch, Event taxonomy]
artifact: "One-page launch plan"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **One-page launch plan** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **One-page launch plan** để làm rõ phần **hành động tiếp theo** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

The capstone is not a long strategy deck. It is a one-page operating plan: who the game is for, what promise is tested, how the build measures it, what assets run, how much is spent and what decision rules apply.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

For puzzle, the page should make it obvious whether the next sprint is creative production, tracking validation, store cleanup or campaign launch.

## Decision Rule
Quy tắc quyết định cho bài này:

If a plan field does not affect a launch decision, shorten it.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Fill every Final UA Plan field and cut each field until the preview fits one readable page.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Complete all plan fields, especially next action.

## Checklist Focus
- Fill every Final UA Plan field.
- Remove details that do not affect launch decisions.
- Check budget, tracking and creative are aligned.
- Write the first next action.

## Case / Tool Link
- Micro-budget false positive: Log the signal as interesting but avoid scale until more installs or repeated evidence exists.
- Puzzle soft-launch: cheap installs, weak D1: Pause scale and fix first-session proof before producing more traffic.

- Sample-size sanity check: Estimate whether a micro budget can feed the number of creative cells you want to test.
- Creative test budget: Estimate spend needed for first-pass creative learning.
- Break-even CPI guardrail: Estimate a rough CPI ceiling from LTV and gross margin assumptions.

## English Terms You Should Keep
- **UA**
- **Soft launch**
- **Event taxonomy**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: If a plan field does not affect a launch decision, shorten it.
', now()),
  ('lessons/day-30.md', 'markdown', null, '---
day: 30
title: "Stress-test risks and choose next action"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [Payback window, ROAS, Retention]
artifact: "Risk register and next action"
---

## Mục tiêu / Goal
Sau bài này, bạn tạo được **Risk register and next action** để đưa vào 1-page UA / soft-launch plan. Trong 25-35 phút, mục tiêu không phải nhớ thêm thật nhiều thuật ngữ, mà là có một quyết định rõ hơn cho puzzle mobile prototype-to-soft-launch.

## Khái niệm chính / Core Idea
Bài này dùng **Risk register and next action** để làm rõ phần **hành động tiếp theo** trong Final UA Plan. Với một puzzle mobile ở giai đoạn prototype-to-soft-launch, hãy đọc nội dung như một quyết định vận hành: bạn đang kiểm tra lời hứa nào, bằng metric nào, và nếu tín hiệu xấu thì sửa game, creative, store, tracking hay budget.

The final review should attack the plan. Look for weak assumptions: the promise may be unclear, tracking may be incomplete, store proof may be weak, budget may underfeed variants, or monetization may not support CPI.

## Puzzle Case Lens
Áp dụng vào case puzzle chính: hãy nhìn ví dụ dưới đây như một tình huống debug funnel, không phải một benchmark cố định.

If the strongest risk is event validation, the next action is not launching ads. It is running a build QA checklist and verifying events before spend.

## Decision Rule
Quy tắc quyết định cho bài này:

The next action must be small, dated and measurable.

## Practical Lab
Làm bài tập này trực tiếp trên game của bạn hoặc sample puzzle case. Kết quả cần đủ cụ thể để copy sang Final UA Plan.

Write top five risks, mitigation for each and the smallest next action with owner/date.

## Final UA Plan Update
Cập nhật đúng field liên quan trong plan, không ghi note chung chung.

Finalize next action, kill criteria and risk notes.

## Checklist Focus
- Write top five launch risks.
- Add mitigation for each risk.
- Choose one smallest next action with date/owner.
- Finalize the one-page plan.

## Case / Tool Link
- SDK readiness blocks launch: Delay paid traffic until event validation and disclosure review are complete.
- Live puzzle game: retention acceptable, ROAS short: Do not scale yet; test monetization placement and lower-cost creative angles.

- D1/D7 cohort readout: Turn basic cohort counts into retention, CPI and D7 ROAS directional signals.
- Break-even CPI guardrail: Estimate a rough CPI ceiling from LTV and gross margin assumptions.

## English Terms You Should Keep
- **Payback window**
- **ROAS**
- **Retention**

## Curated References
- Android Attribution Reporting for mobile: https://privacysandbox.google.com/private-advertising/attribution-reporting/android
- Google AdMob Unity privacy strategies: https://developers.google.com/admob/unity/privacy/strategies
- Apple AdAttributionKit: https://developer.apple.com/documentation/AdAttributionKit

> Practical rule: The next action must be small, dated and measurable.
', now())
on conflict (content_key) do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = excluded.updated_at;

commit;
