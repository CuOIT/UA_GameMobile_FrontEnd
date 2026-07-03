---
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
