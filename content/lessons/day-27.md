---
day: 27
title: "Post-mortem and learning log"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Cohort, Creative testing, UA]
artifact: "Learning log entry"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được một **Learning log entry** cho mỗi UA test: không chỉ ghi "asset nào thắng", mà ghi rõ **assumption nào đã đổi** và test tiếp theo phải làm gì.

Quyết định chính: sau một campaign nhỏ `$100-500`, bạn có đủ bằng chứng để **update rule**, chỉ **iterate thêm**, hay phải **repeat test vì evidence còn yếu**?

Artifact của bài này cập nhật trực tiếp các field **successCriteria**, **nextAction** và phần learning cadence trong Final UA Plan.

## Why this matters

Indie team thường kết thúc post-mortem bằng vài câu nghe có vẻ đúng: "hook A thắng", "store page chưa tốt", "ads đắt". Vấn đề là các câu đó không cho biết **vì sao thắng**, **độ tin cậy bao nhiêu**, và **lần sau nên thay đổi điều gì**.

Với budget nhỏ, phần nguy hiểm nhất không phải là thua một test. Nguy hiểm là học sai từ test đó. Một creative có `CTR` cao sau 18 installs có thể chỉ là weak hint. Một store screenshot làm `CVR` tăng nhưng D1 không đổi có thể chỉ chứng minh proof rõ hơn, không chứng minh product-market fit. Một iOS result có thể bị ảnh hưởng bởi attribution window và privacy reporting, nên không được đọc như user journey đầy đủ.

Learning log biến campaign report thành product learning loop:

`ad promise -> store proof -> first-session proof -> metric pattern -> assumption update -> next action`

Nếu post-mortem không làm thay đổi một assumption hoặc một rule trong plan, nó chỉ là meeting note.

## Core model: Assumption Change Log

Một post-mortem tốt không hỏi "campaign này thắng hay thua?" trước. Nó hỏi:

> Bằng chứng này làm mình tin điều gì **ít hơn**, tin điều gì **nhiều hơn**, và cần test gì tiếp theo?

| Log field | Câu hỏi vận hành | Output đủ tốt |
| --- | --- | --- |
| Hypothesis | Trước test, team tin điều gì? | Một câu có thể bị chứng minh sai |
| Setup | Test chạy ở đâu, bao lâu, budget/cell nào? | Channel, geo, platform, window, spend |
| Evidence | Metric nào thật sự đổi? | Tách `CTR`, `CVR`, D1, revenue, tracking |
| Confidence | Evidence mạnh đến đâu? | Sample/window/tracking caveat |
| Interpretation | Metric pattern nói gì về promise chain? | Creative, store, first session, economy, tracking |
| Assumption changed | Niềm tin nào được update? | Một câu mới có thể dùng lại |
| Next action | Làm gì tiếp, ai làm, khi nào? | Owner, deadline, artifact |

Nguyên tắc: **evidence là điều xảy ra; interpretation là điều bạn tin sau khi đọc evidence**. Đừng trộn hai thứ này.

## Learning log mẫu

Copy framework này vào Notion, sheet, hoặc Final UA Plan:

| Field | Prompt | Example cho puzzle soft-launch |
| --- | --- | --- |
| Test ID | Test này là gì? | W4-Hook-Relax-vs-Challenge |
| Original hypothesis | Team tin điều gì trước khi chạy? | Challenge hook kéo player puzzle fit hơn |
| Setup | Spend/window/platform/geo/cells? | `$240`, Android, 4 ngày, 3 creatives, US-lite geo |
| Evidence observed | Metric nào đổi theo bucket? | Challenge `CTR` cao hơn, `CVR` thấp hơn, D1 yếu |
| Confidence level | Weak/directional/repeated? | Directional; sample nhỏ; events pass |
| Promise-chain diagnosis | Chain đứt ở đâu? | Ad curiosity không được store + first session chứng minh |
| Assumption changed | Rule mới là gì? | "Challenge angle cần proof công bằng ngay 3s đầu" |
| Next action | Artifact tiếp theo? | Rewrite challenge thành fair puzzle, update first 3 levels proof |

Learning log không cần dài. Nó cần đủ rõ để người đọc sau 2 tuần không phải đoán vì sao team chọn next action.

### Rule-update gate

Không phải learning log nào cũng được phép update rule trong Final UA Plan. Dùng gate này để phân biệt **ghi nhận observation**, **iterate thêm**, hay **đổi operating rule**.

| Gate | Câu hỏi | Nếu pass | Nếu fail |
| --- | --- | --- | --- |
| Hypothesis existed before test | Team có ghi hypothesis trước khi nhìn report không? | Có thể đọc evidence với ít hindsight bias hơn | Ghi là retroactive interpretation, không update rule cứng |
| Evidence maps to one chain link | Pattern chỉ rõ creative/store/first-session/economy/tracking không? | Next action có thể sửa đúng artifact | Repeat hoặc instrument sạch hơn |
| Confidence is named | Weak hint, directional, repeated hay operating rule? | Action có đúng mức độ tin cậy | Không scale/kill, chỉ log caveat |
| Blocked conclusions are explicit | Log nói điều gì chưa được kết luận không? | Team ít overclaim hơn | Bắt buộc thêm caveat trước khi plan update |
| Next action changes an artifact | Có creative/store/event/budget/successCriteria thay đổi không? | Learning đi vào sprint sau | Log chỉ là meeting note |

Action ladder:

| Evidence outcome | Quyền hành động | Không được làm |
| --- | --- | --- |
| Weak hint | Repeat cleaner, reduce variables, fix tracking | Update rule, scale, kill hypothesis |
| Directional signal | Iterate one artifact, keep budget modest | Rewrite strategy toàn bộ |
| Repeated evidence | Update creative/store/product rule | Gọi là universal truth |
| Operating rule | Codify into Final UA Plan and checklist | Bỏ qua caveat/source context |

Rule: nếu log không có `blocked conclusions`, nó chưa đủ trưởng thành để đổi rule.

## Operating diagram: learning loop sau mỗi test

![Operating diagram: learning loop sau mỗi test](content/assets/usecases/day-27-hero-diagram.png)


```text
[1. Hypothesis: "Player wants X"]
        |
        v
[2. Test setup: creative / store / geo / budget]
        |
        v
[3. Evidence: CTR / CVR / D1 / revenue]
        |
        v
[4. Confidence: sample + tracking caveats]
        |
        v
[5. Assumption update: belief changed]
        |
        v
[6. Next action: artifact + owner]
        |
        +--> feeds the next hypothesis
```

**Inspect:** assumption update nằm giữa evidence và next action, không nằm ở cuối như một câu summary cho đẹp.

**Conclude:** team chỉ thật sự học khi report làm thay đổi hypothesis, creative rule, store proof, first-session proof, hoặc metric rule.

**Do not infer:** loop này không yêu cầu một dashboard phức tạp. Một bảng 7 field cũng đủ nếu team ghi đúng evidence và caveat.

## Evidence strength scale

![Evidence strength ladder](content/assets/usecases/day-27-data-visual.png)

| Evidence strength | Dấu hiệu thường thấy | Ngôn ngữ được phép dùng | Action phù hợp |
| --- | --- | --- | --- |
| Anecdote | 1-2 comment, một screenshot, cảm giác của team | "observation" | Discuss, chưa update plan |
| Weak hint | Rất ít installs, delivery lệch, tracking chưa chắc | "weak hint" | Simplify setup hoặc repeat |
| Directional signal | Một test đọc được, events pass, pattern có logic | "directional signal" | Iterate có kiểm soát |
| Repeated evidence | 2+ tests cùng hướng hoặc nhiều cohort nhỏ khớp nhau | "stronger evidence" | Update creative/store/product rule |
| Operating rule | Evidence lặp lại qua channel/window khác nhau | "operating rule" | Codify vào Final UA Plan |

**Inspect:** scale này giới hạn ngôn ngữ của post-mortem. "Challenge hook là hướng sai" chỉ hợp lý khi evidence đã lặp lại; với one-off test, hãy viết "challenge hook đang có weak/directional risk".

**Conclude:** confidence language bảo vệ team khỏi scale quá sớm hoặc kill quá vội.

**Do not infer:** evidence yếu không vô dụng. Nó chỉ chưa được phép biến thành rule cứng.

## Hướng dẫn đọc số

Đọc log theo pattern, không đọc từng metric riêng lẻ:

| Report pattern | Evidence bucket | Interpretation nên ghi | Next test nên làm |
| --- | --- | --- | --- |
| `CTR` cao, `CVR` thấp, D1 yếu | Creative attention mạnh, store/product proof yếu | Promise gây tò mò nhưng chưa chứng minh được fit | Viết hook honest hơn hoặc đổi screenshot proof |
| `CTR` vừa phải, `CVR` tốt, D1 tốt hơn | Motivation fit rõ hơn raw attention | Player được kéo vào bởi promise đúng hơn | Produce thêm variants cùng motivation |
| `CVR` tăng sau store update, D1 không đổi | Store proof tốt hơn, first session chưa đổi | Listing giảm friction nhưng game chưa giữ chân hơn | Giữ store proof, sửa first session proof |
| D1 tốt, ROAS/revenue yếu | Product retention ổn, economy/monetization yếu | Learning thuộc monetization chứ không phải creative | Test ad placement/IAP/onboarding economy |
| Result chỉ mạnh ở một geo/window nhỏ | Measurement/sample caveat | Chưa đủ để scale rule | Repeat ở clean window hoặc geo khác |
| Tracking missing/mismatch | Data quality failure | Không có product conclusion hợp lệ | Fix event taxonomy rồi repeat |
| Spend dồn vào 1 cell quá sớm | Delivery bias | Winner claim yếu | Rerun với cleaner setup hoặc log caveat |

Rule thực hành:

1. Ghi metric raw trước: spend, impressions, clicks, installs, `CTR`, `CVR`, CPI, D1, revenue nếu có.
2. Bucket metric vào chain: creative, store, first session, economy, tracking.
3. Viết confidence caveat trước khi viết verdict.
4. Chỉ update plan nếu next action thay đổi artifact thật: creative matrix, store proof, event taxonomy, budget rule, success criteria.

### Learning decision ledger

Sau post-mortem, đừng viết một verdict duy nhất. Tách verdict thành ba lớp để tránh học sai:

| Layer | Câu hỏi | Ví dụ câu trả lời | Quyền hành động |
| --- | --- | --- | --- |
| Evidence | Số liệu/thực tế nào đã xảy ra? | Relax có `CVR` và D1 tốt hơn Challenge trong window này | Được ghi raw, chưa được thành rule |
| Interpretation | Pattern này nói gì về promise chain? | Challenge tạo attention nhưng store/FTUE chưa chứng minh fairness | Được dùng để thiết kế test kế tiếp |
| Rule update | Niềm tin nào đủ mạnh để đổi plan? | Calm/satisfying promise ưu tiên hơn cho build hiện tại, với confidence directional | Chỉ update rule nếu caveat rõ |

Nếu ba lớp này bị trộn, team dễ biến "A thắng tuần này" thành "A luôn đúng". Với micro-budget, phần quan trọng nhất là biết **được phép tin đến đâu**.

## Worked example: false positive micro-budget

Team chạy test cho mobile puzzle "Calming Hex Puzzle".

| Field | Entry |
| --- | --- |
| Original hypothesis | "Challenge hook sẽ kéo user có puzzle intent tốt hơn relax hook." |
| Setup | 2 creatives, `$120`, Android, 4 ngày, same store listing, D1 read sau 48h |
| Evidence observed | Challenge: `CTR` cao hơn; Relax: `CVR` và D1 tốt hơn; spend hơi dồn vào Challenge ngày đầu |
| Confidence | Directional, không phải rule. Sample nhỏ, delivery biased nhẹ, events pass. |
| Promise-chain diagnosis | Challenge tạo curiosity ở ad nhưng store/first session không chứng minh challenge công bằng đủ nhanh. Relax promise khớp hơn với gameplay hiện tại. |
| Assumption changed | "Với build hiện tại, calm/satisfying promise đáng ưu tiên hơn challenge-hard promise, trừ khi first 3 levels chứng minh fairness tốt hơn." |
| Next action | Làm 2 relax variants, sửa challenge opening thành fair puzzle, thêm screenshot proof về clear/satisfying moment. |

Verdict: **iterate**, không scale và không kill challenge vĩnh viễn.

Tradeoff: nếu chỉ nhìn `CTR`, team sẽ scale Challenge. Nếu chỉ nhìn D1, team có thể bỏ qua rằng Challenge vẫn có attention. Learning log giữ cả hai: attention có thật, nhưng promise chain chưa đủ proof.

### Second-pass post-mortem read

Đọc lại log bằng checklist phản biện:

| Question | Nếu câu trả lời là "không" | Sửa log bằng cách |
| --- | --- | --- |
| Hypothesis có được ghi trước test không? | Có nguy cơ hindsight bias | Ghi rõ "retroactive interpretation", không gọi là hypothesis gốc |
| Evidence có tách khỏi interpretation không? | Team đang kể chuyện theo số | Tách một bảng raw metric và một đoạn diagnosis riêng |
| Confidence có giới hạn không? | One-off test dễ thành rule cứng | Thêm sample/window/tracking caveat |
| Next action có đổi artifact không? | Log chưa chuyển thành learning loop | Gắn action vào creative matrix, store proof, event taxonomy hoặc successCriteria |

Post-mortem tốt là post-mortem làm sprint sau rõ hơn. Nếu kết thúc bằng "monitor thêm" nhưng không nói monitor metric nào, window nào, ai owner, thì log chưa đủ sắc.

Log acceptance contract:

```md
Learning log acceptance

Evidence level:
[weak hint / directional signal / repeated evidence / operating rule]

Allowed update:
[observation only / iterate artifact / update rule / codify checklist]

Blocked conclusions:
[what this test cannot prove]

Artifact changed:
[creativeMatrix / store proof / event taxonomy / successCriteria / budget rule / none]

Repeat condition:
[when this learning needs another test before becoming a rule]

Owner/date:
[who updates the plan and when]
```

Ví dụ:

```md
Evidence level:
Directional signal.

Allowed update:
Iterate creative and store proof. Do not update global audience rule yet.

Blocked conclusions:
This test does not prove Challenge is a bad motivation overall. It only shows current Challenge execution overpromises fairness.

Artifact changed:
creativeMatrix and store proof checklist.

Repeat condition:
Run one cleaner Challenge-fairness cell after first 3 levels are adjusted.
```

Acceptance contract biến log thành một checkpoint vận hành. Nếu log không đổi artifact nào, team vẫn có thể lưu nó, nhưng không nên gọi là learning đã được hấp thụ vào plan.

### Learning absorption certificate

Sau khi viết learning log, hãy xác nhận learning đã được hấp thụ vào workflow. Certificate này trả lời: log đã đổi field nào trong Final UA Plan, ticket nào được tạo, và rule nào vẫn chưa đủ mạnh để codify.

| Certificate field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Plan field changed | Field nào trong Final UA Plan đổi? | `creativeMatrix`, `store proof`, `tracking`, `successCriteria`, `budget`, hoặc `nextAction` |
| Ticket created | Artifact nào được giao owner? | creative ticket, store ticket, event QA ticket, retest ticket |
| Rule status | Observation, directional rule hay operating rule? | Không gọi directional signal là rule cứng |
| Repeat requirement | Cần test lại trước khi codify không? | Có condition cụ thể |
| Archive note | Người đọc sau 2 tuần hiểu vì sao đổi không? | hypothesis + evidence + caveat đủ rõ |

```text
Learning absorption certificate
- Plan field changed:
- Ticket created:
- Rule status:
- Repeat requirement:
- Archive note:
- Owner/date:
```

Nếu certificate không điền được `Plan field changed` hoặc `Ticket created`, learning vẫn đang nằm ngoài operating system. Nó có thể đúng, nhưng chưa biến thành hành động.

## Post-mortem operating checklist

| Check | Pass condition | Fail symptom |
| --- | --- | --- |
| Original hypothesis saved | Hypothesis được ghi trước khi đọc report | Team reverse-write cho hợp data |
| Setup reproducible | Có budget, window, geo, channel, cells | Không ai rerun được test |
| Evidence bucketed | Creative/store/product/economy/tracking tách riêng | "Ads tốt/xấu" quá chung |
| Confidence explicit | Có sample/window/tracking caveat | One-off test biến thành rule |
| Assumption changed | Có một câu belief mới | Log chỉ ghi winner |
| Next action owned | Có owner/date/artifact | Meeting xong không ai làm |
| Plan linked | Ghi field nào trong Final UA Plan đổi | Knowledge nằm ngoài workflow |

Quality chain:

`test setup -> evidence -> confidence -> interpretation -> assumption update -> next artifact`

Nếu thiếu một mắt xích, post-mortem chưa đủ để ra quyết định.

## Real usecases đã đối chiếu nguồn

Các nguồn dưới đây không phải case "hãy làm giống họ". Chúng là source để hiểu vì sao learning log cần ghi setup, event, report type và caveat.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase nói events giúp hiểu user actions, system events, errors; Unity app có thể log suggested/custom events; dashboard aggregate cập nhật định kỳ, debug/logcat hữu ích cho kiểm tra nhanh. | Learning log phải ghi event nào đã pass/fail. Nếu `tutorial_complete` hoặc `level_3_start` không log đúng, D1/retention interpretation yếu. | Không suy ra Firebase tự trả lời creative nào thắng; nó chỉ cung cấp event evidence khi setup đúng. |
| [GA4 Life cycle collection](https://support.google.com/analytics/answer/12924233?hl=en) | GA4 Life cycle giúp đọc funnel từ acquisition đến retention, gồm acquisition, engagement, monetization và retention reports. | Post-mortem nên bucket evidence theo journey stage thay vì gộp tất cả vào một verdict "campaign tốt/xấu". | Không dùng GA4 category như benchmark cứng cho game của bạn; nó là cách tổ chức câu hỏi. |
| [Privacy Sandbox Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting bỏ reliance vào cross-party identifiers; có event-level và aggregatable reports; event-level trigger data bị giới hạn và có noise/reporting windows. | Log phải ghi attribution/reporting caveat, đặc biệt khi so test window hoặc platform khác nhau. | Không suy ra attribution privacy làm UA vô dụng; chỉ cần confidence language cẩn thận hơn. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit như framework đo campaign success trong khi giúp duy trì user privacy. | Với iOS learning, winner label cần đi kèm attribution window và confidence caveat. | Không đọc attribution postback như full user journey hay proof tuyệt đối về motivation. |

### Learning log card readout

| Card area | What to inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Hypothesis | Có phải câu có thể sai không? | Nếu hypothesis mơ hồ, evidence sẽ không đổi được belief | Không cần biến hypothesis thành slogan marketing |
| Evidence | Metric có tách creative/store/product/economy không? | Bucket đúng giúp next action đúng artifact | Một metric đơn lẻ không nói toàn bộ chain |
| Confidence | Có sample/window/tracking caveat không? | Caveat quyết định scale/iterate/repeat | Caveat không làm log yếu; nó làm log trung thực |
| Assumption changed | Có belief mới dùng lại được không? | Đây là phần tạo learning thật | Không biến belief mới thành rule vĩnh viễn khi evidence mới directional |
| Next action | Có owner/date/artifact không? | Learning phải bước vào sprint tiếp theo | Không để next action là "monitor thêm" nếu chưa nói monitor cái gì |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Log chỉ ghi "A won". | **Correction:** Ghi "A thắng ở metric nào, vì assumption nào đổi, confidence bao nhiêu." |
| **Mistake:** Dùng `CTR` làm verdict cuối. | **Correction:** Đọc `CTR` như attention, rồi kiểm store `CVR` và first-session/D1. |
| **Mistake:** Reverse-write hypothesis sau khi thấy data. | **Correction:** Save original hypothesis trước khi launch test. |
| **Mistake:** Không ghi tracking caveat. | **Correction:** Nếu event fail/missing, log "no valid product conclusion". |
| **Mistake:** Trộn creative learning với product learning. | **Correction:** Bucket evidence: creative, store, first session, economy, tracking. |
| **Mistake:** Next action không có owner/date. | **Correction:** Mỗi log kết thúc bằng artifact cụ thể và người chịu trách nhiệm. |
| **Mistake:** Update operating rule từ một directional signal. | **Correction:** Chỉ iterate artifact; đợi repeated evidence trước khi codify rule. |
| **Mistake:** Không ghi blocked conclusions. | **Correction:** Mỗi log phải nói rõ điều test này chưa chứng minh, ví dụ "không chứng minh motivation này chết". |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Post-mortem` | Review sau test để học và sửa system, không phải đổ lỗi |
| `Learning log` | Artifact ghi hypothesis, evidence, confidence, assumption update |
| `Confidence caveat` | Câu giới hạn độ tin cậy của evidence |
| `Assumption` | Niềm tin vận hành có thể đúng/sai |
| `Directional signal` | Bằng chứng có hướng nhưng chưa đủ thành rule |
| `Operating rule` | Rule đã đủ repeated evidence để codify vào plan |
| `Cohort` | Nhóm user theo source/window/time để đọc retention |
| `Attribution window` | Khoảng thời gian report gán conversion về source |

## Lab output example

```md
Learning log entry - W4 Relax vs Challenge

Test ID:
- W4-Hook-Relax-vs-Challenge

Original hypothesis:
- Challenge hook will attract stronger puzzle-fit users than relax hook.

Setup:
- Android, 4 days, $120 total.
- 2 creatives, same store listing, same geo cluster.
- Events checked: install, tutorial_start, level_3_start, session_day_1.

Evidence observed:
- Challenge: higher CTR, weaker store CVR and D1.
- Relax: lower CTR, stronger CVR and D1.
- Spend delivery biased slightly toward Challenge on Day 1.

Confidence:
- Directional signal, not an operating rule.
- Sample small; tracking passed; rerun needed before scale.

Promise-chain diagnosis:
- Challenge creates attention, but current store + first session do not prove fairness fast enough.
- Relax promise matches current gameplay proof better.

Assumption changed:
- For this build, calm/satisfying promise is safer than hard-challenge promise unless first 3 levels are redesigned to prove fairness.

Learning log acceptance:
- Evidence level: Directional signal.
- Allowed update: Iterate creative/store proof; do not codify global audience rule yet.
- Blocked conclusions: Challenge motivation is not dead; current execution lacks fair proof.
- Artifact changed: creativeMatrix, store proof checklist.
- Repeat condition: rerun one cleaner Challenge-fairness cell after first 3 levels improve.

Learning absorption certificate:
- Plan field changed:
- Ticket created:
- Rule status:
- Repeat requirement:
- Archive note:
- Owner/date:

Next action:
- Creative owner: produce 2 relax variants by Monday.
- Game owner: improve first 3 levels' fairness proof by Wednesday.
- Store owner: add one screenshot showing satisfying clear moment.
```

## Practical Lab

1. Chọn một test thật hoặc giả định từ tuần này.
2. Viết original hypothesis trước khi nhìn report.
3. Fill setup: spend, channel, platform, geo, window, cells.
4. Ghi evidence raw theo metric.
5. Bucket evidence vào creative/store/first session/economy/tracking.
6. Chọn confidence level: weak hint, directional signal, repeated evidence, operating rule.
7. Viết đúng một câu **assumption changed**.
8. Viết next action có owner/date/artifact.
9. Cập nhật Final UA Plan field liên quan.
10. Viết learning log acceptance: evidence level, allowed update, blocked conclusions, artifact changed, repeat condition.
11. Nếu evidence chưa đủ rule-update gate, chuyển next action thành repeat/simplify thay vì update rule.
12. Viết Learning absorption certificate.

Quality gate: nếu câu "assumption changed" không làm thay đổi creative matrix, store proof, event taxonomy, success criteria hoặc next action, log chưa đủ sâu.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Learning rule:
- A campaign result is considered actionable only when evidence is bucketed by creative/store/first-session/economy/tracking and has a confidence caveat.

Confidence language:
- Weak hint = repeat/simplify.
- Directional signal = iterate with caution.
- Repeated evidence = update rule.
- Operating rule = codify into plan.
```

Cập nhật field **nextAction**:

```md
Next assumption to validate:
- Current assumption:
- Evidence needed:
- Test setup:
- Owner:
- Deadline:
- Artifact to update:
```

Cập nhật field **creativeMatrix** nếu bài học thuộc creative:

```md
Creative learning:
- Winning/losing cell:
- Metric pattern:
- Promise-chain diagnosis:
- Assumption changed:
- Evidence level:
- Blocked conclusions:
- Artifact changed:
- Repeat condition:
- Next creative rule:
```

Cập nhật field **learningCadence**:

```md
Learning log acceptance:
- Evidence level:
- Allowed update:
- Blocked conclusions:
- Artifact changed:
- Repeat condition:
- Owner/date:

Learning absorption certificate:
- Plan field changed:
- Ticket created:
- Rule status:
- Archive note:
```

## Checklist Focus

- [ ] Learning log có original hypothesis, không reverse-write.
- [ ] Setup ghi đủ spend, platform, geo, window, cells.
- [ ] Evidence tách khỏi interpretation.
- [ ] Metric được bucket theo promise chain.
- [ ] Confidence caveat nói rõ sample/window/tracking.
- [ ] Rule-update gate đã pass trước khi sửa operating rule.
- [ ] Blocked conclusions được ghi rõ.
- [ ] Assumption changed là một câu có thể dùng lại.
- [ ] Learning log acceptance có evidence level, allowed update, artifact changed.
- [ ] Learning absorption certificate có plan field changed và ticket created.
- [ ] Next action có owner/date/artifact.
- [ ] Final UA Plan được cập nhật bằng rule hoặc next test cụ thể.

## Curated References

- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [GA4 Life cycle collection](https://support.google.com/analytics/answer/12924233?hl=en)
- [Privacy Sandbox Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
