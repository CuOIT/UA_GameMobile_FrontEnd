---
day: 14
title: "Event taxonomy for Unity games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Event taxonomy, Attribution, Cohort]
artifact: "Unity event taxonomy v1"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Unity event taxonomy v1** cho micro soft-launch: 8-12 event tối thiểu đủ để đọc acquisition quality, first-session proof, retention risk, ad pacing và light IAP signal.

Quyết định chính: **event nào đáng instrument ngay trong v1, event nào phải bỏ khỏi v1 dù dev thấy dễ log**. Với budget `$100-500`, taxonomy không cần trả lời mọi câu hỏi BI. Nó cần trả lời câu hỏi vận hành: ad promise có dẫn đúng người vào game, store proof có khớp first session, user drop ở đâu, và có nên tiếp tục mua traffic không.

Artifact này cập nhật field **tracking** trong Final UA Plan, đồng thời làm checklist chuẩn bị cho SDK/privacy pass ở Week 4.

## Why this matters

Unity dev thường log theo nơi code dễ bắt hook: button click, scene loaded, menu opened. Nhưng UA cần log theo nơi quyết định bị mù. Khi `D1` thấp, bạn không cần biết user đã bấm bao nhiêu UI nhỏ. Bạn cần biết họ có mở game, bắt đầu tutorial, hoàn thành loop đầu, gặp ad sớm, dùng hint, quay lại ngày sau hay không.

Nếu taxonomy quá mỏng, paid test chỉ tạo ra cảm giác "game không ổn" mà không biết sửa gì. Nếu taxonomy quá dày, team mất thời gian QA, dashboard nhiễu, privacy/data disclosure phức tạp hơn. Bài này dạy cách chọn lớp event đủ nhỏ để ship nhanh nhưng đủ sâu để ra quyết định.

Rule thực dụng: event v1 chỉ được vào nếu nó giúp một người trong team nói được câu "nếu số này xấu, tôi sẽ sửa phần này".

## Core model: decision-backward taxonomy

Đừng bắt đầu từ code hook. Bắt đầu từ quyết định:

`UA decision -> funnel question -> event -> minimum parameters -> QA proof -> dashboard readout -> next action`

Ví dụ:

- UA decision: có nên mua thêm traffic không?
- Funnel question: user từ ad/store có hoàn thành first-session proof không?
- Event: `first_open`, `tutorial_start`, `tutorial_complete`, `level_1_complete`, `session_start`.
- Minimum parameters: `app_version`, `platform`, `country`, `session_index`, `days_since_install`.
- QA proof: tester đi qua journey 5 phút và thấy event đúng thứ tự.
- Dashboard readout: cohort theo install date/source có drop ở stage nào.
- Next action: sửa store promise, tutorial, level pacing hoặc dừng campaign.

Một taxonomy tốt không phải là danh sách event dài. Nó là bản đồ những câu hỏi bạn thật sự dám dùng để ra quyết định trong soft-launch.

## Event taxonomy v1 mẫu

| Funnel question | Event | Minimum parameters | Decision supported | Owner |
| --- | --- | --- | --- | --- |
| User có mở game sau install không? | `first_open` | `app_version`, `platform`, `country` | Kiểm install-to-open mismatch hoặc build/store issue | Engineering |
| Đây là session thứ mấy? | `session_start` | `session_index`, `days_since_install`, `source_group` | Đọc retention và phân biệt same-day replay với return | Analytics |
| User có vào onboarding không? | `tutorial_start` | `entry_source`, `session_index` | Drop trước value proof | Product |
| User có hiểu onboarding không? | `tutorial_complete` | `duration_sec`, `attempt_count` | Tutorial clarity và time-to-fun | Product |
| Core loop có bắt đầu không? | `level_start` | `level_id`, `session_index` | Level pacing và content exposure | Design |
| User có thấy win/clear proof không? | `level_complete` | `level_id`, `duration_sec`, `moves_used` | First-session proof và difficulty | Design |
| User kẹt vì gì? | `level_fail` | `level_id`, `fail_reason` | Difficulty/friction diagnosis | Design |
| Hint có cứu friction không? | `hint_used` | `level_id`, `hint_type` | Hint economy và fail recovery | Design |
| Rewarded ad có value không? | `rewarded_ad_completed` | `placement`, `reward_type`, `session_time_sec` | Ads fit với player intent | Monetization |
| Interstitial có chen quá sớm không? | `interstitial_shown` | `placement`, `session_time_sec`, `session_index` | Ads pacing risk | Monetization |
| IAP có signal sớm không? | `purchase_complete` | `sku`, `price_usd`, `session_index` | Light IAP signal, không phải LTV proof | Monetization |

Không thêm vào v1 nếu chưa có quyết định rõ: `tile_clicked`, `settings_opened`, `skin_previewed`, `daily_popup_seen`, `button_hovered`. Những event này có thể hữu ích sau này, nhưng trong paid test đầu tiên chúng dễ làm dashboard rối hơn là giúp hành động.

### Event decision contract

Mỗi event trong v1 cần có một "quyền quyết định" rõ ràng. Nếu event chỉ tồn tại để team thấy dashboard đầy hơn, nó chưa đủ quyền vào v1. Contract bên dưới buộc team nối event với quyết định, evidence và hành động cụ thể.

| Event | Decision owner | Decision allowed when QA passes | Decision blocked until QA passes | Minimum proof |
| --- | --- | --- | --- | --- |
| `first_open` | Engineering / Analytics | Xác nhận install có biến thành open theo build/platform không | Không kết luận creative/store fail nếu open thấp | Event fire một lần sau fresh install, có `app_version`, `platform`, `country` |
| `tutorial_complete` | Product | Đánh giá ad/store promise có được chứng minh trong first session không | Không kill campaign vì "user không hiểu game" | `tutorial_start -> tutorial_complete` đúng thứ tự, có `duration_sec`, `attempt_count` |
| `level_complete` | Design | Đọc first-win proof và độ khó level 1-3 | Không chỉnh difficulty dựa vào completion rate nếu thiếu `level_id` | `level_start -> level_complete/level_fail` không double-fire |
| `rewarded_ad_completed` | Monetization | Đọc rewarded ad có fit với intent hay đang chen sai moment | Không kết luận ads tốt/xấu nếu thiếu placement/time | Có `placement`, `reward_type`, `session_time_sec`, không fire khi ad fail |
| `session_start` | Analytics | Đọc return/D1 direction theo install cohort | Không nói retention yếu nếu session index/days_since_install sai | `session_index` tăng đúng, `days_since_install` đúng theo cohort |

Thang authority nên dùng trong tracking sheet:

| Status | Ý nghĩa | Có được dùng cho UA decision không? |
| --- | --- | --- |
| Not instrumented | Event chưa có trong build | Không |
| Logged only | Event có log nhưng chưa QA journey | Không |
| QA pass | Event đúng trigger/order/parameter trong test build | Có điều kiện, chỉ cho readout nhỏ |
| Dashboard mapped | Event đã vào funnel/cohort chart đúng tên | Có, nếu chart trả lời đúng câu hỏi |
| Decision-approved | Owner đã ký event, readout và action boundary | Có, dùng được trong success/kill criteria |

Rule vận hành: metric chỉ được xuất hiện trong `successCriteria` hoặc `killCriteria` khi event nguồn đạt `Decision-approved`. Nếu chưa đạt, metric đó vẫn có thể theo dõi nội bộ nhưng không được dùng để scale/kill campaign.

## Sơ đồ decision-backward tracking

```text
[VISUAL PLACEHOLDER: Third-party image request - Decision-backward tracking flow]
Type: process flow / decision map.
Lesson section: Sơ đồ decision-backward tracking.
Visual brief: create a left-to-right flow showing how a UA decision becomes a funnel question, then an event, parameters, QA proof, dashboard readout, and next action.
Teaching job: help a Unity dev stop logging from code convenience and start logging from launch decisions.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Layer | Câu hỏi cần trả lời | Output phải có | Nếu thiếu layer này |
| --- | --- | --- | --- |
| Decision | Team đang định scale, iterate hay kill? | 1 quyết định cụ thể | Event trở thành "log cho có" |
| Funnel question | Drop có thể nằm ở ad/store/session nào? | 1 câu hỏi đo được | Dashboard không dẫn tới sửa gì |
| Event | Hành vi nào chứng minh câu hỏi? | Event name stable | Metric bị proxy quá xa |
| Parameter | Cần segment theo gì để không đọc sai? | 2-4 parameter thật cần | Không phân biệt source/build/cohort |
| QA proof | Event có fire đúng trong build không? | Test journey + expected order | Paid traffic tạo data rác |
| Readout | Dashboard có trả lời next action không? | Funnel/cohort/chart rõ | Số đẹp nhưng không vận hành được |

**Inspect:** đọc từ trái sang phải. Mỗi event phải trace ngược về một quyết định, không chỉ về một vị trí code.

**Conclude:** nếu một event không có `Decision` hoặc `Readout`, đưa nó ra backlog thay vì đưa vào v1.

**Do not infer:** bảng này không nói game chỉ được có 11 event mãi mãi; nó nói paid test đầu tiên cần tối giản để học nhanh.

## Event coverage heatmap

```text
[VISUAL PLACEHOLDER: Third-party image request - Event coverage heatmap]
Type: hero operating diagram.
Lesson section: Event coverage heatmap.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Stage | Required coverage | Green signal | Yellow signal | Red signal |
| --- | --- | --- | --- | --- |
| Open | `first_open`, `session_start` | Có app/source/build context | Có event nhưng thiếu source/build | Không phân biệt install và open |
| Promise proof | `tutorial_start`, `tutorial_complete` | Đo được start/completion/duration | Có complete nhưng thiếu duration | Chỉ biết user "đã vào game" |
| Core loop | `level_start`, `level_complete`, `level_fail` | Đo được level 1-3 và fail reason | Có complete rate nhưng thiếu fail reason | Không biết first-session proof có xảy ra |
| Friction relief | `hint_used` | Đo hint theo level và type | Có hint count tổng | Không biết hint cứu hay phá economy |
| Monetization | `rewarded_ad_completed`, `interstitial_shown`, `purchase_complete` | Có placement/time/session | Có revenue nhưng thiếu placement | Không biết monetization có phá retention |
| Privacy/QA | QA journey, no PII, consent note | Event pass trong build test | QA thủ công chưa lưu bằng chứng | Chạy paid traffic trước khi event đáng tin |

**Inspect:** heatmap không chấm theo "nhiều event", mà theo khả năng đọc stage.

**Conclude:** stage nào đỏ thì quyết định liên quan stage đó phải bị khóa trước khi tiêu tiền.

**Do not infer:** green không có nghĩa product tốt; nó chỉ có nghĩa measurement đủ sạch để đọc product.

## Hướng dẫn đọc số

| Metric pattern | Event cần tin | Diagnosis hợp lý | Next action |
| --- | --- | --- | --- |
| Installs có, `first_open` thấp | `first_open` QA pass, `app_version`, `platform` | Store/install/open mismatch, build issue hoặc tracking issue | Kiểm build, store path, SDK init trước khi sửa creative |
| `tutorial_start` cao, `tutorial_complete` thấp | `tutorial_start`, `tutorial_complete`, `duration_sec` | Tutorial dài, khó, hoặc không chứng minh promise | Rút tutorial, đưa first win sớm hơn, test lại nội bộ |
| `level_1_complete` ổn, D1 thấp | `session_start`, `days_since_install`, `level_complete` | First session hiểu được nhưng chưa có lý do quay lại | Thêm goal/progression sớm, calendar/reward không quá nặng |
| Rewarded watch có, D1 giảm | `rewarded_ad_completed`, placement/session context | Reward hoặc placement đang kéo hành vi sai | Đổi reward, delay placement, đọc cohort theo exposure |
| Revenue tool và event không khớp | `purchase_complete`, SKU, price, source revenue | SKU mapping/window/currency issue | QA revenue mapping trước khi tính LTV |

Đừng đọc từng metric riêng lẻ. Hãy đọc theo chuỗi:

`ad promise -> store proof -> first_open -> tutorial_complete -> level_1_complete -> session_start D1 -> monetization exposure`

Nếu chuỗi gãy ở đâu, sửa stage đó trước. Nếu chain đo chưa sạch, không kết luận product/creative.

### Event cutline ledger

Khi team tranh luận "event này có nên vào v1 không?", dùng cutline này thay vì cảm giác. Event được vào v1 khi nó có owner, câu hỏi, action và QA proof rõ. Event bị đưa sang backlog nếu chỉ làm dashboard trông đầy hơn.

| Candidate event | Decision it supports | Include in v1? | Reason | Backlog condition |
| --- | --- | --- | --- | --- |
| `first_open` | Install có biến thành open không | Yes | Gate đầu tiên của paid traffic | Không backlog |
| `tutorial_complete` | First-session proof có được thấy không | Yes | Gắn trực tiếp với ad/store promise | Không backlog |
| `level_3_complete` | Early depth có đủ không | Maybe | Hữu ích nếu level 1 quá dễ | Chỉ thêm khi level 1/2 không đủ phân biệt |
| `tile_clicked` | User tương tác từng ô ra sao | No | Quá gần implementation, khó ra UA action | Thêm sau khi cần level-design diagnosis sâu |
| `skin_previewed` | Cosmetic interest có không | No | Chưa liên quan paid test đầu nếu economy chưa test | Thêm khi có economy/storefront experiment |
| `interstitial_shown` | Ads có phá D1 không | Yes, if interstitial exists | Placement/time ảnh hưởng retention | Nếu build chưa có interstitial thì bỏ |

Launch gate: nếu một event có trong success/kill criteria nhưng chưa pass QA journey, criteria đó phải bị khóa. Ví dụ, không được dùng `tutorial_complete` để kill campaign nếu event đang fire trùng khi scene reload.

## Worked example: taxonomy cho Calming Hex Puzzle

Team chạy internal build cho một puzzle game thư giãn. Họ muốn biết có nên mở campaign Android nhỏ `$150` không.

Taxonomy hiện tại:

| Có event | Thiếu gì | Rủi ro đọc sai | Fix trước paid test |
| --- | --- | --- | --- |
| `first_open` | `app_version` | Không biết cohort thuộc build nào | Thêm build context |
| `level_start`, `level_complete` | `tutorial_start`, `tutorial_complete` | Không biết user drop trước level hay trong tutorial | Thêm onboarding events |
| `rewarded_ad_completed` | `placement`, `session_time_sec` | Không biết reward ad có xuất hiện quá sớm không | Thêm placement/time |
| `purchase_complete` | QA revenue mapping | Có thể tính sai light IAP signal | Test SKU sandbox |
| Không có `session_start` | `days_since_install` | Không đọc được D1 cohort đúng | Thêm session event |

Diagnosis: chưa nên chạy paid traffic. Game có thể đã playable, nhưng tracking chưa đủ để biết paid user gãy ở đâu. Một campaign nhỏ lúc này có thể chỉ tạo data không dùng được.

Verdict: dành 1 ngày instrument và QA 11 event v1, chạy 10-20 internal journeys, sau đó mới mở micro campaign. Tradeoff này đáng làm vì nếu paid test fail, team còn biết sửa creative/store/onboarding hay monetization.

### Second-pass measurement read

Đọc taxonomy như một hệ thống chống tự lừa:

1. **Có decision owner không?** Nếu không ai chịu trách nhiệm sửa khi số xấu, event đó chỉ tạo noise.
2. **Có parameter tối thiểu không?** Thiếu `app_version`, `source_group` hoặc `session_index` sẽ làm cohort lẫn nhau.
3. **Có QA evidence không?** Event valid trong dashboard chưa đủ; cần thấy đúng thứ tự trong journey thật.
4. **Có action boundary không?** Số xấu phải chỉ ra sửa ad/store/tutorial/level/ad pacing, không chỉ nói "game fail".

Decision memo cho ví dụ:

```md
Tracking decision memo
- Do not launch paid traffic today.
- Required before launch: add tutorial_start, tutorial_complete, session_start, app_version, placement/session_time parameters.
- QA proof: 10-20 internal journeys with saved event stream screenshots.
- Locked criteria: D1, tutorial_complete, rewarded_ad_completed cannot be used for decisions until QA passes.
- First paid readout: open -> tutorial_complete -> level_1_complete -> D1 direction, segmented by app_version/source_group.
```

### Event QA acceptance memo

Khi taxonomy đã có đủ event, vẫn chưa nên xem là xong. Cần một memo chấp nhận QA để phân biệt "đã log được" với "đủ sạch để dùng tiền thật".

```md
Event QA acceptance - Calming Hex Puzzle

Decision allowed after this pass:
- Start a $150 Android micro campaign only if first_open, session_start, tutorial_complete, level_complete and rewarded_ad_completed are Decision-approved.
- Read first paid cohort by app_version/source_group, but only as directional signal.

Events decision-approved:
- first_open: fresh install fires once, app_version/platform/country present.
- session_start: session_index and days_since_install verified across same-day replay and next-day simulation.
- tutorial_complete: order and duration_sec verified in 20 internal journeys.
- level_complete: level_id, duration_sec, moves_used verified for levels 1-3.

Events still blocked:
- purchase_complete: sandbox SKU maps inconsistently; do not use IAP signal in launch readout.
- interstitial_shown: placement timing not final; do not judge ad pacing yet.

Launch gate:
- Paid traffic can start only with a readout that excludes blocked events.
- Success/kill criteria must name which events are Decision-approved.
```

Điểm quan trọng: memo này không cần dài, nhưng phải ghi rõ quyết định nào được phép, quyết định nào bị khóa. Đây là lớp bảo vệ giúp team không dùng data bẩn để tự thuyết phục mình rằng product fail hoặc campaign fail.

## Unity implementation checklist

| Check | Pass condition |
| --- | --- |
| Naming | `snake_case`, ổn định qua build, không đặt theo tên scene/button tạm thời |
| Registration | Custom event được tạo/kiểm trong analytics dashboard hoặc pipeline tương ứng |
| Parameters | 2-4 parameter có decision value, không gửi PII |
| Versioning | Có `app_version` hoặc build context ở event/cấu hình chung |
| Trigger point | Event fire ở một hành vi thật, không fire trùng khi scene reload |
| QA journey | Tester có script 5 phút để trigger event theo thứ tự expected |
| Dashboard mapping | Mỗi event map tới một funnel/cohort/chart hoặc decision note |
| Privacy review | Parameter không mâu thuẫn Data safety/consent policy |

Pseudo-flow cho dev:

```text
For each event in taxonomy_v1:
  define purpose
  define trigger point
  define minimum parameters
  run QA journey
  compare expected order vs observed order
  only then use metric for UA decision
```

Quality chain: `event purpose -> implementation point -> QA proof -> dashboard readout -> UA decision`.

### Decision-approved event checklist

| Gate | Câu hỏi kiểm tra | Fail thì làm gì |
| --- | --- | --- |
| Purpose gate | Event này trả lời quyết định nào trong soft-launch? | Đưa ra backlog nếu không có decision owner |
| Trigger gate | Event fire ở đúng hành vi thật, không phụ thuộc scene reload? | Sửa trigger point trước khi QA dashboard |
| Parameter gate | Parameter đủ để phân đoạn build/source/cohort không? | Thêm parameter tối thiểu, không thêm PII |
| Order gate | Event order trong 5 phút đầu có khớp journey không? | Chạy lại internal journey, sửa double-fire/missing event |
| Readout gate | Dashboard có biến event thành funnel/cohort/action được không? | Chưa dùng trong paid readout |
| Authority gate | Owner đã ghi allowed/blocked decision chưa? | Không đưa metric vào success/kill criteria |

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Unity Analytics Custom Events](https://docs.unity.com/en-us/analytics/events/custom-event) | Unity yêu cầu custom event có naming hợp lệ và được tạo trong dashboard/Event Manager flow. | Event taxonomy cần naming ổn định, dashboard-aware, không chỉ là string rải trong code. | Không suy ra mọi event nên custom; standard events và tool-specific events vẫn có chỗ dùng. |
| [Unity Analytics Event Manager](https://docs.unity.com/en-us/analytics/events/event-manager) | Event Manager cho phép xem standard/custom events và trạng thái valid/invalid gần đây. | QA taxonomy phải kiểm event valid/invalid, không chỉ kiểm log console trong Unity Editor. | Không suy ra event valid là metric đủ để scale; valid chỉ là điều kiện measurement. |
| [Firebase Analytics Log events](https://firebase.google.com/docs/analytics/events) | Firebase mô tả events là cách hiểu user actions/system behavior và có auto/recommended/custom events. | Nếu dùng Firebase/GA4 song song, taxonomy nên ưu tiên event recommended/standard khi khớp và chỉ custom khi cần decision riêng. | Không copy nguyên danh sách recommended events vào game nếu không phục vụ soft-launch decision. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Play Console yêu cầu khai báo data collection/sharing phù hợp. | Event parameters càng chi tiết càng cần cân nhắc privacy/disclosure; v1 nên tránh data không cần thiết. | Không biến Data safety thành việc cuối cùng; nó ảnh hưởng thiết kế taxonomy từ đầu. |

Screenshot/readout thay thế bằng QA evidence table:

| QA step | Expected event order | Evidence to save |
| --- | --- | --- |
| Fresh install, open game | `first_open` -> `session_start` | Screenshot Event Manager/Test dashboard có timestamp |
| Play tutorial to first win | `tutorial_start` -> `tutorial_complete` -> `level_start` -> `level_complete` | Row export hoặc screenshot event stream |
| Use hint and watch rewarded | `hint_used` -> `rewarded_ad_completed` | Placement/reward_type visible |
| Start next day/session simulation | `session_start(days_since_install=1)` | Cohort/session parameter verified |

**Inspect:** source official nói event phải được quản lý và kiểm trạng thái, không chỉ gửi string từ code.

**Conclude:** taxonomy v1 nên đi kèm QA evidence table trước paid traffic.

**Do not infer:** các nguồn không đưa benchmark retention/CPI; chúng chỉ hỗ trợ cách thiết kế và kiểm event.

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Log mọi click vì "sau này chắc cần". | Chỉ đưa vào v1 event có decision owner và next action rõ. |
| Đặt event theo scene/button hiện tại. | Đặt theo hành vi ổn định: `level_complete`, `hint_used`, `rewarded_ad_completed`. |
| Thiếu `app_version` hoặc build context. | Gắn version để không trộn cohort giữa build khác nhau. |
| Dùng parameter quá chi tiết. | Giữ parameter tối thiểu, tránh PII và giảm Data safety risk. |
| Tin số dashboard trước khi QA journey. | Paid decision chỉ được phép sau khi event order và parameter pass QA. |
| Đọc monetization mà thiếu placement/time. | Ads/IAP event phải có context để biết revenue đến từ moment nào trong session. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Event taxonomy` | Tên chuẩn cho hệ event đo lường có cấu trúc |
| `Custom event` | Event tự định nghĩa khi standard/recommended event không đủ |
| `Parameter` | Thuộc tính đi kèm event để segment/diagnose |
| `Cohort` | Nhóm user theo install date/source/build để đọc retention |
| `QA` | Kiểm event fire đúng trước khi tin dashboard |
| `PII` | Personally identifiable information, cần tránh trong event v1 |
| `Event Manager` | Surface để quản lý/kiểm trạng thái event trong analytics tool |

## Lab output example

```md
Unity event taxonomy v1 - Calming Hex Puzzle

Primary decisions:
- Ad/store promise có tạo first-session proof không?
- Tutorial có gây drop trước level 1 không?
- Ads có chen quá sớm và ảnh hưởng D1 không?

Required events:
1. first_open(app_version, platform, country)
2. session_start(session_index, days_since_install, source_group)
3. tutorial_start(entry_source, session_index)
4. tutorial_complete(duration_sec, attempt_count)
5. level_start(level_id, session_index)
6. level_complete(level_id, duration_sec, moves_used)
7. level_fail(level_id, fail_reason)
8. hint_used(level_id, hint_type)
9. rewarded_ad_completed(placement, reward_type, session_time_sec)
10. interstitial_shown(placement, session_time_sec, session_index)
11. purchase_complete(sku, price_usd, session_index)

Excluded from v1:
- tile_clicked: no immediate UA decision
- menu_opened: not needed for first paid test
- skin_previewed: cosmetic intent can wait until economy test

QA plan:
- 10 fresh install journeys on Android internal build.
- Save event stream screenshots for open, tutorial, level, ad, purchase sandbox.
- Do not launch paid traffic until event order and parameters pass.

Event authority:
- Decision-approved now: first_open, session_start, tutorial_start, tutorial_complete, level_start, level_complete, level_fail, hint_used, rewarded_ad_completed.
- Logged only: interstitial_shown, because placement timing is not final.
- QA blocked: purchase_complete, because sandbox SKU mapping needs one more pass.

Blocked decisions:
- Do not judge IAP intent in the first paid readout.
- Do not tune interstitial pacing from paid users until placement/time parameters are verified.
- Do not use D1 as kill criteria unless session_start and days_since_install remain clean in the paid cohort.

Measurement release certificate:
- Decision-approved events:
- Logged-only events:
- QA-blocked events:
- Decisions unlocked:
- Decisions still blocked:
- Launch gate owner/date:
```

## Practical Lab

1. Viết 5 UA decisions bạn muốn đọc trong soft-launch.
2. Với mỗi decision, viết funnel question tương ứng.
3. Chọn 8-12 event v1, mỗi event có owner, trigger point và minimum parameters.
4. Gạch bỏ ít nhất 5 event "nice to have" và ghi lý do chưa đưa vào v1.
5. Viết QA journey 5 phút đầu game: expected event order và evidence cần lưu.
6. Gán authority status cho từng event: Not instrumented, Logged only, QA pass, Dashboard mapped hoặc Decision-approved.
7. Viết 3 quyết định bị khóa nếu event chưa sạch. Ví dụ: "không dùng D1 để kill campaign nếu `session_start` chưa QA".
8. Copy taxonomy, authority status và blocked decisions vào Final UA Plan.
9. Viết Measurement release certificate trước paid launch.

## Final UA Plan Update

Cập nhật field **tracking**:

```md
Tracking / Event taxonomy v1
- Primary decisions:
- Required events:
- Minimum parameters:
- Events intentionally excluded:
- QA journey:
- Dashboard readout:
- Event authority status:
- Decision-approved metrics:
- Blocked decisions while QA is incomplete:
- QA acceptance owner/date:
- Privacy/Data safety notes:
- Launch gate: paid traffic starts only after event QA passes.
- Measurement release certificate:
```

Liên kết với field **successCriteria** và **killCriteria**: chỉ dùng metric làm criteria nếu event tạo ra metric đó đã pass QA.

## Checklist Focus

- [ ] Taxonomy v1 có 8-12 event, không phải 30+ event.
- [ ] Mỗi event trace được tới một UA/product decision.
- [ ] Mỗi parameter có lý do segment/diagnosis rõ.
- [ ] Không gửi PII hoặc parameter không cần thiết.
- [ ] Event order đã QA trong journey 5 phút.
- [ ] Mỗi event có authority status rõ, không lẫn "logged" với "decision-approved".
- [ ] Success/kill criteria chỉ dùng metric từ event đã decision-approved.
- [ ] Blocked decisions đã ghi rõ để team không over-read data bẩn.
- [ ] Tracking field trong Final UA Plan đã cập nhật.
- [ ] Paid traffic bị khóa nếu event QA chưa pass.
- [ ] Measurement release certificate tách decisions unlocked và still blocked.

## Curated References

- [Unity Analytics: Create a custom event](https://docs.unity.com/en-us/analytics/events/custom-event)
- [Unity Analytics: Event Manager](https://docs.unity.com/en-us/analytics/events/event-manager)
- [Firebase Analytics: Log events](https://firebase.google.com/docs/analytics/events)
- [Google Analytics recommended events](https://developers.google.com/analytics/devguides/collection/ga4/reference/events)
- [Google Play Console: Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
