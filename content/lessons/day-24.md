---
day: 24
title: "Reading campaign reports"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [CTR, IPM, Retention, ROAS]
artifact: "Report readout template"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Report readout template** để biến một campaign report thành **một recommended call**: scale cautiously, iterate creative, fix store, fix product, fix tracking, hold, hoặc stop.

Quyết định chính: **một report chưa kết thúc bằng diagnosis + primary call + confidence caveat + owner/date thì chưa phải report vận hành**.

Artifact này cập nhật field **successCriteria**, **killCriteria**, **nextAction**, **tracking** và **learningLog** trong Final UA Plan.

Report readout cuối bài phải trả lời:

| Câu hỏi | Output |
| --- | --- |
| Test đang hỏi hypothesis nào? | 1 câu rõ ràng |
| Metric nào thuộc creative/store/product/traffic/economics/tracking? | Bucketed metric table |
| Signal nào mâu thuẫn? | Contradiction line |
| Sample/measurement đáng tin đến đâu? | Confidence caveat |
| Team nên làm gì tiếp? | One primary call |
| Ai làm và khi nào review? | Owner/date |

## Why this matters

Report rất dễ biến thành bảng số dài. Với non-UA Unity team, vấn đề thường không phải thiếu metric. Vấn đề là không biết metric nào đang nói về creative, store, audience, product, monetization hay tracking.

Khi không bucket signal trước, team thường sửa nhầm chỗ:

- làm thêm ad mới dù store page đang không chứng minh promise;
- sửa tutorial dù tracking event bị thiếu;
- scale traffic rẻ dù D1/user quality yếu;
- kill creative có `CTR` thấp dù những user vào game lại giữ tốt;
- tranh luận quanh `ROAS` sớm dù payback window chưa đủ.

Một report vận hành không hỏi "số nào đẹp?". Nó hỏi: **số này đang chỉ vào đoạn nào của promise chain, độ tin cậy ra sao, và action tiếp theo là gì?**

Với budget nhỏ, report càng phải kỷ luật. Bạn không cần dashboard lớn; bạn cần readout ngắn, có diagnosis, có confidence, có quyết định, và có người chịu trách nhiệm cho bước tiếp theo.

## Core model: bucket before action

Đọc report theo chuỗi:

```text
hypothesis
  -> metric bucket
  -> contradiction check
  -> confidence caveat
  -> primary call
  -> owner/date
  -> learning log
```

| Bucket | Metric thường đọc | Câu hỏi vận hành | Action thường gặp |
| --- | --- | --- | --- |
| Creative | `CTR`, thumbstop, asset rating, first-hook signal | Ad có kéo attention đúng không? | Rewrite first 2 seconds, variant hook |
| Store | Store `CVR`, install rate, `IPM` split | Store có xác nhận ad promise không? | Fix screenshot/copy/icon order |
| Product | D1, `tutorial_complete`, level depth | First session có giữ lời hứa không? | Fix onboarding/level 1-3 |
| Traffic | CPI, delivery split, geo/source mix | Traffic có phù hợp test không? | Narrow/hold channel, rerun cleaner |
| Economics | ARPDAU, `ROAS`, payback window | Có guardrail kinh tế để tiếp tục không? | Cap spend, wait window, adjust monetization |
| Tracking | Missing events, attribution gaps, revenue event quality | Số có đáng tin không? | Fix measurement before call |

Rule: nếu bucket chưa rõ, action chưa nên mạnh. Nếu tracking bucket fail, mọi bucket sau đó phải có caveat.

## Report readout template mẫu

Copy khung này cho mỗi review:

| Field | Example |
| --- | --- |
| Hypothesis | "Satisfying clear hook will bring better install fit than challenge hook." |
| Evidence | Challenge có `CTR` cao; satisfying có `CVR` và D1 direction tốt hơn |
| Bucket diagnosis | Challenge thắng creative attention nhưng thua store/product fit |
| Contradiction | Cheap CPI không đi cùng quality signal |
| Confidence | Directional; ~50 installs/cell; event QA pass; D1 still thin |
| Primary call | Iterate satisfying clear; do not scale challenge |
| Backup caveat | Need stronger opening before rerun |
| Owner/date | Creative owner, next Monday |
| Learning log | "Curiosity hook creates low-quality traffic in this geo." |

Readout tốt phải có **one primary call**. Nếu có 4 action ngang nhau, report chưa đọc xong hoặc hypothesis quá rộng.

### Primary call arbitration

Khi report có nhiều tín hiệu trái chiều, đừng chọn call theo metric "đẹp nhất". Hãy chọn call bảo vệ bước học tiếp theo.

| Conflict | Primary call nên chọn | Vì sao | Backup caveat |
| --- | --- | --- | --- |
| Tracking gap vs any positive metric | Fix tracking / hold | dữ liệu bẩn làm mọi conclusion yếu | no scale/kill read |
| Cheap CPI vs weak D1 | Audit promise/traffic, do not scale | traffic rẻ nhưng không giữ user | compare first-session proof |
| High CTR vs weak CVR/D1 | Fix store/promise or pause hook | attention không đủ nếu downstream fail | do not call winner |
| Low CTR vs strong CVR/D1 | Iterate creative | product fit có thể tồn tại nhưng bán chưa tốt | action size small |
| Good retention vs immature ROAS | Cap spend / wait economics window | payback chưa đủ chứng cứ | no aggressive scale |
| Two buckets weak, tracking clean | Stop/rewrite hypothesis | chain fail rộng hơn một surface | write replacement hypothesis |

Primary call memo:

```text
Report arbitration
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Backup caveat:
- Decisions explicitly blocked:
- Owner/date:
```

Rule: một report tốt có thể nói "iterate creative", đồng thời block "scale", "kill product" và "ROAS verdict". Blocked conclusions giúp team không overclaim.

### Report acceptance contract

Trước khi report được dùng để scale, stop hoặc đổi roadmap, nó phải pass một contract ngắn. Contract này không làm report dài hơn; nó làm rõ report **được phép quyết định gì** và **bị cấm quyết định gì**.

| Contract field | Câu hỏi phải trả lời | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Report scope | Report đang đọc test/campaign/cell nào? | Có tên test, ngày, geo/channel, spend window | Không dùng report để so sánh |
| Accepted source/window | Data lấy từ đâu và đủ window chưa? | Ad platform + event source + cohort window được ghi rõ | Chỉ ghi observation, chưa ghi call |
| Strongest useful signal | Signal nào đáng dùng nhất? | Signal gắn với một bucket cụ thể | Không được chọn action theo cảm giác |
| Weakest blocking signal | Signal nào đang chặn conclusion mạnh? | Blocker được nêu tên, không bị giấu | Giảm action size |
| Dirty/missing signal | Event/report nào thiếu hoặc bẩn? | Tracking caveat có impact rõ | Fix tracking trước khi scale/kill |
| Primary call | Một action chính là gì? | Scale cautiously, iterate, fix, hold, stop hoặc rerun | Report chưa được sign-off |
| Blocked conclusions | Điều gì report này không được kết luận? | Có ít nhất 1-3 blocked conclusions | Team dễ overclaim |
| Owner/date | Ai làm, review khi nào? | Có owner và checkpoint | Readout chưa thành việc làm |

Contract tốt thường ngắn hơn một màn hình. Nếu bạn phải viết 2 trang để giải thích vì sao report được chấp nhận, có thể hypothesis quá rộng hoặc data chưa đủ sạch.

```text
Report acceptance contract
- Scope:
- Accepted source/window:
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Blocked conclusions:
- Owner/date:
```

Acceptance rule: report chưa có `primary call + blocked conclusions + owner/date` thì chỉ là analysis draft, chưa phải operating report.

## Hero visual: report diagnosis map

```text
![Hero visual: report diagnosis map](content/assets/usecases/day-24-hero-diagram.png)Type: hero operating diagram.
Lesson section: Hero visual: report diagnosis map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Metric appears in report
        |
        v
Is tracking/event setup trustworthy?
        | yes
        v
Map metric to bucket
  CTR/thumbstop ---------> Creative action
  CVR/IPM --------------> Store action
  D1/tutorial/depth ----> Product action
  CPI/source/geo -------> Traffic action
  ROAS/ARPDAU ----------> Economics action
        |
        v
Check contradiction + sample
        |
        v
Write one primary call + caveat + owner/date
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Tracking check đứng trước bucket | Data bẩn làm mọi diagnosis yếu | Tracking pass nghĩa là mọi conclusion mạnh |
| Mỗi metric bucket dẫn tới action khác nhau | Report tốt giúp sửa đúng chỗ trong funnel | Một metric đơn lẻ đủ làm toàn bộ decision |
| Contradiction nằm trước primary call | Số trái chiều phải được ghi rõ | Bỏ qua metric xấu để giữ narrative đẹp |
| Owner/date đứng cuối | Report chỉ có giá trị khi biến thành việc làm | Diagnosis tự động tạo progress |

## Data visual: call selection table

```text
![Data visual: call selection table](content/assets/usecases/day-24-data-visual.png)Type: data visual/chart or decision board.
Lesson section: Data visual: call selection table.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Pattern | Likely bucket | Confidence check | Primary call |
| --- | --- | --- | --- |
| `CTR` high, store `CVR` low | Store mismatch hoặc curiosity hook | Store changed during test không? | Fix store proof before more creative |
| Store `CVR` high, D1 low | Product/first-session proof weak | Early events QA pass chưa? | Fix onboarding/level 1-3 |
| `CTR` low, D1 good | Creative undersells product | Sample đủ chưa? | Iterate creative opening |
| CPI low, D1 weak | Cheap wrong traffic hoặc misleading promise | Source/geo mix clean không? | Hold scale; audit traffic/promise |
| CPI high, D1 good | Expensive but qualified traffic | Budget/cell đủ không? | Improve creative/store efficiency, do not kill product |
| `ROAS` short, retention acceptable | Economics/payback window | Window đủ chưa? | Cap spend; wait/adjust monetization |
| Events missing | Tracking risk | Missing event có là decision metric không? | Fix tracking before call |
| One cell gets most spend | Delivery bias | Spend/cell comparable không? | Do not declare winner; rerun cleaner |

Report card preview:

| Block | Good wording | Weak wording |
| --- | --- | --- |
| Diagnosis | "Hook A wins attention but fails store/product proof." | "Hook A has mixed results." |
| Confidence | "Directional: 48 installs/cell, D1 thin, event QA pass." | "Looks good." |
| Call | "Iterate Hook B; do not scale Hook A." | "Keep testing." |
| Owner/date | "Creative owner ships 2 openings by Monday." | "Team will improve creatives." |

## Hướng dẫn đọc số

Triage order khi số mâu thuẫn:

| Step | Hỏi gì trước | Vì sao |
| --- | --- | --- |
| 1. Tracking | Event/attribution có đủ tin không? | Data bẩn làm mọi diagnosis yếu |
| 2. Sample | Installs/cohort đủ cho loại conclusion không? | Tránh winner/kill từ sample mỏng |
| 3. Promise chain | Ad -> store -> first session lệch ở đâu? | Tìm đúng nơi sửa |
| 4. Economics | Cost/revenue có guardrail gì? | Không scale thứ không có ceiling |
| 5. Action | Một primary call là gì? | Report phải kết thúc bằng việc làm |

Metric patterns:

| Pattern | Cách đọc | Next action |
| --- | --- | --- |
| High `IPM`, weak D1 | Acquisition efficient nhưng promise/user quality yếu | Audit first session và hook honesty |
| Low `CTR`, strong retention | Product có signal, creative chưa bán được | New opening/hook variant |
| `CTR` high, `CVR` low | Hook hút click nhưng store không confirm | Fix screenshot/title/copy |
| `CVR` high, D1 low | Store promise tốt, product không deliver | Fix onboarding/level 1-3 |
| Platform numbers inconsistent | Measurement caveat | Validate tracking before decision |
| One cell got most spend | Delivery bias | Do not overclaim winner |
| `ROAS` weak, D7 not mature | Payback window chưa đủ | Wait/cap, do not hard kill |

Decision rule: mỗi report chỉ nên có một primary call và một backup caveat.

Report call arbitration board:

| If the report contains | Primary call | Backup caveat | Owner lane |
| --- | --- | --- | --- |
| Tracking gap affects the decision metric | Fix tracking / hold | No scale/kill read until event is trustworthy | Tech + UA |
| Sample is thin but direction is coherent | Keep reading / small iterate | Directional only; action size must stay small | UA owner |
| Creative wins attention but downstream quality is weak | Fix store/promise or pause hook | Do not scale from `CTR` alone | Creative + store owner |
| Store and first session are healthy but attention is weak | Iterate creative | Preserve store/build so retest stays clean | Creative owner |
| Store is healthy, first session is weak | Fix product/onboarding | Do not rewrite acquisition until first-session proof improves | Product owner |
| Retention is acceptable but economics is unclear | Cap spend / wait economics window | No aggressive scale until payback read matures | UA + monetization |
| Two buckets are weak and tracking is clean | Stop or rewrite hypothesis | Write replacement hypothesis before next spend | UA + product |

Priority rule: a report should choose the call that protects the next learning step. When confidence is weak, reduce action size; when tracking is dirty, reduce conclusion strength; when the weak bucket is clear, assign one owner instead of creating a team-wide vague fix.

## Worked example: one-page readout

| Metric | Hook A: challenge | Hook B: satisfying clear | Read |
| --- | ---: | ---: | --- |
| `CTR` | 4.0% | 2.4% | A wins attention |
| Store `CVR` | 12% | 30% | B store promise stronger |
| D1 direction | 9% | 24% | B better user fit |
| CPI | Lower | Higher | A cheaper but lower quality |
| Event QA | Pass | Pass | Product read usable |
| Installs/cell | 54 | 47 | Directional, not final |

Diagnosis:

Hook A is a curiosity trap. It gets clicks cheaply, but those users do not convert through store/product proof. Hook B has lower attention, but the users who install appear closer to the promise chain.

Recommended call:

**Iterate Hook B**, do not scale Hook A. Produce two stronger openings for satisfying clear, keep store proof unchanged, and review after the next spend floor.

Confidence:

Directional only. D1 cohort is not large enough for a hard retention claim, but strong enough to choose the next creative iteration direction.

Tradeoff:

Cheaper traffic is not better if it creates weak first-session proof. The next iteration should improve Hook B's first 2 seconds, not copy Hook A's curiosity angle blindly.

Good report sentence:

```md
Hook A wins attention but fails store/product proof. Hook B is a better promise-chain candidate.
Primary call: iterate Hook B with stronger opening; do not scale Hook A.
Confidence: directional, ~50 installs/cell, D1 thin but event QA pass.
```

### Report audit and blocked conclusions

Một readout tốt nên có audit trail giống release note nhỏ: metric nào được dùng, metric nào bị bỏ qua, kết luận nào bị khóa, và review khi nào.

```text
Report audit
- Evidence used: CTR, Store CVR, D1 direction, event QA, installs/cell.
- Evidence ignored: D0 ROAS because payback window is immature.
- Primary call: iterate Hook B.
- Decisions blocked: scale Hook A, kill challenge motivation, claim final retention.
- Owner/date: creative owner, next Monday.
- Review trigger: after two new openings reach the same spend floor.
- What remains unproven: whether satisfying clear can achieve cheaper CPI at scale.
```

Audit này đặc biệt quan trọng khi report có một metric hấp dẫn như CPI rẻ hoặc CTR cao. Metric hấp dẫn thường kéo team về action quá mạnh; audit giữ action đúng kích thước.

### One-page report sign-off memo

Sau audit, viết một memo ngắn để khóa cách team sẽ hành động. Memo này là phần bạn có thể paste vào Slack, Notion, Linear ticket hoặc Final UA Plan.

```text
Report sign-off - Test name/date

Accepted read:
- Report is accepted for:
- Report is not accepted for:

Primary call:
- TBD

Action size:
- TBD

Owner/date:
- TBD

Next checkpoint:
- TBD

Learning log entry:
- TBD
```

Ví dụ với Hook A vs Hook B:

```text
Report sign-off - W4 Hook Direction Test

Accepted read:
- Accepted for choosing next creative iteration direction.
- Not accepted for scale, product kill, or final retention claim.

Primary call:
- Iterate Hook B with two stronger openings; keep store proof unchanged.

Action size:
- Small rerun only; same geo/channel; no budget increase.

Owner/date:
- Creative owner ships by Monday; UA owner reviews after spend floor.

Next checkpoint:
- Compare CTR, store CVR, D1 direction, and event QA after both new openings reach comparable delivery.

Learning log entry:
- Curiosity/challenge angle can buy clicks but appears weaker on store/product proof for this prototype.
```

Sign-off memo tốt bảo vệ team khỏi hai lỗi: tự tin quá mức khi chỉ có directional signal, hoặc không làm gì vì report có quá nhiều metric trái chiều.

## Report quality checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Hypothesis | Report says what was tested | Rewrite first line |
| Bucketed metrics | Creative/store/product/traffic/economics/tracking separated | Re-bucket before action |
| Contradiction | Conflicting signals are named | Do not hide inconvenient metric |
| Confidence | Sample and measurement caveat stated | Add confidence line |
| Diagnosis | Explains why metrics point to a bucket | Replace metric list with read |
| Call | One recommended action | Pick primary, move rest to caveat |
| Owner/date | Next action assigned | Add owner/date |
| Learning log | What was learned is captured | Save readout |

Quality chain:

```text
hypothesis -> evidence -> bucket diagnosis -> confidence -> primary call -> owner/date -> learning log
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Analytics reports overview](https://support.google.com/analytics/answer/9212670?hl=en) | GA reports are organized around customer journey stages such as acquisition, engagement, monetization and retention. | A good campaign readout should map metrics to journey/funnel stages instead of listing numbers flatly. | Do not assume GA's UI structure alone tells you what action to take. |
| [Firebase Analytics documentation](https://firebase.google.com/docs/analytics) | Firebase/Google Analytics helps measure app usage and user engagement. | Product buckets like `tutorial_complete`, level depth and retention need event instrumentation, not only ad platform numbers. | Do not infer product quality from ad metrics if in-app events are missing. |
| [Firebase Log events documentation](https://firebase.google.com/docs/analytics/ios/events) | Events describe what happens in the app, including user actions, system events or errors. | Tracking bucket is operational: if decision events are missing, the report call must be weaker or blocked. | Do not treat missing events as proof that users did not do the action. |
| [Google Ads App campaign asset reporting](https://support.google.com/google-ads/answer/6310436?hl=en) | Asset reports help review performance of assets used by App campaigns. | Creative bucket should look at asset-level/creative signals, but still compare them with store/product quality. | Do not declare an asset winner from creative reporting without downstream checks. |
| [Google Ads enhanced asset reporting](https://support.google.com/google-ads/answer/14594955?hl=en) | Enhanced reports expose app network/campaign/asset performance templates in Report editor. | Report structure can be built deliberately; choose views that answer the hypothesis. | Do not pull every available report if it does not change the primary call. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Analytics tools split journey stages | Bucket diagnosis mirrors the funnel | Tool UI automatically makes decisions |
| Firebase events define in-app behavior | Product reads need clean event taxonomy | Missing event means behavior did not happen |
| App campaign asset reporting focuses on creative assets | Creative signal is one bucket, not the whole answer | Highest-performing asset is always best player fit |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Report chỉ list metric | Thêm diagnosis và recommended call |
| Chọn action theo `CTR` | Đọc `CTR` cùng `CVR`, D1 và event QA |
| Bỏ qua metric trái chiều | Viết contradiction line |
| Không ghi confidence | Ghi sample/measurement caveat |
| Fix creative khi tracking missing | Validate tracking trước |
| Kết thúc bằng nhiều action ngang nhau | Chọn primary call, backup caveat |
| Nhầm report UI với insight | Chỉ lấy view/report phục vụ hypothesis |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `CTR` | Click-through rate |
| `IPM` | Installs per mille |
| `Retention` | Tỷ lệ user quay lại |
| `ROAS` | Return on ad spend |
| `Readout` | Bản đọc số kèm diagnosis/action |
| `Bucket diagnosis` | Gán metric pattern vào nơi cần sửa |
| `Primary call` | Quyết định chính sau report |
| `Confidence caveat` | Ghi chú độ chắc của conclusion |
| `Delivery bias` | Spend/impression lệch làm so sánh cell yếu |

## Lab output example

```md
Report readout - W4 Test 1

Hypothesis:
- Satisfying clear beats challenge for install fit.

Evidence:
- Challenge: higher CTR, lower CVR, weak D1.
- Satisfying: lower CTR, stronger CVR and D1 direction.
- Event QA: pass.
- Sample: directional, not final.

Bucket diagnosis:
- Challenge wins creative attention but appears to create curiosity traffic.
- Satisfying clear aligns store and first-session proof better.

Contradiction:
- Challenge has cheaper CPI, but quality signal is weaker.

Confidence:
- Directional, 40-55 installs/cell; D1 is not hard retention proof.

Primary call:
- Iterate satisfying clear.
- Do not scale challenge.

Owner/date:
- Creative owner produces 2 stronger openings by next Monday.

Learning log:
- Curiosity/challenge angle can buy clicks, but store/product proof is weaker for this puzzle prototype.

Report audit:
- Evidence used:
- Evidence ignored:
- Decisions blocked:
- Owner/date:
- Review trigger:
- What remains unproven:

Report acceptance contract:
- Scope:
- Accepted source/window:
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Blocked conclusions:
- Owner/date:

Report sign-off:
- Accepted for:
- Not accepted for:
- Action size:
- Next checkpoint:
```

## Practical Lab

1. Chọn một report hoặc sample pattern từ test gần nhất.
2. Viết hypothesis của test trong một câu.
3. Bucket metric thành creative/store/product/traffic/economics/tracking.
4. Viết contradiction line nếu có số mâu thuẫn.
5. Ghi confidence caveat dựa trên sample và tracking.
6. Chọn một primary call và một backup caveat.
7. Gán owner/date.
8. Viết learning log một câu.
9. Copy readout vào Final UA Plan.
10. Viết blocked conclusions: điều gì report này không được kết luận.
11. Điền Report acceptance contract.
12. Viết one-page sign-off memo.
13. Viết review trigger cho lần đọc tiếp theo.

Quality check: nếu có nhiều call ngang nhau, report chưa đủ rõ hoặc hypothesis quá rộng.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Report readout template:
- Hypothesis:
- Evidence:
- Bucket diagnosis:
- Contradiction:
- Confidence:
- Primary call:
- Backup caveat:
- Owner/date:
- Decisions blocked:
- Review trigger:
- Acceptance contract:
```

Cập nhật field **killCriteria / nextAction / tracking**:

```md
Campaign report action:
- Do not scale if:
- Do not kill if:
- Tracking risk:
- Next review date:
- Learning log entry:
- Blocked conclusions:
- Action size:
```

Cập nhật field **learningLog**:

```md
Learning log entry:
- What we tested:
- What the report suggests:
- What we will change:
- What remains unproven:
- Evidence ignored:
- Decisions blocked:
- Review trigger:
- Sign-off memo:
```

## Checklist Focus

- [ ] Report kết thúc bằng one primary call.
- [ ] Metric được bucket đúng.
- [ ] Contradiction được ghi rõ.
- [ ] Có confidence caveat.
- [ ] Có Report acceptance contract.
- [ ] Có blocked conclusions.
- [ ] Có action size.
- [ ] Có sign-off memo đủ ngắn để paste vào team update.
- [ ] Tracking risk không bị bỏ qua.
- [ ] Owner/date rõ.
- [ ] Learning log được cập nhật.

## Curated References

- [Google Analytics Help - Overview of Google Analytics reports](https://support.google.com/analytics/answer/9212670?hl=en)
- [Firebase - Google Analytics for Firebase](https://firebase.google.com/docs/analytics)
- [Firebase - Log events](https://firebase.google.com/docs/analytics/ios/events)
- [Google Ads Help - About asset reporting for App campaigns](https://support.google.com/google-ads/answer/6310436?hl=en)
- [Google Ads Help - About enhanced asset reporting for App campaigns](https://support.google.com/google-ads/answer/14594955?hl=en)
