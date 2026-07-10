---
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
