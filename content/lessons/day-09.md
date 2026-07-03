---
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
