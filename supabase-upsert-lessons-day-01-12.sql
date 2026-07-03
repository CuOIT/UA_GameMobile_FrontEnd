-- Upsert markdown content for day 01-12 into Supabase.
-- Source: D:/ua-marketing-platform/frontend/content/lessons
-- Generated: 2026-07-03T15:10:02.3346584+07:00

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
  ('lessons/day-01.md', 'markdown', null, '---
day: 1
title: "UA as a product learning loop"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
artifact: "UA learning loop map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **UA learning loop map**: sơ đồ liên kết giữa góc quảng cáo (Ad hook), trang cửa hàng (Store) và trải nghiệm chơi game (Game loop). Sơ đồ này giúp bạn kiểm chứng các giả thuyết sản phẩm trước khi chi tiêu ngân sách lớn.

Kết quả đạt được:
- Định nghĩa UA như một vòng phản hồi của sản phẩm (product feedback loop) thay vì một hoạt động marketing độc lập.
- Thiết lập chuỗi "Lời hứa - Chứng minh - Thực thi" (UA Promise Chain) cho tựa game puzzle của bạn.
- Nhận diện điểm gãy phễu chuyển đổi thông qua việc đối chiếu chéo số liệu.
- Cập nhật giả thuyết game (game hypothesis) đầu tiên vào Final UA Plan.

---

## Why this matters

Hầu hết các nhà phát triển game indie Unity thường coi User Acquisition (UA) là một công đoạn độc lập được "gắn thêm" vào game sau khi dự án đã hoàn thành. Quy trình thông thường sẽ là: Thiết kế game $\rightarrow$ Viết code 6 tháng $\rightarrow$ Đưa lên store $\rightarrow$ Thuê ngoài hoặc tự chạy quảng cáo để tìm kiếm lượt cài đặt. 

Đây là con đường nhanh nhất dẫn tới sự thất bại của các dự án indie có ngân sách hạn hẹp từ $100 - $500.

Trong môi trường mobile hiện đại, **UA chính là sản phẩm và sản phẩm chính là UA**. Bạn không thể sửa đổi game hiệu quả nếu không biết người dùng tải game về vì kỳ vọng điều gì. Ngược lại, bạn cũng không thể chạy ads giá rẻ nếu gameplay không thực thi đúng lời hứa của video quảng cáo. Bằng cách coi UA là một vòng lặp học hỏi (learning loop) ngay từ giai đoạn prototype, bạn có thể kiểm chứng xem thị trường có thực sự quan tâm đến ý tưởng game của bạn hay không trước khi tốn hàng trăm giờ code.

---

## Core model: Chuỗi lời hứa & thực thi UA (The UA Promise Chain)

Vòng lặp học hỏi UA được xây dựng dựa trên sự liên kết chặt chẽ của 3 yếu tố:

$$\text{Ad Creative (Lời hứa)} \xrightarrow{\text{Store Listing (Chứng minh)}} \text{First Session (Thực thi)}$$

*   **Ad Creative (Lời hứa / Promise)**: Video quảng cáo thiết lập một kỳ vọng trong tâm trí người dùng (ví dụ: *"Đây là một game xếp hình thư giãn nhẹ nhàng, nổ combo rực rỡ"*).
*   **Store Listing (Chứng minh / Proof)**: Ảnh chụp màn hình và video trên Google Play/App Store củng cố kỳ vọng đó (ví dụ: *"Ảnh store phơi bày các khối gỗ đẹp mắt và giao diện trực quan"*).
*   **First Session (Thực thi / Delivery)**: 3 phút chơi game đầu tiên thực thi trọn vẹn lời hứa (ví dụ: *"Level 1 cực dễ, xếp 3 khối gỗ ăn điểm ngay lập tức trong 10 giây"*).

Nếu bất kỳ mắt xích nào trong chuỗi này bị lệch nhịp (mismatch), người dùng sẽ thoát ra ngay lập tức, dẫn tới chỉ số cài đặt (CPI) tăng vọt và tỷ lệ giữ chân Day 1 (D1 Retention) sụp đổ.

---

## Khung Bản đồ Vòng lặp Học hỏi (Main framework/map mẫu)

Bảng dưới đây so sánh sự khác biệt giữa một phễu bị lệch nhịp (Mismatch Funnel) và một phễu hợp nhất (Aligned Funnel):

| Thành phần phễu | Phễu lệch nhịp (Mismatch Funnel) | Phễu hợp nhất (Aligned Funnel) | Tác động lên Metric |
| :--- | :--- | :--- | :--- |
| **Ad hook (Lời hứa)** | Dùng video rút chốt giật gân (clickbait) để câu click giá rẻ. | Dùng cảnh xếp hình combo gỗ thực tế trong game được tăng tốc visual. | **CTR**: Phễu lệch nhịp có CTR rất cao, phễu hợp nhất có CTR vừa phải. |
| **Store (Chứng minh)** | Hiển thị ảnh chụp màn hình game xếp gỗ lục giác đơn điệu. | Hiển thị ảnh combo nổ gỗ rực rỡ đồng bộ tông màu với ad. | **Store CVR**: Phễu lệch nhịp có CVR sụt giảm mạnh, phễu hợp nhất có CVR cao. |
| **First Session (Thực thi)**| Bắt làm tutorial dài 2 phút, giải thích luật chơi bằng chữ tiếng Anh phức tạp. | Cho kéo thả 1 khối gỗ siêu dễ, nổ combo ăn điểm ngay trong 5 giây đầu. | **D1 Retention**: Phễu lệch nhịp rụng sạch user, phễu hợp nhất giữ chân ổn định. |

---

## Sơ đồ Chuỗi Lời hứa UA (Hero visual or operating diagram)

Sơ đồ dưới đây minh họa dòng chảy của Chuỗi Lời hứa UA và cách hệ thống đo lường phản ánh điểm rò rỉ:

![The UA Promise Chain Diagram](content/assets/usecases/day-01-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Chuỗi Lời hứa UA (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát tiến trình 4 bước từ trái sang phải. Các đường kết nối giữa Ad hook, Store Proof và First Session.
> *   **Kết luận rút ra (Conclude)**: Sự thành bại của chiến dịch UA nằm ở tính nhất quán của thông điệp xuyên suốt. Nếu có sự đứt gãy giữa Ad và Store, Store CVR sẽ báo đỏ; nếu đứt gãy giữa Store và First Session, D1 Retention sẽ báo đỏ.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn bắt buộc phải có đồ họa 3D lộng lẫy mới làm được ad. Một ad thô sơ nhưng đồng bộ đúng gameplay thật vẫn mang lại phễu hợp nhất có hiệu quả kinh tế cao hơn ad bóng bẩy nhưng sai lệch.

---

## Biểu đồ so sánh Phễu Mismatch vs Funnel Align (Chart/visual/table)

Biểu đồ dưới đây đối chiếu hiệu năng kinh tế tổng thể giữa hai kịch bản phễu:

![Funnel alignment comparison chart](content/assets/usecases/day-01-data-visual.png)

:::chart
title: Hiệu suất phễu tích lũy dự kiến (Target Score, cao là tốt)
Clickbait Funnel|12|High CTR but CVR and D1 Retention collapse due to mismatch
Aligned Funnel|45|Moderate CTR but high CVR and D1 Retention optimize total cost
:::

*Cách đọc chart*: Hãy tập trung tối ưu hóa **tổng điểm phễu tích lũy** thay vì chỉ chạy theo chỉ số click đầu vào (CTR). Một phễu hợp nhất (Aligned Funnel) mang lại hiệu quả kinh tế dài hạn tốt hơn gấp nhiều lần nhờ bảo vệ được tỷ lệ giữ chân người chơi thực tế.

---

## Hướng dẫn đọc số và chẩn đoán phễu rò rỉ

Hãy áp dụng bảng chẩn đoán 4 cột dưới đây để xác định mắt xích yếu nhất trong chiến dịch đầu tiên của bạn:

| Pattern số liệu | Điểm gãy phễu (Weakest Link) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR = 4.8%** (Cao)<br>**Store CVR = 7%** (Thảm hại) | **Ad-to-Store Mismatch**: Quảng cáo hứa hẹn điều mà cửa hàng không xác nhận. | Thay ảnh store screenshot hoặc sửa video ad để hiển thị đúng gameplay thật. | Đổ thêm tiền chạy ad vì thấy giá click (CPC) rẻ. |
| **CTR = 2.2%** (Ổn)<br>**Store CVR = 26%** (Đạt)<br>**D1 Retention = 9%** (Sụp đổ) | **Store-to-Game Mismatch**: Onboarding hoặc độ khó phiên chơi đầu tiên không đáp ứng đúng kỳ vọng store. | Rút ngắn màn hướng dẫn (tutorial), làm Level 1-3 siêu dễ để user cảm nhận Core Loop nhanh. | Đổi ad network hoặc tắt campaign quảng cáo vì nghĩ traffic kém chất lượng. |
| **CTR = 0.6%** (Thấp)<br>**Store CVR = 28%** (Tốt) | **Weak Creative Hook**: Video quảng cáo quá tẻ nhạt, không tạo được sự chú ý trong 3 giây đầu. | Thay đổi 3 giây đầu tiên của video ad (thêm visual combo, tăng nhịp độ puzzle). | Tiến hành sửa đổi code gameplay của game. |

---

## Worked example: Calming Hex Puzzle

Một nhà phát triển Unity chạy chiến dịch thử nghiệm hẹp $100 cho tựa game xếp hình lục giác Calming Hex Puzzle. Họ thiết lập giả thuyết ban đầu: *"Người chơi casual muốn nghỉ não nhanh (Motivation) sẽ tải game xếp hình lục giác (Player) khi xem ad gameplay nổ combo 10 giây (Promise) và được chơi ngay bàn chơi dễ trong 15 giây đầu (Proof)."*

**Kết quả thu thập thực tế**:
- Video ad đạt CTR = `3.5%` (*Đạt kỳ vọng*).
- Store CVR chỉ đạt `9%` (*Thất bại nặng nề, ngưỡng kỳ vọng là >22%*).
- D1 Retention của tệp cài đặt ít ỏi này chỉ đạt `8%`.

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Mặc dù CTR quảng cáo khá cao (3.5%), nhưng Store CVR cực thấp chứng tỏ có sự đứt gãy lớn ở khâu chuyển tiếp từ ad sang store.
*   Khi kiểm tra thiết kế: Video quảng cáo hiển thị cảnh ghép các khối lục giác gỗ màu sắc rực rỡ với hiệu ứng nổ tung thỏa mãn (Satisfying Blast). Tuy nhiên, ảnh store screenshots lại hiển thị giao diện game màu xám tối tăm, thô sơ với các dòng chữ hướng dẫn phức tạp. Người dùng click vào store lập tức cảm thấy game không giống như ad quảng cáo và thoát ra.
*   **Hành động quyết định**: Tạm dừng chiến dịch quảng cáo. Thay đổi toàn bộ 3 ảnh store screenshots đầu tiên bằng hình ảnh board state màu sắc rực rỡ đồng bộ 100% với video ad. Cập nhật store listing và bật lại ad test hẹp với ngân sách còn lại để kiểm chứng lại CVR.

---

## Checklist kỹ thuật thiết lập học hỏi (Implementation checklist)

Đảm bảo các cấu hình này hoạt động chính xác để không làm hỏng vòng lặp học hỏi:

| Hạng mục kiểm tra | Trạng thái cần có | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Hypothesis validation** | Mỗi đợt test ad bắt buộc phải ghi rõ 1 câu hỏi kiểm chứng cụ thể (ví dụ: *"Tệp user có thích hook nổ gỗ này không?"*). | Chạy ad vô định hướng, tiêu hết tiền thu về đống số hỗn độn không thể kết luận. |
| **2. Visual Asset Sync** | Màu sắc chủ đạo và font chữ của video quảng cáo trùng khớp với ảnh store screenshots. | Người dùng bị lệch tông tâm lý khi chuyển trang, làm giảm Store CVR. |
| **3. Analytics integration** | Đã test thử trên editor và nhận diện đúng sự kiện mở app lần đầu (`first_open`). | Chạy ad thật nhưng dashboard analytics trống trơn do lỗi tích hợp SDK. |

---

## Real usecases đã đối chiếu nguồn

### Case Study: Giai đoạn tiền khả thi (Pre-production validation) của Merge Mansion

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Metacore (nhà phát triển Merge Mansion) đã chạy các chiến dịch ad thử nghiệm ý tưởng từ rất sớm khi game chỉ mới có vài màn chơi prototype thô để đo lường CPI và mức độ quan tâm của người dùng. Nguồn: [Early Production của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) | UA không phải là hoạt động cuối phễu sau khi hoàn thiện game. Nó là công cụ nghiên cứu khả thi (marketability test) để quyết định có nên tiếp tục đầu tư sản xuất ý tưởng game đó hay không. | Không suy ra rằng game indie của bạn cũng phải chạy test ý tưởng khi chưa viết dòng code nào, vì việc này đòi hỏi khả năng làm mockup ad chất lượng cao. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Chạy ad không có giả thuyết sản phẩm cụ thể**
    *   *Correction*: Trước khi nạp tiền chạy ad, hãy viết rõ câu giả thuyết: *"Tôi đang test góc ad A để kiểm chứng mức độ quan tâm của tệp người dùng thích giải đố thư giãn"*.
*   **Mistake 2: Đánh giá chất lượng game dựa trên CTR quảng cáo**
    *   *Correction*: CTR cao chỉ chứng minh video quảng cáo gây chú ý, không chứng minh game hay. Phải đối chiếu chéo với Store CVR và D1 Retention để đánh giá toàn diện chuỗi lời hứa.
*   **Mistake 3: Đổ tiền mua install khi onboarding game đang bị crash**
    *   *Correction*: Luôn test nội bộ bản build trên ít nhất 3 thiết bị cấu hình trung bình khác nhau để đảm bảo game không bị lỗi đứng màn hình loading trước khi bật quảng cáo.

---

## English Terms You Should Keep

*   **UA**: User Acquisition (Hoạt động thu hút người dùng/người chơi mới cài đặt game).
*   **Funnel**: Phễu chuyển đổi (các bước hành trình của người chơi từ khi thấy ad đến khi chơi game).
*   **CPI**: Cost Per Install (Chi phí quảng cáo trung bình để thu được một lượt cài đặt game).
*   **CTR**: Click-Through Rate (Tỷ lệ người xem click vào quảng cáo).
*   **CVR**: Conversion Rate (Tỷ lệ chuyển đổi người click store thành người cài đặt).

---

## Lab output example (Mẫu kết quả thực hành)

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

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh bản đồ vòng lặp học hỏi UA cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (UA Loop Quality Chain Check)** dưới đây để tự duyệt:
    *   *Tính nhất quán của lời hứa*: Ad hook và Store screenshots của bạn có hiển thị cùng một phong cách nghệ thuật (art style) và cơ chế gameplay không? (Đạt/Không)
    *   *Tính hành động của metric*: Bạn đã xác định rõ hành động kỹ thuật cụ thể nào cần làm nếu D1 retention dưới ngưỡng mong muốn chưa? (Đạt/Không)
    *   *Đo lường đầu cuối*: Hệ thống analytics của bạn đã ghi nhận chính xác 2 mốc sự kiện đầu cuối `first_open` và `level_complete` chưa? (Đạt/Không)
    *   *Ngăn chặn clickbait*: Ad creative của bạn có hiển thị gameplay thực tế (dù đã được edit tốc độ) thay vì sử dụng fake gameplay không? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **game_hypothesis** và **funnel_alignment** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Core Hypothesis: [Viết 1 câu giả thuyết: Tệp người chơi, Động cơ, Lời hứa ad và Chứng minh store]
- Ad Promise description: [Mô tả video ad hook dự kiến chạy]
- Store Proof alignment: [Cách đồng bộ ảnh store screenshots với ad]
- Onboarding Delivery plan: [Trải nghiệm 3 phút đầu tiên để thực thi ad promise]
```

---

## Checklist Focus

*   [ ] Thiết lập câu giả thuyết sản phẩm hoàn chỉnh cho tựa game puzzle của bạn.
*   [ ] Xác định rõ ad promise và kế hoạch đồng bộ hóa store listing tương ứng.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (UA Loop Quality Chain Check).
*   [ ] Cập nhật trường game_hypothesis và funnel_alignment vào Final UA Plan.

---

## Curated References

*   [Early Production và Chiến lược UA của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion)
*   Tài liệu hướng dẫn thiết lập A/B Testing Store Listing trên Google Play Console.
', now()),
  ('lessons/day-02.md', 'markdown', null, '---
day: 2
title: "Puzzle market thesis and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
artifact: "Puzzle market thesis"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Puzzle market thesis**: bản lập luận thiết lập giả thuyết thị trường chi tiết cho game của bạn. Bản luận điểm này giúp bạn xác định rõ: sẽ mua ad ở đâu, hứa hẹn động cơ gì, và mô hình kinh tế nào có cơ hội hoàn vốn (pay back).

Kết quả đạt được:
- Định nghĩa phân nhóm người chơi mục tiêu (Target Player Segment) thay vì định nghĩa chung chung.
- Khớp nối động cơ cốt lõi (Motivation) của người chơi với các creative hook tương ứng.
- Thiết lập kịch bản chạy test hẹp (Initial Market) để tiết kiệm ngân sách kiểm chứng.
- Viết điều kiện thất bại (Failure Condition) rõ ràng để đưa ra quyết định dừng hay tiếp tục chạy ad.

---

## Why this matters

Nhiều nhà phát triển indie Unity thường lựa chọn làm game puzzle vì cho rằng: *"Game puzzle dễ hiểu, tập người dùng rộng, giá cài đặt (CPI) chắc chắn sẽ rẻ"*. 

Đây là một giả định vô cùng nguy hiểm. 

Mặc dù game puzzle dễ truyền tải thông điệp trong video quảng cáo, nhưng đây cũng là thể loại có mức độ cạnh tranh khốc liệt nhất trên thị trường mobile. Hàng ngàn game có phong cách đồ họa tương tự nhau cùng đấu thầu mua người dùng, khiến giá thầu quảng cáo bị đẩy lên rất cao. Nếu game của bạn có chiều sâu giữ chân (retention) kém hoặc không thiết kế chuỗi xem ad rewarded tốt, giá trị trọn đời (LTV) sẽ không bao giờ đuổi kịp chi phí mua user (CPI). Bản luận điểm thị trường (market thesis) giúp bạn định hình rõ cơ hội hoàn vốn trước khi đổ tiền chạy chiến dịch ad thật.

---

## Core model: market thesis không phải genre label

"Puzzle" chỉ là một nhãn phân loại thể loại (genre label) của cửa hàng, nó không mô tả hành vi hay mong muốn của người dùng. Một bản Puzzle market thesis đầy đủ phải bao gồm 5 thành phần cấu trúc chặt chẽ:

1.  **Player Segment (Phân nhóm người chơi)**: Ai là người chơi game của bạn? (Không viết *"Mọi người"*).
2.  **Motivation (Động cơ)**: Họ chơi vì cảm giác gì? (Mastery, Relax, Satisfying clear, hay Pride).
3.  **Promise (Lời hứa creative)**: Video ad sẽ hứa hẹn trải nghiệm gì trong 3 giây đầu?
4.  **Market context (Initial Market)**: Bạn sẽ chạy test ở khu vực nào để tối ưu chi phí học hỏi?
5.  **Monetization path (Mô hình doanh thu)**: Dòng tiền nào (Ad eCPM hay IAP) sẽ gánh chi phí ad?

---

## Puzzle market map (Bản đồ phân loại hướng đi)

Dưới đây là bản đồ phân loại 5 hướng đi điển hình của puzzle game để học viên đối chiếu:

| Puzzle angle | Động cơ người chơi (Motivation) | Creative hook tương ứng | Metric cần xem sớm | Monetization risk |
| :--- | :--- | :--- | :---: | :--- |
| **Calm daily puzzle** | Relax, tạo thói quen (routine). | "A 2-minute brain break" | D1/D7 Retention | Session ngắn, số lượng ad xem/ngày thấp. |
| **Satisfying clear** | Thỏa mãn thị giác (satisfying). | "Clear chaos in one move" | CTR, Store CVR | Click ad rất nhiều nhưng rụng nhanh ở D1. |
| **Hard challenge** | Thử thách trí tuệ, tự hào (mastery). | "Only 1% solve this" | Fail/retry rate | Rage-quit (ức chế thoát game), churn cao. |
| **Collection/meta** | Tích lũy, trang trí (progression). | "Unlock rooms & gardens" | Session length | Chi phí sản xuất nội dung quá nặng cho team nhỏ. |
| **Fast fail puzzle** | Kịch tính, thử lại nhanh (adrenaline). | "Can you beat this?" | CPI, early churn | Tệp user click ngẫu nhiên, LTV rất thấp. |

---

## Biểu đồ đánh giá mức độ tương thích thị trường (Market Fit Chart)

Biểu đồ dưới đây thể hiện điểm số đánh giá mức độ tương thích của một kịch bản giả thuyết puzzle:

:::chart
title: Đánh giá Market Fit Scorecard của giả thuyết Hexa Puzzle (Thang điểm 1-5, cao là tốt)
Audience clarity|4|Clear relaxing brain-break target
Creative clarity|5|Board clear is visual in 1 second
Production fit|3|Need many polished boards to sustain content depth
Retention path|2|Daily habit return loops are not proven yet
Monetization path|3|Rewarded ad economy needs placement optimization
:::

*Cách đọc chart*: Điểm số thấp nhất chính là nơi giả thuyết của bạn dễ bị vỡ nhất (ở đây là `Retention path` đạt 2/5). Bản đánh giá này nhắc nhở nhóm phát triển: mục tiêu của chiến dịch test đầu tiên không phải là scale ad, mà là kiểm chứng xem người chơi có quay lại game sau Ngày 1 hay không.

---

## Real usecases đã đối chiếu nguồn

### 1. Sơ đồ minh họa: Tách Genre Label khỏi Market Thesis

![Genre label vs Market thesis components](content/assets/usecases/day-02-market-thesis-visual.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ Thesis (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Cột bên trái màu đỏ thể hiện cách đặt giả thuyết sai lầm bằng nhãn thể loại chung chung (Genre Label). Cột bên phải màu xanh thể hiện cách xây dựng 5 thành phần chi tiết của Bản luận điểm thị trường (Market Thesis).
> *   **Kết luận rút ra (Conclude)**: Việc chỉ định nghĩa game là "Puzzle" thu hút tệp user quá rộng dẫn tới giá thầu đắt đỏ. Chia nhỏ thành tệp "Adults seeking brain breaks" với hook "Clear chaos" giúp tối ưu hóa CPI và đo lường được LTV.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn bắt buộc phải có một lối chơi hoàn toàn mới lạ. Bạn vẫn có thể làm gameplay xếp gỗ truyền thống, nhưng góc tiếp cận UA (creative/store) phải cực kỳ cụ thể để lọc đúng tệp user.

### 2. Case Study 1: Candy Crush Saga (King) — Định vị động cơ tiến trình

![Candy Crush Saga Play Store listing](content/assets/usecases/candy-crush.png)

> [!NOTE]
> **Hướng dẫn đọc Ảnh store của Candy Crush (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát ảnh screenshots hiển thị rõ mục tiêu màn chơi (board objective), hiệu ứng combo kẹo nổ rực rỡ và hệ thống bản đồ tiến trình (progression map).
> *   **Kết luận rút ra (Conclude)**: Candy Crush không hứa hẹn "đố khó hóc búa". Họ hứa hẹn trải nghiệm nổ combo đã mắt (Satisfying blast) và hành trình phiêu lưu vượt ải dài hạn (Progression). Mô hình IAP mua lượt đi (moves) và booster bổ trợ hoạt động tốt nhờ thiết kế fail/retry hẹp ở các level cao.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng game indie nhỏ của bạn nên sao chép hệ thống monetization này khi chưa có đủ số lượng màn chơi đồ sộ (>1000 levels) để tạo ra chiều sâu tiến trình tương đương.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Candy Crush Saga áp dụng mô hình freemium với hệ thống bán booster/lượt chơi để vượt qua các board game có độ khó tăng dần. Nguồn: [Wikipedia - Candy Crush Saga](https://en.wikipedia.org/wiki/Candy_Crush_Saga) | Mô hình doanh thu (Monetization path) phải đi liền với thiết kế độ khó của game: hệ thống bán vật phẩm/hints chỉ hoạt động khi game tạo ra thử thách (friction) hợp lý cho người chơi. | Không copy hệ thống monetization nếu game của bạn chưa có thiết kế depth/fail/retry đủ thuyết phục người chơi mở ví. |

### 3. Case Study 2: Wooden Slide (Bravestars Games) — Đa dạng hóa Portfolios

![Wooden Slide Play Store listing](content/assets/usecases/wooden-slide.png)

> [!NOTE]
> **Hướng dẫn đọc Ảnh store của Wooden Slide (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát screenshot trang cửa hàng Wooden Slide thể hiện rõ lối chơi kéo trượt khối gỗ (Block Escape) với chất liệu gỗ mộc mạc và bảng logic không gian.
> *   **Kết luận rút ra (Conclude)**: Tệp người chơi puzzle được chia thành nhiều nhánh động cơ rất khác nhau. Wooden Slide hướng tới động cơ "Calm logic" (tư duy sắp xếp không gian thư giãn), hoàn toàn khác với động cơ "Fast-paced match" của các game match-3.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng mọi game của Bravestars đều đạt thứ hạng cao chỉ nhờ đồ họa gỗ. Thành công của portfolio này đến từ việc họ chọn đúng reference game có quy mô vừa phải để tối ưu hóa chi phí sản xuất.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Portfolio của Bravestars chứa hàng chục game casual puzzle khác nhau từ kéo trượt gỗ, ốc vít đến cứu thú cưng. Nguồn: [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games) | Mỗi tựa game puzzle trong portfolio đại diện cho một giả thuyết thị trường (market thesis) riêng biệt nhắm vào các tệp động cơ người chơi khác nhau. | Không gom tất cả người chơi casual thành một tệp duy nhất; bạn phải viết bảng mô tả động cơ người chơi riêng biệt cho từng ý tưởng game. |

---

## Worked example: market thesis cho puzzle game

Một nhà phát triển Unity chạy thử nghiệm ngân sách `$120` cho tựa game block puzzle xếp gỗ nổ combo. 

*   **Giả thuyết Market Thesis ban đầu**:
    *   *Target Segment*: Adults who want a calm but satisfying 2-minute brain break.
    *   *Creative Promise*: Video ad hiển thị cảnh dọn sạch bàn chơi gỗ lộn xộn chỉ trong 1 nước đi (Satisfying clear).
    *   *Initial Market*: Android SEA/Tier-2 (với CPI mục tiêu cắt lỗ là `< $0.25`).
*   **Kết quả thực tế thu về sau 3 ngày**:
    *   Ngân sách đã tiêu: $98.
    *   Số install: 280 users.
    *   CPI thực tế: `$98 / 280 = $0.35` (*Vượt trần cắt lỗ $0.25*).
    *   D1 Retention: `38%` (*Rất cao, vượt kỳ vọng 30%*).
    *   LTD thực tế: 6.5 ngày.
    *   ARPDAU thực tế: $0.04.
    *   LTV thực tế ước tính: `6.5 ngày x $0.04 = $0.26` (*Gần tiệm cận CPI*).
*   **Phân tích chẩn đoán & Quyết định (Verdict)**:
    *   Mặc dù CPI thực tế ($0.35) đắt hơn so với mốc cắt lỗ ban đầu ($0.25), nhưng tỷ lệ giữ chân Ngày 1 cực kỳ tốt (D1 = 38%) chứng minh sản phẩm đã đạt **Genre-Product Fit** (người dùng thực sự thích chơi game).
    *   Lý do CPI cao là do video quảng cáo hiện tại chưa có intro 3 giây đầu đủ giật gân để hút click rẻ (CTR quảng cáo chỉ đạt 1.2%).
    *   **Quyết định**: Không khai tử dự án. Giữ nguyên game, tiến hành sản xuất 3 video ad mới cải tiến visual combo rực rỡ hơn ở 3 giây đầu để kéo CPI xuống mốc `$0.20`, giúp chiến dịch đạt ROAS dương.

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Định nghĩa tệp người chơi chung chung là "Puzzle audience"**
    *   *Correction*: Hãy viết rõ động cơ chơi game: *"Người lớn cần 2 phút nghỉ ngơi thư giãn đầu óc giữa giờ làm việc"* để dễ dàng định hình nội dung video quảng cáo.
*   **Mistake 2: So sánh game của mình với các tựa game top 1 thị trường**
    *   *Correction*: Hãy bỏ qua Candy Crush hay Royal Match. Hãy chọn các reference games có lượt tải từ `10k - 500k` trên store để học hỏi cấu trúc phễu thực tế phù hợp với quy mô team nhỏ.
*   **Mistake 3: Đặt chỉ số Failure Condition quá cao trong lần test đầu**
    *   *Correction*: Đừng ép buộc game phải đạt D1 Retention > 40% mới chạy tiếp. Đặt mức sàn thực tế `D1 > 20%` để lấy dữ liệu cải thiện sản phẩm, tránh khai tử game quá sớm vì kỳ vọng phi thực tế.

---

## English Terms You Should Keep

*   **Genre-market fit**: Mức độ tương thích giữa cơ chế game, tệp đối tượng và mô hình kinh doanh trên thị trường.
*   **CPI**: Cost Per Install (Chi phí mua một lượt cài đặt game).
*   **LTV**: Lifetime Value (Giá trị doanh thu trọn đời dự kiến của một người chơi).
*   **Market thesis**: Bản luận điểm giả thuyết thị trường (định vị đối tượng, lời hứa, thị trường và dòng tiền).

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Bản luận điểm Thị trường (Puzzle Market Thesis Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                         PUZZLE MARKET THESIS                           │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Segment: Adults seeking a calm 2-minute brain break                 │
│ 2. Motivation: Satisfying board clear and visual feedback              │
│ 3. Creative Hook: "Satisfying wood sorting combo with ASMR sound"      │
│ 4. Test Market: Android SEA / Tier-2 | CPI ceiling: < $0.25            │
│ 5. Monetization: Rewarded ads for hints + IAP remove ads ($0.99)       │
│ 6. Failure Condition: CPI > $0.40 OR D1 Retention < 20%                │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu Puzzle market thesis hoàn chỉnh dạng bảng mà học viên cần điền:

| Thành phần giả thuyết | Thiết lập cụ thể cho game của bạn | Lý do lựa chọn |
| :--- | :--- | :--- |
| **Target segment** | Người đi làm văn phòng cần nghỉ ngơi ngắn. | Thời gian chơi ngắn, nhu cầu xả stress cao. |
| **Động cơ (Motivation)** | Thỏa mãn thị giác khi dọn sạch bảng gỗ lộn xộn. | Phù hợp làm video ad dạng satisfing clear. |
| **Reference games** | Wooden Slide, Nuts & Bolts (quy mô 100k tải). | Cùng phân khúc đồ họa gỗ mộc mạc dễ làm. |
| **Initial market** | Android SEA (Việt Nam, Philippines). | Giá mua ad rẻ để tối ưu ngân sách test $100. |
| **Monetization path** | Quảng cáo xen kẽ + Gói mua No Ads giá $0.99. | Phù hợp với tệp casual không thích nạp nhiều. |
| **Failure condition** | CPI > $0.40 hoặc D1 Retention < 20%. | Mốc giới hạn kinh tế bắt buộc phải tắt campaign. |

---

## Practical Lab

Làm trực tiếp trên game của bạn:
1.  Chọn đúng 3 reference games có lượt tải từ 10k - 500k tương đồng với lối chơi của bạn.
2.  Điền hoàn chỉnh bản luận điểm thị trường cho game của bạn theo mẫu ở phần **Lab output example**.
3.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Market Fit Quality Chain Check)** dưới đây để tự duyệt:
    *   *Định vị động cơ*: Động cơ chơi game của bạn có được mô tả bằng một từ khóa cảm xúc cụ thể (không viết chung chung là "giải trí") không? (Đạt/Không)
    *   *Tính thực tế của đối thủ*: 3 reference games lựa chọn có cùng quy mô sản xuất với team của bạn không (loại trừ các game top 10 tỷ đô)? (Đạt/Không)
    *   *Khoảng giá test*: Khu vực chạy test (Initial Market) có mức giá CPI trung bình lịch sử tương thích với ngân sách hẹp của bạn không? (Đạt/Không)
    *   *Ngưỡng cắt lỗ*: Bạn đã xác định rõ mốc CPI trần và D1 sàn để kích hoạt lệnh dừng campaign tự động chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **Target audience** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
Target segment: [Phân nhóm đối tượng cụ thể]
Motivation: [Động cơ chơi game cốt lõi]
Reference games: [Danh sách 3 reference games cùng scope]
Initial market: [Khu vực chạy test hẹp và lý do]
Monetization fit: [Kế hoạch khai thác dòng tiền quảng cáo/IAP]
Main risk: [Rủi ro lớn nhất của giả thuyết này]
Failure condition: [Mốc metric kích hoạt dừng campaign ad]
```

---

## Checklist Focus

*   [ ] Xác định 3 đối thủ cạnh tranh cùng quy mô scope trên cửa hàng ứng dụng.
*   [ ] Thiết lập đầy đủ 5 thành phần của bản Puzzle market thesis cho game của bạn.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Market Fit Quality Chain Check).
*   [ ] Cập nhật trường Target audience vào Final UA Plan.

---

## Curated References

*   Tài liệu phân tích thị trường casual game của Deconstructor of Fun.
*   Hướng dẫn nghiên cứu từ khóa và đối thủ cạnh tranh trên App Radar / Sensor Tower.
', now()),
  ('lessons/day-03.md', 'markdown', null, '---
day: 3
title: "Audience motivation map"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [Audience, Motivation, Hook]
artifact: "Audience motivation map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Audience motivation map**: một bảng nối giữa động lực người chơi, ad hook, store proof, first-session proof và metric cần đọc để đưa vào 1-page UA / soft-launch plan.

Kết quả cần có sau bài:
- Không còn viết target audience chung chung kiểu “nam nữ 18-45 thích puzzle”.
- Chọn được 2-3 motivation chính có thể test bằng creative.
- Xác định rõ gameplay proof tương ứng cần có trong phiên chơi đầu tiên (first session).
- Biết đọc tín hiệu khi ad hook kéo click tốt nhưng game/store không giữ chân được người chơi.
- Cập nhật trường **Target audience** trong Final UA Plan bằng behavior + motivation.

---

## Why this matters

Với ngân sách nhỏ $100-500, bạn không thể để chiến dịch tự chạy ngẫu nhiên rồi đợi thuật toán quảng cáo tự dò tìm "người chơi phù hợp". Bạn cần chủ động thu hẹp đối tượng bằng cách hiểu rõ: **mỗi nhóm đối tượng là một động lực chơi cụ thể**, và động lực đó phải được chứng minh đồng bộ ở 3 điểm chạm: ad creative, store page và first session.

Nếu bạn gom tất cả người chơi vào một nhãn chung là "người thích game puzzle", bạn sẽ không thể debug được khi các chỉ số chuyển đổi bị kém: bạn không biết lỗi nằm ở video quảng cáo, hình ảnh trên store, hay do hướng dẫn chơi game bị lỗi.

---

## Core model: audience là motivation, không phải demographic

Nhân khẩu học (demographic) như độ tuổi, giới tính chỉ là các thông tin phụ. Quyết định UA tốt bắt nguồn từ việc phân tích động lực (motivation).

| Cách viết sai | Vì sao yếu | Cách viết tốt hơn |
| --- | --- | --- |
| Nữ giới 25-45 thích chơi puzzle | Định kiến rập khuôn, không chỉ ra được vì sao họ chơi. | Người đi làm văn phòng cần một khoảng nghỉ đầu óc (calm brain break) ngắn sau giờ làm việc. |
| Người chơi casual (casual gamers) | Quá rộng, không gắn với hook | Players who like satisfying board clear moments |
| Người thích game khó | Không mô tả được gameplay proof tương ứng. | Challenge seekers who want to prove they can solve a tricky level |

> [!IMPORTANT]
> **Quy tắc thực hành**: Nếu mô tả target audience của bạn không gợi ý ra được một ad hook (quảng cáo) cụ thể, điều đó nghĩa là chân dung đối tượng chưa đủ rõ để dùng trong UA plan.

---

## Motivation map mẫu cho puzzle game

Bảng dưới đây là xương sống giúp bạn liên kết từ nhu cầu người chơi đến các thiết kế quảng cáo, trang store và metric tương ứng:

| Motivation | Player wants | Ad hook | Store proof | First-session proof | Metric cần đọc |
| --- | --- | --- | --- | --- | --- |
| **Relax** | Nghỉ não ngắn, ít áp lực | “A calm 2-minute puzzle break” | Screenshot sạch, màu nhẹ, không rối rắm | Tutorial chậm rãi, màn đầu dễ hiểu | D1, session count, tutorial complete |
| **Satisfying clear** | Cảm giác dọn board đã tay | “Clear chaos in one smart move” | Before/after board, combo visual rõ | Level 1-3 có khoảnh khắc clear thỏa mãn | CTR, IPM, level depth |
| **Challenge** | Chứng minh năng lực | “Only 1% solve this” | Cảnh fail state rõ, màn chơi phức tạp | Có thử thách sớm nhưng không bất công | CTR, fail/retry rate, D1 |
| **Mastery** | Tiến bộ qua từng màn | “Can you find the perfect move?” | Bản đồ tiến trình (progression map) | Độ khó tăng dần hợp lý (skill curve) | Level depth, D3/D7 retention |
| **Collection/meta** | Mở khóa, sưu tập | “Solve to unlock the room” | Room/collection before-after | Meta reward xuất hiện sớm | Session length, ad engagement |

:::chart
title: Example motivation confidence, 1-5
Relax|4|Audience clear, product proof easy
Satisfying clear|5|Strong visual hook, easy to show in ads
Challenge|3|High CTR possible but churn risk
Mastery|2|Needs more level depth proof
Collection/meta|2|Scope may be too heavy for prototype
:::

*Cách đọc chart*: Điểm số không thể hiện động lực nào "tốt hơn", mà thể hiện độ phù hợp với năng lực sản xuất hiện tại của bạn. Với một puzzle prototype nhỏ, động lực **Satisfying clear** (5 điểm) dễ test và ít tốn tài nguyên sản xuất nội dung hơn là **Collection/meta** (chỉ 2 điểm).

---

## Hướng dẫn đọc số theo motivation

Hãy đọc các metric dựa trên lời hứa (promise) mà ad creative đã đưa ra:

| Metric pattern | Cách đọc | Next action đúng | Next action sai thường gặp |
| --- | --- | --- | --- |
| **CTR cao, CVR thấp** | Hook thu hút tốt nhưng store không chứng minh promise. | Sửa lại icon/screenshot đầu tiên trên store cho khớp với hook quảng cáo. | Thay đổi target audience ngay lập tức. |
| **CTR thấp, D1 tốt** | Gameplay thực sự hay nhưng video quảng cáo truyền tải kém. | Làm lại 3 giây đầu tiên của creative để tăng độ hút (hook). | Tăng ngân sách chiến dịch vì thấy retention tốt. |
| **CPI thấp, level depth thấp** | Quảng cáo giá rẻ nhưng không khớp với trải nghiệm chơi thật. | Kiểm tra lại onboarding, tutorial và độ khó màn chơi đầu. | Tiếp tục scale ngân sách vì thấy giá install rẻ. |

---

## Worked example: từ hook đến diagnosis (chẩn đoán phễu)

Giả sử bạn chạy thử nghiệm 2 nhóm ad creative cho cùng một game puzzle:

| Creative | Promise | CTR | Store CVR | IPM | D1 | Level depth | Diagnosis |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **A**: “Only 1% solve this” | Challenge | 4.5% (Cao) | 15% (Thấp) | **6.75** | 10% (Thấp) | Thấp | **Curiosity/Clickbait trap**: Ad kéo click tốt nhờ tò mò, nhưng store mismatch và game quá khó gây ngợp khiến CVR/D1 sụt giảm. |
| **B**: “Clear the board and relax” | Relax/Satisfying | 2.5% (Vừa) | 35% (Cao) | **8.75** | 28% (Tốt) | Tốt | **Good motivation fit**: Quảng cáo nói đúng trải nghiệm thực tế, trang store đồng bộ giúp giữ chân người chơi tốt. |

> [!NOTE]
> **Giải nghĩa chỉ số IPM (Installs per Mille)**:
> *   *Công thức*: `IPM = (Số Install / Số Impression) * 1000` hoặc tính nhanh: `IPM = CTR * CVR * 10`.
> *   *Ý nghĩa*: Số lượt cài đặt tạo ra trên 1000 lượt hiển thị quảng cáo. Chỉ số này phản ánh sức mạnh tổng hợp của cả phễu quảng cáo đầu vào (Ad + Store). Như ví dụ trên, Creative B có CTR thấp hơn nhưng nhờ CVR cao vượt trội nên IPM cuối cùng vẫn cao hơn Creative A (8.75 > 6.75), chứng minh hiệu quả quảng cáo thực tế tốt hơn.

---

## First-session proof và Unity Event Checklist

First-session proof là bằng chứng trong 1-3 phút đầu tiên cho người chơi thấy game thực sự mang lại trải nghiệm như quảng cáo đã hứa.

| Hook promise | Gameplay phải chứng minh |
| --- | --- |
| **Calm brain break** | Người chơi hiểu luật chơi nhanh (<30s), ít friction, cảm giác nhẹ nhàng. |
| **Clear chaos** | Có khoảnh khắc dọn board, hiệu ứng nổ/clear thỏa mãn xuất hiện sớm. |
| **Only 1% solve this** | Thử thách trí tuệ rõ ràng nhưng không tạo cảm giác bất công hoặc lừa dối. |

> [!TIP]
> **Checklist tên Event Unity chuẩn hóa cho First Session**:
> Cấu trúc event trong mã nguồn Unity của bạn nên sử dụng định dạng snake_case chuẩn để đồng bộ dễ dàng với các analytics SDK (Google Analytics, Firebase, AppMetrica...):
> *   `tutorial_start`: Gọi khi màn hình hướng dẫn đầu tiên xuất hiện.
> *   `tutorial_complete`: Gọi khi người chơi hoàn thành các bước hướng dẫn cơ bản.
> *   `level_start` (params: `level_id`): Gọi khi bắt đầu một màn chơi cụ thể.
> *   `level_complete` (params: `level_id`, `moves_left`): Gọi khi thắng màn chơi.
> *   `level_fail` (params: `level_id`, `cause`): Gọi khi thua cuộc (hết lượt đi/thời gian).
> *   `ad_impression` (params: `ad_type`, `placement`): Gọi khi hiển thị quảng cáo rewarded/interstitial.

---

## Real usecases đã đối chiếu nguồn

### Global case: Monopoly GO!

![Monopoly GO public screenshot](https://www.talkandroid.com/wp-content/uploads/2023/11/Monopoly-go-basics-e1701304768282-484x1024.jpeg)
*Public screenshot readout: ảnh bài viết TalkAndroid, credit Scopely, cho thấy board, dice, landmarks và UI events. Dùng để phân tích motivation map: progression, completion, social/light competition. Nguồn ảnh: [TalkAndroid Monopoly GO guide](https://www.talkandroid.com/37581-monopoly-go-beginners-guide/).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Monopoly GO! là mobile board game của Scopely, phát hành Android/iOS ngày 11/04/2023; nguồn ghi có hơn 150 triệu downloads và 5 tỷ USD revenue từ khi launch. Nguồn: [Wikipedia - Monopoly GO!](https://en.wikipedia.org/wiki/Monopoly_Go%21) | Nhãn "board game" không đủ để hiểu UA. Động lực thực sự kéo người chơi quay lại là: mong muốn hoàn thành bộ sưu tập landmarks, thăng tiến nhanh và cảm giác xã hội nhẹ (cướp tiền/tấn công nhà bạn bè). | Không tự ý suy diễn rằng game indie puzzle nhỏ có thể áp dụng các IP lớn hoặc scale ngân sách khổng lồ như Scopely. |
| Vòng lặp core loop: lắc xúc xắc, kiếm tiền, nâng cấp landmark, tham gia sự kiện giới hạn thời gian (Treasure Hunting, Bank Heist). | Motivation map phải nối hook với behavior: nếu quảng cáo hứa hẹn phần thưởng sự kiện, experience đầu tiên của người chơi phải cho họ tham gia sự kiện ngay. | Không tự ý copy hệ thống live ops phức tạp nếu team của bạn chưa có năng lực vận hành. |

**Decision rule học được**: Mô tả đối tượng mục tiêu tốt không phải "người thích board game", mà là "người thích hoàn thiện landmark, nâng cấp công trình, và chơi theo sự kiện ngắn hạn để tiến trình không bị gián đoạn".

### Vietnam case: Zego Studio

![Zego Screw Sort public Google Play screenshot](content/assets/usecases/screw-sort.png)
*Public screenshot readout: ảnh Google Play của Screw Sort 3D cho thấy object/action promise “screw sort” rất cụ thể. Dùng để map hook verb -> motivation -> first-session proof. Nguồn ảnh: [Screw Sort 3D on Google Play](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Zego Studio phát hành nhiều game sort/puzzle khác nhau như: Wool Sort, Screw Sort 3D, Color Yarn Puzzle, Tile Match 3D. Nguồn: [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Dù chung một nhà phát hành, mỗi game đánh vào một động lực khác nhau: phân loại ốc vít (organize/sort), tháo gỡ (clear chaos), sưu tập 3D (completion). | Không suy ra mọi game trong cùng một publisher catalog đều dùng chung một tệp người chơi hay chung một chiến dịch UA. |

**Decision rule học được**: Khi viết motivation map cho game puzzle của bạn, hãy ghi rõ động từ hành động cụ thể (ví dụ: "sort color hoop", "screw escape") thay vì ghi chung chung là "game giải đố".

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Dùng demographic thay cho motivation**: “Nam nữ 18-45” không giúp bạn biết phải thiết kế video quảng cáo nào, chụp ảnh store ra sao hay tối ưu màn chơi đầu tiên thế nào.
    *   *Correction*: Mô tả bằng hành vi: “Người chơi muốn giải đố nhẹ nhàng để nghỉ não nhanh trong khoảng thời gian di chuyển (commute player)”.
*   **Mistake 2: Một video quảng cáo hứa hẹn quá nhiều động lực**: Một ad vừa hứa relax, vừa hứa thử thách siêu khó, vừa hứa trang trí lâu đài sẽ làm thông điệp bị loạn.
    *   *Correction*: Mỗi ad creative chỉ tập trung làm nổi bật một motivation duy nhất. Muốn test nhiều động lực, hãy làm nhiều video riêng biệt.
*   **Mistake 3: Đọc CTR như bằng chứng duy nhất của fit**: CTR cao chỉ chứng minh video quảng cáo gây tò mò, chưa chắc người chơi phù hợp với game.
    *   *Correction*: Đọc CTR cùng với Store CVR, level depth và D1 retention.
*   **Mistake 4: Bẫy quảng cáo Clickbait quá đà**: 
    *   *Correction*: Việc làm ad giả hoàn toàn khác game thật (fake gameplay) có thể kéo CTR tăng vọt, nhưng sẽ hủy diệt Store CVR (vì người dùng nhận ra ad lừa đảo trên store) và làm tăng tỷ lệ thoát (early churn) ngay phút đầu tiên vào game. Hãy giữ ad hook và gameplay liên kết mật thiết để tối ưu hóa chỉ số IPM thực tế.

---

## Lab output example (Mẫu kết quả thực hành)

| Field | Example output |
| --- | --- |
| **Primary motivation** | Satisfying clear |
| **Target audience** | Adults who want a short, low-pressure puzzle with a clear visual payoff. |
| **Main hook** | Clear chaos in one smart move. |
| **Store proof** | First screenshot shows before/after board clear, not store/level map UI. |
| **First-session proof** | Level 1-3 create one obvious clear moment within 90 seconds. |
| **Validation pattern** | CTR/IPM acceptable, CVR not broken, level depth stronger than challenge hook. |
| **Risk** | Hook creates curiosity but not daily habit. |
| **If weak** | Test relax hook or improve early clear moment before changing market. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1. Viết ra 3-5 động lực tiềm năng (Relax, Satisfying clear, Challenge, Mastery, Collection).
2. Chấm điểm tự tin (Confidence 1-5) cho từng động lực dựa trên phiên bản game hiện tại của bạn.
3. Chọn ra 2 động lực có điểm cao nhất để lên kế hoạch làm ad creative test.
4. Với mỗi động lực đã chọn, viết rõ: ad hook, store proof tương ứng và trải nghiệm cần chứng minh trong 3 phút đầu tiên vào game.

---

## Final UA Plan Update

Cập nhật trường **Target audience** trong Final UA Plan theo mẫu:

```text
Primary motivation: [motivation chính]
Audience statement: [người chơi + nhu cầu + ngữ cảnh chơi]
Main hook: [creative promise]
Store proof: [asset nào trên store chứng minh promise]
First-session proof: [gameplay session 1 phải chứng minh gì]
Validation pattern: [metric pattern cho thấy motivation fit]
Weak signal: [metric pattern cho thấy mismatch]
```

---

## Checklist Focus

*   Viết audience bằng động lực chơi (motivation), không dùng demographic chung chung.
*   Chấm điểm confidence 1-5 cho các nhóm động lực đối với game hiện tại.
*   Gắn mỗi ad hook quảng cáo với một store proof và gameplay proof cụ thể.
*   Xây dựng metric pattern (CTR, CVR, D1, Level depth) để kiểm chứng động lực.

---

## English Terms You Should Keep

*   **Audience**: Nhóm người chơi định nghĩa bằng hành vi/nhu cầu.
*   **Motivation**: Lý do cảm xúc hoặc hành vi khiến người chơi cài đặt và chơi tiếp.
*   **Hook**: Lời hứa ngắn trong creative để thu hút sự chú ý.
*   **Store proof**: Bằng chứng trên trang cửa hàng xác nhận lời hứa từ ad.
*   **First-session proof**: Trải nghiệm thực tế trong màn chơi đầu chứng minh ad hứa đúng.
*   **IPM**: Installs per Mille (số lượt tải trên 1000 lượt hiển thị ad).

---

## Curated References

*   Bài này ưu tiên thực hành trên game của bạn. Tài liệu tham khảo tốt nhất là các trang store của đối thủ bạn đã phân tích ở Lesson 2.
', now()),
  ('lessons/day-04.md', 'markdown', null, '---
day: 4
title: "Funnel from impression to retained player"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Funnel, IPM, CVR]
artifact: "Funnel leak map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Funnel leak map**: một bản đồ chỉ ra mắt xích nào trong phễu đang rò rỉ người chơi nhiều nhất và hành động kỹ thuật/UA tương ứng để tối ưu hóa trước khi tăng ngân sách.

Kết quả cần có sau bài:
- Hiểu rõ dòng chảy người chơi từ quảng cáo đến trải nghiệm game thực tế.
- Biết đọc đúng mắt xích bị rò rỉ (leak) dựa trên số liệu thực tế.
- Nhận diện các nguyên nhân lỗi kỹ thuật Unity làm gãy phễu (như build size quá nặng, crash khởi động, lỗi SDK).
- Điền được mốc metric quyết định vào Final UA Plan.

---

## Why this matters

Quá trình mua lượt cài đặt (UA) và giữ chân người chơi là một chuỗi các sự kiện liên kết chặt chẽ. Sự thất bại của một chiến dịch marketing thường là do một mắt xích yếu duy nhất trong phễu chứ không phải toàn bộ tựa game của bạn bị từ chối. 

Nếu bạn thấy CPI (giá lượt tải) tăng cao hoặc doanh thu kém, việc tăng ngân sách hay đổi đối tượng mục tiêu một cách mù quáng là vô ích nếu bạn không biết chính xác người chơi đang rời đi ở bước nào: click quảng cáo, cài đặt từ store, mở ứng dụng lần đầu, vượt qua hướng dẫn chơi (tutorial) hay quay lại vào ngày hôm sau.

---

## Core model: Phễu chuyển đổi toàn diện (Funnel Leak Map)

Dưới đây là sơ đồ dòng chảy người chơi tiêu chuẩn cùng với các tỷ lệ quyết định cho tựa game puzzle mobile:

| Mắt xích (Link) | Metric chính | Khoảng tối ưu (Decision Range) | Cách đo tối thiểu | Nguyên nhân nếu chỉ số kém |
| :--- | :--- | :---: | :--- | :--- |
| **Impression -> Click** | CTR (Click-Through Rate) | `1.8% - 3.0%` hoặc IPM `> 8` | Ad network dashboard | Video quảng cáo không hút mắt, thiếu visual hook trong 3s đầu. |
| **Click -> Install** | Store CVR (Conversion Rate) | `22% - 32%` | Store Console / Attribution | Trang store không đồng nhất với ad, ảnh chụp màn hình rối rắm. |
| **Install -> First Open** | First Open Rate | `> 90%` | Install vs `first_open` event | **Lỗi kỹ thuật**: Dung lượng build Unity quá nặng, crash lúc tải, lỗi SDK. |
| **First Open -> Tutorial** | Tutorial Complete Rate | `> 65%` | Event `tutorial_complete` | Tutorial quá dài dòng, thiếu win state sớm, cơ chế kéo thả gây khó hiểu. |
| **Tutorial -> D1 Return** | D1 Retention | `25% - 40%` | Cohort Analysis | Người chơi thỏa mãn nhất thời nhưng game không tạo được thói quen chơi hàng ngày. |

:::chart
title: Sơ đồ rò rỉ phễu mẫu (1000 Impressions)
Impressions|1000|Lượt hiển thị quảng cáo
Clicks|25|CTR 2.5%
Installs|7|Store CVR 28%
First Open|6.3|First Open Rate 90%
Tutorial Complete|4.1|Tutorial Complete 65%
D1 Return|1.2|D1 Retention 30%
:::

*Cách đọc biểu đồ*: Càng xuống dưới, lượng người chơi càng giảm. Điểm rụng sâu nhất (ví dụ từ Click sang Install chỉ đạt 28%) là điểm rò rỉ cần ưu tiên sửa trước, thay vì cố gắng cải thiện video quảng cáo để kéo thêm lượt nhấp chuột.

---

## Làm sâu kỹ thuật: Tại sao tải game nhưng không mở?

Một rò rỉ phổ biến nhưng hay bị các nhà phát triển Unity bỏ qua là khoảng từ **Install** (Cài đặt) sang **First Open** (Mở lần đầu). Nếu tỷ lệ này dưới `90%`, hãy kiểm tra ngay:
1.  **Dung lượng tệp cài đặt (Build Size)**: Lập trình viên Unity thường quên tối ưu hóa Asset, làm dung lượng file `.apk`/`.ipa` vượt quá 150MB. Người dùng tải bằng mạng di động (3G/4G) sẽ hủy tải giữa chừng khi thấy file quá nặng.
2.  **Thời gian tải màn hình đầu (First Load Time)**: Nếu game hiển thị logo Unity hoặc màn hình đen lâu hơn 5 giây mà không có thanh tiến trình, người chơi sẽ tắt ứng dụng và xóa game lập tức.
3.  **Lỗi khởi động (Crash on launch)**: Xung đột giữa các SDK quảng cáo, SDK analytics (Firebase/AppMetrica) với phiên bản Unity Editor. Cần debug qua Logcat để đảm bảo game không crash ngay khi vừa mở.

---

## Worked example: từ hook đến diagnosis (chẩn đoán phễu)

Giả sử bạn chạy một chiến dịch test $150 cho game puzzle mới và nhận được báo cáo sau:
- **Số hiển thị**: 50,000
- **Số Click**: 1,500 (CTR = 3.0% - *Khá tốt*)
- **Số Install**: 225 (Store CVR = 15% - *Rất thấp*)
- **Số D1 Return**: 33 (D1 Retention = 15% - *Thấp*)

**Phân tích chẩn đoán (Diagnosis)**:
*   CTR 3.0% chứng minh ad creative thu hút sự chú ý rất tốt. 
*   Tuy nhiên, Store CVR chỉ 15% (dưới mức sàn 22%) cho thấy trang store đang có vấn đề lớn về "Store Promise Continuity" (không chứng minh được lời hứa từ quảng cáo). Người chơi click vì tò mò nhưng rời đi không cài đặt khi nhìn thấy screenshot rối rắm hoặc art style lệch pha.
*   **Hành động quyết định (Next Action)**: Tạm dừng chạy quảng cáo. Không chỉnh sửa gameplay hay video. Tập trung thiết kế lại 3 ảnh chụp màn hình (screenshots) đầu tiên trên Google Play để khớp với video quảng cáo, sau đó test lại với ngân sách nhỏ.

---

## Real usecases đã đối chiếu nguồn

### Global case: Royal Match

![Royal Match public Google Play screenshot](content/assets/usecases/royal-match.png)
*Public screenshot readout: Trang cửa hàng Royal Match nhấn mạnh trực tiếp vào lời hứa gameplay "No Ads, No Wifi" và hình ảnh dọn dẹp board chơi sạch sẽ, giảm tối đa độ trễ từ lúc click ad đến khi cài đặt.*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Royal Match duy trì tỷ lệ Store CVR cực kỳ ổn định nhờ đồng bộ hóa triệt để visual assets trên store với các video quảng cáo kéo chốt/cứu vua Robert phổ biến. | Sự liên tục của phễu (Impression -> Store -> Install) được bảo vệ bằng cách loại bỏ mọi chi tiết gây nhiễu trên store (ví dụ: giao diện tính năng bang hội, bảng xếp hạng được giấu đi, chỉ trưng bày bàn chơi giải đố). | Không suy ra rằng game của bạn cũng tự động có CVR cao nếu chỉ chụp màn hình gameplay thô sơ mà thiếu thiết kế đồ họa bổ trợ. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Chỉ nhìn CPI để quyết định tăng ngân sách**
    *   *Correction*: CPI rẻ có thể do ad network tối ưu vào nhóm người dùng click dạo (low quality traffic). Phải luôn đánh giá CPI đi kèm với tỷ lệ hoàn thành Tutorial (`tutorial_complete`) và tỷ lệ quay lại D1.
*   **Mistake 2: Đổi gameplay khi thấy D1 thấp trong khi lỗi nằm ở onboarding**
    *   *Correction*: Nếu tỷ lệ vượt qua hướng dẫn chơi (`tutorial_complete`) dưới 50%, người chơi chưa thực sự chạm tới gameplay chính. Bạn cần tối ưu lại luồng hướng dẫn, giảm chữ viết hướng dẫn, tăng tính chỉ dẫn trực quan trước khi sửa core loop của game.
*   **Mistake 3: Bẫy quảng cáo Clickbait quá đà (Fake gameplay)**
    *   *Correction*: Việc làm quảng cáo giả hoàn toàn khác game thật sẽ kéo CTR tăng vọt (CTR > 5%), nhưng sẽ hủy diệt Store CVR (vì người dùng nhận ra ad lừa đảo trên store) và làm tăng tỷ lệ thoát (early churn) ngay phút đầu tiên vào game. Hãy giữ ad hook và gameplay liên kết mật thiết để tối ưu hóa chỉ số IPM thực tế.

---

## Lab output example (Mẫu kết quả thực hành)

| Mắt xích (Link) | Chỉ số đo | Hiện trạng | Khoảng tối ưu | Cách đo | Link yếu? | Hành động (Next Action) |
| --- | --- | ---: | --- | --- | :---: | --- |
| **Impression -> Click** | CTR | 1.1% | `1.8% - 3.0%` | Ad Network | **CÓ** | Thiết kế lại 3 giây đầu quảng cáo để hiển thị core action rõ hơn. |
| **Click -> Install** | Store CVR | 26% | `22% - 32%` | Play Console | Không | Giữ nguyên assets trang store. |
| **Install -> First Open** | Open Rate | 92% | `> 90%` | Firebase | Không | Giữ nguyên build size. |
| **First Open -> Tutorial**| Tutorial Complete | 48% | `> 65%` | Analytics | **CÓ** | Rút ngắn tutorial từ 5 bước xuống 3 bước, bỏ các hội thoại dài dòng. |
| **Tutorial -> D1 Return** | D1 Retention | 15% | `25% - 40%` | Analytics | **CÓ** | Hoàn thiện tutorial trước; nếu tutorial sửa xong mà D1 vẫn thấp mới sửa game. |

---

## Practical Lab

Làm trực tiếp trên game của bạn:
1.  Thiết lập bảng theo dõi phễu gồm ít nhất 5 mắt xích chính (từ Impression đến D1 Return) theo mẫu ở trên.
2.  Điền số liệu hiện tại của game (nếu chưa chạy ads, hãy dùng số giả định nhưng logic rò rỉ phải hợp lý).
3.  Khoanh vùng mắt xích bị rò rỉ người chơi nhiều nhất (Link yếu nhất).
4.  Viết đúng 1 hành động cải tiến kỹ thuật hoặc cải tiến UA tương ứng cho link yếu đó.

---

## Final UA Plan Update

Cập nhật trường **metricTargets** trong Final UA Plan theo mẫu:

```text
- Attention target: [CTR > X% hoặc IPM > Y]
- Install conversion target: [Store CVR X%-Y%]; nếu dưới [Z%] thì sửa trang store trước khi tăng ngân sách
- Early retention target: [D1 X%-Y%]; nếu dưới [W%] thì sửa onboarding/tutorial trước khi đổi quảng cáo mới
- Revenue signal: [Ghi chú định hướng ads/IAP, chưa tính toán ROAS sâu ở micro-budget]
```

---

## Checklist Focus

*   Xây dựng sơ đồ rò rỉ phễu (Funnel Leak Map) đầy đủ 5 mắt xích.
*   Xác định chính xác link yếu nhất dựa trên số liệu.
*   Viết giải pháp sửa đổi tương ứng (creative, store assets hay tutorial) thay vì tăng ngân sách bừa bãi.
*   Cập nhật trường mục tiêu metric vào Final UA Plan.

---

## English Terms You Should Keep

*   **Funnel**: Chuỗi chuyển đổi của người chơi từ quảng cáo đến game.
*   **CTR**: Click-Through Rate (Tỷ lệ nhấp chuột vào quảng cáo).
*   **CVR**: Conversion Rate (Tỷ lệ chuyển đổi cài đặt trên store).
*   **IPM**: Installs per Mille (Số lượt cài đặt trên 1000 lượt hiển thị quảng cáo).
*   **Leak**: Điểm rò rỉ người chơi trong phễu.

---

## Curated References

*   Bài này ưu tiên thực hành trên game của bạn. Reference tốt nhất là báo cáo Acquisition Reports trên Google Play Console của đối thủ hoặc mẫu báo cáo phễu trên Looker Studio của bạn.
', now()),
  ('lessons/day-05.md', 'markdown', null, '---
day: 5
title: "Micro soft-launch strategy"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Soft launch, Retention, Cohort]
artifact: "Micro soft-launch outline"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Micro soft-launch outline**: một bản kế hoạch thử nghiệm 7 ngày đủ nhỏ để chạy với ngân sách `$100-500`, nhưng đủ rõ để biết mình đang học điều gì, dừng ở đâu, và bước tiếp theo là gì.

Kết quả cần có sau bài:
- Không còn hiểu soft-launch như một “global launch thu nhỏ”.
- Biết test nhỏ này **được phép kết luận gì** và **không được phép kết luận gì**.
- Chọn được budget range, daily cap, số creative cell và stop-loss rule phù hợp.
- Biết đọc khi nào tín hiệu xấu đến từ tracking, onboarding, store hay sample size quá bé.
- Cập nhật trường **Budget / test scope** trong Final UA Plan bằng một outline có thể chạy thật.

---

## Why this matters

Với team indie Unity, micro soft-launch không phải là nơi để “chứng minh game này sẽ scale toàn cầu”. Nó là nơi để giảm rủi ro với chi phí thấp nhất có thể.

Nếu bạn dùng `$300` như thể đó là budget để tìm winner tuyệt đối, bạn gần như chắc chắn sẽ đọc sai dữ liệu: một creative có thể trông như thắng chỉ vì cohort quá nhỏ; một game có thể trông như thua chỉ vì tracking hỏng ở tutorial hoặc store page mismatch.

Một micro soft-launch tốt phải trả lời câu hỏi kiểu:
- Hook nào đủ hứa hẹn để test tiếp?
- Store page có đang giết CVR không?
- Onboarding có đang làm D1 sập không?
- Tracking có đủ sạch để mình tin lần test sau không?

---

## Core model: micro soft-launch là learning sprint, không phải scale proof

Hãy tách 4 lớp quyết định:

| Lớp quyết định | Test nhỏ có thể trả lời? | Cách dùng đúng |
| --- | --- | --- |
| **Tracking readiness** | Có | Kiểm tra event có bắn đúng, first_open có khớp install, tutorial_complete có hiện đủ. |
| **Promise fit** | Có | Xem ad hook và store proof có kéo được CTR/CVR chấp nhận được không. |
| **First-session proof** | Có | Xem onboarding, level 1-3, first win có cứu được D1 không. |
| **Scale economics dài hạn** | Không đáng tin cậy | Không dùng `$100-500` để kết luận ROAS bền vững hay LTV ổn định. |

> [!IMPORTANT]
> **Quy tắc thực hành**: Nếu test của bạn không viết rõ *“test này được phép kết luận gì”*, bạn sẽ luôn có xu hướng over-read dữ liệu và scale sớm.

## Hero visual: learning sprint flow

![Day 5 learning sprint visual](content/assets/usecases/day-05-learning-sprint-visual.svg "Visual này tóm tắt thứ tự ra quyết định: ready -> run -> read -> decide. Nó nhấn mạnh micro soft-launch là vòng học nhanh, không phải vòng chứng minh scale.")

*Cách đọc visual này*: nếu team của bạn đang tranh luận về `ROAS`, `LTV` hay “bao giờ scale” trước cả khi xác thực `tracking`, `store proof` và `first-session proof`, bạn đang đọc sai vai trò của test nhỏ.

---

## Micro soft-launch outline mẫu

Dùng khung này để thiết kế test đầu tiên:

| Block | Câu hỏi phải trả lời | Ví dụ cho puzzle prototype |
| --- | --- | --- |
| **Learning question** | Mình đang muốn học điều gì? | Hook “clear chaos” có kéo đúng người chơi hơn hook “only 1% solve this” không? |
| **Region** | Test ở đâu để đủ rẻ nhưng không quá nhiễu? | Android tier-2 English market |
| **Channel** | Chọn 1 kênh chính nào? | Một kênh creative-friendly duy nhất |
| **Creative cells** | Bao nhiêu biến thể là đủ? | 2 hook x 2 variants = 4 cells |
| **Daily cap** | Mỗi ngày đốt tối đa bao nhiêu? | `$30-$50/day` |
| **Stop-loss rule** | Tín hiệu nào đủ xấu để dừng sớm? | Sau 2 ngày, nếu store CVR dưới ngưỡng tối thiểu và tutorial_complete gãy mạnh thì pause |
| **Evidence to continue** | Dấu hiệu nào cho phép test tiếp? | Có ít nhất 1 hook giữ được CVR và D1 không gãy hoàn toàn |

:::chart
title: Example confidence, 1-5
Tracking readiness|4|Events mostly defined, still needs validation
Creative clarity|4|Two usable hooks are ready
Store readiness|3|Listing exists but first screenshot may still be weak
Economics confidence|1|Too early for strong ROAS or LTV conclusions
:::

*Cách đọc chart*: Soft-launch nhỏ nên ưu tiên test khi `tracking`, `creative clarity` và `store readiness` đã đủ dùng. Nếu `economics confidence` còn thấp thì đó là trạng thái bình thường, không phải lý do để trì hoãn toàn bộ test.

## Visual bổ sung: budget vs signal

![Day 5 budget signal visual](content/assets/usecases/day-05-budget-signal-visual.svg "Visual này cho thấy cùng budget `$300`, càng chia nhiều cells thì signal trên mỗi cell càng loãng. Mục đích là buộc người học nghĩ về design của test, không chỉ nghĩ về tổng ngân sách.")

*Cách đọc visual này*: nếu test nhỏ của bạn có hơn `4` cells mà vẫn chỉ có `$100-500`, gần như luôn phải hỏi lại: mình đang tối ưu cho học được gì, hay chỉ đang gom thật nhiều giả thuyết trong một lần chạy?

---

## Hướng dẫn đọc số trong test nhỏ

Hãy đọc dữ liệu theo mức độ “đủ để hành động”, không phải “đủ để chứng minh tuyệt đối”.

| Pattern | Cách đọc | Next action đúng | Next action sai thường gặp |
| --- | --- | --- | --- |
| **18 installs, D1 rất cao** | Cohort quá nhỏ, tín hiệu chỉ nên ghi chú là “interesting”. | Chạy lại với ít creative hơn hoặc thêm sample trước khi kết luận. | Scale ngay vì thấy creative “đang thắng”. |
| **CTR khá, CVR thấp** | Hook có attention nhưng store chưa chứng minh promise. | Sửa screenshot đầu, icon, short description rồi test lại. | Đổi region hoặc đổi network ngay. |
| **CVR ổn, D1 gãy** | Store không phải điểm hỏng chính. Lỗi nhiều khả năng nằm ở first session. | Kiểm tra tutorial, first win, difficulty ramp. | Tiếp tục đổ thêm budget vì “install vẫn có”. |
| **Install ít hơn dự kiến** | Có thể do budget quá mỏng hoặc chia quá nhiều creative cells. | Giảm số cell, tăng signal per cell. | Kết luận luôn là game không có thị trường. |

## Worked example: test `$300` trong 7 ngày

Giả sử bạn có một game puzzle prototype với 2 hook:
- **A**: `Only 1% solve this`
- **B**: `Clear the board and relax`

Kế hoạch test:

| Thành phần | Thiết lập |
| --- | --- |
| Budget tổng | `$300` |
| Daily cap | `$40/day` trong 7 ngày, giữ phần còn lại cho ngày xác nhận |
| Region | Android, 1 market chính |
| Creative cells | 4 cells (2 hooks x 2 variants) |
| Mục tiêu học | Hook nào tạo ra *promise fit* tốt hơn, không phải hook nào scale được ngay |
| Stop-loss | Nếu sau 2 ngày 1 hook vừa có `Store CVR` yếu vừa có `tutorial_complete` gãy thì dừng cell đó |

Kết quả giả lập sau 4 ngày:

| Hook | CTR | Store CVR | CPI | Tutorial complete | D1 | Diagnosis |
| --- | --- | --- | --- | --- | --- | --- |
| **A** Challenge | 4.3% | 14% | Thấp | 48% | 12% | Hook kéo click tốt nhưng curiosity trap, store mismatch và first session không prove challenge đúng cách |
| **B** Relax/Clear | 2.6% | 31% | Vừa | 71% | 27% | Promise fit tốt hơn, đáng giữ để test tiếp với sample lớn hơn |

> [!NOTE]
> **Bài học cần rút ra**: Hook B không “thắng chung cuộc”. Nó chỉ là candidate tốt hơn cho vòng test tiếp theo. Micro soft-launch đúng nghĩa phải tạo ra *next test*, không phải *final winner*.

---

## Test readiness checklist cho Unity indie/dev

Trước khi đốt đồng nào, test nhỏ phải qua checklist tối thiểu này:

| Hạng mục | Cần có | Nếu thiếu thì rủi ro gì? |
| --- | --- | --- |
| **Build stability** | Không crash ở first open, load time chấp nhận được | Install bị mất giá trị vì first_open fail |
| **Event core** | `first_open`, `tutorial_start`, `tutorial_complete`, `level_start`, `level_complete` | Không biết D1 thấp do onboarding hay do tracking hỏng |
| **Store assets** | Icon, screenshot đầu, mô tả ngắn khớp hook | CVR thấp nhưng không biết do game hay store |
| **Creative scope** | Tối đa 2-4 cells cho micro-budget | Quá nhiều cell làm sample bị loãng |
| **Decision owner** | Ai là người pause / continue / fix? | Test xong nhưng không ai chốt next action |

## Real usecases đã đối chiếu nguồn

### Public image: Monopoly GO! app icon

![Monopoly GO app icon](https://upload.wikimedia.org/wikipedia/en/e/ed/App_icon_of_Monopoly_Go%21%2C_Scopely%2C_2023.webp "Nguồn ảnh public từ Wikipedia infobox. Ảnh này không dùng để học benchmark, mà để nhắc rằng breakout hit thường có brand/IP strength và production value mà team indie không nên lấy làm baseline soft-launch.")

*Public image readout*: chỉ riêng asset level cũng đã cho thấy đây là sản phẩm có brand recognition và presentation polish mạnh. Dùng ảnh này để nhắc người học rằng khi so với breakout hit, thứ cần học là **framework đọc test**, không phải tự áp scale expectation của họ vào game indie.

### Global caution case: Monopoly GO!

| Fact từ nguồn public | Micro soft-launch lesson | Không được suy ra |
| --- | --- | --- |
| Wikipedia mô tả Monopoly GO! là sản phẩm mobile của Scopely, phát hành ngày 11/04/2023 và đã scale rất lớn sau launch. Nguồn: [Wikipedia - Monopoly GO!](https://en.wikipedia.org/wiki/Monopoly_Go%21) | Đây là ví dụ điển hình cho việc **không được dùng kết quả scale của breakout hit làm mục tiêu cho soft-launch nhỏ**. | Không copy scale expectation, live-ops depth hay budget mindset của một IP lớn. |
| Android Central review mô tả game có visual polish mạnh, loop mượt và monetization rất rõ. Nguồn: [Android Central review](https://www.androidcentral.com/gaming/monopoly-go-review) | Product có presentation mạnh thường làm người học mới dễ nhầm giữa “game tốt” và “test nhỏ của mình phải giống vậy mới được”. | Không suy ra team indie phải đạt production polish tương đương mới được test soft-launch. |

**Decision rule học được**: Test nhỏ của bạn chỉ nên cố tìm “next valid learning step”, không cố bắt chước outcome của một sản phẩm đã scale toàn cầu.

### Market reference case: Zego Studio / Screw Sort 3D

| Fact từ nguồn public | Micro soft-launch lesson | Không được suy ra |
| --- | --- | --- |
| Google Play developer page cho thấy Zego Studio có nhiều game puzzle/sort khác nhau trong cùng catalog. Nguồn: [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Catalog rộng cho thấy mỗi hook cần được test như một hypothesis riêng. Không nên gộp nhiều promise vào cùng một micro test nhỏ. | Không suy ra rằng chỉ vì cùng publisher thì mọi game đều nên chia sẻ một campaign setup. |
| Trang Google Play của Screw Sort 3D cho thấy object/action promise rất cụ thể ngay từ screenshot đầu và phần mô tả nhấn mạnh “satisfying”, “logic”, “ASMR”, “screw jam”. Nguồn: [Screw Sort 3D on Google Play](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Với budget nhỏ, promise càng cụ thể thì càng dễ đọc CVR và promise fit. | Không suy ra mọi puzzle prototype đều cần ngay lập tức mở rộng meta hoặc live-ops để test được. |

*Screenshot readout gợi ý cho người học*: khi mở trang Google Play của Screw Sort 3D, hãy đọc screenshot đầu theo 3 câu hỏi: `vật thể chính là gì`, `hành động chính là gì`, `satisfaction payoff là gì`. Nếu 3 câu này trả lời nhanh được, store page đang giúp CVR chứ không làm nhiễu promise.

**Decision rule học được**: Với micro-budget, càng ít hypothesis cùng chạy một lúc thì dữ liệu càng dễ đọc.

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Dùng test nhỏ để “chứng minh winner”**
    *   *Correction*: Dùng test nhỏ để loại bỏ giả định xấu và chọn câu hỏi tốt hơn cho vòng tiếp theo.
*   **Mistake 2: Chia `$300` cho quá nhiều audience hoặc quá nhiều creative cell**
    *   *Correction*: Giữ 1 region, 1 channel chính, và số cell đủ ít để mỗi cell còn tạo ra tín hiệu đọc được.
*   **Mistake 3: Thấy một cohort bé đẹp là scale ngay**
    *   *Correction*: Ghi tín hiệu đó là “interesting”, rồi rerun với sample rõ hơn trước khi tăng budget.
*   **Mistake 4: Không viết stop-loss rule từ trước**
    *   *Correction*: Luôn định nghĩa trước điều kiện pause để tránh “đốt thêm một ngày nữa cho chắc”.

---

## Lab output example (Mẫu kết quả thực hành)

| Field | Example output |
| --- | --- |
| **Learning question** | Does the relax hook produce cleaner promise fit than the challenge hook? |
| **Budget** | `$300 total`, `$40/day` |
| **Region / channel** | Android, one primary paid channel |
| **Creative cells** | 4 |
| **Stop-loss** | Pause any cell that shows weak Store CVR and broken tutorial completion after day 2 |
| **Continue signal** | At least one cell keeps CVR acceptable and D1 not collapsing |
| **What this test cannot prove** | Long-term ROAS or scalable LTV |
| **Next step if useful** | Retest the best hook with fewer cells and stronger first-session proof |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1. Chọn một learning question duy nhất cho test `$100-500`.
2. Chọn 1 region và 1 channel chính.
3. Viết rõ số creative cells sẽ chạy và vì sao số đó không làm sample bị loãng.
4. Ghi daily cap, stop-loss rule và continue signal.
5. Viết thêm 2 dòng cuối: `Test này được phép kết luận gì?` và `Test này không được phép kết luận gì?`

---

## Final UA Plan Update

Cập nhật trường **Budget / test scope** trong Final UA Plan theo mẫu:

```text
Budget: [tong ngan sach]
Daily cap: [muc tran moi ngay]
Primary learning question: [cau hoi test]
Region: [thi truong test]
Channel: [kenh chinh]
Creative cells: [so bien the]
Stop-loss rule: [dieu kien pause]
Continue signal: [dieu kien test tiep]
Not allowed to conclude: [dieu test nho nay khong du quyen ket luan]
```

---

## Checklist Focus

*   Chọn một learning question duy nhất cho test nhỏ.
*   Viết rõ budget tổng, daily cap và số creative cells.
*   Ghi stop-loss rule và continue signal trước khi launch.
*   Viết rõ test này được phép kết luận gì và không được phép kết luận gì.

---

## English Terms You Should Keep

*   **Soft launch**: Giai đoạn launch giới hạn để học trước khi scale.
*   **Retention**: Tỷ lệ người chơi quay lại sau một khoảng thời gian.
*   **Cohort**: Nhóm người dùng cùng ngày cài đặt hoặc cùng điều kiện test.
*   **Daily cap**: Mức trần chi tiêu mỗi ngày.
*   **Stop-loss**: Điều kiện dừng sớm để tránh đốt thêm budget vào tín hiệu xấu.
*   **Continue signal**: Dấu hiệu đủ tốt để justify một vòng test tiếp theo.

---

## Curated References

*   [Wikipedia - Monopoly GO!](https://en.wikipedia.org/wiki/Monopoly_Go%21)
*   [Android Central - Monopoly GO review](https://www.androidcentral.com/gaming/monopoly-go-review)
*   [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio)
*   [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
*   Module này ưu tiên thực hành trên game của bạn. Calculator phù hợp nhất để đi cùng bài này là **Sample-size sanity check** nhằm kiểm tra test có đang chia quá nhiều cell so với budget hay không.
', now()),
  ('lessons/day-06.md', 'markdown', null, '---
day: 6
title: "Channel map for small Unity teams"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Ad network, Campaign, Optimization]
artifact: "Channel selection note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Channel selection note**: một ghi chú ra quyết định đủ ngắn để đưa vào 1-page UA / soft-launch plan, nhưng đủ rõ để biết **kênh nào nên chạy trước**, **kênh nào nên hoãn**, và **kênh đó sẽ dạy bạn điều gì**.

Kết quả cần có sau bài:
- Không còn chọn channel theo kiểu “nghe nói channel này mạnh”.
- Biết tách **learning job** của từng channel: creative learning, search intent, scale, hay store validation.
- Chọn được `1` primary channel cho test `$100-500` thay vì rải tiền thành nhiều cụm noise.
- Viết được lý do vì sao channel đó khớp với creative readiness, tracking readiness và stage hiện tại của game.
- Cập nhật trường **Channel / test scope** trong Final UA Plan bằng một quyết định dùng được ngay.

---

## Why this matters

Một team Unity nhỏ thường mắc cùng một lỗi: vừa có ít ngân sách, vừa muốn “có mặt ở mọi nơi”. Kết quả là `$300` bị chia thành quá nhiều campaign, quá nhiều network, quá nhiều giả thuyết. Sau vài ngày, dashboard có số nhưng không có câu trả lời.

Các kênh quảng cáo không thể thay thế cho nhau (not interchangeable):
- Có channel mạnh về **creative learning** (kiểm chứng video quảng cáo).
- Có channel mạnh về **high intent discovery** (bắt đúng nhu cầu người dùng chủ động tìm kiếm).
- Có channel chỉ bắt đầu hữu ích khi account đã có nhiều dữ liệu conversion tích lũy hoặc hệ thống đo lường ổn định.
- Có “channel” thực chất nên được xem là **store / ASO preparation** (chuẩn bị nội dung trang cửa hàng) chứ không phải paid acquisition sprint.

Với puzzle prototype Android-first, câu hỏi đúng thường không phải là “channel nào tốt nhất thị trường”, mà là:
- Channel nào dạy mình nhanh nhất với budget nhỏ?
- Channel nào cần quá nhiều conversion nên chưa phù hợp?
- Channel nào sẽ làm mình đọc sai nếu store page và tracking còn yếu?

---

## Core model: chọn channel theo learning job, không theo danh tiếng

Thay vì hỏi “nên chạy Meta, Google hay network game?”, hãy hỏi 4 câu theo thứ tự:

| Câu hỏi | Nếu câu trả lời là “có” | Ý nghĩa chọn channel |
| --- | --- | --- |
| **Mình đã có 2-4 creative cells rõ hook chưa?** | Có | Có thể ưu tiên channel thiên về creative learning. |
| **Store page đã đủ sạch để đọc CVR chưa?** | Chưa | Trì hoãn paid scale; ưu tiên sửa store hoặc làm validation hẹp hơn. |
| **Tracking core đã đủ tin chưa?** | Chưa | Tránh channel phức tạp về optimization; test đơn giản hơn để debug signal. |
| **Mục tiêu chính là học promise hay bắt intent?** | Promise | Social/video channel thường hợp hơn search-intent channel. |

> [!IMPORTANT]
> **Decision rule**: Với micro-budget, channel tốt nhất là channel tạo ra *tín hiệu có thể hành động*, không phải channel có vẻ “xịn” hơn trong các case study lớn.

---

## Sơ đồ Quyết định chọn Kênh quảng cáo / Hero Diagram

![UA selection decision tree](content/assets/usecases/day-06-hero-diagram.png)
*Sơ đồ cây quyết định: Bắt đầu từ câu hỏi học nhanh nhất của dự án để dẫn dắt tới nhóm kênh phù hợp.*

---

## Channel map mẫu

| Channel family | Learning job mạnh nhất | Budget fit `$100-500` | Creative requirement | Measurement complexity | Khi nào nên là first test? | Khi nào chưa nên dùng sớm? |
| --- | --- | --- | --- | --- | --- | --- |
| **Meta-style social** | Creative learning, promise fit, CTR -> CVR readout | Khá hợp | Cần video hook đủ rõ | Vừa | Khi bạn đã có 2-4 ad angles và muốn biết promise nào đáng giữ. | Khi tracking đang hỏng hoặc store page quá yếu. |
| **Google App Campaigns** | Broad app demand capture, machine-led distribution | Rất kém ở quy mô nhỏ | Cần asset pack đủ rộng (ảnh, text, video) | Tương đối cao | Khi build và measurement sạch hơn, muốn xem broad distribution phản ứng ra sao. | **Lưu ý kỹ thuật**: Máy học của Google cần tối thiểu 50 conversions/ngày để tối ưu. Với budget nhỏ, campaign dễ bị "nghẹn" (learning loop). |
| **Rewarded / gaming network** | Gameplay-proof, install quality từ game-like audience | Tùy game, thường cần creative/gameplay proof rõ | Cần gameplay footage hợp ngữ cảnh game | Vừa đến cao | Khi core loop nhìn rất “gamey”, first-session proof đủ rõ. | Khi game còn thiếu first-win clarity hoặc ad chỉ là curiosity bait. |
| **ASO / store listing cleanup** | Store proof, screenshot order, icon/subtitle fit | Rất hợp (0đ paid) | Không cần paid creative nhiều | Thấp | **Liên kết Lesson 4**: Khi CTR ổn nhưng CVR yếu (<22%), hãy sửa store trước khi chạy ads paid. | Khi bạn nhầm nó là “scale channel” thay vì prep work để giảm rò rỉ. |
| **Apple Ads / Search intent** | High-intent iOS discovery | Không phải first choice cho Android-first micro test | Cần metadata và product page fit | Phức tạp | Khi đã iOS-aware hơn và muốn test search intent cụ thể. | **Hạn chế đo lường**: Kể từ iOS 14.5+ (ATT framework), việc đo lường chuyển đổi trên iOS rất nhiễu đối với team nhỏ. |

---

## Đánh giá So sánh Đặc tính Kênh / Data Visual

![UA selection data visual comparison](content/assets/usecases/day-06-data-visual.png)
*Biểu đồ so sánh đa tiêu chí: Giúp nhận diện rõ các điểm đánh đổi (tradeoff) về tốc độ học, độ phức tạp đo lường và ngân sách.*

---

### Bảng so sánh chi phí thiết lập ban đầu (Initial Setup Cost)

| Kênh (Channel) | Chi phí thiết lập kỹ thuật | Chi phí sản xuất Creative | Độ khó vận hành (1-5) | Lưu ý cốt lõi |
| :--- | :---: | :---: | :---: | :--- |
| **Meta-style social** | Thấp (chỉ cần SDK cơ bản) | Cao (cần 2-4 video hook chất lượng) | 2/5 | Dễ chạy thử nhanh với ngân sách nhỏ. |
| **Google App Campaigns** | Trung bình | Vừa (cần gom đủ asset pack ảnh/text/video) | 3/5 | Cần máy học tự động tối ưu, tránh chỉnh tay thủ công nhiều. |
| **ASO / Store cleanup** | Thấp | Vừa (chụp screenshot, viết mô tả) | 1/5 | Tập trung sửa rò rỉ phễu store trước khi chạy bất kỳ ads nào. |
| **Rewarded network** | Cao (cần custom SDK / ad mediator) | Cao (cần gameplay video chân thực) | 4/5 | Chỉ nên dùng khi game đã ổn định loop. |
| **Apple Ads** | Thấp | Thấp (dùng chính assets của store) | 3/5 | Đấu thầu từ khóa thủ công (keyword bidding) trên iOS. |

---

## Hướng dẫn đọc số và đọc tín hiệu theo channel

| Pattern | Cách đọc | Next action đúng | Next action sai thường gặp |
| --- | --- | --- | --- |
| **Social CTR có tín hiệu nhưng Store CVR yếu** | Channel đã dạy bạn về promise mismatch hoặc store proof yếu. | Sửa screenshot đầu, icon, subtitle, first screenshot narrative. | Kết luận luôn là social channel “không hiệu quả”. |
| **Google distribution có install nhưng khó giải thích hook nào thắng** | Asset pack hoặc learning design quá broad cho budget hiện tại. | Quay lại test hẹp hơn, ít hypothesis hơn. | Đổ thêm budget chỉ để mong machine tự tối ưu ra câu trả lời. |
| **Rewarded/game network CPI ổn nhưng D1 gãy** | Audience có thể click/try gameplay, nhưng first session chưa giữ được. | Sửa tutorial, first win, difficulty ramp. | Scale vì “install quality có vẻ tốt”. |
| **Search-intent channel tap intent mạnh nhưng volume nhỏ** | Intent signal hữu ích, nhưng chưa chắc là first channel cho Android-first prototype. | Dùng như kênh bổ sung khi iOS/store metadata đã khá hơn. | Đọc nó như bằng chứng rằng paid strategy tổng thể đã xong. |
| **ASO/store cleanup làm CVR nhích lên trước cả khi tăng spend** | Store proof đang là bottleneck thật. | Giữ channel plan gọn, chỉ scale paid sau khi listing đủ sạch (CVR > 22%). | Bỏ qua vì nghĩ “không phải paid nên không quan trọng”. |

---

## Worked example: chọn channel cho puzzle prototype với `$300`

Giả sử bạn có game puzzle match prototype, Android-first, hiện có:
- `3` video hooks đủ xem được
- store page còn hơi yếu ở screenshot đầu
- tracking core đã có `first_open`, `tutorial_complete`, `level_complete`
- chưa có đủ sample để tin vào optimization phức tạp

Bạn đang cân nhắc 3 hướng:

| Option | Tại sao hấp dẫn | Rủi ro chính | Kết luận cho vòng 1 |
| --- | --- | --- | --- |
| **Meta-style social** | Dễ test hook, dễ xem promise fit qua CTR -> CVR | Nếu store page yếu sẽ đọc ra mismatch rất nhanh | **Nên là primary channel** |
| **Google App Campaigns** | Có vẻ “toàn diện”, máy tự phân phối nhiều bề mặt | Budget nhỏ dễ làm khó đọc asset/hook nào đang tạo tín hiệu | **Hoãn cho vòng sau** |
| **Rewarded gaming network** | Có thể gần với game audience hơn | Nếu gameplay payoff chưa đủ rõ, signal dễ lẫn giữa curiosity và quality | **Chỉ test sau khi first-session proof tốt hơn** |

**Recommended note cho vòng 1**:
- Primary channel: `Meta-style social`
- Secondary later: `Google App Campaigns`
- Deferred: `Rewarded gaming network`
- Reason: vòng đầu cần học **hook nào đáng giữ**, chưa cần broad machine distribution

> [!NOTE]
> **Bài học cần rút ra**: Channel choice ở giai đoạn sớm thường là một quyết định *debug funnel*, không phải một quyết định *media mix đầy đủ*.

---

## Minh họa Quyết định Thử nghiệm Vòng 1 / Decision Board

![Worked Example Decision Cards](content/assets/usecases/day-06-worked-example.png)
*Decision board phân tích nhanh ưu/nhược điểm và kết luận lựa chọn cho ngân sách micro-budget $300.*

---

## Implementation / operating checklist

Trước khi chốt channel đầu tiên, cần qua checklist vận hành này:

| Hạng mục | Cần có | Nếu thiếu thì channel decision dễ sai ở đâu? |
| --- | --- | --- |
| **Creative inventory** | Ít nhất `2-4` cells đủ khác nhau về hook | Không biết channel yếu hay hook yếu |
| **Store readiness** | Icon, first screenshot, short description đủ khớp promise | CVR yếu nhưng blame nhầm cho channel |
| **Event core** | `first_open`, `tutorial_start`, `tutorial_complete`, `level_complete` | D1/D0 quality không đọc nổi |
| **Budget discipline** | Daily cap và stop-loss rule viết sẵn | Test lan ra nhiều kênh rồi không biết dừng ở đâu |
| **Decision owner** | Một người chốt pause / continue / fix | Channel test xong nhưng không ai chuyển thành next step |

---

## Real usecases đã đối chiếu nguồn

### Official product signal: Apple Ads / App Store search intent

| Fact từ nguồn public | Channel lesson | Không được suy ra |
| --- | --- | --- |
| Apple Ads mô tả ads xuất hiện ở Today tab, Search tab, Search Results và Product Pages; đồng thời nhấn mạnh search là một cách khám phá app quan trọng trong App Store. Nguồn: [Apple Ads - Ads on the App Store](https://ads.apple.com/app-store) | Đây là kênh có intent mạnh và placement rõ, phù hợp khi bạn cần đọc search discovery trên iOS. | Không suy ra mọi game Android-first budget nhỏ nên chạy Apple Ads ngay từ vòng đầu. |
| Apple Ads product page nêu conversion rate cao cho top-of-search placements và mô tả các dashboard về installs, CPA, spend, impressions. Nguồn: [Apple Ads - Ads on the App Store](https://ads.apple.com/app-store) | Kênh search-intent thường hữu ích khi product metadata, product page và iOS measurement đã trưởng thành hơn. | Không copy các con số marketing đó thành benchmark cho indie puzzle prototype. |

**Decision rule học được**: intent-rich channel rất giá trị, nhưng chỉ khi nó trả lời đúng câu hỏi bạn đang có.

### Public market case: Zego Studio / Screw Sort 3D

| Fact từ nguồn public | Channel lesson | Không được suy ra |
| --- | --- | --- |
| Google Play page của `Screw Sort 3D` cho thấy promise rất cụ thể quanh screw puzzle, ASMR satisfaction và object-action loop. Nguồn: [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Nếu store/listing đã nói promise rất rõ, paid social sẽ dễ đọc `promise fit` hơn vì CVR ít bị nhiễu hơn. | Không suy ra cứ có listing rõ là mọi channel paid sẽ hiệu quả ngay. |
| Google Play developer page của `Zego Studio` cho thấy publisher có nhiều title puzzle/sort trong cùng catalog. Nguồn: [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Khi có nhiều sub-genre gần nhau, channel plan phải đi cùng hypothesis rõ; không nên gộp nhiều promise vào một sprint. | Không suy ra publisher catalog rộng là lý do để team nhỏ mở nhiều channel cùng lúc. |

**Decision rule học được**: channel choice chỉ đúng khi đi cùng một hypothesis đủ hẹp.

---

## Minh họa Giao diện Điểm chạm Thực tế / Placements Screenshot

![Zego Screw Sort 3D on Google Play](content/assets/usecases/screw-sort.png)
*Ảnh chụp cửa hàng thực tế của Screw Sort 3D (Zego Studio) thể hiện thông điệp hành động cực kỳ rõ ràng, giúp tăng tỷ lệ CVR trên store.*

---

## Storyboard: Sự Khác Biệt Giữa Kênh Khám Phá và Kênh Tìm Kiếm

Dưới đây là sơ đồ minh họa 4 phân cảnh phân biệt trạng thái người chơi và công việc của từng kênh quảng cáo:

![Storyboard phân biệt kênh quảng cáo](content/assets/usecases/day-06-storyboard.png)

| Phân cảnh (Frame) | Nội dung hình ảnh | Trạng thái người chơi | Job of Channel |
| :---: | :--- | :--- | :--- |
| **1** | User đang lướt mạng xã hội xem tin tức | Rảnh rỗi, không chủ động tìm game | **Creative Social**: Phải giật hook visual mạnh để bắt chú ý. |
| **2** | User gõ tìm kiếm từ khóa "screw puzzle" trên store | Đang có nhu cầu giải trí cụ thể | **Search Intent**: Đấu thầu đúng từ khóa, CVR sẽ cực cao. |
| **3** | User đang chơi một game puzzle khác và xem quảng cáo | Đang trong tâm thế chơi game | **Rewarded Network**: Cần đưa gameplay footage tương tự để mời gọi. |
| **4** | User click ad và chuyển tới trang store sạch sẽ | Đang đối chiếu lời hứa quảng cáo | **Store Proof (ASO)**: Giữ chân và thuyết phục tải game. |

---

## Common mistakes

*   **Mistake 1: Chọn channel theo danh tiếng thay vì learning question**
    *   *Correction*: Viết learning question trước, rồi chọn channel nào trả lời câu hỏi đó nhanh nhất.
*   **Mistake 2: Chia micro-budget cho nhiều channels để “test đủ thứ”**
    *   *Correction*: Giữ `1` primary channel cho sprint đầu; deferred list để dành cho vòng sau.
*   **Mistake 3: Thấy machine-led channel sang nên dùng ngay từ đầu**
    *   *Correction*: Nếu creative, store và tracking chưa sạch, broad distribution chỉ làm danh tiếng mờ nhạt đi chẩn đoán thực tế.
*   **Mistake 4: Xem ASO/store cleanup là việc phụ**
    *   *Correction*: Với budget nhỏ, listing đôi khi là lever học nhanh hơn việc mở thêm paid channel.

---

## Lab output example

| Field | Example output |
| --- | --- |
| **Learning job** | Learn which video hook creates the cleanest promise fit |
| **Primary channel** | Meta-style social |
| **Why this channel first** | Fast hook learning with small budget and limited creative set |
| **Deferred channel** | Google App Campaigns |
| **Why defer** | Need cleaner asset base and less ambiguous learning setup |
| **Not testing yet** | Rewarded gaming network |
| **Main risk to watch** | Store page may depress CVR and make the channel look worse than it is |
| **Next step if useful** | Retest best hook after improving first screenshot and subtitle |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1. Viết `learning question` của sprint tiếp theo bằng một câu.
2. Liệt kê `3` channel options thực tế bạn có thể chạy.
3. Chấm mỗi channel từ `1-5` theo `budget fit`, `creative fit`, `measurement complexity`, `speed of learning`.
4. Chọn `1` primary channel và `1` deferred channel.
5. Viết thêm 2 dòng cuối: `Channel này dạy mình điều gì nhanh nhất?` và `Channel này chưa thể dạy mình điều gì?`

---

## Final UA Plan Update

Cập nhật trường **Channel / test scope** trong Final UA Plan theo mẫu:

```text
Primary channel: [kenh chinh]
Learning job: [cau hoi hoc nhanh nhat]
Why this channel first: [ly do chon]
Budget fit: [danh gia ngan sach]
Creative requirement: [yeu cau asset / hook]
Main risk: [rui ro doc sai]
Deferred channel: [kenh de sau]
Not testing yet: [kenh chua test]
```

---

## Checklist Focus

*   Chấm nhất 3 channel theo cùng một rubric.
*   Chọn đúng 1 primary channel cho sprint đầu.
*   Viết rõ vì sao channel đó khớp với learning question.
*   Ghi rõ 1 deferred channel và 1 thứ chưa test yet.

---

## English Terms You Should Keep

*   **Ad network**: Nền tảng hoặc inventory dùng để mua traffic.
*   **Campaign**: Cấu trúc chạy quảng cáo theo mục tiêu, budget và targeting.
*   **Optimization**: Cách platform hoặc team điều chỉnh để cải thiện kết quả.
*   **Learning job**: Điều cụ thể mà channel đó cần dạy bạn trong sprint hiện tại.
*   **Intent**: Mức độ chủ động hoặc nhu cầu sẵn có của người dùng trước khi install.
*   **daily cap**: Giới hạn ngân sách tối đa được phép chi tiêu trong một ngày của chiến dịch.
*   **stop-loss rule**: Ngưỡng cắt lỗ tự động - quy tắc bắt buộc tắt chiến dịch nếu chỉ số tệ vượt qua mốc cho phép.

---

## Curated References

*   [Apple Ads - Ads on the App Store](https://ads.apple.com/app-store)
*   [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
*   [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio)
*   Với lesson này, reference chỉ để hiểu placement và market signal. Quyết định cuối vẫn phải quay về câu hỏi: `channel nào dạy mình nhanh nhất với budget hiện tại?`
', now()),
  ('lessons/day-07.md', 'markdown', null, '---
day: 7
title: "Week 1 synthesis: first UA hypothesis"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, Soft launch]
artifact: "First UA hypothesis card"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **First UA hypothesis card**: một thẻ giả thuyết UA cốt lõi chứa 5 dòng quyết định liên kết chặt chẽ từ người chơi đến hành động sửa đổi. 

Kết quả cần có sau bài:
- Không còn viết giả thuyết chung chung kiểu "game hay sẽ có người chơi".
- Ràng buộc được giả thuyết quảng cáo với điều kiện hành động (decision rule) cụ thể.
- Biết khoanh vùng và phân bổ ngân sách thử nghiệm hẹp $100-500 mà không bị phân tán.
- Cập nhật trường **First UA hypothesis** trong Final UA Plan.

---

## Why this matters

Kết thúc tuần đầu tiên (Week 1), bạn đã học về vòng lặp UA, chẩn đoán phễu rò rỉ và chọn kênh. Tuy nhiên, nếu bạn bước vào giai đoạn chạy test $100-500 chỉ với một đống note rời rạc, bạn sẽ rơi vào bẫy **chạy quảng cáo cầu may** (pray-and-play). 

Ngân sách nhỏ không cho phép bạn test mọi thứ. Thẻ giả thuyết UA đầu tiên đóng vai trò như một bản cam kết vận hành: bạn phải viết rõ trước khi chạy ad rằng: *đối tượng nào, thích điều gì, được kiểm chứng bằng số liệu nào, và nếu số liệu đó gãy thì bạn sẽ sửa game ở đâu trước*. Nếu không có quy tắc quyết định (decision rule) này, bạn sẽ tiêu hết $300 mà vẫn không biết nên bỏ dự án hay sửa tiếp.

---

## Core model: cấu trúc giả thuyết 5 dòng

Một giả thuyết UA tốt không phải là một câu văn bay bổng, nó là một cấu trúc có tính kỷ luật gồm 5 thành phần:

1.  **Player (Who)**: Đối tượng người chơi định nghĩa bằng hành vi/động lực (motivation).
2.  **Promise (Hook)**: Lời hứa cốt lõi thể hiện qua video quảng cáo.
3.  **Channel (Where)**: Kênh quảng cáo được chọn để tối ưu hóa học hỏi nhanh nhất.
4.  **Metric (Verification)**: Chỉ số phễu cốt lõi và ngưỡng quyết định (threshold).
5.  **Action (Decision Rule)**: Hành động sửa đổi cụ thể nếu chỉ số không đạt kỳ vọng.

---

## Khung Giả thuyết UA mẫu (Main framework/map mẫu)

Dưới đây là khung phân rã giả thuyết mà bạn có thể áp dụng trực tiếp cho game của mình:

| Thành phần | Câu hỏi định hướng | Ví dụ thực hành mẫu |
| :--- | :--- | :--- |
| **1. Player** | Ai là người chơi có động lực phù hợp nhất? | Người làm việc văn phòng cần khoảng nghỉ não ngắn sau giờ làm (calm break). |
| **2. Promise** | Ad hook nào sẽ hứa hẹn đúng động lực đó? | Video clip "Clear board" trong vòng 10 giây đem lại cảm giác dọn dẹp thỏa mãn. |
| **3. Channel** | Kênh nào tối ưu nhất cho test đầu tiên? | Meta-style social để kiểm tra nhanh chỉ số CTR/CVR của hook. |
| **4. Metric** | Chỉ số nào quyết định sự thành/bại của test? | CTR của ad đạt `> 2.2%`, tỷ lệ CVR trên store đạt `> 25%`, D1 đạt `> 30%`. |
| **5. Action** | Nếu metric gãy, bước tiếp theo là gì? | Nếu CTR thấp: Sửa ad; Nếu CVR thấp: Sửa store listing; Nếu D1 thấp: Sửa onboarding/tutorial. |

---

## Sơ đồ Quy trình Kiểm chứng Giả thuyết (Hero visual or operating diagram)

Sơ đồ dưới đây minh họa dòng chảy của một Thẻ giả thuyết UA từ lúc thiết lập đến các nhánh quyết định hành động:

![UA selection decision tree](content/assets/usecases/day-07-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Luồng đi tuần tự từ xác định Player -> thiết lập Promise -> chạy thử Channel -> đo lường Metric -> ra quyết định Action. Đây là một vòng lặp kín (loop), không phải đường thẳng một chiều.
> *   **Kết luận rút ra (Conclude)**: Nhánh Action (Hành động) là mắt xích quan trọng nhất. Một giả thuyết mà không đi kèm kịch bản xử lý lỗi khi số liệu gãy (Fail Actions) thì chỉ là một ý tưởng lý thuyết suông.
> *   **Không được suy ra (Do not infer)**: Không được suy ra rằng các mốc phần trăm hay kênh quảng cáo trong sơ đồ là cố định cho mọi game. Bạn bắt buộc phải tự tùy biến theo tình huống cụ thể của game mình.

---

## Bảng so sánh Giả thuyết Yếu và Giả thuyết Mạnh

Để tránh viết các giả thuyết mơ hồ, hãy đối chiếu bảng so sánh dưới đây trước khi chốt phương án:

| Thành phần | Giả thuyết Yếu (Weak Hypothesis) | Giả thuyết Mạnh (Strong Hypothesis) | Lý do khác biệt |
| :--- | :--- | :--- | :--- |
| **Player** | "Tất cả những ai thích chơi game puzzle." | "Người đi làm văn phòng cần một khoảng nghỉ não ngắn sau giờ làm (calm break)." | Xác định rõ hành vi và ngữ cảnh chơi game để làm video quảng cáo. |
| **Promise** | "Game xếp hình rất hay và nhiều tính năng thú vị." | "Video clip hứa hẹn dọn dẹp board chơi sạch sẽ trong vòng 10 giây." | Đưa ra một hành động cụ thể, dễ kiểm chứng trong creative. |
| **Metric** | "Đạt thật nhiều lượt tải với CPI rẻ nhất có thể." | "CTR > 2.0%, Store CVR > 22%, D1 Retention > 28%." | Có các con số mục tiêu rõ ràng để làm căn cứ chẩn đoán phễu. |
| **Action** | "Nếu game fail thì sẽ đổi sang chạy kênh quảng cáo khác." | "Nếu CVR thấp: Sửa lại screenshot đầu của store; Nếu D1 thấp: Rút ngắn tutorial." | Có kịch bản sửa lỗi sản phẩm/onboarding cụ thể thay vì đổ lỗi cho kênh quảng cáo. |

---

## Bảng so sánh 3 kịch bản giả thuyết điển hình (Chart/visual/table)

Bảng so sánh độ tự tin (Confidence) và đặc điểm của 3 nhóm giả thuyết phổ biến cho game puzzle:

| Nhóm giả thuyết | Player Motivation | Độ khó setup ad | Độ khó đo lường | Điểm tự tin (1-5) | Rủi ro chính |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **A: Calming Relax** | Nghỉ não, giảm stress | Thấp | Thấp | **4/5** | Churn cao nếu game có ad interstitial quá sớm gây đứt mạch. |
| **B: Satisfying Clear** | Sắp xếp, dọn dẹp board | Trung bình | Thấp | **5/5** | Visual combo của game thật không đã mắt bằng ad. |
| **C: Brain Challenge** | Chinh phục, trí tuệ cao | Thấp | Trung bình | **3/5** | Game quá khó làm người chơi chán nản thoát ngay ở Level 3. |

:::chart
title: Điểm tự tin của các kịch bản giả thuyết (Confidence Score, 1-5)
Calming Relax|4|Audience clear, easy to prove gameplay
Satisfying Clear|5|Strong visual hook, matches core puzzle loop
Brain Challenge|3|High CTR possible, but high risk of early churn
:::

*Cách đọc chart*: Hãy ưu tiên chọn kịch bản giả thuyết có điểm tự tin cao nhất (ở đây là **Satisfying Clear**) để chạy vòng thử nghiệm $100-500 đầu tiên, vì nó dễ kiểm chứng và ít rủi ro sản xuất nhất.

---

## Hướng dẫn đọc số và chẩn đoán giả thuyết (Decision Ranges)

> [!WARNING]
> **Lưu ý quan trọng cho học viên non-UA**:
> Các con số dưới đây (CTR 2.2%, CVR 25%, D1 30%) chỉ là **ngưỡng quyết định giả định (scenario-specific decision ranges)** phục vụ cho ví dụ minh họa của một game puzzle thư giãn cụ thể. Đây **KHÔNG** phải là các chỉ số chuẩn tuyệt đối áp dụng cho mọi game. Mỗi trò chơi tùy thuộc vào dung lượng build, thiết kế ad, và đối tượng mục tiêu sẽ có các khoảng ra quyết định (decision ranges) khác nhau.

Hãy chẩn đoán kết quả chạy test giả thuyết theo bảng quy tắc quyết định sau:

| Pattern số liệu | Chẩn đoán (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR > 2.5%** (Ad đạt)<br>**Store CVR < 15%** (Store gãy) | Lời hứa của ad kéo click tốt nhưng store listing không củng cố lời hứa đó. | Tạm dừng ad, sửa lại screenshot/icon trên store cho khớp video. | Đổi ad group hoặc target đối tượng mới. |
| **CTR < 1.2%** (Ad gãy)<br>**D1 > 35%** (Game đạt) | Sản phẩm thực tế giữ chân rất tốt nhưng video quảng cáo quá mờ nhạt. | Làm lại ad hook 3 giây đầu tiên để giật sự chú ý. | Sửa lại gameplay hoặc tutorial của game. |
| **CTR > 2.2%**, **CVR > 25%** (Đầu phễu tốt)<br>**D1 < 15%** (Cuối phễu gãy) | Ad và store đồng bộ tốt nhưng phiên chơi đầu (first session) thất bại. | Sửa onboarding, kiểm tra độ khó Level 1-5, rút ngắn tutorial. | Tăng ngân sách chạy tiếp vì thấy CPI rẻ. |

---

## Worked example: Xây dựng và Chẩn đoán giả thuyết cho Calming Block Puzzle

Giả sử bạn chạy một đợt test $300 cho game xếp hình khối màu sắc nhẹ nhàng (Calming Block Puzzle) với thẻ giả thuyết sau:

```text
- Player: Người chơi casual tìm kiếm khoảng nghỉ não nhanh (calm brain break).
- Promise: Hook "Trò chơi dọn dẹp khối gỗ 2 phút thư giãn".
- Channel: Meta Social (Facebook Ads).
- Metric Target (Giả định riêng cho game này): CTR > 2.0%, Store CVR > 22%, D1 > 30%.
- Action Plan: Nếu D1 < 20%, tiến hành sửa lại Flow hướng dẫn tân thủ (tutorial) trước khi thay đổi video.
```

**Báo cáo thực tế sau 5 ngày chạy test**:
- Ngân sách tiêu: $220.
- Số lượt hiển thị: 80,000.
- Lượt click: 1,920 (CTR = 2.4% - *Đạt mục tiêu*).
- Số lượt cài đặt: 307 (Store CVR = 16% - *Không đạt, mục tiêu là 22%*).
- Tỷ lệ hoàn thành Tutorial: 72% (*Khá tốt*).
- Retention D1: 28% (*Gần đạt mục tiêu 30%*).

**Phân tích chẩn đoán & Tradeoff**:
*   Người chơi click nhiều (CTR 2.4%) chứng minh ad hook nói trúng nhu cầu thư giãn. 
*   Tuy nhiên, điểm rò rỉ nghiêm trọng là trang store (CVR 16% so với ngưỡng mong muốn 22%). Học viên cần phân tích sự đánh đổi: nếu tiếp tục chạy ad, giá install (CPI) sẽ rất đắt do store chuyển đổi kém. Hành động khôn ngoan nhất là tạm dừng ad để bảo toàn ngân sách.
*   **Hành động tiếp theo**: Tắt chiến dịch ad ngay. Không sửa game. Tiến hành thay thế 3 ảnh chụp màn hình đầu tiên trên store bằng ảnh hiển thị bàn chơi gỗ sạch sẽ và dòng text nhấn mạnh "Chơi offline, không áp lực thời gian". Sau đó mới bật lại test với $80 còn lại.

---

## Checklist vận hành kỹ thuật (Implementation checklist)

Đảm bảo các đầu việc kỹ thuật này phải sạch sẽ trước khi bấm nút chạy thử nghiệm:

| Hạng mục | Trạng thái cần có | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Trình theo dõi (Attribution)** | Đã test thử link tải quảng cáo và Firebase/Unity Analytics nhận đúng event `first_open`. | Không thể đo lường được install thuộc về ad group nào, mất dấu phễu. |
| **2. Event Taxonomy** | Đã nhúng đúng các event snake_case: `tutorial_start`, `tutorial_complete`, `level_complete`. | Không chẩn đoán được người chơi thoát game do tutorial khó hay do màn chơi lỗi. |
| **3. Giới hạn ngày (Daily Cap)** | Đã cấu hình ngân sách giới hạn ngày $15-30/ngày. | Tài khoản bị cắn hết $300 trong vòng vài tiếng do thuật toán phân phối quá nhanh, mất cơ hội học hỏi. |
| **4. Người chốt (Decision Owner)** | Xác định rõ 1 thành viên chịu trách nhiệm tắt/bật chiến dịch theo đúng rules đã ghi. | Quảng cáo chạy quá stop-loss mà không ai tắt do bận tranh cãi sửa game hay sửa ad. |

---

## Real usecases đã đối chiếu nguồn

### Global Case study: Royal Match

![Royal Match public Google Play screenshot](content/assets/usecases/royal-match.png)

> [!NOTE]
> **Hướng dẫn đọc Ảnh minh họa (Screenshot Readout Table)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát screenshot đầu tiên trên store hiển thị trực tiếp bàn cứu Vua Robert và dòng chữ "No Ads, No Wifi".
> *   **Kết luận rút ra (Conclude)**: Dream Games thiết kế store để củng cố ngay lập tức thông điệp cốt lõi từ video quảng cáo kéo chốt. Sự đồng bộ tuyệt đối này tạo ra một tín hiệu định hướng (directional signal) mạnh mẽ giúp giảm thiểu rò rỉ từ click sang cài đặt.
> *   **Không được suy ra (Do not infer)**: Không được suy ra rằng bạn bắt buộc phải làm game cứu vua hoặc copy y hệt layout này thì game mới thành công. Yếu tố cốt lõi cần học hỏi là **sự đồng bộ thông điệp**, không phải sao chép gameplay.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Royal Match (phát hành bởi Dream Games) đạt được hiệu quả UA vượt trội nhờ đồng bộ hóa triệt để visual assets trên store với các video ad kéo chốt cứu Robert phổ biến. Nguồn: [Phân tích sự ra mắt của Royal Match trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/3/11/royal-match) | Đây là minh chứng thực tế cho thấy sự liên tục của giả thuyết (ad promise -> store proof -> gameplay proof) giúp bảo vệ hiệu suất phễu chuyển đổi. | Không tự suy diễn rằng game indie puzzle nhỏ có thể scale ngân sách khổng lồ hoặc đạt kết quả nhanh chóng như Dream Games. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Giả thuyết thiếu điều kiện hành động (Decision Rule)**
    *   *Correction*: Luôn viết sẵn hành động sửa đổi tương ứng: *"Nếu metric A dưới X%, chúng tôi sẽ làm hành động B"*. Đừng để đến khi số liệu về mới bắt đầu suy nghĩ.
*   **Mistake 2: Test quá nhiều creative hook khác nhau cùng lúc**
    *   *Correction*: Với budget $300, giới hạn tối đa 2 nhóm giả thuyết (ad angles) để đảm bảo mỗi nhóm nhận đủ lượng conversion tối thiểu phục vụ chẩn đoán.
*   **Mistake 3: Đọc sai tín hiệu do quên cảnh báo bẫy Clickbait**
    *   *Correction*: CTR cao vọt (>5%) từ ad giả gameplay (fake ad) không phải là dấu hiệu chiến thắng nếu store CVR và D1 của bạn bị gãy. Hãy luôn đánh giá chéo cả chuỗi metric.

---

## English Terms You Should Keep

*   **UA**: User Acquisition (Hoạt động thu hút người dùng mới).
*   **Funnel**: Phễu chuyển đổi từ click ad đến trải nghiệm game.
*   **Soft launch**: Giai đoạn phát hành thử nghiệm hẹp để đo lường.
*   **daily cap**: Giới hạn ngân sách chi tiêu tối đa mỗi ngày.
*   **stop-loss rule**: Ngưỡng cắt lỗ tự động để bảo vệ ngân sách.

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Thẻ giả thuyết UA (First UA Hypothesis Card Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                      FIRST UA HYPOTHESIS CARD                          │
├────────────────────────────────────────────────────────────────────────┤
│ Motivation: Satisfying Clear                                           │
│ Player: Casual gamers who love organizing chaotic boards               │
│ Promise: "Clean the board in 3 smart taps" video creative              │
│ Channel: Meta-style social (Facebook Ads)                              │
│ Metrics: CTR > 2.0% | Store CVR > 22% | D1 > 28%                       │
│ Fail-safe: If CVR < 18%, pause and update Play Store main screenshot  │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu Thẻ giả thuyết UA dạng bảng hoàn chỉnh mà học viên cần điền:

| Field | Dữ liệu đầu ra mẫu (Lab Output) |
| --- | --- |
| **Primary motivation** | Satisfying Clear |
| **Player Statement** | Casual gamers who love sorting and organizing chaotic boards. |
| **Ad Hook Promise** | "Clean the board in 3 smart taps" video creative. |
| **Test Channel** | Meta-style social (Facebook Ads). |
| **Verification Metrics** | CTR > 2.0%, Store CVR > 22%, D1 > 28% (Scenario-specific targets). |
| **If CTR is weak (<1.5%)** | Remake the first 3 seconds of the video showing the combo explosion. |
| **If Store CVR is weak (<18%)** | Replace the main store screenshot with a clear before/after cleaning comparison. |
| **If D1 is weak (<20%)** | Streamline level 1-3 pacing and make combos easier to achieve. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Sử dụng khung mẫu ở trên để viết Thẻ giả thuyết UA đầu tiên cho game puzzle của bạn.
2.  Xác định đúng 3 ngưỡng chỉ số quyết định (CTR, Store CVR, D1) mà bạn hướng tới (đây là scenario-specific range riêng cho game của bạn).
3.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Hypothesis Quality Chain Check)** dưới đây để tự duyệt thẻ:
    *   *Player check*: Bạn đã định nghĩa người chơi theo hành vi/động lực cụ thể thay vì tuổi tác chưa? (Đạt/Không)
    *   *Promise check*: Video ad của bạn có cam kết duy nhất một core action tương ứng với động lực đó không? (Đạt/Không)
    *   *Channel check*: Kênh quảng cáo đã chọn có tối ưu nhất để trả lời câu hỏi học hỏi nhanh nhất không? (Đạt/Không)
    *   *Action check*: Bạn đã ghi rõ hành động sửa game/store cụ thể tương ứng cho từng chỉ số bị gãy chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **hypothesis** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Primary Motivation: [Motivation chính của game]
- Player: [Chân dung đối tượng dựa trên hành vi]
- Ad Hook Promise: [Lời hứa ad hook chính]
- Test Channel: [Kênh lựa chọn chạy thử]
- Verification Targets: [Ngưỡng CTR, CVR, D1 tối thiểu]
- Action Plan - Weak CTR: [Sửa creative như thế nào]
- Action Plan - Weak CVR: [Sửa store page như thế nào]
- Action Plan - Weak D1: [Sửa onboarding/gameplay như thế nào]
```

---

## Checklist Focus

*   [ ] Đã viết giả thuyết UA hoàn chỉnh gồm đầy đủ 5 dòng.
*   [ ] Đã cấu hình ngưỡng chỉ số metric chẩn đoán đi kèm quy tắc quyết định (decision rules).
*   [ ] Đã hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Hypothesis Quality Chain Check).
*   [ ] Đã cập nhật trường giả thuyết vào Final UA Plan.

---

## Curated References

*   [Phân tích sự ra mắt của Royal Match trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/3/11/royal-match)
*   Tài liệu hướng dẫn tối ưu hóa store listing của Google Play Console.
', now()),
  ('lessons/day-08.md', 'markdown', null, '---
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
', now()),
  ('lessons/day-09.md', 'markdown', null, '---
day: 9
title: "CPI, CTR, CVR and IPM without vanity traps"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, CTR, CVR, IPM]
artifact: "Acquisition signal readout"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Acquisition signal readout**: biểu mẫu đọc nhanh tín hiệu đầu phễu thu hút, giúp bóc tách giữa chỉ số ảo (vanity metrics) và chất lượng chuyển đổi thực tế.

Kết quả đạt được:
- Phân biệt rõ sự khác nhau giữa click tò mò và click có chất lượng cài đặt.
- Biết cách chẩn đoán mối quan hệ tương hỗ giữa CTR (Tỷ lệ click ad) và CVR (Tỷ lệ cài đặt store).
- Áp dụng công thức tính toán IPM (Installs Per Mille) làm thước đo hiệu suất phân phối tổng thể.
- Cập nhật các khoảng số liệu acquisition vào Final UA Plan.

---

## Why this matters

Trong giai đoạn đầu chạy test với ngân sách nhỏ $100-500, lỗi phổ biến nhất của các nhà phát triển là **bị đánh lừa bởi chỉ số CTR cao vọt**. 

Khi bạn làm một video ad giật gân, phi thực tế (clickbait) kiểu cứu người hoặc rút chốt sai luật, người xem sẽ click rất nhiều vì tò mò. Số liệu hiển thị trên dashboard sẽ rất đẹp: CTR lên tới `4.5%`, giá click (CPC) cực rẻ. Tuy nhiên, khi họ chuyển tới Google Play store và nhận ra gameplay thực tế chỉ là một game xếp gỗ (block puzzle) bình thường, họ sẽ rời đi ngay lập tức mà không tải game. 

Nếu bạn chỉ nhìn vào CTR cao và CPI rẻ để scale ngân sách, bạn đang tự ném tiền qua cửa sổ. Bạn cần một bộ lọc chẩn đoán để phát hiện và loại bỏ các "bẫy chỉ số ảo" này.

---

## Core model: Vòng lặp chuyển đổi đầu phễu (CTR, CVR, IPM, CPI)

Để chẩn đoán chính xác, hãy theo dõi dòng chảy của 4 chỉ số cốt lõi này theo chuỗi liên tục:

$$\text{Impressions} \xrightarrow{\text{CTR}} \text{Clicks} \xrightarrow{\text{Store CVR}} \text{Installs}$$

*   **CTR (Click-Through Rate)**: Thước đo sức hút của video quảng cáo đối với người dùng lướt feed.
*   **Store CVR (Conversion Rate)**: Thước đo mức độ đồng bộ giữa quảng cáo và nội dung cửa hàng.
*   **IPM (Installs Per Mille)**: Số lượt cài đặt thu được trên mỗi 1,000 lượt hiển thị ad. Đây là chỉ số quan trọng nhất phản ánh hiệu năng phân phối thực tế của platform.
    
    $$\text{IPM} = \text{CTR} \times \text{Store CVR} \times 10$$

*   **CPI (Cost Per Install)**: Chi phí trung bình để có một người chơi cài đặt game thật sự.

---

## Khung chẩn đoán phễu rò rỉ mẫu (Main framework/map mẫu)

Dưới đây là khung phân loại các tình huống phễu đầu vào điển hình giúp bạn xác định lỗi nằm ở đâu:

| Kịch bản phễu | CTR (Ad Click) | Store CVR (Tải game) | IPM (Hiệu năng) | Chẩn đoán lỗi (Diagnosis) |
| :--- | :---: | :---: | :---: | :--- |
| **A. Clickbait Trap** | Cao bất thường so với các creative còn lại | Rất thấp so với mức store page thường đạt | IPM tụt dù CTR đẹp | Mismatch lớn: Ad hứa hẹn quá đà, Store phơi bày gameplay thật làm người dùng thất vọng. |
| **B. Weak Creative** | Thấp hơn mặt bằng test hiện tại | CVR vẫn giữ ổn hoặc cao | IPM thấp do thiếu click chất lượng | Ad quá mờ nhạt hoặc không có hook, nhưng Store page thiết kế rất đẹp và uy tín. |
| **C. Healthy Funnel** | Không cần cao nhất, nhưng ổn định | CVR giữ được sau khi scale nhẹ | IPM tăng cùng phân phối | Đồng bộ tốt: Người chơi click vì tò mò và tải game vì thấy store củng cố đúng lời hứa. |

---

## Sơ đồ Quy trình Chẩn đoán Vanity Traps (Hero visual or operating diagram)

Sơ đồ quyết định dưới đây giúp bạn từng bước kiểm tra xem chiến dịch có đang rơi vào bẫy chỉ số ảo hay không:

![Vanity trap diagnosis tree](content/assets/usecases/day-09-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình chẩn đoán (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Các ngả rẽ từ mốc kiểm tra CTR đầu tiên. Nếu CTR cao, sơ đồ ép bạn phải kiểm tra chéo Store CVR trước khi đưa ra kết luận.
> *   **Kết luận rút ra (Conclude)**: CTR cao chỉ thực sự có giá trị khi Store CVR không sụp mạnh so với các creative hoặc store listing khác cùng đợt test. Nếu CVR tụt sâu trong khi CTR tăng vọt, khả năng rất cao bạn đang gặp bẫy Clickbait.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng nếu CTR thấp thì bắt buộc phải tắt game. Hãy kiểm tra xem store CVR có tốt không; nếu store CVR rất cao, bạn chỉ cần sửa lại video quảng cáo mà không cần động vào gameplay.

---

## Biểu đồ so sánh 3 kịch bản phễu đầu vào (Chart/visual/table)

Biểu đồ dưới đây thể hiện sự phân bổ IPM thực tế của 3 kịch bản phễu đầu vào:

![funnel scenarios comparison](content/assets/usecases/day-09-data-visual.png)

:::chart
title: Chỉ số IPM thực tế của các kịch bản phễu (Target IPM, cao là tốt)
Clickbait Trap|8|High CTR but CVR collapse leads to poor distribution efficiency
Weak Creative|6|Weak ad pull but store listing holds conversion well
Healthy Funnel|18|High ad engagement and store trust sync perfectly
:::

*Cách đọc chart*: Hãy hướng tới việc tối ưu hóa **IPM tổng thể theo tương quan giữa các creative trong cùng đợt test**. Một game có CTR trung bình nhưng store CVR cao sẽ có IPM thực tế tốt hơn nhiều so với game chạy ad clickbait có CTR cao vọt nhưng store CVR sụp đổ.

---

## Hướng dẫn đọc số và chẩn đoán

Hãy áp dụng bảng chẩn đoán 4 cột dưới đây để xử lý kết quả chạy chiến dịch:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **CTR = 4.2%**<br>**Store CVR = 8%** | **Clickbait Trap**: Ad kéo click ảo quá nhiều, store không đáp ứng nổi kỳ vọng. | Tắt video ad đó ngay lập tức. Làm lại video bám sát gameplay thật hơn. | Đổ thêm ngân sách vì thấy giá mỗi click (CPC) quá rẻ. |
| **CTR = 0.8%**<br>**Store CVR = 28%** | **Weak Visual Hook**: Video quảng cáo thiếu 3 giây đầu gây chú ý, nhưng store listing chuyển đổi rất tốt. | Thay thế cảnh mở đầu (intro/hook) của ad bằng visual combo nổ rực rỡ hơn. | Tiến hành sửa đổi gameplay hoặc tutorial của game. |
| **CTR = 2.4%**<br>**Store CVR = 25%** | **Healthy Sync**: Ad và store đang bổ trợ cho nhau rất tốt. | Giữ nguyên chiến dịch, theo dõi tiếp retention D1 để đánh giá chất lượng người chơi. | Vội vã thay đổi video ad mới để tìm kiếm CTR cao hơn nữa. |

---

## Worked example: Hexa Block Puzzle

Một nhóm phát triển Unity chạy test $150 cho tựa game xếp hình lục giác (Hexa Block Puzzle) với hai video quảng cáo khác nhau:
- **Creative A (Ad rút chốt giả cứu nhân vật)**: CTR đạt `4.8%`, CPC = `$0.05`.
- **Creative B (Ad gameplay thật xếp hình hex nổ combo)**: CTR đạt `1.8%`, CPC = `$0.18`.

**Báo cáo phễu thực tế sau 3 ngày**:

| Chỉ số phễu | Creative A (Fake Ad) | Creative B (Real Gameplay Ad) | Điểm so sánh nên dùng |
| :--- | :---: | :---: | :---: |
| **CTR** | **4.8%** (Cao bất thường) | 1.8% (Không nổi bật nhưng dùng được) | So với mặt bằng creative đang test |
| **Store CVR** | **6%** (Gãy mạnh) | **28%** (Giữ ổn) | So với baseline store hiện tại |
| **IPM** | **2.88** (Kém) | **5.04** (Tốt hơn rõ rệt) | So với creative sibling cùng ngân sách |
| **D1 Retention** | **8%** (Rụng mạnh) | **32%** (Tín hiệu khá) | So với build puzzle prototype hiện tại |

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Creative A trông có vẻ rất rẻ trên phương diện thu hút đầu vào (CTR 4.8%). Nhưng thực tế nó mang lại tỷ lệ cài đặt cực thấp (CVR 6%) và giữ chân D1 thảm hại (8%) vì người chơi cảm thấy bị lừa dối.
*   Creative B có CPI cao hơn lúc đầu, nhưng mang lại người chơi thực sự chất lượng (D1 = 32%). IPM của Creative B (5.04) cao gấp đôi Creative A, chứng minh máy học của ad network sẽ phân phối Creative B hiệu quả hơn theo thời gian.
*   **Quyết định**: Tắt bỏ hoàn toàn Creative A. Giữ lại Creative B và tiến hành nhân bản thêm 2 biến thể khác xoay quanh hook nổ combo của Creative B.

---

## Checklist kỹ thuật phễu đầu vào (Implementation checklist)

Đảm bảo các hạng mục kỹ thuật này hoạt động chính xác trước khi bật campaign:

| Hạng mục | Trạng thái cần đạt | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Dynamic link tracking** | URL chạy chiến dịch đã test thử trên thiết bị thật và nhận diện đúng nguồn phân nhóm. | Mất dấu dữ liệu, ad network không phân biệt được lượt click đến từ creative nào. |
| **2. Store listing alignment** | 3 ảnh screenshots đầu tiên trên store hiển thị bàn chơi xếp hình tương thích màu sắc với ad. | Người dùng click vào store thấy đồ họa khác lạ sẽ thoát ra ngay lập tức. |
| **3. IP Filter exclusion** | Đã cấu hình loại bỏ IP của văn phòng/thành viên team trong phần đo lường quảng cáo. | Số liệu CTR và click bị nhiễu do chính người trong nhà tự click kiểm thử game. |

---

## Real usecases đã đối chiếu nguồn

### Case Study: Pattern đồng bộ ad-to-store trong casual puzzle

![Merge Mansion public ad gameplay sync screenshot](content/assets/usecases/merge-mansion.png)

> [!NOTE]
> **Hướng dẫn đọc Ảnh chụp cửa hàng (Merge Mansion Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát nút cài đặt (Install) nổi bật bên cạnh phần thiết kế bảng ghép đồ vật (Merge Board) mang phong cách dọn dẹp, tái tạo vườn tược. Đây là một minh họa mẫu về thiết kế trang store để chuyển đổi.
> *   **Kết luận rút ra (Conclude)**: Trang cửa hàng thể hiện trực tiếp yếu tố "giải đố và trang trí" vốn là cốt lõi của ad creative (hứa hẹn dọn dẹp biệt thự), giúp bảo vệ Store CVR trước tệp người dùng click từ video quảng cáo.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng game của bạn cũng tự động có CVR cao nếu chỉ thiết kế board state đơn giản mà thiếu sự đồng bộ thông điệp với ad. Yếu tố mấu chốt là **sự đồng bộ**, không phải kiểu đồ họa.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Bài phân tích về *Merge Mansion* trên Deconstructor of Fun mô tả cách ad drama chỉ tạo giá trị khi phần store/onboarding tiếp tục nuôi cùng fantasy người chơi đã click vào. Nguồn: [Chiến dịch UA của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) | Một video ad có CTR cao chỉ thực sự tạo ra giá trị khi store listing củng cố được thông điệp của ad đó để duy trì Store CVR ổn định. | Không tự suy diễn rằng game của bạn cứ chạy quảng cáo kịch tính là sẽ thành công nếu store listing hiển thị một bàn chơi giải đố khô khan không liên quan. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Đánh giá chiến dịch dựa trên chi phí click (CPC) rẻ**
    *   *Correction*: CPC rẻ là vô nghĩa nếu CVR của store bằng 0. Luôn luôn lấy chỉ số cài đặt thật (CPI) làm thước đo chi phí đầu tiên.
*   **Mistake 2: Dùng ad clickbait nhưng store listing hiển thị gameplay thật thô sơ**
    *   *Correction*: Nếu dùng ad dạng hook phóng đại, store bắt buộc phải có ít nhất 1-2 screenshots thiết kế theo phong cách của ad để chuyển tiếp tâm lý mượt mà cho người dùng.
*   **Mistake 3: Không tính toán chỉ số IPM khi đọc dashboard**
    *   *Correction*: Luôn tính toán IPM định kỳ. Nếu IPM nằm dưới rõ rệt so với các creative sibling hoặc tụt mạnh sau khi CTR tăng, hãy coi đó là cảnh báo ad network đang gặp vấn đề về chất lượng chuyển đổi.

---

## English Terms You Should Keep

*   **CTR**: Click-Through Rate (Tỷ lệ click chuột trên lượt hiển thị quảng cáo).
*   **CVR**: Conversion Rate (Tỷ lệ chuyển đổi người click thành người cài đặt game).
*   **IPM**: Installs Per Mille (Số lượt cài đặt tạo ra trên mỗi 1,000 lượt hiển thị quảng cáo).
*   **CPI**: Cost Per Install (Chi phí mua một lượt cài đặt game).
*   **vanity metrics**: Chỉ số ảo (chỉ số trông đẹp mắt nhưng không tạo ra giá trị kinh tế thực tế).

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Bảng chẩn đoán Tín hiệu (Acquisition Signal Readout Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                      ACQUISITION SIGNAL READOUT                        │
├────────────────────────────────────────────────────────────────────────┤
│ Ad Angle: "Satisfying sorting blocks combo"                            │
│ Ad CTR: 2.4% (Target: >2.0%) | Status: PASS                            │
│ Store CVR: 26% (Target: >22%) | Status: PASS                            │
│ Calculated IPM: 6.24 (Target: >5.0) | Status: PASS                     │
│ CPI actual: $0.38 (Expected range: $0.35 - $0.50)                      │
│ Diagnosis: Healthy Sync. Keep campaign active and monitor Day 1.       │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu Acquisition signal readout hoàn chỉnh dạng bảng mà học viên cần điền:

| Thành phần chiến dịch | Chỉ số thực tế thu về | Ngưỡng mục tiêu giả định | Trạng thái đạt/không | Hành động chẩn đoán tiếp theo |
| :--- | :---: | :---: | :---: | :--- |
| **Video Ad 1 (Satisfying Sort)** | CTR = 2.4% | CTR > 2.0% | **ĐẠT** | Giữ nguyên video ad, theo dõi tiếp store. |
| **Store Listing (Google Play)** | CVR = 26% | CVR > 22% | **ĐẠT** | Phễu đầu vào tốt, tiếp tục chạy chiến dịch. |
| **Hiệu suất phân phối** | IPM = 6.24 | IPM > 5.0 | **ĐẠT** | Phù hợp thuật toán tự động tối ưu của platform. |
| **Chi phí mua cài đặt** | CPI = $0.38 | CPI < $0.45 | **ĐẠT** | Đạt chỉ tiêu ngân sách thử nghiệm hẹp. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh biểu mẫu chẩn đoán tín hiệu đầu phễu của game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Acquisition Quality Chain Check)** dưới đây để tự duyệt:
    *   *Kiểm định liên kết*: Các số liệu CTR và Store CVR có được thu thập từ cùng một ad group cụ thể không (tránh lấy trung bình cộng toàn tài khoản)? (Đạt/Không)
    *   *Tính toán IPM*: Đã tự áp dụng công thức tính IPM thực tế để kiểm tra hiệu năng ad network chưa? (Đạt/Không)
    *   *Đối chiếu mismatch*: Nếu CVR dưới ngưỡng, đã lập kế hoạch thay đổi ảnh store screenshot cụ thể nào chưa? (Đạt/Không)
    *   *Loại trừ nhiễu*: Đã bật bộ lọc IP văn phòng để đảm bảo click thật của người dùng ngoài chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **acquisition_targets** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Target CTR: [Ngưỡng CTR mong muốn cho video ad]
- Target Store CVR: [Ngưỡng CVR mong muốn cho Play Store]
- Expected IPM ceiling: [Ngưỡng IPM tối thiểu chấp nhận]
- Expected CPI range: [Khoảng giá CPI mong muốn]
- Funnel Mismatch Action: [Sửa creative hay sửa store khi CVR gãy]
```

---

## Checklist Focus

*   [ ] Thiết lập đầy đủ các ngưỡng chỉ số đầu phễu dưới dạng khoảng quyết định cụ thể.
*   [ ] Thực hiện tính toán IPM cho ít nhất 2 nhóm ad creatives khác nhau.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Acquisition Quality Chain Check).
*   [ ] Cập nhật trường acquisition_targets vào Final UA Plan.

---

## Curated References

*   [Chiến dịch UA của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion)
*   Tài liệu hướng dẫn đọc chỉ số CTR và CVR trên Google Play Console.
', now()),
  ('lessons/day-10.md', 'markdown', null, '---
day: 10
title: "Retention cohorts and first-session proof"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Retention, Cohort, Onboarding]
artifact: "First-session proof checklist"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **First-session proof checklist**: danh mục kiểm định chất lượng trải nghiệm của người chơi trong 5 phút đầu tiên (first session) để bảo vệ tỷ lệ giữ chân Day 1 (D1 Retention).

Kết quả đạt được:
- Hiểu cách đọc biểu đồ Retention Decay (Đường cong suy giảm giữ chân).
- Nhúng đúng các sự kiện phân tích (analytics events) theo chuẩn để đo lường phễu onboarding.
- Nhận diện điểm rò rỉ người chơi trong màn hướng dẫn (tutorial) hoặc độ khó Level 1-5.
- Cập nhật danh mục kiểm tra onboarding và theo dõi sự kiện vào Final UA Plan.

---

## Why this matters

Nếu bạn chạy thử nghiệm quảng cáo và thấy D1 Retention rớt xuống mức `12%` trong khi các build prototype puzzle trước đó của bạn thường giữ được cao hơn đáng kể, phản ứng đầu tiên của bạn sẽ là gì? 

Hầu hết các nhà phát triển thiếu kinh nghiệm UA sẽ lập tức đổi lỗi cho **chất lượng kênh quảng cáo kém** (traffic rác) hoặc video quảng cáo không thu hút. Họ tắt campaign và chuyển sang test ad network khác. Đây là một sai lầm rất tốn kém. 

Dữ liệu thực tế cho thấy: phần lớn các trường hợp gãy D1 retention ở giai đoạn prototype sớm đều bắt nguồn từ **trải nghiệm chơi game phiên đầu tiên (first session) thất bại**. Người chơi tải game về, mở lên và gặp lỗi crash, hoặc bị kẹt trong màn tutorial kéo dài quá 2 phút chứa nhiều chữ hướng dẫn tẻ nhạt. Họ tắt game và không bao giờ mở lại. Để phát hiện điểm nghẽn này, bạn bắt buộc phải đo lường phễu onboarding phiên đầu tiên.

---

## Core model: Vòng lặp phiên đầu (First-session loop)

Một người chơi mới cài đặt game sẽ trải qua phễu trải nghiệm 4 bước quyết định trong phiên chơi đầu tiên:

$$\text{App Launch} \rightarrow \text{Tutorial Start} \rightarrow \text{Tutorial Complete} \rightarrow \text{Level 3 Reach}$$

*   **App Launch (Mở máy)**: Đảm bảo thời gian tải (loading time) dưới 5 giây và không bị crash thiết bị.
*   **Tutorial Start (Bắt đầu hướng dẫn)**: Giới thiệu ngay lập tức cơ chế điều khiển trực quan (Core Action).
*   **Tutorial Complete (Hoàn thành hướng dẫn)**: Người chơi có được cảm giác chiến thắng đầu tiên (First Win Clarity).
*   **Level 3 Reach (Chạm mốc Level 3)**: Người chơi bắt đầu hiểu nhịp độ chơi game tự do (Core Loop) trước khi tắt ứng dụng.

---

## Khung danh mục kiểm tra onboarding mẫu (Main framework/map mẫu)

Dưới đây là khung phân loại các sự kiện đo lường hành trình phiên đầu tiên để khoanh vùng điểm rò rỉ (Ví dụ mốc số liệu mục tiêu cho thể loại Hexa Puzzle):

| Bước phễu | Tên Event chuẩn (Unity) | Khoảng mục tiêu tối ưu | Điểm rò rỉ (Friction Point) | Cách khắc phục |
| :--- | :--- | :---: | :--- | :--- |
| **1. Mở app** | `first_open` | `98% - 100%` | Game crash trên các dòng máy Android Ram 3GB. | Tối ưu hóa bộ nhớ, sửa lỗi crash khởi động. |
| **2. Bắt đầu** | `tutorial_start` | `90% - 95%` | Thời gian loading màn hình đầu tiên quá 10 giây. | Giảm dung lượng asset tải ban đầu (AssetBundles). |
| **3. Xong HD** | `tutorial_complete` | `80% - 85%` | Hướng dẫn chữ quá nhiều, không cho người chơi tự click. | Bỏ text popup, dùng chỉ tay visual nhấp nháy động. |
| **4. Qua level** | `level_complete` (Level 3) | `65% - 70%` | Level 3 tăng độ khó quá nhanh làm người chơi bế tắc. | Làm Level 1-5 cực kỳ dễ để tạo cảm giác chiến thắng. |

---

## Sơ đồ Quy trình Retention Decay (Hero visual or operating diagram)

Biểu đồ dưới đây minh họa sự khác biệt giữa đường cong giữ chân bị gãy do onboarding lỗi và đường cong giữ chân khỏe mạnh:

![Retention decay curve comparison](content/assets/usecases/day-10-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Biểu đồ Retention Decay (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Trục hoành là số ngày (từ Day 0 đến Day 7), trục tung là tỷ lệ % người chơi ở lại. Nhìn vào đường cong màu tím (Onboarding Friction) dốc thẳng xuống ở Day 1 so với đường màu xanh (Healthy Retention) đi ngang thoải hơn.
> *   **Kết luận rút ra (Conclude)**: Sự sụt giảm đột ngột từ Day 0 sang Day 1 so với cohort hoặc build trước đó thường là dấu hiệu mạnh cho thấy phễu phiên chơi đầu tiên bị gãy. Nếu người dùng vượt qua Day 1 thành công, tốc độ suy giảm các ngày sau đó thường sẽ chậm và ổn định hơn.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng nếu Day 7 retention thấp là do game thiếu tính năng endgame. Ở giai đoạn prototype hẹp, D7 thấp hầu hết là do Day 1 đã quá thấp ngay từ đầu.

---

## Biểu đồ phễu tiến trình phiên đầu (Chart/visual/table)

Biểu đồ dưới đây thể hiện tỷ lệ rớt người chơi qua từng bước của phễu phiên chơi đầu tiên:

![First session progression funnel](content/assets/usecases/day-10-data-visual.png)

:::chart
title: Tỷ lệ hoàn thành qua các bước onboarding (%)
App Launch|100|Base cohort of players installing the game
Tutorial Start|96|Few players drop due to loading time friction
Tutorial Complete|58|Severe drop-off due to confusing tutorial steps
Level 5 Reach|38|Friction at early level difficulty ramp
:::

*Cách đọc chart*: Hãy tập trung tìm kiếm **bước có độ dốc lớn nhất** trên biểu đồ phễu (ở đây là bước từ `Tutorial Start` sang `Tutorial Complete` rớt từ 96% xuống 58%). Đó chính là điểm nghẽn rò rỉ (bottleneck) bạn bắt buộc phải sửa trước tiên.

---

## Hướng dẫn đọc số và chẩn đoán cohort rò rỉ

Hãy áp dụng bảng chẩn đoán 4 cột dưới đây để xử lý dữ liệu cohort retention:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **D1 Retention = 12%**<br>**Tutorial Complete = 42%** | **Tutorial Friction**: Onboarding quá phức tạp hoặc dài dòng khiến người chơi chán nản thoát game. | Viết lại tutorial: giảm tối đa chữ, làm cho các bước kéo/thả tự động và dễ dàng. | Tắt chiến dịch ad hoặc đổi ad group vì nghĩ traffic kém chất lượng. |
| **D1 Retention = 15%**<br>**Tutorial Complete = 88%** | **Early Difficulty Spike**: Tân thủ vượt qua hướng dẫn dễ dàng nhưng bị bí và thua cuộc ngay ở Level 2 hoặc 3. | Làm giảm độ khó của Level 1-5, đảm bảo người chơi có chuỗi thắng (win streak) liên tục. | Thay đổi video ad mới để kéo tệp người chơi khác. |
| **D1 Retention = 32%**<br>**Tutorial Complete = 85%** | **Healthy Onboarding**: Trải nghiệm tân thủ hoạt động tốt và giữ chân người chơi hiệu quả. | Giữ nguyên onboarding, tiến hành phân tích cohort Day 7 để bắt đầu tối ưu hóa tính năng sâu. | Tiếp tục tinh chỉnh tutorial làm tăng rủi ro phát sinh lỗi bug mới. |

---

## Worked example: Calming Hex Puzzle

Một tựa game xếp hình lục giác thư giãn (Calming Hex Puzzle) chạy thử nghiệm $200 ad thu về 500 lượt cài đặt ngày 05/07. 

**Số liệu chẩn đoán sự kiện báo cáo**:
- Cohort cài đặt ngày 05/07: 500 users.
- `first_open` kích hoạt: 495 users (Đạt).
- `tutorial_start` kích hoạt: 480 users (Đạt).
- `tutorial_complete` kích hoạt: 250 users (Tỷ lệ = 52% - *Thất bại nghiêm trọng so với mức hoàn thành tutorial mà team kỳ vọng cho build này*).
- `level_3_complete` kích hoạt: 120 users (Tỷ lệ = 24% - *Thất bại*).
- D1 Retention thực tế: 11% (*Thất bại rõ rệt so với cohort mục tiêu nội bộ*).

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Mặc dù game tải về mở bình thường, nhưng rò rỉ lớn nhất nằm ở bước hướng dẫn: **48% người chơi đã bỏ cuộc ngay khi đang làm tutorial**.
*   Khi inspect thiết kế: tutorial của game bắt người dùng phải xếp chính xác 3 khối hex phức tạp vào đúng vị trí cố định bằng tiếng Anh kèm nhiều chỉ dẫn dài dòng. Người dùng casual muốn nghỉ não nhanh đã cảm thấy mệt mỏi và thoát game.
*   **Hành động quyết định**: Tạm dừng ad. Chỉnh sửa code game: Thay thế tutorial gò bó bằng cách thả 1 khối lục giác siêu dễ để ăn điểm ngay lập tức trong 5 giây đầu tiên. Xóa bỏ hoàn toàn text box hướng dẫn. Sau đó cập nhật bản build mới và bật lại ad test với ngân sách còn lại.

---

## Danh sách sự kiện Analytics Unity chuẩn (Event Taxonomy)

Hãy nhúng đúng các sự kiện snake_case chuẩn dưới đây vào mã nguồn C# Unity của bạn:

*   `first_open`: Kích hoạt một lần duy nhất khi người chơi mở ứng dụng lần đầu.
*   `tutorial_start`: Kích hoạt khi bảng hướng dẫn đầu tiên hiển thị.
*   `tutorial_complete`: Kích hoạt khi người dùng hoàn thành bước kéo thả cuối cùng của tutorial.
*   `level_complete`: Kích hoạt khi kết thúc màn chơi, ghi kèm thuộc tính `level_number` (ví dụ: `level_number: 1`).

---

## Real usecases đã đối chiếu nguồn

### Case Study: Đo lường Cohort trong Soft Launch của Merge Mansion (Metacore)

![Merge Mansion Onboarding Flow](content/assets/usecases/merge-mansion.png)

> [!NOTE]
> **Hướng dẫn đọc Ảnh minh họa Usecase Onboarding (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát mô hình bảng ghép Merge Board ở nửa dưới screenshot. Chú ý các đường lưới ô được highlight màu hồng, giữ các nút bấm đơn giản, rõ rệt, kết nối trực tiếp với cốt truyện "dọn dẹp khu vườn".
> *   **Kết luận rút ra (Conclude)**: Thiết kế onboarding phiên đầu tiên phải tạo ra phần thưởng nhanh (instant feedback). Việc người chơi kéo thả và hoàn thành nhiệm vụ phụ (dọn cỏ) trong 30 giây đầu tiên củng cố mạnh mẽ D1 Retention cho các cohort mới.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng mọi game giải đố đều phải sử dụng cơ chế kéo thả Merge-2. Các thể loại puzzle khác (như Match-3 hoặc Tap-to-Blast) cần xây dựng các mốc hướng dẫn nhanh tương thích riêng với cơ chế của chúng.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Phân tích về *Merge Mansion* nhấn mạnh một kỷ luật vận hành rất hữu ích: team chỉ nên cho phép scale khi cohort mới chứng minh được onboarding của build hiện tại không bị gãy. Nguồn: [Soft Launch Metrics của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) | Phân tích cohort retention theo ngày cài đặt là thước đo chính xác nhất để chẩn đoán xem onboarding của bản build mới có bị lỗi kỹ thuật hay không. | Không suy ra rằng game của bạn phải dùng đúng cùng một ngưỡng retention với Metacore. Điều quan trọng là tính nhất quán của rule vận hành, không phải copy một con số benchmark. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Đọc số retention trung bình thay vì cohorted retention**
    *   *Correction*: Luôn tách dữ liệu retention theo ngày cài đặt (cohort). Số trung bình sẽ làm lu mờ sự sụt giảm retention đột ngột của một bản build bị lỗi kỹ thuật.
*   **Mistake 2: Thiết kế tutorial dài quá 1 phút đối với game casual puzzle**
    *   *Correction*: Rút ngắn tutorial dưới 30 giây. Cho người chơi trải nghiệm Core Action (kéo thả xếp hình) trong vòng 5 giây đầu tiên sau khi load game.
*   **Mistake 3: Đổi ad group liên tục khi D1 retention thấp**
    *   *Correction*: Nếu tỷ lệ hoàn thành tutorial gãy mạnh ngay trong phễu phiên đầu, khả năng rất cao (trên 90%) lỗi nằm ở game onboarding hoặc early difficulty, không phải ở ad group. Tuy nhiên, trước khi chỉnh sửa game, hãy kiểm thử nhanh trên thiết bị nội bộ để loại trừ 10% khả năng lỗi crash kỹ thuật làm gãy game trên một số dòng hệ điều hành cụ thể.

---

## English Terms You Should Keep

*   **Retention**: Tỷ lệ giữ chân người dùng quay lại game.
*   **Cohort**: Nhóm người dùng có chung một đặc tính (ví dụ: cài đặt cùng ngày 05/07).
*   **Onboarding**: Trải nghiệm hướng dẫn và làm quen ban đầu của người chơi mới.
*   **first session**: Phiên chơi đầu tiên của người dùng ngay sau khi cài đặt.
*   **event taxonomy**: Bảng phân loại danh mục sự kiện đo lường hành vi người chơi.

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Thẻ kiểm tra Phiên đầu (First-session Proof Checklist Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                     FIRST-SESSION PROOF CHECKLIST                      │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Core value delivery: Clear puzzle board in 3 taps                   │
│    Milestone: Win Level 1 | Target: complete in < 20s                  │
│ 2. Loading speed: Loading screen to tutorial start                     │
│    Metric target: < 5s loading on Android 3GB RAM                      │
│ 3. Unity Event Logs:                                                   │
│    - first_open [OK] | - tutorial_start [OK]                           │
│    - tutorial_complete [OK] | - level_complete [OK]                    │
│ 4. Friction action: If tutorial_complete < 75%, skip text dialogs     │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu First-session proof checklist hoàn chỉnh dạng bảng mà học viên cần điền:

| Hạng mục kiểm tra | Chỉ số mục tiêu mong muốn | Sự kiện Unity (Event) | Hành động sửa đổi khi không đạt |
| :--- | :---: | :--- | :--- |
| **Tốc độ tải màn hình đầu** | Loading time < 5 giây | `tutorial_start` | Nén dung lượng texture màn loading. |
| **Tỷ lệ hoàn thành HD** | Hoàn thành > 80% | `tutorial_complete` | Loại bỏ 2 bảng chữ hội thoại hướng dẫn. |
| **Trải nghiệm chiến thắng** | Hoàn thành Level 1 > 75% | `level_complete` (level 1) | Làm các khối màu dễ nhận biết hơn. |
| **Kiểm tra Log hệ thống** | Nhận đủ 4 event chuẩn | Firebase / Unity logs | Test chạy thử trên editor và log debug console. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Thiết lập danh mục kiểm tra onboarding phiên đầu tiên cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Onboarding Quality Chain Check)** dưới đây để tự duyệt:
    *   *Đo lường sự kiện*: Bạn đã chèn mã nguồn Unity kích hoạt đúng 4 sự kiện chuẩn (`first_open`, `tutorial_start`, `tutorial_complete`, `level_complete`) chưa? (Đạt/Không)
    *   *Mốc thời gian*: Thời gian từ khi mở app đến khi người chơi thực hiện Core Action đầu tiên có dưới 15 giây không? (Đạt/Không)
    *   *Độ dốc phễu*: Đã cấu hình dashboard analytics hiển thị biểu đồ phễu onboarding để dễ dàng nhìn ra điểm gãy chưa? (Đạt/Không)
    *   *Kịch bản Rollback*: Nếu D1 retention sụt giảm đột ngột sau khi cập nhật build mới, bạn đã chuẩn bị sẵn phương án rollback bản build cũ chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **retention_targets** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Target D1 retention: [Ngưỡng D1 mong muốn]
- Target D7 retention: [Ngưỡng D7 mong muốn]
- Tutorial completion threshold: [Tỷ lệ hoàn thành tutorial tối thiểu]
- Early funnel check events: [Danh sách event tracking onboarding]
- Onboarding fail mitigation: [Cách sửa game khi tỷ lệ hoàn thành HD thấp]
```

---

## Checklist Focus

*   [ ] Nhúng đầy đủ 4 sự kiện tracking onboarding chuẩn vào mã nguồn Unity.
*   [ ] Xác định rõ ngưỡng tỷ lệ hoàn thành tutorial làm mốc ra quyết định sửa game.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Onboarding Quality Chain Check).
*   [ ] Cập nhật trường retention_targets vào Final UA Plan.

---

## Curated References

*   [Phân tích Soft Launch Metrics của Merge Mansion trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion)
*   Tài liệu tích hợp Unity Analytics và thiết lập custom event tracking.
', now()),
  ('lessons/day-11.md', 'markdown', null, '---
day: 11
title: "ARPDAU, LTV and payback for ads plus light IAP"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ARPDAU, LTV, Payback window]
artifact: "Rough economics note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Rough economics note**: bản phác thảo mô hình kinh tế sơ khởi giúp ước lượng giá trị trọn đời (LTV) của người chơi và xác định trần chi phí cài đặt tối đa (CPI ceiling) cho phép.

Kết quả đạt được:
- Phân tách được hai dòng doanh thu chính: Quảng cáo (Ad Revenue) và Mua hàng trong ứng dụng (IAP).
- Áp dụng công thức tính toán LTV đơn giản dựa trên chỉ số giữ chân (Retention) và doanh thu ngày (ARPDAU).
- Thiết lập 3 kịch bản kinh tế (Conservative, Expected, Optimistic) để làm điểm tựa quản trị rủi ro ngân sách.
- Cập nhật các chỉ số kinh tế và trần CPI cắt lỗ vào Final UA Plan.

---

## Why this matters

Lập trình viên Unity khi tự phát hành game thường rơi vào một trong hai thái cực sai lầm: hoặc là họ bỏ qua hoàn toàn các tính toán tài chính vì nghĩ nó quá phức tạp, hoặc là họ tin tưởng một cách ngây thơ rằng chỉ cần game có người chơi thì tự khắc sẽ có tiền hoàn vốn.

Với ngân sách nhỏ $100-500, doanh thu ban đầu từ quảng cáo xen kẽ (interstitial) hay vật phẩm IAP giá rẻ ($0.99) sẽ rất biến động và nhiễu loạn. Nếu bạn không có một mô hình kinh tế ước lượng (rough economics) để tính ra **một người chơi mang lại bao nhiêu tiền trong suốt cuộc đời của họ (LTV)**, bạn sẽ không thể biết được liệu mức CPI `$0.50` bạn đang trả trên Facebook Ads là đắt hay rẻ. 

Nếu LTV thực tế của game chỉ đạt `$0.20`, thì việc bạn tiếp tục chạy ads mua user với giá `$0.40` chỉ đơn giản là đang đốt tiền một cách vô nghĩa. Bạn cần biết rõ ngưỡng trần chi phí của game mình.

---

## Core model: Phân rã Lifetime Value (LTV)

Đối với game puzzle casual kết hợp quảng cáo và IAP nhẹ, giá trị trọn đời của người chơi (LTV) được phân rã thành hai thành phần chính:

$$\text{LTV} = \text{LTV}_{\text{Ad}} + \text{LTV}_{\text{IAP}}$$

Để ước lượng nhanh LTV mà không cần dùng đến các hàm tích phân phức tạp, bạn có thể áp dụng công thức thực tế dựa trên số ngày chơi trung bình (LTD - Lifetime Days) và doanh thu trung bình ngày (ARPDAU):

$$\text{LTV} = \text{Lifetime Days (LTD)} \times \text{ARPDAU}$$

Trong đó:
*   **Lifetime Days (LTD)**: Tổng số ngày tích lũy người chơi hoạt động trong game (ước tính dựa trên diện tích dưới đường cong Retention). Ví dụ, nếu Retention D1 = 35%, D7 = 15%, D30 = 5%, một user trung bình sẽ hoạt động khoảng 4 - 6 ngày trong tháng đầu tiên.
*   **ARPDAU (Average Revenue Per Active User)**: Doanh thu trung bình trên mỗi user hoạt động ngày.
    
    $$\text{ARPDAU} = \frac{\text{Tổng doanh thu quảng cáo + Tổng doanh thu IAP trong ngày}}{\text{Số người chơi hoạt động trong ngày đó}}$$

---

## Khung Giả định kinh tế mẫu (Main framework/map mẫu)

> [!WARNING]
> Các con số dưới đây là mô phỏng giả lập cho kịch bản game Hexa Puzzle chạy ads và IAP nhẹ. Tuyệt đối không bê nguyên xi các số này làm benchmark cứng cho game của bạn, vì mỗi thể loại puzzle (như match-3 cạnh tranh so với sorting giải trí nhẹ) sẽ có hệ số ARPDAU và LTD hoàn toàn khác biệt.

Dưới đây là khung xây dựng 3 kịch bản kinh tế giúp bạn xác định giới hạn an toàn cho chiến dịch UA:

| Tham số kinh tế | Kịch bản Bi quan (Conservative) | Kịch bản Kỳ vọng (Expected) | Kịch bản Lạc quan (Optimistic) | Ý nghĩa quản trị |
| :--- | :---: | :---: | :---: | :--- |
| **D1 Retention** | Thấp hơn build/case mà bạn tin tưởng (ví dụ: <20%) | **Đạt vùng mục tiêu nội bộ (28% - 32%)** | Vượt rõ vùng mục tiêu nội bộ (>35%) | Chỉ số neo giữ chất lượng onboarding. |
| **D30 Retention** | Mỏng, khó hoàn vốn (<2%) | **Đủ để nuôi doanh thu (4% - 6%)** | Dày, có chiều sâu giữ chân (>8%) | Chỉ số neo giữ chiều sâu của gameplay. |
| **Lifetime Days (LTD)** | Ngắn (~3 ngày) | **Trung bình đủ dùng (5 - 6 ngày)** | Dài (>8 ngày) | Tổng số ngày active trung bình của 1 user. |
| **ARPDAU thực tế** | Yếu (<$0.02) | **Đủ bù mô hình kinh tế ($0.04 - $0.06)** | Mạnh (>$0.10) | Khả năng khai thác quảng cáo/IAP. |
| **LTV ước tính (30 ngày)** | Kém hơn CPI rõ rệt (<$0.10) | **Tiệm cận vùng có thể test tiếp ($0.20 - $0.35)** | Vượt CPI với biên an toàn (>$0.80) | Trần LTV dùng làm căn cứ mua ad. |
| **CPI Trần cho phép (Ceiling)** | Rất thấp (<$0.08) | **Khớp kịch bản kỳ vọng ($0.18 - $0.28)** | Có room để scale (>$0.60) | **Stop-loss CPI**: Vượt mốc này là dừng và đọc lại economics. |

---

## Sơ đồ Quy trình Tính LTV (Hero visual or operating diagram)

Sơ đồ dưới đây minh họa cách các nguồn dữ liệu đầu vào kết hợp với nhau để tạo ra con số LTV cuối cùng:

![LTV calculation components](content/assets/usecases/day-11-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình LTV (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Hai nhánh chính dẫn vào phép nhân LTV: Nhánh bên trái là Retention Curve dùng để tính ra LTD (Lifetime Days); Nhánh bên phải là doanh thu chia đôi thành Ad ARPDAU (doanh thu quảng cáo) và IAP ARPU (doanh thu mua hàng).
> *   **Kết luận rút ra (Conclude)**: LTV là sự đánh đổi (tradeoff) giữa thời gian chơi và tốc độ kiếm tiền. Game có ARPDAU cao nhưng người chơi thoát sạch ở Day 1 (LTD thấp) sẽ có LTV kém hơn game có ARPDAU thấp nhưng người chơi ở lại lâu dài (LTD cao).
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng việc tăng số lượng quảng cáo hiển thị sẽ tự động làm tăng LTV. Ép xem ad quá nhiều sẽ bẻ gãy đường cong Retention, làm LTD sụt giảm nghiêm trọng và kéo LTV đi xuống.

---

## Biểu đồ tích lũy LTV theo thời gian (Chart/visual/table)

Biểu đồ dưới đây biểu diễn tốc độ tích lũy LTV qua 90 ngày của 3 kịch bản kinh tế:

![LTV projection scenarios](content/assets/usecases/day-11-data-visual.png)

:::chart
title: LTV tích lũy dự kiến sau 30 ngày ($ USD)
Conservative Scenario|0.06|Weak retention and poor ad integration
Expected Scenario|0.27|Healthy casual puzzle metrics baseline
Optimistic Scenario|0.82|Strong onboarding and high rewarded ad adoption
:::

*Cách đọc chart*: Khoảng cách giữa các kịch bản thể hiện rõ mức độ nhạy cảm của sản phẩm. Nhiệm vụ của vòng chạy test đầu tiên là thu thập số liệu thực tế để xem game đang nằm tiệm cận ở đường cong nào, từ đó đưa ra quyết định cắt lỗ, giữ test, hay scale nhẹ. Các con số trong ví dụ này là minh họa cho một puzzle game ads + light IAP, không phải benchmark cố định.

---

## Hướng dẫn đọc số và chẩn đoán chỉ số tài chính

Hãy áp dụng bảng chẩn đoán 4 cột dưới đây để xử lý kết quả tài chính đầu tay:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **ARPDAU = $0.01**<br>**Retention tốt (D1=35%)** | **Under-monetized**: Game giữ chân tốt nhưng thiết kế vị trí đặt ad / giá trị quà tặng rewarded ad quá kém, người chơi không có động lực click xem ad. | Thêm các điểm nút gọi xem rewarded ad (ví dụ: nhân đôi quà tặng cuối màn, hồi sinh khi sắp thua). | Vội vã tắt chiến dịch UA paid vì thấy doanh thu thấp. |
| **ARPDAU = $0.09**<br>**Retention rụng (D1=10%)** | **Ad Aggression**: Game kiếm tiền nhanh nhưng hiển thị ad interstitial (quảng cáo ép buộc) quá dày đặc làm người chơi ức chế thoát game sớm. | Giới hạn tần suất ad (Daily Ad Limit), đặt khoảng nghỉ tối thiểu 90 giây giữa các màn ad ép buộc. | Tiếp tục chạy ad vì thấy ARPDAU ngày đầu cao. |
| **CPI = $0.45**<br>**LTV ước tính = $0.20** | **Negative Margin**: Giá mua lượt cài đặt cao gấp đôi giá trị trọn đời của người chơi, chạy tiếp chắc chắn lỗ. | Tạm dừng chiến dịch ad. Tìm creative angle mới có giá rẻ hơn hoặc sửa lại kinh tế game để tăng LTV. | Tăng ngân sách chạy ad với hy vọng thuật toán tự tối ưu giúp CPI giảm. |

---

## Worked example: Calming Hex Puzzle

Một nhà phát triển Unity chạy test $250 cho tựa game Calming Hex Puzzle với các ngưỡng trần LTV cụ thể cho từng kịch bản:

**Báo cáo thực tế sau 5 ngày**:
- Ngân sách tiêu: $180.
- Số install thu được: 300 users.
- CPI thực tế: `$0.60`.
- Retention D1: 32%.
- ARPDAU thực tế: `$0.03`.
- Tính toán LTD thực tế: 5.8 ngày.
- LTV thực tế ước tính: `5.8 ngày x $0.03 = $0.17`.

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Mô hình kinh tế (Economics Framework) đã định nghĩa kịch bản Conservative có trần CPI là `$0.08`, kịch bản Expected là `$0.22`, và kịch bản Optimistic là `$0.50`.
*   Với LTV thực tế `$0.17`, game đang nằm ở giữa kịch bản Conservative và Expected. Mức CPI thực tế là `$0.60` đã vượt xa tất cả các ngưỡng trần cho phép (Ceilings). 
*   **Hành động quyết định**: Tắt chiến dịch hiện tại để dừng lỗ. Tiến hành thiết kế 3 video quảng cáo mới xoay quanh chủ đề khác (ví dụ: thử thách đếm số combo nổ khối gỗ) để thử kéo CPI xuống vùng dưới `$0.20`, thay vì vội sửa cả gameplay.

---

## Real usecases đã đối chiếu nguồn

### Case Study: Thiết lập LTV Curve của Rovio (Sugar Blast)

![Rovio Sugar Blast LTV optimization representation](content/assets/usecases/candy-crush.png)

> [!NOTE]
> **Hướng dẫn đọc Biểu đồ LTV:CAC Rovio (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Trục hoành là thời gian theo ngày cài đặt, trục tung thể hiện doanh thu tích lũy tăng trưởng (LTV). Chú ý cách đường cong LTV phân rã theo từng tệp (cohort) mua hàng IAP và xem ad.
> *   **Kết luận rút ra (Conclude)**: Rovio tối ưu hóa chiến dịch dựa trên LTV cohorted tích lũy thay vì doanh thu ngày đầu. Việc theo dõi tốc độ hồi vốn (ROAS) tại các mốc D1, D7 giúp xác định chính xác thời điểm chiến dịch đạt điểm hòa vốn LTV = CAC.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng game indie nhỏ của bạn cũng cần xây dựng thuật toán dự báo LTV tự động tương đương Rovio. Hãy dùng bảng tính Excel thủ công để tính LTD x ARPDAU đơn giản cho từng nhóm cài đặt theo tuần.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Rovio đã công bố chi tiết về mô hình tối ưu hóa giá trị (Value-Based Optimization), nhấn mạnh việc vẽ đường cong LTV:CAC phân rã theo cohort để đạt ROAS dương cho dòng game casual puzzle. Nguồn: [LTV Modeling của Rovio trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass) | LTV không phải là một số tĩnh. Nó là một đường cong tăng trưởng theo thời gian cần được đối chiếu trực tiếp với chi phí mua user (CPI) để tìm ra điểm hòa vốn. | Không tự suy diễn rằng game của bạn bắt buộc phải có mô hình LTV phức tạp như một studio lớn để bắt đầu chạy thử nghiệm ad hẹp $100. |

---

## Checklist kỹ thuật monetization (Implementation checklist)

Đảm bảo hệ thống quảng cáo và mua hàng hoạt động trơn tru trước khi chạy ad:

| Hạng mục | Trạng thái cần đạt | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Ad SDK Init** | Ad Mediation SDK (như Unity LevelPlay hoặc AppLovin) đã khởi tạo thành công và load được ad test. | Game mở lên không hiện ad, mất hoàn toàn nguồn thu quảng cáo. |
| **2. Daily Ad Limit** | Cài đặt giới hạn tối đa 3 ad interstitial/user/ngày, khoảng nghỉ tối thiểu 90 giây giữa các màn. | Người chơi bị dội bom ad liên tục, dẫn tới gãy retention D1. |
| **3. IAP Price Tier** | Gói IAP rẻ nhất (No Ads hoặc Starter Pack) được cấu hình đúng giá `$0.99` hoặc `$1.99`. | Giá gói quá cao khiến người dùng casual không bao giờ mở ví thử nghiệm. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Ép người chơi xem quảng cáo xen kẽ (interstitial ad) quá sớm**
    *   *Correction*: Tránh đặt ad ép buộc trước khi người chơi hoàn thành Level 3 hoặc trước khi họ chơi quá 2 phút. Hãy để họ cảm nhận giá trị game trước.
*   **Mistake 2: Ước lượng LTV quá lạc quan để tự lừa dối bản thân**
    *   *Correction*: Luôn lấy kịch bản bi quan (Conservative LTV) làm điểm tựa stop-loss khi thiết lập ngân sách thử nghiệm ban đầu.
*   **Mistake 3: Không kiểm tra kỹ liên kết Ad Mediation SDK**
    *   *Correction*: Hãy chạy thử nghiệm build trên thiết bị thật và tự tay click xem ad rewarded ít nhất 3 lần để đảm bảo event đếm impression gửi đi chính xác.

### Đọc sai số kinh tế thường gặp (Top 3 Economics Data Traps)

1.  **Organic Dilution Trap (Bẫy pha loãng lượng tự nhiên)**: Tính gộp cả organic install (lượng tải tự nhiên không qua ad) để tính LTD và ARPDAU trung bình cho paid campaign. Việc này sẽ thổi phồng ảo LTV của paid user, dẫn tới việc duy trì các campaign đang lỗ nặng mà không biết.
2.  **Mediation Platform Cut (Quên trừ chiết khấu)**: Tính LTV dựa trên eCPM thô từ ad network mà quên trừ đi 15% - 30% phí nền tảng ad server/mediation và thuế nhà thầu. Khi hoàn vốn thực tế nhận về tài khoản sẽ bị thiếu hụt so với bảng tính.
3.  **Paying vs Non-paying averaging (Trung bình cào bằng)**: Đo lường ARPDAU chung cho cả nhóm mà không phân nhóm (segment) hành vi người dùng. Đối với game hybrid, 2% người chơi IAP tạo ra 80% doanh thu; việc trung bình hóa cào bằng sẽ làm lu mờ hành vi rò rỉ của tệp VIP này.

---

## English Terms You Should Keep

*   **ARPDAU**: Average Revenue Per Active User (Doanh thu trung bình trên mỗi người dùng hoạt động ngày).
*   **LTV**: Lifetime Value (Giá trị trọn đời của một người chơi).
*   **Payback window**: Khoảng thời gian hoàn vốn (thời điểm doanh thu tích lũy bằng chi phí quảng cáo).
*   **stop-loss CPI**: Trần chi phí cài đặt tối đa cho phép để dừng chiến dịch trước khi quá muộn.
*   **Ad Mediation**: Hệ thống trung gian phân phối và tối ưu hóa doanh thu quảng cáo từ nhiều network.

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Bản phác thảo Kinh tế (Rough Economics Note Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                        ROUGH ECONOMICS NOTE                            │
├────────────────────────────────────────────────────────────────────────┤
│ Target Scenario: Expected Puzzle Model                                 │
│ Expected D1 Retention: 30% | Expected LTD: 5.5 days                    │
│ Target ARPDAU: $0.05 (Ad: $0.04 | IAP: $0.01)                           │
│ Calculated LTV: 5.5 days x $0.05 = $0.27                               │
│ CPI Ceiling Target (Stop-loss): $0.22                                  │
│ Primary Revenue Driver: Rewarded Ads (No-Ads package as secondary)     │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu Rough economics note hoàn chỉnh dạng bảng mà học viên cần điền:

| Chỉ số giả định | Kịch bản Bi quan | Kịch bản Kỳ vọng (Target) | Kịch bản Lạc quan | Cách đo lường thực tế |
| :--- | :---: | :---: | :---: | :--- |
| **D1 Retention** | 20% | **30%** | 35% | Cohort Retention chart. |
| **LTD (Số ngày active)** | 3.0 ngày | **5.5 ngày** | 7.5 ngày | Diện tích dưới biểu đồ retention. |
| **ARPDAU mục tiêu** | $0.02 | **$0.05** | $0.08 | Tổng doanh thu / Active Users. |
| **LTV dự kiến** | $0.06 | **$0.27** | $0.60 | LTD x ARPDAU. |
| **CPI Trần Stop-loss** | **$0.05** | **$0.22** | **$0.50** | Trần giá mua install trên Ads Manager. |

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh bản phác thảo kinh tế sơ khởi cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (Economics Quality Chain Check)** dưới đây để tự duyệt:
    *   *Mô hình doanh thu*: Bạn đã ghi rõ doanh thu chính đến từ quảng cáo rewarded hay gói IAP cụ thể chưa? (Đạt/Không)
    *   *Ràng buộc Stop-loss*: Ngưỡng trần CPI cắt lỗ của bạn có được đặt thấp hơn mốc LTV kỳ vọng với một biên an toàn rõ ràng không? (Đạt/Không)
    *   *Tính hợp lý của LTD*: Con số Lifetime Days (LTD) đưa ra có dựa trên dữ liệu retention thực tế thay vì suy diễn lạc quan quá mức không? (Đạt/Không)
    *   *Xác thực SDK*: Thiết bị test của bạn đã load và hiển thị thành công ít nhất một ad test trước khi cấu hình campaign chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **economics_guardrails** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- Expected ARPDAU baseline: [Mốc ARPDAU kỳ vọng]
- Primary revenue stream: [Quảng cáo hay IAP là chính]
- LTD estimate: [Số ngày chơi active trung bình mong muốn]
- Expected LTV threshold: [Mức LTV dự phóng]
- Stop-loss CPI ceiling: [Trần CPI cắt lỗ bắt buộc]
```

---

## Checklist Focus

*   [ ] Thiết lập 3 kịch bản kinh tế LTV riêng biệt cho game của bạn.
*   [ ] Xác định rõ trần CPI cắt lỗ bắt buộc dựa trên kịch bản kỳ vọng.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (Economics Quality Chain Check).
*   [ ] Cập nhật trường economics_guardrails vào Final UA Plan.

---

## Curated References

*   [The Game Analytics Masterclass trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass)
*   Tài liệu hướng dẫn thiết lập Ad Placement và cấu hình eCPM floor trên AppLovin MAX / Unity LevelPlay.
', now()),
  ('lessons/day-12.md', 'markdown', null, '---
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

---

## Khung Ma trận Quyết định phối hợp CPI và D7 ROAS (Main framework/map mẫu)

Dưới đây là ma trận quyết định 4 ô phối hợp giữa chi phí mua user (CPI) và hiệu quả hoàn vốn (ROAS) ở Ngày 7:

| Chỉ số phối hợp | D7 ROAS Đạt Chỉ Tiêu | D7 ROAS Dưới Chỉ Tiêu |
| :--- | :--- | :--- |
| **CPI Thực Tế Rẻ** | **Ô 1: SCALE (Tăng tiền)**<br>Ad kéo user tốt và game kiếm tiền hiệu quả. Chỉ tăng ngân sách theo nhịp nhỏ, có kiểm soát. | **Ô 2: ITERATE GAMEPLAY**<br>Ad rẻ chứng tỏ hook quảng cáo đang ổn, nhưng game giữ chân/monetization kém. Sửa lại game, giữ ad ở mức học. |
| **CPI Thực Tế Đắt** | **Ô 3: ITERATE CREATIVE**<br>Game giữ chân và kiếm tiền tốt, nhưng giá mua user quá cao. Tiến hành làm video quảng cáo mới để kéo CPI xuống. | **Ô 4: STOP (Tắt dừng lỗ)**<br>Chiến dịch thất bại hoàn toàn ở cả ad lẫn game. Tắt ad hoặc giảm về mức tối thiểu để tránh tiếp tục tiêu tiền vô nghĩa. |

---

## Sơ đồ Quy trình ROAS windows và Độ trễ Dữ liệu (Hero visual or operating diagram)

![ROAS Windows & Signal Delay Timeline](content/assets/usecases/day-12-hero-diagram.png)

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Xem xét khoảng thời gian trễ (grey zone) kéo dài 24-48 giờ từ khi người dùng phát sinh hành động nạp tiền ở Ngày 3 đến khi ad network nhận được postback cập nhật và hiển thị trên dashboard.
> *   **Kết luận rút ra (Conclude)**: Tuyệt đối không được chỉnh sửa ngân sách hoặc tắt campaign dựa trên dữ liệu ROAS của 48 giờ gần nhất, vì dữ liệu này luôn bị thiếu hụt (under-reported) do độ trễ postback.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng độ trễ này chỉ xảy ra trên iOS. Trình theo dõi Android (như Google Privacy Sandbox) cũng đang áp dụng cơ chế gửi postback trễ ngẫu nhiên để bảo vệ quyền riêng tư của người dùng.

---

## Biểu đồ ma trận quyết định phối hợp CPI và D7 ROAS (Chart/visual/table)

![CPI vs D7 ROAS Decision Matrix](content/assets/usecases/day-12-data-visual.png)

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

![Rovio Sugar Blast ROAS Delay optimization representational diagram](content/assets/usecases/day-12-hero-diagram.png)

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

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh ma trận quy tắc quyết định ROAS cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check)** dưới đây để tự duyệt:
    *   *Ràng buộc mốc thời gian*: Bạn đã ghi rõ mốc Ngày 7 làm checkpoint đánh giá cắt lỗ chính thay vì Ngày 1 chưa? (Đạt/Không)
    *   *Xử lý độ trễ*: Kịch bản ra quyết định của bạn có điều khoản loại trừ dữ liệu của 48 giờ gần nhất để tránh độ trễ postback chưa? (Đạt/Không)
    *   *Mốc số phối hợp*: Các hành động tăng/giảm ngân sách có được phối hợp chặt chẽ giữa cả hai chỉ số CPI và ROAS không (tránh nhìn một chiều)? (Đạt/Không)
    *   *Cấu hình MMP*: Hệ thống của bạn đã bật tính năng truyền gửi doanh thu ad (Ad Revenue Postback) sang MMP chưa? (Đạt/Không)

---

## Final UA Plan Update

Cập nhật trường **roas_decision_matrix** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- ROAS evaluation checkpoint: [Mốc checkpoint chính, ví dụ: Day 7]
- Target D7 ROAS threshold: [Mức ROAS mong muốn tại checkpoint]
- Scale rule definition: [Điều kiện để tăng tiền chiến dịch]
- Iterate rule definition: [Điều kiện để giữ campaign và sửa game/ad]
- Stop rule definition: [Điều kiện bắt buộc tắt campaign cắt lỗ]
```

---

## Checklist Focus

*   [ ] Thiết lập ma trận quyết định 4 ô phối hợp chi tiết giữa CPI và D7 ROAS.
*   [ ] Viết rõ điều khoản loại trừ dữ liệu trễ postback 48 giờ trong quy tắc vận hành.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check).
*   [ ] Cập nhật trường roas_decision_matrix vào Final UA Plan.

---

## Curated References

*   [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit)
*   [Android Attribution Reporting](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
*   Tài liệu hướng dẫn cấu hình Conversion Value và đo lường postback của Apple App Store Connect.
', now())
on conflict (content_key)
do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = now();

-- Quick checks
select content_key, content_type, updated_at
from public.ua_content_files
where content_key in ('lessons/day-01.md', 'lessons/day-12.md')
order by content_key;

commit;
