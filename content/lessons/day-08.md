---
day: 8
title: "Metric map for puzzle UA"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, Retention, ARPDAU]
artifact: "Metric decision map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Metric decision map**: một bản đồ liên kết 4 câu hỏi tối ưu hóa cốt lõi với các chỉ số chính (Primary metrics), chỉ số phụ trợ (Supporting metrics) và quy tắc cắt lỗ (stop-loss rules).

Kết quả cần có sau bài:
- Phân biệt rõ ràng các nhóm chỉ số: Acquisition (Thu hút), Retention (Giữ chân), và Monetization (Doanh thu).
- Hiểu cách chọn chỉ số phụ trợ để tránh hiện tượng "đọc số một chiều" (bẫy CPI rẻ nhưng D1 gãy).
- Biết cách thiết lập các khoảng ra quyết định (decision ranges) tương thích riêng với từng thể loại game.
- Cập nhật mục **Metric targets** trong Final UA Plan.

---

## Why this matters

Nhiều nhà phát triển game Unity thường bắt đầu chiến dịch thử nghiệm $100-500 bằng cách mở trang tổng quan (dashboard) lên và nhìn vào một chỉ số duy nhất: **CPI** (giá mỗi lượt cài đặt). Nếu thấy CPI ở mức $0.15, họ ăn mừng; nếu thấy CPI lên tới $0.85, họ hoảng loạn.

Đây là tư duy UA cực kỳ nguy hiểm. Một chỉ số đứng độc lập không bao giờ phản ánh đúng thực tế:
- CPI rẻ có thể đến từ việc video quảng cáo giật gân, đánh lừa (clickbait) khiến người chơi bấm cài đặt nhưng thoát game ngay sau 1 phút chơi (D1 retention thảm hại).
- CPI đắt ($1.2) nhưng người chơi lại cực kỳ chất lượng, tự nguyện xem nhiều ad rewarded hoặc mua gói IAP (LTV cao vượt trội), mang lại tỷ lệ ROAS dương.

Để không bị đánh lừa bởi dữ liệu, bạn cần xây dựng một **Metric decision map** giúp ràng buộc các chỉ số đầu phễu (Acquisition) với cuối phễu (Retention, Monetization) thành từng cặp chẩn đoán tương hỗ.

![LTV vs CPI break even chart](content/assets/usecases/day-08-ltv-vs-cpi.png)

> [!NOTE]
> **Hướng dẫn đọc Biểu đồ hòa vốn LTV vs. CPI (LTV vs. CPI Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Trục hoành là thời gian (30 ngày), trục tung là giá trị ($ USD). Quan sát đường LTV tăng dần từ Ngày 1 và cắt đường CPI nằm ngang ở Ngày 30 (Break-even Point).
> *   **Kết luận rút ra (Conclude)**: Thời điểm hòa vốn (payback day) là Ngày 30. Mọi doanh thu phát sinh sau Ngày 30 của cohort này chính là lợi nhuận ròng của bạn. Nếu đường LTV đi ngang dưới đường CPI suốt đời game, chiến dịch đang chạy lỗ.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng game nào cũng phải hòa vốn vào Ngày 30. Nhiều game puzzle lớn có payback window kéo dài tới 180 ngày hoặc hơn tùy thuộc vào nguồn vốn.

---

## Core model: Hệ thống cặp chỉ số chẩn đoán (Diagnostic Metrics Pairs)

Đừng đọc số đơn lẻ. Hãy luôn đọc chỉ số theo cặp để phát hiện điểm nghẽn thực sự của phễu:

1.  **Cặp Acquisition (Thu hút)**: `CTR` (Tỷ lệ click ad) kết hợp với `Store CVR` (Tỷ lệ cài đặt trên store).
    *   *Mục đích*: Đo lường xem thông điệp quảng cáo và hình ảnh cửa hàng có đồng bộ không.
2.  **Cặp Retention (Giữ chân)**: `D1 Retention` kết hợp với `Tutorial Completion Rate` (Tỷ lệ hoàn thành hướng dẫn).
    *   *Mục đích*: Chẩn đoán xem người chơi thoát sớm do game dở hay do hướng dẫn ban đầu quá khó hiểu.
3.  **Cặp Monetization (Doanh thu)**: `ARPDAU` (Doanh thu trung bình trên người dùng hoạt động ngày) kết hợp với `Ad Impression per DAU` (Số lượt xem ad trung bình của mỗi user).
    *   *Mục đích*: Xem doanh thu tăng do người chơi thực sự gắn kết hay do game đang ép xem quá nhiều quảng cáo gây ức chế.

---

## Khung Bản đồ Quyết định Số liệu mẫu (Main framework/map mẫu)

Dưới đây là khung phân tích giúp bạn thiết lập các chỉ số ra quyết định tương ứng với mục tiêu kiểm chứng:

| Câu hỏi kiểm chứng | Chỉ số chính (Primary) | Chỉ số phụ trợ (Supporting) | Ngưỡng quyết định giả định | Hành động sửa đổi nếu dưới ngưỡng |
| :--- | :---: | :---: | :---: | :--- |
| **1. Ad hứa hẹn có thu hút không?** | CTR | IPM | `> 2.0%` (CTR) | Thiết kế lại 3 giây đầu của video quảng cáo. |
| **2. Trang store có thuyết phục cài đặt?** | Store CVR | Click-to-Install | `> 22%` (CVR) | Thay đổi thứ tự ảnh chụp màn hình store (screenshots). |
| **3. Gameplay phiên đầu giữ chân tốt không?** | D1 Retention | Tutorial Complete | `> 30%` (D1) | Rút ngắn tutorial, làm Level 1-5 dễ thắng hơn. |
| **4. Game có khả năng hoàn vốn không?** | D7 ROAS | ARPDAU | `> 15%` (D7 ROAS) | Bổ sung vị trí đặt quảng cáo nhận thưởng (rewarded ads). |

---

## Sơ đồ Phễu Số liệu UA (Hero visual or operating diagram)

Sơ đồ phễu dưới đây mô tả sự tương quan chặt chẽ giữa các tầng chỉ số từ lúc quảng cáo hiển thị đến khi người chơi tạo ra doanh thu:

![UA metrics funnel mapping](content/assets/usecases/day-08-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ phễu số liệu (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Xem xét sự phân rã từ tầng đầu phễu (CTR, IPM) -> giữa phễu (CVR, CPI) -> cuối phễu (Retention D1/D7) -> đáy phễu (ARPDAU, ROAS).
> *   **Kết luận rút ra (Conclude)**: Chi phí Acquisition (CPI) phải luôn được cân bằng bởi Retention và Monetization để tạo ra LTV lớn hơn CPI. Nếu một mắt xích ở giữa bị gãy (ví dụ CVR thấp), toàn bộ phễu dưới sẽ mất đi lượng người dùng thử nghiệm.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn phải đo lường tất cả các chỉ số này ngay từ ngày đầu tiên. Trong giai đoạn prototype hẹp, hãy tập trung làm sạch CTR, CVR và D1 trước.

---

## Bảng so sánh 3 kịch bản game puzzle (Chart/visual/table)

> [!WARNING]
> **Cảnh báo về khoảng số liệu quyết định (Scenario-specific Decision Ranges)**:
> Các con số mục tiêu dưới đây **KHÔNG** phải là benchmark cố định áp dụng cho mọi game puzzle. Đây là các khoảng số liệu tham khảo cụ thể cho 3 kịch bản vận hành khác nhau. Tùy thuộc vào thiết kế trò chơi và tệp khách hàng, bạn phải tự xác định khoảng số liệu phù hợp với game của mình.

| Kịch bản game (Scenario) | Ngưỡng CPI Kỳ vọng | Ngưỡng D1 Tối thiểu | Ngưỡng ARPDAU Target | ROAS D30 Target |
| :--- | :---: | :---: | :---: | :---: |
| **A: Ad-heavy Puzzle (Casual)** | `$0.15 - $0.35` | `> 32%` | `$0.02 - $0.04` | `> 40%` |
| **B: IAP-heavy Puzzle (Midcore)** | `$0.80 - $1.50` | `> 28%` | `$0.15 - $0.30` | `> 15%` |
| **C: Hybrid-casual (Mix IAP & Ad)** | `$0.40 - $0.70` | `> 30%` | `$0.05 - $0.10` | `> 25%` |

:::chart
title: Ngưỡng CPI Kỳ vọng theo từng kịch bản ($ USD)
Ad-heavy Puzzle|0.25|Thấp, dễ thu hút lượng lớn người chơi casual
IAP-heavy Puzzle|1.15|Cao, nhắm đối tượng có khả năng chi trả sâu
Hybrid-casual|0.55|Trung bình, cân bằng cả hai nguồn doanh thu
:::

*Cách đọc chart*: Game của bạn thuộc kịch bản nào thì chỉ đối chiếu số liệu theo dòng của kịch bản đó. Đừng lấy CPI của game thuần ad (`$0.25`) để ép cho game thuần IAP (`$1.15`), việc so sánh khập khiễng này sẽ dẫn tới quyết định sai lầm.

---

## Hướng dẫn đọc số và chẩn đoán phễu rò rỉ

Hãy chẩn đoán kết quả chạy chiến dịch dựa trên các cặp chỉ số dưới đây:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR > 2.5%**<br>**CVR < 12%** | **Ad-Store Mismatch**: Quảng cáo thu hút tốt nhưng nội dung cửa hàng store lệch pha, không củng cố lời hứa. | Tạm dừng chiến dịch quảng cáo, làm lại ảnh chụp màn hình store (screenshots). | Tiếp tục chạy ad vì nghĩ CTR cao là ad tốt. |
| **CTR > 2.2%**, **CVR > 25%**<br>**Tutorial Complete < 60%** | **Onboarding Friction**: Người chơi tải game vì tò mò nhưng bỏ cuộc ngay trong màn hướng dẫn đầu tiên. | Đơn giản hóa các bước tutorial, thêm chỉ dẫn visual trực quan rõ hơn. | Sửa lại gameplay ở các level cao hoặc đổi video ad. |
| **CTR > 2.0%**, **CVR > 22%**<br>**D1 > 35%**, **D7 ROAS < 5%** | **Monetization Leak**: Game giữ chân người chơi rất tốt nhưng hệ thống quảng cáo nhận thưởng/IAP hoạt động kém. | Bổ dung thêm các vị trí gợi ý xem video nhận thưởng (rewarded ads), tối ưu gói IAP đầu tiên. | Đổi kênh chạy quảng cáo hoặc scale ngân sách. |

### Minh họa Đọc bảng Cohort Retention trên Giao diện Báo cáo

Dưới đây là một bảng Cohort Heatmap mô phỏng dashboard thực tế giúp chẩn đoán sức khỏe giữ chân người chơi:

![Cohort Retention Table Heatmap Mockup](content/assets/usecases/day-08-cohort-table.png)

> [!NOTE]
> **Hướng dẫn đọc Bảng Cohort Retention (Cohort Table Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Cột `Cohort Date` phân nhóm người chơi cài đặt theo ngày, cột `Cohort Size` là số lượng cài đặt ngày hôm đó, các cột sau là tỷ lệ retention suy giảm theo thời gian (Day 1, Day 3, Day 7) biểu diễn bằng màu xanh từ đậm (retention cao) sang nhạt dần.
> *   **Kết luận rút ra (Conclude)**: Cohort nào có màu nhạt đột ngột ở D1 (ví dụ dòng ngày 02/07 rớt xuống 12% so với 32% ngày trước đó) biểu thị có lỗi kỹ thuật phát sinh đột xuất (như build crash, server ngắt kết nối) hoặc chạy nhầm tập target ads kém chất lượng.
> *   **Không được suy ra (Do not infer)**: Không tự suy ra tỷ lệ rụng này sẽ kéo dài mãi mãi theo đường thẳng tuyến tính. Retention thường giảm nhanh ở những ngày đầu và đi ngang thành một đường tiệm cận dài (tail retention).

---

## Worked example: Phân tích chẩn đoán cho Game Xếp hình Thư giãn (Calming Hex Puzzle)

Nhà phát triển chạy thử nghiệm chiến dịch ad với ngân sách $250 trên Meta Ads cho game xếp hình lục giác thư giãn (Calming Hex Puzzle). Mục tiêu giả lập đặt ra:
- CPI kỳ vọng: `$0.35 - $0.50`
- D1 Retention đích: `> 30%`
- Tỷ lệ hoàn thành Tutorial: `> 80%`

**Kết quả thu thập được sau khi chi tiêu $250**:
- Số lượt cài đặt (Installs): 625.
- CPI thực tế tính toán: `$250 / 625 = $0.40` (*Đạt mức kỳ vọng*).
- Tỷ lệ hoàn thành Tutorial: 52% (*Thấp nghiêm trọng*).
- D1 Retention thực tế: 18% (*Không đạt chỉ tiêu*).

**Phân tích chẩn đoán & Tradeoff (Verdict)**:
*   Mặc dù chi phí CPI (`$0.40`) nằm trong khoảng chấp nhận được, nhưng chất lượng người chơi ở lại cực kỳ kém (D1 = 18%).
*   Nhìn sâu vào số liệu phụ trợ (Supporting metrics): Tỷ lệ hoàn thành Tutorial chỉ đạt 52%, nghĩa là gần một nửa số người chơi đã tải game về đã tắt game ngay khi đang làm khảo sát hoặc đang xem hướng dẫn cách chơi màn đầu tiên.
*   **Hành động quyết định**: Đây không phải lỗi của chiến dịch marketing hay video quảng cáo (vì CPI đã đạt chuẩn). Lỗi nằm ở phần onboarding của game. Nhà phát triển quyết định tạm dừng chạy ads hoàn toàn, tiến hành sửa code game để bỏ bớt các hộp thoại hướng dẫn chữ dài dòng, thay bằng hướng dẫn chỉ ngón tay di chuyển khối động, rồi mới bật lại test sau.

---

## Real usecases đã đối chiếu nguồn

### Case Study 1: Merge Mansion (Metacore) — Kỷ luật cắt lỗ và tối ưu Retention ở giai đoạn Soft Launch

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Trong giai đoạn soft launch của *Merge Mansion*, Metacore thiết lập mốc kỷ luật rất nghiêm ngặt: D1 retention phải đạt `> 40%` và D7 retention đạt `> 20%`. Khi chỉ số rớt dưới mốc này, họ lập tức đóng chiến dịch UA paid để quay lại sửa onboarding quest pacing. Nguồn: [Phân tích chi tiết về Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) | Quyết định tạm dừng ad để sửa sản phẩm khi các metrics hỗ trợ (D1/D7) bị gãy là hành động tối ưu để bảo vệ ngân sách hẹp. | Không được tự suy diễn rằng game puzzle của bạn cũng có thể mở lại ad quy mô lớn giống Metacore nếu chưa thực sự vượt qua các ngưỡng chất lượng này. |

### Case Study 2: Rovio (Sugar Blast) — Chuyển dịch từ Tối ưu cài đặt (CPI) sang Hoàn vốn (ROAS)

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Rovio đã công bố chi tiết quá trình chuyển đổi cách chạy UA cho dòng game casual puzzle: từ việc đấu thầu CPI rẻ (chạy cài đặt đại trà) sang mô hình tối ưu theo giá trị (Value-Based / ROAS bidding). Việc tập trung vào D7 ROAS thay vì CPI rẻ giúp nâng cao LTV của tệp người dùng lên 22% nhờ lọc bỏ được các tệp click ảo. Nguồn: [The Game Analytics Masterclass trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass) | Chỉ số CPI rẻ đứng riêng lẻ là vô nghĩa nếu không đi kèm với chỉ số giữ chân và tỷ lệ hoàn vốn ROAS. | Không suy ra rằng game indie nhỏ của bạn cũng cần xây dựng hệ thống dự phóng LTV tự động phức tạp như các studio lớn ngay lập tức. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Chỉ nhìn vào CPI rẻ để đánh giá sự thành bại**
    *   *Correction*: Luôn gắn kèm chỉ số Retention D1. Một user cài đặt giá $0.10 nhưng không bao giờ mở game lần thứ hai thì giá trị thực sự bằng 0.
*   **Mistake 2: Thiếu quy tắc dừng chiến dịch (Stop-loss rules)**
    *   *Correction*: Thiết lập quy tắc cắt lỗ tự động trước khi bấm nút chạy ad: *"Tắt ad ngay nếu sau khi tiêu hết $50 mà số lượt install thu về dưới 50"* (tương đương CPI > $1.00).
*   **Mistake 3: Đọc số quá sớm khi chưa đủ mẫu kiểm chứng**
    *   *Correction*: Với ngân sách $300, hãy đợi chiến dịch thu về tối thiểu 100-200 lượt cài đặt trước khi tiến hành phân tích chẩn đoán phễu để tránh sai số thống kê.

---

## English Terms You Should Keep

*   **CPI**: Cost Per Install (Chi phí trung bình cho mỗi lượt cài đặt game).
*   **Retention**: Tỷ lệ giữ chân người chơi sau X ngày (D1, D7, D30).
*   **ARPDAU**: Average Revenue Per Active User (Doanh thu trung bình trên mỗi người dùng hoạt động ngày).
*   **ROAS**: Return On Ad Spend (Tỷ lệ doanh thu thu về chia cho chi phí quảng cáo đã chi).
*   **IPM**: Install Per Mille (Số lượt cài đặt tạo ra trên mỗi 1,000 lượt hiển thị ad).

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Bản đồ Quyết định Số liệu (Metric Decision Map Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                        METRIC DECISION MAP                            │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Question: Is the ad hook drawing clicks?                           │
│    Primary: CTR (> 2.0%) | Supporting: IPM (> 15)                      │
│    Fail-action: Redesign first 3s video hook with faster puzzle action │
├────────────────────────────────────────────────────────────────────────┤
│ 2. Question: Is the onboarding keeping players?                      │
│    Primary: D1 (> 30%) | Supporting: Tutorial Completion (> 80%)       │
│    Fail-action: Remove text popups, make level 1-3 winnable in 30s    │
├────────────────────────────────────────────────────────────────────────┤
│ 3. Guardrail: Stop-loss budget cap                                     │
│    Rule: Pause campaign immediately if spend reaches $50 and         │
│          installs < 50 (CPI ceiling target: $1.00)                     │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu Metric decision map hoàn chỉnh dạng bảng mà học viên cần điền:

| Câu hỏi kiểm chứng | Chỉ số chính (Primary) | Chỉ số phụ trợ (Supporting) | Ngưỡng mục tiêu giả định | Hành động sửa đổi khi gãy số |
| :--- | :---: | :---: | :---: | :--- |
| **Ad hook có hút click?** | CTR | IPM | CTR > 2.2% | Thay đổi màu sắc của khối puzzle trong ad. |
| **Store listing thuyết phục?** | Store CVR | Click-to-Install | CVR > 25% | Thay thế ảnh store bằng visual combo rõ ràng. |
| **Onboarding giữ chân tốt?** | D1 Retention | Tutorial Complete | D1 > 32% | Đơn giản hóa bảng xếp hạng tân thủ. |
| **Quy tắc cắt lỗ (Stop-loss)** | Tổng ngân sách | Số install tối thiểu | Lỗ tối đa $50 | Tắt campaign ngay lập tức để bảo vệ ngân sách. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh bản đồ quyết định số liệu cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Metric Quality Chain Check)** dưới đây để tự duyệt:
    *   *Cặp chỉ số*: Mọi chỉ số chính (Primary) đã được ghép cặp với ít nhất một chỉ số phụ trợ (Supporting) để chẩn đoán chưa? (Đạt/Không)
    *   *Khoảng số liệu*: Các con số mục tiêu đã được tùy chỉnh tương thích với thể loại game puzzle của bạn chưa (tránh copy rập khuôn)? (Đạt/Không)
    *   *Ngưỡng cắt lỗ*: Bạn đã ghi rõ mốc ngân sách tối đa và số install tối thiểu để tự động tắt campaign chưa? (Đạt/Không)
    *   *Kịch bản hành động*: Hành động sửa đổi đã gắn trực tiếp vào sự gãy đổ của từng chỉ số cụ thể chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **metrics** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Acquisition Primary target: [Ngưỡng CTR mong muốn]
- Acquisition Supporting target: [Ngưỡng IPM/CVR mong muốn]
- Retention Primary target: [Ngưỡng D1 mong muốn]
- Retention Supporting target: [Ngưỡng Tutorial Complete mong muốn]
- Monetization Target (nếu có): [Ngưỡng ARPDAU/ROAS mong muốn]
- Stop-loss Rule: [Chi tiết quy tắc tự động dừng campaign]
- Post-fail Action Plan: [Kịch bản hành động tương ứng khi gãy số]
```

---

## Checklist Focus

*   [ ] Thiết lập đầy đủ các cặp chỉ số chính và phụ trợ cho 3 tầng phễu (Acquisition, Retention, Monetization).
*   [ ] Xác định rõ ngưỡng số mục tiêu riêng cho game của bạn dưới dạng khoảng quyết định.
*   [ ] Đã hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Metric Quality Chain Check).
*   [ ] Cập nhật trường metrics vào Final UA Plan.

---

## Curated References

*   [The Game Analytics Masterclass trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass)
*   Tài liệu đo lường chỉ số Cohort Retention của Firebase Analytics.
