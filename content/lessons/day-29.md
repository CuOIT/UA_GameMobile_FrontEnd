---
day: 29
title: "Build the one-page UA launch plan"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [UA, Soft launch, Event taxonomy]
artifact: "One-page launch plan"
---

## Mục tiêu / Goal

Sau bài này, bạn hoàn thiện **One-page UA launch plan** cho micro soft-launch đầu tiên: hypothesis, audience/motivation, promise chain, tracking, creative matrix, campaign structure, budget, decision rules, risk caveats và next action.

Quyết định chính: field nào không giúp team ra quyết định launch, đọc số, hoặc sửa next sprint thì **cắt, gộp, hoặc chuyển sang task ticket**.

Artifact này tổng hợp toàn bộ Final UA Plan thành một trang vận hành mà team có thể mở trong tuần launch và biết: chạy gì, vì sao chạy, đọc số nào, khi nào dừng, ai làm bước tiếp theo.

## Why this matters

Capstone không phải deck chiến lược. Nó là cockpit cho test `$100-500`. Khi campaign đang tiêu tiền, team không cần 12 trang mô tả thị trường. Team cần một trang trả lời nhanh:

- Promise nào đang được kiểm tra?
- Store có chứng minh promise đó không?
- First session có deliver promise trong 3 phút đầu không?
- Event nào phải pass để report đáng tin?
- Budget/cell có đủ đọc không?
- Nếu số ra pattern A/B/C thì team làm gì?

Plan dài dễ che giấu lỗ hổng. One-page plan ép mọi field nối vào decision chain:

`hypothesis -> audience motivation -> ad promise -> store proof -> first-session proof -> event proof -> campaign setup -> metric readout -> decision rule -> next action`

Nếu một field không cải thiện decision nào, nó không thuộc one-page plan.

## Core model: one page = decision surface

Một one-page launch plan tốt không phải bản tóm tắt ngắn. Nó là **decision surface**: mỗi block phải giúp team chọn scale, iterate, hold, fix, hoặc repeat.

| Field | Job trong launch | Câu hỏi phải trả lời | Nếu yếu thì |
| --- | --- | --- | --- |
| Hypothesis | Định nghĩa điều cần học | Test này chứng minh/loại bỏ belief nào? | Campaign không có mục tiêu |
| Audience/motivation | Định nghĩa player fit | Người chơi muốn payoff gì? | Hook và store khó diagnose |
| Promise chain | Nối ad-store-game | Ad promise có proof ở store và first session không? | `CTR`, `CVR`, D1 rời rạc |
| Tracking | Bảo vệ readout | Event nào chứng minh proof? | Report không đáng tin |
| Creative matrix | Giữ asset có logic | Variant khác nhau ở promise nào? | Creative production thành noise |
| Campaign/budget | Phân bổ signal | Spend/cell/window có đọc được không? | Sample quá mỏng |
| Decision rules | Chốt hành động trước khi có data | Pattern nào dẫn đến scale/iterate/hold/fix? | Meeting tranh luận cảm tính |
| Risk caveat | Gọi điểm yếu nhất | Assumption nào có thể làm test vô nghĩa? | Team overclaim |
| Next action | Biến plan thành work | Ai làm gì, khi nào, đo bằng gì? | Plan không chuyển thành sprint |

Rule: mỗi field phải trả lời được "decision nào sẽ tốt hơn nhờ field này?"

## One-page launch plan mẫu

| Section | Example content | Decision supported |
| --- | --- | --- |
| Hypothesis | Satisfying clear hook can acquire better-fit puzzle players than challenge hook | What to test |
| Audience/motivation | Players seeking quick visual payoff and low-friction puzzle progress | Which promise to write |
| Ad promise | "Clear the chaos in one combo" | Creative direction |
| Store proof | Screenshot 1 shows before/after board; short description mirrors the promise | Store readiness |
| First-session proof | Level 2 clear moment appears within 3 minutes | Product proof |
| Tracking | `first_open`, `tutorial_complete`, `level_3_start`, `ad_impression`, `purchase_attempt` | Report validity |
| Creative matrix | 3 hook families x 2 variants; each mapped to motivation/proof | Asset scope |
| Campaign | Android, 1 geo cluster, `$240` cap, 4-day read | Signal allocation |
| Rules | Scale cautiously if chain aligned; fix store if `CTR` high and `CVR` weak; hold if event missing | Operating call |
| Top risk | D1 may be unreadable if `level_3_start` event fails | Readiness priority |
| Next action | Tech validates required events by Friday 17:00 | Immediate work |

Điểm quan trọng: plan không cố "nói hay". Plan cố làm mọi decision trở nên khó hiểu sai.

### One-page acceptance gate

Trước khi gọi plan là xong, kiểm tra 5 gate này. Chỉ cần một gate fail, page chưa launch-ready.

| Gate | Pass khi | Nếu fail |
| --- | --- | --- |
| Decision compression | Người đọc biết test này sẽ dẫn tới scale, iterate, hold/fix hay kill hypothesis | Cắt field mô tả, viết lại thành pattern -> action |
| Proof chain | Ad promise, store proof và first-session proof nói cùng một lời hứa | Sửa store/FTUE hoặc hạ promise trước launch |
| Measurement right | Required events có QA status và caveat | Hold launch hoặc đổi success criteria sang metric đọc được |
| Budget sanity | Spend/cell/window đủ đọc directional signal | Giảm cells hoặc tăng window, không thêm variants |
| Ownership | Next action có owner, date, artifact | Plan chưa chuyển thành sprint |

Acceptance gate không đánh giá plan đẹp hay không. Nó hỏi: **nếu mở page này trong ngày launch, team có biết hành động đúng kế tiếp không?**

Launch/no-launch contract:

```md
Launch call:
[launch / hold / fix-readiness / reduce scope]

Launch only if:
- Tracking gate:
- Store proof gate:
- Creative matrix gate:
- Budget/cell gate:
- Owner/date gate:

No-launch if:
- Required event missing
- Store proof contradicts top hook
- Budget split makes cell unreadable
- Decision rule is still "scale if good"
- No owner for next action
```

## Operating diagram: one-page plan flow

```text
![Operating diagram: one-page plan flow](content/assets/usecases/day-29-hero-diagram.png)Type: hero operating diagram.
Lesson section: Operating diagram: one-page plan flow.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
[Hypothesis: belief to test]
        |
        v
[Motivation: player job]
        |
        v
[Promise chain: ad -> store -> FTUE]
        |
        v
[Tracking: events + QA]
        |
        v
[Campaign: cells + spend]
        |
        v
[Decision rule: scale / iterate / hold / fix]
        |
        v
[Next action: owner + date]
```

**Inspect:** mỗi block có mũi tên xuống decision kế tiếp. Tracking nằm trước campaign vì nếu event fail, campaign không thể tạo product learning hợp lệ.

**Conclude:** one-page plan là operating system nhỏ, không phải summary. Nó buộc hypothesis, proof, tracking và budget cùng nói một ngôn ngữ.

**Do not infer:** one page không có nghĩa là nông. Nó có nghĩa là chỉ decision-critical content được sống sót.

## Readiness scorecard

```text
![One-page launch readiness board](content/assets/usecases/day-29-data-visual.png)Type: readiness scorecard / risk heatmap.
Lesson section: Readiness scorecard.
Visual brief: turn the readiness table into a compact board that highlights the lowest-scoring launch risk, not an average score.
Teaching job: help the learner see which field blocks launch even when the rest of the page looks polished.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

Chấm nhanh trước khi launch. Điểm thấp nhất là launch risk chính.

| Area | 1 = launch risk cao | 3 = directional | 5 = ready | Must fix nếu dưới 3 |
| --- | --- | --- | --- | --- |
| Hypothesis | vague learning | one belief but broad | falsifiable belief | Rewrite as testable sentence |
| Audience/motivation | demographic only | motivation hinted | behavior + payoff clear | Replace demographic with player job |
| Promise chain | ad/store/game mismatch | partial proof | ad-store-first session aligned | Fix store screenshot or FTUE proof |
| Tracking | required events unknown | events listed, QA pending | events verified | Validate before spend |
| Creative matrix | random variants | variants named | each cell maps to promise/proof | Cut noisy variants |
| Budget/cells | over-split spend | readable but tight | spend/cell/window sane | Reduce cells |
| Decision rules | "scale if good" | partial rules | scale/iterate/hold/fix rules | Write pattern-to-action rules |
| Next action | no owner/date | owner OR date | owner + date + artifact | Assign before launch |

**Inspect:** không lấy điểm trung bình để tự trấn an. Hãy nhìn điểm thấp nhất.

**Conclude:** một launch plan có tracking 2/5 hoặc budget/cells 2/5 chưa ready dù creative rất hay.

**Do not infer:** scorecard không dự đoán campaign thắng. Nó chỉ kiểm tra test có tạo learning đọc được không.

### Plan reducer: cut, merge, ticket

Nếu page dài hơn một trang, đừng chỉ giảm font. Hãy xử lý từng dòng bằng 3 lựa chọn:

| Action | Dùng khi | Ví dụ |
| --- | --- | --- |
| Cut | Dòng không thay đổi launch/readout/next action | "Market mobile puzzle rất cạnh tranh" nếu không dẫn tới risk/action |
| Merge | Hai dòng trả lời cùng một quyết định | Audience motivation và ad promise có thể gộp nếu quá lặp |
| Ticket | Chi tiết cần làm nhưng không cần nằm trên page | "Export 6 size variants" chuyển sang creative production ticket |

Rule: one-page plan chỉ giữ **decision-critical facts**. Task detail sống trong ticket. Research detail sống trong appendix. Dashboard detail sống trong readout.

## Hướng dẫn đọc số

One-page plan giúp bạn đọc số theo gap, không panic theo từng metric.

| Plan gap | Metric consequence | Diagnosis | Fix before/after launch |
| --- | --- | --- | --- |
| Audience vague | `CTR`/`CVR` khó giải thích | Không biết click đến từ motivation nào | Rewrite motivation and hook labels |
| Store proof missing | `CTR` ổn, `CVR` yếu | Ad promise không được listing chứng minh | Fix screenshot/copy before rerun |
| First-session proof weak | `CVR` ổn, D1 yếu | User vào game nhưng promise không được deliver | Fix level 1-3 proof |
| Tracking weak | D1/ROAS invalid | Measurement failure, not product conclusion | Validate events then repeat |
| Budget over-split | Noisy winner, spend bias | Too many cells for budget | Reduce cells and rerun |
| Rules vague | Meeting tranh luận lâu | No pre-committed call | Write pattern-to-action rules |
| Risk caveat missing | Team overclaims | Confidence language absent | Add caveat to decision |
| Next action vague | Plan stalls | No owner/date/artifact | Assign one smallest action |

Decision rule: không launch từ plan thiếu **tracking proof**, **budget/cell sanity**, hoặc **next action**.

### Launch-call ledger

Sau khi đọc số, team chỉ nên chọn một trong bốn call. Nếu plan không phân biệt được bốn call này, nó vẫn còn quá mơ hồ.

| Call | Khi nào dùng | Bằng chứng cần có | Hành động tiếp theo |
| --- | --- | --- | --- |
| Scale cautiously | Promise chain sạch, events pass, budget delivery không lệch, signal sau click không phản bội ad | `CTR`/store `CVR`/first-session/D1 direction cùng chiều | Tăng cap nhỏ, giữ cell structure, không thêm biến mới |
| Iterate creative/store | Attention có nhưng store hoặc first-session proof yếu | `CTR` ổn, `CVR` hoặc tutorial/level proof yếu | Sửa screenshot, opening frame, hoặc FTUE proof rồi rerun |
| Hold and repair measurement | Event thiếu, event duplicate, attribution/campaign delivery không đọc được | QA fail hoặc spend bias quá mạnh | Dừng decision, sửa tracking/setup trước |
| Kill hypothesis for now | Chain đã sạch nhưng motivation/promise không tạo signal đủ tốt | Nhiều tầng đều yếu sau khi measurement pass | Ghi learning, chuyển motivation sang backlog, chọn hypothesis khác |

Quan trọng: **Hold** không phải thất bại. Với budget nhỏ, hold đúng lúc bảo vệ team khỏi việc kết luận sai từ data bẩn.

## Worked example: cut draft thành one page

| Draft text | Problem | One-page rewrite |
| --- | --- | --- |
| "Target casual puzzle players globally" | Vague audience | "Players seeking quick satisfying clear moments in short sessions" |
| "Make fun ads showing gameplay" | No promise/proof | "Hook: clear chaos in one combo; proof: before/after board in first 3s" |
| "Run several creatives" | Not actionable | "3 hook families x 2 variants, `$40/cell` cap" |
| "Measure success" | No readout | "`CTR`, store `CVR`, `tutorial_complete`, `level_3_start`, D1 direction" |
| "Improve onboarding if needed" | No owner/date | "Product owner reviews level 1-3 proof by Wednesday" |
| "Scale if results are good" | No condition | "Scale +20% cap only if `CTR`/`CVR`/D1 align and events pass" |
| "Risk: competition is high" | Generic risk | "Top risk: D1 cannot be read if `level_3_start` event fails" |

Verdict: concise is not shallow. It removes details that do not affect launch decisions and makes weak fields visible.

Tradeoff: implementation details still matter, but they belong in task tickets. The one-page plan keeps launch decisions readable under pressure.

### Second-pass one-page read

Đọc lại page theo vai trò trong team:

| Role | Cần nhìn thấy gì trong 60 giây | Nếu thiếu thì hỏi câu gì? |
| --- | --- | --- |
| Founder/producer | Hypothesis, budget cap, decision rule, next action | "Test này giúp mình ra quyết định kinh doanh nào?" |
| Product/design | First-session proof và risk caveat | "Nếu D1 yếu, mình sửa level/onboarding nào trước?" |
| UA/creative | Motivation, ad promise, creative matrix, store proof | "Cell nào đang test promise nào, khác nhau ở biến gì?" |
| Engineering/analytics | Required events, QA status, tracking caveat | "Event nào đang khóa report hoặc launch call?" |

Nếu một role phải đọc lại ba lần mới biết phần mình cần làm, one-page plan chưa đủ sắc. Sửa bằng cách đổi văn mô tả thành owner/action/evidence, không thêm trang mới.

One-page review memo:

```md
One-page review memo

Launch call:
[launch / reduce scope / hold for readiness]

Lowest readiness score:
[area + score + why it blocks learning]

Decision this page supports:
[scale / iterate / hold/fix / kill hypothesis]

Fields cut:
[what was removed because it did not support decision]

Tickets created:
[details moved out of the one-page plan]

Owner/date:
[who updates page before launch]
```

Memo này làm rõ plan đã được biên tập vì decision, không phải vì thiếu nội dung. Một capstone tốt có thể có nhiều ticket phía sau, nhưng page chính phải đứng vững một mình.

### Release handoff pack

One-page plan chỉ thật sự release-ready khi nó có handoff pack: các artifact chứng minh readiness và các ticket triển khai nằm ngoài trang chính. Handoff pack giúp page vẫn gọn nhưng team vẫn biết bằng chứng nằm ở đâu.

| Handoff item | Cần ghi gì | Vì sao |
| --- | --- | --- |
| Evidence links | event QA, store proof, creative matrix, budget sheet, risk note | chứng minh page không chỉ là lời hứa |
| Open blockers | blocker còn lại + owner/date | biết vì sao hold/reduce scope |
| Accepted caveats | caveat được phép launch cùng | tránh overclaim trong readout |
| Tickets created | task chi tiết đã tách khỏi page | giữ one-page không phình |
| First readout kit | template, owner, date, metric order | report đầu tiên không bị orphan |
| Change control | ai được sửa page sau launch | tránh đổi rule giữa test |

```text
Release handoff pack
- Evidence links:
- Open blockers:
- Accepted caveats:
- Tickets created:
- First readout kit:
- Change control:
- Final owner/date:
```

Handoff pack tốt cho phép một người không tham gia viết plan vẫn mở page, xem bằng chứng, biết ticket nào đang chạy, và biết report đầu tiên sẽ đọc như thế nào.

## Plan quality checklist

| Check | Pass condition | Fail symptom |
| --- | --- | --- |
| Field is decision-linked | Each field supports a launch/readout/action call | Strategy prose with no action |
| Promise chain complete | Ad/store/first session say the same promise | `CTR`, `CVR`, D1 cannot be tied together |
| Tracking ready | Required events listed and QA status known | Product learning invalid |
| Budget sane | Spend/cell/window fit micro-budget | Winner likely noise |
| Rules pre-committed | Scale/iterate/hold/fix conditions present | Meeting debates from taste |
| Risk named | Weakest assumption visible | Team overclaims |
| Owner/date present | Next action assigned | Plan sits untouched |

Quality chain:

`plan field -> decision it supports -> evidence required -> owner/date`

## Real usecases đã đối chiếu nguồn

Các nguồn này hỗ trợ các constraint của launch plan: attribution limits, event readiness, privacy/store readiness và creative asset discipline.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit là framework đo campaign success trong khi giúp duy trì user privacy. | Launch plan nên ghi platform/attribution caveat nếu iOS được đưa vào test hoặc roadmap. | Không cần implement iOS attribution nếu tuần này Android-first và chưa chạy iOS traffic. |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting là privacy-preserving và dựa trên source/trigger/reporting logic. | Tracking field là launch decision field, không phải phụ lục kỹ thuật. Setup/reporting caveat ảnh hưởng confidence. | Không đọc early attribution như full user journey chính xác tuyệt đối. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase Unity docs hướng dẫn log events để hiểu user actions, system events và errors; có suggested/custom events. | One-page plan cần liệt kê events chứng minh first-session proof và economy proof. | Không suy ra dashboard có số là taxonomy đúng; QA event names/parameters vẫn cần thiết. |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs đặt privacy/consent strategy trong implementation context của Google Mobile Ads Unity Plugin. | Nếu plan dùng ads monetization signal, SDK/privacy readiness phải hiện trên launch page. | Không biến SDK/privacy thành block mơ hồ; cần owner, deadline, known caveat. |
| [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en) | Google Ads xem creative assets như inputs/ingredients của App campaigns và có best practices theo asset type. | Creative matrix nên ghi asset type, promise, proof và naming rule để campaign setup không bị lẫn. | Không suy ra càng nhiều assets càng tốt với budget nhỏ; readable cells vẫn quan trọng hơn volume. |

### One-page preview readout

| Page area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Hypothesis | Có falsifiable belief không? | Nếu mơ hồ, campaign không biết học gì | Không cần biến hypothesis thành slogan |
| Promise chain | Ad/store/first session có cùng proof không? | Chain aligned giúp đọc `CTR`/`CVR`/D1 | `CTR` cao không chứng minh product fit |
| Tracking | Required events + QA status có hiện không? | Tracking là điều kiện đọc số | Event listed chưa nghĩa là event pass |
| Budget/cells | Spend có bị chia quá mỏng không? | Budget protects signal quality | Small budget không cấm test, chỉ cấm over-split |
| Decision rules | Pattern nào dẫn tới action nào? | Meeting sẽ ngắn và ít cảm tính hơn | Rule không loại bỏ judgement, nó giới hạn overreaction |
| Next action | Có owner/date/artifact không? | Plan đã sẵn sàng bước vào sprint | Page polished không chứng minh launch-ready |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Plan biến thành strategy essay. | **Correction:** Keep only fields that affect launch/readout/next action. |
| **Mistake:** Audience chỉ là demographic. | **Correction:** Viết behavior/motivation/job-to-be-done. |
| **Mistake:** Promise chain thiếu store hoặc FTUE proof. | **Correction:** Map ad promise to screenshot and first 3 minutes. |
| **Mistake:** Tracking field ghi "Firebase installed". | **Correction:** List required events, parameters if needed, and QA status. |
| **Mistake:** Budget không tied to cells. | **Correction:** Add spend/cell, total cap, window, and hold rule. |
| **Mistake:** Rules nói "scale if good". | **Correction:** Write metric pattern and caveat for scale/iterate/hold/fix. |
| **Mistake:** Next action quá lớn. | **Correction:** Pick the smallest owner/date/artifact step before launch. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `UA` | User acquisition |
| `Soft launch` | Controlled market test before wider scale |
| `Event taxonomy` | Event system needed for decision quality |
| `Launch plan` | Operating page for the first test |
| `Decision rule` | Condition for scale/iterate/hold/fix |
| `Readiness scorecard` | Pre-launch risk check by field |
| `Promise chain` | Ad -> store -> first-session proof |
| `Attribution caveat` | Measurement limitation that affects confidence |

## Lab output example

```md
One-page UA launch plan - Calming Hex Puzzle

Hypothesis:
- Satisfying clear hook can acquire better-fit players than challenge hook.

Audience/motivation:
- Players wanting quick visual payoff in short sessions.

Promise chain:
- Ad: clear the chaos in one combo.
- Store: screenshot 1 shows before/after board.
- First session: level 2 clear combo within 3 minutes.

Tracking:
- Required: first_open, tutorial_complete, level_3_start, ad_impression.
- QA status: pending Android release build validation.

Creative matrix:
- 3 hook families x 2 variants.
- Naming: W5_[hookFamily]_[proof]_[variant].

Campaign:
- Android, 1 geo cluster, 4-day read.
- $240 total cap, $40/cell planning cap.

Decision rules:
- Scale cautiously if CTR/CVR/D1 align and events pass.
- Fix store if CTR is healthy but CVR is weak.
- Fix first session if CVR is healthy but D1 is weak.
- Hold/repeat if required event is missing or spend delivery is biased.

Top risk:
- D1 cannot be trusted if level_3_start event fails.

Next action:
- Tech owner validates 4 required events by Friday 17:00.

Launch/no-launch contract:
- Launch only if event QA passes, store screenshot 1 matches top hook, and no cell has less than readable planned spend.
- Hold if level_3_start is missing.
- Reduce scope if creative export misses more than 2 cells.

One-page review memo:
- Launch call: hold until tracking gate passes.
- Lowest readiness score: tracking 2/5.
- Tickets created: event QA ticket, store proof screenshot ticket.
- Owner/date: UA owner updates page after Friday QA.

Release handoff pack:
- Evidence links:
- Open blockers:
- Accepted caveats:
- Tickets created:
- First readout kit:
- Change control:
```

## Practical Lab

1. Fill every Final UA Plan field.
2. Cut each field to decision language.
3. Map promise chain: ad -> store -> first session.
4. List required events and QA status.
5. Check budget/cell/window sanity.
6. Write scale/iterate/hold/fix rules.
7. Name top launch risk.
8. Write the smallest next action with owner/date/artifact.
9. Run the one-page acceptance gate.
10. Apply cut/merge/ticket to every line that does not support a launch/readout/action decision.
11. Write launch/no-launch contract and one-page review memo.
12. Write Release handoff pack.

Quality check: if someone cannot act from the page in 5 minutes, shorten or sharpen it.

## Final UA Plan Update

Cập nhật toàn bộ Final UA Plan thành one-page launch plan:

```md
One-page launch plan:
- Hypothesis:
- Audience/motivation:
- Promise chain:
  - Ad promise:
  - Store proof:
  - First-session proof:
- Tracking/event QA:
- Creative matrix:
- Campaign structure:
- Budget/cell:
- Success criteria:
- Kill/hold criteria:
- Launch/no-launch contract:
- Top risk:
- Lowest readiness score:
- Next action:
- Release handoff pack:
```

Thêm readiness score:

```md
Readiness scorecard:
- Hypothesis:
- Motivation:
- Promise chain:
- Tracking:
- Creative matrix:
- Budget/cells:
- Decision rules:
- Next action:
- Lowest score and fix:
- Fields cut/merged/ticketed:
- Review memo owner/date:
- Evidence links:
- First readout kit:
- Change control:
```

## Checklist Focus

- [ ] Plan đọc được trong một trang.
- [ ] Every field affects a launch decision.
- [ ] One-page acceptance gate đã pass.
- [ ] Có launch/no-launch contract.
- [ ] Có Release handoff pack.
- [ ] Audience is motivation/behavior, not only demographic.
- [ ] Promise chain complete: ad, store, first session.
- [ ] Required events and QA status visible.
- [ ] Budget/cell/window sane for `$100-500`.
- [ ] Decision rules include scale, iterate, hold/fix.
- [ ] Lowest readiness score có fix cụ thể.
- [ ] Các chi tiết không critical đã cut, merge hoặc chuyển thành ticket.
- [ ] Evidence links và first readout kit rõ.
- [ ] Top launch risk named.
- [ ] Next action small, dated, measurable.

## Curated References

- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en)
