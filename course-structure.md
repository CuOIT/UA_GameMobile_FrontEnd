# Cấu trúc khóa học UA Marketing

## Tổng quan

Khóa học hiện là bootcamp 30 ngày cho Unity indie/dev đang chuẩn bị micro soft-launch cho mobile puzzle game. Mỗi lesson được thiết kế như một workshop unit: đọc concept, xem case, áp dụng decision rule, làm lab, cập nhật Final UA Plan, tick checklist và trả lời quiz.

## Modules và Lessons

### Week 1 - UA fundamentals

1. Day 1 - UA as a product learning loop
2. Day 2 - Puzzle market thesis and genre fit
3. Day 3 - Audience motivation map
4. Day 4 - Funnel from impression to retained player
5. Day 5 - Micro soft-launch strategy
6. Day 6 - Channel map for small Unity teams
7. Day 7 - Week 1 synthesis: first UA hypothesis

### Week 2 - Metrics and measurement

8. Day 8 - Metric map for puzzle UA
9. Day 9 - CPI, CTR, CVR and IPM without vanity traps
10. Day 10 - Retention cohorts and first-session proof
11. Day 11 - ARPDAU, LTV and payback for ads plus light IAP
12. Day 12 - ROAS windows and signal delay
13. Day 13 - Attribution, ATT, SKAN and Android privacy signals
14. Day 14 - Event taxonomy for Unity games

### Week 3 - Creative and store readiness

15. Day 15 - Creative hooks from player motivation
16. Day 16 - Video, static and playable concepts
17. Day 17 - Creative test matrix
18. Day 18 - ASO and store promise continuity
19. Day 19 - Competitor teardown without copying
20. Day 20 - Creative fatigue and iteration cadence
21. Day 21 - Week 3 synthesis: creative and store readiness

### Week 4 - Campaign operation

22. Day 22 - Campaign structure for a micro test
23. Day 23 - Budget and sample-size sanity
24. Day 24 - Reading campaign reports
25. Day 25 - Scale, iterate or kill decision rules
26. Day 26 - SDK, privacy and store-risk readiness
27. Day 27 - Post-mortem and learning log
28. Day 28 - Weekly UA operating rhythm

### Capstone

29. Day 29 - Build the one-page UA launch plan
30. Day 30 - Stress-test risks and choose next action

## Cấu trúc chung của một Lesson

Canonical rich format hiện tại là `frontend/content/lessons/day-03.md`.
Spec chuẩn hoá chi tiết nằm tại `frontend/lesson-format-spec.md`.

### Metadata trong `content/course.json`

Mỗi lesson có các field chính:

- `day`: số ngày trong khóa học.
- `title`: tên bài học.
- `module`: module/tuần của bài.
- `summary`: tóm tắt ngắn.
- `stages`: giai đoạn phù hợp, ví dụ `idea`, `prototype`, `live`.
- `difficulty`: mức độ, ví dụ `Beginner`, `Core`, `Practical`.
- `estimatedMinutes`: thời lượng dự kiến, hiện là 30 phút.
- `glossaryTerms`: các thuật ngữ liên quan.
- `quizId`: id quiz tương ứng trong `quizzes.json`.
- `checklistId`: id checklist tương ứng trong `checklists.json`.
- `markdown`: đường dẫn file nội dung lesson.
- `learningOutcome`: kết quả người học cần đạt sau bài.
- `artifact`: artifact cần tạo sau bài, ví dụ hypothesis card, event taxonomy, creative matrix.
- `planField`: field trong Final UA Plan mà bài này cập nhật.
- `caseIds`: các case liên quan trong `cases.json`.
- `toolIds`: các calculator/tool liên quan trong `calculators.json`.
- `referenceIds`: các curated reference liên quan.

### Markdown body trong `content/lessons/day-XX.md`

Mỗi bài workshop cơ bản từng có format chung:

```md
---
day: number
title: "Lesson title"
module: "Module name"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
artifact: "Artifact name"
---

## Mục tiêu / Goal
## Khái niệm chính / Core Idea
## Puzzle Case Lens
## Decision Rule
## Practical Lab
## Final UA Plan Update
## Checklist Focus
## Case / Tool Link
## English Terms You Should Keep
## Curated References
```

## Sidebar hiển thị trong app khi mở lesson

Khi người học mở một lesson, app render thêm các khối phụ:

- Related glossary
- Checklist
- Quiz
- Related cases
- Useful tools
- Curated references

## Ghi chú chất lượng nội dung

Cấu trúc workshop ngắn ở trên không còn là chất lượng đích cho các bài đã được nâng cấp. Mục tiêu mới là rich lesson format kiểu `day-03`: có `Why this matters`, `Core model`, bảng mẫu, chart/visual, worked example, source-linked usecases, common mistakes, lab output example và plan update đủ chi tiết để người không biết UA vẫn dùng được.
