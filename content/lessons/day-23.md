---
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
