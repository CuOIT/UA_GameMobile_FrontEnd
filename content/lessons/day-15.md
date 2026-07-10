---
day: 15
title: "Creative hooks from player motivation"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Creative testing, CTR, IPM]
artifact: "Hook bank"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Hook bank** cho puzzle game: 6-10 hook được nhóm theo player motivation, mỗi hook có promise, proof asset, expected metric signal và failure action.

Quyết định chính: **hook nào đáng đưa vào creative matrix đầu tiên, hook nào phải bỏ dù nghe hấp dẫn vì game/store chưa chứng minh được**.

Artifact này cập nhật field **creativeMatrix**, **audience** và **successCriteria** trong Final UA Plan. Output không phải "20 câu headline". Output là một bảng quyết định giúp bạn mua ít traffic hơn nhưng học rõ hơn.

## Why this matters

Creative hook là lời hứa đầu tiên người chơi nhìn thấy. Với puzzle game, cùng một board có thể kể nhiều lời hứa khác nhau:

- "Only one move saves this board" đánh vào **Challenge**.
- "Clear the chaos in one combo" đánh vào **Satisfaction**.
- "A quiet puzzle break before sleep" đánh vào **Relaxation**.

Nếu bạn trộn các motivation này trong một ad, `CTR`, `IPM`, store `CVR` và first-session behavior sẽ khó đọc. Bạn không biết người chơi click vì tò mò, vì muốn thư giãn, vì thích combo đã mắt, hay vì tưởng game có meta progression.

Với budget `$100-500`, hook bank phải giảm số biến trong test đầu. Bài này giúp bạn không hỏi "hook nào hay nhất?", mà hỏi "hook nào tạo ra signal dễ đọc nhất và game/store có thể chứng minh thật nhất?".

## Core model: motivation promise proof signal

Hook tốt là một hypothesis về động cơ người chơi:

`player motivation -> hook promise -> visual proof -> store continuity -> first-session proof -> metric signal -> next action`

5 motivation thường gặp trong mobile puzzle:

| Motivation | Player wants | Hook shape | Proof needed |
| --- | --- | --- | --- |
| Challenge | Chứng minh mình thông minh | "Can you solve this?" | Board có tension và solution rõ |
| Satisfaction | Nhìn cleanup/combo đã mắt | "Clear the chaos" | Before/after payoff thật |
| Relaxation | Nghỉ nhẹ, ít áp lực | "A calm puzzle break" | No timer, soft pacing, clean UX |
| Mastery | Tối ưu nước đi, tiến bộ | "Find the smarter move" | Choice, replay, score, elegance |
| Progression | Mở khóa, sưu tập, hoàn thành | "Unlock new boards" | Meta/progression thật trong game |

Không có motivation nào mặc định tốt hơn. Chỉ có motivation **khớp hoặc không khớp** với game hiện tại.

## Hook bank mẫu

| Hook ID | Motivation | Hook promise | Proof asset | Expected signal | Failure action |
| --- | --- | --- | --- | --- | --- |
| H1 | Challenge | "One move saves this board" | Near-fail board, one elegant move | `CTR`/`IPM` có thể cao, watch `CVR` | Nếu `CVR` thấp, làm store screenshot chứng minh challenge rõ hơn |
| H2 | Challenge | "Most players miss this clean move" | 2-choice board state | Curiosity click, risk overpromise | Nếu tutorial drop, giảm độ "trick" trong promise |
| H3 | Satisfaction | "Clear the chaos in one combo" | Messy-to-clean animation | Balanced `CTR` + better first-session fit | Nếu `CTR` thấp, tăng payoff ở 2 giây đầu |
| H4 | Satisfaction | "Watch the board breathe again" | Before/after clear with calm pacing | Strong store continuity | Nếu `IPM` thấp, sharpen opening frame |
| H5 | Relaxation | "A quiet puzzle break before sleep" | No timer, gentle input, soft board | Lower attention, better D1 direction if true | Nếu D1 không tốt, relax promise không thật |
| H6 | Mastery | "Find the smarter move" | 2 options, one efficient path | Quality installs, longer session | Nếu click thấp, make decision moment more obvious |
| H7 | Progression | "Unlock a calmer board set" | Collection/meta preview | Store `CVR` only if meta exists | If product lacks meta, remove from first test |

First creative matrix nên chọn 3-4 hook có proof thật nhất, không chọn tất cả.

### Hook test contract

Trước khi đưa hook vào creative matrix, viết contract ngắn để tránh biến test thành cuộc thi câu chữ.

| Contract field | Câu hỏi phải trả lời | Ví dụ cho puzzle |
| --- | --- | --- |
| Motivation lane | Hook này test động cơ nào, chỉ một động cơ chính? | Satisfaction: muốn thấy board bừa bộn được dọn sạch |
| Promise | Người chơi được hứa trải nghiệm gì trong 1-2 giây đầu? | "Clear the chaos in one combo" |
| Proof chain | Ad, store và first session chứng minh promise bằng gì? | Clip combo clear, screenshot before/after, level 1 có payoff thật |
| Success read | Pattern nào cho thấy hook đáng test tiếp? | CTR vừa đủ, Store CVR không gãy, tutorial_complete không giảm |
| Failure read | Pattern nào cho thấy phải sửa hoặc loại? | CTR cao nhưng CVR/D1 gãy là overpromise |
| Frozen surfaces | Những gì không được đổi trong test này? | Cùng store screenshot, cùng build, cùng region, cùng tutorial |

Contract này giúp team phân biệt **hook đẹp tai** với **hook có thể học được**. Một hook nghe rất hay nhưng không có proof chain là nợ sản xuất, không phải candidate sạch cho micro-budget.

## Hook motivation operating map

![Hook motivation operating map](content/assets/usecases/day-15-data-visual.svg)


| Step | Challenge lane | Satisfaction lane | Relaxation lane | Mastery lane | Progression lane |
| --- | --- | --- | --- | --- | --- |
| Promise | Solve the tense board | Clean the mess | Take a calm break | Choose the smarter move | Unlock/complete something |
| Opening frame | Threatened board | Messy board | Quiet board | Two choices | Reward/progression preview |
| Store proof | Screenshot shows real puzzle tension | Screenshot shows combo payoff | Screenshot shows calm UX | Screenshot shows depth | Screenshot shows actual meta |
| First-session proof | Level 1 has readable challenge | First win feels satisfying | No early pressure/ad spam | Player sees better move logic | Unlock appears early |
| Readout | `CTR`, `IPM`, tutorial drop | `CVR`, tutorial complete | D1 direction, session length | level repeat/complete | `CVR`, progression engagement |

**Inspect:** mỗi lane giữ một motivation riêng, một promise riêng và một proof asset riêng.

**Conclude:** hook đáng test là hook có đủ ad proof, store proof và first-session proof.

**Do not infer:** một lane nhiều metric hơn không có nghĩa tốt hơn; nó chỉ có nhiều chỗ để đọc mismatch hơn.

## Hook signal board

![Hook signal board](content/assets/usecases/day-15-hero-diagram.svg)


| Signal pattern | Likely meaning | Bad conclusion to avoid | Next action |
| --- | --- | --- | --- |
| `CTR` high, store `CVR` low | Hook bắt mắt nhưng store không chứng minh promise | "Hook thắng, tăng budget" | Rewrite screenshots/video to continue promise |
| `CTR` low, `CVR` and tutorial complete good | Motivation đúng nhưng opening frame yếu | "Hook fail" | Keep motivation, remake first 2 seconds |
| `IPM` high, D1 weak | Ad/store overpromise product experience | "Creative team did well, product bad" | Check first-session proof and promise mismatch |
| Challenge hook wins click, relax hook wins retention | Two distinct player motivations | "Average them together" | Split cells; choose based on objective |
| Progression hook gets `CVR`, but tutorial confused | Store promised meta before core loop | "Add more meta in ads" | Delay progression hook until product proof is stronger |
| All hooks unreadable | Too many variables changed | "Need more ads" | Rebuild matrix: one motivation, one promise, one proof per cell |

**Inspect:** không đọc `CTR` một mình. Đọc attention -> install -> store -> first session.

**Conclude:** hook test đầu tiên nên tối ưu learning clarity, không tối ưu vanity winner.

**Do not infer:** bảng này không đưa benchmark universal; pattern phải đọc theo game, channel, geo và asset quality.

## Hướng dẫn đọc số

Đọc hook theo chuỗi:

`creative hook -> store proof -> install quality -> tutorial_complete -> level_1_complete -> D1 direction`

| Metric | Nó nói gì | Nó không nói gì | Khi xấu thì làm gì |
| --- | --- | --- | --- |
| `CTR` | Opening frame/text có kéo attention không | User có đúng motivation không | Sửa 2 giây đầu, không vội sửa product |
| `IPM` | Creative có biến impression thành install không | Store/product có giữ user không | Check store continuity và install path |
| Store `CVR` | Store page có chứng minh ad promise không | First session có deliver promise không | Sửa screenshot/video/caption store |
| `tutorial_complete` | User có hiểu first-session proof không | D1 có tốt không | Rút onboarding, đưa payoff sớm hơn |
| D1 direction | Promise có tạo lý do quay lại không | Hook cụ thể nào thắng nếu attribution mờ | Đọc theo cohort và creative cell nếu có |

Decision rule: chỉ scale hook khi **ít nhất hai tầng sau click** không phản bội promise. Ví dụ `CTR` tốt nhưng store `CVR` thấp là lỗi continuity, chưa phải winner.

### Hook priority ledger

Trước khi đưa hook vào creative matrix, chấm từng hook theo 4 câu hỏi vận hành. Mục tiêu không phải tìm câu chữ "nghe hay", mà tìm hook ít làm nhiễu bài test nhất.

| Gate | Câu hỏi kiểm tra | Pass | Warning |
| --- | --- | --- | --- |
| Motivation clarity | Hook đang gọi đúng một động cơ chính hay trộn nhiều động cơ? | Một hook = một motivation chính | "Relaxing challenge with progression rewards" quá nhiều promise |
| Proof availability | Ad, store và first session có bằng chứng thật cho promise không? | Có clip/screenshot/level 1 chứng minh được | Chỉ có ý tưởng art hoặc feature chưa build |
| Metric readability | Nếu hook fail, team biết đọc fail ở tầng nào không? | Có expected signal + failure action | Chỉ ghi "CTR tốt là thắng" |
| Product fit | Hook có kéo đúng người chơi mà game hiện tại giữ được không? | First-session payoff khớp lời hứa | Click rẻ nhưng tutorial/drop/D1 xấu |

Nếu một hook fail ở **Proof availability**, đừng đưa vào test đầu dù cả team thích nó. Nếu fail ở **Metric readability**, viết lại hypothesis trước khi quay asset. Nếu fail ở **Product fit**, hook có thể để sau roadmap, không nên dùng để mua traffic hiện tại.

### Proof-debt filter

Một hook có thể bị loại không phải vì ý tưởng yếu, mà vì **proof debt** quá cao. Proof debt là khoảng cách giữa lời hứa trong creative và bằng chứng hiện có trong ad/store/game.

| Proof debt level | Dấu hiệu | Quyết định |
| --- | --- | --- |
| Low | Hook có thể quay bằng gameplay hiện tại, store có screenshot match, level 1 deliver payoff | Đưa vào first matrix |
| Medium | Ad quay được nhưng store hoặc level 1 cần chỉnh nhỏ | Cho vào backlog hoặc test nếu chỉnh được trước launch |
| High | Hook hứa meta/progression/social/reward chưa có trong build | Loại khỏi test đầu |
| Dangerous | Hook tạo click bằng claim sai, IP/copy competitor, hoặc promise không thể deliver | Không dùng |

Rule: micro-budget nên mua tín hiệu từ hook `low proof debt` trước. Hook `high proof debt` có thể là roadmap idea, nhưng nếu đem vào UA test quá sớm, bạn đang đo khoảng cách giữa quảng cáo và sản phẩm chứ không đo market motivation.

## Worked example: Calming Hex Puzzle hook bank

Game giả định: puzzle lục giác nhẹ, không timer, có combo clear và hint.

First draft của team có 10 hook, nhưng chỉ 4 hook có proof thật:

| Candidate | Keep? | Why |
| --- | --- | --- |
| "One move saves this board" | Keep | Có board near-fail thật, dễ quay clip 3 giây |
| "Clear the chaos in one combo" | Keep | Có payoff rõ trong core loop |
| "A quiet puzzle break before sleep" | Keep | Pacing/no timer khớp product |
| "Find the smarter move" | Keep as mastery variant | Có thể dùng 2-choice board |
| "Unlock a cozy island" | Cut | Game chưa có meta island |
| "Compete with friends" | Cut | Không có social proof |
| "Win real rewards" | Cut | Sai product, rủi ro policy/trust |

Mini test outcome giả định:

| Hook | Pattern | Diagnosis | Decision |
| --- | --- | --- | --- |
| Challenge | `CTR` high, store `CVR` medium, tutorial drop medium | Hook mạnh nhưng first level hơi khó | Keep, simplify tutorial board |
| Satisfaction | `CTR` medium, store `CVR` good, tutorial complete good | Best promise-product fit | Make 2 more variants |
| Relaxation | `CTR` low, D1 direction better | Audience nhỏ hơn nhưng fit hơn | Keep for retention-oriented cell |
| Mastery | Low attention, high level completion among installers | Opening not obvious | Remake first frame, not kill motivation yet |

Verdict: first creative matrix nên có 3 cells: Challenge, Satisfaction, Relaxation. Progression bị khóa cho đến khi game có meta proof thật.

### Second-pass hook read

Đọc lại outcome theo thứ tự ngược để tránh bị `CTR` làm lệch quyết định:

1. **First-session proof:** người chơi có thấy đúng payoff mà hook hứa không? Nếu không, hook đang bán nhầm experience.
2. **Store continuity:** screenshot/video đầu tiên có nối tiếp promise không? Nếu không, sửa store trước khi kết luận hook sai.
3. **Install quality:** `IPM` cao nhưng tutorial drop cao là overpromise, không phải winner sạch.
4. **Attention:** `CTR` chỉ được dùng để chọn variant mở đầu khi các tầng sau không phản bội promise.

Decision memo cho ví dụ này:

```md
Hook decision memo
- Scale candidate: Satisfaction, vì attention vừa đủ và proof chain sạch nhất.
- Repair candidate: Challenge, vì attention tốt nhưng first-session difficulty cần mềm hơn.
- Keep as niche: Relaxation, vì attention thấp hơn nhưng retention direction có thể hữu ích.
- Hold: Progression, vì product chưa có meta proof thật.
- Next asset request: 2 combo payoff clips + 1 calmer no-timer clip, không request progression art.
```

Creative production ticket cho hook Satisfaction:

```md
Creative production ticket - H3 Satisfaction

Motivation:
Satisfaction - player wants to see messy board become clean.

Hook promise:
"Clear the chaos in one combo."

Required asset:
3-5 second gameplay clip. Frame 1 shows cluttered board. Frame 2 shows the chosen move. Frame 3 shows clear payoff.

Store continuity:
Screenshot 1 must show the same before/after payoff, not a generic menu or feature list.

First-session proof:
Level 1 or level 2 must let player experience one clean combo within the first minute.

Expected signal:
CTR may be lower than clickbait challenge, but Store CVR and tutorial_complete should be cleaner.

Failure action:
If CTR is weak but downstream is clean, remake opening frame.
If CTR is strong but downstream breaks, reduce promise intensity or inspect store mismatch.

Frozen surfaces:
Do not change build, region, tutorial, or store layout during the first read.
```

Asset ticket càng cụ thể, bên làm creative càng ít phải tự đoán. Với indie team, đoán sai ở creative brief thường đắt hơn một lần viết ticket cẩn thận.

### Hook release memo

Trước khi đưa hook vào creative matrix, viết memo ngắn để xác nhận hook đã đủ proof và đủ điều kiện sản xuất. Memo này giúp team không lấy hook nghe hay nhưng proof debt cao vào test đầu.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Hook status | release, repair, hold hay cut? | Một trạng thái duy nhất |
| Proof debt | low, medium, high hay dangerous? | high/dangerous không vào first matrix |
| Evidence needed | Asset nào phải có trước launch? | ad proof, store proof, first-session proof |
| Blocked conclusions | Test này không được kết luận gì? | không gọi audience/product winner từ `CTR` alone |
| Production owner | Ai làm asset, deadline nào? | owner/date rõ |
| Readout plan | Metric nào đọc hook sau launch? | attention + store + first-session |

```text
Hook release memo
- Hook:
- Status:
- Proof debt:
- Evidence needed:
- Blocked conclusions:
- Production owner/date:
- Readout plan:
```

Memo tốt giúp creative backlog bớt "đầy ý tưởng" và trở thành một queue có quyền ưu tiên. Hook nào chưa đủ proof thì không bị xóa khỏi trí nhớ team; nó được giữ ở trạng thái repair/hold với điều kiện quay lại.

## Hook quality checklist

| Check | Pass condition |
| --- | --- |
| One motivation | Hook map về đúng một motivation chính |
| Promise visible | Người xem hiểu promise trong 1-2 giây đầu |
| Product truth | Game thật có thể deliver promise trong first session |
| Store continuity | Screenshot/video đầu tiên tiếp tục promise từ ad |
| Metric hypothesis | Có expected pattern cho `CTR`, `IPM`, `CVR`, first-session metric |
| Failure action | Nếu signal xấu, biết sửa ad, store hay product |
| IP/IP risk | Không copy competitor art, character, exact board hoặc claim |

Quality chain: `motivation -> hook -> proof asset -> store proof -> first-session proof -> metric readout -> next action`.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play dùng feature graphic, screenshots, short description và video để showcase app trên listing/promotional surfaces. | Hook trong ad cần store asset tiếp lời hứa; nếu không, click attention dễ biến thành store `CVR` thấp. | Không suy ra mọi hook cần cùng loại asset; proof tùy promise. |
| [Meta Creative Guidance Navigator](https://www.facebook.com/business/news/introducing-creative-guidance-navigator-data-backed-best-practices) | Meta mô tả creative guidance như các best practices bite-sized/data-backed để cải thiện creative. | Creative testing nên được thiết kế như học có cấu trúc: message, visual, pacing, audience response. | Không copy trend/format máy móc nếu motivation không khớp game. |
| [Apple App Store screenshots and app previews](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots/) | Apple mô tả screenshots/app previews dùng để visually communicate app user experience. | Store proof không chỉ là trang trí; nó phải giúp user hiểu experience sau khi click ad. | Không suy ra store screenshot có thể hứa feature chưa có trong first session. |

Ad-to-store readout:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Ad opening frame | Motivation và promise có rõ trong 1-2 giây không? | Nếu mơ hồ, `CTR` thấp chưa nói motivation sai. | Không đánh giá hook chỉ bằng câu chữ. |
| Store screenshot 1 | Screenshot có tiếp tục cùng promise không? | Nếu ad nói combo mà store chỉ show menu/meta, continuity gãy. | Không dùng screenshot đẹp nhưng không chứng minh promise. |
| First session | Tutorial/level 1 có deliver payoff không? | Nếu product không deliver, `IPM` tốt vẫn nguy hiểm. | Không scale vì click rẻ nếu D1 direction yếu. |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Viết nhiều hook nhưng không nhóm theo motivation. | Nhóm theo Challenge/Satisfaction/Relaxation/Mastery/Progression trước khi viết biến thể. |
| Test câu chữ khác nhau nhưng visual/store/product cũng đổi toàn bộ. | Mỗi cell chỉ nên có một learning variable chính. |
| Dùng challenge hook cho game relax không có tension thật. | Hứa đúng experience; attention rẻ không đáng nếu retention fail. |
| Hứa progression khi game chưa có meta proof. | Khóa progression hook cho đến khi store và first session chứng minh được. |
| Chỉ đọc `CTR`. | Đọc thêm `IPM`, store `CVR`, tutorial_complete và D1 direction. |
| Copy competitor execution. | Học pattern, không copy art/IP/board/claim cụ thể. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Hook` | Lời hứa mở đầu creative |
| `Creative testing` | Test message/visual/pacing để học signal |
| `CTR` | Attention signal: click-through rate |
| `IPM` | Installs per mille, signal kết hợp attention và install efficiency |
| `CVR` | Conversion rate ở store/click/install path |
| `Creative matrix` | Bảng test biến thể creative có cấu trúc |
| `Proof asset` | Asset chứng minh promise: clip, screenshot, board state, payoff |

## Lab output example

```md
Hook bank - Calming Hex Puzzle

Chosen motivations:
1. Challenge: player wants to solve a tense board.
2. Satisfaction: player wants a clean combo payoff.
3. Relaxation: player wants a low-pressure break.

First test hooks:
- H1 Challenge: "One move saves this board"
  Proof asset: near-fail board with one elegant clear.
  Store proof: screenshot 1 shows the same board tension.
  Expected signal: higher CTR/IPM, watch store CVR and tutorial drop.
  Failure action: simplify opening board or reduce challenge promise.

- H3 Satisfaction: "Clear the chaos in one combo"
  Proof asset: before/after combo clear.
  Store proof: short video/screenshot shows real payoff.
  Expected signal: balanced CTR/CVR/tutorial_complete.
  Failure action: increase visual payoff in first 2 seconds.

- H5 Relaxation: "A quiet puzzle break before sleep"
  Proof asset: no timer, calm board, soft pacing.
  Store proof: screenshot sequence avoids pressure/timer language.
  Expected signal: lower CTR, better D1 direction if promise is true.
  Failure action: remove relax promise if first-session pacing is not calm.

Excluded:
- Progression hook because meta unlock is not ready.
- Social challenge hook because no friend/leaderboard proof.

Hook test contract:
- H3 Satisfaction tests one motivation: satisfying cleanup.
- Promise: clear visible chaos in one combo.
- Proof chain: ad clip -> store before/after screenshot -> first-session combo payoff.
- Success read: acceptable attention plus clean CVR/tutorial_complete.
- Failure read: if attention weak, remake opening; if downstream weak, inspect promise mismatch.
- Frozen surfaces: build, region, store layout and tutorial stay stable.

Production ticket:
- Asset: 3-5 second before/move/after combo clip.
- Store continuity: screenshot 1 mirrors the same combo payoff.
- First-session proof: first minute includes one clear payoff.

Hook release memo:
- Hook:
- Status:
- Proof debt:
- Evidence needed:
- Blocked conclusions:
- Production owner/date:
- Readout plan:
```

## Practical Lab

1. Viết 10 hook thô cho game của bạn.
2. Gắn mỗi hook vào đúng 1 motivation chính.
3. Với mỗi hook, ghi proof asset trong ad, store proof và first-session proof.
4. Xóa hook không có proof thật trong build hiện tại.
5. Chọn 3 hook cho first creative matrix.
6. Viết expected metric pattern và failure action cho từng hook.
7. Viết hook test contract cho từng hook được chọn.
8. Chấm proof debt: low, medium, high hoặc dangerous.
9. Viết creative production ticket cho ít nhất một hook để designer/video editor không phải tự đoán promise.
10. Viết Hook release memo cho 3 hook được chọn.

## Final UA Plan Update

Cập nhật field **creativeMatrix**:

```md
Creative hook bank:
- Motivation groups:
- Hooks selected for first test:
- Hook test contract:
- Proof debt level:
- Proof asset required:
- Creative production ticket:
- Hook release memo:
- Store continuity check:
- First-session proof:
- Expected metric signal:
- Failure action:
- Frozen surfaces:
```

Cập nhật field **audience** bằng motivation, không chỉ demographic:

```md
Audience hypothesis:
- Players who want [motivation]
- They respond to [hook promise]
- The game proves it through [proof asset / first-session proof]
```

Cập nhật field **successCriteria**:

```md
Hook success is not CTR alone.
Winner must show acceptable ad attention + store continuity + first-session proof.
```

## Checklist Focus

- [ ] Có ít nhất 6 hook, nhóm theo motivation.
- [ ] Mỗi hook có proof asset trong ad/store/game.
- [ ] Hook được chọn có hook test contract.
- [ ] Hook có proof debt cao bị loại khỏi first matrix.
- [ ] Có creative production ticket cho hook ưu tiên.
- [ ] Có Hook release memo cho hook vào first matrix.
- [ ] First test chỉ chọn 3-4 hook dễ đọc.
- [ ] Mỗi hook có expected signal và failure action.
- [ ] Frozen surfaces rõ để không đổi quá nhiều biến cùng lúc.
- [ ] Store screenshot/video đầu tiên tiếp tục ad promise.
- [ ] Creative matrix, audience và successCriteria trong Final UA Plan đã cập nhật.

## Curated References

- [Google Play: Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Meta: Introducing Creative Guidance Navigator](https://www.facebook.com/business/news/introducing-creative-guidance-navigator-data-backed-best-practices)
- [Apple Developer: Upload app previews and screenshots](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots/)
- [Google Ads Best Practices](https://support.google.com/google-ads/answer/6154846)
