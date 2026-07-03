---
name: rlesson
description: Activates when the user requests a lesson review using /rlesson, /rLesson, rlesson, or rLesson followed by a day number (e.g. /rlesson 3).
---

# Lesson Review & Evaluation Skill (/rlesson)

This skill activates when the user uses `/rlesson`, `/rLesson`, or requests a review for a specific day's lesson (e.g., `/rlesson 3`).

## Action Plan

When this skill is triggered, you MUST adhere to the following workflow to evaluate the lesson:

### 1. Locate and Read the Lesson File
- Zero-pad the requested day number to 2 digits (e.g., `/rlesson 3` targets `day-03`).
- Locate the file at: `d:\ua-marketing-platform\frontend\content\lessons\day-{padded}.md` (e.g., [day-03.md](file:///d:/ua-marketing-platform/frontend/content/lessons/day-03.md)).
- Read the entire markdown content of the lesson using the `view_file` tool.

### 2. Evaluate against specs and rubrics
Score the lesson on a 1-5 scale based on the 7 criteria defined in [lesson-evaluation-rubric.md](file:///d:/ua-marketing-platform/frontend/lesson-evaluation-rubric.md):
1.  **Decision clarity**: Does it teach a specific, actionable decision with decision rules?
2.  **Teaching depth**: Is the explanation suited for Unity developers (coupling coding concepts like events, size, or loops)?
3.  **Metric literacy**: Are there tables, charts (`:::chart`), metric hierarchies, and does it use concrete UA metrics (e.g. *D1 Active Users per 10k Impressions*, *CPI USD*, *ROAS %*) rather than arbitrary scores?
4.  **Mistake coverage**: Are there at least 3 common mistakes formatted strictly as **Sai lầm (Mistake) - Khắc phục (Correction)**?
5.  **Worked example**: Is there a concrete, worked example with real/realistic numbers, diagnosis, and operational verdict?
6.  **Lab output example**: Is there a clear sample output of what the final lab should look like?
7.  **Actionability**: Does the learner know exactly what field of their Final UA Plan to update and how?

### 3. Generate Evaluation Report
Format the review report in Vietnamese using a table for the scorecard as requested:

```markdown
### I. Bảng điểm chất lượng (Scorecard)

| Tiêu chí | Điểm số | Lý do chi tiết |
| :--- | :---: | :--- |
| **Decision clarity** | X/5 | [Lý do chi tiết...] |
| **Teaching depth** | X/5 | [Lý do chi tiết...] |
| **Metric literacy** | X/5 | [Lý do chi tiết...] |
| **Mistake coverage** | X/5 | [Lý do chi tiết...] |
| **Worked example** | X/5 | [Lý do chi tiết...] |
| **Lab output** | X/5 | [Lý do chi tiết...] |
| **Actionability** | X/5 | [Lý do chi tiết...] |

### II. Top 5 cải tiến cần làm ngay (Top 5 fixes)
1. [Cải tiến 1]
2. [Cải tiến 2]
3. [Cải tiến 3]
4. [Cải tiến 4]
5. [Cải tiến 5]

### III. Hình ảnh/Bảng biểu còn thiếu (Missing visuals/tables)
- [Mô tả hình ảnh hoặc bảng cần bổ sung, bao gồm Caption 3 phần: Inspect, Conclude, Do not infer]

### IV. Phần ưu tiên viết lại (Rewrite priority)
1. [Tên mục cần viết lại 1] - Lý do
2. [Tên mục cần viết lại 2] - Lý do
```

### 4. Read-Only Constraint
- This action is **READ-ONLY**. Under no circumstances are you allowed to modify the lesson file or write any code during this evaluation step, unless the user explicitly requests follow-up modifications using implementing flags like `\c` or `\s`.
