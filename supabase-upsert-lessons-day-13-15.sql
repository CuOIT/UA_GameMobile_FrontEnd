-- Upsert markdown content for day 13-15 into Supabase.
-- Source: D:/ua-marketing-platform/frontend/content/lessons
-- Generated: 2026-07-03T09:46:01.961Z

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
  ('lessons/day-13.md', 'markdown', null, '---
day: 13
title: "Attribution, ATT, SKAN and Android privacy signals"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Attribution, ATT, SKAN]
artifact: "Measurement risk note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Measurement risk note** để đưa vào 1-page UA / soft-launch plan. Tài liệu này giúp bạn nhận diện các rủi ro sai lệch dữ liệu, thiết lập mức độ tự tin (confidence level) và điều chỉnh chu kỳ đọc số cho chiến dịch chạy thử nghiệm puzzle game.

Kết quả đạt được:
- Hiểu cách hoạt động của cơ chế gán nguồn (Attribution) trong kỷ nguyên bảo mật.
- Phân biệt cơ chế báo cáo bị trễ (delayed) và gom nhóm (aggregated) trên iOS (SKAN/AdAttributionKit) và Android (Privacy Sandbox).
- Thiết lập bảng ánh xạ rủi ro đo lường cho từng chỉ số chính (acquisition, retention, monetization).
- Cập nhật trường **Tracking** trong Final UA Plan với các lưu ý về độ trễ dữ liệu.

---

## Why this matters

Trong quá khứ, các nhà phát triển Unity có thể theo dõi chính xác từng lượt cài đặt đến từ quảng cáo nào, vào giờ nào, và người chơi đó đã thực hiện hành vi gì trong game. Điều này được thực hiện thông qua định danh thiết bị (IDFA trên iOS và GAID trên Android). 

Tuy nhiên, với ngân sách nhỏ **$100-500**, việc thiếu sự chuẩn bị cho sự mất mát tín hiệu (signal loss) sẽ dẫn đến việc bạn đưa ra các quyết định tối ưu sai lầm nghiêm trọng. Nếu chạy ad cho iOS, bạn sẽ không thấy install xuất hiện ngay lập tức trên dashboard do cơ chế trễ ngẫu nhiên của Apple (24h - 48h). Nếu bạn vội vàng tắt chiến dịch sau 1 ngày vì thấy "0 install", bạn đang lãng phí ngân sách test vô ích. Hiểu rõ attribution privacy giúp bạn giữ cái đầu lạnh và tối ưu chiến dịch dựa trên dữ liệu định hướng thay vì hoảng loạn.

---

## Core model: Cơ chế gán nguồn bảo mật (Privacy-Constrained Attribution)

Mô hình đo lường hiện đại chuyển dịch từ cấp độ thiết bị (device-level tracking) sang cấp độ bảo mật bảo toàn danh tính (privacy-preserving measurement):

```
[User Click Ad] ──> [Install App] ──> [Platform Privacy Engine (SKAN/Android Sandbox)]
                                                  │
                                                  ▼ (Trễ ngẫu nhiên 24h-48h + Giấu thông tin cá nhân)
[Dashboard hiển thị số liệu gom nhóm (Aggregated)] ◄──┘
```

1.  **iOS ATT (App Tracking Transparency)**: Yêu cầu người dùng cho phép theo dõi. Tỷ lệ đồng ý (opt-in) trung bình toàn cầu cho game thường dưới 25-30%. Nếu người dùng bấm "Ask App not to Track", bạn chỉ nhận được dữ liệu qua SKAN.
2.  **SKAN (SKAdNetwork) / AdAttributionKit**: Cơ chế gán nguồn bảo mật của Apple. Nó làm trễ dữ liệu ngẫu nhiên ít nhất 24-48 giờ và giới hạn dữ liệu giá trị chuyển đổi (Conversion Value) gửi về máy chủ tùy theo lượng người dùng thực tế:
    *   **Fine-grained Conversion Value**: Giá trị chi tiết từ 0 đến 63 (6-bit), chỉ được Apple trả về khi số lượng install của chiến dịch trong ngày vượt qua ngưỡng ẩn danh cao (High Crowd Anonymity).
    *   **Coarse-grained Conversion Value**: Giá trị thô dạng thấp/vừa/cao (Low, Medium, High), được trả về khi số lượng install ở mức trung bình nhằm bảo toàn quyền riêng tư.
3.  **Android Privacy Sandbox**: Đang dịch chuyển dần để hạn chế GAID. Hệ thống sử dụng Attribution Reporting API để báo cáo dữ liệu dạng gom nhóm (aggregate reports) hoặc dữ liệu có độ nhiễu (noisy data), giảm dần tính năng theo dõi thiết bị thời gian thực.

---

## Bảng so sánh rủi ro đo lường mẫu (Measurement Risk Map)

Dưới đây là khung phân tích các điểm chạm dữ liệu bị ảnh hưởng bởi chính sách bảo mật mà một nhà vận hành puzzle game cần biết:

| Kênh & Nền tảng | Phương thức gán nguồn | Độ trễ dữ liệu | Mức độ chi tiết (Granularity) | Rủi ro lớn nhất cho test $100-500 |
| :--- | :--- | :--- | :--- | :--- |
| **Android (Self-Attributed)** | GAID / Play Install Referrer | Thời gian thực (< 1 giờ) | Chi tiết tới từng Ad Creative / Keyword | GAID có thể bị hạn chế trong tương lai gần; hiện tại vẫn là kênh test chính xác nhất cho ngân sách nhỏ. |
| **iOS (SKAN / AdAttributionKit)** | Cryptographic postbacks từ Apple | Trễ 24 - 48 giờ (hoặc hơn ở các window sau) | Chỉ biết Campaign ID thô, không có Creative chi tiết nếu mẫu quá nhỏ | **Privacy Threshold**: Nếu số lượng install mỗi ngày dưới ngưỡng quy định của Apple, bạn sẽ nhận được Conversion Value trống (`null`/`coarse-grained`), không thể đo được retention D1 hay ad watchers. |
| **Direct Web-to-App** | Device fingerprinting / IP (Dần bị chặn) | Gần như thời gian thực | Không ổn định | Bị chặn bởi các trình duyệt bảo mật và các bản cập nhật iOS (Private Relay), tỷ lệ sai lệch cao. |

---

## Sơ đồ luồng đo lường bảo mật (Hero visual or operating diagram)

Sơ đồ dưới đây mô tả cách tín hiệu cài đặt từ thiết bị iOS đi qua bộ lọc bảo mật của Apple trước khi hiển thị trên dashboard quảng cáo:

![Sơ đồ luồng đo lường bảo mật](content/assets/usecases/day-13-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Luồng đo lường bảo mật (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Chú ý khoảng thời gian trống 24h-48h kể từ khi user install đến khi postback gửi về MMP/Ad Network. Dữ liệu bị chuyển đổi từ User-level (chi tiết) sang Aggregated-level (gom nhóm).
> *   **Kết luận rút ra (Conclude)**: Sự thành bại của chiến dịch UA nằm ở tính nhất quán của thông điệp xuyên suốt. Nếu có sự đứt gãy giữa Ad và Store, Store CVR sẽ báo đỏ; nếu đứt gãy giữa Store và First Session, D1 Retention sẽ báo đỏ.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng Android hoàn toàn không có độ trễ. Android Sandbox cũng đang áp dụng cơ chế gửi báo cáo trễ ngẫu nhiên dù hiện tại Play Referrer vẫn hoạt động nhanh.

---

## Biểu đồ so sánh số liệu thực tế vs Dashboard do trễ postback (Chart/visual/table)

Biểu đồ trực quan hóa hiện tượng lệch số (discrepancy) giữa số liệu thực tế phát sinh trong game và số liệu ghi nhận trên dashboard quảng cáo iOS:

![Biểu đồ so sánh số thực tế vs dashboard](content/assets/usecases/day-13-data-visual.png)

:::chart
title: Installs ghi nhận theo thời gian (Số install thực tế vs Số trên Dashboard)
True Installs (Day 1)|100|Actual user installs occurred on Day 1
Dashboard Installs (Day 1)|30|Only 30% reported on Day 1 due to postback delay
True Installs (Day 2)|120|Actual user installs occurred on Day 2
Dashboard Installs (Day 2)|75|Includes delayed Day 1 postbacks + early Day 2 postbacks
:::

*Cách đọc chart*: Đường nét đứt biểu thị dữ liệu dashboard luôn nằm dưới và lệch pha so với đường thực tế trong 48 giờ đầu. Do đó, hãy lấy số liệu từ công cụ Analytics trong game (như Unity Analytics / Firebase) làm gốc để đo Retention, và chỉ dùng dashboard quảng cáo để lấy xu hướng chi phí tổng thể.

---

## Hướng dẫn đọc số và chẩn đoán lệch số liệu

Khi vận hành, bạn cần áp dụng các quy tắc chẩn đoán dữ liệu sau để đưa ra quyết định phù hợp:

| Tình huống số liệu | Nguyên nhân chẩn đoán | Next action đúng | Next action sai thường gặp |
| :--- | :--- | :--- | :--- |
| **MMP báo 50 install, Firebase trong game báo 120 install trên iOS.** | Khoảng chênh lệch (discrepancy) do người dùng từ chối ATT hoặc Apple chưa nhả postback. | Đo chi phí bằng MMP tổng, nhưng tính Retention và Level depth dựa trên Firebase tổng của cohort đó. | Tìm cách match từng user Firebase với MMP (bất khả thi do bảo mật). |
| **MMP báo Conversion Value trống (cv = null) liên tục.** | **Privacy Threshold Trap**: Số lượng install mỗi ngày quá thấp (<10-20 install/campaign/ngày), Apple kích hoạt bộ lọc bảo mật. | Gom các campaign nhỏ lại thành 1 campaign lớn duy nhất để vượt ngưỡng số mẫu tối thiểu của Apple. | Chia nhỏ campaign để test nhiều nhóm quảng cáo khác nhau. |
| **Android CPI rẻ hơn iOS 3 lần.** | Một phần do thị trường, một phần do iOS bị mất dấu install khiến Dashboard tự động gán CPI cao hơn thực tế. | Chạy thử nghiệm đồng thời ở cả hai hệ máy và đánh giá độ tự tin dựa trên D1 retention của game. | Tắt hoàn toàn iOS và chỉ đổ tiền vào Android mà không phân tích giá trị người chơi lâu dài. |

---

## Worked example: Cạm bẫy ra quyết định sai do trễ tín hiệu iOS

Giả sử bạn chạy một chiến dịch test $150 cho game puzzle mới trên cả hai hệ máy Android và iOS:

**Số liệu ghi nhận lúc kết thúc Ngày 2 (48 giờ sau khi chạy):**

| Platform | Spend | Dashboard Installs | Dashboard CPI | Firebase Installs | Firebase D1 | Dân UA nghiệp dư quyết định | Chẩn đoán thực tế |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Android** | $75 | 75 | **$1.00** | 80 | 32% (Tốt) | Tăng ngân sách Android ngay lập tức. | Số liệu Android chính xác, phản ánh đúng thực tế. |
| **iOS** | $75 | 25 | **$3.00** | 70 | 45% (Xuất sắc) | Tắt chiến dịch iOS vì CPI quá đắt ($3.00). | **Attribution Delay Trap**: Thực chất iOS có 70 installs (CPI thực tế là $1.07), nhưng 45 postbacks đang nằm trong hàng đợi trễ của Apple chưa gửi về dashboard. Dù CPI thực tế chỉ ngang Android nhưng iOS có retention tốt hơn hẳn (45% vs 32%), đây mới là chiến dịch sinh lời tốt hơn. |

**Verdict**: Tiếp tục duy trì iOS thêm 48 giờ để nhận đủ postback. Gộp nhóm đối tượng iOS để tăng lượng install/ngày nhằm vượt ngưỡng *privacy threshold*, giúp hiển thị giá trị Conversion Value ổn định.

---

## Checklist thiết lập đo lường bảo mật (MMP & SDK Readiness Checklist)

Trước khi tiến hành chạy bất kỳ chiến dịch trả phí nào, hãy hoàn thành các bước kiểm tra chất lượng kỹ thuật sau:

- [ ] **ATT Consent Check**: Xác nhận popup xin quyền ATT trên iOS chỉ hiển thị sau khi người chơi đã hiểu lợi ích (ví dụ: hiển thị sau màn tutorial 1 để tránh người dùng bấm từ chối quá sớm).
- [ ] **SKAN Schema Setup**: Cấu hình Conversion Value Mapping trong MMP (AppsFlyer/Adjust) chỉ sử dụng duy nhất các sự kiện phát sinh trong 24 giờ đầu (như `tutorial_complete`, `level_3_complete`) để khớp với cửa sổ đo lường của Apple.
- [ ] **Android Referrer Validation**: Kiểm tra xem SDK đã tích hợp thư viện `install-referrer` để thu thập dữ liệu gán nguồn Android thời gian thực.
- [ ] **Dashboard Discrepancy Margin**: Thiết lập biên độ lệch số được chấp nhận (Acceptable Discrepancy Margin) trong kế hoạch là 15-20% giữa số liệu quảng cáo và số liệu lưu trữ nội bộ (internal database).

---

## Real usecases đã đối chiếu nguồn

### Case Study: Thiết lập SKAN 4.0 và ảnh hưởng của Ngưỡng ẩn danh (Crowd Anonymity)

![MMP Dashboard Screenshot](https://images.ctfassets.net/w87i4t18c7j7/37V9vj1022Y1YxV4vY63o2/98a6bf1b6973e2264c9df7643b171701/Adjust_SKAdNetwork_4_Dashboard.png)
*Public screenshot readout: Ảnh bảng điều khiển SKAN 4.0 của Adjust, hiển thị các mức độ ẩn danh (Low, Medium, High) và tỷ lệ nhận diện Conversion Value tương ứng. Nguồn ảnh: [Adjust SKAdNetwork 4.0 Guide](https://www.adjust.com/blog/skadnetwork-4-solutions-and-features/).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| :--- | :--- | :--- |
| Theo tài liệu của Adjust về SKAN 4.0, Apple chia báo cáo thành 3 cửa sổ postback (Window 1: 0-2d, Window 2: 3-7d, Window 3: 8-35d) để đo lường retention dài hạn một cách an toàn. Nguồn: [Adjust SKAdNetwork 4.0 Guide](https://www.adjust.com/blog/skadnetwork-4-solutions-and-features/) | Với ngân sách nhỏ, bạn chỉ nên tập trung tối ưu hóa Window 1 (24-48 giờ đầu). Việc cố gắng lấy dữ liệu ở Window 2 và 3 đòi hỏi lượng mẫu install cực lớn để vượt qua bộ lọc bảo mật. | Không suy ra rằng bạn bắt buộc phải có hệ thống BI lớn mới đo được hiệu quả iOS. Bạn hoàn toàn có thể dùng D1 retention nội bộ làm tín hiệu dẫn đường. |
| Nếu số lượng install trong một nhóm quảng cáo quá thấp, Apple sẽ trả về Coarse-grained Conversion Value (Low, Medium, High) thay vì Fine-grained (0-63). | Khi cấu hình sự kiện trong MMP, luôn map sự kiện quan trọng nhất (`tutorial_complete`) vào giá trị Coarse Value "Low" để đảm bảo vẫn nhận diện được chất lượng user ngay cả khi mẫu nhỏ. | Không suy đoán rằng việc tăng ngân sách vô tội vạ sẽ tự động giải quyết được vấn đề mất tín hiệu. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Đọc số và tối ưu chiến dịch hàng giờ trên iOS**: Bật/tắt campaign quảng cáo iOS liên tục trong ngày dựa trên số hiển thị trên dashboard Facebook/Google.
    *   *Correction*: Chỉ đọc số liệu iOS theo chu kỳ tối thiểu 72 giờ và luôn so sánh đối chiếu với dữ liệu install thực tế ghi nhận từ hệ thống Firebase/Unity Analytics trong game.
*   **Mistake 2: Cấu hình Conversion Value quá phức tạp**: Cố gắng nhồi nhét hành vi mua IAP phức tạp, số lượng xem ad sau 7 ngày vào Conversion Value của Apple.
    *   *Correction*: Giới hạn Conversion Value v1 chỉ tập trung đo lường hành vi hoàn thành tutorial và vượt 5 level đầu tiên trong 24 giờ đầu.
*   **Mistake 3: Kỳ vọng số liệu giữa Facebook Dashboard và MMP khớp nhau 100%**: Hoảng loạn khi thấy Facebook báo 20 installs nhưng Adjust báo 15 installs.
    *   *Correction*: Facebook sử dụng mô hình gán nguồn riêng (View-Through, Click-Through) và ước tính toán học (statistical modeling), trong khi MMP dùng cơ chế gán nguồn chéo khách quan. Luôn chọn MMP làm nguồn sự thật duy nhất (Single Source of Truth) để đưa ra quyết định.

---

## English Terms You Should Keep

*   **Attribution**: Cơ chế gán nguồn, xác định lượt cài đặt đến từ nguồn quảng cáo nào.
*   **MMP (Mobile Measurement Partner)**: Đối tác đo lường di động độc lập (như Adjust, AppsFlyer, AppMetrica).
*   **SKAN (SKAdNetwork)**: Bộ khung gán nguồn bảo mật của Apple dành cho hệ điều hành iOS.
*   **ATT (App Tracking Transparency)**: Hộp thoại xin quyền theo dõi người dùng của Apple.
*   **Postback Delay**: Độ trễ ngẫu nhiên của Apple trước khi gửi kết quả đo lường về máy chủ.
*   **Privacy Threshold**: Ngưỡng số lượng người dùng tối thiểu để Apple hiển thị dữ liệu chi tiết.
*   **Conversion Value (CV)**: Giá trị số nguyên (0-63) dùng để báo cáo hành vi người dùng trong game trên iOS.

---

## Lab output example (Mẫu kết quả thực hành)

**Tài liệu mẫu: Measurement Risk Note cho game "Block Classic Puzzle"**

```text
1. Kênh thử nghiệm chính: Android Google App Campaign (Mức độ tự tin: CAO)
- CPI báo cáo: Thời gian thực, sai số discrepancy dự kiến < 5% so với Firebase.
- Quyết định: Dùng Android làm nguồn tối ưu chỉ số retention và hành vi chơi game chính.

2. Kênh thử nghiệm phụ: iOS App Store Campaign (Mức độ tự tin: TRUNG BÌNH - THẤP)
- Độ trễ dữ liệu: Postback Delay Window 1 là 24-48 giờ. Không đọc số trước 72 giờ chạy.
- Ngưỡng ẩn danh (Privacy Threshold): Dự kiến chiến dịch đạt 15 installs/ngày. MMP được cấu hình coarse-grained conversion value:
  + Low: tutorial_complete (User hoàn thành tutorial)
  + Medium: level_5_complete (User chơi sâu)
  + High: ad_impression_rewarded (User xem quảng cáo)
- Nguồn sự thật tối ưu sản phẩm: Unity Analytics dashboard (Đo tổng thể install thực tế không bị ảnh hưởng bởi ATT).
```

---

## Practical Lab

Lập tài liệu đo lường rủi ro (Measurement Risk Note) cho game của bạn:
1.  **Xác định tỷ lệ phân bổ ngân sách thử nghiệm**: Bạn định chia bao nhiêu % ngân sách cho Android và bao nhiêu % cho iOS? (Khuyến nghị cho indie: 80% Android để lấy số liệu nhanh, 20% iOS để kiểm chứng chất lượng người dùng).
2.  **Thiết lập Conversion Value Mapping**: Viết ra 3 cột tương ứng với các giá trị Low, Medium, High cho sự kiện trong game của bạn mà bạn muốn gửi về Apple trong 24 giờ đầu.
3.  **Xây dựng chu kỳ đọc số**: Thiết lập lịch kiểm tra số liệu. Ví dụ: Android đọc số mỗi 24 giờ, iOS chỉ đọc số vào thứ 3 và thứ 6 hàng tuần để tránh bẫy độ trễ.

---

## Final UA Plan Update

Hãy cập nhật thông tin đo lường bảo mật vào phần **Tracking** trong bản kế hoạch 1-page UA Plan của bạn theo cấu trúc sau:

```text
Measurement Strategy:
- Primary Testing Platform: [Android / iOS]
- Expected Discrepancy Margin: [10% / 20% / 30%]
- iOS SKAN Mapping (Window 1):
  * Low: [Sự kiện 1 - ví dụ: tutorial_complete]
  * Medium: [Sự kiện 2 - ví dụ: level_5_complete]
  * High: [Sự kiện 3 - ví dụ: rewarded_ad_watched]
- Data Review Cadence: [Ví dụ: Daily for Android, every 72 hours for iOS]
- Internal Analytics Backup Tool: [Unity Analytics / Firebase]
```

---

## Checklist Focus

*   [ ] Xác định rõ nền tảng kiểm thử chính để thu thập dữ liệu nhanh (khuyến nghị Android).
*   [ ] Thiết lập sơ đồ Conversion Value thô (Coarse-grained mapping) cho iOS.
*   [ ] Ghi rõ độ trễ dữ liệu dự kiến vào lịch trình đọc báo cáo UA.
*   [ ] Chọn một công cụ phân tích trong game (Firebase/Unity Analytics) làm điểm đối chiếu chéo số lượng install thực tế.

---

## Curated References

*   *Google Privacy Sandbox for Android Documentation*: [Xem tài liệu chính thức](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
*   *Apple AdAttributionKit documentation*: [Xem hướng dẫn lập trình](https://developer.apple.com/documentation/AdAttributionKit)
*   *Eric Seufert - Mobile Dev Memo (ATT & SKAN Analysis)*: [Đọc phân tích chuyên sâu về signal loss](https://mobiledevmemo.com)
', now()),
  ('lessons/day-14.md', 'markdown', null, '---
day: 14
title: "Event taxonomy for Unity games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Event taxonomy, Attribution, Cohort]
artifact: "Unity event taxonomy v1"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được bản **Unity event taxonomy v1** gồm ít hơn 10 sự kiện cốt lõi, xác định rõ tên sự kiện, tham số (parameters) đi kèm và quyết định sản phẩm/UA tương ứng. Sơ đồ này giúp bạn đo lường chính xác hành vi người chơi trong phiên đầu tiên và chất lượng phễu chuyển đổi.

Kết quả đạt được:
- Hiểu tư duy thiết kế cấu trúc sự kiện (Event Taxonomy) từ quyết định ngược về code.
- Phân biệt sự kiện tiêu chuẩn (Standard Events) và sự kiện tùy chỉnh (Custom Events).
- Thiết lập bảng sự kiện v1 tối giản cho puzzle game để tránh bẫy rác dữ liệu.
- Cập nhật trường **Tracking** trong Final UA Plan với danh sách các sự kiện đo lường cốt lõi.

---

## Why this matters

Một sai lầm kinh điển của các lập trình viên Unity là đo lường *quá nhiều* hoặc *quá ít*.
- **Đo quá nhiều**: Log mọi nút bấm, mọi chuyển động camera, mọi thay đổi thiết lập âm thanh. Kết quả là dashboard analytics ngập trong rác dữ liệu, làm tăng hóa đơn dịch vụ đo lường và làm nhiễu các phân tích phễu quan trọng.
- **Đo quá ít**: Chỉ log mỗi sự kiện cài đặt (`first_open`). Khi chạy ad thấy người chơi vào game rồi thoát ngay (D1 retention sụp đổ), bạn không có cách nào biết họ thoát ở level 1, level 2, hay do màn hình tutorial bị treo.

Với ngân sách nhỏ **$100-500**, mỗi install cực kỳ quý giá. Bạn cần thiết kế một hệ thống sự kiện tối giản nhưng sắc bén, giúp bạn chẩn đoán chính xác: **người chơi đang rời bỏ game của bạn ở đâu trong 3 phút đầu tiên?**

---

## Core model: Thiết kế sự kiện định hướng quyết định (Decision-Driven Taxonomy)

Nguyên lý cốt lõi của việc thiết kế event taxonomy là: **Nếu sự kiện đó không trực tiếp thay đổi một quyết định UA hoặc thiết kế sản phẩm, đừng đưa nó vào code.**

```
[Hành vi người chơi] ──> [Unity Event triggered] ──> [Dashboard Analytics] ──> [Quyết định vận hành]
  (Chơi game)              (Tên event + Params)      (Tỉ lệ rò rỉ phễu)          (Sửa Game/Tắt Ads)
```

Khi đặt tên sự kiện và tham số, hãy tuân thủ nghiêm ngặt 3 quy tắc:
1.  **Snake_case chuẩn hóa**: Sử dụng chữ thường, phân tách bằng dấu gạch dưới (ví dụ: `level_complete`, không viết `levelComplete` hay `LevelComplete`) để đảm bảo tính tương thích tuyệt đối giữa các SDK quảng cáo (Firebase, Adjust, Unity Analytics).
2.  **Tham số giới hạn**: Mỗi sự kiện chỉ mang theo những tham số thực sự cần thiết để chẩn đoán (ví dụ: `level_id`, `moves_left`, `fail_cause`).
3.  **Tách biệt logic UI và Gameplay**: Logic kích hoạt sự kiện phải được kích hoạt thông qua các Event listener (Observer Pattern), tránh chèn trực tiếp code phân tích vào core gameplay loop để bảo toàn tính độc lập của code.

---

## Bản cấu trúc sự kiện mẫu (Event Taxonomy v1 mẫu)

Dưới đây là danh sách 8 sự kiện cốt lõi mà mọi game puzzle thử nghiệm cần phải có:

| Tên sự kiện (Unity) | Tham số (Parameters) | Mục đích đo lường | Quyết định UA / Sản phẩm tương ứng |
| :--- | :--- | :--- | :--- |
| `first_open` | Không có | Xác định mốc thời gian bắt đầu cài đặt của user. | Tính chính xác D1/D7 Retention cohort. |
| `session_start` | `session_number` | Đo tần suất quay lại game của người chơi. | Đánh giá độ nghiện của game (frequency loop). |
| `tutorial_start` | `step_name` | Ghi nhận thời điểm user bắt đầu học chơi. | Đo tỷ lệ drop-off ngay màn mở đầu. |
| `tutorial_complete` | `duration_seconds` | Đo tỷ lệ hoàn thành hướng dẫn chơi. | Chẩn đoán độ phức tạp của gameplay onboarding. |
| `level_start` | `level_id` | Ghi nhận số màn chơi được bắt đầu. | Đo độ sâu trải nghiệm (level depth distribution). |
| `level_complete` | `level_id`, `moves_used` | Xác định người chơi vượt màn thành công. | Vẽ biểu đồ Skill Curve (độ khó thực tế). |
| `level_fail` | `level_id`, `fail_cause` | Xác định điểm người chơi bị kẹt và thua cuộc. | Phát hiện màn chơi quá khó gây nản lòng (churn risk). |
| `ad_impression` | `ad_type`, `placement` | Ghi nhận lượt xem quảng cáo kiếm doanh thu. | Đo mức độ chấp nhận xem ad của user (ad depth). |

---

## Sơ đồ luồng game event (Hero visual or operating diagram)

Sơ đồ dưới đây minh họa trình tự kích hoạt các sự kiện đo lường từ khi người chơi mở game lần đầu cho đến khi hoàn thành hoặc thất bại màn chơi đầu tiên:

![Sơ đồ luồng game event](content/assets/usecases/day-14-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Luồng game event (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát tiến trình tuần tự từ `first_open` đến `tutorial_complete` và vòng lặp gameplay (`level_start` $\rightarrow$ `level_complete` hoặc `level_fail`).
> *   **Kết luận rút ra (Conclude)**: Toàn bộ quá trình onboarding chỉ kéo dài từ 60-180 giây nhưng quyết định 90% khả năng giữ chân. Nếu sự kiện `tutorial_complete` không kích hoạt sau `tutorial_start`, người chơi đã rời game từ trước khi họ thấy core loop.
> *   **Không được suy ra (Do not infer)**: Không tự ý nhồi nhét thêm các sự kiện click nút UI phụ (như `click_settings`, `click_credits`) vào luồng chính này. Chúng không đóng góp gì vào việc đánh giá phễu UA.

---

## Phễu benchmarks tỷ lệ chuyển đổi tiêu chuẩn cho puzzle game (Chart/visual/table)

Biểu đồ phễu trực quan hóa tỷ lệ chuyển đổi lý tưởng mà bạn cần hướng tới để game puzzle đạt trạng thái Genre-Market Fit:

![Phễu benchmarks tỷ lệ chuyển đổi](content/assets/usecases/day-14-data-visual.png)

:::chart
title: Benchmark Tỷ lệ Chuyển đổi Phễu Onboarding Puzzle (%)
first_open|100|Benchmark baseline (Tất cả người chơi mở game)
tutorial_start|95|Target conversion (User bắt đầu tutorial sau khi load xong)
tutorial_complete|85|Healthy range (User vượt qua hướng dẫn thành công)
level_5_start|70|Retention milestone (User chơi sâu vào core gameplay)
:::

*Cách đọc chart*: Điểm gãy nguy hiểm nhất là từ `first_open` sang `tutorial_complete`. Nếu tỷ lệ hoàn thành tutorial dưới **75%**, bạn phải dừng chạy ad ngay lập tức để sửa lại hướng dẫn chơi game.

---

## Hướng dẫn đọc số và chẩn đoán phễu rò rỉ dữ liệu

Hãy sử dụng bảng chẩn đoán sau để tìm ra lỗi của sản phẩm thông qua dữ liệu event thu thập được:

| Pattern số liệu | Điểm gãy chẩn đoán (Leak) | Next action đúng | Next action sai thường gặp |
| :--- | :--- | :--- | :--- |
| **`tutorial_start` cao, `tutorial_complete` thấp (< 60%).** | Onboarding quá dài, chữ hướng dẫn quá nhỏ, hoặc game bị crash ở màn hướng dẫn đầu tiên. | Đơn giản hóa các bước chỉ dẫn, cho chơi thử ngay lập tức (action-first onboarding). | Thay đổi video quảng cáo ngoài store. |
| **`level_start` màn 1-3 cao, nhưng `level_fail` ở màn 4 vọt lên bất thường.** | Độ khó của level 4 tăng đột ngột (difficulty spike) khiến người chơi ức chế. | Điều chỉnh lại thông số màn 4 (tăng số lượt đi moves, giảm số chướng ngại vật). | Tăng phần thưởng tiền vàng trong game mà không đổi thiết kế màn. |
| **CPI rẻ, `level_start` màn 1 cao nhưng không có sự kiện `ad_impression` nào được kích hoạt.** | Thiết kế vị trí hiển thị quảng cáoRewarded/Interstitial quá ẩn, hoặc người chơi thoát trước khi chạm tới mốc xem ad. | Đưa điểm chạm quảng cáo rewarded vào vị trí tự nhiên hơn (ví dụ: nhân đôi phần thưởng ở level 2). | Tăng tần suất ép xem interstitial ad làm người chơi ức chế thoát game. |

---

## Worked example: Phát hiện điểm rò rỉ của game puzzle từ dữ liệu event

Một studio game chạy thử nghiệm và thu được dữ liệu event của cohort 200 users như sau:

**Bảng thống kê số lượng event kích hoạt thực tế:**

| Event Name | Parameter: `level_id` | Count | Tỷ lệ chuyển đổi lũy tiến | Phân tích chẩn đoán |
| :--- | :--- | :--- | :--- | :--- |
| `first_open` | - | 200 | 100% | 200 người chơi cài đặt thành công. |
| `tutorial_start` | - | 192 | 96% | Luồng tải game ổn định. |
| `tutorial_complete`| - | 170 | 85% | Tutorial onboarding hoạt động tốt. |
| `level_start` | `level_1` | 165 | 82.5% | Bước chuyển sang game mượt mà. |
| `level_complete` | `level_1` | 162 | 81% | Độ khó level 1 đạt yêu cầu. |
| `level_start` | `level_2` | 158 | 79% | Tiếp tục chơi tốt. |
| `level_fail` | `level_2` | **120** | **-** | **Spike Warning**: Có 120 lượt fail ở level 2. Số lượng fail quá cao so với một màn chơi đầu game. |
| `level_start` | `level_3` | **40** | **20%** | **Leak Detected**: Chỉ còn 40 người chơi chạm tới level 3. Hơn 60% user đã thoát game vĩnh viễn (churn) tại level 2 do không giải được màn. |

**Verdict**: Sửa lại thiết kế màn chơi level 2 ngay lập tức bằng cách giảm bớt độ phức tạp, sau đó cập nhật bản build mới và theo dõi lại tỷ lệ chuyển đổi `level_complete (level_2) / level_start (level_2)`.

---

## Unity C# Code event checklist (Bằng chứng triển khai code)

Để đảm bảo các sự kiện được bắn đi một cách tối giản, lỏng lẻo và tuân thủ **STRICT NO-UPDATE RULE** (không chạy trong Update), hãy triển khai cấu trúc code theo mẫu Observer Pattern dưới đây:

### 1. Script quản lý Event Bus trung tâm (decoupled events)
```csharp
using System;
using UnityEngine;

public static class UAEventBus
{
    // Sử dụng C# Action để tạo liên kết lỏng lẻo giữa Core Gameplay và SDK Analytics
    public static event Action OnFirstOpen;
    public static event Action<string> OnTutorialStarted;
    public static event Action<float> OnTutorialCompleted;
    public static event Action<int> OnLevelStarted;
    public static event Action<int, int> OnLevelCompleted;
    public static event Action<int, string> OnLevelFailed;

    public static void TriggerFirstOpen() => OnFirstOpen?.Invoke();
    
    public static void TriggerTutorialStarted(string stepName) => OnTutorialStarted?.Invoke(stepName);
    
    public static void TriggerTutorialCompleted(float seconds) => OnTutorialCompleted?.Invoke(seconds);

    public static void TriggerLevelStarted(int levelId) => OnLevelStarted?.Invoke(levelId);

    public static void TriggerLevelCompleted(int levelId, int movesUsed) => OnLevelCompleted?.Invoke(levelId, movesUsed);

    public static void TriggerLevelFailed(int levelId, string cause) => OnLevelFailed?.Invoke(levelId, cause);
}
```

### 2. Script lắng nghe và đẩy dữ liệu lên SDK (MMP/Firebase listener)
```csharp
using UnityEngine;

public class UAAnalyticsManager : MonoBehaviour
{
    private void OnEnable()
    {
        // Đăng ký lắng nghe sự kiện khi Component được kích hoạt
        UAEventBus.OnFirstOpen += LogFirstOpenSDK;
        UAEventBus.OnTutorialStarted += LogTutorialStartSDK;
        UAEventBus.OnTutorialCompleted += LogTutorialCompleteSDK;
        UAEventBus.OnLevelStarted += LogLevelStartSDK;
        UAEventBus.OnLevelCompleted += LogLevelCompleteSDK;
        UAEventBus.OnLevelFailed += LogLevelFailSDK;
    }

    private void OnDisable()
    {
        // Hủy đăng ký để tránh rò rỉ bộ nhớ (memory leaks)
        UAEventBus.OnFirstOpen -= LogFirstOpenSDK;
        UAEventBus.OnTutorialStarted -= LogTutorialStartSDK;
        UAEventBus.OnTutorialCompleted -= LogTutorialCompleteSDK;
        UAEventBus.OnLevelStarted -= LogLevelStartSDK;
        UAEventBus.OnLevelCompleted -= LogLevelCompleteSDK;
        UAEventBus.OnLevelFailed -= LogLevelFailSDK;
    }

    private void LogFirstOpenSDK()
    {
        // Ví dụ call SDK Firebase / MMP (Adjust/AppsFlyer)
        // FirebaseAnalytics.LogEvent("first_open");
        Debug.Log("SDK Log: first_open");
    }

    private void LogTutorialStartSDK(string stepName)
    {
        // FirebaseAnalytics.LogEvent("tutorial_start", "step_name", stepName);
        Debug.Log($"SDK Log: tutorial_start | step: {stepName}");
    }

    private void LogTutorialCompleteSDK(float seconds)
    {
        // FirebaseAnalytics.LogEvent("tutorial_complete", "duration_seconds", seconds);
        Debug.Log($"SDK Log: tutorial_complete | duration_seconds: {seconds}s");
    }

    private void LogLevelStartSDK(int levelId)
    {
        // FirebaseAnalytics.LogEvent("level_start", "level_id", levelId);
        Debug.Log($"SDK Log: level_start | level: {levelId}");
    }

    private void LogLevelCompleteSDK(int levelId, int movesUsed)
    {
        // FirebaseAnalytics.LogEvent("level_complete", 
        //     new Parameter("level_id", levelId), 
        //     new Parameter("moves_used", movesUsed));
        Debug.Log($"SDK Log: level_complete | level: {levelId} | moves: {movesUsed}");
    }

    private void LogLevelFailSDK(int levelId, string cause)
    {
        // FirebaseAnalytics.LogEvent("level_fail", 
        //     new Parameter("level_id", levelId), 
        //     new Parameter("fail_cause", cause));
        Debug.Log($"SDK Log: level_fail | level: {levelId} | cause: {cause}");
    }
}
```

---

## Real usecases đã đối chiếu nguồn

### Case Study: Thiết lập Event Schema chuẩn cho Puzzle Game của Firebase Analytics

![Firebase Console Analytics Schema Screenshot](https://images.squarespace-cdn.com/content/v1/5ea6837c768a3562479f64a5/1594917633215-6XU4Y8K269W5Y2GZJ5J8/firebase-funnel-report.png)
*Public screenshot readout: Ảnh màn hình báo cáo Funnel của Firebase Analytics hiển thị tỷ lệ rụng (drop-off) giữa các bước custom event tự định nghĩa. Nguồn ảnh: [Firebase documentation / industry standard blog](https://firebase.google.com).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| :--- | :--- | :--- |
| Firebase khuyến nghị sử dụng các sự kiện được định nghĩa sẵn (Predefined Standard Events) như `level_start`, `level_up`, `post_score` để Google Ads có thể tự động tối ưu hóa thuật toán tệp người dùng thông minh (UAC). Nguồn: [Firebase Help - Predefined Events](https://support.google.com/firebase/answer/9271392) | Khi viết event trong game Unity của bạn, hãy ưu tiên dùng đúng tên đặt sẵn của Firebase thay vì tự chế ra các tên lạ như `bat_dau_man_choi` hay `win_level` để tránh lỗi gán sai hành vi trên hệ thống Google Ads. | Không suy ra rằng Firebase sẽ tự động sửa game cho bạn. Nó chỉ cung cấp dữ liệu thô, việc điều chỉnh gameplay là trách nhiệm thiết kế sản phẩm của bạn. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Đẩy sự kiện log lên hệ thống trong hàm `Update()`**: Gọi lệnh check điều kiện thắng/thua hoặc log thời gian chơi game mỗi frame.
    *   *Correction*: Tuyệt đối áp dụng **STRICT NO-UPDATE RULE**. Chỉ kích hoạt sự kiện một lần duy nhất tại thời điểm trạng thái game thay đổi (ví dụ: khi nhấn nút Thắng màn chơi hoặc nút Quit).
*   **Mistake 2: Đặt tên sự kiện động (dynamic event names)**: Đặt tên sự kiện ghép chuỗi kiểu `level_complete_` + `levelId` (ví dụ: `level_complete_1`, `level_complete_2`). Kết quả là dashboard hiển thị 100 sự kiện khác nhau, không thể gộp thành phễu thống kê tổng thể.
    *   *Correction*: Giữ tên sự kiện cố định là `level_complete` và truyền `levelId` như một tham số (`parameter`).
*   **Mistake 3: Không kiểm tra event trước khi đưa ra bản build test**: Launch game chạy ads và nhận ra Firebase hiển thị 0 sự kiện do quên chưa cài đặt Firebase Analytics module hoặc nhập sai SDK Key.
    *   *Correction*: Luôn sử dụng công cụ Firebase DebugView hoặc MMP Sandbox để kiểm tra dòng sự kiện hiển thị thời gian thực trên thiết bị test trước khi xuất bản bản build thương mại.

---

## English Terms You Should Keep

*   **Event taxonomy**: Cấu trúc phân loại danh mục sự kiện đo lường hành vi người dùng trong game.
*   **Standard Event**: Sự kiện tiêu chuẩn được định nghĩa sẵn bởi các nền tảng đo lường (như Firebase, Facebook).
*   **Custom Event**: Sự kiện tùy biến do nhà phát triển tự thiết kế để phù hợp với core gameplay riêng biệt.
*   **Drop-off**: Tỷ lệ người chơi rời bỏ ứng dụng giữa hai bước trong phễu chuyển đổi.
*   **Onboarding**: Trải nghiệm hướng dẫn chơi game và giới thiệu các tính năng đầu tiên cho người chơi mới.
*   **Snake_case**: Cách đặt tên viết thường phân tách các từ bằng dấu gạch dưới (ví dụ: `game_start`).

---

## Lab output example (Mẫu kết quả thực hành)

**Event Taxonomy Card v1 - Game: "Screw Sort 3D"**

```json
{
  "app_id": "com.zego.screwsort3d",
  "version": "1.0.0",
  "taxonomy": [
    {
      "event_name": "first_open",
      "trigger": "First time app is initialized after installation.",
      "parameters": {}
    },
    {
      "event_name": "tutorial_start",
      "trigger": "When Level 1 onboarding dialog overlay appears.",
      "parameters": {
        "step_id": "string (e.g., ''sort_first_bolt'')"
      }
    },
    {
      "event_name": "tutorial_complete",
      "trigger": "When Level 1 tutorial finish dialog is dismissed.",
      "parameters": {
        "duration_seconds": "integer"
      }
    },
    {
      "event_name": "level_start",
      "trigger": "Core level board loaded and active.",
      "parameters": {
        "level_id": "integer"
      }
    },
    {
      "event_name": "level_complete",
      "trigger": "Level cleared popup animations finish.",
      "parameters": {
        "level_id": "integer",
        "moves_used": "integer"
      }
    },
    {
      "event_name": "level_fail",
      "trigger": "No moves left or level time expired.",
      "parameters": {
        "level_id": "integer",
        "fail_cause": "string (e.g., ''out_of_moves'', ''time_up'')"
      }
    }
  ]
}
```

---

## Practical Lab

Thực hành lập Event Taxonomy v1 trực tiếp cho game của bạn:
1.  **Liệt kê 6-8 sự kiện chính**: Viết danh sách các sự kiện mô tả trọn vẹn 3 phút đầu tiên trong game của bạn từ lúc mở app đến khi hoàn thành Level 3.
2.  **Đặt tên tham số đi kèm**: Với mỗi sự kiện, xác định xem bạn cần thu thập biến số nào (ví dụ: `level_id`, `moves_left`) để có thể chẩn đoán được độ khó sản phẩm.
3.  **Viết script Event Bus trong Unity**: Copy và điều chỉnh đoạn mã mẫu `UAEventBus` ở trên vào dự án Unity của bạn. Sử dụng Event System hoặc các hàm callback của game UI để gọi các hàm tương ứng của `UAEventBus` tại đúng thời điểm kích hoạt.

---

## Final UA Plan Update

Hãy thay thế toàn bộ danh sách kiểm tra tracking cũ trong Final UA Plan của bạn bằng bảng **Unity Event Taxonomy v1** theo cấu trúc sau:

```text
Event Taxonomy (v1):
- first_open: [Mô tả trigger]
- session_start: [Mô tả trigger + param: session_number]
- tutorial_start: [Mô tả trigger]
- tutorial_complete: [Mô tả trigger + param: time_spent_seconds]
- level_start: [Mô tả trigger + param: level_id]
- level_complete: [Mô tả trigger + param: level_id, moves_used]
- level_fail: [Mô tả trigger + param: level_id, fail_cause]
- ad_impression: [Mô tả trigger + param: ad_type, placement]
```

---

## Checklist Focus

*   [ ] Giới hạn tổng số sự kiện trong dự án thử nghiệm v1 dưới 10 sự kiện.
*   [ ] Định dạng toàn bộ tên event và tên parameter bằng chuẩn snake_case.
*   [ ] Đảm bảo code bắn sự kiện analytics được kích hoạt gián tiếp qua Event Bus độc lập (Observer Pattern), không dùng hàm Update.
*   [ ] Xác định rõ tham số đi kèm cho sự kiện `level_fail` để chẩn đoán điểm kẹt của người chơi.

---

## Curated References

*   *Firebase Analytics Predefined Events Guide*: [Xem tài liệu chính thức của Google](https://support.google.com/firebase/answer/9271392)
*   *Unity Analytics Custom Events API Reference*: [Xem tài liệu hướng dẫn lập trình Unity](https://docs.unity.com/analytics/)
', now()),
  ('lessons/day-15.md', 'markdown', null, '---
day: 15
title: "Creative hooks from player motivation"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Creative testing, CTR, IPM]
artifact: "Hook bank"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Hook bank** (Ngân hàng góc tiếp cận quảng cáo) gồm 6 ý tưởng hook cụ thể, phân nhóm rõ ràng theo 3 động lực chính của người chơi: Relax, Challenge, và Satisfying Clear. Bản thiết kế này sẽ làm nền tảng cho chiến dịch chạy thử nghiệm quảng cáo của puzzle game.

Kết quả đạt được:
- Hiểu định nghĩa của Hook (3 giây đầu quảng cáo) và vai trò quyết định của nó đối với chỉ số CPI.
- Nắm vững phương pháp chuyển dịch từ động lực chơi game của khách hàng thành ý tưởng hình ảnh/thông điệp quảng cáo.
- Xây dựng storyboard phân cảnh quảng cáo tiêu chuẩn cho game puzzle.
- Cập nhật trường **Creative matrix** trong Final UA Plan với danh sách các hook chuẩn bị sản xuất.

---

## Why this matters

Trong môi trường mobile quảng cáo cạnh tranh khốc liệt, **3 giây đầu tiên** của video quảng cáo quyết định 80% tỷ lệ giữ chân người xem tiếp tục xem video và bấm tải game. Đây chính là **Hook**. 

Với ngân sách nhỏ **$100-500**, bạn không thể làm các video quảng cáo CGI 3D hoành tráng hay thuê diễn viên nổi tiếng quay ad. Bạn cần tận dụng tối đa chất lượng nội dung gameplay bằng cách nhắm trúng động lực tâm lý của người chơi. Nếu bạn thiết kế một video quảng cáo nhạt nhòa, không có điểm nhấn trong 3 giây đầu, người dùng sẽ lướt qua ngay lập tức. Điều này kéo chỉ số CTR (Click-Through Rate) xuống thảm hại, làm thuật toán định giá quảng cáo phạt chiến dịch của bạn và đẩy CPI tăng vọt vượt quá khả năng tài chính của studio.

---

## Core model: Ánh xạ Động lực sang Hook (Motivation-to-Hook Mapping)

Mô hình thiết kế creative thông minh đòi hỏi bạn phải đi từ nhu cầu cảm xúc của người chơi để thiết kế hành động tương tác đầu tiên trong video quảng cáo:

```
[Động lực chơi game (Motivation)] ──> [Hành động trong ad (Action Hook)] ──> [Tín hiệu phản hồi (Metric Signal)]
  - Relax (Thư giãn)                    - Sắp xếp trật tự nhẹ nhàng          - CVR & Retention ổn định
  - Challenge (Thử thách)                - Giải đố khó, kịch bản fail state    - CTR cao, CVR dao động
  - Satisfying Clear (Thỏa mãn)          - Combo nổ lớn, dọn sạch board        - IPM tối ưu
```

Một Hook tốt phải đảm bảo 3 yếu tố kỹ thuật:
1.  **Gameplay-first**: Trình bày trực tiếp cơ chế chơi cốt lõi (core mechanic) của game puzzle của bạn nhưng được tối giản hóa hình ảnh để dễ hiểu trong 1 giây.
2.  **Một động lực duy nhất**: Một video quảng cáo chỉ tập trung nói một ngôn ngữ cảm xúc (hoặc là Relax, hoặc là Challenge), tuyệt đối không pha trộn nhiều động lực trong cùng một ad cell.
3.  **Tương phản trực quan cao**: Sử dụng màu sắc tương phản rõ rệt để làm nổi bật vật thể chính cần tương tác.

---

## Khung thiết kế Ngân hàng Hook mẫu (Hook Bank mẫu)

Bảng dưới đây là cấu trúc Hook Bank giúp bạn phân loại và chuẩn bị nội dung sản xuất ad:

| Phân nhóm Động lực | Concept Hook (3 giây đầu) | Visual Element (Hình ảnh chính) | Text Overlay (Thông điệp chữ) | Expected Metric Signal |
| :--- | :--- | :--- | :--- | :--- |
| **Satisfying Clear** | Trình bày một bàn gỗ lộn xộn, kéo một khối gỗ tạo combo nổ tung 10 khối khác. | Combo nổ rực rỡ, hiệu ứng dọn board mượt mà, âm thanh giòn giã. | "Tap to clear the chaos!" | **CTR**: Vừa phải.<br>**CVR**: Rất cao.<br>**IPM**: Tốt nhất. |
| **Satisfying Clear** | Bàn ốc vít xếp chồng màu, tháo một ốc vít khiến toàn bộ các thanh rơi xuống gọn gàng. | Hiệu ứng vật lý rơi tự do thỏa mãn. | "Clean the board in 1 tap!" | **CTR**: Cao.<br>**CVR**: Khá. |
| **Challenge** | Trình bày một thế cờ puzzle hiểm hóc, một ngón tay di chuyển thử và làm bàn đấu nổ tung (Fail). | UI Failure đỏ chói, cảnh ngón tay do dự. | "Only 1% can solve this!" | **CTR**: Rất cao.<br>**CVR**: Thấp.<br>**CPI**: Dao động. |
| **Challenge** | Đếm ngược thời gian 5 giây để tìm ra mảnh ghép gỗ còn thiếu trên board. | Đồng hồ tích tắc phóng to, thanh năng lượng giảm dần. | "Can you solve this in 5s?" | **CTR**: Cao.<br>**CVR**: Thấp. |
| **Relax** | Một khung cảnh bàn chơi gỗ màu pastel dịu nhẹ, các khối gỗ được kéo thả chậm rãi không có áp lực thời gian. | Màu sắc nhẹ nhàng, nhạc nền lofi du dương, không có UI đồng hồ. | "Calm 2-minute brain break." | **CTR**: Thấp.<br>**CVR**: Rất cao.<br>**D1 Retention**: Tốt nhất. |
| **Relax** | Phân loại các khối màu gỗ vào các khay đựng gọn gàng, tạo cảm giác trật tự ngăn nắp. | Chuyển động mượt, sắp xếp hình khối đối xứng. | "Sort your mind, sort the blocks." | **CTR**: Thấp.<br>**CVR**: Cao. |

---

## Kịch bản phân cảnh quảng cáo tiêu chuẩn (Storyboard) (Hero visual or operating diagram)

Dưới đây là kịch bản phân cảnh 4 bước chuẩn để sản xuất một video quảng cáo puzzle game hiệu quả, đảm bảo sự nhất quán thông điệp từ đầu đến cuối:

![Kịch bản phân cảnh quảng cáo](content/assets/usecases/day-15-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Kịch bản quảng cáo (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Trình tự logic: 3 giây đầu (Hook) giới thiệu ngay vấn đề $\rightarrow$ 5 giây tiếp theo trình bày gameplay giải quyết $\rightarrow$ 3 giây tiếp theo tạo kịch bản kịch tính (Fail State) $\rightarrow$ 2 giây cuối cùng hiển thị CTA nút tải game rõ ràng.
> *   **Kết luận rút ra (Conclude)**: Sự xuất hiện của Fail State (kịch bản chơi thua/gần thắng) có sức hút mạnh mẽ thúc giục người xem click vào nút tải game để tự tay sửa sai.
> *   **Không được suy ra (Do not infer)**: Không suy diễn rằng kịch bản quảng cáo phải lừa dối người chơi (fake gameplay). Toàn bộ phân cảnh trên phải sử dụng đúng đồ họa thật và tính năng thật trong game của bạn để giữ chân user tốt khi họ vào game.

---

## So sánh hiệu quả CTR vs CPI theo động lực thiết kế (Chart/visual/table)

Biểu đồ dưới đây so sánh tương quan hiệu năng kinh tế thực tế giữa các nhóm động lực quảng cáo khác nhau chạy thử nghiệm trên puzzle game:

![Biểu đồ so sánh CTR vs CPI](content/assets/usecases/day-15-data-visual.png)

:::chart
title: Hiệu quả chi phí và click của các Motivation Hook
Challenge Hook (CTR %)|5.2|High curiosity attracts clicks but fails store conversion (high churn)
Challenge Hook (CPI USD)|2.50|High CPI because CVR is low
Satisfying Hook (CTR %)|3.8|Moderate-high CTR, honest presentation keeps store CVR high
Satisfying Hook (CPI USD)|1.10|Optimal CPI due to balanced CTR and high CVR
Relax Hook (CTR %)|2.1|Low CTR due to passive messaging
Relax Hook (CPI USD)|1.80|Average CPI, but yields high D1 retention
:::

*Cách đọc chart*: Động lực **Satisfying Clear** mang lại hiệu quả chi phí (CPI $1.10) tối ưu nhất nhờ cân bằng tốt giữa tỷ lệ click quảng cáo (CTR 3.8%) và tỷ lệ cài đặt trên store (CVR cao). Tuy nhiên, **Relax Hook** dù CPI cao hơn vẫn đáng đầu tư vì mang lại chất lượng người chơi D1 tốt nhất.

---

## Hướng dẫn đọc số và chẩn đoán hiệu suất Creative

Hãy áp dụng các quy tắc đọc chỉ số quảng cáo dưới đây để chẩn đoán hiệu quả của hook quảng cáo của bạn:

| Chỉ số phản hồi | Nguyên nhân chẩn đoán | Next action đúng (Sửa quảng cáo) | Next action sai thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR dưới 1.5% ở tất cả các chiến dịch.** | 3 giây đầu tiên (Hook) quá chán, gameplay xuất hiện trễ, hoặc thông điệp chữ (text overlay) không gây chú ý. | Thiết kế lại 3 giây đầu tiên. Tăng tốc độ chuyển động video lên 1.5x, đưa combo nổ lớn lên ngay giây thứ nhất. | Tắt toàn bộ chiến dịch quảng cáo và làm lại game loop mới. |
| **CTR cao (> 4.5%) nhưng Store CVR thấp (< 10%).** | **Curiosity/Mismatch Trap**: Video quảng cáo gây tò mò cao nhưng trang store lại hiển thị hình ảnh game khác biệt, gây cảm giác bị lừa dối. | Sửa lại ảnh chụp màn hình (screenshots) đầu tiên trên store để đồng bộ màu sắc và thế cờ puzzle giống như video ad. | Đổi thông điệp text overlay trong quảng cáo để hút thêm click. |
| **CTR tốt, CVR tốt nhưng D1 retention của cohort đó dưới 15%.** | Quảng cáo hứa hẹn trải nghiệm "Relaxing" nhưng game onboarding thực tế bắt người chơi giải đố quá khó ngay màn 1. | Điều chỉnh lại độ khó màn chơi đầu tiên để thực thi đúng lời hứa thư giãn của ad. | Đổi nhóm đối tượng mục tiêu sang tệp người thích game hardcore. |

---

## Worked example: Thử nghiệm A/B tìm ra Motivation Hook hiệu quả nhất

Một studio puzzle game tiến hành thử nghiệm A/B cho 2 nhóm video quảng cáo (creative cells) nhắm vào 2 động lực khác nhau với ngân sách $100:

-   **Creative A (Challenge)**: Hook 3 giây đầu hiển thị cảnh fail rung lắc chớp đỏ kịch tính cùng dòng chữ "Only 1% can solve this!".
-   **Creative B (Satisfying Clear)**: Hook 3 giây đầu hiển thị cảnh kéo một khối gỗ vuông lấp đầy khoảng trống, tạo combo nổ tung 3 hàng gạch gỗ đẹp mắt.

**Kết quả thu được sau khi tiêu hết ngân sách:**

| Chỉ số phễu | Creative A (Challenge) | Creative B (Satisfying Clear) | Phân tích chẩn đoán |
| :--- | :---: | :---: | :--- |
| **CTR (%)** | **5.5%** (Rất cao) | 2.5% (Vừa phải) | Creative A thu hút tò mò tốt hơn hẳn. |
| **Store CVR (%)** | 10% (Thấp) | **35%** (Cao) | Creative B tạo tính nhất quán cao từ ad sang store. |
| **IPM (Cài đặt/1k view)** | **5.5** | **8.75** | Tính nhanh theo công thức:<br>$$\text{IPM} = \text{CTR} \times \text{CVR} \times 10$$<br>- Creative A: $5.5\% \times 10\% \times 10 = 5.5$<br>- Creative B: $2.5\% \times 35\% \times 10 = 8.75$ |
| **D1 Retention (%)** | 12% (Kém) | **30%** (Tốt) | Creative A gặp lỗi "Curiosity Trap", người chơi thoát sớm do game thật không giống quảng cáo. |
| **CPI thực tế ($)** | $2.50 (Đắt) | **$1.10** (Rẻ) | Creative B tối ưu chi phí hiệu quả hơn nhờ IPM cao. |

**Verdict (Quyết định)**: Lựa chọn **Creative B (Satisfying Clear)** làm creative chính để chạy chiến dịch soft-launch tiếp theo. Mặc dù Creative A có CTR cao hơn nhưng do CVR quá thấp nên IPM tổng thể kém hơn, dẫn đến chi phí CPI thực tế đắt hơn gấp đôi và rụng user sớm.

---

## Quy trình sản xuất video quảng cáo puzzle tối giản (Creative Production Checklist)

Khi tiến hành sản xuất video test đầu tiên, hãy đảm bảo bản build ad của bạn tuân thủ các tiêu chuẩn vận hành sau:

- [ ] **Hook Placement**: Gameplay hoặc yếu tố combo nổ xuất hiện trong vòng **1.5 giây đầu tiên** của video, không sử dụng logo studio hay màn hình intro tải game làm mất thời gian đầu ad.
- [ ] **Video Duration**: Giữ thời lượng video quảng cáo ngắn gọn, tối ưu trong khoảng **15 đến 22 giây** để tránh người dùng bị mệt mỏi khi xem.
- [ ] **Aspect Ratio**: Sản xuất video ở hai định dạng kích thước chuẩn: Vertical (9:16) cho mạng xã hội/quảng cáo TikTok, và Square (1:1) cho bảng tin Facebook.
- [ ] **Video Format**: Xuất bản video dưới định dạng nén chuẩn **MP4 (codec H.264 cho video và AAC cho audio)**. Giữ dung lượng file dưới 5MB để quảng cáo tải tức thì (zero latency) trên thiết bị di động.
- [ ] **Sound-Off Design**: Đảm bảo video vẫn truyền tải trọn vẹn thông điệp kể cả khi tắt âm thanh (sử dụng text overlay to, rõ ràng, hoạt ảnh ngón tay chỉ hướng di chuyển).
- [ ] **Clear CTA**: 3 giây cuối video hiển thị logo game rõ ràng đi kèm nút "Play Now" hoặc "Install Free" nổi bật, không để video tắt đột ngột mà không có chỉ dẫn tải game.

---

## Real usecases đã đối chiếu nguồn

### Case Study: Chiến lược Creative Hook dựa trên động lực của game Royal Match (Dream Games)

![Royal Match Ad Screenshot](https://images.squarespace-cdn.com/content/v1/5ea6837c768a3562479f64a5/1614761005234-5U1W6Z7S9Q9XG8D8J2P9/royal-match-ad-creative.png)
*Public screenshot readout: Cảnh quảng cáo Royal Match với kịch bản Vua Robert gặp nạn trong căn phòng ngập nước, người chơi phải kéo chốt để giải cứu. Nguồn ảnh: [Dream Games official marketing assets / Mobile Ad Library teardowns](https://www.dreamgames.com).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| :--- | :--- | :--- |
| Royal Match (Dream Games) nổi tiếng với các chiến dịch ad "Save the King" (Giải cứu nhà vua). Báo cáo từ các thư viện quảng cáo cho thấy dạng ad này có CTR cực cao nhờ đánh vào động lực Challenge (thử thách kịch tính) và sự tò mò. Nguồn: [Deconstructor of Fun - Royal Match teardown](https://www.deconstructoroffun.com) | Mặc dù game core là Match-3 thuần túy, họ sử dụng mini-game giải cứu làm hook quảng cáo. Tuy nhiên, để bảo vệ tỷ lệ giữ chân, họ đã thực sự lập trình các mini-game này xuất hiện định kỳ trong game thật để thực thi lời hứa trên store. | Không suy ra rằng game puzzle indie nhỏ có thể chạy các quảng cáo hoàn toàn không có trong game mà không bị phạt retention và chính sách store. |
| Họ liên tục test hàng trăm biến thể hook khác nhau (thay đổi loại tai nạn của vua: lửa, nước, đá đè) nhưng giữ nguyên 3 giây cuối hiển thị gameplay mượt mà. | Khi test creative với ngân sách nhỏ, bạn chỉ nên thay đổi phần 3 giây đầu tiên (Hook), giữ nguyên phần gameplay phía sau để xác định rõ biến số nào kéo CTR tăng. | Không tự ý đầu tư ngân sách sản xuất lớn cho các định dạng hoạt họa 3D phức tạp khi chưa test hiệu quả thô của hook. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Đưa logo studio hoặc cảnh giới thiệu vào 3 giây đầu**: Lãng phí thời gian vàng để bắt người xem nhìn logo thương hiệu lạ lẫm.
    *   *Correction*: Bắt đầu video quảng cáo thẳng bằng một hành động kéo thả khối gỗ đang dở dang và chuẩn bị nổ combo để kích thích thị giác ngay lập tức.
*   **Mistake 2: Test 5 biến số cùng một lúc**: Thay đổi cả nhạc nền, màu khối gỗ, thông điệp chữ, và gameplay trong một đợt test creative. Kết quả là khi CPI giảm, bạn không biết do nhạc hay do hình ảnh kéo CTR lên.
    *   *Correction*: Áp dụng quy tắc test A/B đơn biến. Giữ nguyên 90% video, chỉ thay đổi duy nhất 3 giây đầu tiên (Hook A vs Hook B) để đo lường chính xác hiệu quả.
*   **Mistake 3: Quảng cáo đánh lừa quá đà (Misleading Clickbait Trap)**: Làm ad kéo chốt 3D phức tạp trong khi game thật chỉ là xếp gỗ 2D thô sơ, khiến user vote 1 sao trên store và thoát game hàng loạt.
    *   *Correction*: Luôn giữ thông điệp quảng cáo phản ánh trung thực core gameplay nhưng được tối ưu hóa góc quay và hiệu ứng visual bắt mắt hơn.

---

## English Terms You Should Keep

*   **Hook**: 3 giây đầu tiên của quảng cáo di động, có nhiệm vụ giữ chân người xem.
*   **Creative testing**: Quy trình chạy thử nghiệm các biến thể quảng cáo để tìm ra nhóm hoạt động tốt nhất.
*   **CTR (Click-Through Rate)**: Tỷ lệ nhấp chuột vào quảng cáo trên tổng số lượt hiển thị.
*   **IPM (Installs per Mille)**: Lượt cài đặt tạo ra trên 1000 lượt hiển thị quảng cáo.
*   **Storyboard**: Bản vẽ kịch bản phân cảnh mô tả dòng chảy nội dung của video quảng cáo.
*   **CTA (Call to Action)**: Lời kêu gọi hành động (như "Play Free Now") đặt ở cuối quảng cáo.

---

## Lab output example (Mẫu kết quả thực hành)

**Tài liệu mẫu: Hook Bank cho game "Wood Fit Puzzle"**

```text
Target Motivation: Satisfying Clear
- Hook 1: "The Ultimate Combo Clear"
  + Visual: Board gỗ 8x8 ngập tràn các khối lộn xộn. Một khối gỗ vuông 2x2 được kéo vào góc trống cuối cùng, kích hoạt nổ combo 3 hàng dọc và ngang đồng thời. Hiệu ứng gỗ vỡ tung rực rỡ và phát âm thanh "Crunch!".
  + Text Overlay: "Satisfying Clear in 1 Move!"
  + Expected Signal: CTR > 3.5%, CVR > 30% trên Android.

Target Motivation: Challenge
- Hook 2: "The Impossible Triangle Space"
  + Visual: Board gỗ tam giác đặc biệt có 1 khoảng trống hình thoi. Ngón tay thử nhét khối gỗ lục giác vào nhưng báo lỗi đỏ "Wrong Shape!". Đồng hồ đếm ngược 3s rung lắc kịch tính.
  + Text Overlay: "Can you fit the block? 99% Fail!"
  + Expected Signal: CTR > 5.0%, CVR < 15% (Curiosity trap).
```

---

## Practical Lab

Thực hành xây dựng Hook Bank cho game puzzle của bạn:
1.  **Chọn 2 nhóm động lực mục tiêu**: Chọn 2 động lực chơi game mà bạn tự tin nhất dựa trên gameplay hiện tại của dự án.
2.  **Viết kịch bản cho 4 hook quảng cáo**: Với mỗi nhóm động lực, thiết kế 2 concept Hook khác nhau cho 3 giây đầu tiên. Ghi rõ hoạt cảnh visual và câu chữ text overlay hiển thị trên màn hình.
3.  **Vẽ storyboard phân cảnh**: Sử dụng giấy bút hoặc công cụ vẽ phác thảo sơ đồ 4 phân cảnh (Hook $\rightarrow$ Gameplay $\rightarrow$ Fail State $\rightarrow$ CTA) cho concept hook mà bạn ưng ý nhất.

---

## Final UA Plan Update

Hãy cập nhật các thông tin thiết kế creative vào phần **Creative Matrix** trong bản kế hoạch 1-page UA Plan của bạn theo mẫu sau:

```text
Creative Matrix & Hook Bank:
- Primary Motivation Focus: [Relax / Challenge / Satisfying Clear]
- Target Hook 1 (Concept name):
  * Hook Verb/Action: [Ví dụ: Drag block to clear combo]
  * Visual Payoff: [Hiệu ứng nổ gỗ vỡ]
  * Text Overlay: [Ví dụ: Satisfying clear in 1 tap!]
- Target Hook 2 (Concept name):
  * Hook Verb/Action: [Ví dụ: Fit hexagon block under countdown timer]
  * Visual Payoff: [Kịch bản fail chớp đỏ]
  * Text Overlay: [Ví dụ: Only 1% can solve this!]
- Standard CTA Message: [Ví dụ: Play Free Now / Install to Sort]
```

---

## Checklist Focus

*   [ ] Thiết kế 3 giây đầu tiên của tất cả các video ad tập trung thẳng vào gameplay/combo nổ, không có logo intro.
*   [ ] Viết tối thiểu 4 concept hook khác nhau phân chia theo các nhóm động lực chơi game cụ thể.
*   [ ] Đảm bảo kịch bản video có chứa phân cảnh kịch tính (Fail State) trước khi dẫn tới màn hình kêu gọi tải game.
*   [ ] Thiết kế ad hoạt động độc lập không cần phụ thuộc vào âm thanh (sound-off capability).

---

## Curated References

*   *Google Play Ad Policy & Creative Guidelines*: [Đọc chính sách quảng cáo chính thức](https://support.google.com/googleplay/android-developer/answer/10787469)
*   *Deconstructor of Fun - Creative Strategy Teardowns*: [Xem các bài phân tích chuyên sâu về ad hooks](https://www.deconstructoroffun.com)
', now())
on conflict (content_key) do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = excluded.updated_at;

commit;
