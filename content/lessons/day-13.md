---
day: 13
title: "Attribution, ATT, SKAN and Android privacy signals"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Attribution, ATT, SKAN]
artifact: "Measurement risk note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Measurement risk note** cho Final UA Plan: một ghi chú vận hành nói rõ metric nào đáng tin ở mức nào, metric nào bị trễ/gom nhóm/modeled, và quyết định nào được phép hoặc không được phép đưa ra từ từng loại tín hiệu.

Quyết định cần học: khi attribution không hoàn hảo, bạn vẫn chạy micro soft-launch có kỷ luật bằng cách gắn **confidence level** cho từng metric trước khi scale, iterate hoặc kill.

Output cần có:

- Signal confidence ladder cho campaign đầu.
- Dashboard reconciliation rule khi ad network, store và analytics không khớp.
- Danh sách decision không được ra từ low-confidence data.
- Cập nhật trường **tracking** trong Final UA Plan, có liên hệ tới **successCriteria** và **killCriteria**.

---

## Why this matters

Mobile UA hiện đại không còn là đường thẳng sạch: `click -> install -> user id -> revenue`. iOS có `ATT`, SKAN-era reporting và AdAttributionKit. Android cũng đi theo hướng privacy-preserving attribution qua Privacy Sandbox. Dữ liệu vì vậy thường bị trễ, bị gom nhóm, modeled, thiếu user-level path, hoặc lệch nhau giữa ad network, store console và analytics trong game.

Với ngân sách `$100-500`, vấn đề lớn nhất không phải thiếu dữ liệu. Vấn đề lớn nhất là **đối xử với dữ liệu không hoàn hảo như dữ liệu hoàn hảo**.

Ví dụ:

- Network báo CPI rẻ, nhưng analytics báo tutorial complete thấp.
- Store CVR tăng, nhưng first_open thấp hơn install reported.
- ROAS D0 xấu, nhưng ad revenue có delay và cohort quá nhỏ.
- SKAN/aggregated signal không đủ granular, nhưng team vẫn muốn tách quá nhiều ad set.

Bài này giúp bạn viết rule trước: metric nào chỉ dùng để quan sát, metric nào đủ để iterate, metric nào đủ để pause, và metric nào tuyệt đối chưa đủ để scale hoặc kill product.

---

## Core model: signal confidence ladder

Đừng chia data thành "đúng" và "sai". Hãy chia theo độ tin cậy vận hành.

| Level | Signal type | Ví dụ | Dùng tốt cho | Không dùng cho |
| --- | --- | --- | --- | --- |
| High | Direct gameplay event đã QA | `tutorial_complete`, `level_3_complete`, `rewarded_completed` | Product/onboarding diagnosis | Attribution source-level nếu source chưa sạch |
| Medium | Platform/store/network metric | spend, clicks, installs, Store CVR, CPI | Creative/store/channel direction | Scale lớn nếu không có retention/economy |
| Medium-Low | Aggregated/modeled attribution | SKAN/AdAttributionKit-style reporting, modeled conversions | Directional pattern, cohort-level read | User-level conclusion |
| Low | Early revenue hoặc tiny cohort | D0 ROAS, ARPDAU từ 100 installs | Guardrail, not final verdict | Kill/scale decision lớn |
| Unknown | Missing/mismatched signal | install != first_open, event not QA'd | QA task | Any business decision |

Quy tắc: metric càng xa event gameplay trực tiếp và càng bị privacy/window/modeling ảnh hưởng, quyết định càng phải nhỏ hơn.

---

## Measurement risk map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Measurement risk map mẫu]
Type: hero operating diagram.
Lesson section: Measurement risk map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Decision | Primary signal | Risk | Confidence | Allowed decision | Not allowed |
| --- | --- | --- | --- | --- | --- |
| Creative có đáng iterate? | CTR, IPM | network window, click noise | Medium | làm thêm variant nhỏ | scale mạnh |
| Store promise có khớp? | Store CVR, click-to-install | traffic mix, store attribution window | Medium | sửa screenshot/title | kết luận product fit |
| First session có giao promise? | tutorial/level events | event QA risk | High nếu QA pass | sửa onboarding/level 1-3 | đổ lỗi cho channel ngay |
| Retention có đủ học tiếp? | D1/D3 cohort | sample nhỏ, build mix | Medium | hold/iterate | kill product từ 1 cohort |
| Economy có thể hoàn vốn? | ARPDAU, ROAS window | revenue delay, modeled data | Low-Medium | đặt guardrail | scale/kill trước D7 rule |
| Dashboard không khớp | install vs first_open | definition/window/SDK/consent | Unknown | reconcile trước | tranh luận số nào "đúng tuyệt đối" |

Bạn không cần một câu trả lời hoàn hảo. Bạn cần giới hạn đúng phạm vi của từng câu trả lời.

### Confidence-to-decision contract

Mỗi metric trong risk note cần một contract: confidence hiện tại cho phép quyết định gì, cấm quyết định gì, và cần bằng chứng nào để nâng cấp quyền quyết định.

| Confidence hiện tại | Decision được phép | Decision bị cấm | Cách nâng confidence |
| --- | --- | --- | --- |
| High gameplay event QA'd | Sửa onboarding, level pacing, reward placement, first-session proof | Quy attribution/source quality nếu source mapping chưa sạch | Giữ event name stable, lưu QA evidence, segment theo build/source |
| Medium platform/store metric | Iterate creative/store, pause cell yếu, giữ control | Scale lớn, kill product, kết luận retention | Đối chiếu với guardrail gameplay và cohort sạch |
| Medium-Low aggregated/modeled | Đọc directional trend, gom cell, giảm phân mảnh campaign | User-level diagnosis, winner/loser quá granular | Chờ reporting window, gom đủ volume, đọc ở cấp thesis |
| Low early revenue/tiny cohort | Watchlist, đặt guardrail, quyết định chờ thêm data | Kill economy, scale vì ROAS sớm, đổi monetization lớn | Chờ D3/D7, kiểm mediation/revenue delay, đủ cohort |
| Unknown/mismatch | QA measurement, hold business decision | Scale, fraud claim, product verdict | Reconcile definition/window/event/source naming |

Rule vận hành: **decision size không được lớn hơn confidence level**. Nếu signal chỉ medium, quyết định nên là iterate/hold nhỏ. Nếu signal unknown, quyết định duy nhất là QA/reconcile.

---

## Hero visual: attribution confidence ladder

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: attribution confidence ladder]
Type: data visual/chart or decision board.
Lesson section: Hero visual: attribution confidence ladder.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[ATTRIBUTION CONFIDENCE LADDER]

```text
HIGH CONFIDENCE
Direct gameplay event da QA
Examples: tutorial_complete, level_3_complete, rewarded_completed
Allowed: fix onboarding, level pacing, reward placement
Not allowed alone: attribute user quality to one ad source if source mapping is messy
        ^
        |
MEDIUM CONFIDENCE
Platform/store/network metric with known window
Examples: spend, CTR, IPM, Store CVR, CPI
Allowed: iterate creative/store, pause a weak ad cell, compare variants
Not allowed alone: scale hard or kill product without retention proof
        ^
        |
MEDIUM-LOW CONFIDENCE
Aggregated or modeled attribution
Examples: SKAN-style cohorts, modeled conversions, privacy-limited source reports
Allowed: read directional pattern, simplify campaign structure
Not allowed alone: user-level diagnosis or tiny ad-set split decisions
        ^
        |
LOW CONFIDENCE
Early revenue or tiny cohort
Examples: D0 ROAS, ARPDAU from small sample, early payer signal
Allowed: guardrail, watchlist, "collect more data" decision
Not allowed alone: scale/kill/economy verdict
        ^
        |
UNKNOWN
Missing or mismatched signal
Examples: installs != first_open, event not QA'd, build/source naming broken
Allowed: QA task, reconciliation memo
Not allowed: any business verdict before source/window/event is fixed
```

| Confidence level | Decision size allowed | Typical next action | Report language to use |
| --- | --- | --- | --- |
| High | Product/onboarding fix, small spend hold, retest same thesis | Fix first-session proof or evented gameplay moment | "High confidence to fix onboarding because gameplay event is QA'd." |
| Medium | Creative/store iteration, channel comparison, small pause | Change hook, screenshot order, campaign cell | "Medium confidence to iterate creative, not enough to scale." |
| Medium-Low | Directional read only | Merge cells, wait for cohort, simplify structure | "Directional signal; do not split more ad sets." |
| Low | Guardrail/watchlist | Wait for D3/D7, inspect placement, avoid hard verdict | "Low confidence revenue signal; hold decision." |
| Unknown | No business decision | QA SDK/event/window/source naming | "Unknown until reconciled." |


**Inspect:** bậc cao nhất là event gameplay đã QA, bậc thấp nhất là signal thiếu hoặc mismatch.
**Conclude:** cùng một metric có thể hữu ích nhưng không đủ quyền ra quyết định lớn.
**Do not infer:** ladder không nói ad network/store/analytics "sai"; nó chỉ nói nguồn nào phù hợp với quyết định nào.

---

## Dashboard reconciliation board

| Source | Metric/window | Definition question | Delay/privacy risk | Decision allowed |
| --- | --- | --- | --- | --- |
| Ad network | spend, impressions, clicks, installs, modeled conversion | conversion window là gì? install hay first open? | attribution/modeling/network logic | creative/channel direction |
| Store console | store visitors, installs, conversion | traffic source có tách được không? | store window, organic/paid mix | store proof readiness |
| Game analytics | first_open, tutorial, level, retention | event có fire đúng build/version không? | SDK consent, event bug | product/onboarding diagnosis |
| Revenue/ad tool | ad revenue, IAP, ARPDAU, ROAS | revenue delay bao lâu? cohort đủ lớn chưa? | delayed revenue, mediation reporting | economics guardrail |
| Spreadsheet readout | combined view | source nào là owner cho metric nào? | manual error | decision memo, not raw truth |

**Inspect:** mỗi source có một job, một window và một decision scope.
**Conclude:** dashboard mismatch là điều bình thường; workflow đúng là reconcile definition/window/event trước.
**Do not infer:** không chọn một dashboard làm source of truth tuyệt đối cho mọi quyết định.

### Reconciliation decision ledger

Khi dashboard lệch nhau, team rất dễ biến buổi đọc số thành tranh luận "dashboard nào đúng". Cách vận hành tốt hơn là ghi một ledger nhỏ: mỗi mismatch phải dẫn tới **một câu hỏi định nghĩa**, **một owner kiểm tra**, và **một decision được phép hoặc bị khóa**.

| Mismatch | Câu hỏi đầu tiên | Owner kiểm tra | Decision được phép | Decision bị khóa |
| --- | --- | --- | --- | --- |
| Network installs cao hơn `first_open` | network đang đếm install, app open hay modeled conversion? | UA/operator + analytics owner | kiểm naming/window, giữ campaign ở mức học | scale vì CPI nhìn rẻ |
| Store installs cao nhưng analytics thấp | build nào đang nhận traffic? SDK có fire ở first launch không? | game engineer | QA build/version/source path | kết luận store page thắng |
| `tutorial_complete` giảm sau build mới | event đổi tên hay tutorial thật sự khó hơn? | gameplay + analytics | so sánh event payload và level flow | đổ lỗi audience |
| ROAS tool trễ hơn analytics | revenue source có delay/mediation lag không? | monetization owner | ghi watchlist và chờ window | kill campaign D0 |
| SKAN/aggregated report thiếu granularity | campaign cell có quá nhỏ để privacy system trả tín hiệu không? | UA/operator | gom cell, đọc ở cấp thesis | tách thêm ad set |

Ledger này không thay thế phân tích sâu. Nó ngăn team ra quyết định lớn trước khi biết mình đang so cùng một định nghĩa hay chưa.

Decision note nên dùng câu ngắn:

```text
Mismatch: network installs > analytics first_open by 29%.
Likely causes to inspect: install/open definition, SDK first_open event, build version, consent path.
Allowed now: QA measurement and hold scale.
Not allowed now: call traffic fraudulent or scale because CPI is cheap.
Next checkpoint: re-read after event QA + 24h reporting delay.
```

---

## Hướng dẫn đọc số

| Pattern | Cách đọc đúng | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| Network install cao hơn analytics first_open >20% | Có thể do install/open definition, SDK, consent, version hoặc store path | kiểm first_open event, build version, source naming | kết luận traffic fraud ngay |
| CTR cao, Store CVR thấp | Attention có, store proof hoặc promise continuity yếu | sửa screenshot/title/preview video | scale vì CTR đẹp |
| Store CVR cao, tutorial complete thấp | Người chơi tin store nhưng game không giao proof sớm | sửa onboarding/level 1-3 | đổi channel hoặc đổ lỗi cho audience |
| D1 thấp, event chưa QA | Không biết product yếu hay event sai | QA event trước khi ra verdict | kill product |
| D0 ROAS thấp, D1 ổn | revenue còn trễ hoặc placement chưa đủ | chờ D3/D7 rule, đọc ARPDAU directional | tắt campaign vì D0 xấu |
| Aggregated report quá ít granularity | test cell bị phân mảnh hoặc privacy signal không đủ | gom cell, đọc decision lớn hơn | tách thêm ad sets |

Ngôn ngữ nên dùng trong report: "High confidence to fix onboarding", "Medium confidence to iterate creative", "Low confidence to make scale decision".

---

## Worked example: two dashboards disagree

Team chạy `$250` cho một calming puzzle prototype. Sau 3 ngày:

| Metric | Ad network | Store/analytics | Confidence | Read |
| --- | ---: | ---: | --- | --- |
| Installs | 238 | 184 first_open | Unknown until reconciled | mismatch cần QA |
| CPI | $1.05 | n/a | Medium | acquisition cost có vẻ cao nhưng chưa fatal |
| Store CVR | n/a | 33% | Medium | store proof khá ổn |
| tutorial_complete | n/a | 49% | High nếu event QA pass | first-session leak lớn |
| D1 | modeled estimate | 16% early cohort | Medium-Low | không scale |
| D0 ROAS | 2% | 1.5% | Low | chỉ là guardrail sớm |

Diagnosis:

- Không scale vì tutorial/D1 yếu.
- Không kết luận creative fail hoàn toàn vì store CVR ổn.
- Không kill product vì install vs first_open mismatch chưa reconcile.
- Action đúng: pause scale, QA first_open/tutorial events, sửa tutorial proof, retest same promise với one-clean-cell.

Tradeoff: chờ dữ liệu hoàn hảo sẽ chậm, nhưng quyết định lớn từ dữ liệu low-confidence sẽ đốt tiền. Vì vậy decision size phải khớp confidence.

### Second-pass confidence read

Đọc lần một trả lời "số đang nói gì". Đọc lần hai phải trả lời "số này có đủ quyền cho quyết định nào". Với case trên, report tốt không viết "campaign failed" hoặc "traffic bad". Report tốt viết rõ quyền quyết định theo từng tín hiệu.

| Decision | Highest-confidence signal | Confidence | Verdict | Next action |
| --- | --- | --- | --- | --- |
| Có nên scale campaign? | D1 16%, tutorial 49%, install mismatch | Low-Medium | Không scale | giữ spend nhỏ hoặc pause scale |
| Có nên bỏ creative thesis? | Store CVR 33%, CPI $1.05 | Medium | Chưa bỏ | giữ promise, đổi proof/variant nhỏ |
| Có nên sửa first session? | `tutorial_complete` 49% nếu event QA pass | High sau QA | Có | sửa 3 phút đầu và level proof |
| Có nên kill product? | D1 early + D0 ROAS thấp + mismatch | Low | Không | chờ clean cohort và D3/D7 rule |
| Có nên QA measurement? | install vs first_open lệch | Unknown | Bắt buộc | kiểm SDK, source naming, build path |

Một decision memo đủ tốt cho team indie nên giống thế này:

```text
Measurement decision memo
- Can iterate: store proof and tutorial delivery, because Store CVR has medium confidence and tutorial event can become high confidence after QA.
- Must QA first: install -> first_open mismatch before any scale or fraud claim.
- Cannot claim: product-market fit failed, creative thesis failed, or ROAS is final.
- Next action: one clean retest cell, fixed first-session proof, same promise, same budget cap.
```

Điểm quan trọng: cùng một report có thể cho phép **sửa onboarding** nhưng chưa cho phép **kill product**. Đây là khác biệt giữa metric literacy và đọc dashboard theo cảm xúc.

### Measurement acceptance gate

Trước khi Week 3/4 dùng metric làm successCriteria hoặc killCriteria, metric đó phải đi qua acceptance gate.

```text
Measurement acceptance gate - Calming Puzzle

Metric proposed for decision:
tutorial_complete used to decide whether first-session proof needs repair.

Source/window:
Game analytics, same build, first session, day 0.

Confidence:
High only after event QA confirms tutorial_start -> tutorial_complete order and no double-fire.

Decision allowed:
Repair tutorial length, first level pacing, early win timing.

Decision blocked:
Do not blame channel.
Do not kill product.
Do not scale/stop campaign solely from this event without acquisition context.

Upgrade requirement:
Segment by app_version/source_group and compare with level_3_complete + D1 direction.
```

Acceptance gate giúp success/kill criteria không bị nhét metric "có vẻ hợp lý" nhưng chưa đủ sạch. Với micro-budget, một metric chưa accepted vẫn có thể quan sát, nhưng chưa được dùng làm verdict.

---

## Measurement QA checklist

| Check | Pass condition |
| --- | --- |
| Metric owner | Mỗi metric có source owner: network/store/analytics/revenue |
| Window | Có cửa sổ đọc số: D0, D1, D3, D7 hoặc campaign day |
| Event QA | Event gameplay quan trọng có test trong build thật |
| Source naming | Campaign/ad/build/source naming đủ nối dữ liệu |
| Confidence label | Metric chính có High/Medium/Low/Unknown |
| Decision limit | Low-confidence data không được dùng để scale/kill lớn |
| Reconciliation rule | Có rule khi dashboards lệch |
| Privacy note | ATT/SKAN/Android privacy signal được ghi trong tracking risk |

Quality chain:

`privacy constraint -> source/window -> confidence label -> allowed decision -> next action`

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Privacy Sandbox Attribution Reporting hướng tới attribution bảo vệ quyền riêng tư cho advertising measurement. | Android plan cần chuẩn bị cho signal ít user-level hơn và cần đọc theo aggregation/window rõ hơn. | Không suy ra Android measurement vô dụng; nó vẫn hữu ích nếu decision scope đúng. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit) | Apple cung cấp framework attribution cho app advertising trong hệ sinh thái Apple. | iOS UA cần confidence/window language thay vì kỳ vọng raw journey đầy đủ. | Không dùng aggregated attribution để kết luận hành vi cá nhân. |
| [Apple App Tracking Transparency](https://developer.apple.com/documentation/AppTrackingTransparency) | ATT liên quan quyền user cho tracking qua app/web thuộc công ty khác. | Consent/tracking context ảnh hưởng dữ liệu marketing; UA plan phải ghi rủi ro signal loss. | Không xem ATT là việc legal tách rời measurement. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Google Play yêu cầu khai báo dữ liệu app thu thập/chia sẻ và mục đích. | SDK/event plan phải đi cùng data safety readiness, nhất là khi thêm analytics/ads SDK. | Không thêm tracking chỉ vì dashboard đẹp nếu không phục vụ decision. |

Readout worksheet:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Source có nói về privacy, attribution, consent hoặc data disclosure không? | Measurement design phải có risk note, không chỉ event list. | Không suy ra compliance hay signal quality từ một dòng docs duy nhất. |

---

## Common mistakes

- **Mistake - Correction:** "Network dashboard nói CPI rẻ nên scale."
  **Correction:** CPI cần đi với Store CVR, D1 và first-session proof trước khi tăng budget.

- **Mistake - Correction:** "Analytics và network không khớp nên data vô dụng."
  **Correction:** Reconcile source/window/event; nhiều quyết định nhỏ vẫn dùng được.

- **Mistake - Correction:** "SKAN/ATT là phần legal, không liên quan UA."
  **Correction:** Privacy signal quyết định campaign structure, event taxonomy và kill criteria.

- **Mistake - Correction:** "D0 ROAS xấu nên kill campaign."
  **Correction:** Ghi payback/ROAS window trước, đọc D0 như guardrail chứ không phải verdict cuối.

- **Mistake - Correction:** "Micro-budget đủ để kết luận product-market fit."
  **Correction:** Micro-budget chỉ đủ để kiểm một promise chain hoặc một risk cụ thể.

---

## English Terms You Should Keep

| Term | Nghĩa vận hành |
| --- | --- |
| Attribution | Gán conversion/revenue về nguồn traffic |
| ATT | Apple App Tracking Transparency |
| SKAN | SKAdNetwork-era attribution/reporting context |
| AdAttributionKit | Apple attribution framework cần hiểu cùng nhóm iOS attribution |
| Modeled conversion | Conversion được ước lượng/modeling, không phải raw user event |
| Confidence level | Nhãn High/Medium/Low/Unknown để giới hạn quyết định |
| Reconciliation | Đối chiếu dashboard theo source, window và event definition |

---

## Lab output example

```text
Measurement Risk Note - v1

Primary campaign decision:
- Should we continue testing the calming/satisfying promise after 3 days?

Source map:
- Ad network: spend, impressions, CTR, CPI. Confidence: Medium.
- Store: Store CVR. Confidence: Medium.
- Game analytics: first_open, tutorial_complete, level_3_complete, D1. Confidence: High after event QA.
- Revenue: ARPDAU, D3/D7 ROAS. Confidence: Low until cohort/window matures.

Dashboard mismatch rule:
- If network installs are >20% higher than analytics first_open, pause scale and QA source naming, SDK version, first_open event and consent path.

Allowed decisions:
- Medium confidence: iterate creative/store.
- High confidence gameplay event: fix onboarding/level proof.
- Low confidence ROAS: hold or collect more data.

Not allowed:
- Do not scale >2x from CPI alone.
- Do not kill product from modeled ROAS alone.
- Do not split more ad cells if aggregated signal is already too thin.

Measurement acceptance gate:
- Metric proposed for decision:
- Source/window:
- Current confidence:
- Decision allowed:
- Decision blocked:
- Upgrade requirement:
```

---

## Practical Lab

1. Chọn 6 metric quan trọng nhất cho micro soft-launch đầu tiên.
2. Với mỗi metric, ghi source owner, window, confidence và allowed decision.
3. Viết một dashboard mismatch rule.
4. Viết một list "not allowed decisions" cho low-confidence data.
5. Kiểm tra event taxonomy ngày 14 có đủ event high-confidence chưa.
6. Chọn 2 metric sẽ xuất hiện trong successCriteria/killCriteria và viết acceptance gate cho từng metric.
7. Copy note vào Final UA Plan.

Pass lab khi team nhìn note và biết khi nào được iterate, khi nào chỉ hold, khi nào phải QA event trước.

---

## Final UA Plan Update

Cập nhật field **tracking**:

```text
Measurement risk:
- Source map:
- High-confidence gameplay events:
- Medium-confidence platform metrics:
- Low-confidence delayed/modeled metrics:
- Dashboard reconciliation rule:
- Measurement acceptance gates:
- Decisions allowed by confidence level:
- Decisions not allowed from low-confidence data:
- Privacy/attribution notes for Android/iOS:
```

Cập nhật **successCriteria / killCriteria** bằng confidence language:

```text
Scale only if:
- acquisition signal is acceptable AND
- first-session events are QA'd AND
- retention floor is met in a clean cohort.

Do not kill product if:
- only modeled ROAS is weak,
- event QA is incomplete,
- install vs first_open mismatch is unresolved.
```

---

## Checklist Focus

- [ ] Mỗi metric quan trọng có source owner.
- [ ] Mỗi metric có window đọc số.
- [ ] Có confidence label cho metric dùng để quyết định.
- [ ] Có dashboard mismatch rule.
- [ ] Metric đưa vào successCriteria/killCriteria có measurement acceptance gate.
- [ ] Decision size khớp confidence level, không scale/kill từ signal unknown hoặc low.
- [ ] Low-confidence data không được dùng để scale/kill lớn.
- [ ] Tracking field trong Final UA Plan đã cập nhật.
- [ ] Android/iOS privacy attribution risk được ghi rõ.

---

## Curated References

- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit)
- [Apple App Tracking Transparency](https://developer.apple.com/documentation/AppTrackingTransparency)
- [Google Play Help - Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
