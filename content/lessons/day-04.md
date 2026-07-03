---
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
