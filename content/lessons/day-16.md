---
day: 16
title: "Video, static and playable concepts"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Playable ad, Creative testing, IPM]
artifact: "Format selection matrix"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Format selection matrix** cho 3-5 hook creative đầu tiên của game puzzle mobile. Artifact này giúp bạn quyết định hook nào nên test bằng `static`, hook nào cần `short video`, và khi nào mới đáng làm `playable concept`.

Quyết định chính: **chọn format rẻ nhất nhưng vẫn chứng minh đúng lời hứa của hook**.

Kết quả cần có:
- Mỗi hook có một format test phù hợp với mức độ cần chứng minh.
- Mỗi format ghi rõ nó có thể chứng minh điều gì và không chứng minh được điều gì.
- Mỗi format có metric đọc chính: `CTR`, `CVR`, `IPM`, `D1`, hoặc first-session depth.
- Final UA Plan được cập nhật ở phần **Creative matrix** và **Production scope**.

---

## Why this matters

Với ngân sách `$100-500`, sai format có thể làm hỏng toàn bộ vòng học. Nếu bạn làm playable quá sớm, tiền sản xuất ăn hết tiền test. Nếu bạn chỉ dùng static cho một hook cần motion, bạn có thể kết luận sai rằng hook yếu, trong khi thật ra format chưa đủ sức chứng minh gameplay.

Team indie thường mắc bẫy: thấy các studio lớn dùng video đẹp hoặc playable polished rồi cố bắt chước ngay. Cách đọc đúng cho micro soft-launch là: format không phải để "làm ad cho hay", mà để trả lời một câu hỏi vận hành cụ thể.

Chuỗi cần bảo vệ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Nếu format không chứng minh được mắt xích đầu tiên, mọi metric phía sau đều khó debug.

---

## Core model: format là mức độ chứng minh promise

Đừng hỏi "format nào performance tốt nhất?". Hãy hỏi:

> Hook này cần chứng minh bằng ảnh tĩnh, chuyển động, hay tương tác?

| Format | Chứng minh tốt | Không chứng minh tốt | Khi nên dùng |
| --- | --- | --- | --- |
| **Static** | Visual promise, board state, before/after, style, clarity của một ý tưởng | Flow chuyển động, cảm giác thao tác, độ thỏa mãn của combo | Test hook rẻ, test store-like promise, test angle đầu tiên |
| **Short video** | Motion clarity, satisfying moment, sequence trước và sau hành động | Người chơi có thật sự muốn thao tác không | Hook cần thấy hành động như clear, sort, merge, explode |
| **Playable concept** | Interaction promise, "tôi chạm vào là hiểu", friction của điều khiển | Retention dài hạn, monetization, full game quality | Chỉ làm khi static/video đã có tín hiệu và core interaction là lý do mua traffic |

Quy tắc thực hành:

1. Nếu hook có thể hiểu trong 1 khung hình, bắt đầu bằng static.
2. Nếu hook cần thấy thay đổi trạng thái, dùng short video.
3. Nếu hook phụ thuộc vào cảm giác tự tay thao tác, mới cân nhắc playable.

### Format readiness gate

Trước khi chọn format, hãy hỏi 4 gate này. Gate giúp team không dùng format đắt để che một hook chưa rõ.

| Gate | Câu hỏi | Static đủ khi | Cần video/playable khi |
| --- | --- | --- | --- |
| Promise clarity | Người xem có hiểu lời hứa trong một frame không? | Board state, outcome hoặc mood đọc được ngay | Cần thấy trước/sau hoặc thao tác mới hiểu |
| Proof debt | Ad/store/game đã có bằng chứng thật cho promise chưa? | Screenshot hoặc gameplay hiện tại đã chứng minh được | Cần quay sequence mới hoặc cần interaction slice |
| Learning risk | Nếu signal yếu, team biết sửa surface nào không? | Biết sửa hook/crop/store screenshot | Không biết fail vì motion, input hay product |
| Production affordability | Chi phí asset có để lại đủ tiền media test không? | Static/video nhẹ vẫn để lại budget học | Playable ăn mất phần lớn ngân sách test |

```text
Format readiness = promise clarity + proof debt + learning risk + production affordability
```

Nếu readiness thấp, đừng escalate format. Hãy sửa hook, proof chain hoặc production scope trước. Format đắt hơn chỉ đáng làm khi nó trả lời câu hỏi mà format thấp hơn không thể trả lời.

---

## Format selection matrix mẫu

```text
![Format selection matrix mẫu](content/assets/usecases/day-16-data-visual.svg)Type: hero operating diagram.
Lesson section: Format selection matrix mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


Điền bảng này trước khi sản xuất asset:

| Hook | Player promise | Format chọn | Vì sao format này đủ | Metric chính | Nếu tín hiệu yếu thì sửa gì |
| --- | --- | --- | --- | --- | --- |
| "Clear chaos in one smart move" | Người chơi thấy board rối rồi được dọn sạch | Short video | Cần thấy trước, hành động, sau | `CTR`, `IPM`, first-session clear event | Sửa 3 giây đầu hoặc làm rõ board state |
| "A calm 2-minute puzzle break" | Nghỉ não nhẹ, không áp lực | Static hoặc short video nhẹ | Một screenshot sạch có thể chứng minh mood | `CTR`, store `CVR`, D1 | Sửa store screenshot hoặc tutorial friction |
| "Can you solve this one move?" | Thử thách trí tuệ nhanh | Static trước, video nếu cần | Board state phải đủ đọc trong ảnh | `CTR`, `CVR`, retry rate | Giảm clickbait, làm challenge công bằng hơn |
| "Drag the screws out" | Cảm giác tháo gỡ bằng tay | Playable concept sau khi video có tín hiệu | Interaction là promise chính | `IPM`, playable completion, install quality | Sửa input friction hoặc quay lại video |

Framework này dùng để ra quyết định production: bạn không sản xuất asset vì "thiếu format", bạn sản xuất vì một hook cần bằng chứng ở cấp độ đó.

### Production scope contract

Mỗi format được chọn cần một contract nhỏ trước khi gửi đi sản xuất.

| Contract field | Ý nghĩa | Ví dụ |
| --- | --- | --- |
| Proof job | Format này phải chứng minh điều gì? | Video phải chứng minh board chuyển từ chaos sang clear payoff |
| Minimum viable asset | Asset nhỏ nhất đủ học là gì? | 1 video 6-8s, 1 hook, 1 opening, không cần 5 end cards |
| Frozen surfaces | Những gì phải giữ nguyên để đọc được kết quả? | Cùng store screenshot, cùng build, cùng country, cùng tutorial |
| Escalation trigger | Khi nào mới nâng format? | Static có CTR/CVR đủ sạch nhưng câu hỏi tiếp theo là motion |
| De-escalation trigger | Khi nào phải quay về format rẻ hơn? | Playable có completion cao nhưng install quality hoặc D1 yếu |

Contract này làm rõ format không phải "level cao hơn" của creative. Nó là công cụ bằng chứng. Nếu proof job chỉ là "nhìn board có hấp dẫn không", static có thể đủ. Nếu proof job là "combo có thỏa mãn không", video hợp lý hơn. Nếu proof job là "người chơi có muốn tự kéo/thả không", playable mới có quyền xuất hiện.

---

## Operating diagram: chọn format theo độ cần chứng minh

```text
![Operating diagram: chọn format theo độ cần chứng minh](content/assets/usecases/day-16-hero-diagram.svg)Type: data visual/chart or decision board.
Lesson section: Operating diagram: chọn format theo độ cần chứng minh.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Hook idea
  |
  v
Can the promise be understood in one frame?
  | yes -> Static test -> read CTR + Store CVR
  | no
  v
Does the promise need motion/change of state?
  | yes -> Short video -> read CTR + IPM + first-session proof
  | no
  v
Does the promise depend on touch/interactivity?
  | yes -> Playable concept only after video/static signal
  | no -> Rewrite hook, because the proof job is unclear
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Format tăng dần theo chi phí và độ chứng minh: static -> video -> playable | Playable không phải bước mặc định, mà là bước sau khi hook cần interaction proof | Không suy ra playable luôn tốt hơn video hoặc static |
| Mỗi nhánh gắn với một metric đọc khác nhau | Format choice quyết định bạn sẽ debug creative, store hay first session | Không dùng một metric duy nhất để so sánh mọi format |

---

## Data visual: cost of learning by format

:::chart
title: Relative production cost and proof strength, 1-5
Static|1|Low production cost, proves visual promise
Short video|3|Medium cost, proves motion and sequence
Playable concept|5|High cost, proves interaction but can overpromise
:::

| Format | Relative cost | Proof strength | Micro-budget rule |
| --- | ---: | ---: | --- |
| Static | 1/5 | 2/5 | Dùng để loại hook mơ hồ trước khi tốn công quay video |
| Short video | 3/5 | 4/5 | Dùng cho 2-3 hook mạnh nhất cần chứng minh motion |
| Playable concept | 5/5 | 5/5 | Chỉ dùng khi interaction là hook chính và đã có tín hiệu trước |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Playable có proof strength cao nhưng cost cũng cao | Trong micro soft-launch, playable là công cụ xác nhận, không phải công cụ khám phá đại trà | Không dùng chart này như benchmark giá sản xuất cố định |

---

## Hướng dẫn đọc số

Đọc format test theo câu hỏi format đó được thiết kế để trả lời:

| Metric pattern | Cách đọc | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| Static có `CTR` thấp | Hook hoặc visual promise chưa đủ rõ trong một khung hình | Viết lại promise, đổi crop, làm board state dễ đọc hơn | Chuyển ngay sang playable để "cứu" hook |
| Static `CTR` ổn, store `CVR` thấp | Ad promise hấp dẫn nhưng store không xác nhận promise | Sửa icon, first screenshot, short description | Kết luận audience sai |
| Video `CTR` cao, D1 thấp | Motion gây tò mò nhưng first-session proof không giữ lời | Kiểm tra tutorial, level 1-3, difficulty spike | Scale vì video hút click |
| Playable completion cao, install quality thấp | Playable vui hơn hoặc khác game thật | Làm playable trung thực hơn hoặc sửa game first session | Giữ playable fake vì IPM đẹp |

Với budget nhỏ, đọc `IPM` như tín hiệu tổng hợp của ad + store. Nhưng đừng dùng `IPM` để bỏ qua chất lượng người chơi. Nếu `IPM` ổn mà D1 hoặc level depth thấp, bạn đang mua curiosity, không phải motivation fit.

Format escalation ledger:

| Current signal | Format decision | Why | Next production request |
| --- | --- | --- | --- |
| Static có `CTR` yếu và promise đã rõ trong một frame | Stay static or rewrite hook | Motion không sửa được motivation mơ hồ | Rewrite promise/crop/board state trước khi làm video |
| Static có `CTR` ổn nhưng store `CVR` yếu | Do not escalate format yet | Store proof có thể là leak, không phải ad format | Sửa screenshot 1/copy với cùng promise |
| Static có `CTR` và `CVR` ổn, nhưng hook cần transformation proof | Escalate to short video | Uncertainty tiếp theo là before/after sequence | Làm một video 6-8s, giữ hook/store ổn định |
| Short video có `IPM` mạnh nhưng D1 yếu | Do not make playable yet | Promise có thể đang mua curiosity user | Kiểm tra first-session proof và promise honesty |
| Short video có `CTR/CVR/D1` nhất quán và interaction là core promise | Consider playable concept | Câu hỏi còn lại là touch/friction, không phải attention | Làm playable slice nhỏ khớp gameplay thật |
| Playable completion cao nhưng install quality thấp | De-escalate or rebuild playable | Playable có thể vui hơn hoặc khác game thật | Làm playable trung thực hơn hoặc quay lại video |

Decision rule:

```text
Escalate format only when the next unanswered question requires a higher proof level.
Do not escalate because the previous asset performed badly.
Do not keep a high-cost format if it creates better ad metrics but worse player quality.
```

Format choice phải bảo vệ learning budget. Static dùng cho clarity, video dùng cho sequence, playable dùng cho interaction truth. Nếu câu hỏi thật là store continuity hoặc first-session proof, đổi format có thể là sai lever.

Format change log:

```md
Format change log
- Hook:
- Previous format:
- New format:
- Reason for change:
- Question the old format could not answer:
- Surface kept stable:
- Metric that will confirm the change helped:
```

Nếu không điền được dòng "question the old format could not answer", việc đổi format có thể chỉ là phản ứng cảm tính với số xấu.

### Format production release memo

Trước khi asset được sản xuất hoặc format được escalate, viết memo này. Nó khóa lý do format được chọn và điều gì format đó không được phép chứng minh.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Selected format | Static, short video hay playable? | Một format chính |
| Proof job | Format phải chứng minh điều gì? | visual clarity, motion, transformation, interaction |
| Minimum viable asset | Asset nhỏ nhất đủ học là gì? | không làm full production nếu 6s video đủ |
| Blocked conclusions | Format không được kết luận gì? | retention, LTV, product fit nếu chỉ test attention |
| Escalation trigger | Khi nào nâng format? | câu hỏi cũ không trả lời được bằng format thấp hơn |
| De-escalation trigger | Khi nào quay lại format rẻ hơn? | format đắt tạo vanity metric nhưng quality yếu |

```text
Format production release memo
- Hook:
- Selected format:
- Proof job:
- Minimum viable asset:
- Blocked conclusions:
- Escalation trigger:
- De-escalation trigger:
- Owner/date:
```

Memo này giúp team nói "chúng ta cần video vì phải chứng minh before/after motion", thay vì "video chắc performance tốt hơn". Với micro-budget, lý do sản xuất phải là lý do học.

---

## Worked example: chọn format cho 3 hook puzzle

Giả sử game của bạn là block puzzle có một khoảnh khắc clear board rất thỏa mãn.

| Hook | Format test | Kết quả giả định | Diagnosis | Quyết định |
| --- | --- | --- | --- | --- |
| "Clear chaos in one smart move" | 8s video | `CTR` 2.8%, store `CVR` 31%, D1 ổn | Video chứng minh được motion, store cũng khớp promise | Giữ hook, làm 2 biến thể mở đầu khác nhau |
| "Only 1% can solve this" | Static | `CTR` 4.1%, store `CVR` 13%, D1 yếu | Curiosity trap: click cao nhưng promise có mùi clickbait | Giảm lời hứa, thêm proof challenge công bằng |
| "Drag blocks into perfect order" | Playable concept | Completion cao, install quality thấp | Playable đang vui hơn game thật hoặc khác core loop | Không scale, sửa game/input trước |

Verdict: format thắng không phải format có `CTR` cao nhất. Format thắng là format tạo được tín hiệu nhất quán qua `ad -> store -> first session`.

Second-pass format read:

| Hook | First read | Hidden risk | Better decision |
| --- | --- | --- | --- |
| Clear chaos | Video ổn qua ad/store/D1 | Có thể vẫn hỏng nếu store screenshot không khớp video | Giữ video, làm 2 opening variants, giữ store proof aligned |
| Only 1% | Static kéo click tốt | Challenge promise có thể là curiosity trap, không phải motivation fit | Rewrite claim trước khi escalate sang video |
| Drag blocks | Playable completion đẹp | Playable có thể overpromise so với input/game feel thật | Rebuild playable cho khớp first session hoặc pause playable spend |

Decision memo:

```text
Keep:
- Clear chaos as short video; next test changes opening only.

Revise before escalation:
- Only 1% challenge; fix promise honesty and store proof before video.

Hold:
- Playable concept until real game interaction and playable interaction match.
```

Điểm sâu: escalation không phải phần thưởng cho hook thắng. Escalation là câu trả lời cho câu hỏi "cần bằng chứng cao hơn ở đâu?". Nếu câu hỏi chưa rõ, format đắt hơn chỉ làm noise đẹp hơn.

---

## Production and quality checklist

Trước khi sản xuất asset, kiểm tra chuỗi chất lượng:

| Check | Câu hỏi pass/fail |
| --- | --- |
| Promise honesty | Asset có đang hứa đúng gameplay thật không? |
| Proof fit | Format có đủ để chứng minh promise không? |
| Store continuity | First screenshot hoặc preview video trên store có xác nhận hook không? |
| First-session proof | Level 1-3 có cho người chơi trải nghiệm đúng điều ad hứa không? |
| Metric plan | Bạn đã biết đọc metric nào để quyết định tiếp theo chưa? |
| Production scope | Bạn có đang sản xuất nhiều hơn mức cần học không? |

Quality chain verification:

`hook -> format -> store asset -> level 1-3 -> metric -> next action`

Nếu một mắt xích không rõ, đừng tăng ngân sách.

Production brief template:

```md
Creative production brief

Hook:

Selected format:

Proof job:

Required frames / beats:
1.
2.
3.

Store continuity:

First-session proof:

Frozen surfaces:

Primary metric:

Weak-signal action:

Do not include:
```

Trường `Do not include` quan trọng hơn vẻ ngoài của brief. Nó ngăn asset team thêm logo dài, meta chưa có, effect không tồn tại trong game, hoặc playable interaction khác first session chỉ vì thấy "hấp dẫn hơn".

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Google Play preview video và screenshots

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nói screenshots nên thể hiện trải nghiệm in-game thật, còn preview video nên cho thấy giá trị và trải nghiệm thật sớm trong video. | Store assets là phần tiếp nối của creative format. Nếu ad dùng video để hứa motion, store preview/screenshot đầu phải xác nhận motion hoặc gameplay state tương ứng. | Không suy ra rằng cứ thêm video là store `CVR` sẽ tăng. Video sai promise vẫn có thể làm CVR kém hơn. |
| Google Play khuyến nghị video game tập trung vào core features sớm, trong khoảng đầu video. | Với puzzle game, video test nên đưa satisfying move hoặc board transformation vào sớm, không mở đầu bằng logo dài. | Không dùng quy tắc này như benchmark giây tuyệt đối cho mọi game. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Icon, first screenshot, preview video có cùng promise không | Store continuity là điều kiện để đọc `CVR` công bằng | Không kết luận ad traffic kém khi store chưa chứng minh cùng promise |

### Usecase 2: Apple Product Page Optimization

Nguồn: [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple cho phép thử nhiều treatment trên product page để đo page nào convert tốt hơn. | Store page có thể được xem như một phần của creative testing, không phải asset tĩnh sau cùng. | Không suy ra Android-first team cần làm iOS experiment ngay trong micro test đầu tiên. |
| Treatment có thể thay đổi screenshots, app previews và icon. | Nếu hook video thắng nhưng store yếu, next action hợp lý là sửa store proof trước khi đổi audience. | Không dùng store experiment để che một ad promise không trung thực. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Làm playable ngay vì nghe "playable ads perform tốt" | Chỉ làm playable khi hook phụ thuộc vào cảm giác tương tác và static/video đã có tín hiệu đủ tốt |
| So sánh static, video, playable bằng một metric duy nhất | Đọc mỗi format theo proof job của nó: static đọc clarity, video đọc motion/IPM, playable đọc interaction quality |
| Video mở đầu bằng logo, menu, hoặc meta screen | Đưa core action hoặc before/after promise vào rất sớm |
| Playable khác game thật để tăng completion | Playable phải trung thực với first-session proof, nếu không install quality sẽ nhiễu |
| Sản xuất quá nhiều biến thể cùng lúc | Với budget nhỏ, test ít cell hơn nhưng mỗi cell có câu hỏi rõ hơn |

---

## English Terms You Should Keep

- **Static ad**: Creative dạng ảnh tĩnh, dùng để test visual promise rẻ.
- **Short video**: Video ngắn chứng minh motion, sequence, before/after.
- **Playable ad**: Creative cho người xem tương tác thử, phù hợp khi interaction là promise chính.
- **IPM**: Installs per Mille, số install trên 1000 impressions.
- **Creative testing**: Quy trình test hook/format/variant để học điều gì kéo người chơi phù hợp.
- **Store proof**: Bằng chứng trên store xác nhận lời hứa của ad.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Hook | Clear chaos in one smart move |
| Format | Short video, 8 seconds |
| Why this format | Cần thấy board rối, một move, và board clear |
| Store proof | First screenshot là before/after board clear |
| First-session proof | Level 2 tạo một clear moment trong 90 giây đầu |
| Primary metric | `IPM`, store `CVR`, level depth |
| Weak signal action | Nếu `CTR` ổn nhưng D1 thấp, sửa level 1-3 trước khi scale |
| Production note | Chưa làm playable cho tới khi video có tín hiệu ổn |
| Readiness gate | Motion proof needed, production cost acceptable, store proof available |
| Frozen surfaces | Same build, same first screenshot, same market, same tutorial |
| Format change log | Static skipped because one frame cannot prove before/after payoff |
| Format production release memo | Proof job, minimum asset, blocked conclusions, escalation/de-escalation trigger |

Card preview:

```text
Creative format card
Hook: Clear chaos in one smart move
Format: Short video
Proof job: Show transformation
Metric: IPM + store CVR + first-session clear
Next action if weak: Fix proof chain, not audience first
Frozen: store screenshot, build, tutorial
```

---

## Practical Lab

1. Chọn 3 hook mạnh nhất từ creative backlog.
2. Với mỗi hook, ghi rõ promise cần chứng minh.
3. Chọn format thấp nhất đủ chứng minh promise: static, short video, hoặc playable concept.
4. Ghi metric đọc chính và một weak-signal action.
5. Kiểm tra lại store proof và first-session proof tương ứng.
6. Điền format readiness gate cho từng hook trước khi sản xuất.
7. Viết production scope contract cho asset tốn công nhất.
8. Nếu đổi format sau test, viết format change log trước khi làm asset mới.
9. Viết Format production release memo cho asset được sản xuất.

Quality chain check:

- Ad promise có thật trong game không?
- Store proof có xác nhận cùng promise không?
- Level 1-3 có cho người chơi thấy promise đó không?
- Metric đọc có phân biệt được creative issue, store issue và game issue không?
- Format được chọn có phải format thấp nhất đủ chứng minh promise không?
- Production brief có ghi rõ frozen surfaces và `Do not include` không?
- Release memo có blocked conclusions và trigger escalate/de-escalate không?

---

## Final UA Plan Update

Cập nhật các field sau trong Final UA Plan:

```text
Creative matrix:
- Hook:
- Selected format:
- Proof job:
- Format readiness:
- Minimum viable asset:
- Store proof:
- First-session proof:
- Frozen surfaces:
- Primary metric:
- Weak signal action:
- Format production release memo:

Production scope:
- Assets to produce this week:
- Assets intentionally delayed:
- Reason for delaying playable:
- Format change log, if any:
```

Không ghi "test video/static/playable". Hãy ghi format theo hook và proof job.

---

## Checklist Focus

- Chọn format rẻ nhất nhưng vẫn chứng minh đúng hook.
- Không làm playable nếu chưa rõ interaction là promise chính.
- Mỗi format có một metric đọc chính và một next action.
- Format readiness gate đã pass trước khi sản xuất.
- Production scope contract có proof job, minimum asset, frozen surfaces.
- Format production release memo có blocked conclusions.
- Store proof và first-session proof phải khớp với ad promise.
- Nếu đổi format, format change log giải thích câu hỏi mới cần chứng minh.
- Production scope đủ nhỏ để `$100-500` còn tiền học từ media spend.

---

## Curated References

- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
