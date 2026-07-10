---
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
