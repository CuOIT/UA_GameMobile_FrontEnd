---
name: lesson
description: Activates when the user requests lesson creation or optimization using /Lesson, /lesson, Lesson, or lesson followed by a day number.
---

# Lesson Generation & Optimization Skill (/lesson)

This skill activates when the user uses `/Lesson`, `/lesson`, or references a day number for lesson generation or review (e.g., `/Lesson 8`).

## Action Plan

When this skill is triggered, you MUST adhere to the following workflow to create or optimize a lesson:

### 1. Read Specifications & Persona Rules
- Always read and follow the lesson skeleton and guidelines defined in [lesson-format-spec.md](file:///d:/ua-marketing-platform/frontend/lesson-format-spec.md).
- Always read and follow the persona rules and restrictions defined in [AGENTS.md](file:///d:/ua-marketing-platform/frontend/.agents/AGENTS.md).

### 2. Determine File Path & Day Padded Number
- Target path: `d:\ua-marketing-platform\frontend\content\lessons\day-{padded}.md` where `{padded}` is the 2-digit zero-padded day number (e.g., `day-08.md`).

### 3. Generate High-Quality Visual Assets
- Do not leave placeholder text or placeholders for screenshots/diagrams.
- Automatically generate required visual assets (such as hero decision trees, data comparison charts, and storyboards) using the `generate_image` tool.
- Save generated assets to `content/assets/usecases/` and copy them to the workspace.
- For external screenshots (like Google Play or Apple App Store listings), download the images using PowerShell `Invoke-WebRequest` to host them locally in `content/assets/usecases/` to avoid CORS and cross-origin blocks.

### 4. Write Lesson Structure
Follow the canonical section order exactly:
1.  `## Mục tiêu / Goal`
2.  `## Why this matters`
3.  `## Core model`
4.  `## [Main framework or map] mẫu`
5.  `## [Hero visual or operating diagram]` (With detailed visual readout)
6.  `## [Chart / visual / table]` (With scenario-specific ranges instead of hard benchmarks)
7.  `## Hướng dẫn đọc số` (With decision rules and action plans)
8.  `## Worked example` (With diagnosis and tradeoff analysis)
9.  `## [Implementation / event / operating checklist]` (Quality chain verification checks)
10. `## Real usecases đã đối chiếu nguồn` (Must link directly to a specific teardown/analysis URL, never use generic homepages like `deconstructoroffun.com`, and include a screenshot readout table)
11. `## Common mistakes` (Mistake - Correction format)
12. `## English Terms You Should Keep`
13. `## Lab output example` (With card preview)
14. `## Practical Lab` (With quality chain check)
15. `## Final UA Plan Update` (Specifically mention which plan fields are updated)
16. `## Checklist Focus`
17. `## Curated References` (Verify and link to specific articles)

### 5. Final Output
- Output the test URL for the user: `http://localhost:4173/#lesson-{day}`.
