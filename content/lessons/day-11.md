---
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
