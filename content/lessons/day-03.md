---
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
