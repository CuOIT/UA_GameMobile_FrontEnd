---
day: 11
title: "ARPDAU, LTV and payback for ads plus light IAP"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ARPDAU, LTV, Payback window]
artifact: "Rough economics note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Rough economics note**: một ghi chú kinh tế đủ đơn giản để quyết định có nên tiếp tục mua traffic, giảm spend, hay sửa monetization trước.

Bạn sẽ không xây mô hình tài chính phức tạp. Bạn sẽ viết một guardrail vận hành:

- `ARPDAU` hiện tại có đủ để nuôi `CPI` không?
- `LTV` early estimate đang nằm dưới hay gần economics ceiling?
- `Payback window` có hợp với budget và runway của team không?
- Nếu retention ổn nhưng revenue yếu, sửa rewarded ad/IAP ở đâu?
- Nếu revenue ngày đầu cao nhưng retention sụp, có phải monetization đang quá gắt không?

Plan field cập nhật: **metricTargets**. Artifact: **Rough economics note**.

---

## Why this matters

Sau Day 9-10, bạn biết cách đọc acquisition và first-session quality. Nhưng một game live vẫn có thể gặp câu hỏi khó hơn: “Nếu user có vẻ ổn, mình có được mua thêm user không?”

Team indie thường rơi vào hai lỗi:

- Không tính economics vì nghĩ `$100-500` quá nhỏ để đo.
- Tính economics quá tự tin, lấy vài ngày doanh thu non rồi forecast như chắc chắn.

Cả hai đều nguy hiểm. Nếu `CPI` là `$0.60` còn LTV direction chỉ quanh `$0.20`, scale chỉ phóng to lỗ. Nếu retention ổn nhưng `ARPDAU` thấp, dừng UA ngay có thể bỏ lỡ cơ hội sửa rewarded placement. Nếu `ARPDAU` cao do ép interstitial quá sớm nhưng D1 sụp, revenue đó là “đốt cohort”, không phải monetization khỏe.

Rough economics note giúp bạn đặt stop-loss trước khi cảm xúc thắng spreadsheet.

---

## Core model: economics ceiling, not exact prediction

Với game puzzle ads + light IAP, bạn đọc economics bằng 4 khối:

```text
Retention depth -> Lifetime days
Monetization intensity -> ARPDAU
Lifetime days * ARPDAU -> rough LTV
Rough LTV vs CPI -> buy / hold / stop decision
```

Các công thức dùng cho sprint:

```text
ARPDAU = daily revenue / DAU

Rough LTV ≈ estimated lifetime active days * ARPDAU

Payback ratio at day N = cumulative revenue by cohort / acquisition cost for that cohort

Stop-loss CPI ceiling = rough LTV * safety margin
```

Safety margin là phần giảm trừ để tránh forecast lạc quan. Ví dụ rough LTV direction là `$0.30`, team có thể đặt stop-loss CPI quanh `$0.18-$0.22` cho sprint này, tùy độ tin của data. Đây không phải công thức luật cứng; nó là cách bảo vệ budget khi signal còn non.

---

## Khung Rough economics note mẫu

| Field | Cách điền | Vì sao cần |
| :--- | :--- | :--- |
| **Cohort scope** | Platform, country, channel, build version, install date. | Không trộn paid/organic hoặc build cũ/mới. |
| **Revenue mix** | Ad %, IAP %, rewarded/interstitial/no-ads pack. | Biết doanh thu đến từ đâu và có phá retention không. |
| **Retention anchor** | D1/D7/session depth hoặc lifetime active days estimate. | LTV không thể cao nếu user rời quá sớm. |
| **ARPDAU direction** | Daily revenue / DAU theo cohort hoặc live segment. | Đo tốc độ kiếm tiền mỗi active user. |
| **Rough LTV range** | Conservative / expected / optimistic. | Không tin một con số duy nhất. |
| **Payback window** | Khi nào revenue cần bù đủ CPI? D7, D30, D60? | Biết team có đủ runway chờ không. |
| **Stop-loss CPI** | CPI trần cho sprint này, có safety margin. | Ngăn scale khi economics âm. |
| **Next action** | Scale nhẹ, hold, fix monetization, fix retention, hoặc stop. | Biến spreadsheet thành quyết định. |

Một note tốt luôn có dòng **Do not conclude**. Ví dụ: “Không kết luận LTV thật của game; đây chỉ là early guardrail cho paid test nhỏ.”

### Revenue quality and confidence layer

Không phải mọi revenue đều có cùng chất lượng. Với game puzzle nhỏ, revenue tốt là revenue xuất hiện **sau khi người chơi đã hiểu giá trị game**, không phá retention, và có thể lặp lại ở cohort kế tiếp. Revenue xấu là revenue đến từ việc ép quảng cáo quá sớm, làm D1/D3 rơi, hoặc chỉ xuất hiện trong một sample nhỏ rồi biến mất.

| Revenue signal | Confidence nếu... | Decision được phép | Không được kết luận |
| :--- | :--- | :--- | :--- |
| Rewarded opt-in tăng | User tự chọn xem ad sau một value moment, D1/session depth không giảm | tối ưu reward value, placement, frequency | cứ thêm rewarded là LTV tăng |
| Interstitial revenue tăng | xuất hiện sau first win/level depth, frequency cap rõ | test cap nhẹ và đọc retention guardrail | ARPDAU cao là monetization khỏe |
| No-ads/IAP purchase có vài đơn | purchase gắn với pain point rõ và cohort không quá nhỏ | viết IAP hypothesis, test copy/price nhẹ | payer conversion đã ổn định |
| ARPDAU tăng nhưng D1 giảm | revenue đến cùng retention damage | giảm ad pressure, kiểm placement | scale vì revenue/day đẹp |
| Paid LTV thấp hơn organic | paid traffic intent khác hoặc promise mismatch | tách cohort, đọc lại creative/store promise | dùng organic LTV để justify paid UA |

Confidence label nên đi cùng mỗi economics verdict:

```text
Economics confidence:
- High enough to pause scale: CPI is far above rough LTV range.
- Medium to test monetization: retention is workable, revenue mix has clear placement hypotheses.
- Low to forecast LTV: cohort is small and payback window is immature.
```

Khi confidence khác nhau, quyết định cũng phải khác nhau. Bạn có thể **dừng scale** với confidence cao hơn việc **dự báo LTV thật**.

---

## Sơ đồ tính rough LTV

```text
![LTV calculation components](content/assets/usecases/day-11-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Sơ đồ tính rough LTV.
Previous local asset to replace: content/assets/usecases/day-11-hero-diagram.png.
Visual brief: LTV calculation components.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Nhìn hai nhánh chính: retention tạo lifetime active days, còn monetization tạo `ARPDAU`. LTV direction chỉ xuất hiện khi hai nhánh này cùng tồn tại.
>
> **Conclude**: Nếu một nhánh yếu, đừng cố chữa bằng nhánh còn lại quá sớm. ARPDAU cao nhưng retention sụp có thể là ad aggression. Retention ổn nhưng ARPDAU thấp có thể là under-monetized.
>
> **Do not infer**: Không suy ra tăng số ad sẽ tự tăng LTV. Nếu ads phá first-session hoặc D1, lifetime days giảm và LTV có thể đi xuống.

---

## Bảng scenario LTV và CPI ceiling

Các số dưới đây là **scenario example** cho một live puzzle nhỏ có ads + light IAP. Dùng để học cách đặt guardrail, không dùng làm benchmark.

| Scenario | Retention / lifetime days direction | ARPDAU direction | Rough LTV | Stop-loss CPI idea | Decision posture |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Conservative** | D1 yếu hoặc session depth mỏng, ~2-3 active days | $0.015-$0.025 | $0.03-$0.08 | Rất thấp | Stop paid UA; fix product/monetization. |
| **Expected** | First-session ổn, D1/D7 đủ để học tiếp, ~4-6 active days | $0.035-$0.060 | $0.14-$0.36 | Có safety margin dưới LTV | Hold or run controlled tests. |
| **Optimistic** | Retention dày hơn cohort trước, ~7-10 active days | $0.070-$0.110 | $0.49-$1.10 | Có room scale nhỏ | Scale cautiously, watch guardrails. |

```text
![LTV projection scenarios](content/assets/usecases/day-11-data-visual.svg)Type: data visual/chart.
Lesson section: Bảng scenario LTV và CPI ceiling.
Previous local asset to replace: content/assets/usecases/day-11-data-visual.png.
Visual brief: LTV projection scenarios.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Rough LTV range by scenario, illustrative only
Conservative|0.06|Weak depth and weak monetization
Expected|0.27|Enough signal for controlled testing
Optimistic|0.82|Potential room for cautious scale
:::

**Inspect**: Khoảng cách giữa các scenario rất lớn. Chỉ cần retention hoặc ARPDAU lệch một chút, CPI ceiling thay đổi mạnh.

**Conclude**: Khi data còn ít, hãy ra quyết định bằng range và stop-loss, không bằng forecast một dòng.

**Do not infer**: Không nói game của bạn phải đạt `$0.27` LTV. Con số này chỉ minh họa cách biến LTV direction thành decision posture.

---

## Hướng dẫn đọc số

Đọc economics theo thứ tự này:

1. **Tách cohort**: Paid users, organic users, country, build version, channel.
2. **Kiểm retention guardrail**: Nếu D1/first-session yếu, revenue early có thể không bền.
3. **Tách revenue mix**: Rewarded ads, interstitials, banners, IAP/no-ads.
4. **Tính ARPDAU direction**: Daily revenue chia DAU, nhưng đọc theo vài ngày/cohort.
5. **Ước tính lifetime days**: Dựa trên retention/session depth hiện có, luôn dùng range.
6. **Tính rough LTV range**: Conservative, expected, optimistic.
7. **So với CPI**: Nếu CPI vượt stop-loss, không scale.

| Pattern | Diagnosis | Next action | Không nên làm |
| :--- | :--- | :--- | :--- |
| Retention ổn, ARPDAU thấp | Under-monetized hoặc rewarded value chưa hấp dẫn. | Test rewarded placement/reward value, no-ads pack, end-level offer. | Dừng game vì “không kiếm tiền” sau 2 ngày. |
| ARPDAU cao, retention sụp | Ad aggression hoặc paywall/popup phá trải nghiệm. | Giảm interstitial, dời ad sau first win/level depth, kiểm D1. | Scale vì thấy revenue/day cao. |
| CPI cao hơn rough LTV range | Negative unit economics trong sprint này. | Pause paid UA, giảm CPI bằng creative hoặc tăng LTV bằng product/monetization. | Tăng budget để thuật toán “học thêm”. |
| LTV gần CPI nhưng sample nhỏ | Có thể còn học tiếp nhưng rủi ro cao. | Giữ daily cap thấp, thêm cohort, không scale. | Đọc như ROAS-positive chắc chắn. |
| Organic LTV cao, paid LTV thấp | Paid traffic intent khác organic. | Tách cohorts, đọc creative promise và first-session fit. | Dùng organic average để justify paid spend. |

---

## Worked example: Live Calming Hex Puzzle

Team có live build Android với ads + no-ads IAP. Sau Day 9-10:

- Acquisition angle “real combo clear” có `CPI` khoảng `$0.48`.
- First-session guardrail tạm ổn: `tutorial_complete 76%`, `D1 31%`.
- Team muốn biết có nên tăng daily cap không.

Economics readout sau cohort nhỏ:

| Metric | Observed direction | Cách đọc |
| :--- | :---: | :--- |
| Paid installs | 420 | Sample nhỏ, chỉ đọc direction. |
| Spend | $202 | CPI = `$0.48`. |
| D1 | 31% | First-session không phải blocker chính trong sprint này. |
| D7 early direction | 11% | Có depth vừa phải, chưa chứng minh long-term. |
| DAU from cohort days 1-5 | 310 avg active-user-days total | Dùng để estimate lifetime days rất thận trọng. |
| Ad revenue | $7.80 | Rewarded + interstitial còn mỏng. |
| IAP revenue | $3.00 | Một vài no-ads purchases, chưa ổn định. |
| ARPDAU direction | ~$0.035 | Monetization chưa đủ khỏe. |
| Rough lifetime days range | 3.5-5.5 | Based on early retention, không forecast quá xa. |
| Rough LTV range | `$0.12-$0.19` | Dưới CPI `$0.48`. |

**Diagnosis**: Retention không tệ, nhưng economics chưa đủ mua traffic ở CPI hiện tại. Đây không phải “game chết”. Đây là “paid UA chưa có unit economics”.

**Tradeoff**: Team có hai hướng: giảm CPI bằng creative/channel hoặc tăng ARPDAU bằng monetization. Vì first-session ổn, sửa monetization có thể đáng thử. Nhưng scale paid UA ngay là sai.

**Verdict**:

1. Không tăng daily cap.
2. Giữ một test nhỏ nếu cần thêm cohort, nhưng đặt stop-loss CPI thấp hơn.
3. Test rewarded ad ở end-level “double reward” và continue khi sắp thua, không đặt interstitial trước level 3.
4. Test no-ads pack price/copy nhẹ, không ép popup sớm.
5. Rerun economics note sau khi có cohort mới.

### Payback decision ladder

Worked example trên không chỉ nói "LTV thấp hơn CPI". Nó dạy cách chọn posture theo khoảng cách giữa `rough LTV`, `CPI`, `retention` và `confidence`.

| Situation | Economics read | Decision posture | Sprint action |
| :--- | :--- | :--- | :--- |
| Rough LTV far below CPI, retention weak | product + economics đều chưa đủ | stop paid UA | sửa first-session/retention trước |
| Rough LTV far below CPI, retention workable | monetization/CPI chưa đủ | hold cap, no scale | test rewarded/IAP và giảm CPI |
| Rough LTV near CPI, sample small | có thể học tiếp nhưng rủi ro cao | controlled test | thêm cohort nhỏ, không tăng daily cap |
| Rough LTV above CPI but payback slow | unit direction tốt nhưng cashflow căng | cautious scale | giới hạn cap theo runway/payback window |
| ARPDAU high, retention falling | revenue có thể đang đốt cohort | reduce ad pressure | dời placement, cap interstitial |

Decision memo cho case này:

```text
Economics decision memo
- Confidence to scale: Low.
- Confidence to continue tiny learning test: Medium.
- Main blocker: rough LTV $0.12-$0.19 is far below CPI $0.48.
- Product note: D1 31% means first-session is not the main blocker this sprint.
- Monetization hypothesis: rewarded/no-ads value may be underdeveloped.
- Action: hold paid UA cap, test monetization placement, test lower-CPI creative.
- Do not conclude: final LTV, ROAS-positive potential, or product death.
```

Điểm quan trọng: economics note tốt không biến thành "có/không" tuyệt đối. Nó chia quyết định thành scale, hold, learn, fix, stop.

### Economics action contract

Một Rough economics note chỉ hữu ích khi nó nói rõ quyết định nào được phép làm ngay và quyết định nào chưa đủ bằng chứng. Với sample nhỏ, bạn thường có đủ confidence để **không scale**, nhưng chưa đủ confidence để **forecast LTV thật**.

| Decision | Evidence tối thiểu | Action được phép | Action bị cấm |
| :--- | :--- | :--- | :--- |
| Stop scale / cap spend | CPI vượt xa rough LTV range, cohort scope rõ | giữ cap thấp, pause scale, giảm spend | kết luận game chết |
| Keep tiny learning test | retention workable, sample nhỏ, economics chưa phá hẳn | mua thêm cohort nhỏ có cap | tăng daily cap vì "cần thêm data" |
| Fix monetization | retention ổn, ARPDAU/revenue mix yếu, placement hypothesis rõ | test rewarded/no-ads/interstitial timing | nhồi ad sớm không có retention guardrail |
| Reduce CPI | ARPDAU/retention có signal, CPI là bottleneck | test creative/channel/store efficiency | đổi monetization khi acquisition mới là leak |
| Pause product/economics thesis | retention yếu và economics cũng yếu qua clean read | sửa first session hoặc rewrite promise | optimize ROAS trên user không ở lại |
| Forecast LTV | cohort đủ lớn, window đủ dài, revenue mapping sạch | planning estimate with caveat | gọi early rough LTV là LTV thật |

```text
Economics action contract
- Cohort scope:
- Decision allowed now:
- Decision not allowed yet:
- Main blocker:
- Action size:
- Variables to keep stable:
- Next read window:
- Do not conclude:
```

Contract này bảo vệ team khỏi một lỗi rất phổ biến: dùng cùng một bảng số để vừa "không scale", vừa "forecast LTV", vừa "kill product". Mỗi decision cần mức bằng chứng khác nhau.

---

## Monetization and economics checklist

| Check | Pass khi | Nếu fail thì sao |
| :--- | :--- | :--- |
| **Cohort split** | Paid/organic, country, build, channel tách rõ. | LTV bị pha loãng hoặc phóng đại. |
| **Revenue source split** | Ad revenue và IAP revenue tách riêng. | Không biết nên sửa ad placement hay IAP offer. |
| **Rewarded placement logic** | Rewarded ads là opt-in và xuất hiện ở điểm có giá trị. | Viewer rate thấp hoặc phá experience. |
| **Interstitial frequency** | Không xuất hiện trước first win/early value; có cap/frequency. | ARPDAU tăng ngắn hạn, retention giảm. |
| **IAP sanity** | No-ads/starter pack có giá và value rõ. | IAP quá sớm hoặc quá mơ hồ, conversion thấp. |
| **Safety margin** | Stop-loss CPI thấp hơn rough LTV expected. | Team scale trên forecast quá đẹp. |
| **Payback window** | D7/D30/D60 expectation phù hợp cash runway. | Game có thể “có LTV” nhưng team hết tiền trước khi payback. |

---

## Real usecases đã đối chiếu nguồn

### Internal case: Live puzzle game, retention acceptable, ROAS short

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case nội bộ `live-roas-shortfall`: `CPI $0.80`, `D1 34%`, `D7 16%`, `D7 ROAS 8%`, target direction 15-20%. | Retention không phải blocker chính. Economics shortfall có thể đến từ monetization placement, ARPDAU thấp, hoặc CPI quá cao. | Không scale chỉ vì retention acceptable. Không kill product ngay nếu monetization chưa được test đúng. |

### Official monetization surfaces

| Source signal | Cách dùng trong bài này | Không được suy ra |
| :--- | :--- | :--- |
| Unity LevelPlay Rewarded Ad là ad unit user-initiated, đổi full-screen ad lấy in-app reward. | Ưu tiên rewarded placement có value rõ thay vì ép interstitial sớm. | Rewarded ads không tự đảm bảo ARPDAU cao; reward value và timing vẫn cần test. |
| AdMob cung cấp monetization reporting/insights và có thể tích hợp với Firebase để hiểu user interaction với ads. | Dùng reporting để tách revenue source và đọc ad behavior cùng cohort. | Không dùng aggregate revenue để justify paid UA nếu paid cohort riêng đang âm. |
| Unity rewarded ads best practices nhấn mạnh placement/design phù hợp để tối ưu monetization. | Monetization là product design decision, không chỉ bật SDK. | Không nhồi ad vào mọi transition chỉ vì muốn tăng ARPDAU. |

---

## Common mistakes

**Mistake 1 - Dùng LTV early như forecast chắc chắn.**
**Correction**: Gọi nó là rough LTV direction. Luôn dùng range và safety margin.

**Mistake 2 - Trộn paid với organic.**
**Correction**: Paid cohorts thường có intent khác organic. Tách trước khi tính LTV/CPI ceiling.

**Mistake 3 - Tăng interstitial để kéo ARPDAU.**
**Correction**: Kiểm retention guardrail. Nếu D1/session depth sụp, ARPDAU cao là tín hiệu monetization quá gắt.

**Mistake 4 - Quên payback window.**
**Correction**: Một game có thể payback chậm hơn runway của team. Ghi rõ D7/D30/D60 expectation.

**Mistake 5 - Chỉ sửa monetization khi CPI cao.**
**Correction**: CPI cao có thể là creative/channel issue. Nếu ARPDAU và retention ổn nhưng CPI quá cao, quay lại Day 9 creative economics.

---

## English Terms You Should Keep

- **ARPDAU**: Average Revenue Per Daily Active User.
- **LTV**: Lifetime Value, tổng giá trị kinh tế dự kiến từ một user.
- **Payback window**: Thời gian cần để cumulative revenue bù acquisition cost.
- **CPI ceiling**: CPI trần mà game có thể chịu trong một scenario.
- **Stop-loss CPI**: CPI buộc phải dừng hoặc giảm spend.
- **Ad mediation**: Nền tảng quản lý nhiều ad networks để tối ưu fill/eCPM.
- **Rewarded ad**: Ad tự nguyện xem để nhận reward.
- **Interstitial ad**: Ad toàn màn hình thường xuất hiện ở transition.
- **Safety margin**: Biên an toàn trừ khỏi rough LTV trước khi đặt CPI ceiling.

---

## Lab output example

```text
ROUGH ECONOMICS NOTE

Cohort scope:
Android paid / VN / build 0.4.1 / real combo clear creative / install week 2026-W27.

Revenue mix:
Rewarded ads primary, interstitial after level 4+, no-ads pack secondary.

Retention anchor:
D1 31%, early D7 direction 11%, estimated lifetime active days range 3.5-5.5.

ARPDAU direction:
Ad revenue + IAP revenue / DAU = ~$0.035.

Rough LTV range:
Conservative: 3.5 * $0.025 = $0.09
Expected: 4.5 * $0.035 = $0.16
Optimistic: 5.5 * $0.050 = $0.28

Current CPI:
$0.48

Stop-loss CPI for next sprint:
$0.14-$0.20 unless monetization improves.

Diagnosis:
Retention is workable, but economics cannot support CPI $0.48 yet.

Next action:
Do not scale. Test rewarded placement and no-ads pack. Also test lower-CPI creative variant.

Do not conclude:
Do not claim final LTV. Do not claim ROAS-positive. This is an early guardrail only.

Economics action contract:
- Decision allowed now:
- Decision not allowed yet:
- Main blocker:
- Action size:
- Variables to keep stable:
- Next read window:
- Do not conclude:
```

Sprint decision memo:

```text
Confidence to scale:
Confidence to keep learning:
Main economics blocker:
Retention guardrail:
Monetization hypothesis:
CPI reduction hypothesis:
Action this sprint:
Do not conclude:
Next read date/window:
```

Bảng nộp lab:

| Field | Your value |
| :--- | :--- |
| Cohort scope | |
| Revenue mix | |
| D1 / D7 direction | |
| Estimated lifetime active days range | |
| ARPDAU direction | |
| Conservative LTV | |
| Expected LTV | |
| Optimistic LTV | |
| Current CPI | |
| Stop-loss CPI | |
| Payback window | |
| Diagnosis | |
| Next action | |
| Confidence to scale | |
| Confidence to keep learning | |
| Monetization hypothesis | |
| CPI reduction hypothesis | |
| Decision allowed now | |
| Decision not allowed yet | |
| Variables to keep stable | |
| Next read window | |
| Do not conclude | |

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn một paid cohort hoặc một live cohort rõ scope.
2. Tách revenue: rewarded, interstitial, banner, IAP/no-ads.
3. Ghi retention anchor: D1, D7 direction, session depth hoặc lifetime active days estimate.
4. Tính ARPDAU direction.
5. Tạo 3 scenario rough LTV: conservative, expected, optimistic.
6. Đặt stop-loss CPI có safety margin.
7. Viết decision: scale nhẹ, hold, fix monetization, reduce CPI, hoặc stop paid UA.
8. Gán confidence cho từng quyết định: scale, keep learning, stop, forecast.
9. Viết một sprint decision memo.
10. Viết Economics action contract.

Quality chain check:

- Paid và organic đã tách chưa?
- Có revenue mix chưa?
- Có retention guardrail chưa?
- Stop-loss CPI có thấp hơn expected LTV không?
- Có dòng “do not conclude” chưa?
- Memo có phân biệt confidence to scale và confidence to keep learning chưa?
- Contract có tách decision allowed now và decision not allowed yet chưa?

---

## Final UA Plan Update

Cập nhật trường **metricTargets** trong Final UA Plan:

```text
Economics guardrails:
- Cohort scope: [platform / country / channel / build / install window]
- Primary revenue stream: [rewarded / interstitial / IAP / no-ads pack]
- ARPDAU direction: [range, not exact forecast]
- Lifetime active days estimate: [conservative / expected / optimistic]
- Rough LTV range: [conservative / expected / optimistic]
- Current CPI: [observed]
- Stop-loss CPI: [with safety margin]
- Payback window: [D7 / D30 / D60 expectation]

Action rules:
- Retention good + ARPDAU weak: [monetization placement test]
- ARPDAU high + retention weak: [reduce ad pressure]
- CPI above stop-loss: [pause or reduce spend]
- LTV close to CPI but sample small: [hold cap, gather cohort]
- Confidence to scale: [high / medium / low + why]
- Confidence to keep learning: [high / medium / low + why]
- Decision allowed now: [stop scale / keep learning / fix monetization / reduce CPI]
- Decision not allowed yet: [forecast LTV / scale / kill product / ROAS verdict]
- Variables to keep stable: [cohort / build / channel / placement]
- Sprint economics decision memo: [one paragraph]
```

Plan field được cập nhật: **metricTargets**. Bài này cũng tạo input cho Day 12 về ROAS windows.

---

## Checklist Focus

- [ ] Đã tạo Rough economics note cho một cohort rõ scope.
- [ ] Đã tách paid/organic và revenue source.
- [ ] Đã tính ARPDAU direction và rough LTV range.
- [ ] Đã đặt stop-loss CPI có safety margin.
- [ ] Đã ghi payback window phù hợp runway.
- [ ] Đã viết Economics action contract.
- [ ] Đã tách decision allowed now và decision not allowed yet.
- [ ] Đã cập nhật **metricTargets** trong Final UA Plan.

---

## Curated References

- [Unity LevelPlay - Rewarded ads integration for Unity](https://docs.unity.com/en-us/grow/levelplay/sdk/unity/rewarded-ad-integration-package) - Official Unity LevelPlay rewarded ad documentation describing user-initiated ads exchanged for in-app rewards.
- [Google AdMob - Google for Developers](https://developers.google.com/admob) - Official AdMob developer surface for mobile app ad monetization and mediation integration.
- [Unity Ads - Rewarded ads best practices](https://docs.unity3d.com/Packages/com.unity.ads%403.3/manual/MonetizationResourcesBestPracticesAds.html) - Unity guidance on designing rewarded ad monetization strategy and placements.
