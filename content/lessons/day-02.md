---
day: 2
title: "Puzzle market thesis and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
artifact: "Puzzle market thesis"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Puzzle market thesis**: một luận điểm thị trường đủ cụ thể để quyết định game puzzle của bạn nên test ai, hứa điều gì, đo tín hiệu nào và dừng khi điều kiện nào bị gãy.

Output không phải là câu "game của tôi dành cho người thích puzzle". Output phải trả lời được:

- Người chơi nào có một nhu cầu đủ rõ để bạn làm creative trong 3 giây đầu?
- Gameplay hiện tại có chứng minh được lời hứa đó trong first session không?
- Monetization path nào có cơ hội kéo `LTV` vượt `CPI` trong micro soft-launch?
- Với ngân sách `$100-500`, điều kiện nào khiến bạn pause, iterate hoặc bỏ thesis?

Stage phục vụ: `idea` và `prototype`. Bài này cập nhật trường **Target audience** trong Final UA Plan.

---

## Why this matters

Puzzle là một genre rộng đến mức gần như vô dụng nếu dùng làm định vị UA. Hai game đều là puzzle nhưng có thể bán hai cảm giác hoàn toàn khác nhau: một game bán cảm giác "dọn sạch hỗn loạn", game khác bán cảm giác "tôi đủ thông minh để giải câu đố khó".

Với team Unity nhỏ, sai lầm phổ biến là nghĩ rằng genre rộng sẽ giúp mua được user rẻ. Thực tế vận hành lại ngược: càng mô tả rộng, creative càng nhạt, store càng giống đối thủ, first session càng khó chứng minh lời hứa. Khi đó bạn không biết CPI cao vì thị trường đắt, vì hook yếu, vì store không chứng minh được, hay vì sản phẩm chưa giữ chân được.

Market thesis giúp bạn bảo vệ ngân sách nhỏ bằng cách biến "tôi nghĩ game này có thị trường" thành một chuỗi giả thuyết có thể kiểm chứng:

`player motivation -> ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Nếu một mắt xích gãy, bạn biết sửa đúng chỗ thay vì đổi mọi thứ cùng lúc.

---

## Core model: market thesis không phải genre label

**Genre label** trả lời "game thuộc nhóm nào trên store". **Market thesis** trả lời "vì sao một nhóm người chơi cụ thể sẽ cài, chơi tiếp và có thể tạo doanh thu".

Một market thesis tốt có 6 lớp:

| Lớp | Câu hỏi phải trả lời | Dấu hiệu yếu |
| --- | --- | --- |
| Segment | Ai có hành vi hoặc ngữ cảnh chơi cụ thể? | "mọi người", "casual gamer", "người thích puzzle" |
| Motivation | Họ muốn cảm giác gì? | chỉ mô tả tuổi/giới tính |
| Promise | Ad hứa trải nghiệm nào trong 3 giây đầu? | hook không nhìn ra gameplay |
| Proof | Store và first session chứng minh lời hứa ra sao? | screenshot đẹp nhưng không liên quan hook |
| Economics | LTV đến từ ads, IAP hay hybrid? | chỉ nói "sẽ monetization bằng ads" |
| Kill rule | Khi nào thesis bị bác bỏ? | không có ngưỡng pause/iterate |

Quy tắc: nếu thesis không gợi ra được ít nhất 2 creative hook và 1 metric pattern để đọc sau test, thesis còn quá mơ hồ.

---

## Puzzle market thesis map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Puzzle market thesis map mẫu]
Type: hero operating diagram.
Lesson section: Puzzle market thesis map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Puzzle angle | Motivation chính | Ad promise | Store proof cần có | First-session proof | Metric đọc sớm | Rủi ro kinh tế |
| --- | --- | --- | --- | --- | --- | --- |
| Calm daily puzzle | Nghỉ não, routine nhẹ | "A 2-minute brain break" | Screenshot sạch, ít áp lực, màu dễ đọc | Level 1 thắng nhanh, không popup dày | D1, session count | Session ngắn khiến ad impressions thấp |
| Satisfying clear | Dọn sạch, đã mắt | "Clear chaos in one smart move" | Before/after board, combo rõ | Clear moment xuất hiện trong 60-90s | CTR, CVR, D1 | Click tốt nhưng retention dễ mỏng |
| Hard challenge | Tự hào, chứng minh trí tuệ | "Only 1% solve this" | Board khó nhìn có logic, không fake | Thử thách sớm nhưng công bằng | CTR, fail/retry, D1 | CTR cao nhưng churn cao |
| Meta collection | Hoàn thiện bộ sưu tập | "Solve to unlock rooms" | Room/progression visible | Reward meta xuất hiện sớm | Session length, D3 | Scope nội dung nặng cho team nhỏ |
| Fast retry puzzle | Thử lại nhanh, căng nhẹ | "Can you beat this run?" | Run ngắn, fail rõ | Restart nhanh, feedback mạnh | CPI, early churn | User rẻ nhưng LTV thấp |

Cách dùng map: chọn tối đa 2 angle cho test đầu. Nếu chọn 4-5 angle cùng lúc, bạn sẽ không biết metric đang phản hồi motivation nào.

### Thesis decision gate

Trước khi đưa một thesis vào test, hãy kiểm xem nó có đủ quyền trở thành **testable thesis** chưa. Một thesis nghe hay nhưng không có proof chain sẽ làm bạn đốt budget vào creative mơ hồ.

| Gate | Câu hỏi | Pass khi | Nếu fail thì |
| --- | --- | --- | --- |
| Motivation clarity | Người chơi muốn cảm giác gì trong context nào? | Nói được context chơi và emotion chính trong một câu | phỏng vấn/đọc review thêm, không sản xuất ad vội |
| Visual promise | 3 giây đầu có show được action verb không? | `clear`, `sort`, `merge`, `escape`, `decorate` nhìn thấy trên màn hình | storyboard lại hook |
| Store proof | Screenshot/video đầu có chứng minh đúng promise không? | store asset lặp lại cùng action verb của ad | sửa screenshot order/title |
| First-session proof | Level 1-3 có giao cảm giác đó không? | người chơi làm được action chính và nhận feedback sớm | sửa onboarding/level pacing |
| Economics fit | Revenue path có hợp với motivation không? | monetization không phá cảm giác chính | đổi placement/IAP hypothesis |
| Kill/iterate rule | Nếu fail, biết sửa đâu không? | có `keep / revise / pause / kill thesis` rule | viết rule trước khi chạy |

Một thesis chỉ nên chạy khi ít nhất 4/6 gate pass, và hai gate yếu nhất đã được ghi thành risk. Với budget nhỏ, risk được viết rõ còn tốt hơn confidence giả.

```text
Thesis readiness verdict
- Ready to test:
- Main risk:
- Must fix before test:
- Metric pair to read:
- If weak, first action:
- Do not change during test:
```

Quy tắc vận hành: nếu `ad promise` và `store proof` chưa cùng nói một action verb, đừng chạy paid test. Nếu paid test fail, bạn sẽ không biết người chơi từ chối thesis hay chỉ không hiểu lời hứa.

### First-test thesis contract

Trước khi thesis được đưa vào paid test, hãy viết contract một trang. Contract này khóa điều được test và điều không được đổi, để sau report bạn biết thesis yếu thật hay chỉ execution/proof chain bẩn.

| Contract field | Câu hỏi cần khóa | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Thesis sentence | Ai, motivation gì, action verb gì? | Một câu có segment + motivation + gameplay proof | Thesis vẫn là genre label |
| Proof chain | Ad, store, first session có cùng lời hứa không? | Cùng một action verb xuất hiện ở 3 surface | Test fail sẽ không biết sửa đâu |
| Metric pair | Cặp số nào đọc promise và proof? | Ví dụ `CTR/CVR`, `CVR/D1`, `D1/ARPDAU` | Dễ over-read CPI |
| Frozen variables | Cái gì không đổi trong test đầu? | store/build/geo/channel hoặc onboarding được ghi rõ | Report bị dirty |
| First weak-action | Nếu signal yếu, sửa gì đầu tiên? | creative, store, onboarding, economics hoặc thesis | Team đổi mọi thứ cùng lúc |
| Kill/pause condition | Khi nào thesis bị pause thật? | clean read + spend cap + quality floor | bỏ thesis vì một ngày nhiễu |
| Blocked conclusions | Điều gì test đầu không được kết luận? | market size, final LTV, genre winner, product death | overclaim |

```text
First-test thesis contract
- Thesis sentence:
- Proof chain:
- Metric pair:
- Frozen variables:
- First weak-action:
- Pause/kill condition:
- Blocked conclusions:
- Owner/date:
```

Contract tốt thường rất cụ thể: "Nếu CTR yếu nhưng CVR/D1 ổn, chỉ sửa creative opening" tốt hơn "nếu yếu thì tối ưu marketing". Nó giúp team học từ test nhỏ mà không vỡ scope.

---

## Hero visual: thesis chain operating diagram

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: thesis chain operating diagram]
Type: data visual/chart or decision board.
Lesson section: Hero visual: thesis chain operating diagram.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
MARKET THESIS CHAIN - Calming Block Puzzle

Player motivation
  "Tôi muốn nghỉ não 2 phút và thấy một board lộn xộn được dọn sạch"
        |
        v
Ad promise
  Video mở bằng một board gỗ rối, sau đó một nước đặt tạo clear lớn
        |
        v
Store proof
  Screenshot 1: before/after clear moment
  Screenshot 2: level sạch, không áp lực timer
        |
        v
First-session proof
  Level 1-3 cho người chơi tạo một clear moment trong 60-90 giây
  Không interstitial hoặc popup bán hàng trước khi promise được giao
        |
        v
Metric verdict
  CTR/CVR đọc sức hút của promise
  Tutorial complete/D1 đọc first-session proof
  ARPDAU/ad impressions đọc economics, chưa dùng quá sớm để kill thesis
```

Diagram này có một job duy nhất: buộc mọi claim trong thesis phải đi qua bằng chứng. Nếu một ô nghe hay nhưng ô tiếp theo không chứng minh được, đó là chỗ cần sửa trước test.

| Chain node | Evidence cần có trước test | Nếu yếu thì sửa gì trước |
| --- | --- | --- |
| Motivation | Một câu mô tả context chơi cụ thể, ví dụ `office break`, `commute`, `bedtime unwind` | Phỏng vấn/đọc review để đổi từ demographic sang tình huống chơi |
| Ad promise | Hook 3 giây có action verb nhìn thấy được: `clear`, `sort`, `merge`, `rescue` | Storyboard lại opening; bỏ claim không hiện trên màn hình |
| Store proof | Screenshot đầu tiên chứng minh đúng action verb của ad | Đổi thứ tự screenshot, title/subtitle hoặc feature graphic |
| First-session proof | Level 1-3 giao được cảm giác đã hứa trước khi monetization chen vào | Sửa onboarding, level pacing, tutorial friction |
| Metric verdict | Có cặp metric để phân biệt creative/store/product, không chỉ CPI | Gắn event tối thiểu và viết trước rule `iterate / pause / keep` |

**Inspect:** nhìn xem từng lời hứa trong ad có bằng chứng tương ứng ở store và trong 3 phút chơi đầu không.
**Conclude:** thesis mạnh khi cùng một motivation xuất hiện nhất quán ở cả creative, store và gameplay.
**Do not infer:** đừng suy ra rằng chỉ cần một diagram đẹp là thesis đúng; diagram chỉ giúp phát hiện chỗ cần test.

---

## Chart: market thesis risk score

Điểm dưới đây là ví dụ giả lập theo thang 1-5. Điểm cao nghĩa là dễ kiểm chứng với prototype nhỏ, không phải "cơ hội thị trường chắc chắn".

:::chart
title: Market thesis confidence for a small puzzle prototype
Audience clarity|4|Segment and context are concrete
Creative clarity|5|Clear moment is visible in 1 second
Store proof|3|Needs stronger screenshot order
Retention path|2|Daily habit is unproven
Monetization path|3|Rewarded ads need placement validation
:::

**Inspect:** điểm thấp nhất là `Retention path`, nghĩa là thesis có thể thu hút install nhưng chưa chứng minh người chơi quay lại.
**Conclude:** test đầu nên ưu tiên đo D1/tutorial/level depth, không chỉ đo CPI.
**Do not infer:** không dùng các điểm này làm benchmark chung cho mọi puzzle game; đây là scorecard cho một scenario.

---

## Hướng dẫn đọc số

Đọc market thesis bằng cặp số, không đọc một metric đơn lẻ.

| Pattern sau test nhỏ | Chẩn đoán | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| CTR thấp, D1 tốt | Game có proof tốt nhưng promise chưa hấp dẫn | Làm lại 3 giây đầu video, giữ thesis | Đổi target audience ngay |
| CTR cao, Store CVR thấp | Hook gây tò mò nhưng store không chứng minh lời hứa | Sửa screenshot/icon/title theo hook | Tăng budget vì tưởng ad thắng |
| CPI đạt, D1 thấp | Install mua được nhưng motivation không khớp first session | So lại tutorial/level 1-3 với promise | Scale vì CPI rẻ |
| CPI cao, D1 tốt, ARPDAU có tín hiệu | User đắt nhưng chất lượng có thể tốt | Test thêm creative để hạ CPI, chưa kill product | Kill game vì CPI vượt kỳ vọng |
| D1 tốt, ad impressions/user thấp | Retention có nhưng monetization path yếu | Thiết kế rewarded placement tự nhiên | Nhồi interstitial sớm |

Với ngân sách `$100-500`, hãy dùng ngôn ngữ "tín hiệu đủ/không đủ để học tiếp" thay vì "game thắng/thua". Mẫu nhỏ dễ nhiễu, nhưng vẫn đủ để thấy một mắt xích đang gãy nặng.

---

## Worked example: calming hex puzzle thesis

Team có prototype Unity cho game xếp khối lục giác bằng gỗ. Thesis ban đầu:

```text
Segment: người đi làm muốn nghỉ não 2 phút
Motivation: satisfying clear + calm focus
Ad promise: clear a messy wood board in one smart move
Store proof: screenshot 1 là before/after board clear
First-session proof: level 1-3 có clear moment trong 90 giây
Economics: rewarded hint + no-ads IAP
Kill rule: pause nếu spend $80 mà D1 < 18% và tutorial complete < 60%
```

Sau 3 ngày:

| Spend | Installs | CPI | CTR | Store CVR | Tutorial complete | D1 | ARPDAU early |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $96 | 240 | $0.40 | 1.4% | 31% | 86% | 34% | $0.025 |

Diagnosis:

- `Store CVR` và `D1` ổn trong scenario này, nghĩa là store và first session đang chứng minh promise khá tốt.
- `CTR` thấp làm CPI cao. Vấn đề nhiều khả năng nằm ở creative opening, không phải product-market thesis.
- ARPDAU còn sớm và thấp; chưa đủ để kết luận LTV, nhưng đủ để thêm câu hỏi monetization cho test tiếp.

Verdict: **iterate creative, giữ thesis**. Làm 3 biến thể hook nhanh hơn: one-move clear, impossible fit, calm ASMR clear. Không đổi sang "hard challenge" trước khi có bằng chứng rằng motivation calm/satisfying đã thất bại.

### Post-test thesis decision memo

Sau một test nhỏ, output tốt không phải là "CPI ổn" hay "CTR thấp". Output tốt là một verdict về thesis: giữ, sửa proof chain, đổi motivation, hoặc bỏ thesis.

```text
Post-test thesis memo
- Thesis: calm satisfying clear for 2-minute brain break.
- Strongest signal: D1 and tutorial_complete are healthy for this sprint.
- Weakest signal: CTR is weak, causing CPI pressure.
- Verdict: keep thesis, revise creative opening.
- Do not change: motivation, store proof, first-session proof, country/channel for rerun.
- Change one thing: first 3 seconds of ad.
- Next variants: one-move clear, impossible fit, calm ASMR clear.
- Kill condition for next read: CTR remains weak across 3 controlled openings while CVR/D1 no longer support the promise.
```

Decision ladder:

| Pattern | Thesis verdict | Next action |
| --- | --- | --- |
| CTR weak, CVR/D1 healthy | thesis may be right, communication weak | revise creative opening |
| CTR healthy, CVR weak, D1 unknown | attention exists, store proof weak | revise store proof |
| CTR/CVR healthy, D1 weak | acquisition works, first-session proof weak | fix onboarding/level proof |
| CTR/CVR/D1 all weak across clean tests | thesis likely weak | pause or rewrite motivation |
| CPI high but D1/economics promising | valuable user may be expensive | lower CPI via creative/channel, do not kill product |

Điểm quan trọng: thesis chỉ bị bác bỏ khi **proof chain sạch** mà vẫn yếu. Nếu chain bẩn, action là làm sạch chain, không phải viết thesis mới theo cảm xúc.

---

## Market thesis quality checklist

| Check | Câu hỏi tự kiểm | Pass khi |
| --- | --- | --- |
| Motivation | Người chơi muốn cảm giác gì? | Có một từ/cụm motivation rõ: relax, satisfy, mastery, completion |
| Promise | Ad 3 giây đầu hứa gì? | Có thể storyboard bằng 3-4 frame cụ thể |
| Proof | Store và level đầu chứng minh gì? | Screenshot và level 1-3 cùng nói một lời hứa |
| Economics | LTV đến từ đâu? | Có ít nhất một revenue path và rủi ro của nó |
| Stop-loss | Khi nào dừng? | Có spend cap + metric floor |
| Scope | Team nhỏ có làm nổi proof không? | Không phụ thuộc live ops/content khổng lồ |

Đừng thêm audience mới nếu thesis hiện tại chưa có proof chain sạch. Audience mới làm tăng nhiễu; proof chain sạch giúp bạn học nhanh hơn.

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play preview assets guidance](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play yêu cầu/khuyến nghị preview assets như icon, screenshots, feature graphic, video để trình bày app/game trên store. | Store proof là một phần của thesis, không phải việc trang trí sau cùng. Nếu ad hứa "clear chaos", screenshot đầu nên chứng minh clear moment. | Không suy ra rằng chỉ cần screenshot đẹp là CVR cao; screenshot phải khớp promise và traffic source. |
| [Google Play - Candy Crush Saga](https://play.google.com/store/apps/details?id=com.king.candycrushsaga) | Public listing thể hiện board, match/combo, progression và reward surface của một game puzzle lớn. | Một puzzle hit không chỉ bán "puzzle"; nó bán loop cụ thể: level objective, combo feedback, progression. | Không copy content scope, economy hoặc benchmark của game lớn cho team indie nhỏ. |
| [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games) | Publisher catalog có nhiều puzzle sub-angle như sort, screw, block, rescue. | Một publisher có thể test nhiều market theses khác nhau; mỗi game cần motivation và proof riêng. | Không gom mọi game casual/puzzle thành một audience duy nhất. |

Screenshot readout cần làm khi bạn chọn reference:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot đầu tiên đang show action verb nào: sort, clear, match, decorate, escape? | Action verb đó gợi motivation nào và có gần gameplay của bạn không? | Không suy ra ranking/revenue chỉ từ hình store public. |

---

## Common mistakes

- **Mistake - Correction:** Viết "target là người chơi puzzle".
  **Correction:** Viết "người cần một phiên nghỉ não 2 phút và thích cảm giác dọn board sạch".

- **Mistake - Correction:** Chọn reference là game top grossing rồi copy scope.
  **Correction:** Chọn thêm 2-3 reference cùng action verb và gần khả năng sản xuất của team.

- **Mistake - Correction:** Đặt kill rule bằng một metric duy nhất như CPI.
  **Correction:** Dùng cặp `CPI + D1` hoặc `CTR + CVR`; CPI cao nhưng D1 tốt thường là bài toán creative, không phải kill product.

- **Mistake - Correction:** Đổi thesis sau một ngày data nhiễu.
  **Correction:** Chỉ đổi thesis khi proof chain gãy có pattern rõ, ví dụ store CVR thấp lặp lại qua nhiều creative cùng promise.

---

## English Terms You Should Keep

| Term | Giữ nghĩa vận hành |
| --- | --- |
| Genre-market fit | Mức khớp giữa genre/action verb, motivation, audience và economics |
| CPI | Cost Per Install, chi phí trung bình cho một install |
| LTV | Lifetime Value, giá trị doanh thu kỳ vọng của một user/cohort |
| Market thesis | Luận điểm có thể test về ai sẽ chơi, vì sao chơi, proof nào và economics nào |
| Store proof | Bằng chứng trên store cho lời hứa của ad |
| First-session proof | Bằng chứng trong vài phút đầu rằng gameplay giao đúng promise |

---

## Lab output example

```text
Puzzle Market Thesis - v1

Game: Calming Hex Wood Puzzle
Segment: Office/commute players who want a 2-minute calm brain break
Motivation: satisfying clear + low-pressure focus
Ad promise: clear a messy wooden board in one smart move
Store proof: screenshot 1 shows before/after clear; video starts with a real board clear
First-session proof: level 1-3 creates one clear moment within 90 seconds
Reference set: 2 wood/block sort games + 1 calm daily puzzle
Initial market: Android SEA/Tier-2 for cheaper learning traffic
Economics hypothesis: rewarded hints + no-ads IAP; no forced interstitial before level 4
Metric read: CTR + CVR for promise, D1 + tutorial complete for proof
Stop-loss: pause if spend >= $80 and D1 < 18% with tutorial complete < 60%
Next iteration if weak: fix onboarding before changing audience

First-test thesis contract:
- Thesis sentence:
- Proof chain:
- Metric pair:
- Frozen variables:
- First weak-action:
- Pause/kill condition:
- Blocked conclusions:
- Owner/date:
```

Quality bar: người khác đọc output này phải biết bạn sẽ làm creative nào, store proof nào, event nào cần đo và điều kiện nào khiến campaign dừng.

Decision memo example:

```text
Thesis verdict:
Strongest signal:
Weakest signal:
Keep unchanged:
Change one thing:
Next variants:
Pause/kill condition:
Do not conclude:
```

---

## Practical Lab

1. Chọn 3 reference games cùng action verb gần game của bạn, ví dụ `sort`, `clear`, `merge`, `escape`, `decorate`.
2. Viết 2 market thesis khác nhau cho cùng prototype. Mỗi thesis chỉ được có một motivation chính.
3. Với mỗi thesis, viết một ad promise, một store proof và một first-session proof.
4. Gán metric pair cho từng thesis: `CTR/CVR`, `CPI/D1`, hoặc `D1/ARPDAU`.
5. Chọn thesis đáng test đầu tiên bằng tiêu chí: dễ sản xuất creative, dễ chứng minh trong level đầu, rủi ro kinh tế thấp nhất.
6. Viết readiness verdict cho thesis được chọn.
7. Viết post-test decision memo giả lập cho 2 trường hợp: creative yếu nhưng D1 ổn, và CVR/D1 cùng yếu.
8. Viết First-test thesis contract.

Pass lab khi bạn có thể nói: "Nếu test này fail, tôi biết sửa creative, store, onboarding hay thesis."

---

## Final UA Plan Update

Cập nhật trường **Target audience** trong Final UA Plan:

```text
Target audience:
- Segment:
- Motivation:
- Puzzle action verb:
- Ad promise:
- Store proof:
- First-session proof:
- Reference games:
- Initial market:
- Monetization fit:
- Stop-loss rule:
- First next action if weak:
- Thesis readiness verdict:
- Post-test decision memo:
- Do not change during first test:
- First-test thesis contract:
- Metric pair:
- Blocked conclusions:
- Owner/date:
```

Ghi chú: phần này sẽ được dùng lại ở lesson 3 để tách audience theo motivation và ở lesson 8 để đặt metric targets.

---

## Checklist Focus

- [ ] Thesis không dùng audience chung chung.
- [ ] Có đúng một motivation chính cho test đầu.
- [ ] Ad promise, store proof và first-session proof cùng nói một lời hứa.
- [ ] Có metric pair để chẩn đoán, không chỉ có CPI.
- [ ] Có stop-loss theo spend cap + quality floor.
- [ ] Có First-test thesis contract.
- [ ] Có frozen variables và blocked conclusions.
- [ ] Thesis phù hợp scope team Unity nhỏ, không dựa vào content/live ops quá nặng.

---

## Curated References

- [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Google Play - Candy Crush Saga](https://play.google.com/store/apps/details?id=com.king.candycrushsaga)
- [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games)
