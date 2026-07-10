---
day: 19
title: "Competitor teardown without copying"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Genre-market fit, ASO, Creative testing]
artifact: "Competitor teardown sheet"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Competitor teardown sheet** để đọc 3 đối thủ puzzle mà không biến sản phẩm của mình thành bản clone.

Quyết định cần học: pattern nào đáng học, pattern nào phải tránh, và pattern nào có thể chuyển thành một test nhỏ cho creative/store/first session của game bạn.

Kết quả cần có:

- 3 competitor surfaces cụ thể: store page, screenshot order, video/ad surface hoặc publisher catalog.
- Một bảng tách rõ `observable fact`, `market pattern`, `our hypothesis`, `test asset`, `do not copy`.
- Một scoring grid để ưu tiên pattern dựa trên độ lặp lại và khả năng prototype của bạn chứng minh được.
- Cập nhật trường **Audience** trong Final UA Plan, kèm ảnh hưởng sang **Creative matrix** và **Store proof**.

---

## Why this matters

Competitor research rất dễ biến thành moodboard. Bạn nhìn thấy một game puzzle dùng màu xanh, icon nhân vật vui, board gỗ, caption "only 1% can solve", rồi vô thức copy bề mặt đó. Kết quả là bạn vừa không hiểu tại sao đối thủ dùng pattern đó, vừa làm game của mình mất promise riêng.

Với budget `$100-500`, teardown phải giúp bạn giảm mù trước khi test. Bạn không đủ tiền để thử 10 hướng store và 20 hook ngẫu nhiên. Bạn cần biết:

- Đối thủ đang chứng minh promise nào trước install?
- Pattern nào lặp lại qua nhiều listing vì nó giúp user hiểu nhanh?
- Pattern nào phụ thuộc vào IP, content depth, art budget hoặc live ops mà team nhỏ chưa nên hứa?
- Nếu học pattern đó, metric nào sẽ cho biết bạn học đúng hay sai?

Một teardown tốt không hỏi "mình copy cái gì?". Nó hỏi "surface public này dạy mình một giả thuyết testable nào?".

---

## Core model: copy pattern, không copy execution

Tách competitor teardown thành 5 lớp:

| Lớp | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Observable fact | Mắt thường thấy gì trên surface public? | Screenshot 1 show board đang gần clear |
| Market pattern | Fact đó có thể đại diện cho pattern nào? | Core gameplay proof xuất hiện trước brand/meta |
| Our hypothesis | Game mình có nên test pattern đó không? | Screenshot đầu là before/after board clear có thể tăng Store CVR |
| Test asset | Asset nào của mình cần làm? | Store screenshot variant A/B |
| Copy guard | Không được copy điều gì? | Không copy board layout, art style, wording, IP |

Quy tắc: nếu insight không đi được từ fact sang test asset, insight đó chưa dùng được cho micro soft-launch. Nếu insight không có copy guard, nó dễ biến thành sao chép.

---

## Competitor teardown sheet mẫu

| Competitor surface | Observable fact | Market pattern | Our hypothesis | Test asset | Do not copy |
| --- | --- | --- | --- | --- | --- |
| Store screenshot 1 | Gameplay board/action xuất hiện trước meta UI | Proof before decoration | Nếu screenshot đầu chứng minh core action, Store CVR sẽ dễ đọc hơn | Screenshot 1: real board clear | Board layout, exact art, UI frame |
| Video preview opening | Mở bằng near-fail hoặc almost-solved state | Tension in 1 second | Hook "one move can save the board" có thể tăng CTR cho challenge-lite angle | 3-second video opening | Fake gameplay, impossible puzzle claim |
| Title/subtitle | Nêu action verb cụ thể: sort, screw, merge, escape | Action verb clarity | Tên/screenshot nên nói đúng verb chính của game | Store short copy variant | Keyword stuffing |
| Publisher catalog | Nhiều game cùng verb family nhưng khác wrapper | Portfolio tests motivations, not one audience | Chọn reference theo action verb, không theo publisher fame | Reference set for Day 2/3 plan | Scale, ranking, live ops system |

Framework này dùng để tạo 1-2 hypothesis, không dùng để gom mọi thứ hay nhất của đối thủ vào một store page.

### Teardown pattern contract

Mỗi pattern rút ra từ đối thủ cần một contract để tránh trượt từ "học pattern" sang "copy execution".

| Contract field | Câu hỏi cần trả lời | Fail thì làm gì |
| --- | --- | --- |
| Source surface | URL/surface cụ thể là gì? | Không đưa vào sheet nếu không trace được nguồn |
| Observable fact | Điều gì nhìn thấy được, không phải cảm nhận? | Viết lại bằng fact hoặc bỏ row |
| Transferable pattern | Pattern có thể học mà không copy art/IP/layout không? | Hold/reject nếu phụ thuộc execution riêng |
| Our proof | Prototype/store/first session của mình có chứng minh được không? | Không test paid nếu proof chưa có |
| Test asset | Chỉ một asset nào sẽ đổi? | Thu hẹp: screenshot, hook opening hoặc copy, không đổi tất cả |
| Metric pair | Test sẽ đọc bằng metric nào? | Không launch nếu không biết thắng/thua nghĩa là gì |
| Copy guard | Không copy cụ thể điều gì? | Bổ sung guard trước khi giao asset |

Rule: pattern chỉ được vào `Creative matrix` hoặc `Store proof` khi contract có đủ `our proof`, `test asset`, `metric pair`, và `copy guard`.

---

## Hero visual: teardown decision flow

```text
![Hero visual: teardown decision flow](content/assets/usecases/day-19-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Hero visual: teardown decision flow.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[TEARDOWN DECISION FLOW]

```text
1) Pick a concrete public surface
   Store screenshot, video opening, title/subtitle, publisher catalog
        |
        v
2) Record only observable facts
   "Screenshot 1 shows real board clear before reward UI"
   Not: "their store is beautiful"
        |
        v
3) Name the transferable pattern
   proof before decoration / action verb clarity / solvable tension
        |
        v
4) Check our proof gate
   Can our prototype prove this with real asset + first-session moment?
        |
        +-- NO --> Reject or hold pattern
        |         Write: "not now because proof does not exist"
        |
        +-- YES
             |
             v
5) Choose exactly one test asset
   Store screenshot order OR 3-second hook OR title/action verb copy
        |
        v
6) Attach metric pair
   Store asset: Store CVR + D1
   Hook: CTR + CVR + D1
   Action verb: CVR + traffic quality
        |
        v
7) Write copy guard
   Do not copy art, board layout, IP, exact wording, fake difficulty
```

| Gate | Pass question | If fail | If pass |
| --- | --- | --- | --- |
| Surface gate | Co URL/surface public cu the khong? | Bo insight vi khong trace duoc nguon | Ghi source va surface |
| Fact gate | Co fact nhin thay duoc khong? | Viet lai, bo cam nhan mo ho | Dat ten market pattern |
| Transfer gate | Pattern co dung cho game minh ma khong clone khong? | Reject hoac hold | Kiem proof cua minh |
| Proof gate | Prototype/store/first session co chung minh duoc khong? | Khong test trong pass nay | Chon mot asset test |
| Metric gate | Co metric pair doc duoc sau test khong? | Khong chay ad voi pattern nay | Viet expected readout |
| Copy guard gate | Co noi ro khong copy gi khong? | Bo sung guard truoc khi lam asset | Dua vao Creative matrix/store task |


**Inspect:** mọi nhánh đều đi qua bước "check our proof" trước khi chọn test asset.
**Conclude:** pattern chỉ đáng test khi game bạn có thể chứng minh bằng asset thật và first-session proof thật.
**Do not infer:** flow không nói pattern nào chắc chắn thắng; nó chỉ ngăn bạn copy bề mặt mà chưa hiểu điều kiện.

---

## Pattern confidence grid

```text
![Competitor pattern confidence grid](content/assets/usecases/day-19-data-visual.svg)Type: confidence grid / transferability matrix.
Lesson section: Pattern confidence grid.
Visual brief: convert the pattern confidence chart and transferability ledger into a 2-axis matrix: repeated in market vs provable by our prototype, with test/hold/reject zones.
Teaching job: help the learner decide which competitor patterns are worth testing without copying execution.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Example competitor pattern confidence, 1-5
Gameplay proof first|5|Repeated and easy for prototype to prove
Almost-solved opening|4|Strong attention but must avoid fake difficulty
Deep meta progression|2|Repeated in large games but hard for small team
Character/IP wrapper|1|Not transferable without brand and art budget
Action verb title|4|Easy to adapt without copying execution
:::

**Inspect:** `Gameplay proof first` và `Action verb title` có điểm cao vì vừa lặp lại vừa transferable.
**Conclude:** test đầu nên ưu tiên proof order và action verb clarity, không phải copy art/meta.
**Do not infer:** điểm cao không phải benchmark thị trường; nó là readiness score cho một prototype nhỏ.

---

## Hướng dẫn đọc số

Khi bạn áp dụng một pattern từ teardown, đọc metric để biết pattern đó sửa đúng tầng nào.

| Pattern test | Metric cần đọc | Nếu số này xảy ra | Chẩn đoán | Next action |
| --- | --- | --- | --- | --- |
| Screenshot 1 = gameplay proof | Store CVR, click-to-install | CVR tăng, D1 không đổi | Store proof rõ hơn, product chưa đổi | Giữ screenshot; tiếp tục sửa first session nếu cần |
| Almost-solved video opening | CTR, IPM, CVR | CTR tăng, CVR thấp | Hook hút tò mò nhưng store/game chưa chứng minh | Sửa store proof hoặc giảm clickbait |
| Action verb trong title/copy | CVR, search/store behavior | CVR tăng nhẹ, traffic quality ổn | User hiểu game nhanh hơn | Giữ wording, test screenshot tiếp |
| Meta/progression promise | CVR, session length, D1/D3 | CVR ổn, D1 thấp | Promise vượt quá product proof | Bỏ meta promise hoặc đưa reward sớm |
| Challenge claim | CTR, fail/retry, D1 | CTR cao, retry thấp, D1 thấp | Challenge bị cảm nhận là unfair/fake | Làm puzzle công bằng hơn hoặc bỏ claim |

Không dùng một competitor pattern để sửa tất cả. Mỗi pattern phải có metric pair riêng.

Transferability decision ledger:

| Pattern | Transferability | Proof requirement | Decision | Copy guard |
| --- | --- | --- | --- | --- |
| Proof-before-decoration screenshot | High | Game có gameplay state thật, đọc được trong screenshot | Test first | Không copy layout/UI/art, chỉ copy ordering principle |
| Action verb clarity | High | Core verb của game đủ cụ thể: sort, clear, merge, place, escape | Test in title/copy | Không keyword-stuff hoặc lấy exact wording |
| Almost-solved tension | Medium | Prototype có near-solve board thật và fair | Test cautiously | Không fake impossible board hoặc "1%" claim rỗng |
| Deep meta progression | Low/hold | Meta reward xuất hiện trong first session | Hold until feature proof exists | Không hứa room/collection nếu build chưa có |
| Character/IP wrapper | Reject | Cần IP/art/story equity riêng | Reject for micro test | Không bắt chước mascot, character silhouette, palette |
| Publisher catalog pattern | Directional only | Cần nhiều store surfaces, không có performance data | Use for hypothesis pool | Không suy ra CPI/revenue/ranking |

Decision rule:

```text
Test = transferable + prototype can prove + metric pair exists.
Hold = promising pattern, but proof does not exist yet.
Reject = pattern relies on IP/art/liveops/scope that your team cannot honestly support.
Backlog = useful later, but not needed for the next micro test.
```

Một teardown sheet tốt phải có ít nhất một `Reject` hoặc `Hold`. Nếu mọi pattern đều được đưa vào test, bạn đang làm moodboard chứ không ra quyết định.

### Second-pass teardown read

Đọc lại sheet bằng ba câu hỏi chống clone:

| Question | Nếu câu trả lời yếu | Quyết định đúng |
| --- | --- | --- |
| Pattern này có bắt đầu từ observable fact không? | Insight chỉ là cảm giác "nhìn hay" | Ghi lại surface/fact hoặc bỏ row |
| Prototype của mình có proof thật không? | Pattern cần feature/art/liveops chưa có | Hold hoặc reject, không làm ad promise |
| Metric pair có đọc được sau test không? | Không biết thắng/thua nghĩa là gì | Không chạy paid traffic với pattern này |

Decision memo nên kết thúc bằng 4 bucket:

```text
Competitor teardown decision memo
- Test first:
- Test cautiously:
- Hold until proof exists:
- Reject because copy/scope risk:
```

Nếu bucket `Reject` trống, hãy xem lại. Một teardown tốt không chỉ sinh ý tưởng; nó cũng bảo vệ team khỏi những pattern nhìn hấp dẫn nhưng không trung thực với build hiện tại.

---

## Worked example: đọc 3 puzzle competitors

Bạn đang làm "Calming Hex Wood Puzzle". Bạn xem 3 store pages/publisher surfaces:

| Observation | Pattern | Our proof check | Test decision |
| --- | --- | --- | --- |
| Game A screenshot đầu show board trước khi show daily reward | Core proof first | Prototype có real board clear trong level 1 | Test screenshot 1 là before/after board |
| Game B video mở bằng near-fail state với một nước giải | Solvable tension | Prototype có level almost-solved thật, không cần fake | Test 3-second "one move saves board" |
| Game C show room decoration/meta rất sâu | Meta progression promise | Prototype chưa có room/meta reward | Không hứa meta trong store/ad |

Metric sau test:

| Variant | CTR | Store CVR | D1 | Diagnosis |
| --- | ---: | ---: | ---: | --- |
| Old store: logo + board generic | 1.7% | 18% | 29% | Store proof yếu, product không hẳn yếu |
| New screenshot: before/after board clear | 1.8% | 31% | 30% | Proof order cải thiện conversion |
| Challenge opening: "one move saves board" | 3.4% | 21% | 18% | Hook hút click nhưng mismatch/fairness risk |

Verdict: giữ screenshot proof-first, bỏ challenge opening hoặc làm nó trung thực hơn. Lesson không phải "đối thủ dùng challenge nên mình cũng dùng"; lesson là "proof order giúp store rõ hơn, challenge hook cần product proof mạnh hơn".

Second-pass read:

| Pattern | First read | Hidden risk | Better decision |
| --- | --- | --- | --- |
| Proof-before-decoration | Screenshot proof-first improved Store CVR | Nếu D1 không đổi, store chỉ sửa install path, không sửa retention | Keep screenshot order, then inspect first-session proof separately |
| Almost-solved tension | CTR looks attractive | Can become fake difficulty or curiosity trap if puzzle is not fair | Test only with real level state and CVR/D1 guardrail |
| Deep meta progression | Looks common in large competitors | Requires content depth and early reward proof | Hold; do not put meta promise in first packet |
| Action verb clarity | Easy to adapt | Can become keyword stuffing if verb is too broad | Test honest verb tied to first action |

Decision memo:

```text
Test first:
- Proof-before-decoration screenshot.
- Action verb clarity in short copy.

Test cautiously:
- Almost-solved tension, only with real solvable board.

Hold:
- Deep meta progression until first-session reward exists.

Reject:
- Character/IP wrapper and exact visual execution.
```

Điểm sâu: competitor teardown không tạo ra "things to copy". Nó tạo ra **testable hypotheses with boundaries**. Boundary càng rõ, team càng dễ học pattern mà vẫn giữ identity riêng.

### Source-to-test acceptance memo

Khi chọn một pattern để test, viết memo ngắn để handoff cho creative/store owner.

```text
Source-to-test memo - Proof-before-decoration screenshot

Source surface:
- Competitor store screenshot order.

Observable fact:
- Screenshot 1 shows gameplay proof before reward/meta UI.

Transferable pattern:
- Proof before decoration.

Our proof:
- Level 1 has a real before/after clear state that can be captured honestly.

Test asset:
- Store screenshot 1 variant: before/after board clear.

Metric pair:
- Store CVR + D1 direction.

Copy guard:
- Do not copy board layout, art style, UI frame, wording, color palette or exact puzzle state.

Decision allowed:
- If Store CVR improves and D1 does not degrade, keep proof-first screenshot order.

Decision blocked:
- Do not infer retention solved.
- Do not add meta promise.
- Do not claim competitor execution is the reason; only the ordering principle is being tested.
```

Memo này giúp người làm asset hiểu ranh giới. Họ đang test một **principle**, không tái dựng surface của đối thủ.

---

## Teardown quality checklist

| Check | Pass condition |
| --- | --- |
| Source concrete | Có URL/store/public surface cụ thể |
| Fact visible | Insight bắt đầu bằng điều nhìn thấy, không đoán nội bộ |
| Pattern named | Pattern được viết bằng hành vi: proof first, tension, action verb |
| Transferability | Có đánh giá team mình chứng minh được hay chưa |
| Test mapping | Pattern chuyển thành hook/store/first-session asset |
| Metric pair | Có metric để đọc sau test |
| Copy guard | Có dòng nói rõ không copy gì |

Quality chain:

`competitor surface -> observable fact -> transferable pattern -> our proof -> test asset -> metric read -> next action`

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play mô tả preview assets như icon, screenshots, feature graphic/video để showcase app/game trước khi user cài. | Khi teardown listing, screenshots/video là proof surface; hãy đọc chúng theo lời hứa đang được chứng minh. | Không suy ra mọi listing cần cùng thứ tự asset; context và traffic source vẫn quan trọng. |
| [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/) | Product page optimization cho phép thử nhiều phiên bản product page elements trên App Store. | Teardown chỉ tạo hypothesis; vẫn cần test asset của chính bạn để biết pattern có hợp không. | Không suy ra pattern từ App Store luôn chuyển nguyên sang Google Play hoặc ngược lại. |
| [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Publisher catalog public thể hiện nhiều puzzle/sort games với action verbs khác nhau. | Đọc catalog để nhận diện action verb và motivation family, không gom thành một audience duy nhất. | Không suy ra performance, CPI hoặc revenue từ catalog public. |
| [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Store surface public tập trung vào action verb "screw/sort" và puzzle object cụ thể. | Action verb rõ giúp user hiểu nhanh game làm gì; đây là pattern có thể học mà không copy execution. | Không copy object layout, wording hoặc visual execution của listing. |

Screenshot readout worksheet:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot/video đầu tiên show gameplay, reward, meta hay brand? | Surface đang ưu tiên proof type nào. | Không suy ra proof type đó thắng nếu chưa test trên game bạn. |
| Text claim dùng verb cụ thể hay claim rộng? | Action verb càng rõ càng dễ tạo creative/store continuity. | Không keyword-stuff title nếu promise không thật. |

---

## Common mistakes

- **Mistake - Correction:** Copy màu, board, character hoặc wording của đối thủ.
  **Correction:** Chỉ học pattern transferable như proof order, action verb clarity, tension type.

- **Mistake - Correction:** Ghi "đối thủ làm ASO tốt" mà không có observable fact.
  **Correction:** Ghi rõ screenshot nào, title nào, video opening nào, proof nào.

- **Mistake - Correction:** Dùng competitor lớn làm benchmark trực tiếp cho indie prototype.
  **Correction:** Dùng họ như caution/directional pattern, không dùng result hoặc scope làm target.

- **Mistake - Correction:** Thêm mọi pattern hay vào một test.
  **Correction:** Một test chỉ thay một layer chính: screenshot order, hook opening hoặc title/action verb.

- **Mistake - Correction:** Không viết "do not copy".
  **Correction:** Mỗi row teardown phải có copy guard để bảo vệ identity và giảm rủi ro clone.

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong bài |
| --- | --- |
| Competitor teardown | Phân tích surface public để rút pattern testable |
| Observable fact | Điều có thể nhìn thấy/ghi lại từ store/ad/public page |
| Transferable pattern | Pattern có thể học mà không copy execution |
| ASO | App Store Optimization, tối ưu store surface để tăng visibility/conversion |
| Creative testing | Test hook/format/variant để học signal |
| Copy guard | Ranh giới nói rõ không copy art, IP, wording, layout, claim |

---

## Lab output example

```text
Competitor Teardown Sheet - v1

Competitor 1 URL:
Surface observed: Google Play screenshot order
Observable fact: screenshot 1 shows real gameplay board before reward/meta UI
Pattern: proof before decoration
Our hypothesis: screenshot 1 with real before/after board clear will improve Store CVR
Test asset: Store screenshot variant A
Metric read: Store CVR + D1
Do not copy: art style, board layout, exact wording

Competitor 2 URL:
Surface observed: video opening
Observable fact: first seconds show almost-solved board
Pattern: solvable tension
Our hypothesis: a real near-solve moment can lift CTR without fake gameplay
Test asset: 3-second creative opening
Metric read: CTR + CVR + D1
Do not copy: fake difficulty, exact puzzle shape

Decision:
- Test first: proof-before-decoration screenshot
- Hold: deep meta/progression promise
- Reject: character/IP wrapper
```

---

## Practical Lab

1. Chọn 3 competitor surfaces cụ thể, ưu tiên store pages hoặc public screenshots/video pages.
2. Ghi 3 observable facts cho mỗi surface. Không ghi cảm nhận như "đẹp" nếu chưa mô tả được đẹp ở đâu.
3. Đặt tên pattern cho mỗi fact bằng hành vi: `proof first`, `action verb clarity`, `solvable tension`, `reward preview`.
4. Đánh giá pattern có transferable không với prototype hiện tại.
5. Chọn 1 pattern để test và viết metric pair.
6. Viết copy guard cho từng row.
7. Viết teardown pattern contract cho pattern được chọn.
8. Viết source-to-test memo để handoff thành asset request cụ thể.

Pass lab khi một teammate có thể nhìn sheet và biết chính xác asset nào cần làm, metric nào cần đọc, và thứ gì không được copy.

---

## Final UA Plan Update

Cập nhật trường **Audience** trong Final UA Plan, đồng thời ghi tác động sang creative/store:

```text
Competitor pattern observed:
Player motivation implied:
Transferable pattern to test:
Our proof asset:
Metric pair to read:
Copy guard:
Pattern contract:
Source-to-test memo:
Pattern rejected and why:

Creative matrix impact:
- Hook/format affected:
- Variant to create:

Store proof impact:
- Screenshot/video element to change:
- Claim to avoid:
```

Nếu pattern được chọn mâu thuẫn với market thesis Day 2 hoặc motivation Day 3, ghi rõ bạn đang đổi thesis hay chỉ test một store/creative execution.

---

## Checklist Focus

- [ ] Có 3 competitor surfaces cụ thể.
- [ ] Mỗi insight bắt đầu bằng observable fact.
- [ ] Có pattern transferable, không chỉ moodboard.
- [ ] Có test asset cụ thể của game mình.
- [ ] Có metric pair để đọc sau test.
- [ ] Có copy guard cho từng competitor row.
- [ ] Pattern được chọn có contract đầy đủ: source, fact, transferability, proof, metric, guard.
- [ ] Có source-to-test memo để biến pattern thành asset request không clone.
- [ ] Có ít nhất một pattern bị reject để tránh scope creep.

---

## Curated References

- [Google Play Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
- [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio)
- [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
