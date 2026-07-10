---
day: 30
title: "Stress-test risks and choose next action"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [Payback window, ROAS, Retention]
artifact: "Risk register and next action"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Risk register and next action** để stress-test one-page launch plan và chọn bước nhỏ nhất tiếp theo trước khi tiêu tiền thật.

Quyết định chính: next action phải **nhỏ, có ngày, có owner, đo được, và giảm top launch risk**. Nếu không giảm risk lớn nhất, nó chỉ là việc bận rộn.

Artifact này chốt các field **nextAction**, **killCriteria**, **successCriteria**, **tracking** và risk notes trong Final UA Plan.

## Why this matters

Một plan nhìn đẹp vẫn có thể fail vì một assumption yếu: promise không rõ, store proof thiếu, first session không giữ lời, tracking chưa validate, budget chia quá mỏng, monetization không có payback logic, hoặc team không có cadence để đọc report.

Ngày cuối không phải để thêm ý tưởng. Nó là lúc tấn công plan:

- Nếu launch tuần này, điều gì dễ làm data vô nghĩa nhất?
- Nếu chỉ được làm một việc trước launch, việc nào giảm risk lớn nhất?
- Nếu phải hold launch, hold vì blocker nào, không phải vì cảm giác sợ?

Với budget `$100-500`, paid test đầu tiên không cần hoàn hảo. Nhưng nó phải **đọc được**. Risk register giúp team phân biệt blocker thật với worry list.

## Core model: risk -> evidence -> mitigation -> next action

Mọi risk trong register phải có evidence và action. Nếu không, nó chỉ là nỗi lo.

| Risk type | Câu hỏi stress-test | Evidence nên tìm | Mitigation thường gặp |
| --- | --- | --- | --- |
| Promise risk | Người chơi có hiểu hook không? | creative script, 3s opening, feedback | simplify hook, test static clarity |
| Store risk | Store có xác nhận ad promise không? | screenshot 1, short description, icon/copy | replace screenshot/copy |
| First-session risk | Game có giữ lời trong 3 phút đầu không? | level 1-3 flow, tutorial completion | fix FTUE proof |
| Tracking risk | Events có đọc được không? | debug output, event QA, dashboard sanity | validate events before spend |
| Budget risk | Matrix có quá nhiều cells không? | spend/cell, expected installs, delivery split | reduce cells |
| Economics risk | CPI/payback có plausible không? | CPI ceiling, ad/IAP assumptions, ROAS window | set ceiling and review window |
| Cadence risk | Ai đọc report và chốt call? | calendar, owner, readout template | schedule decision meeting |
| Compliance risk | SDK/data/store disclosure có blocker không? | SDK list, consent/data safety status | assign privacy/store owner |

Rule: **top risk = high severity x high likelihood x makes data unreadable**.

## Risk register mẫu

| Risk | Evidence | Severity | Likelihood | Mitigation | Next action |
| --- | --- | ---: | ---: | --- | --- |
| Tracking missing D1 proof | `tutorial_complete` and `level_3_start` not QA'd | High | Medium | QA events before spend | Tech validates 5 events by Fri 17:00 |
| Store proof weak | screenshot 1 shows menu, not clear/combo promise | High | High | replace screenshot 1 | Store owner updates by Wed |
| Budget over-split | 9 cells, `$200` cap | Medium | High | reduce to 4-6 cells | UA revises matrix today |
| ROAS window unclear | ad revenue delayed, no D3/D7 caveat | Medium | Medium | set review window | UA writes D3/D7 caveat |
| Cadence missing | no decision meeting scheduled | High | Medium | schedule readout | Team books Monday decision meeting |

Điểm quan trọng: register kết thúc bằng next action, không kết thúc bằng danh sách sợ hãi.

Final launch decision board:

| Launch call | Use when | Required evidence | Next action style |
| --- | --- | --- | --- |
| Launch | No high/high risk makes the report unreadable | Tracking QA pass, store proof acceptable, budget/cell readable, owner/date set | Start smallest paid test and schedule first readout |
| Launch with caveat | Risk exists but does not invalidate the main learning question | Caveat written beside metric interpretation and owner assigned | Launch reduced scope with explicit non-claims |
| Hold | A high/high blocker would make the first report useless | Missing event QA, broken store proof, too many cells, no decision owner | Fix blocker first, then relaunch decision review |
| Reduce scope | Budget is too thin for the planned matrix | Spend/cell or expected installs too low for directional read | Cut cells, keep strongest hooks, preserve readable chain |
| Rewrite plan | Core promise or success/kill rule is unclear | Team cannot state what win/weak/kill means | Rewrite one-page plan before any traffic |

Decision rule: if two launch calls seem possible, choose the call that protects readability. A smaller readable test beats a bigger test that creates confident-looking noise.

## Risk heatmap: chọn blocker thật

```text
![Risk heatmap: chọn blocker thật](content/assets/usecases/day-30-data-visual.png)Type: hero operating diagram.
Lesson section: Risk heatmap: chọn blocker thật.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Likelihood \ Severity | Low severity | Medium severity | High severity |
| --- | --- | --- | --- |
| Low likelihood | Watch | Log caveat | Monitor with trigger |
| Medium likelihood | Accept | Mitigate this sprint | Candidate blocker |
| High likelihood | Contain | Fix before scale | Fix before launch |

**Inspect:** ô "High severity + High likelihood" không được xử lý như task backlog. Nó là blocker hoặc launch caveat cần owner.

**Conclude:** next action nên đến từ ô risk cao nhất làm report mất đọc được, thường là tracking, store proof, budget split, hoặc first-session proof.

**Do not infer:** mọi risk đều phải xóa trước khi học. Một số risk có thể accepted caveat nếu không làm data vô nghĩa.

## Next-action filter

```text
![Next-action decision filter](content/assets/usecases/day-30-hero-diagram.png)Type: decision filter / action funnel.
Lesson section: Next-action filter.
Visual brief: turn the next-action filter into a funnel where candidate actions must pass small, dated, owner, measurable, and reduces-top-risk gates before becoming the final next action.
Teaching job: help the learner choose one executable action instead of ending the course with a vague backlog.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

Chạy mọi candidate action qua filter này:

| Candidate action | Small | Dated | Owner | Measurable | Reduces top risk | Verdict |
| --- | --- | --- | --- | --- | --- | --- |
| "Improve tracking" | No | No | No | No | Unclear | Rewrite |
| "Validate 5 required events on Android release build by Friday 17:00" | Yes | Yes | Yes | Yes | Yes | Good |
| "Make more creatives" | Maybe | No | Maybe | Unclear | No if tracking is top risk | Not first |
| "Launch `$300` test Monday" | No | Yes | Yes | Yes | No if store/tracking blocker exists | Hold |
| "Replace screenshot 1 with before/after clear proof by Wednesday" | Yes | Yes | Yes | Yes | Yes if store risk top | Good |

**Inspect:** "small" không có nghĩa là dễ. Nó nghĩa là có thể hoàn tất và verify.

**Conclude:** next action tốt là một executable sentence: verb + artifact + owner + date + measurement + risk reduced.

**Do not infer:** nếu action không pass filter, ý tưởng có thể vẫn đúng, nhưng chưa đủ để là next action.

### Capstone decision ledger

Trước khi chốt khóa, hãy chuyển risk register thành decision ledger. Ledger này không hỏi "còn việc gì phải làm?", mà hỏi "việc nào quyết định launch call?".

| Item | Câu hỏi quyết định | Output bắt buộc | Nếu thiếu |
| --- | --- | --- | --- |
| Top blocker | Risk nào làm report đầu tiên vô nghĩa nhất? | 1 blocker chính, không quá 2 | Team sẽ chọn việc dễ thay vì việc quan trọng |
| Accepted caveat | Risk nào được chấp nhận nhưng phải ghi giới hạn interpretation? | Caveat + metric không được over-read | Sau launch dễ overclaim |
| Backlog risk | Risk nào có thật nhưng không chặn test nhỏ đầu tiên? | Backlog note + trigger | Risk register biến thành fear list |
| Launch condition | Điều kiện nhỏ nhất để chuyển từ hold sang launch là gì? | Observable pass condition | Hold vô hạn |
| First readout | Ngày nào đọc số, ai chốt call, đọc metric nào? | Calendar + owner + template | Report thành orphan report |

Decision ledger mẫu:

| Risk | Classification | Evidence | Decision | Owner/date |
| --- | --- | --- | --- | --- |
| `tutorial_complete` chưa QA | Blocker | event chưa thấy trên Android release build | Hold spend until QA pass | Tech, Fri 17:00 |
| ROAS D7 chưa đủ window | Accepted caveat | revenue delayed beyond first report | Do not judge ROAS before D7 | UA, first readout |
| Need more creative styles | Backlog | current matrix already has 4 readable cells | Not next action | Creative, after first report |
| Screenshot 1 weak | Repair before launch | store proof does not match top hook | Replace screenshot before spend | Store, Wed |

Rule: chỉ có blocker mới được phép chặn launch. Caveat phải đi kèm câu "không được kết luận gì". Backlog risk phải có trigger để quay lại, không được lẩn vào next action.

### Final decision sanity pass

Trước khi đóng Final UA Plan, đọc lại bằng câu "nếu ngày mai phải tiêu tiền, mình có dám đọc report không?".

| Sanity question | Nếu không trả lời được | Action |
| --- | --- | --- |
| Report đầu tiên sẽ trả lời learning question nào? | Plan vẫn là strategy essay | Rewrite launch call và successCriteria |
| Metric nào không được over-read? | Caveat chưa rõ | Thêm accepted caveat vào risk register |
| Blocker nào chặn launch thật sự? | Risk register là fear list | Chọn tối đa 1-2 blocker, còn lại backlog |
| Next action verify bằng artifact nào? | Action chưa executable | Rewrite thành owner/date/measurement |

Final memo nên ngắn nhưng sắc:

```md
Final capstone memo
- Launch call:
- Top blocker:
- Accepted caveat:
- Not next:
- First readout owner/date:
```

Nếu memo này không thể viết trong 5 dòng, plan vẫn còn lẫn giữa blocker, caveat và backlog.

### Final launch certificate

Trước khi coi Final UA Plan là sẵn sàng, hãy viết một certificate ngắn. Certificate này không phải tài liệu pháp lý; nó là cách team tự xác nhận rằng paid test đầu tiên **có thể đọc được**.

| Certificate field | Câu hỏi phải khóa | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Launch call | Launch, hold, reduce scope hay launch with caveat? | Một call duy nhất | Team chưa được tiêu traffic |
| Top blocker | Risk nào thật sự chặn report? | Tối đa 1-2 blocker có evidence | Risk register vẫn là fear list |
| Accepted caveats | Risk nào được chấp nhận nhưng giới hạn interpretation? | Có câu "không được kết luận gì" | Report dễ overclaim |
| Evidence pack | Artifact nào chứng minh readiness? | Link/tên artifact: event QA, store proof, matrix, budget/cell | Next action chưa verify được |
| First readout contract | Ai đọc số, khi nào, theo template nào? | Owner/date/template rõ | Report sẽ bị orphan |
| Not-next list | Việc hấp dẫn nào cố ý không làm? | Có ít nhất 1-3 item bị hoãn | Team dễ quay lại busywork |

```text
Final launch certificate
- Launch call:
- Top blocker:
- Accepted caveats:
- Evidence pack:
- First readout owner/date:
- Not-next list:
- Condition to change call:
```

Một certificate tốt có thể nói "hold" mà vẫn là kết quả mạnh. Nếu hold dựa trên blocker rõ, owner/date rõ và condition to launch rõ, team đã tiến gần launch hơn nhiều so với việc launch vội rồi không đọc được report.

## Hướng dẫn đọc số

Risk register giúp bạn đọc metric như warning system.

| Risk signal | Cách đọc | Launch call | Next action |
| --- | --- | --- | --- |
| D1 rule exists but event missing | Decision invalid | Hold paid launch | Validate event first |
| Store `CVR` risk before launch | Store proof weak | Fix before clean creative test | Replace screenshot/copy |
| CPI ceiling unknown | Economics unclear | Launch only with caveat or estimate first | Run break-even CPI estimate |
| Budget/cell too low | Sample risk | Reduce scope | Cut variants |
| ROAS window too short | Delayed revenue risk | Do not judge ROAS early | Add D3/D7 review window |
| Creative matrix has no hold rule | Action risk | Do not launch decisionless campaign | Add hold/iterate/scale rules |
| No owner for decision meeting | Cadence risk | Launch likely creates orphan report | Schedule owner/date |
| SDK/privacy disclosure unclear | Store/compliance risk | Hold if required disclosure unknown | Assign SDK/data review |

Rule: if a signal can make the report unreadable, fix or caveat it before spend.

## Worked example: choose the next action

Team has a one-page plan for "Calming Hex Puzzle". They want to launch `$240` next week.

| Candidate | Why tempting | Why not first | Better action |
| --- | --- | --- | --- |
| Make 6 new videos | Feels productive | Tracking and screenshot proof are weaker risks | Validate events + replace screenshot |
| Launch `$240` test Monday | Wants real signal | `level_3_start` not verified; D1 decision could be invalid | Hold until event QA passes |
| Rewrite whole plan | Feels thorough | Too broad, no measurable output | Fix top 2 scorecard fields |
| Add more metrics | Feels safer | More metrics can create noise | Validate required events only |
| Increase budget to "get significance" | Sounds analytical | Budget/cell split still weak | Reduce cells before increasing spend |

Verdict: **hold launch until event QA passes**, then launch smaller matrix.

Next action:

```md
Tech owner validates first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt on Android release build by Friday 17:00.
Measurement: event debug screenshot attached to Final UA Plan.
Risk reduced: D1/product-proof readout invalid.
```

Tradeoff: holding one week feels slow, but it protects the first paid test from becoming unreadable.

Second-pass decision read:

| Candidate | Classification | Why | Final handling |
| --- | --- | --- | --- |
| Validate required events | Blocker mitigation | Nếu thiếu event, D1/product-proof readout không hợp lệ | Must do before spend |
| Replace screenshot 1 | Repair before launch | Store proof yếu có thể làm `CVR` fail dù hook đúng | Do before launch if top hook depends on visual proof |
| Make 6 new videos | Backlog / later iteration | Không giảm tracking/store blocker hiện tại | Wait until first readout or after blockers pass |
| Increase budget | False confidence risk | Thêm tiền không sửa được test unreadable | Only revisit after matrix is readable |
| Rewrite whole plan | Too broad | Không có artifact nhỏ, khó verify | Split into top 2 fields only |

Capstone conclusion nên viết như một decision memo:

```md
Launch call: HOLD.
Reason: required events are not QA'd, so D1/product-proof interpretation is invalid.
Condition to launch: first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt verified on Android release build.
Accepted caveat: ROAS is directional until D7.
Not next: more videos, more budget, full plan rewrite.
First readout: Monday 10:00 after first 48h spend, UA owner leads.
```

Đây là điểm khác giữa "kết thúc khóa" và "sẵn sàng vận hành": bạn không cần sửa mọi thứ, nhưng bạn cần biết chính xác điều gì đang chặn launch, điều gì được chấp nhận như caveat, và điều gì không được làm trước dù nghe hấp dẫn.

## Final audit checklist

| Check | Pass condition | Fail response |
| --- | --- | --- |
| Top 5 risks written | At least one risk per weak plan area | Re-read one-page scorecard |
| Evidence attached | Each risk has observable reason | Rewrite vague risk |
| Severity/likelihood scored | Rough high/medium/low enough | Score before choosing action |
| Mitigation scoped | Actionable and realistic | Split mitigation |
| Next action filtered | small/dated/owner/measurable/risk-linked | Rewrite action |
| Plan link visible | Each top risk maps to Final UA Plan field | Add field reference |
| Launch call clear | launch, hold, or launch with caveat | Do not close course yet |

Quality chain:

`risk evidence -> severity/likelihood -> mitigation -> next action -> launch/hold call -> plan update`

## Real usecases đã đối chiếu nguồn

Các nguồn dưới đây giúp xác định loại risk nào cần hiện trên capstone: store/data responsibility, privacy-era attribution, event readiness và ads SDK/privacy readiness.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en) | Google Play yêu cầu developers có app trên testing/production tracks hoàn thành Data safety form và chịu trách nhiệm về app/SDK data behavior. | Data safety/store disclosure có thể là launch risk thật nếu SDK/data behavior đổi. | Đây không phải legal advice; dùng như trigger để assign owner/checklist. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit là framework đo campaign success trong khi duy trì privacy. | Nếu iOS có trong roadmap/test, attribution caveat nên xuất hiện trong risk register. | Không suy ra iOS measurement cho Android-first test là blocker ngay. |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting là privacy-preserving và source/trigger/report-based. | Attribution/report timing là confidence risk, đặc biệt khi team muốn gọi winner sớm. | Không đọc early report như exact real-time user journey. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase Unity supports logging events to understand user actions/system events/errors. | Event QA là mitigation cụ thể cho tracking risk. | Không suy ra event tồn tại trong code là event đã được verify trên release build. |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs frame privacy/consent strategies for Google Mobile Ads Unity Plugin. | Monetization SDK/privacy choices belong in launch risk if ads revenue or consent affects the test. | Không biến mọi SDK concern thành blocker; score severity/likelihood. |

### Risk register readout

| Register area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Risk name | Có gắn với plan gap cụ thể không? | Vague risk sẽ tạo vague action | "Marketing risk" không đủ cụ thể |
| Evidence | Có artifact/metric/status chứng minh không? | Evidence biến worry thành decision input | Không cần perfect data trước khi ghi risk |
| Severity/likelihood | Risk có làm report unreadable không? | High/high risk cần action hoặc hold call | Không lấy average để che blocker |
| Mitigation | Có giảm risk thật không? | Mitigation phải nhỏ hơn "fix everything" | More work không luôn là mitigation |
| Next action | Có owner/date/measurement không? | Course kết thúc bằng executable step | Risk register không phải backlog vô hạn |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Next action quá lớn. | **Correction:** Rewrite into one artifact with owner/date/measurement. |
| **Mistake:** Risk không có evidence. | **Correction:** Tie risk to plan gap, event status, metric caveat, or artifact. |
| **Mistake:** Fix easy task, not top risk. | **Correction:** Prioritize severity x likelihood x data-readability impact. |
| **Mistake:** Treat risk register as fear list. | **Correction:** Convert every high risk into mitigation or accepted caveat. |
| **Mistake:** Launch despite tracking/store/budget blocker. | **Correction:** Hold or reduce scope if report would be unreadable. |
| **Mistake:** No launch call. | **Correction:** End with launch, hold, or launch-with-caveat. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Risk register` | Bảng risk, evidence, mitigation, owner |
| `Launch blocker` | Risk khiến test không đọc được hoặc không thể launch đúng |
| `Payback window` | Thời gian cần để spend có cơ hội hoàn vốn |
| `ROAS` | Return on ad spend |
| `Retention` | User quay lại sau install/session |
| `Next action` | Bước nhỏ nhất có thể làm ngay |
| `Mitigation` | Việc giảm risk hoặc giới hạn damage |
| `Accepted caveat` | Risk được chấp nhận có ghi rõ giới hạn interpretation |

## Lab output example

```md
Risk register and next action - Final capstone

Top risk:
- Tracking event validation missing.

Evidence:
- tutorial_complete and level_3_start not QA'd on Android release build.

Severity / likelihood:
- Severity: High
- Likelihood: Medium

Mitigation:
- Run clean install event QA before paid traffic.

Next action:
- Tech owner validates first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt by Friday 17:00.

Measurement:
- Event debugger screenshot attached to Final UA Plan.

Launch call:
- Hold paid launch until this passes.

Accepted caveat:
- ROAS will be directional only until D7 revenue window.

Final launch certificate:
- Launch call:
- Top blocker:
- Accepted caveats:
- Evidence pack:
- First readout owner/date:
- Not-next list:
- Condition to change call:
```

## Practical Lab

1. List top 5 risks from your one-page launch plan.
2. Add evidence for each risk.
3. Score severity and likelihood: low/medium/high.
4. Mark each risk as blocker, caveat, or backlog.
5. Choose mitigation for each blocker/high risk.
6. Pick one smallest next action with owner/date/measurement.
7. Write launch call: launch, hold, or launch with caveat.
8. Write the Final launch certificate.
9. Update Final UA Plan.

Quality check: if next action cannot be verified, rewrite it.

## Final UA Plan Update

Cập nhật field **nextAction**:

```md
Next action:
- Action:
- Owner:
- Date:
- Measurement:
- Risk reduced:
- Launch call:
```

Cập nhật field **killCriteria / successCriteria / tracking**:

```md
Risk register:
- Top 5 risks:
- Evidence:
- Severity/likelihood:
- Mitigation:
- Launch blockers:
- Accepted caveats:
- Decision rule affected:
```

Ghi final launch call:

```md
Launch call:
- Status: launch / hold / launch with caveat
- Reason:
- Required condition before spend:
- First readout date:
- Evidence pack:
- Accepted caveats:
- Not-next list:
- Condition to change call:
```

## Checklist Focus

- [ ] Top risks have evidence.
- [ ] Severity/likelihood scored.
- [ ] Blockers separated from accepted caveats.
- [ ] Final launch certificate written.
- [ ] Evidence pack names the artifacts proving readiness.
- [ ] Not-next list prevents attractive busywork.
- [ ] Next action is small/datable/measurable.
- [ ] Owner assigned.
- [ ] Launch/hold/caveat call is clear.
- [ ] Final UA Plan ready for one real-world step.

## Curated References

- [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
