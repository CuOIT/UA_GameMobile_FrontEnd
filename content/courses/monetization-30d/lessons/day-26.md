---
day: 26
title: "LiveOps cadence for monetization tests"
module: "Week 4 - Offers, LiveOps and operations"
stages: [live, prototype]
related_terms: [LiveOps, Cadence, Experiment]
artifact: "Monetization cadence calendar"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Monetization cadence calendar** cho game Mobile Puzzle làm bằng Unity. Quyết định chính: Choose the first four-week monetization operating rhythm.

Artifact này cập nhật field **nextAction** trong Final Monetization Plan. Bạn không cần trở thành monetization specialist; bạn cần biết chỗ nào nên đặt ads/IAP, event nào phải đo, và khi nào phải rollback vì revenue đang làm hỏng retention hoặc trust.

## Why this matters

Với team Unity Mobile nhỏ, monetization thường bị xử lý quá muộn: build xong mới gắn SDK, thêm rewarded ad vào chỗ dễ code nhất, hoặc tạo IAP catalog theo cảm giác. Cách đó dễ tạo số revenue nhìn có vẻ tốt nhưng làm yếu session, giảm D1/D7, hoặc khiến report không đọc được.

Mobile puzzle nhạy với nhịp chơi. Người chơi cần cảm giác kiểm soát, tiến bộ và giải được bài. Monetization tốt phải đi theo value exchange: người chơi hiểu họ nhận gì, game hiểu metric nào chứng minh điều đó, và team biết next action nếu số xấu.

## Core model: value -> placement -> signal -> action

Đừng hỏi "nên bật monetization gì?". Hãy hỏi theo thứ tự:

1. Người chơi đang ở khoảnh khắc nào của puzzle loop?
2. Monetization touch có giúp hoặc ít nhất không phá khoảnh khắc đó không?
3. Event nào chứng minh player saw, accepted, ignored, paid hoặc churned?
4. Nếu revenue tăng nhưng retention giảm, team sẽ keep, iterate hay rollback?

## Monetization cadence calendar mẫu

| Field | Điền gì | Dùng để quyết định |
| --- | --- | --- |
| Player moment | Người chơi vừa thắng, thua, kẹt, quay lại hay mở offer | Monetization có đúng ngữ cảnh không |
| Value exchange | Người chơi nhận hint, booster, continue, no-ads, cosmetic hay convenience | Offer/ad có lý do tồn tại không |
| Technical trigger | Unity event hoặc state machine transition kích hoạt touchpoint | Có tránh gameplay/UI coupling không |
| Metric signal | Retention, ARPDAU, impression/user, purchase conversion, refund/error | Đọc được tác động thật không |
| Guardrail | Cooldown, cap, rollback rule, no-show state | Có bảo vệ trust không |
| Next action | Keep, change placement, change reward, reduce frequency, rollback | Team biết làm gì sau readout |

## Operating visual

![LiveOps cadence for monetization tests](content/courses/monetization-30d/assets/usecases/day-26-monetization-chain.svg)

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

```text
Monetization cadence calendar
- Player moment:
- Monetization touch:
- Value exchange:
- Unity trigger/event:
- Primary metric:
- Guardrail:
- Rollback rule:
- Next action:
```

## Practical Lab

1. Chọn một touchpoint monetization duy nhất cho game puzzle của bạn.
2. Viết value exchange bằng một câu người chơi có thể hiểu.
3. Liệt kê events cần đo trước khi test.
4. Viết guardrail: metric nào xấu thì rollback.
5. Cập nhật Final Monetization Plan field **nextAction**.

## Final UA Plan Update

Thêm một đoạn ngắn vào **nextAction**:

```text
Monetization decision:
We will test [touchpoint] at [player moment] because [value exchange].
Primary signal is [metric], protected by [guardrail].
If [bad pattern], next action is [rollback/iterate/hold].
```

## Checklist Focus

- Artifact có player moment rõ, không chỉ tên ad/IAP.
- Có event hoặc QA evidence để đọc kết quả.
- Có guardrail bảo vệ retention/trust.
- Next action không mơ hồ.

## Curated References

- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) - Consent and privacy implementation considerations for Unity games using ads.
- [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) - Store disclosure expectations for SDKs and collected data.
- [Google Play Billing overview](https://developer.android.com/google/play/billing) - Android billing concepts that shape IAP implementation and compliance.
