---
day: 25
title: "Scale, iterate or kill decision rules"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [ROAS, Retention, Creative testing]
artifact: "Scale-iterate-kill rules"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Scale-iterate-kill rules** để quyết định trước khi cảm xúc của team can thiệp vào report.

Quyết định chính: **mỗi rule phải có gate, condition, diagnosis, action size, owner, review date và confidence caveat**. Rule không chỉ nói "scale nếu tốt" hay "kill nếu xấu"; rule phải nói rõ dữ liệu nào đủ sạch để ra quyết định, hành động lớn đến đâu, và khi nào đọc lại.

Artifact này cập nhật field **successCriteria**, **killCriteria**, **budget**, **tracking**, **nextAction** và **learningLog** trong Final UA Plan.

Đầu ra cần có:

| Rule type | Cần viết rõ | Dùng để tránh |
| --- | --- | --- |
| Scale | Gate pass, condition, scale size, cap, review window | Tăng spend quá tay từ signal mỏng |
| Iterate | Bottleneck nằm ở creative/store/product/economics | Sửa lung tung nhiều thứ cùng lúc |
| Hold | Tracking/sample/window chưa đủ | Đọc noise như winner/loser |
| Pause/kill | Repeated clean evidence + next hypothesis | Kill vì một ngày xấu |

## Why this matters

Micro soft-launch dễ làm team swing giữa "scale ngay" và "kill hết". Với dữ liệu nhỏ, một ngày đẹp có thể chỉ là noise; một ngày xấu có thể là delivery bias, sample mỏng, store mismatch hoặc tracking gap. Nếu không có rule định sẵn, report biến thành tranh luận theo mood.

Decision rule tốt bảo vệ learning:

- **Scale** khi ad, store, first session, economics guardrail và tracking cùng đủ sạch.
- **Iterate** khi một mắt xích yếu nhưng promise vẫn đáng giữ.
- **Hold** khi tracking/sample/window chưa đủ để ra call mạnh.
- **Pause/kill** khi chain fail lặp lại qua clean evidence hoặc economics không còn đáng mua thêm data.

Điểm quan trọng: **kill không phải hình phạt**, và **scale không phải phần thưởng**. Cả hai chỉ là action phù hợp với bằng chứng hiện có.

## Core model: gates before calls

Đọc rule theo thứ tự:

```text
tracking gate
  -> sample gate
  -> promise-chain gate
  -> economics gate
  -> call
  -> action size
  -> review date
  -> learning log
```

| Gate | Câu hỏi | Nếu fail thì |
| --- | --- | --- |
| Tracking gate | Required events/attribution có đủ tin không? | Hold decision, fix measurement |
| Sample gate | Installs/cohort đủ cho loại conclusion không? | Hạ confidence hoặc collect more |
| Promise-chain gate | Ad -> store -> first session aligned không? | Scale/iterate/pause theo bottleneck |
| Economics gate | Cost/revenue có guardrail để tiếp tục không? | Cap spend, wait window, adjust monetization |
| Action gate | Action size có phù hợp confidence không? | Giảm scale size hoặc rerun cleaner |

Rule mạnh cần nhiều gate pass hơn. Scale cần alignment. Iterate cần bottleneck rõ. Pause/kill cần repeated clean evidence hoặc invalid economics/tracking, không chỉ một metric xấu.

## Scale-iterate-kill rules mẫu

| Call | Required gates | Condition | Action | Review |
| --- | --- | --- | --- | --- |
| Scale cautiously | Tracking pass, sample directional+, promise chain aligned | `CTR`, store `CVR`, D1 direction đều không weak trong scenario | Increase daily cap 15-25%, không mở thêm biến | 48-72h hoặc spend floor |
| Iterate creative | Tracking pass, store/product signal usable | `CTR` thấp nhưng `CVR`/D1 khỏe | Produce 2 new openings, giữ store/build | Next report |
| Fix store | Tracking pass, creative attention usable | `CTR` ổn/cao, store `CVR` thấp | Replace screenshot/copy/title proof | After store update |
| Fix product/promise | Tracking pass, store usable | `CVR` tốt, D1/tutorial weak | Fix onboarding/level 1-3 or rewrite promise | Next build/test |
| Hold | Tracking/sample/economics chưa đủ | Missing event, sample mỏng, ROAS window quá sớm | Stop reading as winner/loser | After data readiness |
| Pause/kill | Clean repeated failure | Weak chain across 2 clean reads or economics guardrail broken | Pause hook/campaign, write replacement hypothesis | After new proof |

Action size rule: confidence thấp thì action nhỏ. Nếu sample chỉ directional, scale không vượt "cautious". Nếu tracking thiếu, không scale.

### Decision audit trail

Mỗi call cần để lại audit trail đủ ngắn để team nhìn lại sau 3-7 ngày và biết mình đã quyết định dựa trên gì. Không có audit trail, team sẽ nhớ sai lý do scale hoặc kill.

| Audit field | Câu hỏi phải trả lời | Ví dụ tốt |
| --- | --- | --- |
| Rule triggered | Rule nào được kích hoạt? | `Iterate creative: CTR weak, CVR/D1 healthy` |
| Evidence used | Metric/source/window nào được dùng? | `48h read, Android VN paid cohort, build 0.6.1` |
| Evidence ignored | Metric nào chưa đủ quyền dùng? | `D0 ROAS ignored because revenue window immature` |
| Action size | Hành động lớn đến đâu? | `2 new openings, cap unchanged` |
| Variables frozen | Cái gì giữ nguyên để retest đọc được? | `same store page, same build, same source` |
| Review trigger | Khi nào đọc lại? | `after 72h or $80 spend, whichever first` |
| Unproven claim | Điều gì chưa được kết luận? | `market thesis not proven, only creative opening suspected` |

Audit memo mẫu:

```text
Decision audit
- Rule triggered:
- Evidence used:
- Evidence ignored:
- Action:
- Action size:
- Variables frozen:
- Owner:
- Review trigger:
- What remains unproven:
```

Quy tắc: nếu bạn không viết được "variables frozen", action có nguy cơ làm bẩn test tiếp theo.

### Decision rule acceptance gate

Trước khi một rule được dùng để scale, iterate, hold hoặc pause, nó phải pass acceptance gate. Gate này giúp rule không còn là câu nói chung chung, mà trở thành điều kiện vận hành có thể audit.

| Acceptance field | Scale | Iterate | Hold | Pause/kill |
| --- | --- | --- | --- | --- |
| Required data gates | tracking + sample + promise-chain + economics | tracking + enough signal to locate weak link | tracking/sample/window gap named | repeated clean evidence or economics break |
| Condition | metric pattern and scenario caveat | weak link named | why conclusion is not allowed | failure pattern repeated and clean |
| Action size | cap increase %, max budget, review window | 1-2 changes only | no winner/loser call | stop spend or remove hypothesis from next test |
| Variables frozen | geo/store/build/source unless named | surfaces not being fixed stay stable | paid decision frozen | replacement hypothesis written before spend |
| Owner/date | UA owner + review checkpoint | specific creative/store/product owner | tech/UA owner | UA + product owner |
| Blocked conclusions | not proven scale ceiling | not proven product/market fit | no business verdict | not proof that whole game is bad |

```text
Decision rule acceptance gate
- Call type:
- Required gates:
- Condition:
- Action size:
- Variables frozen:
- Owner/date:
- Blocked conclusions:
- Review trigger:
```

Acceptance rule: nếu `action size` và `blocked conclusions` trống, rule chưa được dùng. Đây là hai dòng chống overreaction mạnh nhất trong micro-budget soft-launch.

## Hero visual: decision rule ladder

![Hero visual: decision rule ladder](content/assets/usecases/day-25-hero-diagram.png)


```text
1. Tracking gate
   If required events are missing -> HOLD

2. Sample gate
   If installs/cohort are too thin -> WEAKEN CALL

3. Promise-chain gate
   Ad promise -> Store proof -> First-session proof
   If one link is weak -> ITERATE THAT LINK

4. Economics gate
   CPI, ARPDAU, ROAS window, payback direction
   If economics is unclear -> CAP OR WAIT

5. Action-size gate
   Strong alignment -> scale cautiously
   Clear bottleneck -> iterate
   Dirty data -> hold
   Repeated clean failure -> pause/kill
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Tracking and sample gates stand before every strong call | Data readiness controls decision strength | Tracking pass means scale automatically |
| Promise-chain gate separates ad/store/product | Iterate should target the weak link | Fixing every link at once improves learning |
| Economics gate happens before scale | Retention without economics may still need cap/wait | Early ROAS alone proves payback |
| Pause/kill is last | Kill needs repeated clean evidence | One bad day is enough to kill a hypothesis |

## Data visual: call matrix

![Data visual: call matrix](content/assets/usecases/day-25-data-visual.png)


| Acquisition/store signal | Product/retention signal | Tracking confidence | Economics guardrail | Call |
| --- | --- | --- | --- | --- |
| Strong | Strong | High/Medium | Acceptable or improving | Scale cautiously |
| Strong | Weak | High | Not broken | Fix product or rewrite promise |
| Weak creative, strong product | Strong | High | Not broken | Iterate creative opening |
| Weak store, strong creative | Unknown/usable | High | Not broken | Fix store proof |
| Strong | Strong | Low | Unknown | Hold, fix tracking |
| Weak | Weak | High | Broken across repeated reads | Pause/kill hypothesis |
| Strong D1 | Weak monetization | High | Payback short | Hold scale; test monetization |
| Cheap CPI | Weak D1 | High | Cheap but low-quality | Do not scale; audit promise/traffic |

Decision board:

| Board row | Evidence required | Action size | Owner/date |
| --- | --- | --- | --- |
| Scale row | 4 gates pass + no major contradiction | 15-25% cap increase | UA owner + 72h review |
| Iterate row | One weak link identified | 1-2 changes only | Creative/store/product owner |
| Hold row | Tracking/sample/window not ready | No winner/loser call | Tech/UA owner |
| Pause row | Repeated clean failure | Stop spend on that hypothesis | UA + product owner |

## Hướng dẫn đọc số

| Pattern | Decision | Guardrail |
| --- | --- | --- |
| Good `CTR`/`CVR`, D1 direction healthy | Scale cautiously | Increase small, keep variables stable |
| Good `CTR`, poor `CVR` | Fix store | Do not change hook first |
| Poor `CTR`, good `CVR`/D1 | Iterate creative | Product may be worth selling better |
| Good `CVR`, weak tutorial/D1 | Fix product/promise | Do not blame ad first |
| Good `ROAS`, tracking caveat | Hold/validate | Do not scale blind |
| Low CPI, weak D1 | Do not scale just because cheap | Audit user fit/promise |
| Strong D1, weak monetization | Hold economics call | Check ad/IAP placement and payback window |
| High `IPM`, low retention | Acquisition may be efficient but misleading | Inspect promise and source quality |

Rule phrasing:

| Call | Good wording | Bad wording |
| --- | --- | --- |
| Scale | "Increase cap 20% after tracking pass and aligned store/D1" | "Scale if numbers good" |
| Iterate | "Rewrite first 2 seconds because CTR is weak while CVR/D1 are healthy" | "Make new ads" |
| Hold | "Hold decision until tutorial event is fixed" | "Maybe wait" |
| Pause | "Pause hook after two clean reads show CTR high, CVR/D1 weak" | "Kill because yesterday was bad" |

Conflict resolver:

| When two calls seem possible | Choose this call first | Why | Follow-up |
| --- | --- | --- | --- |
| Scale vs Hold | Hold | Tracking/sample weakness can make scale look safer than it is | Fix readiness, then re-read same rule |
| Scale vs Iterate | Iterate small | A clear weak link means extra spend may only buy more of the same leak | Ship one focused change, keep cap flat |
| Scale vs Monetization wait | Cap/Wait | Retention quality without payback direction is not yet scale proof | Add economics readout window and placement test |
| Pause/kill vs Iterate | Iterate once if promise chain has one strong link | A recoverable weak link is not the same as failed thesis | Define what evidence would pause next time |
| Pause/kill vs Hold | Hold | Dirty data cannot support a strong negative call | Clean tracking/sample before killing |
| Creative iterate vs Store iterate | Fix the earliest proven leak | Upstream leaks distort downstream metrics | Keep the other surface stable until retest |

Priority rule: **dirty data beats optimistic calls, clear bottleneck beats broad reaction, repeated clean failure beats hope**. If the team cannot agree on the call, shrink the action size and write the uncertainty into `learningLog`.

## Worked example: four calls

| Case | Metrics | Gate read | Diagnosis | Call |
| --- | --- | --- | --- | --- |
| A | `CTR` 2.6%, `CVR` 32%, D1 25%, events pass | Tracking/sample pass | Chain aligned | Scale cautiously +20% cap |
| B | `CTR` 4.1%, `CVR` 12%, D1 10%, events pass | Tracking pass | Curiosity trap/store-product mismatch | Pause hook, rewrite promise |
| C | `CTR` 1.1%, `CVR` 35%, D1 28%, events pass | Product/store signal good | Product fit, weak selling | Iterate creative opening |
| D | `CTR` 3.0%, `CVR` 28%, D1 missing event | Tracking fail | Decision invalid | Hold paid decision |

Verdict: the best CPI is not automatically the scale call. Quality chain decides.

Tradeoff: cautious scale is slower than aggressive scale, but it keeps learning alive when sample is still limited. Pause is not failure; it prevents buying more noise.

Operational note:

```md
If action size feels exciting, check confidence again.
If confidence is only directional, action size must stay small.
If tracking is dirty, the correct call is hold, not optimism.
```

### Exception and override memo

Thực tế đôi khi team vẫn phải hành động dù data chưa đẹp: sắp hết budget, store issue nghiêm trọng, SDK bug, hoặc stakeholder muốn thử một biến thể. Khi đó không được giả vờ rule vẫn sạch. Hãy ghi override như một ngoại lệ.

```text
Override memo
- Original rule call: Hold because tutorial_complete event is missing.
- Override requested: Run $30 technical smoke to verify campaign delivery.
- Allowed conclusion: technical delivery only.
- Blocked conclusion: creative winner, product quality, retention, ROAS.
- Risk owner: UA + tech owner.
- Stop condition: stop immediately after delivery smoke or if event still missing.
```

Override không phải cách né rule. Nó là cách bảo vệ ngôn ngữ report: team được làm hành động nhỏ, nhưng không được rút ra kết luận lớn.

| Override reason | Allowed action | Blocked conclusion |
| --- | --- | --- |
| Technical smoke needed | spend tối thiểu để verify delivery/tracking | creative/product winner |
| Store hotfix urgent | sửa store proof và ghi break in comparability | direct before/after verdict nếu traffic mix đổi |
| Budget runway pressure | reduce cap/pause earlier than planned | claim thesis failed |
| Stakeholder asks for extra variant | run as separate exploratory cell | merge into clean test read |
| SDK/report bug | hold business call, fix instrumentation | ROAS/retention verdict |

### Post-call review memo

Sau khi rule chạy xong, review lại rule thay vì chỉ review metric. Đây là phần giúp team học được liệu decision system của mình có đang đúng không.

```text
Post-call review
- Rule triggered:
- Expected result:
- Actual result:
- Did action size fit confidence?
- Did frozen variables stay frozen?
- Rule update:
- What remains unproven:
- Next owner/date:
```

Ví dụ:

```text
Post-call review
- Rule triggered: Iterate creative because CTR was weak while store CVR and D1 direction were usable.
- Expected result: new openings improve CTR without damaging CVR.
- Actual result: CTR improved, CVR stayed stable, D1 still directional.
- Did action size fit confidence? yes, only two openings changed and cap stayed flat.
- Did frozen variables stay frozen? yes, same store/build/geo.
- Rule update: keep creative iteration rule; add review floor before comparing variants.
- What remains unproven: whether higher CTR holds after broader delivery.
- Next owner/date: UA owner reviews after both variants reach spend floor.
```

Post-call review tốt giúp bạn tránh "survivorship bias" trong learning log. Nếu scale nhỏ làm số xấu đi, có thể rule scale cần thêm caveat. Nếu hold vì tracking fail giúp tránh một quyết định sai, rule hold đã tạo giá trị dù không có campaign winner.

## Decision checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Tracking valid | Required events present and QA pass | Hold decision |
| Sample caveat | Confidence language included | Lower action size |
| Bucket diagnosis | Creative/store/product/economics/tracking separated | Re-read report |
| Repeated evidence | Kill/pause uses more than one noisy point | Rerun/validate |
| Action scoped | One primary action, not five | Choose primary call |
| Owner/date | Assigned | Add owner/date |
| Spend guardrail | Scale has cap and review window | Add cap/window |
| Learning log | Rule result captured | Save readout |

Quality chain:

```text
valid data -> metric pattern -> bucket diagnosis -> rule gate -> call -> owner/date -> learning log
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Ads App campaign tips](https://support.google.com/google-ads/answer/9176652?hl=en) | Google recommends enough daily budget relative to target CPI/CPA so App campaigns can learn. | Scale rules should respect budget/data readiness; underfed campaigns create unstable reads. | Do not copy Google's budget ratio as a universal indie benchmark; use it as a data-starvation warning. |
| [Google Ads App campaign best practices](https://support.google.com/google-ads/answer/14104492?hl=en) | Best practices include bid-budget ratio, constrained campaign checks and targeting one in-app action. | Scale/iterate rules should avoid too many simultaneous goals and should name the target action. | Do not optimize for many actions at once in a tiny soft-launch test. |
| [Meta ads budgets, costs and schedules](https://www.facebook.com/business/ads/pricing) | Meta frames budget as something the system uses over time to learn and allocate delivery. | A scale rule needs review window and budget discipline, not sudden big jumps from one read. | Do not assume a short positive spike is stable learning. |
| [Firebase Log events](https://firebase.google.com/docs/analytics/ios/events) | Events describe user actions, system events or errors in the app. | Tracking gate is not optional; decision rules need the events that prove first-session/product behavior. | Do not read missing events as user failure. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting matches sources/triggers and can produce event-level or aggregatable reports in a privacy-preserving system. | Attribution confidence should appear in scale/kill caveats, especially for small samples. | Do not treat privacy-preserving reporting as perfect user-level proof. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Platforms need enough data/budget to learn | Scale rules need sample and spend gates | Small budget cannot teach anything |
| In-app events define user behavior | Kill/iterate product calls need event QA | Missing events prove users failed |
| Attribution can be aggregated/privacy-preserving | Confidence caveats protect decisions | Aggregated reporting is useless |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Rule chỉ ghi "scale nếu tốt" | Ghi metric condition, action size, cap và review date |
| Kill hook do một signal yếu | Bucket diagnosis và repeated evidence trước |
| Scale khi tracking missing | Validate tracking first |
| Không có owner/date | Mỗi rule phải assign được |
| Dùng CPI/CTR đơn lẻ để scale | Scale cần ad + store + product + tracking alignment |
| Scale quá mạnh từ sample directional | Giảm action size theo confidence |
| Iterate quá nhiều thứ cùng lúc | Chỉ sửa một weak link chính để giữ learning sạch |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Scale` | Tăng spend/scope có kiểm soát |
| `Iterate` | Sửa một mắt xích cụ thể |
| `Kill criteria` | Điều kiện dừng/pause |
| `ROAS` | Return on ad spend |
| `Retention` | User quay lại sau install |
| `Guardrail` | Giới hạn giúp tránh quyết định quá mạnh |
| `Action size` | Mức độ lớn nhỏ của hành động |
| `Repeated evidence` | Bằng chứng lặp lại đủ sạch để gọi pause/kill |
| `Spend floor` | Mức spend tối thiểu trước khi đọc lại |

## Lab output example

```md
Scale/iterate/kill rules - W4 Test 1

Scale cautiously:
- Gates: tracking pass, sample directional+, store and D1 not weak.
- Condition: CTR and CVR in scenario-good range, D1 direction healthy.
- Action: increase daily cap by 20%, keep geo/store/build stable.
- Owner: UA owner.
- Review: after 72h or fixed spend cap.
- Caveat: no scale if tracking confidence drops.

Iterate creative:
- Condition: CTR low but CVR/D1 healthy.
- Diagnosis: product promise may be good, creative opening weak.
- Action: produce 2 new openings for same hook.
- Owner: creative owner.
- Review: next report window.

Hold:
- Condition: required tutorial_complete or revenue event missing.
- Action: pause decision, fix tracking.
- Owner: tech owner.
- Review: before paid spend resumes.

Pause/kill:
- Condition: hook has high CTR but weak CVR and weak D1 across two clean reads.
- Action: pause hook family, rewrite promise.
- Owner: UA + product.
- Review: after new build or new store proof.

Decision audit:
- Rule triggered:
- Evidence used:
- Evidence ignored:
- Acceptance gate:
- Action size:
- Variables frozen:
- Override used: yes/no
- Blocked conclusions:
- Review trigger:

Post-call review:
- Expected result:
- Actual result:
- Did action size fit confidence?
- Did frozen variables stay frozen?
- Rule update:
- What remains unproven:
```

## Practical Lab

1. Viết một tracking gate.
2. Viết một sample gate.
3. Viết một scale rule có action size và cap cụ thể.
4. Viết một iterate creative/store/product rule.
5. Viết một hold tracking/sample/window rule.
6. Viết một pause/kill rule có repeated clean evidence.
7. Gắn owner/date cho từng rule.
8. Ghi confidence caveat.
9. Copy decision board vào Final UA Plan.
10. Viết decision audit cho một case scale và một case hold.
11. Viết override memo cho trường hợp bắt buộc chạy technical smoke.
12. Điền Decision rule acceptance gate cho ít nhất 2 rule.
13. Viết Post-call review memo cho lần đọc tiếp theo.

Quality check: rule không có gate/owner/date/caveat thì chưa operational.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Scale rule:
- Gates required:
- Condition:
- Action size:
- Spend cap:
- Owner:
- Review date:
- Caveat:
- Blocked conclusions:
```

Cập nhật field **killCriteria**:

```md
Pause/kill rule:
- Condition:
- Required repeated evidence:
- Tracking caveat:
- Sample caveat:
- Owner:
- Next action after pause:
- Replacement hypothesis:
- Blocked conclusions:
```

Cập nhật field **budget / tracking / nextAction**:

```md
Decision board:
- Tracking gate:
- Sample gate:
- Scale cap:
- Hold rule:
- Report cadence:
- Learning log location:
- Decision audit fields:
- Override policy:
- Acceptance gate fields:
- Post-call review cadence:
```

Cập nhật field **learningLog**:

```md
Decision result:
- Rule triggered:
- Evidence:
- Action taken:
- What remains unproven:
- Review date:
- Variables frozen:
- Evidence ignored:
- Override used:
- Blocked conclusions:
- Post-call review:
- Rule update:
```

## Checklist Focus

- [ ] Rule có gate/condition/action/owner/date.
- [ ] Rule có Decision rule acceptance gate.
- [ ] Rule có blocked conclusions.
- [ ] Rule có variables frozen.
- [ ] Tracking valid trước scale.
- [ ] Không dùng CPI/CTR đơn lẻ.
- [ ] Rule phù hợp sample size.
- [ ] Pause/kill cần repeated clean evidence.
- [ ] Action size khớp confidence.
- [ ] Có post-call review memo sau khi action chạy.
- [ ] Scale-iterate-kill rules đã copy vào Final UA Plan.

## Curated References

- [Google Ads Help - Tips for maximizing your App campaign](https://support.google.com/google-ads/answer/9176652?hl=en)
- [Google Ads Help - Best practices for App campaigns](https://support.google.com/google-ads/answer/14104492?hl=en)
- [Meta for Business - Facebook and Instagram Ads: Budgets, Costs and Schedules](https://www.facebook.com/business/ads/pricing)
- [Firebase - Log events](https://firebase.google.com/docs/analytics/ios/events)
- [Privacy Sandbox - Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
