---
day: 17
title: "Creative test matrix"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Creative testing, CTR, CVR]
artifact: "Creative test matrix v1"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Creative test matrix v1**: một bảng test nhỏ nhưng đọc được, dùng để quyết định hook nào nên giữ, hook nào cần sửa, và hook nào phải bỏ trước khi bước vào soft-launch.

Quyết định chính: **trong mỗi test cell, chỉ thay đổi một biến lớn để kết quả còn đọc được**.

Kết quả cần có:
- 3 hook chính, mỗi hook có 2 variant có kiểm soát.
- Mỗi row có learning goal, primary metric và next action rõ.
- Không còn backlog creative kiểu "làm thêm vài video cho đủ".
- Final UA Plan được cập nhật ở field **Creative matrix v1** và **Creative decision rules**.

---

## Why this matters

Creative testing với budget nhỏ rất dễ thành random testing. Nếu mỗi variant đổi cả hook, style, CTA, camera angle và gameplay moment, bạn sẽ không biết thắng vì điều gì. Khi đó `CTR` cao chỉ tạo cảm giác vui, không tạo quyết định sản phẩm.

Với `$100-500`, mục tiêu không phải tìm "winner tuyệt đối". Mục tiêu là loại bỏ các promise sai, tìm 1-2 motivation đáng test tiếp, và bảo vệ tiền khỏi những cell không thể đọc.

Chuỗi cần giữ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Creative matrix tốt giúp bạn biết khi nào sửa creative, khi nào sửa store, và khi nào sửa game.

---

## Core model: one learning question per cell

Một creative cell tốt trả lời một câu hỏi duy nhất:

> Nếu cell này thắng hoặc thua, mình biết phải làm gì tiếp không?

| Cell type | Câu hỏi học | Biến được thay đổi | Metric đọc chính |
| --- | --- | --- | --- |
| Hook test | Motivation nào hút đúng người chơi hơn? | Promise/hook | `CTR`, `IPM`, store `CVR` |
| Opening test | 3 giây đầu nào làm người xem hiểu nhanh hơn? | Opening frame/sequence | `CTR`, thumbstop nếu có, `IPM` |
| Proof test | Store/game proof nào giữ promise tốt hơn? | Store proof hoặc first-session proof | `CVR`, D1, level depth |
| CTA/copy test | Câu chữ nào giảm hiểu nhầm? | CTA hoặc caption | `CTR`, `CVR` |

Không trộn nhiều cell type trong cùng một test nhỏ.

---

## Creative test matrix mẫu

![Creative test matrix mẫu](content/assets/usecases/day-17-data-visual.svg)


| Hook family | Variant A | Variant B | One variable changed | Learning goal | Primary metric | Next action |
| --- | --- | --- | --- | --- | --- | --- |
| Satisfying clear | Starts with messy board | Starts with near-clear board | Opening state | Board state nào dễ hiểu hơn? | `CTR`, `IPM` | Giữ opening thắng, làm 2 visual variants |
| Relax | Calm colors, no timer | Calm colors, soft timer visible | Pressure cue | Có nên nhấn "no pressure" không? | `CTR`, D1 | Nếu timer làm D1 yếu, bỏ pressure cue |
| Challenge | "Can you solve this?" | "Find the perfect move" | Copy framing | Challenge có bị clickbait không? | `CTR`, `CVR`, D1 | Nếu CTR cao CVR thấp, giảm curiosity copy |

Decision gates cho moi row:

| Gate | Evidence pattern | Decision | Production request |
| --- | --- | --- | --- |
| Keep | `CTR/IPM` tot hon baseline, store `CVR` khong gay, D1 khong xau di | Giu hook family | Lam 1-2 variants chi doi opening/proof |
| Revise creative | `CTR` yeu nhung store/D1 tu installs con khoe | Sua ad execution | Doi first 2 seconds, crop, caption, pacing |
| Fix store proof | `CTR` tot nhung `CVR/IPM` yeu | Sua store/listing proof | Screenshot 1-3 phai match ad promise |
| Rewrite promise | `CTR` tot, `CVR` yeu, D1 yeu lap lai | Hook co nguy co curiosity trap | Viet lai motivation, khong reskin asset |
| Pause | sample nho, spend lech, tracking conflict | Khong ket luan | Reconcile setup truoc khi production them |

Gate rule: mot cell chi duoc len production request khi no co `evidence pattern + decision + owner + next variant`. Neu chi co "asset nay dep", row do chua phai learning cell.

Điều quan trọng: mỗi row thay đổi một biến lớn. Nếu A và B khác cả hook, visual, CTA và gameplay moment, kết quả không còn dùng được.

### Production brief gate

Matrix tốt không dừng ở việc chọn winner. Nó phải biến kết quả thành **creative production brief** đủ rõ để artist/editor làm đúng variant tiếp theo mà không đoán.

Trước khi gửi yêu cầu sản xuất, mỗi winning row phải qua 4 câu hỏi:

| Gate | Câu hỏi | Pass nếu | Fail thì |
| --- | --- | --- | --- |
| Learning clarity | Row này học được điều gì cụ thể? | Có một câu học rõ: opening, promise, proof hoặc copy | Viết lại learning goal |
| Funnel integrity | Winner có giữ được store proof và first-session proof không? | `CTR/IPM` không thắng bằng cách làm hỏng `CVR` hoặc D1 | Sửa promise/proof trước |
| Next variant logic | Variant tiếp theo thay đổi biến nào? | Có 1-2 biến nhỏ được phép đổi | Không sản xuất thêm asset |
| Budget discipline | Test tiếp theo cần bao nhiêu cell? | Giảm hoặc giữ số cell; không phình backlog | Cắt bớt hook yếu |

Creative request nên viết theo format:

```text
Production brief
- Hook family:
- Evidence pattern:
- Decision:
- Keep unchanged:
- Change one thing:
- Store proof required:
- First-session proof required:
- Stop rule for next test:
```

Nếu production brief không điền được, row đó chưa đủ chín để làm thêm video. Với budget nhỏ, "sản xuất thêm" chỉ đúng khi nó làm giảm uncertainty, không phải khi team thấy cần nhiều asset hơn cho đẹp backlog.

---

## Operating diagram: creative test flow

![Operating diagram: creative test flow](content/assets/usecases/day-17-hero-diagram.svg)


```text
Backlog hooks
  |
  v
Group by motivation
  |
  v
Pick 3 hook families
  |
  v
Create 2 controlled variants per family
  |
  v
Run small test
  |
  v
Read pattern:
  CTR only? -> creative curiosity
  CTR + CVR? -> ad/store fit
  CTR + CVR + D1? -> stronger motivation fit
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Matrix đi từ motivation đến controlled variants | Test tốt bắt đầu bằng grouping, không bắt đầu bằng sản xuất ngẫu nhiên | Không suy ra variant thắng là "winner forever" |
| Metric đọc theo tầng funnel | `CTR` chỉ là cửa đầu, không đủ để scale | Không bỏ qua store/game chỉ vì ad click tốt |

---

## Chart: interpretability vs number of changed variables

:::chart
title: Interpretability drops when variants change too much, 1-5
One variable changed|5|Easy to diagnose
Two variables changed|3|Usable but cautious
Three or more variables changed|1|Hard to know why it won
:::

| Variant design | Interpretability | Micro-budget decision |
| --- | ---: | --- |
| Chỉ đổi opening frame | 5/5 | Tốt cho test nhanh |
| Đổi opening + caption | 3/5 | Chấp nhận nếu ghi rõ tradeoff |
| Đổi hook + gameplay + style + CTA | 1/5 | Không nên dùng cho learning test |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Càng nhiều biến đổi, càng khó biết lý do thắng | Budget nhỏ cần cell dễ đọc hơn cell đẹp | Không hiểu chart như luật cấm mọi thay đổi sáng tạo |

---

## Hướng dẫn đọc số

| Pattern | Diagnosis | Next action |
| --- | --- | --- |
| `CTR` cao, `CVR` thấp, D1 thấp | Hook gây tò mò nhưng promise yếu hoặc clickbait | Sửa hook/store proof, không scale |
| `CTR` vừa, `CVR` cao, D1 ổn | Hook ít ồn ào nhưng fit tốt hơn | Làm thêm variant quanh motivation này |
| `CTR` thấp, D1 cao từ installs ít | Game giữ chân được, ad truyền tải chưa tốt | Sửa opening hoặc format, không bỏ game loop |
| `CTR` cao, `IPM` thấp | Click có nhưng install không theo | Kiểm tra store screenshot, app name, short description |
| Hai variant khác nhau quá nhiều | Kết quả không đọc được | Chạy lại test với biến kiểm soát rõ hơn |

Đừng dùng `CTR` như bảng xếp hạng sáng tạo. Với puzzle game, `CTR` cao từ curiosity có thể làm bạn mua nhầm người chơi không muốn ở lại.

Decision depth: trước khi chọn winner, hãy đọc mỗi cell qua 4 lớp.

| Lớp đọc | Câu hỏi cần trả lời | Nếu câu trả lời chưa rõ |
| --- | --- | --- |
| Signal quality | Cell có đủ impression/click/install tối thiểu để không bị nhiễu quá mạnh không? | Không kết luận winner; chỉ ghi là directional signal |
| Spend fairness | Hai variant có được phân phối tương đối công bằng không? | Không so sánh trực tiếp; kiểm tra setup campaign/ad set |
| Promise fit | Ad promise có được store proof và first session xác nhận không? | Sửa proof chain trước khi sản xuất thêm creative |
| Decision usefulness | Kết quả dẫn đến action cụ thể nào? | Row chưa đạt chuẩn learning cell, cần viết lại câu hỏi học |

Một cách đọc thực tế:

```text
If signal is weak -> label as directional, do not scale.
If CTR wins but CVR/D1 loses -> diagnose promise mismatch.
If CTR loses but D1 wins -> improve communication, do not kill the loop.
If metrics conflict -> choose the action that preserves the promise chain.
```

Micro-budget rule: kết quả tốt nhất không phải là cell có số đẹp nhất, mà là cell làm giảm uncertainty nhiều nhất cho quyết định tiếp theo.

### Budget allocation read

Với `$100-500`, bạn không có quyền đọc mọi cell như nhau. Matrix cần rule phân bổ tiền trước khi test để tránh winner giả do một variant được delivery quá nhiều hoặc quá ít.

| Situation | Cách đọc | Budget action | Không nên làm |
| --- | --- | --- | --- |
| Một variant được delivery vượt xa variant còn lại | So sánh trực tiếp dễ sai | giữ kết luận ở mức directional, kiểm campaign delivery | tuyên bố winner |
| Hook family có cả `CTR` và `CVR` yếu | Tín hiệu yếu khá rõ | dừng family hoặc viết lại promise | bơm thêm variant cùng logic |
| Hook có `CTR` yếu nhưng D1 tốt | Communication yếu, loop có thể ổn | cấp ít budget cho execution retest | bỏ luôn core loop |
| Hook có `CTR` cao nhưng `CVR/D1` yếu | Attention không chuyển thành intent/fit | giảm budget, sửa proof chain | scale vì ad rẻ click |
| Hai hook đều directional tốt | Chưa có winner mạnh | chọn hook dễ chứng minh bằng store/first-session hơn | chia nhỏ budget thêm nhiều cell |

Một rule thực tế cho micro test:

```text
Spend rule:
- Start with 3 hook families x 2 variants only.
- Do not add a new family until one existing family is paused.
- Give extra production only to rows that have a clear next variant and proof chain.
- Never increase budget because CTR alone looks exciting.
```

### Creative cell acceptance contract

Trước khi một row được gọi là "winner", "weak" hoặc "paused", hãy điền contract này. Nó ép team tách signal đọc được khỏi kết luận bị cấm.

| Contract field | Câu hỏi cần trả lời | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Cell question | Row này học điều gì? | Một learning question duy nhất | Row chỉ là asset backlog |
| Variable changed | A/B khác nhau ở biến nào? | Một biến lớn hoặc tradeoff được ghi rõ | Không biết vì sao thắng/thua |
| Evidence pattern | Metric nào ủng hộ decision? | `CTR/CVR/D1/IPM` được đọc theo chain | Chỉ chọn theo cảm giác |
| Blocked conclusions | Điều gì chưa được kết luận? | Không scale/kill/product verdict nếu chưa đủ proof | Overclaim từ `CTR` |
| Frozen variables | Cái gì giữ nguyên ở retest? | store/build/geo/hook/proof được ghi rõ | Retest bẩn |
| Production ticket | Sản xuất gì tiếp theo? | giữ gì, đổi gì, owner/date | team làm thêm video mơ hồ |
| Stop/retest trigger | Khi nào pause hoặc rerun? | spend/sample/metric trigger rõ | tiếp tục mua noise |

```text
Creative cell acceptance contract
- Cell question:
- Variable changed:
- Evidence pattern:
- Decision:
- Blocked conclusions:
- Frozen variables:
- Production ticket:
- Stop/retest trigger:
```

Acceptance rule: nếu contract không nói được `blocked conclusions`, row chưa đủ sạch để production tiếp. Trong micro-budget, biết điều gì **chưa được kết luận** quan trọng ngang với biết cell nào đang hứa hẹn.

---

## Worked example: 3x2 matrix cho puzzle hook

| Hook family | A | B | Result giả định | Diagnosis | Decision |
| --- | --- | --- | --- | --- | --- |
| Satisfying clear | Messy board -> one clear | Almost solved board -> final clear | A có `CTR` thấp hơn B, nhưng `CVR` và D1 tốt hơn | A nói đúng core loop hơn, B hơi quá dễ | Giữ A, làm lại opening rõ hơn |
| Challenge | "Only 1% solve this" | "Find the perfect move" | A `CTR` cao, `CVR` thấp; B `CTR` vừa, D1 ổn | A curiosity trap, B honest challenge | B là direction an toàn hơn |
| Relax | No timer, soft colors | Timer visible, faster pace | Timer tăng `CTR`, giảm D1 | Người click vì pressure nhưng game fit relax hơn | Bỏ timer trong relax family |

Verdict: matrix giúp bạn tránh chọn nhầm variant có click cao nhưng làm hỏng promise chain.

Second-pass read:

| Row | First read | Risk if you stop there | Better decision |
| --- | --- | --- | --- |
| Satisfying clear | B có `CTR` cao hơn nên tưởng là tốt hơn | B có thể over-promise vì board quá dễ | Giữ motivation của A, sửa opening để rõ hơn |
| Challenge | A thắng attention | A có thể mua nhầm người chơi thích câu đố mẹo, không thích core loop | Dùng B làm base, test thêm proof mạnh hơn |
| Relax | Timer tăng click | Timer kéo sai audience vào một game relax | Tách timer sang challenge family, không trộn vào relax |

Khi ghi decision, đừng viết "A wins". Hãy viết: "A wins for acquisition clarity, but B is safer for retention" hoặc "B wins attention but loses promise fit". Câu decision phải nói được tradeoff, không chỉ nói người thắng.

### Production ticket examples

Sau khi đọc matrix, output tốt nhất là 1-2 ticket sản xuất rất cụ thể, không phải danh sách asset chung chung.

```text
Ticket 1 - Satisfying clear retest
Evidence pattern: Messy board variant has weaker CTR but stronger CVR/D1 than almost-solved variant.
Decision: Keep honest board state, improve first 2 seconds clarity.
Keep unchanged: hook family, gameplay moment, store screenshot proof.
Change one thing: opening crop/zoom so the solvable move is visible faster.
Do not change: CTA, color palette, reward moment, store proof.
Stop rule: pause if CTR stays weak and IPM does not improve after same spend window.
```

```text
Ticket 2 - Challenge rewrite
Evidence pattern: "Only 1% solve this" wins CTR but loses CVR.
Decision: retire curiosity trap, keep challenge motivation.
Keep unchanged: puzzle difficulty cue.
Change one thing: copy from impossible claim to concrete task.
Store proof required: screenshot/video must show the exact puzzle logic promised in ad.
Stop rule: pause if honest challenge copy cannot reach acceptable IPM while D1 stays flat.
```

Hai ticket này giúp creative team biết **cái gì được giữ**, **cái gì được đổi**, và **vì sao**. Đây là điểm khác nhau giữa creative testing có hệ thống và chỉ làm thêm video.

---

## Creative matrix quality checklist

| Check | Pass condition |
| --- | --- |
| Hook family | Mỗi row gắn với một motivation rõ |
| Variant control | A/B chỉ đổi một biến lớn |
| Proof chain | Ad promise có store proof và first-session proof |
| Metric read | Mỗi row có primary metric và supporting metric |
| Next action | Có hành động cho win, weak signal, loss |
| Stop rule | Biết khi nào bỏ hook thay vì sản xuất thêm |

Quality chain verification:

`motivation -> hook family -> variant -> metric pattern -> decision`

Nếu thiếu next action, row đó chưa nên chạy.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Apple Product Page Optimization

Nguồn: [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple cho phép test alternate product page versions với app icons, screenshots và app preview videos. | Creative testing không dừng ở ad. Store proof cũng là một biến cần ghi trong matrix nếu `CVR` là metric đọc. | Không suy ra Android-first team cần chạy iOS PPO ngay trong micro test đầu tiên. |
| Apple khuyến nghị cân nhắc số element thay đổi trong treatment vì điều đó ảnh hưởng khả năng biết element nào tạo ra kết quả. | Đây là cùng logic với creative matrix: càng đổi nhiều biến, kết quả càng khó đọc. | Không dùng product page test để che một ad promise không trung thực. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Treatment có thể đổi icon, screenshot hoặc app preview | Creative matrix nên ghi rõ store proof tương ứng với từng hook | Không chạy nhiều store variants nếu chưa đủ traffic để đọc |

### Usecase 2: Google Play preview assets

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nêu screenshots nên thể hiện trải nghiệm app/game thật và giúp người dùng dự đoán trải nghiệm sau khi tải. | Khi matrix test hook, hãy ghi luôn store proof tương ứng để không đọc nhầm `CVR`. | Không suy ra screenshot đẹp là đủ nếu nó không chứng minh hook. |
| Google Play nói preview video nên cho thấy core value và gameplay thật sớm. | Nếu variant video thắng nhờ motion, store proof nên có video hoặc screenshot xác nhận cùng gameplay moment. | Không bắt buộc thêm video khi static/screenshot đã đủ chứng minh promise. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Làm 10 variant nhưng mỗi variant khác hoàn toàn | Làm 3x2 matrix, mỗi row một hook family, mỗi pair đổi một biến lớn |
| Chọn winner chỉ bằng `CTR` | Đọc `CTR` cùng `CVR`, `IPM`, D1 hoặc level depth |
| Không ghi learning goal trước khi chạy | Mỗi row phải có câu hỏi học và next action |
| Gộp creative test với store test mà không ghi rõ | Tách ad variable và store proof variable |
| Thấy kết quả nhiễu rồi sản xuất thêm | Giảm số cell, tăng độ kiểm soát của test |

---

## English Terms You Should Keep

- **Creative testing**: Test creative để học hook, motivation, format hoặc proof nào đáng giữ.
- **CTR**: Click-through rate, tỷ lệ click trên impression.
- **CVR**: Conversion rate, tỷ lệ chuyển đổi từ click hoặc store visit sang install.
- **IPM**: Installs per Mille, install trên 1000 impressions.
- **Variant**: Một phiên bản creative trong test.
- **Control variable**: Biến được giữ nguyên để kết quả còn đọc được.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Hook family | Satisfying clear |
| Variant A | Messy board -> one move -> clear |
| Variant B | Almost solved board -> final clear |
| Variable changed | Opening board state |
| Learning goal | Opening nào làm promise dễ hiểu hơn? |
| Primary metric | `CTR`, `IPM` |
| Supporting metric | Store `CVR`, first-session clear depth |
| Win action | Produce 2 more variants around winning opening |
| Weak action | Rewrite hook or improve store proof |
| Loss action | Pause hook family for this sprint |

Card preview:

```text
Creative test row
Hook family: Satisfying clear
Question: Which opening board state communicates the payoff faster?
Variable: Opening state only
Decision: Keep, revise, or pause
```

Production ticket preview:

```text
Creative production ticket
Hook family:
Evidence pattern:
Decision:
Keep unchanged:
Change one thing:
Proof required:
Stop rule:
Owner:
```

Creative cell acceptance contract:

```text
Cell question:
Variable changed:
Evidence pattern:
Decision:
Blocked conclusions:
Frozen variables:
Production ticket:
Stop/retest trigger:
```

---

## Practical Lab

1. Gom creative backlog thành 3 hook families theo motivation.
2. Với mỗi family, tạo 2 variant chỉ khác một biến lớn.
3. Viết learning goal cho từng row.
4. Ghi primary metric, supporting metric và next action.
5. Xóa hoặc hoãn mọi cell không trả lời được câu hỏi học.
6. Viết 1 production ticket cho row mạnh nhất.
7. Viết 1 stop rule cho row dễ gây nhầm nhất.
8. Điền Creative cell acceptance contract cho ít nhất 2 row.

Quality chain check:

- Nếu A thắng, bạn biết làm gì tiếp không?
- Nếu B thắng, bạn biết vì sao không?
- Nếu cả hai thua, bạn biết sửa creative, store hay first session không?
- Có cell nào đổi quá nhiều biến không?
- Production ticket có nói rõ giữ gì và đổi gì không?
- Stop rule có ngăn team scale từ `CTR` đơn lẻ không?
- Contract có ghi blocked conclusions và frozen variables không?

---

## Final UA Plan Update

Cập nhật các field sau:

```text
Creative matrix v1:
- Hook family:
- Variant A:
- Variant B:
- Controlled variable:
- Learning goal:
- Primary metric:
- Supporting metric:
- Win action:
- Weak signal action:
- Stop rule:
- Creative cell acceptance contract:
- Blocked conclusions:
- Frozen variables:

Creative decision rules:
- CTR alone is not a scale signal.
- Keep variants interpretable.
- Store proof must match each top hook.
- Production request must state evidence pattern, what stays unchanged, what changes, and stop rule.
- Every accepted row must state blocked conclusions before new production.
```

---

## Checklist Focus

- Mỗi row có một learning question.
- Mỗi A/B pair chỉ đổi một biến lớn.
- Không chọn winner bằng `CTR` đơn lẻ.
- Mỗi hook có store proof và first-session proof.
- Có win action, weak-signal action và stop rule.
- Mỗi accepted row có Creative cell acceptance contract.
- Có blocked conclusions và frozen variables trước production ticket.

---

## Curated References

- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
