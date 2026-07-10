---
day: 12
title: "ROAS windows and signal delay"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ROAS, LTV, Payback window]
artifact: "ROAS decision window"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **ROAS decision window**: một ma trận quy tắc quyết định ràng buộc chặt chẽ thời điểm đọc dữ liệu ROAS (Day 0, Day 3, Day 7, Day 30) với các hành động vận hành (Tăng tiền, Tạm dừng sửa ad, hay Tắt chiến dịch cắt lỗ).

Kết quả đạt được:
- Hiểu rõ độ trễ dữ liệu (signal delay) do cơ chế bảo mật Apple SKAN/AdAttributionKit và Google Privacy Sandbox gây ra.
- Thiết lập bộ ba quy tắc hành động (Hold, Iterate, Stop) dựa trên sự kết hợp giữa CPI thực tế và tỷ lệ hoàn vốn ROAS.
- Tự cấu hình kịch bản xử lý cảnh báo dương tính giả (false positives) khi chạy test ngân sách nhỏ.
- Cập nhật các mốc thời gian đọc ROAS vào Final UA Plan.

---

## Why this matters

Khi bạn chạy một chiến dịch quảng cáo paid với ngân sách nhỏ $15-30/ngày, số liệu ROAS đổ về dashboard trong 24 giờ đầu tiên (Day 0 ROAS) sẽ cực kỳ biến động và nhiễu loạn:
- Một ngày nọ, tự dưng có 1 người chơi hứng thú nạp gói IAP $9.99. Chỉ số ROAS hiển thị trên dashboard vọt lên `250%`. Bạn mừng rỡ nghĩ game đã thành công lớn và scale ngân sách gấp 5 lần. Tuy nhiên, các ngày tiếp theo không có ai nạp thêm tiền, ROAS tụt về `2%`, tài khoản bị âm vốn nặng. Đây gọi là **bẫy dương tính giả (false positive)**.
- Ngược lại, một ad group khác chạy 3 ngày chưa ghi nhận đồng doanh thu nào (ROAS = 0%). Bạn lập tức tắt chiến dịch. Nhưng thực tế, người chơi tải game ngày đầu tiên cần chơi đến màn 10 (thường là ở Ngày 3) mới có nhu cầu click xem ad rewarded hay mua vật phẩm. Bạn tắt quá sớm nên đã đánh mất một chiến dịch có tiềm năng hoàn vốn tốt.

Bạn cần xác định rõ **cửa sổ thời gian đọc số (ROAS windows)** tương ứng với từng giai đoạn học hỏi để có hành động chính xác, tránh đưa ra quyết định dựa trên số liệu nhiễu loạn ngày đầu.

---

## Core model: Các mốc cửa sổ thời gian đọc ROAS (D0 -> D3 -> D7 -> D30)

Đối với game puzzle casual kết hợp ads/IAP nhẹ, việc đọc chỉ số ROAS bắt buộc phải chia theo 4 checkpoints thời gian rõ ràng:

1.  **Day 0 ROAS (Đọc vị ad hook)**: Doanh thu thu được ngay trong ngày đầu tiên người chơi cài đặt.
    *   *Mục đích*: Đánh giá xem creative quảng cáo có hút đúng đối tượng có hành vi chi trả nhanh hay không.
2.  **Day 3 ROAS (Đọc vị onboarding)**: Doanh thu tích lũy sau 3 ngày hoạt động.
    *   *Mục đích*: Chỉ số này phản ánh chất lượng trải nghiệm màn chơi đầu (Level 1-15) và các vị trí đặt ad đầu tiên.
3.  **Day 7 ROAS (Chẩn đoán cắt lỗ)**: Doanh thu tích lũy sau 1 tuần chơi.
    *   *Mục đích*: Đây là mốc quan trọng nhất để áp dụng quy tắc stop-loss (cắt lỗ). Nếu D7 ROAS thấp rõ rệt so với rule nội bộ bạn đã đặt cho game đó, hãy dừng campaign hoặc giữ ở mức tối thiểu để đọc lại sản phẩm.
4.  **Day 30 ROAS (Đo lường điểm hòa vốn)**: Doanh thu tích lũy sau 1 tháng.
    *   *Mục đích*: Dự báo xem game có khả năng hoàn vốn (break-even) ở mốc Ngày 90 hoặc Ngày 180 hay không.

### ROAS decision contract

Trước khi campaign chạy, hãy viết một **ROAS decision contract**. Contract này khóa lại: mốc nào được đọc, mốc nào chưa được đọc, và team được phép làm gì tại từng checkpoint.

| Contract field | Câu hỏi phải chốt trước launch | Ví dụ cho micro soft-launch |
| --- | --- | --- |
| Primary checkpoint | Mốc chính để ra quyết định tiền là D3, D7 hay D30? | D7 là mốc stop/iterate chính; D0 chỉ dùng để phát hiện anomaly |
| Allowed decision | Ở checkpoint này team được phép quyết định gì? | D7 được phép hold, iterate monetization, hoặc stop-loss |
| Blocked conclusion | Dù số đẹp, team chưa được kết luận gì? | Không kết luận LTV dài hạn, D90 payback, hoặc global scale từ D7 |
| Freshness rule | Dữ liệu mấy giờ/ngày gần nhất bị loại khỏi quyết định? | Không dùng 48 giờ gần nhất nếu postback/revenue delay chưa ổn |
| Cohort rule | Cohort nào được đọc? | Chỉ đọc cohort có cùng build, geo, channel, creative cell và store version |
| Owner | Ai có quyền đổi budget hoặc stop campaign? | UA owner đề xuất, product owner xác nhận retention/monetization caveat |

Blocked conclusions theo window:

| Window | Được đọc | Chưa được kết luận |
| --- | --- | --- |
| D0 | Install quality rất sớm, anomaly, tracking/revenue event có bắn không | Winner, payback, retention, scale |
| D3 | Onboarding monetization, rewarded ad/IAP early exposure | Long-term ROAS hoặc final stop-loss nếu sample nhỏ |
| D7 | Directional stop/iterate decision cho micro-budget | D30/D90 payback chắc chắn |
| D30 | Payback direction rõ hơn | Global scale nếu creative/source/cohort chưa lặp lại |

Một contract tốt không làm team chậm hơn. Nó ngăn một lỗi đắt: dùng mốc ngắn để kể câu chuyện dài.

---

## Khung Ma trận Quyết định phối hợp CPI và D7 ROAS (Main framework/map mẫu)

Dưới đây là ma trận quyết định 4 ô phối hợp giữa chi phí mua user (CPI) và hiệu quả hoàn vốn (ROAS) ở Ngày 7:

| Chỉ số phối hợp | D7 ROAS Đạt Chỉ Tiêu | D7 ROAS Dưới Chỉ Tiêu |
| :--- | :--- | :--- |
| **CPI Thực Tế Rẻ** | **Ô 1: SCALE (Tăng tiền)**<br>Ad kéo user tốt và game kiếm tiền hiệu quả. Chỉ tăng ngân sách theo nhịp nhỏ, có kiểm soát. | **Ô 2: ITERATE GAMEPLAY**<br>Ad rẻ chứng tỏ hook quảng cáo đang ổn, nhưng game giữ chân/monetization kém. Sửa lại game, giữ ad ở mức học. |
| **CPI Thực Tế Đắt** | **Ô 3: ITERATE CREATIVE**<br>Game giữ chân và kiếm tiền tốt, nhưng giá mua user quá cao. Tiến hành làm video quảng cáo mới để kéo CPI xuống. | **Ô 4: STOP (Tắt dừng lỗ)**<br>Chiến dịch thất bại hoàn toàn ở cả ad lẫn game. Tắt ad hoặc giảm về mức tối thiểu để tránh tiếp tục tiêu tiền vô nghĩa. |

### Confidence ladder cho quyết định ROAS

Ma trận CPI x ROAS chỉ đáng tin khi confidence đủ cao. Với ngân sách nhỏ, cùng một con số D7 ROAS có thể dẫn tới hai action khác nhau nếu sample, freshness hoặc revenue mix khác nhau.

| Confidence layer | Câu hỏi kiểm tra | Nếu pass | Nếu fail |
| --- | --- | --- | --- |
| Sample sanity | Cohort có đủ installs/users để đọc directional chưa? | Có thể đưa ra call có caveat | Hold hoặc gom thêm cohort tương tự |
| Data freshness | Postback/revenue event đã qua vùng delay chưa? | Dùng được cho D3/D7 readout | Loại 24-48h gần nhất khỏi quyết định |
| Cohort consistency | Build, geo, channel, store, creative cell có ổn định không? | Đọc CPI/ROAS cùng một cohort | Không gọi winner/loser |
| Revenue mix | Doanh thu đến từ nhiều user hay một whale/IAP bất thường? | Dùng ROAS direction | Ghi false positive risk, không scale |
| Downstream support | Retention/session depth có ủng hộ monetization không? | Iterate hoặc scale có kiểm soát | Không tăng budget chỉ vì ROAS spike |

Decision ladder:

| Confidence | Action được phép | Action chưa được phép |
| --- | --- | --- |
| Low | Hold, fix measurement, extend readout window | Scale, stop, rewrite monetization lớn |
| Medium | Iterate creative/product/monetization nhỏ, keep budget low | Scale mạnh hoặc kết luận payback |
| High | Scale nhẹ, stop-loss, hoặc lock next sprint decision | Global scale không có cohort lặp lại |

Rule: **không có confidence ladder thì không có budget change**. Nếu team chưa nói được vì sao confidence là low/medium/high, action đúng thường là hold hoặc rerun sạch hơn.

---

## Sơ đồ Quy trình ROAS windows và Độ trễ Dữ liệu (Hero visual or operating diagram)

```text
![ROAS Windows & Signal Delay Timeline](content/assets/usecases/day-12-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Sơ đồ Quy trình ROAS windows và Độ trễ Dữ liệu (Hero visual or operating diagram).
Previous local asset to replace: content/assets/usecases/day-12-hero-diagram.png.
Visual brief: ROAS Windows & Signal Delay Timeline.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Xem xét khoảng thời gian trễ (grey zone) kéo dài 24-48 giờ từ khi người dùng phát sinh hành động nạp tiền ở Ngày 3 đến khi ad network nhận được postback cập nhật và hiển thị trên dashboard.
> *   **Kết luận rút ra (Conclude)**: Tuyệt đối không được chỉnh sửa ngân sách hoặc tắt campaign dựa trên dữ liệu ROAS của 48 giờ gần nhất, vì dữ liệu này luôn bị thiếu hụt (under-reported) do độ trễ postback.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng độ trễ này chỉ xảy ra trên iOS. Trình theo dõi Android (như Google Privacy Sandbox) cũng đang áp dụng cơ chế gửi postback trễ ngẫu nhiên để bảo vệ quyền riêng tư của người dùng.

---

## Biểu đồ ma trận quyết định phối hợp CPI và D7 ROAS (Chart/visual/table)

```text
![CPI vs D7 ROAS Decision Matrix](content/assets/usecases/day-12-data-visual.svg)Type: data visual/chart.
Lesson section: Biểu đồ ma trận quyết định phối hợp CPI và D7 ROAS (Chart/visual/table).
Previous local asset to replace: content/assets/usecases/day-12-data-visual.png.
Visual brief: CPI vs D7 ROAS Decision Matrix.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Ngưỡng D7 ROAS mục tiêu theo từng mức giá CPI ($ USD)
CPI < $0.30|D7 ROAS > 10%|Ad rẻ, chỉ cần game đạt mức hoàn vốn cơ bản là có thể duy trì chiến dịch
CPI $0.30 - $0.60|D7 ROAS > 22%|Mức giá trung bình, yêu cầu game có khả năng monetization khá hơn
CPI > $0.60|D7 ROAS > 35%|Ad đắt, bắt buộc game phải có IAP sâu để bù đắp chi phí thu hút cao
:::

*Cách đọc chart*: Mức ROAS mục tiêu không phải là một con số cố định. Hãy dùng chart này như ví dụ minh họa cho logic ra quyết định: CPI càng rẻ thì ROAS checkpoint có thể mềm hơn; CPI càng đắt thì checkpoint phải nghiêm hơn. Khi áp dụng thật, hãy thay các mốc số bằng rule nội bộ của chính game bạn.

---

## Hướng dẫn đọc số và chẩn đoán theo mốc thời gian

Hãy chẩn đoán kết quả hoàn vốn dựa trên bảng quy tắc quyết định dưới đây:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **D3 ROAS = 15%**<br>**D7 ROAS = 18%** | **Monetization Plateau**: Game thu tiền rất tốt ở 3 ngày đầu, nhưng sau đó người chơi không còn gì để nạp (thiếu chiều sâu IAP/Ad). | Thiết kế thêm các màn chơi khó hơn, bổ sung tính năng xem ad nhận lượt đi tiếp ở level cao. | Tiếp tục tăng tiền vì thấy 3 ngày đầu ROAS tăng trưởng nhanh. |
| **D7 ROAS = 5%** (Thấp hơn nhiều so với target nội bộ)<br>**D1 Retention = 35%** (Đạt) | **Under-monetized Active Users**: Game giữ chân người chơi cực kỳ tốt, nhưng hệ thống kiếm tiền bị giấu quá kỹ hoặc quá yếu. | Bật thêm quảng cáo xen kẽ (interstitial ads) ở cuối màn hoặc tạo gói IAP "No Ads" tặng kèm booster. | Tắt game vì nghĩ game thất bại (bỏ phí game có retention tốt). |
| **D7 ROAS = 2%**<br>**D1 Retention = 12%** | **Double Failure**: Cả sản phẩm giữ chân lẫn cơ chế kiếm tiền đều thất bại. | Tắt chiến dịch ad ngay lập tức. Quay lại sửa core loop game và thiết kế lại hướng dẫn onboarding. | Tiếp tục chạy ad để "đợi máy học tự tối ưu hóa". |

ROAS readout ledger:

| Read question | Evidence cần có | Nếu thiếu evidence | Action an toàn |
| --- | --- | --- | --- |
| Revenue có bị spike bởi 1 user không? | Số paying users, ad revenue users, revenue distribution | Không biết doanh thu đến từ bao nhiêu user | Không scale, ghi false-positive risk |
| Dữ liệu có bị delay không? | Postback freshness, revenue event timestamp, dashboard lag caveat | 48h gần nhất chưa ổn | Loại window mới nhất khỏi quyết định |
| CPI và ROAS đang đọc cùng cohort không? | Build/geo/channel/campaign/cell/store version match | Cohort lẫn lộn | Không dùng ma trận 4 ô để chốt call |
| ROAS yếu nhưng retention tốt không? | D1/session depth/level progression | Chưa biết user có ở lại không | Không stop product; kiểm tra monetization exposure |
| ROAS tốt nhưng retention yếu không? | D1/D3/session depth | Không biết quality có bền không | Không tăng budget mạnh |

Một câu readout tốt nên có dạng: "D7 ROAS gợi ý X với confidence Y, nhưng blocked conclusion là Z, nên next action là A." Tránh viết: "D7 ROAS thấp nên game fail" nếu retention hoặc monetization exposure chưa được đọc.

---

## Worked example: Calming Hex Puzzle

Một tựa game xếp hình lục giác thư giãn (Calming Hex Puzzle) chạy thử nghiệm $300 chiến dịch quảng cáo với các ngưỡng thiết lập:
- Ngưỡng CPI trần stop-loss: `$0.40`
- Ngưỡng D7 ROAS mục tiêu nội bộ: `> 20%` (ví dụ minh họa cho build này, nhằm hướng tới hòa vốn D30)

**Kết quả thu thập thực tế sau 8 ngày**:
- Ngân sách chi tiêu: $210.
- Số install thu được: 700 users.
- CPI thực tế tính toán: `$210 / 700 = $0.30` (*Đạt, dưới mức trần $0.40*).
- D1 Retention: 31% (*Đạt*).
- Doanh thu Day 7 tích lũy của cohort này: $12.6.
- D7 ROAS thực tế: `$12.6 / $210 = 6%` (*Không đạt chỉ tiêu 20%*).

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Đây là trường hợp thuộc ô số 2 của Ma trận quyết định (CPI rẻ, game giữ chân tốt nhưng ROAS yếu). Người dùng chơi game đều đặn nhưng game chưa kích hoạt được nhu cầu nạp tiền hoặc xem quảng cáo.
*   **Hành động quyết định**: Không tắt ad hoàn toàn (vì CPI $0.30 vẫn rẻ theo mô hình này và traffic còn hữu ích cho việc học). Nhà phát triển giữ nguyên campaign ở mức ngân sách tối thiểu $15/ngày, tiến hành cập nhật bản build game mới: đưa gói mua booster $0.99 hiển thị ngay khi người chơi bị thua ở Level 8, và đặt thêm nút hồi sinh bằng cách xem video ad nhận thưởng. Chờ thêm 3 ngày để đọc số liệu của cohort mới sau khi cập nhật.

### Post-readout memo

Sau khi đọc D7, hãy viết memo thay vì chỉ copy screenshot dashboard.

```md
ROAS post-readout memo - Calming Hex Puzzle

Checkpoint:
D7 ROAS, excluding the latest 48h delayed window.

Cohort:
Android, market A, build 0.7.3, store v2, relax/satisfaction campaign cells.

Data health:
Install, first_open, rewarded_ad_impression and IAP purchase events present.
Ad revenue postback enabled, but latest 48h marked as delayed.

Readout:
CPI is healthy at $0.30.
D1 retention is directionally healthy at 31%.
D7 ROAS is weak at 6%.

Diagnosis:
Under-monetized active users. Acquisition is not the main problem in this read.

Decision:
Hold campaign at minimum learning spend. Do not scale.
Iterate monetization exposure in level 6-10.

Blocked conclusions:
No D30 payback claim.
No global scale claim.
No final product-fail claim because retention is still healthy.

Next read:
Compare D3/D7 ROAS and D1 retention for the new monetization build.
```

Memo này bắt team ghi rõ **cohort**, **data health**, **blocked conclusions** và **next read**. Nếu không có các dòng đó, ROAS dễ biến thành một con số tạo cảm xúc hơn là một quyết định.

---

## Checklist kỹ thuật đo lường ROAS (Implementation checklist)

Đảm bảo các cấu hình truyền gửi postback doanh thu chính xác:

| Hạng mục | Trạng thái cần có | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Conversion Value Setup** | Đã cấu hình dải doanh thu (Conversion Value Schema) từ $0 đến $10+ trong MMP dashboard (như AppsFlyer, Adjust). | Mọi postback gửi về ad network chỉ hiển thị lượt tải, không hiển thị giá trị doanh thu IAP/Ad. |
| **2. Ad Revenue Postback** | Bật tính năng tích hợp doanh thu ad (Ad Revenue SDK integration) từ mediation sang MMP. | Doanh thu quảng cáo trong game không được đẩy về dashboard UA, làm ROAS hiển thị thấp hơn thực tế. |
| **3. Purchase Validation** | Cấu hình xác thực biên lai mua hàng IAP (In-App Purchase Validation) với Google Play/App Store. | Ghi nhận doanh thu ảo do người dùng sử dụng các bản hack/mod IAP để lừa hệ thống. |

---

## Real usecases đã đối chiếu nguồn

### Case Study: Rovio Sugar Blast — Tối ưu hóa ROAS dưới độ trễ postback của platform

```text
![Rovio Sugar Blast ROAS Delay optimization representational diagram](content/assets/usecases/day-12-sugar-blast-roas.svg)Type: public screenshot/source visual.
Lesson section: Case Study: Rovio Sugar Blast — Tối ưu hóa ROAS dưới độ trễ postback của platform.
Previous local asset to replace: content/assets/usecases/day-12-hero-diagram.png.
Visual brief: Rovio Sugar Blast ROAS Delay optimization representational diagram.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ tối ưu hóa của Rovio (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát dải trễ dữ liệu (Delay window) từ Ngày 0 đến Ngày 3. Ad network chỉ nhận được tín hiệu chuyển đổi sau khi Apple giải phóng postback với độ trễ ngẫu nhiên (random delay).
> *   **Kết luận rút ra (Conclude)**: Rovio Sugar Blast chuyển dịch từ chạy ads cài đặt đại trà sang tối ưu hóa giá trị (Value-Based Optimization). Họ huấn luyện máy học bằng cách đẩy nhanh các event IAP/Ad đầu tiên của user vào 24 giờ đầu để "khóa" conversion value sớm, giúp nhận postback nhanh hơn mà vẫn tôn trọng luật bảo mật của platform.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn bắt buộc phải nạp tiền chạy ad tối ưu hóa giá trị ngay từ đầu. Game indie nhỏ của bạn nên bắt đầu bằng tối ưu hóa lượt cài đặt (Install Optimization) và dùng bảng tính cohorted ROAS thủ công ở Ngày 7 để tự tối ưu bằng tay.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Rovio đã công bố chi tiết về mô hình tối ưu hóa giá trị (Value-Based Optimization), nhấn mạnh việc vẽ đường cong LTV:CAC phân rã theo cohort để đạt ROAS dương cho dòng game giải đố casual. Nguồn: [LTV Modeling của Rovio trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass) | Thiết lập mốc đọc ROAS bắt buộc phải tính toán độ trễ chuyển đổi dữ liệu của platform quảng cáo để tránh ra quyết định sai lầm. | Không tự suy diễn rằng cứ có độ trễ là bạn phải chờ thụ động. Bạn vẫn cần rule rõ cho hold, iterate và stop, chỉ là rule đó phải tôn trọng signal delay. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Quyết định tắt/bật ad dựa trên ROAS của 24 giờ gần nhất**
    *   *Correction*: Bỏ qua số liệu ROAS Day 0 khi tối ưu chiến dịch. Hãy luôn sử dụng số liệu D7 ROAS tích lũy làm căn cứ tối ưu chính để tránh sai lệch dữ liệu do trễ postback.
*   **Mistake 2: Tăng ngân sách quá nhanh (>50%/ngày) khi thấy ROAS Day 3 cao đột biến**
    *   *Correction*: Khi có user nạp IAP lớn (dương tính giả), hãy giữ nguyên ngân sách thêm 3 ngày để xem có người tiếp theo nạp hay không, tránh việc scale vội vã làm loãng tệp.
*   **Mistake 3: Đặt mục tiêu ROAS hoàn vốn 100% ngay ở Ngày 7**
    *   *Correction*: Đừng đặt kỳ vọng hoàn vốn 100% quá sớm. Hãy dùng checkpoint Day 7 như một mốc chẩn đoán xem game có đang đi đúng hướng hay không, thay vì biến nó thành đích hoàn vốn cuối cùng.
*   **Mistake 4: Không ghi blocked conclusions**
    *   *Correction*: Mỗi readout phải ghi điều chưa được kết luận. D7 có thể hỗ trợ stop/iterate direction, nhưng chưa chứng minh D30/D90 payback hoặc global scale.
*   **Mistake 5: Scale vì một user mua IAP lớn**
    *   *Correction*: Kiểm tra revenue mix trước khi đổi budget. Nếu ROAS spike đến từ một user hoặc một event bất thường, ghi false-positive risk và giữ spend ở mức học.

---

## English Terms You Should Keep

*   **ROAS**: Return On Ad Spend (Tỷ lệ doanh thu thu được trên chi phí quảng cáo).
*   **postback**: Lệnh truyền dữ liệu chuyển đổi tự động từ MMP về ad network.
*   **conversion value**: Giá trị chuyển đổi (nhãn số hóa dùng để biểu diễn doanh thu trên iOS SKAN).
*   **false positive**: Dương tính giả (hiện tượng chỉ số tăng cao đột biến nhất thời do sai số mẫu nhỏ).
*   **payback day**: Ngày hoàn vốn thực tế.

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Quy tắc Quyết định ROAS (ROAS Decision Window Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                        ROAS DECISION WINDOW                            │
├────────────────────────────────────────────────────────────────────────┤
│ Target Scenario: Hybrid Puzzle | Checkpoint: Day 7 ROAS                 │
│ Target D7 ROAS threshold: > 20% | Target CPI: < $0.35                  │
│                                                                        │
│ Decision Rules:                                                        │
│ - Rule 1 (Scale): If CPI < $0.35 AND D7 ROAS > 20% -> increase spend 20%│
│ - Rule 2 (Iterate): If CPI < $0.35 AND D7 ROAS < 10% -> update game    │
│ - Rule 3 (Stop): If CPI > $0.45 OR D7 ROAS < 5% -> pause campaign      │
│ Caveat: Do not adjust budget using last 48-hour delayed data.          │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu ROAS decision window hoàn chỉnh dạng bảng mà học viên cần điền (mốc CPI và ROAS được điều chỉnh mềm dẻo dựa trên LTV thực tế của từng build game):

| Trạng thái CPI thực tế | D7 ROAS thực tế | Quyết định vận hành (Action) | Sửa đổi chi tiết sản phẩm / ad |
| :--- | :---: | :---: | :--- |
| **CPI < LTV * 0.8** (Rẻ) | D7 ROAS > 20% | **SCALE** | Tăng ngân sách chiến dịch thêm 20% mỗi 3 ngày. |
| **CPI < LTV * 0.8** (Rẻ) | D7 ROAS < 10% | **ITERATE GAME** | Sửa thiết kế nút rewarded ad hồi sinh màn chơi. |
| **CPI > LTV * 1.2** (Đắt) | D7 ROAS > 20% | **ITERATE AD** | Làm 2 video ad mới thay đổi intro 3 giây đầu. |
| **CPI > LTV * 1.2** (Đắt) | D7 ROAS < 5% | **STOP** | Tắt hoàn toàn chiến dịch quảng cáo để cắt lỗ. |

```md
ROAS decision contract
- Primary checkpoint: D7
- Allowed decision: hold, iterate monetization, stop-loss, or small scale
- Blocked conclusions: no D30 payback, no D90 LTV, no global scale from this read
- Freshness rule: exclude latest 48h delayed data
- Cohort rule: same build, geo, channel, store version and creative cell
- Confidence: [low / medium / high] because [sample, freshness, cohort consistency, revenue mix]

Post-readout memo
- Cohort:
- Data health:
- Readout:
- Diagnosis:
- Decision:
- Blocked conclusions:
- Next read:

ROAS sign-off:
- Checkpoint used:
- Data excluded for freshness:
- Decision allowed:
- Decision blocked:
- Budget action:
- Next read window:
- Owner/date:
```

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh ma trận quy tắc quyết định ROAS cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check)** dưới đây để tự duyệt:
    *   *Ràng buộc mốc thời gian*: Bạn đã ghi rõ mốc Ngày 7 làm checkpoint đánh giá cắt lỗ chính thay vì Ngày 1 chưa? (Đạt/Không)
    *   *Xử lý độ trễ*: Kịch bản ra quyết định của bạn có điều khoản loại trừ dữ liệu của 48 giờ gần nhất để tránh độ trễ postback chưa? (Đạt/Không)
    *   *Mốc số phối hợp*: Các hành động tăng/giảm ngân sách có được phối hợp chặt chẽ giữa cả hai chỉ số CPI và ROAS không (tránh nhìn một chiều)? (Đạt/Không)
    *   *Cấu hình MMP*: Hệ thống của bạn đã bật tính năng truyền gửi doanh thu ad (Ad Revenue Postback) sang MMP chưa? (Đạt/Không)
3.  Viết **ROAS decision contract** trước khi nhìn dashboard: primary checkpoint, allowed decision, blocked conclusions, freshness rule, cohort rule và owner.
4.  Chấm confidence cho quyết định: sample sanity, data freshness, cohort consistency, revenue mix, downstream support.
5.  Viết **post-readout memo** sau khi đọc số. Memo phải có diagnosis, decision, blocked conclusions và next read.
6.  Viết **ROAS sign-off** trước khi đổi budget.

---

## Final UA Plan Update

Cập nhật trường **roas_decision_matrix** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- ROAS evaluation checkpoint: [Mốc checkpoint chính, ví dụ: Day 7]
- Target D7 ROAS threshold: [Mức ROAS mong muốn tại checkpoint]
- Scale rule definition: [Điều kiện để tăng tiền chiến dịch]
- Iterate rule definition: [Điều kiện để giữ campaign và sửa game/ad]
- Stop rule definition: [Điều kiện bắt buộc tắt campaign cắt lỗ]
- Freshness rule: [Dữ liệu mới nhất nào bị loại khỏi decision vì postback/revenue delay]
- Cohort rule: [Build/geo/channel/store/creative cell phải match thế nào]
- Confidence ladder: [Low/Medium/High và action được phép]
- Blocked conclusions: [Điều chưa được kết luận ở D0/D3/D7/D30]
- Post-readout memo owner: [Ai viết memo và cập nhật next read]
- ROAS sign-off: [checkpoint / excluded data / budget action / next read / owner]
```

---

## Checklist Focus

*   [ ] Thiết lập ma trận quyết định 4 ô phối hợp chi tiết giữa CPI và D7 ROAS.
*   [ ] Viết rõ điều khoản loại trừ dữ liệu trễ postback 48 giờ trong quy tắc vận hành.
*   [ ] Có ROAS decision contract trước khi launch.
*   [ ] Có confidence ladder trước khi scale/stop.
*   [ ] Có blocked conclusions theo từng window.
*   [ ] Có post-readout memo sau D7 hoặc checkpoint chính.
*   [ ] Có ROAS sign-off trước khi đổi budget.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check).
*   [ ] Cập nhật trường roas_decision_matrix vào Final UA Plan.

---

## Curated References

*   [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit)
*   [Android Attribution Reporting](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
*   Tài liệu hướng dẫn cấu hình Conversion Value và đo lường postback của Apple App Store Connect.
