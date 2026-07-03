---
day: 1
title: "UA as a product learning loop"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
artifact: "UA learning loop map"
---

## 🎯 Mục tiêu / Goal

Sau bài này, bạn tạo được **UA learning loop map**: sơ đồ liên kết giữa góc quảng cáo (Ad hook), trang cửa hàng (Store) và trải nghiệm chơi game (Game loop). Sơ đồ này giúp bạn kiểm chứng các giả thuyết sản phẩm trước khi chi tiêu ngân sách lớn.

**Kết quả đạt được:**
- 💡 Định nghĩa UA như một vòng phản hồi của sản phẩm (product feedback loop) thay vì một hoạt động marketing độc lập.
- 🔗 Thiết lập chuỗi "Lời hứa - Chứng minh - Thực thi" (UA Promise Chain) cho tựa game puzzle của bạn.
- 📊 Nhận diện điểm gãy phễu chuyển đổi thông qua việc đối chiếu chéo số liệu.
- 📝 Cập nhật giả thuyết game (game hypothesis) đầu tiên vào Final UA Plan.

---

## 🚀 Why this matters

Hầu hết các nhà phát triển game indie Unity thường coi User Acquisition (UA) là một công đoạn độc lập được "gắn thêm" vào game sau khi dự án đã hoàn thành. Quy trình thông thường sẽ là: 

$$\text{Thiết kế game} \rightarrow \text{Viết code 6 tháng} \rightarrow \text{Đưa lên store} \rightarrow \text{Chạy ads tìm install}$$

> [!CAUTION]
> Đây là con đường nhanh nhất dẫn tới sự thất bại của các dự án indie có ngân sách hạn hẹp từ $100 - $500.

Trong môi trường mobile hiện đại, **UA chính là sản phẩm và sản phẩm chính là UA**. Bạn không thể sửa đổi game hiệu quả nếu không biết người dùng tải game về vì kỳ vọng điều gì. Ngược lại, bạn cũng không thể chạy ads giá rẻ nếu gameplay không thực thi đúng lời hứa của video quảng cáo. 

Bằng cách coi UA là một vòng lặp học hỏi (learning loop) ngay từ giai đoạn prototype, bạn có thể kiểm chứng xem thị trường có thực sự quan tâm đến ý tưởng game của bạn hay không trước khi tốn hàng trăm giờ code.

---

## 💎 Core model: Chuỗi lời hứa & thực thi UA (The UA Promise Chain)

Vòng lặp học hỏi UA được xây dựng dựa trên sự liên kết chặt chẽ của 3 yếu tố:

$$\text{Ad Creative (Lời hứa)} \xrightarrow{\text{Store Listing (Chứng minh)}} \text{First Session (Thực thi)}$$

*   **📺 Ad Creative (Lời hứa / Promise):** Video quảng cáo thiết lập một kỳ vọng trong tâm trí người dùng (ví dụ: *"Đây là một game xếp hình thư giãn nhẹ nhàng, nổ combo rực rỡ"*).
*   **🏪 Store Listing (Chứng minh / Proof):** Ảnh chụp màn hình và video trên Google Play/App Store củng cố kỳ vọng đó (ví dụ: *"Ảnh store phơi bày các khối gỗ đẹp mắt và giao diện trực quan"*).
*   **🎮 First Session (Thực thi / Delivery):** 3 phút chơi game đầu tiên thực thi trọn vẹn lời hứa (ví dụ: *"Level 1 cực dễ, xếp 3 khối gỗ ăn điểm ngay lập tức trong 10 giây"*).

> [!WARNING]
> Nếu bất kỳ mắt xích nào trong chuỗi này bị lệch nhịp (mismatch), người dùng sẽ thoát ra ngay lập tức, dẫn tới chỉ số cài đặt (CPI) tăng vọt và tỷ lệ giữ chân Day 1 (D1 Retention) sụp đổ.

---

## 🗺️ Khung Bản đồ Vòng lặp Học hỏi (Main framework/map mẫu)

Bảng dưới đây so sánh sự khác biệt giữa một phễu bị lệch nhịp (Mismatch Funnel) và một phễu hợp nhất (Aligned Funnel):

| Thành phần phễu | 🔴 Phễu lệch nhịp (Mismatch Funnel) | 🟢 Phễu hợp nhất (Aligned Funnel) | 📊 Tác động lên Metric |
| :--- | :--- | :--- | :--- |
| **📺 Ad hook (Lời hứa)** | Dùng video rút chốt giật gân (clickbait) để câu click giá rẻ. | Dùng cảnh xếp hình combo gỗ thực tế trong game được tăng tốc visual. | **CTR**: Phễu lệch nhịp có CTR rất cao, phễu hợp nhất có CTR vừa phải. |
| **🏪 Store (Chứng minh)** | Hiển thị ảnh chụp màn hình game xếp gỗ lục giác đơn điệu. | Hiển thị ảnh combo nổ gỗ rực rỡ đồng bộ tông màu với ad. | **Store CVR**: Phễu lệch nhịp có CVR sụt giảm mạnh, phễu hợp nhất có CVR cao. |
| **🎮 First Session (Thực thi)**| Bắt làm tutorial dài 2 phút, giải thích luật chơi bằng chữ tiếng Anh phức tạp. | Cho kéo thả 1 khối gỗ siêu dễ, nổ combo ăn điểm ngay trong 5 giây đầu. | **D1 Retention**: Phễu lệch nhịp rụng sạch user, phễu hợp nhất giữ chân ổn định. |

---

## 🎨 Sơ đồ Chuỗi Lời hứa UA (Hero visual or operating diagram)

Sơ đồ dưới đây minh họa dòng chảy của Chuỗi Lời hứa UA và cách hệ thống đo lường phản ánh điểm rò rỉ:

![The UA Promise Chain Diagram](content/assets/usecases/day-01-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Chuỗi Lời hứa UA (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát tiến trình 4 bước từ trái sang phải. Các đường kết nối giữa Ad hook, Store Proof và First Session.
> *   **Kết luận rút ra (Conclude)**: Sự thành bại của chiến dịch UA nằm ở tính nhất quán của thông điệp xuyên suốt. Nếu có sự đứt gãy giữa Ad và Store, Store CVR sẽ báo đỏ; nếu đứt gãy giữa Store và First Session, D1 Retention sẽ báo đỏ.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn bắt buộc phải có đồ họa 3D lộng lẫy mới làm được ad. Một ad thô sơ nhưng đồng bộ đúng gameplay thật vẫn mang lại phễu hợp nhất có hiệu quả kinh tế cao hơn ad bóng bẩy nhưng sai lệch.

---

## 📊 Biểu đồ so sánh Phễu Mismatch vs Funnel Align

Biểu đồ dưới đây đối chiếu hiệu năng kinh tế tổng thể giữa hai kịch bản phễu:

![Funnel alignment comparison chart](content/assets/usecases/day-01-data-visual.png)

:::chart
title: Hiệu suất phễu tích lũy dự kiến (Target Score, cao là tốt)
Clickbait Funnel|12|High CTR but CVR and D1 Retention collapse due to mismatch
Aligned Funnel|45|Moderate CTR but high CVR and D1 Retention optimize total cost
:::

*Cách đọc chart:* Hãy tập trung tối ưu hóa **tổng điểm phễu tích lũy** thay vì chỉ chạy theo chỉ số click đầu vào (CTR). Một phễu hợp nhất (Aligned Funnel) mang lại hiệu quả kinh tế dài hạn tốt hơn gấp nhiều lần nhờ bảo vệ được tỷ lệ giữ chân người chơi thực tế.

---

## 🔍 Hướng dẫn đọc số và chẩn đoán phễu rò rỉ

Hãy áp dụng bảng chẩn đoán 4 cột dưới đây để xác định mắt xích yếu nhất trong chiến dịch đầu tiên của bạn:

| Pattern số liệu | 🔴 Điểm gãy phễu (Weakest Link) | 🛠️ Hành động ĐÚNG (Next Action) | ❌ Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR = 4.8%** (Cao)<br>**Store CVR = 7%** (Thảm hại) | **Ad-to-Store Mismatch**: Quảng cáo hứa hẹn điều mà cửa hàng không xác nhận. | Thay ảnh store screenshot hoặc sửa video ad để hiển thị đúng gameplay thật. | Đổ thêm tiền chạy ad vì thấy giá click (CPC) rẻ. |
| **CTR = 2.2%** (Ổn)<br>**Store CVR = 26%** (Đạt)<br>**D1 Retention = 9%** (Sụp đổ) | **Store-to-Game Mismatch**: Onboarding hoặc độ khó phiên chơi đầu tiên không đáp ứng đúng kỳ vọng store. | Rút ngắn màn hướng dẫn (tutorial), làm Level 1-3 siêu dễ để user cảm nhận Core Loop nhanh. | Đổi ad network hoặc tắt campaign quảng cáo vì nghĩ traffic kém chất lượng. |
| **CTR = 0.6%** (Thấp)<br>**Store CVR = 28%** (Tốt) | **Weak Creative Hook**: Video quảng cáo quá tẻ nhạt, không tạo được sự chú ý trong 3 giây đầu. | Thay đổi 3 giây đầu tiên của video ad (thêm visual combo, tăng nhịp độ puzzle). | Tiến hành sửa đổi code gameplay của game. |

---

## 📝 Worked example: Calming Hex Puzzle

Một nhà phát triển Unity chạy chiến dịch thử nghiệm hẹp $100 cho tựa game xếp hình lục giác Calming Hex Puzzle. Họ thiết lập giả thuyết ban đầu: *"Người chơi casual muốn nghỉ não nhanh (Motivation) sẽ tải game xếp hình lục giác (Player) khi xem ad gameplay nổ combo 10 giây (Promise) và được chơi ngay bàn chơi dễ trong 15 giây đầu (Proof)."*

**Kết quả thu thập thực tế:**
- Video ad đạt CTR = `3.5%` (*Đạt kỳ vọng*).
- Store CVR chỉ đạt `9%` (*Thất bại nặng nề, ngưỡng kỳ vọng là >22%*).
- D1 Retention của tệp cài đặt ít ỏi này chỉ đạt `8%`.

**Phân tích chẩn đoán & Quyết định (Verdict):**
*   Mặc dù CTR quảng cáo khá cao (3.5%), nhưng Store CVR cực thấp chứng tỏ có sự đứt gãy lớn ở khâu chuyển tiếp từ ad sang store.
*   Khi kiểm tra thiết kế: Video quảng cáo hiển thị cảnh ghép các khối lục giác gỗ màu sắc rực rỡ với hiệu ứng nổ tung thỏa mãn (Satisfying Blast). Tuy nhiên, ảnh store screenshots lại hiển thị giao diện game màu xám tối tăm, thô sơ với các dòng chữ hướng dẫn phức tạp. Người dùng click vào store lập tức cảm thấy game không giống như ad quảng cáo và thoát ra.
*   **Hành động quyết định:** Tạm dừng chiến dịch quảng cáo. Thay đổi toàn bộ 3 ảnh store screenshots đầu tiên bằng hình ảnh board state màu sắc rực rỡ đồng bộ 100% với video ad. Cập nhật store listing và bật lại ad test hẹp với ngân sách còn lại để kiểm chứng lại CVR.

---

## 🛠️ Checklist kỹ thuật thiết lập học hỏi (Implementation checklist)

Đảm bảo các cấu hình này hoạt động chính xác để không làm hỏng vòng lặp học hỏi:

| Hạng mục kiểm tra | 🟢 Trạng thái cần có | ⚠️ Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Hypothesis validation** | Mỗi đợt test ad bắt buộc phải ghi rõ 1 câu hỏi kiểm chứng cụ thể (ví dụ: *"Tệp user có thích hook nổ gỗ này không?"*). | Chạy ad vô định hướng, tiêu hết tiền thu về đống số hỗn độn không thể kết luận. |
| **2. Visual Asset Sync** | Màu sắc chủ đạo và font chữ của video quảng cáo trùng khớp với ảnh store screenshots. | Người dùng bị lệch tông tâm lý khi chuyển trang, làm giảm Store CVR. |
| **3. Analytics integration** | Đã test thử trên editor và nhận diện đúng sự kiện mở app lần đầu (`first_open`). | Chạy ad thật nhưng dashboard analytics trống trơn do lỗi tích hợp SDK. |

---

## 📖 Real usecases đã đối chiếu nguồn

### Case Study: Giai đoạn tiền khả thi (Pre-production validation) của Merge Mansion

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Metacore (nhà phát triển Merge Mansion) đã chạy các chiến dịch ad thử nghiệm ý tưởng từ rất sớm khi game chỉ mới có vài màn chơi prototype thô để đo lường CPI và mức độ quan tâm của người dùng. Nguồn: [Early Production của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) | UA không phải là hoạt động cuối phễu sau khi hoàn thiện game. Nó là công cụ nghiên cứu khả thi (marketability test) để quyết định có nên tiếp tục đầu tư sản xuất ý tưởng game đó hay không. | Không suy ra rằng game indie của bạn cũng phải chạy test ý tưởng khi chưa viết dòng code nào, vì việc này đòi hỏi khả năng làm mockup ad chất lượng cao. |

---

## ⚠️ Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Chạy ad không có giả thuyết sản phẩm cụ thể**
    *   *Correction:* Trước khi nạp tiền chạy ad, hãy viết rõ câu giả thuyết: *"Tôi đang test góc ad A để kiểm chứng mức độ quan tâm của tệp người dùng thích giải đố thư giãn"*.
*   **Mistake 2: Đánh giá chất lượng game dựa trên CTR quảng cáo**
    *   *Correction:* CTR cao chỉ chứng minh video quảng cáo gây chú ý, không chứng minh game hay. Phải đối chiếu chéo với Store CVR và D1 Retention để đánh giá toàn diện chuỗi lời hứa.
*   **Mistake 3: Đổ tiền mua install khi onboarding game đang bị crash**
    *   *Correction:* Luôn test nội bộ bản build trên ít nhất 3 thiết bị cấu hình trung bình khác nhau để đảm bảo game không bị lỗi đứng màn hình loading trước khi bật quảng cáo.

---

## 📖 English Terms You Should Keep

*   **UA**: User Acquisition (Hoạt động thu hút người dùng/người chơi mới cài đặt game).
*   **Funnel**: Phễu chuyển đổi (các bước hành trình của người chơi từ khi thấy ad đến khi chơi game).
*   **CPI**: Cost Per Install (Chi phí quảng cáo trung bình để thu được một lượt cài đặt game).
*   **CTR**: Click-Through Rate (Tỷ lệ người xem click vào quảng cáo).
*   **CVR**: Conversion Rate (Tỷ lệ chuyển đổi người click store thành người cài đặt).

---

## 📋 Lab output example (Mẫu kết quả thực hành)

### Xem trước Bản đồ Vòng lặp Học hỏi (UA Learning Loop Map Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                         UA LEARNING LOOP MAP                           │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Hypothesis: Relaxing puzzle players will install wood sorting game  │
│ 2. Ad Hook (Promise): "Satisfying wood block slide with ASMR sound"    │
│ 3. Store Page (Proof): 3 Screenshots showcasing wood textures & blast  │
│ 4. First Session (Delivery): Level 1 solvable in 3 taps, no text tutorial│
│ 5. Primary Metric: Day 1 Retention (Target: >30%)                      │
│ 6. Weakest Link Hypothesized: Store CVR due to gray asset icons        │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu UA learning loop map hoàn chỉnh dạng bảng mà học viên cần điền:

| Thành phần vòng lặp | Thiết lập cụ thể cho game của bạn | Chỉ số kiểm chứng chính | Hành động chỉnh sửa khi gãy số |
| :--- | :--- | :---: | :--- |
| **Giả thuyết cốt lõi** | Người chơi thích đố mẹo (Motivation) sẽ tải game xếp lục giác. | LTV > CPI | Thay đổi tệp đối tượng hoặc cấu trúc core loop. |
| **Ad hook (Lời hứa)** | Video gameplay giải nhanh 1 bàn chơi hóc búa trong 10s. | CTR | Thay thế intro 3s đầu bằng hiệu ứng bắt mắt hơn. |
| **Store (Chứng minh)** | Ảnh screenshots hiển thị bảng màu neon và các khối lục giác rõ ràng. | Store CVR | Đồng bộ tông màu của store screenshots với video ad. |
| **First Session (Thực thi)** | Cho chơi ngay bàn chơi dễ tương tự ad, bỏ bảng hội thoại tutorial. | D1 Retention | Tối giản hóa tutorial, giảm độ khó của level 1-3. |

---

## 📋 Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh bản đồ vòng lặp học hỏi UA cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (UA Loop Quality Chain Check)** dưới đây để tự duyệt:
    *   *Tính nhất quang của lời hứa:* Ad hook và Store screenshots của bạn có hiển thị cùng một phong cách nghệ thuật (art style) và cơ chế gameplay không? (Đạt/Không)
    *   *Tính hành động của metric:* Bạn đã xác định rõ hành động kỹ thuật cụ thể nào cần làm nếu D1 retention dưới ngưỡng mong muốn chưa? (Đạt/Không)
    *   *Đo lường đầu cuối:* Hệ thống analytics của bạn đã ghi nhận chính xác 2 mốc sự kiện đầu cuối `first_open` và `level_complete` chưa? (Đạt/Không)
    *   *Ngăn chặn clickbait:* Ad creative của bạn có hiển thị gameplay thực tế (dù đã được edit tốc độ) thay vì sử dụng fake gameplay không? (Đạt/Không)

---

## 📝 Final UA Plan Update

Cập nhật trường **game_hypothesis** và **funnel_alignment** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Core Hypothesis: [Viết 1 câu giả thuyết: Tệp người chơi, Động cơ, Lời hứa ad và Chứng minh store]
- Ad Promise description: [Mô tả video ad hook dự kiến chạy]
- Store Proof alignment: [Cách đồng bộ ảnh store screenshots với ad]
- Onboarding Delivery plan: [Trải nghiệm 3 phút đầu tiên để thực thi ad promise]
```

---

## 📋 Checklist Focus

*   [ ] Thiết lập câu giả thuyết sản phẩm hoàn chỉnh cho tựa game puzzle của bạn.
*   [ ] Xác định rõ ad promise và kế hoạch đồng bộ hóa store listing tương ứng.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (UA Loop Quality Chain Check).
*   [ ] Cập nhật trường game_hypothesis và funnel_alignment vào Final UA Plan.

---

## 📚 Curated References

*   [Early Production và Chiến lược UA của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion)
*   Tài liệu hướng dẫn thiết lập A/B Testing Store Listing trên Google Play Console.
