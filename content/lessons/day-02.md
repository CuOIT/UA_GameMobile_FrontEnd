---
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
