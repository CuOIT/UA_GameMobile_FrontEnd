---
day: 7
title: "Week 1 synthesis: first UA hypothesis"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, Soft launch]
artifact: "First UA hypothesis card"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **First UA hypothesis card**: một thẻ giả thuyết đủ cụ thể để chạy vòng test UA nhỏ đầu tiên mà không bị biến thành “bắn quảng cáo rồi cầu may”.

Quyết định cần ra sau bài:

- Chọn **một** player motivation chính để test trước.
- Viết rõ chuỗi `ad promise -> store proof -> first-session proof -> metric pattern -> next action`.
- Định nghĩa budget scope, metric signal và action rule cho vòng test `$100-500`.
- Cập nhật trường **hypothesis** trong Final UA Plan để Week 2 có thể đo đúng thứ cần đo.

Thẻ này không nhằm dự đoán game chắc thắng. Nó nhằm ép team nói rõ: “Chúng ta đang kiểm chứng điều gì, bằng tín hiệu nào, và nếu tín hiệu lệch thì sửa phần nào trước?”

---

## Why this matters

Sau 6 bài đầu, bạn đã có các mảnh riêng: UA loop, funnel leak, player motivation, store proof, budget và channel. Nhưng khi chuẩn bị chạy test thật, nhiều team indie lại gom các mảnh đó thành một câu rất mơ hồ:

> “Game puzzle casual của mình sẽ chạy Meta/TikTok để tìm user rẻ.”

Câu này nghe hợp lý nhưng không giúp ra quyết định. Nếu `CPI` rẻ nhưng `D1` thấp, bạn sửa creative, store, tutorial hay level pacing? Nếu `CTR` cao nhưng store `CVR` thấp, bạn scale tiếp vì ad tốt hay dừng để sửa listing? Với budget nhỏ, một lần đọc sai có thể tiêu hết tiền trước khi học được điều quan trọng.

Lesson này biến Week 1 thành một **operating contract**. Trước khi chi tiền, team phải ghi rõ giả thuyết, bằng chứng mong đợi, guardrail metric và hành động tiếp theo. Làm vậy giúp bạn không tranh luận bằng cảm giác sau khi data về.

---

## Core model: Hypothesis = promise chain + action rule

Một giả thuyết UA tốt không phải là “tôi nghĩ game sẽ có người chơi”. Nó là một chuỗi kiểm chứng:

**Player motivation** -> **Ad promise** -> **Store proof** -> **First-session proof** -> **Metric pattern** -> **Next action**

Đọc theo logic vận hành:

1. **Player motivation**: Người chơi tìm cảm giác gì? Nghỉ não, dọn dẹp thỏa mãn, thử thách trí tuệ, sưu tầm, hay tiến triển?
2. **Ad promise**: Video/hook hứa đúng cảm giác đó bằng một hành động nhìn thấy được chưa?
3. **Store proof**: Icon, screenshot đầu, short description có chứng minh cùng lời hứa không?
4. **First-session proof**: 3-5 phút đầu trong game có giao ngay cảm giác mà ad/store đã hứa không?
5. **Metric pattern**: Tín hiệu nào cho biết mắt xích nào đang lệch?
6. **Next action**: Nếu lệch, team sửa creative, store, onboarding, level pacing hay dừng test?

Nếu thiếu action rule, hypothesis chỉ là idea. Nếu thiếu store proof hoặc first-session proof, hypothesis dễ tạo click nhưng không tạo learning.

---

## Khung First UA hypothesis card mẫu

Điền card theo 8 dòng. Dòng nào chưa điền được nghĩa là test chưa sẵn sàng.

| Field | Câu hỏi phải trả lời | Ví dụ cho mobile puzzle |
| :--- | :--- | :--- |
| **1. Player motivation** | Người chơi đến vì cảm giác nào, không phải chỉ vì genre nào? | Người chơi casual muốn một phiên “dọn não” 2 phút sau giờ làm. |
| **2. Ad promise** | 3 giây đầu của ad hứa hành động/cảm giác gì? | “Clear a messy board in three satisfying moves.” |
| **3. Store proof** | Screenshot/title nào chứng minh ad không nói quá? | Screenshot đầu là before/after board sạch, không phải menu/meta. |
| **4. First-session proof** | Người chơi nhận được lời hứa ở đâu trong 3-5 phút đầu? | Level 1-3 cho combo dễ, board clear nhanh, không tutorial dài. |
| **5. Channel/budget scope** | Test ở đâu, chi bao nhiêu, trong bao lâu, và không test gì? | Android, một social channel, `$300`, 3-5 ngày, không test monetization. |
| **6. Primary signal** | Metric nào trả lời câu hỏi chính? | `CTR` cho ad promise hoặc `store CVR` cho store proof. |
| **7. Guardrail signal** | Metric nào ngăn team đọc sai? | `tutorial_complete`, `D1`, hoặc early level completion. |
| **8. Action rules** | Nếu good/weak/mixed thì làm gì? | Good: rerun variant. Weak CVR: sửa store. Weak D1: sửa first session. |

Một card mạnh nên có phạm vi hẹp. Ví dụ “test Satisfying Clear cho Android puzzle trong 3 ngày” tốt hơn “test nhiều audience cho game puzzle”.

### Hypothesis decision contract

Hypothesis card không chỉ ghi thứ sẽ test. Nó phải ghi rõ **quyết định nào được phép ra** sau test nhỏ, và **quyết định nào bị cấm** vì data chưa đủ. Đây là cách bảo vệ team khỏi over-read một sample `$100-500`.

| Card field | Decision được phép | Decision bị cấm | Evidence cần có |
| :--- | :--- | :--- | :--- |
| Player motivation | Chọn một motivation để làm hook chính cho vòng kế tiếp | Kết luận đây là audience tốt/xấu vĩnh viễn | Motivation viết bằng tình huống chơi, không phải demographic |
| Ad promise | Sửa hoặc giữ 3 giây đầu creative | Scale channel chỉ vì `CTR` cao | Creative có một promise nhìn thấy được, không trộn 3 promise |
| Store proof | Sửa screenshot/title/copy nếu `CVR` yếu | Đổ lỗi product khi store chưa chứng minh promise | Screenshot đầu và short description lặp lại cùng promise |
| First-session proof | Sửa tutorial/level pacing nếu D1/complete yếu | Kết luận motivation sai khi first session chưa deliver promise | Event/flow chứng minh payoff trong 3-5 phút đầu |
| Primary signal | Chọn next action cho mắt xích chính | Gọi winner/loser nếu guardrail contradict | Metric gắn đúng câu hỏi học hỏi |
| Guardrail signal | Chặn quyết định sai khi primary đẹp nhưng retention/product yếu | Bỏ qua guardrail để scale vì CPI rẻ | Event đã QA hoặc ít nhất có nguồn đo đáng tin |
| Stop-loss rule | Dừng chi để diagnose đúng stage | Tiếp tục mua traffic vì "đã setup rồi" | Daily cap, pause condition và owner rõ |

Một hypothesis chưa có blocked decisions vẫn còn quá rộng. Câu tốt nên có dạng: "Sau test này, chúng ta được phép quyết định sửa ad/store/onboarding cho promise X, nhưng chưa được phép kết luận LTV, monetization hoặc broad market fit."

---

## Sơ đồ vận hành hypothesis chain

```text
![UA hypothesis chain decision diagram](content/assets/usecases/day-07-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Sơ đồ vận hành hypothesis chain.
Previous local asset to replace: content/assets/usecases/day-07-hero-diagram.png.
Visual brief: UA hypothesis chain decision diagram.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Nhìn chuỗi từ trái sang phải: player motivation tạo ad promise, ad promise cần store proof, store proof phải được first-session proof xác nhận, rồi metric pattern mới dẫn tới next action.
>
> **Conclude**: Nếu một mắt xích yếu, đừng nhảy ngay sang kênh khác. Hãy sửa đúng mắt xích đang làm đứt chuỗi học hỏi.
>
> **Do not infer**: Sơ đồ không nói channel nào luôn tốt nhất hoặc metric nào là benchmark cố định. Nó chỉ dạy thứ tự chẩn đoán để micro-budget không bị tiêu vào quyết định sai.

---

## Bảng confidence cho 4 candidate hypotheses

Đây là bảng mẫu để chọn hypothesis đầu tiên. Điểm confidence là **scenario-specific**, chỉ dùng để ưu tiên trong một game puzzle nhỏ có asset còn hạn chế.

| Candidate hypothesis | Player motivation | Asset readiness | Measurement clarity | Confidence | Rủi ro chính |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Satisfying Clear** | Dọn dẹp, clear board, nhìn kết quả ngay | Cao | Cao | **5/5** | Ad đẹp hơn gameplay thật, làm `D1` yếu. |
| **Calming Relax** | Nghỉ não, không áp lực, chơi ngắn | Cao | Trung bình | **4/5** | Dễ hứa “relax” nhưng first session lại có popup/ad quá sớm. |
| **Brain Challenge** | Thử thách, cảm giác thông minh | Trung bình | Trung bình | **3/5** | Người chơi click vì challenge nhưng churn nếu level đầu quá khó. |
| **Mystery/Drama Rescue** | Cứu nhân vật, tò mò tình huống | Thấp | Thấp | **2/5** | Click cao nhưng intent lệch nếu game thật không có rescue loop. |

:::chart
title: Candidate hypothesis confidence, 1-5
Satisfying Clear|5|Best fit when gameplay has visible clear/combo moments
Calming Relax|4|Good if store and first session avoid pressure signals
Brain Challenge|3|Needs careful early difficulty guardrail
Mystery Rescue|2|High mismatch risk for a small puzzle prototype
:::

**Inspect**: Candidate có confidence cao thường là candidate có asset dễ làm, metric dễ đọc và risk mismatch thấp.

**Conclude**: Với vòng test đầu, chọn hypothesis giúp team học nhanh nhất, không nhất thiết là ý tưởng “ngầu” nhất.

**Do not infer**: Điểm trên không phải chuẩn thị trường. Nếu game của bạn có rescue mechanic thật, Mystery/Drama có thể tăng điểm. Nếu game không có combo rõ, Satisfying Clear có thể giảm điểm.

---

## Hướng dẫn đọc số

Đừng đọc từng metric riêng lẻ. Hãy đọc theo cặp để biết mắt xích nào đang hỏng.

| Pattern trong test nhỏ | Cách đọc đúng | Next action | Không nên làm |
| :--- | :--- | :--- | :--- |
| `CTR` ổn, `store CVR` yếu | Ad promise có thể kéo tò mò, nhưng store proof không củng cố lời hứa. | Giữ creative, sửa screenshot đầu, short description, feature graphic. | Đổi target audience ngay. |
| `store CVR` ổn, `tutorial_complete`/`D1` yếu | Store bán đúng lời hứa, nhưng first session chưa giao được lời hứa đó. | Sửa onboarding, level 1-5, tutorial length, early fail state. | Scale vì CPI nhìn rẻ. |
| `CTR` yếu, `D1` của user đã vào game ổn | Product có thể ổn, nhưng ad không truyền được motivation. | Làm lại 3 giây đầu, visual hook, claim cụ thể hơn. | Sửa gameplay trước khi sửa creative. |
| `CPI` rẻ, retention yếu | Traffic rẻ có thể là low-intent hoặc promise mismatch. | Kiểm tra chain ad/store/first session trước khi tăng daily cap. | Kết luận “game có UA tốt” chỉ vì install rẻ. |
| Sample quá nhỏ, signal lẫn lộn | Chưa đủ learning để kết luận mạnh. | Ghi “inconclusive”, giữ phạm vi hẹp, rerun cùng hypothesis nếu vẫn quan trọng. | Tạo 5 biến thể mới và làm nhiễu test. |

Decision ranges nên được ghi dưới dạng **ngưỡng vận hành cho sprint này**, không phải benchmark vĩnh viễn. Ví dụ: “Nếu `store CVR` thấp hơn vùng kỳ vọng của sprint này và `CTR` vẫn ổn, chúng ta sửa store trước.” Cách viết này tốt hơn “CVR phải luôn trên X%”.

---

## Worked example: Calming Block Puzzle hypothesis

Giả sử team có một prototype block puzzle nhẹ, Android-first, budget còn `$300`. Team chọn hypothesis:

```text
Player motivation:
Người chơi casual cần một phiên nghỉ não 2 phút, không áp lực thời gian.

Ad promise:
Video 10 giây cho thấy board lộn xộn được clear thành sạch, âm thanh nhẹ, không countdown.

Store proof:
Screenshot đầu là before/after board clear, headline "Relaxing block puzzle, no timer pressure".

First-session proof:
Level 1-3 cho clear/combo dễ trong 60 giây đầu, không interstitial trước khi hoàn thành level 3.

Channel/budget:
Android social test, $300 cap, 3-5 ngày, chỉ test một promise.

Primary signal:
CTR và store CVR để kiểm tra ad -> store continuity.

Guardrail:
tutorial_complete, level_3_complete, D1.

Action rules:
Weak CTR -> remake hook.
Good CTR + weak CVR -> fix store assets.
Good CVR + weak D1 -> fix first-session pacing.
```

Kết quả sau khi tiêu `$220`:

| Signal | Quan sát | Cách đọc |
| :--- | :--- | :--- |
| `CTR` | 2.4% | Hook có khả năng chạm đúng motivation nghỉ não trong sample này. |
| `store CVR` | 16% | Store proof yếu so với lời hứa của ad trong sprint này. |
| `tutorial_complete` | 72% | Người đã vào game không bị tutorial chặn quá nặng. |
| `D1` | 28% | Chưa đủ mạnh để scale, nhưng không phải điểm gãy đầu tiên. |

**Diagnosis**: Mắt xích yếu nhất là `store proof`, không phải gameplay. Nếu team sửa game ngay, họ có thể bỏ qua vấn đề thật: store page chưa chứng minh lời hứa “calm/no pressure”.

**Tradeoff**: Dừng ad sớm có vẻ tiếc vì `CTR` đang ổn, nhưng tiếp tục chi sẽ mua thêm click đi qua một store page chưa thuyết phục. Với `$80` còn lại, hành động tốt hơn là thay screenshot đầu và short description, rồi retest cùng creative để isolate store change.

**Next action**:

1. Pause campaign.
2. Thay screenshot đầu bằng before/after board clear.
3. Đổi short description sang một promise cụ thể: “No timer, quick relaxing boards.”
4. Rerun cùng ad hook bằng phần budget còn lại.
5. Không sửa level pacing cho đến khi store proof được kiểm lại.

### First readout memo

Sau khi tiêu một phần budget đầu tiên, đừng chỉ gửi bảng metric. Viết memo 8-10 dòng để khóa cách đọc trước khi team tranh luận.

```text
First UA hypothesis readout - Calming Block Puzzle

Hypothesis tested:
Casual players want a calm 2-minute clear-board session.

Budget spent:
$220 of $300, Android social, one promise, no monetization test.

Observed pattern:
- CTR healthy for this sprint.
- Store CVR weak relative to the ad promise.
- Tutorial completion acceptable.
- D1 directional but not a scale signal yet.

Decision allowed:
Repair store proof and rerun the same ad hook with remaining budget.

Decision blocked:
- Do not scale because CPI looks cheap.
- Do not rewrite core gameplay yet.
- Do not conclude calm motivation is bad until store proof is retested.

Next action owner:
Store owner replaces screenshot 1 and short description; UA owner reruns same creative.
```

Readout memo tốt phải có ba dòng bắt buộc: **observed pattern**, **decision allowed**, **decision blocked**. Nếu thiếu dòng blocked, team rất dễ dùng số nhỏ để kể câu chuyện quá lớn.

---

## Quality chain verification checklist

Trước khi chạy test, kiểm thẻ hypothesis bằng checklist này.

| Check | Câu hỏi kiểm tra | Pass khi |
| :--- | :--- | :--- |
| **Motivation clarity** | Player được định nghĩa bằng motivation hay bằng demographic chung chung? | Có cụm như “muốn nghỉ não”, “thích clear board”, “thích thử thách ngắn”. |
| **Promise visibility** | Ad promise có thể nhìn thấy trong 3 giây đầu không? | Một người ngoài team xem frame đầu vẫn hiểu hook. |
| **Store continuity** | Screenshot/title có lặp lại đúng lời hứa của ad không? | Store không chuyển sang nói feature/meta khác. |
| **First-session proof** | Game giao lời hứa trong 3-5 phút đầu không? | Có event/flow đo được: `tutorial_complete`, `level_3_complete`, `first_combo`. |
| **Measurement readiness** | Primary signal và guardrail đã gắn với event/metric thật chưa? | Không có metric “cảm giác tốt”; tất cả có nguồn đo. |
| **Action rule** | Team biết sửa gì nếu từng signal yếu chưa? | Mỗi failure pattern có một owner và một next action. |
| **Stop-loss** | Biết khi nào không chi tiếp không? | Có daily cap và ngưỡng “pause to diagnose”. |

Nếu một check chưa pass, đừng mở rộng test. Thu hẹp hypothesis trước.

---

## Real usecases đã đối chiếu nguồn

### Internal case: Puzzle soft-launch cheap installs, weak D1

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case data nội bộ: `CPI $0.42`, `CTR 1.8%`, `store CVR 32%`, `tutorial_complete 54%`, `D1 22%`, `D7 4%`. | Store đang chuyển đổi khá tốt, nhưng first session không giao đủ promise để giữ người chơi. Hypothesis card cần action rule cho onboarding/level pacing. | Không kết luận channel tốt chỉ vì CPI rẻ. Cũng không kết luận creative vô dụng khi store CVR vẫn ổn. |

### Public case: Royal Match as promise continuity caution

```text
![Royal Match public Google Play screenshot](content/assets/usecases/royal-match.png)Type: public screenshot/source visual.
Lesson section: Public case: Royal Match as promise continuity caution.
Previous local asset to replace: content/assets/usecases/royal-match.png.
Visual brief: Royal Match public Google Play screenshot.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Screenshot/market-facing surface của Royal Match tập trung vào nhân vật King Robert, puzzle board, và cảm giác match-3 rõ ràng. Bài phân tích của Deconstructor of Fun cũng nhấn mạnh tốc độ, độ mượt, power-up và cảm giác agency trong core gameplay.
>
> **Conclude**: Khi ad/store/gameplay cùng củng cố một promise, funnel dễ được đọc hơn: người chơi click vì điều gì, store xác nhận điều gì, first session giao điều gì.
>
> **Do not infer**: Không copy “cứu vua”, layout store, ngân sách UA hay kỳ vọng scale của Royal Match. Với indie team, bài học là **continuity of promise**, không phải bắt chước execution của studio lớn.

| Source signal | Cách dùng trong lesson này | Không được suy ra |
| :--- | :--- | :--- |
| Deconstructor of Fun phân tích Royal Match như một puzzle game có cảm giác chơi nhanh, mượt, power-up generous và agency cao. | Nếu hypothesis của bạn hứa “satisfying/clear/control”, first session phải giao cảm giác đó thật, không chỉ nói trên ad. | Không dùng Royal Match làm benchmark KPI cho game nhỏ. |
| Google Play có Store Listing Experiments để A/B test graphics và localized text nhằm cải thiện installs/retention direction. | Nếu `CTR` ổn nhưng `store CVR` yếu, store asset test là action hợp lý trước khi đổ lỗi cho channel. | Không hiểu A/B test store là cách sửa retention nếu first session thật sự yếu. |

---

## Common mistakes

**Mistake 1 - “Everyone who likes puzzle” là audience.**

**Correction**: Viết motivation cụ thể: “người muốn nghỉ não 2 phút”, “người thích dọn board sạch”, “người thích thử thách logic ngắn”.

**Mistake 2 - Chỉ ghi target metric, không ghi action rule.**

**Correction**: Mỗi metric yếu phải dẫn tới một hành động. `CTR` yếu -> sửa hook. `store CVR` yếu -> sửa listing. `D1` yếu -> sửa first session.

**Mistake 3 - Test 4 promises trong một budget nhỏ.**

**Correction**: Với `$100-500`, ưu tiên một promise chính và tối đa một biến thể gần. Nhiều promise làm data khó đọc hơn, không “an toàn” hơn.

**Mistake 4 - Thấy CPI rẻ rồi scale.**

**Correction**: CPI rẻ chỉ nói bạn mua install rẻ trong điều kiện hiện tại. Nếu `tutorial_complete`, `D1`, hoặc `level_3_complete` yếu, scale chỉ phóng to vấn đề.

**Mistake 5 - Dùng benchmark như luật cứng.**

**Correction**: Ghi decision ranges cho sprint cụ thể. Một con số chỉ có nghĩa khi gắn với game, channel, creative, country, build size và sample.

---

## English Terms You Should Keep

- **UA hypothesis**: Giả thuyết user acquisition cần kiểm chứng bằng traffic thật.
- **Ad promise**: Lời hứa mà creative tạo ra cho người xem.
- **Store proof**: Bằng chứng trên store page cho thấy lời hứa của ad là thật.
- **First-session proof**: Bằng chứng trong 3-5 phút đầu rằng game giao đúng promise.
- **Primary signal**: Metric chính để trả lời câu hỏi test.
- **Guardrail metric**: Metric phụ giúp tránh đọc sai primary signal.
- **Decision range**: Khoảng vận hành dùng để ra quyết định trong sprint, không phải benchmark cố định.
- **Stop-loss rule**: Quy tắc dừng chi để bảo vệ budget khi signal đủ xấu.

---

## Lab output example

```text
FIRST UA HYPOTHESIS CARD

Game:
Calming Block Puzzle, Android prototype.

Player motivation:
Casual player wants a calm 2-minute brain break after work.

Ad promise:
"Clear a messy wooden board in three satisfying moves."

Store proof:
First screenshot shows before/after board clear. Short description says "No timer, quick relaxing boards."

First-session proof:
Player can clear level 1 within 45 seconds and trigger one satisfying combo before any monetization prompt.

Channel/budget scope:
Android social test, $300 total, $25/day cap, 3-5 days, one promise only.

Primary signal:
CTR and store CVR for ad -> store continuity.

Guardrail:
tutorial_complete, level_3_complete, D1.

Action rules:
- Weak CTR: remake first 3 seconds of video.
- Good CTR + weak store CVR: replace first screenshot and short description.
- Good store CVR + weak D1: shorten tutorial and rebalance level 1-3.
- Cheap CPI + weak D1: do not scale; diagnose promise mismatch.
- Inconclusive sample: rerun same hypothesis or narrow country/budget, do not add five new ideas.

Decision contract:
- Allowed decision: choose whether the first repair should be creative, store, or first-session pacing.
- Blocked decision: do not conclude channel scalability, LTV, monetization strength, or broad market fit.
- Stop-loss: pause after $300 or earlier if CTR/CVR/D1 pattern clearly points to one broken stage.

Readout memo:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next action owner:
```

Một lab output đạt chuẩn phải cho người khác trong team đọc và biết ngay test đang hỏi gì, đo gì, và sửa gì.

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn **một** motivation chính từ Week 1.
2. Viết ad promise bằng một hành động nhìn thấy được trong 3 giây đầu.
3. Ghi store proof: screenshot, icon, title hoặc short description nào chứng minh promise đó.
4. Ghi first-session proof: level/event/flow nào giao promise trong 3-5 phút đầu.
5. Chọn primary signal và guardrail metric.
6. Viết 3 action rules: weak ad, weak store, weak first session.
7. Ghi rõ điều **không test** trong sprint này.
8. Viết 2 quyết định được phép ra sau test và 3 quyết định bị cấm vì sample nhỏ.
9. Chuẩn bị readout memo mẫu gồm observed pattern, decision allowed, decision blocked và owner.

Quality chain check trước khi nộp:

- Nếu bỏ tên game đi, card vẫn nói rõ người chơi muốn cảm giác gì không?
- Nếu nhìn ad mà không đọc caption, promise có hiểu được không?
- Nếu nhìn screenshot đầu, người chơi có thấy cùng promise không?
- Nếu chơi 3 phút đầu, người chơi có nhận được promise không?
- Nếu một metric yếu, team có biết sửa asset/flow nào không?

---

## Final UA Plan Update

Cập nhật trường **hypothesis** trong Final UA Plan bằng mẫu này:

```text
Hypothesis:
We believe [player motivation] will respond to [ad promise] because [store proof] and [first-session proof] can make the promise believable.

Test scope:
[Platform/country/channel], [budget cap], [duration], [what we are not testing].

Primary signal:
[Metric + why it answers the test question].

Guardrail:
[Metric/event that prevents a false read].

Allowed decision:
[What this test can decide after the first readout].

Blocked conclusions:
[What this test cannot prove yet].

Stop-loss:
[Spend cap, pause condition, owner].

Action rules:
- If ad signal is weak: [creative action].
- If store signal is weak: [store action].
- If first-session signal is weak: [product/onboarding action].
- If signal is mixed or sample is too small: [rerun/narrow/inconclusive rule].

Readout memo format:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next action owner:
```

Plan field được cập nhật: **hypothesis**. Các bài Week 2 sẽ dùng field này để xây metric map, event taxonomy và test readout.

---

## Checklist Focus

- [ ] Hypothesis card có đủ player motivation, ad promise, store proof và first-session proof.
- [ ] Test scope có budget cap, duration và điều không test.
- [ ] Primary signal và guardrail metric đã gắn với câu hỏi học hỏi.
- [ ] Action rules tách rõ weak ad, weak store, weak first session.
- [ ] Có decision allowed và blocked conclusions để tránh over-read sample nhỏ.
- [ ] Có stop-loss rule và owner rõ trước khi chạy.
- [ ] Readout memo mẫu đã chuẩn bị trước khi data về.
- [ ] Không dùng benchmark như luật cứng; chỉ dùng decision ranges cho sprint.
- [ ] Final UA Plan field **hypothesis** đã được cập nhật.

---

## Curated References

- [Google Play Console - Store listing experiments](https://play.google.com/console/about/store-listing-experiments/) - Official Play Console surface for testing graphics and localized text to improve listing performance.
- [Royal Match - The New King from Turkey? - Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/3/21/royal-match-the-new-king-from-turkey) - Public puzzle teardown useful for reading gameplay promise, speed, power-up feel and player agency as continuity signals.
- [Royal Match on Google Play](https://play.google.com/store/apps/details?hl=en_US&id=com.dreamgames.royalmatch) - Public store surface for observing how a puzzle product presents its promise.
