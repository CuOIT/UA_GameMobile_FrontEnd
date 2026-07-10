---
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
