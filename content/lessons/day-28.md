---
day: 28
title: "Weekly UA operating rhythm"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, ROAS, Soft launch]
artifact: "Weekly operating cadence"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Weekly operating cadence** cho micro soft-launch: một nhịp làm việc rõ owner, deadline, artifact, readiness gate, report readout, decision meeting và learning log.

Quyết định chính: tuần tới team nên chạy **một loop nhỏ nhưng đóng được**, hay giảm scope vì creative/build/store/tracking chưa đủ capacity?

Artifact này cập nhật field **nextAction**, **budget**, **creativeMatrix**, **tracking** và **successCriteria** trong Final UA Plan.

## Why this matters

UA của indie team hiếm khi hỏng vì thiếu ý tưởng. Nó thường hỏng vì rhythm lỏng: creative export muộn, build chưa validate event, store listing đổi giữa test, report đọc quá sớm, meeting không chốt call, learning log bị bỏ qua. Khi đó team tưởng mình đang "soft-launch", nhưng thật ra chỉ đang đốt budget vào một chuỗi việc chưa khép kín.

Với budget `$100-500`, cadence quan trọng hơn ambition. Một tuần chạy 2 creatives, 1 store proof, 1 build QA, 1 readout rõ và 1 decision thật thường có giá trị hơn một plan 8 creatives nhưng không có D1 window, không có owner, và không biết ai update plan.

Cadence tốt biến UA thành loop vận hành:

`learning question -> readiness -> launch -> readout -> decision -> learning log -> next question`

Nếu cadence không có owner/deadline/artifact, nó chỉ là wishlist.

## Core model: Close the loop before adding scope

Đừng hỏi "tuần này team làm được bao nhiêu task?" trước. Hãy hỏi:

> Tuần này team có thể đóng trọn một learning loop nào mà không làm hỏng measurement không?

| Loop stage | Câu hỏi cần chốt | Output bắt buộc | Không có output này thì |
| --- | --- | --- | --- |
| Learning question | Tuần này học điều gì? | 1 hypothesis + allowed decision | Test quá rộng, report không có verdict |
| Readiness | Build/store/events/creative đã đủ chưa? | Gate pass hoặc caveat | Data unreadable |
| Launch | Campaign chạy theo setup nào? | Spend/window/platform/cells | Không rerun được |
| Readout | Metric đọc theo bucket nào? | Creative/store/product/economy/tracking readout | Meeting thành cảm tính |
| Decision | Scale/iterate/hold/fix gì? | One primary call | Không ai làm bước tiếp |
| Learning log | Assumption nào đổi? | Log entry + plan update | Tuần sau lặp lại lỗi cũ |

Rule vận hành: nếu tuần này không thể đóng đủ 6 stage, hãy giảm creative cells, giảm store changes, hoặc dời launch.

## Weekly cadence mẫu

| Timebox | Owner | Job | Done means | Decision protected |
| --- | --- | --- | --- | --- |
| Monday AM | UA/product | Lock learning question | 1 hypothesis, 1 allowed call, 1 metric bucket | Không test lan man |
| Monday PM | Creative/UA | Lock creative matrix | 2-4 cells, filenames, promise labels | Không nhầm variant |
| Tuesday | Tech/product | Validate build + events | install, tutorial, level/progression, revenue/ad events checked | Không đọc sai D1/economy |
| Wednesday | Store/product | Freeze store proof | screenshot/copy version named | Không trộn store effect vào creative test |
| Thu-Fri | UA | Launch + monitor spend | spend pacing and delivery caveats logged | Không declare winner từ delivery bias |
| Next Monday AM | UA/product | Readout + decision meeting | one primary call + owner/date | Không kết thúc bằng "theo dõi thêm" mơ hồ |
| Next Monday PM | UA owner | Learning log + plan update | assumption changed + next question | Không mất learning |

Cadence không cần giống calendar này. Nhưng mọi cadence phải có: **owner, deadline, artifact, gate, readout, decision, log**.

### Weekly capacity contract

Trước khi commit tuần, team cần một contract nhỏ để không hứa nhiều hơn khả năng đóng loop.

| Contract field | Câu hỏi | Ví dụ tốt |
| --- | --- | --- |
| One learning question | Tuần này chỉ học điều gì? | Relax hook có tạo player fit sạch hơn challenge hook không? |
| Max creative cells | Team thật sự export/QA được bao nhiêu cell? | 2-3 cells, không phải 8 cells |
| Required gates | Gate nào phải pass trước spend? | Event QA, store freeze, build version, campaign naming |
| Readout windows | D0/D1/D7 đọc lúc nào? | Friday đọc acquisition/store, Monday đọc D1 |
| Decision vocabulary | Meeting được phép chốt call nào? | launch, hold, fix-readiness, iterate, rerun |
| Scope cut rule | Nếu gate fail thì cắt gì trước? | Cắt cell mới trước, không cắt event QA |

Contract này bảo vệ cadence khỏi một lỗi rất phổ biến: giữ nguyên deadline nhưng giảm chất lượng gate. Với micro-budget, event QA và store freeze không phải "nice to have"; chúng là điều kiện để số liệu có nghĩa.

## Operating diagram: weekly UA loop

![Operating diagram: weekly UA loop](content/assets/usecases/day-28-hero-diagram.png)


```text
┌──────────────────────┐
│ 1. Learning question  │
│ one hypothesis        │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 2. Readiness gate     │
│ creative/build/store  │
│ events/privacy        │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 3. Campaign run       │
│ spend/window/cells    │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 4. Bucketed readout   │
│ CTR/CVR/D1/revenue    │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 5. Decision meeting   │
│ scale/iterate/hold/fix│
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 6. Learning log       │
│ assumption + next Q   │
└──────────┴───────────┘
```

**Inspect:** loop có readiness gate trước launch và learning log sau decision. Đây là hai chỗ indie team hay bỏ qua nhất.

**Conclude:** cadence khỏe không phải là chạy campaign liên tục; cadence khỏe là mỗi test đóng thành một learning unit.

**Do not infer:** tuần nào cũng phải scale. Có tuần quyết định đúng nhất là hold/fix readiness.

## Capacity board: scope theo bottleneck thật

![Capacity board: scope theo bottleneck thật](content/assets/usecases/day-28-data-visual.png)


| Workstream | Healthy weekly capacity cho team nhỏ | Nếu quá tải sẽ thấy | Scope rule |
| --- | --- | --- | --- |
| Creative | 2-4 variants có cùng naming rule | asset muộn, QA yếu, hook lệch matrix | giảm cells trước khi tăng budget |
| Build/events | 1 validated build | event mismatch, crash, D1 unreadable | thêm QA day, không launch nếu core events fail |
| Store proof | 0-1 listing update | không biết `CVR` đổi vì creative hay store | freeze store khi creative test |
| Campaign/report | 1 clean readout | nhiều charts nhưng không có call | dùng one-call template |
| Product proof | 1 small first-session fix | refactor rộng, không ship kịp | chọn proof trong 3 phút đầu |
| Privacy/compliance | 1 review khi SDK/data behavior đổi | launch bị block, disclosure thiếu | đưa vào readiness gate |

**Inspect:** board này không đo "team bận bao nhiêu"; nó đo bottleneck nào làm evidence mất đọc được.

**Conclude:** nếu một workstream miss 2 tuần liên tiếp, cadence phải giảm scope hoặc đổi sequence.

**Do not infer:** giảm scope là chậm. Với micro-budget, giảm scope thường là cách duy nhất để data đọc được.

## Hướng dẫn đọc số

Đọc metrics để chẩn đoán cadence, không chỉ chẩn đoán campaign.

| Metric/report pattern | Cadence issue có thể xảy ra | Câu hỏi cần hỏi | Next action |
| --- | --- | --- | --- |
| Report luôn trễ | Review meeting quá sớm hoặc owner thiếu | D1/revenue window đã đủ chưa? | Tách D0 readout và D1 readout |
| `CTR` có nhưng `CVR` caveat nặng | Store đổi giữa test hoặc listing proof yếu | Store version có freeze không? | Freeze store hoặc rerun |
| D1 không đọc được | Event/taxonomy/build QA fail | D1 event pass trước launch chưa? | Fix tracking, repeat |
| CPI rẻ nhưng cohort yếu | Learning question quá rộng | Test đang học creative hay audience? | Reduce cells và tighten hypothesis |
| Spend dồn vào 1 variant | Delivery bias | Có đủ delivery để gọi winner không? | Log caveat, rerun cleaner |
| Meeting có nhiều insight, không có action | Decision rule thiếu | Call được phép là scale/iterate/hold/fix gì? | Require one primary call |
| Creative muộn 2 tuần | Scope vượt capacity | Team thật sự ship được mấy cells? | Chạy 2 strong cells thay vì 6 weak cells |
| Privacy/store disclosure block launch | Readiness gate thiếu compliance | SDK/data behavior có đổi không? | Add privacy/data safety review slot |

Cadence rule: **nếu data không đọc được, đừng hỏi creative nào thắng; hỏi stage nào làm loop bị hở**.

Cadence triage ledger:

| Weekly state | Classification | What it means | Decision for this week |
| --- | --- | --- | --- |
| Creative/store/build/events all pass readiness | Launch loop | Team can run a small paid test and close a readout | Launch with fixed scope and scheduled readout |
| Creative ready but event/store gate fails | Fix-readiness week | Paid spend would create unreadable data | Hold launch, fix gate, keep creative packet |
| Build/events pass but creative packet late | Reduce-scope week | Measurement is ready but production capacity is the bottleneck | Run fewer cells or shift to store/readout work |
| Campaign ran but D1/revenue window not ready | Readout-split week | D0 can be read, retention/economy cannot | Do D0 readout now, schedule D1/D7 decision |
| Report has insights but no owner/action | Decision-debt week | Learning is not converting into execution | Block next launch until owner/date/action exists |
| Multiple workstreams miss deadlines | Reset-cadence week | Scope exceeds operating capacity | Cut the loop to one question, one asset packet, one gate |

Decision rule:

```text
Launch only when the loop can close.
If readiness fails, the week is not "lost"; it becomes a fix-readiness week.
If readout is incomplete, split the readout instead of forcing a fake decision.
```

Weekly UA rhythm should label the week honestly. A "hold/fix" week with clean evidence is better than a "launch" week that creates a report nobody can trust.

### Decision meeting one-call template

Decision meeting phải kết thúc bằng một primary call. Không cần dài, nhưng phải đủ 6 dòng:

```md
Weekly decision call

Primary call:
[launch / hold / fix-readiness / iterate / rerun / stop]

Evidence:
[2-3 facts that support the call]

Blocked conclusions:
[what this week's data cannot prove]

Owner:
[name]

Due date:
[date]

Plan update:
[field in Final UA Plan changed]
```

Nếu meeting chưa điền được `owner`, `due date`, và `plan update`, meeting chưa đóng. "Theo dõi thêm" chỉ hợp lệ khi có metric trigger cụ thể, ví dụ: "monitor D1 until Monday 10:00; if D1 remains below cohort direction, product owner opens first-session proof ticket."

## Worked example: một tuần bị quá tải

Team "Calming Hex Puzzle" muốn test 6 videos, update store screenshots, thêm ad placement, và chạy campaign trong cùng tuần.

| Plan ban đầu | Reality | Diagnosis | Fix cadence |
| --- | --- | --- | --- |
| 6 videos | 2 videos delivered đúng deadline | Creative capacity mismatch | Chạy 2 cells, phần còn lại backlog |
| Store screenshot update | Store copy đổi sau launch | Store effect trộn creative effect | Freeze store trước launch |
| Build QA Wednesday | `level_3_start` event fail | Tracking gate quá muộn | Validate Tuesday, launch Thursday only if pass |
| Report Friday | D1 chưa đủ window | Review quá sớm | Friday D0 readout, Monday D1 decision |
| Meeting Monday | Không ai nhận next action | Decision meeting thiếu owner rule | Meeting không close nếu chưa có owner/date |

Verdict: **hold launch scope**, không tăng cells. Chạy 2 creative cells với build/event/store freeze sạch.

Tradeoff: ít cells hơn làm test nhìn "nhỏ" hơn, nhưng readout có thể dùng được. Sáu cells với tracking/store caveat chỉ tạo thêm noise.

Second-pass cadence read:

| Question | Evidence | Better call |
| --- | --- | --- |
| Loop có thể close trong tuần này không? | Creative only delivers 2/6, event gate fails, store changed mid-test | Không launch full scope |
| Bottleneck thật là gì? | Creative capacity + tracking readiness + store freeze | Reduce to 2 cells and add readiness gate |
| Metric nào không được đọc tuần này? | D1 chưa đủ window; `level_3_start` event fail | Không gọi retention verdict |
| Action nào phải có owner/date? | Event QA, store freeze, 2-cell creative export, Monday D1 readout | Assign owner before any spend |
| Learning log ghi gì? | 6-cell plan exceeds operating capacity | Next week starts with max 2 cells unless readiness passes early |

Decision memo:

```md
Weekly state: Fix-readiness + reduce-scope week.
Launch call: hold full 6-cell launch.
Allowed launch: 2 cells only after event QA and store freeze.
D0 readout: Friday acquisition/store only.
D1 decision: Monday, after cohort window.
Learning log: capacity supports 2 clean cells, not 6 noisy cells.
```

Điểm sâu: cadence không chỉ là lịch. Cadence là cơ chế nói "không" với scope làm hỏng learning. Nếu team không thể close loop, giảm scope là quyết định UA, không phải quản lý dự án phụ.

Weekly operating ticket:

```md
Weekly operating ticket - W5

Learning question:
Does relax/satisfaction promise create cleaner player fit than challenge promise?

Scope:
2 creative cells, 1 store version, 1 Android market, $120 spend cap.

Readiness gates:
Event QA pass, store freeze v3, campaign naming pass, data safety unchanged.

Readout split:
Friday D0 acquisition/store readout.
Monday D1 first-session/retention readout.

Primary decision vocabulary:
iterate relax, repair challenge proof, hold for readiness, or rerun cleaner.

Scope cut rule:
If event QA fails, no launch.
If creative export misses deadline, run 1 cell smoke or hold.
If store changes after launch, mark caveat and do not call creative winner.
```

Operating ticket giúp cadence sống trong công việc thật: ai cũng biết tuần này cắt gì trước, không phải tranh luận lại khi deadline sát.

### Weekly closure certificate

Một tuần UA chỉ được coi là "đóng loop" khi có certificate này. Nó xác nhận tuần đó đã tạo ra decision, learning log và next question, hoặc đã được phân loại là fix-readiness week có owner rõ.

| Certificate field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Weekly state | Launch, fix-readiness, reduce-scope, readout-split hay reset-cadence? | Một nhãn duy nhất |
| Primary call | Tuần này chốt call gì? | launch / iterate / hold / fix / rerun / stop |
| Blocked conclusions | Metric nào chưa đủ quyền kết luận? | D1, ROAS, winner, channel, product verdict được ghi rõ nếu blocked |
| Plan field updated | Field nào đổi trong Final UA Plan? | budget, creativeMatrix, tracking, nextAction, successCriteria |
| Next question | Tuần sau học điều gì? | Một learning question mới hoặc repeat condition |
| Owner/date | Ai mở loop tiếp theo, khi nào? | owner + date + artifact |

```text
Weekly closure certificate
- Weekly state:
- Primary call:
- Blocked conclusions:
- Plan field updated:
- Next question:
- Owner/date:
```

Certificate này giúp team tránh cảm giác "tuần này bận nhiều nên chắc đã tiến bộ". Tiến bộ thật là khi loop có call, plan update và câu hỏi kế tiếp.

## Weekly operating checklist

| Check | Pass condition | Fail response |
| --- | --- | --- |
| Learning question locked | 1 hypothesis, 1 allowed decision | Cancel extra cells |
| Creative matrix named | filename, promise, motivation, proof | Rename before export |
| Build/event gate | core events verified in debug/logcat/dashboard where relevant | Do not launch product read |
| Store freeze | listing version named | Mark caveat or rerun |
| Privacy/data safety reviewed | SDK/data behavior changes checked | Add compliance owner |
| Launch setup documented | spend, platform, geo, window, cells | No scale call allowed |
| Readout bucketed | creative/store/product/economy/tracking | Meeting cannot close |
| Decision owner assigned | owner/date/artifact | No "monitor more" without metric |
| Learning log written | assumption changed + next question | Next sprint not allowed to start |

Quality chain:

`owner -> deadline -> artifact -> readiness gate -> campaign -> readout -> decision -> learning log`

Decision debt checklist:

| Debt signal | Meaning | Required fix |
| --- | --- | --- |
| "Monitor thêm" không có trigger | Meeting né quyết định | Ghi metric, date, owner và action trigger |
| Report có nhiều chart nhưng không có primary call | Readout chưa chuyển thành execution | Chọn 1 call: iterate, hold, fix, rerun, stop |
| Owner mơ hồ như "team" | Action sẽ trôi | Gán một người và artifact |
| Tuần sau mở test mới khi learning log chưa viết | Learning không tích lũy | Block next launch cho tới khi log xong |
| Gate fail nhưng vẫn launch | Cadence ưu tiên activity hơn evidence | Đổi tuần thành fix-readiness week |

## Real usecases đã đối chiếu nguồn

Các nguồn này được dùng như operating constraints cho cadence, không phải benchmark.

| Source | Observable facts | Cadence interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs tập trung vào privacy/consent strategies cho Google Mobile Ads Unity Plugin. | Nếu tuần này thay ad SDK, consent flow hoặc monetization behavior, cadence cần readiness slot trước launch. | Không biến privacy review thành lý do hoãn vô thời hạn; cần owner và deadline. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en) | Google Play yêu cầu developers có app trên closed, open hoặc production testing tracks hoàn thành Data safety form. | Store/compliance không nằm ngoài UA. Nếu SDK/data behavior đổi, weekly cadence phải check disclosure risk. | Không suy ra Data safety form tự đảm bảo compliance đúng; developer vẫn phải hiểu app/SDK behavior. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase events giúp hiểu user actions/system events/errors; Unity app có thể log events và dùng debug/logcat để verify nhanh. | Build/event validation nên có slot riêng trước launch, nhất là khi D1/tutorial/economy là success criteria. | Không suy ra dashboard có số là event taxonomy đúng; phải verify event names/parameters. |
| [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en) | Google Ads mô tả creative assets như ingredients cho App campaigns và có best practices cho text, image, video, HTML5. | Creative cadence nên có asset packet rõ format/naming/proof, không gửi file rời rạc sát giờ launch. | Không suy ra nhiều asset hơn luôn tốt với micro-budget; capacity và readable test vẫn giới hạn scope. |

### Weekly board readout

| Board area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Learning question | Có một hypothesis duy nhất không? | Nếu có nhiều câu hỏi, report sẽ khó gọi action | Không cần giải quyết mọi risk trong một tuần |
| Readiness gate | Creative/build/store/events/privacy có pass/caveat không? | Gate bảo vệ data quality | Gate không phải bureaucracy nếu có owner/deadline |
| Report date | D0/D1/revenue window có đủ chưa? | Timing quyết định metric nào được phép đọc | Đừng gọi D1 khi D1 chưa đủ window |
| Decision call | Có scale/iterate/hold/fix rõ không? | Meeting phải tạo next action | "Discussed" không phải decision |
| Learning log | Assumption changed có được ghi không? | Cadence tích lũy learning qua tuần | Calendar đẹp không chứng minh rhythm tốt |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Cadence chỉ ghi ngày launch. | **Correction:** Include learning question, readiness, launch, readout, decision, log. |
| **Mistake:** Mọi tuần đều cố tăng số creatives. | **Correction:** Scale cells theo capacity và measurement clarity. |
| **Mistake:** Review D1 quá sớm. | **Correction:** Split D0 acquisition readout và D1 retention decision. |
| **Mistake:** Store đổi giữa creative test. | **Correction:** Freeze store hoặc log caveat và rerun. |
| **Mistake:** Không có owner cho build/event QA. | **Correction:** Treat tracking as launch readiness, not cleanup task. |
| **Mistake:** Meeting kết thúc bằng "monitor thêm". | **Correction:** Ghi monitor metric, owner, deadline, trigger action. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Operating cadence` | Nhịp vận hành lặp lại để đóng learning loop |
| `Readiness gate` | Điều kiện pass trước khi launch/read data |
| `Decision meeting` | Buổi chốt scale/iterate/hold/fix từ readout |
| `Readout` | Bản đọc số có diagnosis và action |
| `Soft launch` | Launch nhỏ có kiểm soát để học |
| `Creative matrix` | Bảng quản lý hook/promise/proof/variant |
| `Owner` | Người chịu trách nhiệm artifact/action |
| `Scope guardrail` | Giới hạn scope để bảo vệ capacity và data quality |

## Lab output example

```md
Weekly UA cadence - Week 5

Learning question:
- Does calm/satisfying hook create better player fit than challenge hook?

Allowed decision:
- Iterate relax angle, fix challenge proof, or hold if tracking/store caveat appears.

Monday AM:
- UA/Product owner: lock hypothesis and metric bucket.
- Artifact: W5-decision-brief.md

Monday PM:
- Creative owner: export 2 relax variants + 1 challenge-proof variant.
- Artifact: creative-matrix-w5.csv

Tuesday:
- Tech owner: verify install, tutorial_start, level_3_start, ad_impression.
- Artifact: event-qa-w5.md

Wednesday:
- Store owner: freeze screenshot set v3.
- Artifact: store-proof-v3.md

Thu-Fri:
- UA owner: launch $120 Android test and monitor delivery.
- Artifact: campaign-setup-w5.md

Friday:
- UA owner: D0 acquisition/store readout only.

Next Monday:
- Team: D1 decision meeting.
- Output: one call + learning log + next question.

Weekly decision call:
- Primary call: reduce-scope launch, 2 cells only.
- Evidence: creative capacity is 2 cells, event QA scheduled, store v3 can freeze.
- Blocked conclusions: no D7 retention or economy verdict this week.
- Owner: UA owner for campaign, tech owner for event QA.
- Due date: Friday D0 readout, Monday D1 call.
- Plan update: budget cap, creative cells, tracking gate.

Weekly closure certificate:
- Weekly state:
- Primary call:
- Blocked conclusions:
- Plan field updated:
- Next question:
- Owner/date:
```

## Practical Lab

1. Viết một learning question cho tuần tới.
2. Chọn allowed decision: scale, iterate, hold, fix readiness, hoặc repeat.
3. Ghi capacity thật của creative/build/store/report.
4. Giảm scope đến khi từng workstream có owner/deadline/artifact.
5. Đặt readiness gate trước launch.
6. Tách D0 readout và D1/retention readout nếu window khác nhau.
7. Tạo one-call meeting template.
8. Bắt buộc learning log sau meeting.
9. Viết weekly capacity contract trước khi commit launch.
10. Viết scope cut rule: gate nào fail thì cắt scope nào, hoặc hold launch.
11. Viết decision debt checklist để meeting không kết thúc bằng "monitor thêm" mơ hồ.
12. Viết Weekly closure certificate.

Quality check: nếu một task không có owner/deadline/artifact, nó không được tính là part of cadence.

## Final UA Plan Update

Cập nhật field **nextAction**:

```md
Weekly operating cadence:
- This week's learning question:
- Weekly capacity contract:
- Allowed decision:
- Decision meeting date:
- One-call template:
- Learning log owner:
- Next question selected by:
- Weekly closure certificate:
```

Cập nhật field **budget**:

```md
Weekly scope guardrail:
- Max spend this week:
- Max creative cells:
- Scope cut rule:
- Hold rule if readiness gate fails:
- Retention readout date:
```

Cập nhật field **creativeMatrix**:

```md
Creative cadence:
- Variant count:
- Naming rule:
- Promise labels:
- Proof requirement:
- Export deadline:
```

Cập nhật field **tracking**:

```md
Readiness gate:
- Required events:
- Debug verification owner:
- Store/data safety review needed? yes/no
- Known caveats:
- Decision debt checklist:
```

## Checklist Focus

- [ ] Cadence có một learning question rõ.
- [ ] Weekly capacity contract giới hạn scope theo năng lực thật.
- [ ] Mỗi workstream có owner/deadline/artifact.
- [ ] Creative scope fit capacity thật.
- [ ] Build/event readiness gate trước launch.
- [ ] Store proof được freeze hoặc caveat rõ.
- [ ] Scope cut rule nói rõ gate fail thì cắt gì.
- [ ] Report date tách D0/D1 nếu cần.
- [ ] Decision meeting có one primary call.
- [ ] Decision meeting có owner, due date, blocked conclusions và plan update.
- [ ] Learning log bắt buộc sau decision.
- [ ] Weekly closure certificate xác nhận plan update và next question.
- [ ] Final UA Plan cập nhật nextAction, budget, creativeMatrix, tracking.

## Curated References

- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en)
