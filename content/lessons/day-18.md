---
day: 18
title: "ASO and store promise continuity"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [ASO, CVR, Store listing]
artifact: "Store promise checklist"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Store promise checklist**: một checklist nối từng top ad hook với icon, first screenshot, short description, preview video và first-session proof trên game thật.

Quyết định chính: **trước khi đổ tiền vào traffic, store page có đang xác nhận đúng lời hứa của ad không?**

Kết quả cần có:
- Mỗi top hook có ít nhất một store proof cụ thể.
- Bạn biết đọc `CVR` như tín hiệu store continuity, không chỉ là "traffic quality".
- Bạn biết khi nào sửa store trước khi sửa audience hoặc creative.
- Final UA Plan được cập nhật ở field **Store readiness** và **Creative/store continuity**.

---

## Why this matters

Store page là cây cầu giữa click và install. Với budget `$100-500`, một store mismatch nhỏ có thể làm bạn kết luận sai rằng hook thua hoặc audience kém.

Ví dụ: ad hứa "clear chaos in one smart move", nhưng screenshot đầu lại là menu, map progression hoặc shop. Người xem đã click vì gameplay payoff, nhưng store không cho họ bằng chứng. `CVR` thấp trong tình huống này không phải traffic kém trước tiên, mà là promise chain bị đứt.

Chuỗi cần bảo vệ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

ASO trong micro soft-launch không chỉ là keyword. Nó là promise continuity.

---

## Core model: store page là bằng chứng, không phải brochure

Store listing nên trả lời 3 câu hỏi trong vài giây:

1. Game này hứa điều gì?
2. Screenshot/video đầu có chứng minh lời hứa đó không?
3. Người chơi có thấy cùng promise trong session đầu không?

| Store surface | Job chính | Câu hỏi kiểm tra |
| --- | --- | --- |
| Icon | Tạo nhận diện và tín hiệu genre/mood | Nhìn icon có đoán được game puzzle hoặc object chính không? |
| First screenshot | Chứng minh promise quan trọng nhất | Có thấy gameplay state thật không? |
| Short description | Tóm gọn core value | Có lặp lại hook bằng ngôn ngữ trung thực không? |
| Preview video | Chứng minh motion/sequence | 10 giây đầu có cho thấy gameplay thật không? |
| Data safety/privacy | Giảm friction trust | Có sẵn sàng cho review và traffic paid không? |

---

## Store promise checklist mẫu

| Ad hook | Store proof cần có | First-session proof | Metric đọc | Nếu yếu thì sửa |
| --- | --- | --- | --- | --- |
| Clear chaos in one smart move | Screenshot đầu: board rối -> clear result | Level 1-3 có clear moment | `CVR`, `IPM`, level depth | Đổi screenshot đầu trước khi đổi audience |
| Calm 2-minute puzzle break | Icon/screenshot màu sạch, ít áp lực | Tutorial nhẹ, không timer sớm | `CVR`, D1, session count | Giảm UI noise, bỏ pressure cue |
| Find the perfect move | Screenshot có board đọc được và move gợi ý | Challenge công bằng trong level sớm | `CTR`, `CVR`, retry rate | Sửa copy clickbait hoặc difficulty |
| Sort screws by color | Screenshot tập trung object/action | Người chơi thao tác sort trong 60-90 giây | `CVR`, tutorial complete | Đưa object/action lên first screenshot |

Store continuity audit ladder:

| Audit order | Surface | Pass signal | If weak | Owner |
| --- | --- | --- | --- | --- |
| 1 | Screenshot 1 / first visible frame | Shows the same gameplay payoff promised by the ad | Replace with before/after board, object action, or payoff moment | Store/creative |
| 2 | Short description | Confirms the hook in plain language without overclaim | Rewrite to mirror the top hook and remove vague keyword stuffing | Store/UA |
| 3 | Preview video | Shows real gameplay or payoff in the first seconds | Recut opening, remove menu/setup delay, show the move/result sooner | Creative/product |
| 4 | Icon / feature graphic | Signals genre, object, mood without contradicting hook | Simplify visual cue; avoid meta/progression if hook is gameplay payoff | Art/store |
| 5 | First-session proof | Level 1-3 delivers the same promise the store sold | Fix tutorial, first win, difficulty, reward timing | Product/design |

Rule: audit theo thu tu nay truoc khi doi audience. Neu `CTR` on nhung `CVR` yeu, surface dau tien can nhin thuong la screenshot 1, khong phai bid, audience hay them creative moi.

Framework này dùng để quyết định store asset nào phải sửa trước soft-launch.

### Store proof contract

Trước khi sửa store, viết contract cho từng top hook. Contract giúp store asset không bị biến thành "trang đẹp hơn" nhưng lệch lời hứa.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Ad promise | Người click đang kỳ vọng điều gì? | "Clear chaos in one smart move" |
| Store proof | Surface nào chứng minh promise đầu tiên? | Screenshot 1: before/after board clear |
| First-session proof | Game thật giao promise ở đâu? | Level 2 có clear moment trong 90 giây đầu |
| Not allowed to imply | Store không được hứa điều gì? | Không hứa meta map, character story hoặc reward chưa có |
| Frozen surfaces | Khi repair store, thứ gì giữ nguyên để đọc được? | Hook, country, build, tutorial, campaign setup |
| Success read | Metric nào chứng minh repair có ích? | Store CVR/IPM tăng, D1 không xấu thêm |

Nếu không có `not allowed to imply`, store rất dễ thêm promise phụ để trông hấp dẫn hơn. Với puzzle game nhỏ, promise phụ chưa có trong first session thường tạo install rẻ hơn nhưng D1 xấu hơn.

---

## Operating diagram: đọc store continuity

![Operating diagram: đọc store continuity](content/assets/usecases/day-18-hero-diagram.png)


```text
Ad click
  |
  v
Store visit
  |
  v
Does the first visible store surface prove the ad promise?
  | yes
  v
Install
  |
  v
Does first session prove the same promise?
  | yes -> read retention/quality
  | no -> fix onboarding or early level proof
  |
  no -> fix store proof before blaming traffic
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Store proof nằm giữa ad và install | `CVR` thấp thường là dấu hiệu cần audit store continuity | Không kết luận traffic sai nếu store chưa chứng minh hook |
| First session nằm sau install | D1 thấp có thể là game promise mismatch, không phải ASO đơn thuần | Không sửa keyword nếu lỗi nằm ở gameplay proof |

---

## Chart: promise-chain risk

![Chart: promise-chain risk](content/assets/usecases/day-18-data-visual.svg)


:::chart
title: Promise-chain risk by surface, 1-5
Ad hook clear, store mismatch|5|High CVR risk
Store clear, first session mismatch|4|High retention risk
Ad vague, store clear|3|CTR risk first
Ad/store/session aligned|1|Lower mismatch risk
:::

| Pattern | Risk | Decision |
| --- | ---: | --- |
| Ad rõ, store lệch | 5/5 | Sửa first screenshot hoặc preview video |
| Store rõ, first session lệch | 4/5 | Sửa tutorial/level 1-3 trước khi scale |
| Ad mơ hồ, store rõ | 3/5 | Sửa creative opening hoặc hook copy |
| Ad/store/session đồng bộ | 1/5 | Có thể đọc traffic quality công bằng hơn |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Rủi ro cao nhất là promise bị đứt giữa ad và store | Store asset là một phần của UA test, không phải việc làm sau | Không dùng bảng này như benchmark numeric cố định |

---

## Hướng dẫn đọc số

| Metric pattern | Cách đọc | Next action đúng |
| --- | --- | --- |
| `CTR` cao, store `CVR` thấp | Ad tạo interest, store không xác nhận promise | Audit icon, screenshot đầu, short description |
| `CTR` thấp, `CVR` cao | Store thuyết phục người đã đến, ad chưa kéo đủ attention | Sửa creative opening hoặc format |
| `CVR` cao, D1 thấp | Store hứa được, game session đầu không giữ lời | Sửa tutorial, level 1-3, difficulty hoặc reward timing |
| `IPM` thấp trên mọi hook | Có thể là store tổng thể yếu hoặc tracking/market issue | Kiểm tra store listing, tracking, geo, bid trước khi kết luận game |
| `CVR` cải thiện sau đổi screenshot nhưng D1 không đổi | Store proof tốt hơn, game quality chưa đổi | Tiếp tục đo retention riêng, không overclaim |

Với Android-first micro launch, hãy đọc `CVR` như tín hiệu continuity. ASO không chỉ là search ranking; nó là bước xác nhận lời hứa sau click.

Store repair priority:

| Symptom | Surface cần kiểm trước | Lý do | Repair nhỏ nhất |
| --- | --- | --- | --- |
| `CTR` cao, `CVR` thấp ngay từ đầu | Screenshot 1 / first visible frame | Người click không thấy bằng chứng của hook vừa click | Đưa gameplay payoff hoặc before/after state lên đầu |
| `CVR` thấp trên mọi hook | Icon, title, screenshot 1, build/tracking setup | Có thể là listing tổng thể yếu hoặc setup sai, không phải một hook | Audit store surface chung trước khi sản xuất thêm ads |
| `CVR` khá nhưng D1 thấp | First-session proof | Store bán được promise, game chưa giao đúng promise | Sửa tutorial/level 1-3 hoặc giảm lời hứa |
| `CVR` tăng sau screenshot nhưng D1 không tăng | Product proof | Store proof đã tốt hơn nhưng retention vẫn do gameplay/onboarding | Không tiếp tục tối ưu store để chữa D1 |
| Hook challenge có `CTR` đẹp nhưng `CVR` yếu | Screenshot readability / overpromise copy | Người chơi tò mò nhưng không tin hoặc không hiểu proof | Làm board thật, đọc được; bỏ wording fake-hard |
| Hook relax có `CVR` yếu | Visual noise / pressure cue | Store có thể đang làm người chơi relax thấy căng | Giảm timer, flashing UI, hard challenge framing |

Decision rule:

```text
Repair one surface at a time when the metric question is clear.
If screenshot 1 changes, keep hook/country/campaign setup stable enough to read direction.
If store and first session both change, do not claim which one fixed CVR/D1.
```

Với budget nhỏ, repair tốt là repair giúp bạn học nguyên nhân. Một store revamp lớn có thể đẹp hơn, nhưng nếu nó đổi icon, screenshot, copy và video cùng lúc, bạn mất khả năng biết surface nào thật sự sửa được promise chain.

### Store repair decision gate

Không phải `CVR` thấp nào cũng sửa store. Dùng gate này để chọn đúng lever:

| Gate | Nếu pass | Nếu fail |
| --- | --- | --- |
| Ad click intent rõ | Đọc store proof tiếp theo | Sửa creative hook/opening trước |
| Store surface đầu lệch promise | Sửa screenshot/copy/video trước | Kiểm tra bid, geo, tracking hoặc hook quality |
| First-session proof có trong game | Store có quyền hứa promise đó | Giảm lời hứa store hoặc sửa level 1-3 trước |
| Measurement sạch | Đọc CVR/IPM direction | Fix campaign/source tracking trước |
| Repair scope nhỏ | Test được nguyên nhân | Nếu đổi nhiều surface, ghi là revamp, không gọi là causal repair |

Decision rule:

```text
Store repair is valid only when ad intent is readable, store proof is the suspected leak, and first-session proof can deliver the same promise.
```

Nếu first-session proof chưa tồn tại, store không nên "bán trước" promise đó. Hãy sửa product proof hoặc hạ promise trước khi polish store.

---

## Worked example: ad thắng click nhưng store thua install

Game puzzle chạy 2 hook:

| Hook | CTR | Store CVR | D1 | Store first screenshot | Diagnosis | Decision |
| --- | ---: | ---: | ---: | --- | --- | --- |
| Clear chaos in one smart move | 3.4% | 12% | 14% | Main menu + character | Store không chứng minh board clear | Đổi screenshot đầu sang before/after gameplay |
| Calm puzzle break | 2.1% | 28% | 25% | Clean gameplay board | Promise chain tốt hơn dù CTR thấp | Giữ direction, làm thêm variant |

Sau khi đổi screenshot đầu của hook "clear chaos" sang before/after board:

| Metric | Before | After | Cách đọc |
| --- | ---: | ---: | --- |
| Store CVR | 12% | 22% | Store proof đã bớt lệch promise |
| D1 | 14% | 15% | Game first-session chưa cải thiện nhiều |

Verdict: sửa store có thể cải thiện install conversion, nhưng không tự sửa retention. Nếu D1 vẫn yếu, tiếp theo phải kiểm tra gameplay proof.

Second-pass read:

| Read layer | Câu hỏi | Clear chaos | Calm puzzle break |
| --- | --- | --- | --- |
| Ad promise | Người click mong thấy gì ngay sau click? | Board rối được clear bằng một move thông minh | Board sạch, cảm giác nhẹ, ít áp lực |
| Store proof | Screenshot đầu có xác nhận promise không? | Không, đang là menu + character | Có, clean gameplay board |
| Install intent | `CVR` đang nói điều gì? | Người click không được trấn an sau click | Người đến store hiểu và tin promise hơn |
| First-session proof | D1 có xác nhận product giao promise không? | D1 vẫn yếu sau sửa screenshot, cần xem level proof | D1 tương đối khỏe, nên polish creative thay vì đổi thesis |
| Next smallest action | Sửa gì ít nhất để học tiếp? | Thêm clear moment thật vào level 1-3 hoặc đo level depth | Làm 1-2 creative variants cùng promise |

Decision note nên ghi:

```text
Clear chaos:
- Store CVR improved after screenshot repair, so store mismatch was real.
- D1 did not materially improve, so next action is first-session proof, not more store polish.

Calm puzzle break:
- Lower CTR but healthier CVR/D1 means motivation may fit.
- Next action is stronger opening creative, not a different store promise.
```

Điểm sâu ở đây: store continuity chỉ sửa đoạn click -> install. Nếu install -> D1 vẫn gãy, bạn đã chuyển sang bài toán product proof, không còn là ASO thuần.

Store repair ticket:

```md
Store repair ticket - Clear chaos

Diagnosis:
CTR is healthy but Store CVR is weak. Screenshot 1 does not prove the ad promise.

Change:
Replace screenshot 1 with before/after board clear.
Keep screenshot 2-3 unchanged for this read.
Rewrite short description only if it currently contradicts the hook.

Frozen surfaces:
Ad hook, campaign, market, build, tutorial, first-session content.

Success read:
Store CVR/IPM improves without D1 getting worse.

Escalation:
If CVR improves but D1 stays weak, next action moves to first-session proof.

Do not do:
Do not add meta map, character story, fake rewards, or a polished menu screenshot.
```

Ticket này tách **store repair** khỏi **store redesign**. Repair sửa một nghi vấn cụ thể; redesign có thể dùng sau, nhưng không nên là action đầu tiên khi budget chỉ đủ đọc vài tín hiệu.

### Store repair release memo

Sau khi sửa store, viết memo này trước khi đọc lại report. Memo giúp team không overclaim rằng "store đã sửa xong game" chỉ vì `CVR` tăng.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Store change shipped | Surface nào đổi? | screenshot 1, short description, preview opening... |
| Frozen surfaces | Cái gì giữ nguyên để đọc được repair? | hook, campaign, build, tutorial, geo/source |
| Success read | Metric nào chứng minh store repair có tác dụng? | `CVR`/`IPM` tăng, D1 không xấu thêm |
| Escalation read | Nếu CVR tăng nhưng D1 không tăng thì làm gì? | chuyển sang first-session proof |
| Blocked conclusions | Điều gì không được kết luận? | product fit, final LTV, channel winner |
| Rollback trigger | Khi nào revert hoặc chỉnh tiếp? | CVR giảm, D1 xấu, promise lệch |

```text
Store repair release memo
- Store change shipped:
- Frozen surfaces:
- Success read:
- Escalation read:
- Blocked conclusions:
- Rollback trigger:
- Owner/date:
```

Memo này đặc biệt hữu ích khi screenshot repair làm `CVR` tăng nhưng D1 không đổi. Khi đó team đã học rằng click -> install tốt hơn, nhưng install -> return vẫn cần product proof.

---

## Store readiness and event checklist

| Check | Pass condition |
| --- | --- |
| Icon | Không gây hiểu nhầm genre hoặc object chính |
| Screenshot 1 | Có gameplay thật và proof của top hook |
| Screenshot 2-3 | Cho thấy secondary promise, không chỉ UI/menu |
| Short description | Dưới giới hạn store, rõ core value, không nhồi keyword |
| Preview video | Nếu có, mở sớm bằng gameplay thật |
| Data safety | Chuẩn bị khai báo dữ liệu và SDK trước traffic paid |
| First session | Level 1-3 chứng minh promise mà store đã hứa |

Quality chain verification:

`top hook -> store proof -> install -> first-session proof -> metric read`

Nếu screenshot đầu không pass, đừng blame media source trước.

Store asset brief template:

```md
Store asset brief

Top hook:

Promise to prove:

Screenshot 1 job:

Short description job:

Preview video job, if needed:

First-session proof location:

Do not imply:

Metric read:

Weak-signal action:
```

Brief này nên đi cùng creative brief. Nếu ad team và store team dùng hai lời hứa khác nhau, micro soft-launch sẽ đo mismatch chứ không đo market demand.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Google Play preview assets

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nêu screenshots nên thể hiện trải nghiệm app/game thật để người dùng biết họ sẽ nhận gì sau khi tải. | Với puzzle UA, first screenshot phải là gameplay proof của top hook, không phải decoration. | Không suy ra screenshot đẹp là đủ nếu không chứng minh promise. |
| Short description là phần người dùng thấy sớm và nên tóm tắt core purpose/value. | Copy store nên xác nhận ad hook bằng ngôn ngữ trung thực, ngắn, dễ hiểu. | Không nhồi keyword hoặc CTA nếu nó làm promise kém rõ. |
| Preview video được khuyến nghị cho games và nên show core features sớm. | Nếu ad hứa motion, preview video/store asset nên cho thấy motion hoặc gameplay sequence tương ứng. | Không cần video nếu static/screenshot đã chứng minh đủ cho hook hiện tại. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot đầu có gameplay thật, object/action rõ, ít UI noise | Store đang giúp người click xác nhận lý do cài | Không suy ra đây là bằng chứng retention dài hạn |

### Usecase 2: Google Play Data safety

Nguồn: [Google Play Console Help - Provide information for Google Play's Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play yêu cầu developer cung cấp thông tin về data collection/sharing cho Data safety section. | Store readiness không chỉ là creative. Paid traffic nên đi kèm kiểm tra SDK, analytics và khai báo dữ liệu để tránh friction publish/review. | Không suy ra Data safety sẽ trực tiếp tăng CVR cho mọi game. |
| Data safety liên quan cách app thu thập, chia sẻ, bảo mật dữ liệu. | Khi thêm analytics/ads SDK cho soft-launch, plan phải ghi rõ dữ liệu nào được tracking. | Không dùng bài này thay thế tư vấn pháp lý hoặc policy review đầy đủ. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Đổ lỗi traffic khi `CVR` thấp | Audit store proof trước: icon, screenshot đầu, short description, preview video |
| Screenshot đầu là menu hoặc meta UI | Đưa gameplay proof của top hook lên screenshot đầu |
| Ad hứa challenge, store lại trông relax | Tách hook hoặc sửa store để promise nhất quán |
| Nhồi keyword vào short description | Viết core value rõ, trung thực, dễ hiểu |
| Quên data safety trước khi gắn SDK ads/analytics | Ghi tracking plan và chuẩn bị khai báo data safety |

---

## English Terms You Should Keep

- **ASO**: App Store Optimization, tối ưu store visibility và conversion.
- **Store listing**: Trang hiển thị app/game trên store.
- **CVR**: Conversion rate, tỷ lệ chuyển đổi từ store visit/click sang install.
- **Preview assets**: Icon, screenshots, feature graphic, preview video.
- **Store proof**: Bằng chứng trên store xác nhận ad promise.
- **Data safety**: Phần khai báo dữ liệu trên Google Play.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Top hook | Clear chaos in one smart move |
| Icon proof | Block puzzle icon with clear board color cue |
| Screenshot 1 | Before/after board clear, no menu |
| Short description | Clear satisfying boards in quick puzzle breaks |
| Preview video | 8s gameplay, clear moment appears early |
| First-session proof | Level 2 has a clear moment within 90 seconds |
| Metric to watch | Store `CVR`, `IPM`, D1, level depth |
| Weak signal action | If CTR high CVR low, change screenshot before changing hook |
| Store proof contract | Ad promise, store proof, first-session proof, not-allowed promise, frozen surfaces |
| Repair scope | Screenshot 1 only; keep hook, campaign, build and tutorial stable |
| Store repair release memo | Surface changed, success read, escalation read, blocked conclusions |

Card preview:

```text
Store promise card
Hook: Clear chaos in one smart move
Store proof: First screenshot shows before/after board clear
First-session proof: Level 2 creates clear moment
Metric: CVR + IPM + D1
Decision: Fix store proof before blaming traffic
Frozen: hook, market, build, tutorial
```

---

## Practical Lab

1. Lấy 3 top hooks từ Creative test matrix.
2. Với mỗi hook, ghi store proof cần có: icon, screenshot 1, short description, preview video nếu cần.
3. Ghi first-session proof tương ứng trong level 1-3.
4. Viết metric pattern cho store mismatch và game mismatch.
5. Ghi một store risk cần sửa trước khi chạy paid traffic.
6. Viết store proof contract cho hook ưu tiên.
7. Nếu cần sửa store, viết store repair ticket với change, frozen surfaces, success read và do-not-do.
8. Nếu first-session proof chưa tồn tại, hạ promise hoặc sửa product trước khi polish store.
9. Viết Store repair release memo trước khi đọc report sau repair.

Quality chain check:

- Người click từ ad có thấy cùng promise trên store trong vài giây đầu không?
- Screenshot đầu có gameplay thật không?
- Short description có nói đúng core value không?
- First session có giữ lời store hứa không?
- Data safety/tracking có sẵn sàng cho soft-launch không?
- Repair scope có đủ nhỏ để đọc được nguyên nhân không?
- Store có tránh hứa feature/meta/reward chưa có trong game thật không?
- Release memo có blocked conclusions và escalation read không?

---

## Final UA Plan Update

Cập nhật các field sau:

```text
Store readiness:
- Top hook:
- Icon signal:
- Screenshot 1 proof:
- Short description:
- Preview video need:
- Store proof contract:
- Not allowed to imply:
- Data safety/tracking readiness:

Creative/store continuity:
- Ad promise:
- Store proof:
- First-session proof:
- Frozen surfaces:
- CVR weak-signal action:
- D1 weak-signal action:
- Store repair ticket, if needed:
- Store repair release memo:
- Blocked conclusions after store repair:
```

Không ghi "làm ASO". Hãy ghi rõ store surface nào chứng minh hook nào.

---

## Checklist Focus

- Mỗi top hook có store proof cụ thể.
- Screenshot đầu ưu tiên gameplay proof, không ưu tiên menu.
- `CVR` được đọc như tín hiệu continuity trước khi blame traffic.
- First session phải chứng minh cùng promise với store.
- Có store proof contract cho hook ưu tiên.
- Store repair ticket chỉ sửa một nghi vấn chính.
- Store repair release memo đã viết trước readout.
- Frozen surfaces rõ khi repair store.
- Data safety và SDK tracking được kiểm tra trước paid traffic.

---

## Curated References

- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Google Play Console Help - Provide information for Google Play's Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
