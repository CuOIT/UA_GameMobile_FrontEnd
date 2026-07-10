---
day: 3
title: "Audience motivation map"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [Audience, Motivation, Hook]
artifact: "Audience motivation map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Audience motivation map**: một bản đồ nối từng motivation của người chơi với ad hook, store proof, first-session proof và metric pattern tương ứng.

Quyết định cần học: chọn **2 motivation đáng test trước**, không viết audience bằng demographic chung chung.

Kết quả cần có:

- Một audience statement dựa trên hành vi và ngữ cảnh chơi.
- 2-3 motivation candidates có hook riêng.
- Proof chain cho từng motivation: `ad -> store -> first session`.
- Metric pattern để biết motivation nào đang fit hoặc mismatch.
- Cập nhật trường **Target audience** trong Final UA Plan.

---

## Why this matters

Ngân sách `$100-500` không đủ để "để thuật toán tự tìm audience". Nếu bạn nói "nam nữ 18-45 thích puzzle", thuật toán có thể tìm traffic rẻ, nhưng bạn không biết traffic đó muốn relax, muốn thử thách, muốn dọn sạch board hay muốn sưu tầm phần thưởng.

Audience trong UA không phải chỉ là người. Audience là **lý do người đó dừng lại, click, cài và chơi tiếp**.

Khi motivation mơ hồ, mọi thứ phía sau cũng mơ hồ:

- Creative không biết mở đầu bằng cảnh nào.
- Store screenshot không biết chứng minh lời hứa gì.
- Tutorial không biết phải tạo khoảnh khắc proof nào.
- Metric không biết gãy ở audience, hook, store hay product.

Motivation map biến audience thành một hệ thống có thể test.

---

## Core model: audience là motivation, không phải demographic

Demographic có thể hữu ích ở tầng media buying, nhưng chưa đủ cho product-UA decision. Với puzzle game, hai người cùng 30 tuổi có thể chơi vì hai lý do trái ngược: một người muốn thư giãn, một người muốn chứng minh mình giỏi.

Model vận hành:

`context -> motivation -> hook -> proof -> metric signal`

| Layer | Câu hỏi | Ví dụ tốt | Ví dụ yếu |
| --- | --- | --- | --- |
| Context | Người chơi ở tình huống nào? | nghỉ trưa, commute, trước khi ngủ | mọi lúc |
| Motivation | Họ muốn cảm giác gì? | calm focus, satisfying clear, mastery | giải trí |
| Hook | Ad nói gì trong 3 giây? | "clear chaos in one move" | "best puzzle game" |
| Proof | Game chứng minh ra sao? | clear moment trong level 1 | nhiều UI đẹp |
| Signal | Đọc số nào? | CTR/CVR/D1/level depth | chỉ CPI |

Nếu một motivation không thể tạo ra hook và proof cụ thể, nó chưa sẵn sàng để test.

---

## Motivation map mẫu cho puzzle game

![Motivation map mẫu cho puzzle game](content/assets/usecases/day-03-motivation-map-visual.svg)


| Motivation | Player wants | Ad hook | Store proof | First-session proof | Metric pattern cần đọc |
| --- | --- | --- | --- | --- | --- |
| Relax | Nghỉ não, ít áp lực | "A calm 2-minute puzzle break" | Màu dễ đọc, board sạch, không drama | Level 1 dễ hiểu, thắng nhanh | D1, session count, tutorial complete |
| Satisfying clear | Dọn sạch, đã mắt | "Clear chaos in one smart move" | Before/after board rõ | Combo/clear trong 60-90 giây | CTR, CVR, level depth |
| Challenge | Tự hào vì giải được | "Only 1% solve this" | Puzzle khó nhìn có logic | Fail/retry công bằng | CTR, retry rate, D1 |
| Mastery | Tiến bộ qua từng level | "Find the perfect move" | Progression/level map | Difficulty curve nhẹ | Level depth, D3/D7 |
| Collection | Mở khóa, hoàn thiện | "Solve to decorate the room" | Room/collection preview | Meta reward xuất hiện sớm | Session length, ad engagement |

Chỉ chọn motivation mà prototype hiện tại có thể chứng minh. Nếu game chưa có meta room, đừng bán collection trong ad chỉ vì competitor làm vậy.

### Motivation selection contract

Khi chọn 2 motivation để test trước, hãy viết contract để team không biến test thành 5 giả thuyết chồng lên nhau. Contract nói rõ motivation nào được test, biến nào được giữ nguyên, và kết luận nào bị khóa.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Motivation selected | Đang test cảm giác nào? | `Satisfying clear` |
| Hook promise | 3 giây đầu hứa điều gì? | clear chaos in one smart move |
| Store proof locked | Screenshot/copy nào phải khớp promise? | before/after board clear |
| First-session proof locked | Level đầu phải giao khoảnh khắc nào? | one clear/combo within 90 seconds |
| Variable allowed to change | Test này được đổi gì? | opening crop/pacing only |
| Blocked conclusions | Report không được kết luận gì? | không kết luận collection/meta demand |
| Review metric pair | Metric nào đọc fit/mismatch? | CTR/CVR + tutorial_complete/D1 |

Mẫu contract:

```text
Motivation test contract
- Motivation:
- Hook promise:
- Store proof:
- First-session proof:
- Variables locked:
- Variable allowed to change:
- Review metric pair:
- Blocked conclusions:
```

Quy tắc: nếu một test thay cả motivation, hook, store proof và tutorial, bạn sẽ không biết audience nào đang phản hồi. Với budget nhỏ, khóa biến là cách mua clarity rẻ nhất.

---

## Hero visual: motivation-to-proof chain

![Hero visual: motivation-to-proof chain](content/assets/usecases/day-03-motivation-to-proof-chain.svg)


```text
MOTIVATION-TO-PROOF CHAIN

Candidate A: Satisfying clear        TEST FIRST
Context            Lunch break / commute, wants a quick visual payoff
Hook               "Clear chaos in one smart move"
Store proof         Screenshot 1 shows messy board -> clean board
First-session proof One clear/combo moment appears in level 1-3
Metric read         CTR + CVR test promise; tutorial_complete + D1 test proof

Candidate B: Relax                   TEST FIRST, softer creative angle
Context            Before sleep / short break, wants low-pressure focus
Hook               "A calm 2-minute puzzle break"
Store proof         Clean board, readable colors, no pressure timer in screenshots
First-session proof No forced ads/popups before first win; tutorial is quiet
Metric read         CVR + D1 + session_count, not CTR alone

Candidate C: Challenge               HOLD UNTIL BUILD PROVES IT
Context            Wants to feel clever and beat a hard board
Hook               "Only 1% solve this"
Store proof         Hard-looking board with real logic, not fake impossible layout
First-session proof Fail/retry loop feels fair within first 2 minutes
Metric read         High CTR is not enough; retry_rate + D1 must survive

Candidate D: Collection              DEFER
Context            Wants to unlock/decorate/complete a set
Hook               "Solve puzzles to decorate the room"
Store proof         Room/progression screenshot
First-session proof Meta reward appears early
Metric read         Session length + reward engagement, after feature exists
```

Doc diagram theo chieu ngang, khong doc tung o roi rac. Mot motivation chi dang dua vao test khi `context`, `hook`, `store proof`, `first-session proof` va `metric read` cung noi ve mot cam giac. Neu chi co hook manh nhung product proof chua co, do la curiosity trap, khong phai audience insight.

| Decision label | Khi dung | Hanh dong tiep theo |
| --- | --- | --- |
| `TEST FIRST` | Build hien tai chung minh duoc promise trong vai phut dau | Lam 2-3 creative cells cung motivation, chi doi opening/pacing |
| `TEST FIRST, softer creative angle` | Motivation it gay soc nhung proof chain sach | Dung creative ro, khong co bien thanh clickbait |
| `HOLD UNTIL BUILD PROVES IT` | Hook hap dan nhung onboarding/level chua giao duoc cam giac | Sua product proof truoc hoac viet hook trung thuc hon |
| `DEFER` | Feature/reward surface chua ton tai | Khong dua vao ad/store cho den khi build co bang chung |


**Inspect:** motivation nào có đủ proof ở cả store và level đầu.
**Conclude:** motivation đáng test trước là motivation có proof chain đầy đủ nhất, không phải motivation nghe hấp dẫn nhất.
**Do not infer:** không dùng diagram để kết luận audience thắng; diagram chỉ giúp chọn test có khả năng đọc được.

---

## Chart: motivation readiness score

:::chart
title: Motivation readiness for a small calming puzzle prototype
Relax|4|Prototype already supports low-pressure play
Satisfying clear|5|Clear visual payoff is easy to show
Challenge|2|Hard hook risks clickbait and churn
Mastery|3|Needs more level depth before strong claim
Collection|1|Meta scope is not built yet
:::

**Inspect:** `Satisfying clear` và `Relax` có readiness cao vì product proof đã có.
**Conclude:** hai motivation này nên vào first creative test; `Collection` nên để sau.
**Do not infer:** readiness không phải market size; nó chỉ là khả năng test rõ với bản build hiện tại.

---

## Hướng dẫn đọc số theo motivation

| Metric pattern | Cách đọc | Action đúng |
| --- | --- | --- |
| Relax hook: CTR vừa, CVR cao, D1 tốt | Hook không gây sốc nhưng promise khớp người chơi | Giữ direction, làm thêm biến thể nhẹ về pacing/visual |
| Challenge hook: CTR cao, CVR thấp, D1 thấp | Curiosity trap hoặc ad-store mismatch | Không scale; hoặc làm challenge thật hơn trong store/first session |
| Satisfying clear: CTR cao, CVR cao, level depth thấp | Người chơi thích nhìn nhưng gameplay thiếu chiều sâu | Cải thiện level pacing trước khi làm thêm ads |
| Mastery: CTR thấp, D1 tốt | Hook chưa truyền tải được cảm giác "giải được" | Làm creative show decision moment rõ hơn |
| Collection: CVR ổn, session thấp | Store hứa meta nhưng game chưa trả reward sớm | Đưa meta reward vào first session hoặc bỏ promise |

Quy tắc nhỏ: motivation fit phải được đọc qua ít nhất hai tầng. `CTR` chỉ nói ad có thu hút; `D1` và level depth mới nói gameplay có giao đúng cảm giác không.

Priority scoring trước khi chọn 2 motivation:

| Score lens | Câu hỏi | 1 điểm | 3 điểm | 5 điểm |
| --- | --- | --- | --- | --- |
| Proof availability | Build hiện tại chứng minh được promise trong 3 phút đầu không? | Chưa có feature/proof | Có proof nhưng hơi muộn | Proof xuất hiện trong level 1-3 |
| Creative clarity | Hook có thể hiểu trong 3 giây không? | Cần giải thích dài | Hiểu được nếu video rõ | Nhìn một frame đã hiểu payoff |
| Store match | Screenshot/title có chứng minh cùng promise không? | Store nói chuyện khác | Có ảnh liên quan nhưng chưa sắc | Screenshot 1-2 chứng minh trực tiếp |
| Metric readability | Nếu test fail, biết sửa tầng nào không? | Không biết do ad/store/product | Có thể đoán | Có pattern rõ cho creative/store/product |
| Scope discipline | Motivation có kéo thêm feature ngoài scope không? | Đòi feature mới lớn | Cần polish nhỏ | Dùng được build hiện tại |

Decision rule:

```text
Test first = high proof availability + high metric readability + low scope risk.
Hold = hook sounds strong but product/store proof is weak.
Defer = motivation requires a feature not yet in the build.
Reject for now = cannot write a clean metric pattern or proof chain.
```

Nếu hai motivation cùng hấp dẫn, chọn cái làm team học nhanh hơn, không phải cái nghe rộng thị trường hơn. Với micro-budget, một motivation hẹp nhưng proof chain sạch thường đáng test hơn một motivation lớn nhưng mơ hồ.

---

## Worked example: hai hook cho cùng một prototype

Prototype: block puzzle gỗ, level ngắn, có hiệu ứng clear đẹp, chưa có meta collection.

| Creative | Motivation | CTR | Store CVR | Tutorial complete | D1 | Diagnosis |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| A: "Only 1% solve this" | Challenge | 4.2% | 14% | 58% | 12% | Hook gây tò mò nhưng product không chứng minh challenge công bằng; mismatch |
| B: "Clear the board and relax" | Relax + satisfying | 2.4% | 34% | 87% | 31% | Hook ít giật hơn nhưng promise khớp store và first session |

Verdict: chọn B làm direction chính. Không kết luận A "xấu tuyệt đối"; A có thể dùng sau nếu build có level challenge rõ hơn và store proof trung thực hơn.

Tradeoff:

- A có thể hạ CPI ban đầu nếu CTR đủ cao, nhưng sẽ đốt ngân sách nếu CVR/D1 gãy.
- B có thể cần creative polish để tăng CTR, nhưng là learning path sạch hơn vì proof chain đang khớp.

Second-pass read:

| Question | Creative A | Creative B | Decision impact |
| --- | --- | --- | --- |
| Promise có được store proof xác nhận không? | Một hard puzzle screenshot có thể chứng minh, nhưng nếu layout fake thì nguy hiểm | Before/after clear dễ chứng minh bằng screenshot thật | B dễ làm store proof trung thực hơn |
| First session có giao cảm giác đó không? | Nếu level đầu không khó công bằng, hook challenge fail | Clear moment sớm đã có trong prototype | B phù hợp build hiện tại hơn |
| Nếu metric xấu, biết sửa gì không? | Khó biết do challenge fake, store mismatch hay product yếu | Có thể sửa opening nếu CTR thấp, sửa level pacing nếu D1 thấp | B cho learning path rõ hơn |
| Có kéo scope mới không? | Cần thiết kế challenge curve tốt hơn | Chủ yếu cần creative polish | B rẻ hơn cho tuần đầu |

Kết luận vận hành: chọn B không phải vì "relax luôn tốt hơn challenge". Chọn B vì trong bản build hiện tại, B có proof chain sạch hơn và ít làm team học sai hơn. A nên được ghi vào backlog với điều kiện: chỉ test lại khi level đầu có fail/retry công bằng và store proof không dùng puzzle fake.

### Post-test motivation memo

Sau test, đừng chỉ viết "Creative B thắng". Hãy viết memo nói rõ motivation nào giữ, motivation nào hold, và điều gì vẫn chưa được chứng minh.

```text
Post-test motivation memo
- Tested motivations: Challenge vs Relax + satisfying clear.
- Strongest useful signal: Relax/satisfying has better CVR, tutorial_complete and D1.
- Weakest signal: Challenge wins CTR but fails store/product proof.
- Primary decision: keep Relax/satisfying as first audience direction.
- Hold condition for Challenge: retest only after fair fail/retry proof exists in level 1-3.
- Variables to keep unchanged next test: store proof, first-session proof, country/source.
- Next variable to change: first 2 seconds of Relax/satisfying creative to improve CTR.
- Blocked conclusion: do not claim challenge audience does not exist; current build cannot prove it cleanly.
```

Decision ladder:

| Pattern | Motivation verdict | Next action |
| --- | --- | --- |
| CTR low, CVR/D1 healthy | motivation fit possible, communication weak | improve hook opening |
| CTR high, CVR/D1 weak | curiosity or proof mismatch | hold or rewrite promise |
| CVR high, tutorial weak | store promise works, first-session proof weak | fix onboarding/level proof |
| D1 strong, ARPDAU weak | motivation holds attention, economy path unclear | keep motivation, test monetization later |
| all layers weak across clean test | motivation likely weak for this build | pause motivation and write replacement hypothesis |

Memo tốt bảo vệ team khỏi hai sai lầm: scale hook có CTR cao nhưng traffic yếu, hoặc bỏ motivation có CTR vừa nhưng người chơi fit hơn.

### Motivation evidence ledger

Sau khi test, ghi ledger để tách **signal đã dùng**, **signal bị bỏ qua**, và **điều chưa được chứng minh** cho từng motivation. Ledger này đặc biệt hữu ích khi một motivation thắng `CTR` nhưng thua `CVR/D1`.

| Ledger field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Motivation verdict | Giữ, revise, hold hay pause? | keep Relax/satisfying, hold Challenge |
| Evidence used | Metric nào thật sự dùng để ra verdict? | CVR, tutorial_complete, D1 direction |
| Evidence discounted | Metric nào hấp dẫn nhưng chưa đủ quyền? | CTR cao của Challenge vì downstream yếu |
| Proof gap | Ad/store/first-session gãy ở đâu? | Challenge chưa có fair fail/retry proof |
| Next variable | Lần tới chỉ đổi gì? | first 2 seconds của Relax creative |
| Frozen variables | Cái gì giữ nguyên để retest sạch? | store proof, country/source, first-session proof |
| Blocked conclusions | Không được kết luận gì? | Challenge audience không tồn tại |

```text
Motivation evidence ledger
- Motivation:
- Verdict:
- Evidence used:
- Evidence discounted:
- Proof gap:
- Next variable:
- Frozen variables:
- Blocked conclusions:
```

Ledger tốt giúp team nói "motivation này chưa chứng minh được" thay vì "audience này không có". Với game nhỏ, cách nói đó giữ learning chính xác hơn rất nhiều.

---

## First-session proof và Unity event checklist

Motivation map phải nối xuống event tối thiểu trong Unity. Không cần over-log, nhưng cần đủ để biết promise có được giao không.

| Promise | First-session proof | Event gợi ý |
| --- | --- | --- |
| Calm brain break | Người chơi hiểu luật nhanh và thắng level đầu | `tutorial_start`, `tutorial_complete`, `level_complete` |
| Satisfying clear | Có clear/combo moment sớm | `first_clear`, `combo_triggered`, `level_complete` |
| Challenge | Có fail/retry công bằng | `level_fail`, `retry_clicked`, `hint_used` |
| Collection | Reward/meta xuất hiện sớm | `reward_preview_seen`, `item_unlocked` |

Quality check:

- Event name dùng snake_case.
- Event gắn với quyết định UA, không log mọi click.
- Mỗi event có owner trong code và nơi xem trong dashboard.
- Không để UI flow gọi trực tiếp logic UA; event analytics nên là lớp quan sát tách rời.

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play - Monopoly GO!](https://play.google.com/store/apps/details?id=com.scopely.monopolygo) | Store public thể hiện board, dice, city/landmark progression và event/reward surfaces. | Audience không chỉ là "board game players"; motivation có thể là completion, progression, social/light competition. | Không copy IP, live ops complexity hoặc UA scale của một sản phẩm lớn cho puzzle prototype nhỏ. |
| [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Listing thể hiện action verb cụ thể: screw/sort/unscrew, không chỉ nói "puzzle". | Với puzzle nhỏ, action verb giúp creative và store proof rõ hơn demographic. | Không suy ra mọi sort puzzle dùng chung audience; motivation có thể là organize, untangle hoặc satisfying clear. |
| [Google Play preview assets guidance](https://support.google.com/googleplay/android-developer/answer/9866151) | Store assets là bề mặt chính để mô tả app/game trước install. | Store proof phải khớp motivation đã hứa trong ad. | Không nhồi mọi motivation lên screenshot đầu; mỗi test cần một promise rõ. |

Screenshot/usecase readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Store screenshot đang nhấn vào action verb, reward hay progression? | Từ đó suy ra motivation mà listing đang cố chứng minh. | Không dùng listing public để suy ra metric nội bộ như CPI/D1. |

---

## Common mistakes

- **Mistake - Correction:** Dùng demographic làm audience chính.
  **Correction:** Bắt đầu từ motivation và ngữ cảnh chơi, rồi mới thêm demographic nếu cần cho media buying.

- **Mistake - Correction:** Một creative hứa cả relax, challenge và collection.
  **Correction:** Một ad chỉ test một motivation chính. Muốn test nhiều motivation thì tạo nhiều creative cells.

- **Mistake - Correction:** Thấy CTR cao là kết luận audience fit.
  **Correction:** CTR phải được đọc cùng `Store CVR`, `tutorial complete`, `D1` và level depth.

- **Mistake - Correction:** Hứa motivation mà product chưa có proof.
  **Correction:** Nếu game chưa có meta, đừng bán collection. Nếu level đầu quá dễ, đừng bán "only 1%".

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong khóa học |
| --- | --- |
| Audience | Nhóm người chơi được định nghĩa bằng motivation, behavior và context |
| Motivation | Lý do cảm xúc/hành vi khiến player click, install và chơi tiếp |
| Hook | Lời hứa ngắn trong creative để kéo sự chú ý |
| Store proof | Bằng chứng trên store rằng hook không nói suông |
| First-session proof | Bằng chứng trong vài phút đầu rằng game giao đúng promise |
| IPM | Installs per Mille, install trên 1000 impressions |

---

## Lab output example

```text
Audience Motivation Map - v1

Primary motivation: Satisfying clear
Audience statement: players who want a short, low-pressure puzzle with an obvious visual payoff
Context: commute break, lunch break, before sleep
Ad hook: clear chaos in one smart move
Store proof: first screenshot shows messy board -> clean board
First-session proof: level 1-3 produces one satisfying clear within 90 seconds
Metric read:
- If CTR low but D1 high: improve creative opening
- If CTR high but CVR low: repair store proof
- If CVR high but D1 low: repair onboarding/level pacing
Secondary motivation: Relax
Not testing yet: Collection, because prototype has no meta reward

Motivation test contract:
- Variables locked:
- Variable allowed to change:
- Review metric pair:
- Blocked conclusions:

Post-test memo:
- Motivation verdict:
- What to keep:
- What to change next:
- What remains unproven:

Motivation evidence ledger:
- Evidence used:
- Evidence discounted:
- Proof gap:
- Frozen variables:
- Blocked conclusions:
```

---

## Practical Lab

1. Viết 5 motivation candidates cho game của bạn.
2. Loại bỏ motivation nào chưa có proof trong build hiện tại.
3. Chọn 2 motivation còn lại và viết hook riêng cho mỗi motivation.
4. Với mỗi hook, ghi screenshot/store proof cần có và event first-session cần đo.
5. Viết metric pattern cho 3 tình huống: creative weak, store mismatch, product mismatch.
6. Viết motivation test contract cho motivation chính.
7. Viết post-test memo giả lập cho trường hợp CTR cao nhưng CVR/D1 yếu.
8. Viết Motivation evidence ledger cho motivation chính.

Pass lab khi bạn có thể đưa motivation map cho một teammate và họ biết nên làm video nào, screenshot nào, level proof nào.

---

## Final UA Plan Update

Cập nhật trường **Target audience**:

```text
Primary motivation:
Audience statement:
Player context:
Main hook:
Store proof:
First-session proof:
Metric pattern for fit:
Metric pattern for mismatch:
Secondary motivation to test later:
Motivation intentionally excluded:
Motivation test contract:
Variables locked:
Blocked conclusions:
Post-test motivation memo:
Motivation evidence ledger:
Evidence used:
Evidence discounted:
Frozen variables:
```

Liên kết với Day 2: phần này phải khớp với Puzzle market thesis. Nếu Day 2 nói "calm brain break" nhưng Day 3 lại chọn "hard challenge", bạn cần ghi rõ lý do đổi thesis.

---

## Checklist Focus

- [ ] Audience statement không dùng demographic chung chung.
- [ ] Có 2 motivation đáng test, không quá 3.
- [ ] Mỗi motivation có hook, store proof và first-session proof riêng.
- [ ] Metric pattern đọc được fit/mismatch.
- [ ] Event first-session đủ để đo proof nhưng không over-log.
- [ ] Có Motivation evidence ledger.
- [ ] Evidence discounted và blocked conclusions được ghi rõ.
- [ ] Final UA Plan có motivation bị loại trừ để tránh scope creep.

---

## Curated References

- [Google Play - Monopoly GO!](https://play.google.com/store/apps/details?id=com.scopely.monopolygo)
- [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
- [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151)
