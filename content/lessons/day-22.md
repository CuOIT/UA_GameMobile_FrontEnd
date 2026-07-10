---
day: 22
title: "Campaign structure for a micro test"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, Ad set, ROAS]
artifact: "Campaign structure note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Campaign structure note** cho micro test đầu tiên: learning goal, channel/geo, budget cap, cell count, creative grouping, naming convention, required report columns, confidence language và review/stop rule.

Quyết định chính: **không tạo nhiều campaign/ad set/cell hơn mức budget có thể nuôi bằng signal có nghĩa**.

Với budget `$100-500`, structure tốt không phải structure trông "pro" nhất. Structure tốt là structure giúp bạn trả lời một câu hỏi sau test: hook/store/first session/tracking có đủ tốt để iterate tiếp không?

Artifact này cập nhật field **budget**, **creativeMatrix**, **tracking**, **successCriteria** và **nextAction** trong Final UA Plan.

## Why this matters

Campaign structure là cách bạn phân bổ quyền được học. Nếu chia quá nhiều ad set, quá nhiều creative cell, quá nhiều geo hoặc đổi quá nhiều biến cùng lúc, mỗi dòng report sẽ có quá ít spend/install để kết luận. Bạn vẫn có dashboard, nhưng dashboard đó chỉ cho cảm giác vận hành, không cho quyết định.

Micro soft-launch thường không nhằm scale ngay. Nó nhằm đọc:

- hook motivation nào đáng giữ
- store có chứng minh promise không
- first session có giữ lời không
- tracking có đủ để chẩn đoán không
- budget có đang bị chia vụn không

Nguyên tắc vận hành: **test nhỏ nhưng phải đọc được**. Ít cells hơn thường có vẻ kém tham vọng, nhưng với budget nhỏ, nó bảo vệ bạn khỏi kết luận từ noise.

## Core model: structure follows learning goal

Thiết kế structure từ câu hỏi ngược lên:

`learning goal -> decision unit -> variables -> budget per cell -> naming -> report columns -> review rule -> confidence language`

| Layer | Câu hỏi phải trả lời | Bad smell | Output cần có |
| --- | --- | --- | --- |
| Learning goal | Test này học điều gì duy nhất? | "Test xem game có ổn không" | 1 câu hỏi cụ thể |
| Decision unit | Một row/cell đại diện cho quyết định nào? | Row chỉ là tên ad mơ hồ | Hook/geo/variant rõ |
| Variables | Biến nào được phép đổi? | Đổi creative, geo, store và build cùng lúc | Biến chính + biến giữ nguyên |
| Budget per cell | Mỗi cell có đủ signal không? | Spend bị chia vụn | Budget/cell + CPI scenario |
| Naming | Có trace asset về report không? | Campaign name không chứa hook | Naming convention |
| Report columns | Metric có đọc chain không? | Chỉ có CPI/CTR | Spend, CTR, CVR, CPI, IPM, early events, D1 |
| Review rule | Khi nào đọc, khi nào chưa đọc? | Refresh dashboard mỗi giờ | Spend/date floor + caveat |

Rule: nếu một cell không trả lời được "cell này giúp mình quyết định gì?", cell đó nên bị gộp, bỏ hoặc chuyển sang test sau.

## Campaign structure note mẫu

| Field | Example cho mobile puzzle micro test | Decision job |
| --- | --- | --- |
| Learning goal | Đọc 3 hook motivations trước khi sửa product | Giữ test tập trung vào creative promise |
| Channel | Android-first paid social/ad network test | Không trộn platform logic |
| Geo | 1 affordable CPI region cluster | Không fragment signal theo geo |
| Budget cap | `$240` total, daily cap nhỏ | Chặn runaway spend |
| Cells | 3 hook families x 2 variants = 6 cells | Đủ nhỏ để đọc directional signal |
| Control variables | Store page stable; build stable | Tránh creative/store/product bị trộn |
| Naming | `W4_T1_GEO_hook_variant_YYYYMMDD` | Trace asset -> metric |
| Required events | `first_open`, `tutorial_complete`, `level_complete` | Đọc first-session proof |
| Review rule | Review after spend floor or day 4 | Giảm overreaction |
| Confidence language | directional, weak, not enough signal | Không nói quá data |

## Campaign cell map

```text
![Campaign cell map](content/assets/usecases/day-22-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Campaign cell map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Tree level | Example | What it controls | What it must not hide |
| --- | --- | --- | --- |
| Campaign | `W4_T1_Android_HookRead` | One learning goal and total cap | Multiple goals mixed together |
| Geo/ad set | `GEO_AffordableCluster` | Delivery region and budget/schedule | Too many geo splits |
| Hook family | `challenge`, `satisfaction`, `relax` | Motivation/promise being tested | Unlabeled creative ideas |
| Variant | `v1_openingA`, `v2_openingB` | Execution variant | Store/build changes |
| Report row | One hook variant row | Spend, `CTR`, `CVR`, `IPM`, events | Winner claim without caveat |
| Decision note | keep, iterate, hold, rerun | Next action | Metric-only commentary |

**Inspect:** mỗi branch có một budget, một biến chính và một learning question.

**Conclude:** ít branch hơn giúp mỗi branch có cơ hội nhận signal và trace về decision.

**Do not infer:** mọi campaign lớn đều nên đơn giản như micro test; bài này dành cho first learning test với budget nhỏ.

## Budget per cell compression

```text
![Budget per cell compression board](content/assets/usecases/day-22-data-visual.svg)Type: budget compression chart / cell-count decision board.
Lesson section: Budget per cell compression.
Visual brief: show how a fixed micro-budget gets thinner as cells increase, and mark which cell counts allow directional learning versus noise.
Teaching job: help the learner decide whether to run 3, 6, 9, or 12 cells before spending money.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Total budget | CPI scenario | Cells | Budget/cell | Approx installs/cell | Decision allowed |
| ---: | ---: | ---: | ---: | ---: | --- |
| `$240` | `$0.80` | 3 | `$80` | ~100 | Stronger directional hook read |
| `$240` | `$0.80` | 6 | `$40` | ~50 | Directional creative/store read |
| `$240` | `$0.80` | 9 | `$27` | ~34 | Weak read, careful caveat |
| `$240` | `$0.80` | 12 | `$20` | ~25 | Too thin for winner claim |
| `$240` | `$1.50` | 6 | `$40` | ~27 | Too thin for retention conclusion |

**Inspect:** giữ total budget cố định, cell count càng cao thì budget/install per cell càng mỏng.

**Conclude:** nếu CPI thực tế cao hơn scenario, giảm cell count trước khi kết luận hook.

**Do not infer:** bảng này không đưa benchmark CPI phổ quát; nó minh họa logic phân bổ signal.

### Budget guardrail read

Trước launch, viết một guardrail để team biết khi nào phải nén structure:

| Trigger | Ý nghĩa | Quyết định đúng |
| --- | --- | --- |
| CPI thực tế cao hơn scenario 50%+ trong ngày đầu | Installs/cell sẽ mỏng hơn plan | Giảm cells hoặc kéo dài read window, không thêm variants |
| 2+ cells gần như không có spend | Delivery bias đang che mất comparison | Rerun ít cells hơn hoặc isolate hook quan trọng |
| Store/build đổi giữa test | Signal không còn cùng điều kiện | Đánh dấu dirty read, không chọn winner |
| D1 quá mỏng dưới mỗi cell | Retention chưa đọc được | Chỉ claim acquisition/store direction |
| Tracking event fail | Product proof không hợp lệ | Hold interpretation, fix tracking trước |

Decision note nên ghi trước launch:

```md
Budget guardrail:
- Planned CPI scenario:
- Max cells:
- Compress trigger:
- Dirty-read trigger:
- Allowed claim if D1 is thin:
```

Với micro-budget, discipline tốt nhất không phải là đọc nhiều chart hơn. Discipline tốt nhất là biết lúc nào chart chưa được phép ra verdict.

### Structure acceptance contract

Trước khi launch, Campaign structure note phải được sign-off như một contract. Mục tiêu không phải là làm giấy tờ đẹp; mục tiêu là ngăn team đổi biến, thêm cell hoặc đọc quá quyền khi data còn mỏng.

| Contract field | Câu hỏi phải khóa trước launch | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Learning question | Test này chỉ học điều gì? | Một câu hỏi duy nhất | Tách test hoặc viết lại goal |
| Max cells | Budget nuôi tối đa bao nhiêu cells? | Có cell count và budget/cell | Giảm variants trước launch |
| Frozen variables | Biến nào không được đổi? | Store/build/geo/tracking được ghi rõ | Report sau test sẽ bị dirty |
| Compress trigger | Khi nào phải nén structure? | CPI/delivery/install trigger cụ thể | Team dễ thêm spend vào noise |
| Dirty-read trigger | Khi nào report mất quyền kết luận? | Tracking, naming, store/build change được nêu | Không winner claim |
| Allowed claims | Nếu D1 mỏng, vẫn được claim gì? | Acquisition/store direction hoặc setup issue | Không nói "retention tốt/xấu" |
| Blocked claims | Report này bị cấm kết luận gì? | Scale/kill/product verdict được khóa nếu thiếu data | Dễ overclaim |
| Owner/date | Ai đọc và khi nào? | Có owner, date, review floor | Không có accountability |

```md
Structure acceptance contract:
- Learning question:
- Max cells:
- Frozen variables:
- Compress trigger:
- Dirty-read trigger:
- Allowed claims if D1 is thin:
- Blocked claims:
- Owner/date:
```

Acceptance rule: nếu chưa viết được `allowed claims` và `blocked claims`, campaign chưa sẵn sàng launch. Khi data về, team sẽ đọc theo cảm xúc thay vì đọc theo quyền kết luận đã thống nhất.

## Hướng dẫn đọc số

| Pattern trong report | Diagnosis | Next action |
| --- | --- | --- |
| Cell nào cũng ít installs | Structure fragment quá mức hoặc CPI cao hơn scenario | Giảm cells, không kết luận hook |
| Một hook nhận spend nhiều, hook khác gần như không | Delivery bias | Ghi caveat; rerun cleaner nếu cần |
| `CTR` cao, `CVR` thấp ở một hook | Ad promise kéo click nhưng store proof yếu | Sửa screenshot/copy trước khi thêm variant |
| `CTR` và `CVR` ổn, early event yếu | First-session proof không giữ lời | Kiểm tutorial/level 1-3 |
| D1 quá ít user | Retention signal chưa đủ | Không scale/kill dựa trên D1 mỏng |
| Store/build đổi giữa test | Biến bị trộn | Đánh dấu report dirty, không winner claim |
| Event thiếu hoặc naming sai | Measurement/readout không trace được | Fix tracking/naming trước test sau |

Confidence language:

| Evidence strength | Nên nói | Tránh nói |
| --- | --- | --- |
| Spend/install mỏng | "Weak directional signal" | "Winner" |
| `CTR`/`CVR` rõ nhưng D1 mỏng | "Acquisition/store signal only" | "Game retention tốt" |
| Delivery không đều | "Platform delivery favored X" | "X chắc chắn thắng" |
| Event thiếu | "Measurement incomplete" | "Product yếu" |

Structure triage gate:

| Gate | Use when | Structure action | Report language |
| --- | --- | --- | --- |
| Keep reading | Most cells have enough spend/install to compare directionally | Keep structure unchanged until review floor | "Directional read in progress" |
| Compress | Installs/cell are too thin across the board | Reduce variants, merge hook variants, keep only strongest learning question | "Signal too fragmented; no winner claim" |
| Rebalance/rerun | Platform delivery starves important cells | Rerun fewer cells or separate the starved hook into a cleaner test | "Delivery-biased read; not a clean loss" |
| Hold | Tracking, naming, store page, or build changed mid-test | Stop interpretation; fix setup before more spend | "Dirty read; measurement/setup invalidates conclusion" |
| Promote to next test | One hook has usable acquisition/store signal and no setup caveat | Build next test around that promise, not around every old variant | "Candidate promise for iteration, not scale proof" |

Decision rule: first decide whether the report is **readable**, then decide whether any hook is promising. A thin or dirty report should change the next structure, not force a fake creative verdict.

Structure decision ledger:

| Report state | Classification | What it means | Next structure decision |
| --- | --- | --- | --- |
| Enough spend across most cells, no setup change | Readable directional test | You can compare hook/store direction with caveats | Keep structure for the planned readout |
| Installs/cell too thin across all cells | Thin read | Budget was fragmented or CPI scenario was too optimistic | Compress cell count before more spend |
| One or two cells starved by delivery | Delivery-biased read | Platform allocation created an unfair comparison | Rerun fewer cells or isolate the starved hook |
| Store/build/tracking changed mid-test | Dirty read | You cannot attribute movement to creative/campaign structure | Hold interpretation and fix setup |
| One hook has usable `CTR`/`CVR` but weak D1 | Acquisition/store signal only | Promise may be worth iterating, but retention is not proven | Promote to next test with first-session proof focus |
| Events missing or names drifted | Measurement-invalid read | Report cannot connect spend to product proof | Fix tracking before campaign changes |

Decision memo format:

```md
Report readability:
- State:
- Classification:
- Evidence:
- What we can claim:
- What we cannot claim:
- Structure change before next spend:
```

Rule: a bad report is still useful if it tells you how to structure the next test. The failure is not "numbers are weak"; the failure is pretending weak numbers are a winner/loser verdict.

### Campaign structure sign-off memo

Sau khi đọc report, viết memo này để chuyển từ "setup đã chạy" sang "next structure phải đổi gì". Memo tốt thường ngắn, nhưng phải ghi rõ quyền kết luận.

```md
Campaign structure sign-off
- Accepted structure:
- Frozen variables:
- Compress triggers:
- Dirty-read triggers:
- Allowed conclusions:
- Blocked conclusions:
- Structure change before next spend:
- Owner/date:
```

Example:

```md
Campaign structure sign-off
- Accepted structure: 3 hook families x 2 variants, one geo cluster, stable store/build.
- Frozen variables: store screenshots, tutorial build, required events.
- Compress triggers: CPI rises above scenario by 50%+ or installs/cell stay too thin after spend floor.
- Dirty-read triggers: tracking event fail, store/build change, naming cannot trace asset.
- Allowed conclusions: directional hook/store read; acquisition/store signal only if D1 is thin.
- Blocked conclusions: scale-ready hook, product retention verdict, Hook B lost if delivery-starved.
- Structure change before next spend: compress to 3 hook cells if delivery remains skewed.
- Owner/date: UA owner reviews day 4 or after spend floor.
```

Memo này biến structure thành một operating agreement. Khi platform delivery lệch hoặc CPI khác scenario, team không cần tranh luận lại từ đầu; trigger đã nói phải compress, rerun hoặc hold.

## Worked example: 6 cells hay 3 cells?

Team có `$240`, expected CPI khoảng `$0.80`, muốn test hook motivation cho puzzle prototype.

| Plan | Structure | Approx installs/cell | What can be learned | Risk |
| --- | --- | ---: | --- | --- |
| 3 hooks only | 3 cells | ~100 | Motivation direction | Ít biết execution variant |
| 3 hooks x 2 variants | 6 cells | ~50 | Motivation + rough execution | D1 caveat lớn |
| 3 hooks x 4 variants | 12 cells | ~25 | Mostly noise | Delivery bias, thin sample |

Verdict: chọn **6 cells** nếu 6 assets đã sẵn, store/build giữ nguyên và team chấp nhận D1 chỉ là directional. Nếu CPI thực tế tăng lên khoảng `$1.50`, giảm còn **3 hook cells** thay vì giữ 6 cells và giả vờ sample đủ.

Diagnosis sau 2 ngày:

| Signal | Read | Action |
| --- | --- | --- |
| Hook A spend cao, `CTR` tốt, `CVR` thấp | Store proof cho promise A yếu | Sửa screenshot đầu tiên cho hook A |
| Hook B ít spend, `CTR` chưa đọc được | Delivery bias | Không kill B; rerun nếu motivation quan trọng |
| Hook C `CTR` thấp nhưng users hoàn thành tutorial tốt | Creative opening yếu, product promise có thể ổn | Rewrite first 2 seconds |

Tradeoff: 3 cells học ít dimension hơn nhưng đọc sạch hơn. 12 cells nhìn tham vọng hơn nhưng dễ khiến team kết luận sai từ noise.

Second-pass structure read:

| Question | Answer | Decision impact |
| --- | --- | --- |
| Report có readable không? | 6-cell plan readable only if CPI stays near scenario and delivery is not too skewed | Keep a spend/review floor before verdict |
| Hook nào bị delivery-biased? | Hook B ít spend, chưa đủ đọc | Do not kill Hook B; rerun cleaner if strategically important |
| Hook nào có store mismatch? | Hook A `CTR` tốt nhưng `CVR` thấp | Fix store proof for A, do not create 4 more A videos |
| Hook nào có product-proof caveat? | Hook C has weak `CTR` but tutorial completion good | Improve opening creative; keep product proof stable |
| Nếu CPI rises to `$1.50`, structure đổi thế nào? | Installs/cell collapse | Compress to 3 hook cells before continuing |

Decision memo:

```md
Report readability:
- State: partially readable, with delivery caveat.
- Can claim: Hook A attracts attention but store proof is weak; Hook C may have product fit but opening is weak.
- Cannot claim: Hook B lost; D1 proves retention; any hook is scale-ready.
- Next structure: compress to 3 hook cells if CPI rises or delivery remains skewed.
- Stable variables: store/build unchanged except the named screenshot repair for Hook A.
```

Điểm sâu: campaign structure không kết thúc ở setup. Nó tiếp tục trong cách bạn đọc report và thiết kế test kế tiếp. Nếu report không đọc được, next action đúng thường là sửa structure, không phải sửa game.

## Campaign setup checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Learning goal | 1 câu rõ: hook, store, first session hay economics | Rewrite goal trước setup |
| Cell count | Budget/cell đủ cho directional read | Giảm variants/cells |
| Variables | Chỉ đổi biến chính | Tách test hoặc giữ biến ổn định |
| Naming convention | Week, test id, geo, hook, variant, date | Sửa trước launch |
| Creative mapping | Mỗi asset map về hook/motivation | Không upload asset mơ hồ |
| Tracking | Install và early events đã QA | Không chạy paid traffic |
| Budget control | Total cap, daily cap, review floor | Đặt cap trước launch |
| Report owner | Ai đọc report, ngày nào, format nào | Assign owner |

Quality chain: `learning goal -> cell count -> budget allocation -> naming -> report -> confidence -> decision`.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Ads App campaigns setup best practices](https://support.google.com/google-ads/answer/6167162) | Google Ads guidance emphasizes enough budget/data for campaign learning, including budget guidance tied to target CPI/CPA. | Micro-budget teams should not fragment campaign cells beyond what budget can feed. | Do not copy Google budget multipliers blindly into a $100-500 indie test; use them as a warning about data hunger. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting is designed for privacy-preserving measurement without cross-party identifiers. | Campaign structure should include source/window/reporting caveats instead of pretending every dashboard is exact truth. | Do not overclaim precision from one platform report. |
| [Meta budgets, costs and schedules](https://www.facebook.com/business/ads/pricing) | Meta frames budget/schedule as inputs that affect ad delivery and learning over time. | Structure needs budget/schedule rules before launch, not emotional refreshes every hour. | Do not assume Meta/Google/TikTok delivery logic is identical. |

Report naming readout:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Campaign/ad set name | Week, test id, geo, hook, variant visible | Report can trace asset to decision | Good naming fixes weak sample |
| Spend distribution | Did cells receive comparable signal? | Delivery bias must be named | Highest-spend row is automatically best |
| Required events | first open/tutorial/level events present | Product proof can be read | Event presence proves retention quality |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Chia quá nhiều ad sets vì muốn "test nhiều". | Structure theo one learning goal và budget/cell. |
| Vừa đổi geo, creative, store và build cùng lúc. | Chỉ đổi biến chính; ghi rõ biến giữ nguyên. |
| Không đặt naming convention. | Name phải chứa week/test/geo/hook/variant/date. |
| Dùng D1 mỏng để scale/kill. | Ghi confidence caveat, dùng D1 như directional. |
| Thấy platform spend lệch rồi gọi creative thắng. | Đánh dấu delivery bias; không winner claim. |
| Chạy traffic khi event chưa QA. | Fix tracking trước campaign. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Campaign` | Container chính của paid test |
| `Ad set` | Nhóm targeting/budget/placement tùy platform |
| `Cell` | Đơn vị test có thể đọc và ra quyết định |
| `Naming convention` | Quy tắc đặt tên để trace asset/report |
| `Delivery bias` | Platform phân phối spend không đều giữa variants |
| `Spend floor` | Mức spend tối thiểu trước khi đọc report |
| `Confidence language` | Cách diễn đạt độ chắc của kết luận |
| `ROAS` | Return on ad spend, cần caveat trong micro test |

## Lab output example

```md
Campaign structure note - W4 Test 1

Learning goal:
- Read 3 hook motivations for Android puzzle prototype without fragmenting signal.

Structure:
- Channel: Android-first paid social/ad network.
- Geo: one affordable CPI region cluster.
- Budget: $240 total, $40 directional cap per cell.
- Cells: 3 hook families x 2 variants.
- Control variables: store page stable; build stable; no mid-test tutorial change.

Naming:
- W4_T1_[geo]_[hook]_[variant]_[date]

Required report columns:
- Spend, impressions, CTR, CVR, CPI, IPM, tutorial_complete, level_complete, D1 direction, caveat, decision.

Review rule:
- Review after spend floor or day 4, whichever comes first.
- If CPI is much higher than scenario and installs/cell is thin, reduce to 3 cells.

Confidence language:
- Winner claim: not allowed in this test.
- Allowed conclusion: directional hook/store signal.

Structure acceptance contract:
- Learning question:
- Max cells:
- Frozen variables:
- Compress trigger:
- Dirty-read trigger:
- Allowed claims if D1 is thin:
- Blocked claims:
- Owner/date:

Campaign structure sign-off:
- Accepted structure:
- Frozen variables:
- Allowed conclusions:
- Blocked conclusions:
- Structure change before next spend:
```

## Practical Lab

1. Viết một learning goal duy nhất cho campaign đầu tiên.
2. Chọn channel/geo đơn giản và ghi biến sẽ giữ nguyên.
3. Tính budget per cell cho 3, 6, 9 và 12 cells.
4. Chọn cell count phù hợp với budget/cell và CPI scenario.
5. Viết naming convention có hook/variant/date.
6. Viết required report columns, gồm acquisition, store và early product event.
7. Viết review rule và confidence language trước khi launch.
8. Điền Structure acceptance contract.
9. Viết blocked claims: report này không được kết luận điều gì.
10. Viết Campaign structure sign-off memo cho next structure decision.

Quality check: nếu một row report không map được về hook/promise/asset/decision, structure chưa ready.

## Final UA Plan Update

Cập nhật field **budget**:

```md
Campaign budget:
- Total budget:
- Daily cap:
- Budget per cell:
- CPI scenario range:
- Cell count decision:
- Spend/review floor:
- Compress trigger:
```

Cập nhật field **creativeMatrix**:

```md
Campaign cells:
- Hook family:
- Variant:
- Asset name:
- Promise being tested:
- Store proof:
- Frozen variables:
```

Cập nhật field **tracking / successCriteria / nextAction**:

```md
Campaign readout:
- Required report columns:
- Required early events:
- Review date:
- Allowed confidence language:
- Stop/iterate rule:
- Next action if signal is too thin:
- Dirty-read trigger:
- Allowed claims:
- Blocked claims:
- Structure change before next spend:
```

## Checklist Focus

- [ ] Structure bám one learning goal.
- [ ] Cell count phù hợp budget/cell.
- [ ] Biến chính và biến giữ nguyên được ghi rõ.
- [ ] Có Structure acceptance contract trước launch.
- [ ] Có compress trigger.
- [ ] Có dirty-read trigger.
- [ ] Có allowed claims và blocked claims.
- [ ] Naming map được creative -> report.
- [ ] Có review date, spend floor và stop rule.
- [ ] Tracking event tối thiểu đã QA trước traffic.
- [ ] Confidence language không nói quá sample.

## Curated References

- [Google Ads Help: Setting up your App campaigns](https://support.google.com/google-ads/answer/6167162)
- [Privacy Sandbox: Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Meta: Facebook and Instagram Ads budgets, costs and schedules](https://www.facebook.com/business/ads/pricing)
