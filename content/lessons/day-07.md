---
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
