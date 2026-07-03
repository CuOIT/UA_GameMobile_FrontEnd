---
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
