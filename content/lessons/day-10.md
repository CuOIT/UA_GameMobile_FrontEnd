---
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
