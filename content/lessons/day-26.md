---
day: 26
title: "SDK, privacy and store-risk readiness"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [ATT, SKAN, Event taxonomy]
artifact: "SDK readiness checklist"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **SDK readiness checklist** để quyết định paid traffic đã an toàn để chạy chưa về tracking, consent, store disclosure, event validation, revenue readout, performance risk và rollback.

Quyết định chính: **không mua traffic trước khi SDK purpose, consent flow, required events, store disclosure và rollback plan đủ rõ để report không bị vô nghĩa**.

Artifact này cập nhật field **tracking**, **successCriteria**, **killCriteria**, **budget**, **nextAction** và **learningLog** trong Final UA Plan.

Đầu ra cần có:

| Readiness area | Cần trả lời | Decision bị block nếu fail |
| --- | --- | --- |
| SDK inventory | SDK nào, owner nào, version nào, phục vụ decision gì? | Paid launch readiness |
| Event validation | Event nào phải pass trước spend? | Scale/kill/product diagnosis |
| Consent/privacy | User choice và region/platform logic ra sao? | Report confidence và store risk |
| Store disclosure | Data safety/privacy labels có khớp SDK thật không? | Store traffic và trust |
| Revenue readout | Ads/IAP revenue có reconcile được không? | `ROAS` rule |
| Rollback | Tắt SDK/placement/config thế nào nếu lỗi? | Scale và live ops |

## Why this matters

Với Unity dev, SDK không chỉ là plugin. Analytics SDK, ads SDK, attribution SDK, consent SDK và store disclosure có thể ảnh hưởng startup time, first-session UX, event quality, privacy risk, store review và campaign report.

Một SDK thêm vào "cho đủ stack" có thể làm test khó đọc hơn nếu nó không phục vụ decision nào. Nếu tracking sai, team sẽ blame creative/product bằng data bẩn. Nếu revenue event thiếu, `ROAS` rule vô dụng. Nếu consent prompt xuất hiện sai thời điểm, D1 có thể xấu vì UX friction, không phải vì UA. Nếu store Data safety/privacy disclosure không khớp SDK thực tế, launch risk tăng ngay cả khi game nhỏ.

SDK readiness là launch architecture. Nó nằm giữa engineering, product, UA và store ops.

## Core model: SDK = purpose + data + event + risk + rollback

Mỗi SDK phải trả lời 6 câu:

| Lens | Câu hỏi | Output cần có |
| --- | --- | --- |
| Purpose | SDK này hỗ trợ decision nào? | Decision purpose |
| Data | SDK chạm vào loại data/event nào? | Data inventory |
| Event | Event nào phải validate trước spend? | Required event QA |
| Consent/disclosure | User/store cần được thông báo gì? | Consent/store checklist |
| Risk | Performance, UX, attribution, revenue caveat là gì? | Risk note |
| Rollback | Nếu SDK/placement/event lỗi, tắt hoặc giảm risk thế nào? | Owner + rollback path |

Rule: nếu SDK không phục vụ decision của first paid test, hãy hỏi liệu nó có cần ở v1 không.

## SDK readiness checklist mẫu

| SDK area | Purpose | Data/event touched | Risk | Validation before spend | Rollback |
| --- | --- | --- | --- | --- | --- |
| Analytics | D1, tutorial, level proof | gameplay events, session context | missing/duplicate event | clean install QA, DebugView/event log | disable non-critical params |
| Ads | ad revenue, placement quality | impression, placement, revenue | consent, placement timing, revenue mismatch | test rewarded/interstitial once | disable placement via config |
| Attribution | campaign/source readout | install/source signal | delayed/aggregated reporting | campaign params map to report | use confidence caveat |
| Consent/privacy | user choice + compliance | consent status, region logic | first-session friction, disclosure mismatch | QA flow by region/platform | limited/non-personalized fallback |
| Store disclosure | Data safety/privacy labels | declared collection/sharing | store review/user trust | compare SDK list to store form | hold launch until updated |
| Remote config | rollback/control | placement flags, caps | config drift | default values QA | freeze config or revert |

Decision blocks:

| If this fails | Block this decision |
| --- | --- |
| Required install/event tracking missing | Do not read campaign quality |
| Tutorial/level events missing | Do not diagnose product retention |
| Ad revenue event unreliable | Do not use `ROAS` rule |
| Consent/store disclosure mismatch | Hold paid launch |
| No rollback path for ad placement | Do not scale spend |
| App version not attached to events | Do not compare cohorts across builds |

### Launch gate scoring

Checklist chỉ hữu ích khi nó tạo ra quyết định rõ: launch, launch with caveat, hold, hoặc remove/defer SDK. Hãy chấm từng readiness area bằng severity, không chỉ pass/fail.

| Severity | Ý nghĩa | Paid traffic decision | Ví dụ |
| --- | --- | --- | --- |
| P0 blocker | Làm report vô nghĩa hoặc tạo store/privacy risk lớn | Hold launch | missing `tutorial_complete`, Data safety không khớp SDK |
| P1 blocker | Không chặn smoke nhỏ nhưng chặn scale/kill verdict | Smoke only, no business conclusion | revenue event chưa reconcile, attribution caveat chưa viết |
| P2 caveat | Có thể launch nhỏ nếu learning question không phụ thuộc signal này | Launch with explicit caveat | minor event param thiếu nhưng primary event pass |
| P3 improvement | Không ảnh hưởng test đầu nhưng nên cleanup | Launch allowed | naming polish, dashboard label chưa đẹp |

Launch gate nên được viết như một release note:

```text
SDK launch gate
- Build:
- Paid test purpose:
- P0 blockers:
- P1 blockers:
- Caveats allowed:
- Decisions blocked:
- Rollback owner:
- Final verdict: ready / smoke only / hold launch / defer SDK
```

Quy tắc: nếu blocker ảnh hưởng trực tiếp tới learning question của paid test, không được "launch để xem sao". Bạn sẽ chỉ mua về dữ liệu không đọc được.

### Readiness evidence pack

Checklist chỉ đáng tin khi mỗi pass/fail có bằng chứng. Trước khi paid traffic chạy, gom bằng chứng thành một evidence pack đủ ngắn để team review trong 5 phút.

| Evidence item | Artifact cần có | Decision được mở khóa | Nếu thiếu |
| --- | --- | --- | --- |
| SDK inventory | SDK name, owner, version, purpose | biết SDK nào phục vụ test nào | không biết ai chịu trách nhiệm khi report bẩn |
| Required event QA | screenshot/log/debug row cho từng event | product/retention diagnosis | không đọc D1/tutorial/level proof |
| Revenue QA | ad/IAP event + revenue mapping sample | ROAS/ARPDAU caveat | không dùng economics rule |
| Consent flow proof | region/platform path + timing note | privacy/UX caveat | không biết retention drop do UX hay product |
| Store disclosure review | Data safety/privacy label checklist status | store traffic readiness | hold launch nếu mismatch |
| Rollback proof | remote config flag/release rollback owner | scale safety | không scale dù metric đẹp |
| Build/version proof | app version attached to events | cohort comparison | không so sánh build cũ/mới |

```text
Readiness evidence pack
- Build:
- Paid test purpose:
- SDK inventory status:
- Required event QA evidence:
- Revenue QA evidence:
- Consent/store disclosure evidence:
- Rollback evidence:
- Decisions unlocked:
- Decisions still blocked:
- Final readiness verdict:
```

Evidence pack tốt có thể kết luận "smoke only" hoặc "hold launch". Điều quan trọng là nó nói rõ **decision nào được mở khóa** và **decision nào vẫn bị khóa**, thay vì chỉ nói "SDK pass".

## Hero visual: SDK risk map

```text
![Hero visual: SDK risk map](content/assets/usecases/day-26-hero-diagram.png)Type: hero operating diagram.
Lesson section: Hero visual: SDK risk map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Unity release build
  |
  +-- Analytics SDK -----> gameplay events -----> product/retention readout
  |
  +-- Ads SDK -----------> impressions/revenue --> ROAS and placement readout
  |
  +-- Attribution layer -> source/campaign -----> acquisition readout
  |
  +-- Consent flow -----> user choice ----------> privacy + UX caveat
  |
  +-- Store disclosure -> Data safety/privacy --> launch/store risk
  |
  +-- Remote config ----> rollback controls ----> scale safety
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Each SDK connects to a report decision | SDK must have decision purpose | More SDKs means a better stack |
| Consent flow sits before/inside first session | Timing can affect D1 and report quality | Consent is always the cause of weak D1 |
| Store disclosure connects to SDK inventory | Store risk is part of launch readiness | This checklist replaces legal/platform review |
| Remote config connects to rollback | Scale requires a way to reduce risk quickly | Rollback solves bad tracking retroactively |

## Data visual: event validation board

```text
![Data visual: event validation board](content/assets/usecases/day-26-data-visual.png)Type: data visual/chart or decision board.
Lesson section: Data visual: event validation board.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Event | Trigger | Required params | Pass condition | Decision blocked if fail |
| --- | --- | --- | --- | --- |
| `first_open` | clean install open | `app_version`, `platform` | fires once | install quality read |
| `tutorial_start` | tutorial begins | `source`, `app_version` | fires once | consent/timing diagnosis |
| `tutorial_complete` | end tutorial | `duration_sec`, `attempt_count` | fires once | first-session proof |
| `level_complete` | win level | `level_id`, `duration_sec` | correct level id | level pacing read |
| `ad_impression` | ad shown | `placement`, `ad_type`, `ad_network` | no duplicate | ROAS/ad pacing read |
| `rewarded_ad_completed` | reward granted | `placement`, `reward_type` | maps to reward | reward economy read |
| `purchase_complete` | purchase success | `sku`, `price_usd`, `currency` | revenue maps correctly | IAP economics read |
| `consent_status_set` | consent choice resolved | `region`, `status` | before ads request | privacy/ad serving caveat |

Validation readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Each event has a trigger and blocked decision | Event QA is a decision gate, not a nice-to-have | Passing QA once guarantees all future builds |
| Revenue events have stricter params | `ROAS` requires revenue mapping, not only installs | Missing revenue means product has no revenue |
| App version is attached | Cohort reads need build context | App version fixes attribution delay |

## Hướng dẫn đọc số

| Pattern | Diagnosis | Next action |
| --- | --- | --- |
| Installs có, `first_open` thấp bất thường | tracking/open mismatch hoặc build issue | QA clean install before blaming traffic |
| `tutorial_start` drops after consent screen | consent timing/UX friction possible | review prompt timing and region logic |
| `tutorial_complete` missing | product diagnosis invalid | fix event before campaign decision |
| Revenue event missing | `ROAS` unreadable | do not use ROAS rule |
| Store Data safety not updated after SDK add | store/disclosure risk | hold paid traffic until reviewed |
| Duplicate ad impressions | monetization report polluted | fix event de-dupe before economics read |
| Attribution report delayed/aggregated | source read has caveat | use confidence language, avoid hard winner |
| Events lack `app_version` | build cohorts can mix | add version param before comparison |

Rule: nếu event là input cho scale/kill, event đó phải QA pass trước campaign.

Readiness verdict board:

| Verdict | Use when | Paid traffic decision | Required wording in report |
| --- | --- | --- | --- |
| Ready to launch small | Required events pass, disclosure reviewed, consent flow acceptable, rollback owner exists | Launch smallest paid test with capped budget | "Tracking/disclosure readiness passed for this build" |
| Launch with caveat | Core events pass but attribution delay, privacy-era aggregation, or minor non-blocking caveat remains | Launch only if the caveat does not affect the learning question | "Acquisition/source read is directional; product events are usable" |
| Hold for measurement | Install, tutorial, level, revenue, app version, or campaign params are missing/duplicated | Do not buy traffic yet | "Decision blocked by measurement issue, not by creative/product quality" |
| Hold for store/privacy | SDK inventory and store disclosure/consent behavior do not match | Do not send store traffic | "Launch blocked by disclosure/consent readiness" |
| Remove/defer SDK | SDK has no decision purpose in the first paid test or adds UX/performance risk | Remove from v1 test build or defer to later build | "SDK deferred because it does not support the current learning goal" |
| Limited technical smoke | Team needs to verify SDK behavior but not learn UA quality | Spend only enough for technical validation, not campaign judgment | "Smoke only; no scale/kill/ROAS conclusion allowed" |

Decision rule: separate **technical readiness** from **market signal**. If the SDK layer fails, the correct next action is engineering/store cleanup, not creative rewrite, product panic, or budget increase.

## Worked example: launch blocked by events

Team chuẩn bị chạy `$300` cho puzzle build.

| Check | Result | Risk | Decision |
| --- | --- | --- | --- |
| Attribution campaign params | pass | low | continue |
| `first_open` | pass release build | low | install read usable |
| `tutorial_complete` | missing on Android release build | D1 diagnosis weak | block product decision |
| `ad_impression` | duplicate after scene reload | ROAS polluted | block monetization read |
| Consent flow | appears before any value proof for all users | UX/retention risk | review timing |
| Store disclosure | analytics SDK added but Data safety not updated | store risk | update before paid launch |
| Remote config rollback | no ad placement flag | scale risk | add config gate |

Verdict: do not run paid traffic yet. Run a QA build, fix tutorial event and ad de-dupe, update disclosure, add placement rollback, then launch with tracking confidence.

Tradeoff: delaying campaign by one day is cheaper than buying traffic that cannot be interpreted.

### Incident and rollback memo

SDK readiness không kết thúc ở nút launch. Team cần biết khi report có dấu hiệu bẩn thì ai quyết định dừng, dừng cái gì, và kết luận nào bị khóa.

```text
SDK incident memo
- Symptom: ad_impression duplicates after scene reload.
- Severity: P1 blocker for ROAS and placement readout.
- Decisions blocked: ROAS, ARPDAU, ad pacing verdict.
- Decisions still allowed: acquisition CTR/CPI directional, tutorial event read if unaffected.
- Immediate action: disable affected placement through remote config.
- Owner: monetization/tech owner.
- Recheck: QA one rewarded + one interstitial after fix in build 0.6.2.
- Do not conclude: ad monetization is weak or traffic quality is bad.
```

Rollback trigger table:

| Trigger | Severity | Immediate rollback | Decision blocked until fixed |
| --- | --- | --- | --- |
| Consent prompt appears before first value and D1 drops after SDK build | P1/P0 depending region risk | move prompt timing or use limited fallback | retention verdict, paid scale |
| `tutorial_complete` missing/duplicated | P0 | hotfix event or hold build | product retention diagnosis |
| `ad_impression` duplicates | P1 | disable placement / cap ad calls | ROAS and ad pacing |
| Store disclosure mismatch after SDK add | P0 | hold paid traffic until update/review | launch/store traffic |
| Attribution params unmapped | P1 | fix campaign naming or accept directional caveat | source winner claim |
| Remote config default unsafe | P0/P1 | freeze config, ship safe defaults | scale |

Điểm quan trọng: rollback không sửa được dữ liệu đã bẩn. Nó chỉ ngăn bạn tiếp tục mua thêm dữ liệu bẩn.

## SDK readiness QA checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| SDK inventory | Every SDK has purpose, owner, version | Remove or justify SDK |
| Data disclosure | Data collected/shared is documented | Update store/privacy checklist |
| Consent flow | Region/platform behavior reviewed | Adjust timing/fallback |
| Event validation | Required events fire once with params | Block related decision |
| Revenue validation | ad/IAP revenue can be reconciled | Do not use ROAS |
| Performance smoke | startup/session not visibly harmed | Profile or delay SDK |
| Rollback plan | config/kill switch or release plan exists | Add rollback owner/path |
| Build versioning | report maps to app version | Add version param |

Quality chain:

```text
SDK purpose -> data risk -> consent/disclosure -> event validation -> report confidence -> paid traffic
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en) | Google Play asks developers to disclose whether/how apps collect, share and protect user data before users install. | SDK readiness must include data disclosure review before store traffic. | This lesson is not legal advice and does not replace Play policy review. |
| [AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob provides Unity-specific privacy/consent implementation guidance for ads. | Ads SDK readiness includes consent, ad event validation and placement timing. | Monetization SDK is not just a technical install. |
| [Firebase Analytics Unity events](https://firebase.google.com/docs/analytics/unity/events) | Firebase events help understand user actions, system events and errors; Unity apps can log recommended/custom events. | Product and retention reads depend on deliberate event taxonomy and QA. | Automatically logged events are enough for every UA decision. |
| [Android Attribution Reporting](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting matches sources/triggers and can send event-level or aggregatable reports. | Attribution signal may have limits, so report rules need confidence caveats. | Attribution report is perfect user-level proof. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | AdAttributionKit helps measure ad campaign success while maintaining user privacy. | iOS-aware plan should expect structured, privacy-preserving attribution signal. | Android readout can be copied directly to iOS without caveats. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Store disclosure, consent, events and attribution are separate surfaces | SDK readiness is cross-functional, not only engineering | One SDK install completes privacy readiness |
| Firebase event docs emphasize user actions/system events/errors | Event taxonomy should be tied to decisions | More events automatically mean better reports |
| Attribution sources mention privacy-preserving measurement | Source/campaign reads need caveats | Privacy-era attribution is useless |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Gắn SDK rồi mới nghĩ Data safety | Lập SDK purpose/data table trước paid launch |
| Dùng `ROAS` khi revenue event chưa validate | Block ROAS decisions until event/revenue QA pass |
| Over-log mọi thứ | Chỉ log event phục vụ decision |
| Không có rollback plan | Ghi cách disable SDK/placement/config nếu lỗi |
| Consent flow làm hỏng first session | Review timing and region logic before campaign |
| Quên app/build version trong events | Include `app_version` để đọc đúng cohort |
| Treat SDK docs as copy-paste policy answer | Use docs as inputs; still review your actual app behavior |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `ATT` | Apple App Tracking Transparency |
| `SKAN` | SKAdNetwork attribution context |
| `AdAttributionKit` | Apple privacy-era attribution framework |
| `Event taxonomy` | Danh sách event phục vụ decision |
| `Consent flow` | Luồng xin/ghi nhận lựa chọn user |
| `Data safety` | Store disclosure về dữ liệu |
| `Rollback` | Kế hoạch tắt/giảm risk nếu SDK lỗi |
| `Remote config` | Cấu hình từ xa để giảm rủi ro vận hành |
| `Attribution caveat` | Ghi chú giới hạn của source/campaign readout |

## Lab output example

```md
SDK readiness checklist - Puzzle soft launch

SDK: Analytics
- Purpose: D1 and first-session proof.
- Owner/version: Tech owner / Firebase Analytics Unity SDK version:
- Required events: first_open, tutorial_start, tutorial_complete, level_complete.
- Data risk: gameplay events and session context.
- Validation: clean install QA on Android release build.
- Decision blocked if: tutorial_complete missing.
- Rollback: disable optional params if event payload issue.

SDK: Ads
- Purpose: ad revenue and placement pacing.
- Required events: ad_impression, rewarded_ad_completed.
- Risk: consent timing, duplicate impressions.
- Validation: show one rewarded and one interstitial in QA build.
- Decision blocked if: ad_impression duplicates or revenue unmapped.
- Rollback: disable placement through remote config.

Store/Privacy:
- Data safety reviewed against SDK list: no/pass/fail.
- Consent flow QA by region/platform: no/pass/fail.
- Attribution caveat: source/campaign reads are directional.

Launch gate:
- P0 blockers:
- P1 blockers:
- Allowed caveats:
- Decisions blocked:
- Final verdict:

Readiness evidence pack:
- SDK inventory status:
- Required event QA evidence:
- Revenue QA evidence:
- Consent/store disclosure evidence:
- Rollback evidence:
- Decisions unlocked:
- Decisions still blocked:

Incident memo:
- Symptom:
- Severity:
- Rollback trigger:
- Owner:
- Recheck build/date:
- Do not conclude:
```

## Practical Lab

1. List SDKs in the first paid-test build.
2. For each SDK, write purpose, owner, version, data touched and rollback.
3. Choose required events for scale/kill decisions.
4. Write validation step for each event.
5. Mark which decisions are blocked if validation fails.
6. Compare SDK list with store disclosure/Data safety checklist.
7. Write one attribution caveat for Android and one for iOS.
8. Copy readiness board into Final UA Plan.
9. Score every issue as P0/P1/P2/P3.
10. Write one incident memo for the most likely SDK/report failure.
11. Write one rollback trigger tied to remote config or release action.
12. Build the Readiness evidence pack and mark which decisions are unlocked or still blocked.

Quality check: if an SDK has no decision purpose, question whether it belongs in v1.

## Final UA Plan Update

Cập nhật field **tracking**:

```md
SDK readiness:
- SDK list, owner and purpose:
- Required events:
- Validation status:
- Consent/store disclosure risks:
- Revenue readout risks:
- Attribution caveats:
- Rollback plan:
- Launch gate severity:
- Decisions blocked:
- Readiness evidence pack:
- Decisions unlocked:
- Incident memo:
```

Cập nhật field **killCriteria / successCriteria**:

```md
Decision blocks:
- Do not scale if:
- Do not use ROAS if:
- Do not diagnose retention if:
- Hold launch if:
```

Cập nhật field **nextAction / budget**:

```md
Readiness next action:
- Fix before spend:
- Owner:
- Review date:
- Spend stays capped until:
- Rollback trigger:
- Recheck build:
- Evidence required before launch:
```

Cập nhật field **learningLog**:

```md
Readiness note:
- SDK/event issue found:
- Decision blocked:
- Fix shipped in build:
- Recheck date:
- Decisions unlocked after fix:
- Decisions still blocked:
```

## Checklist Focus

- [ ] SDK purpose rõ.
- [ ] Readiness evidence pack đã viết.
- [ ] Data disclosure reviewed.
- [ ] Required events validated before spend.
- [ ] Decisions unlocked / still blocked được tách rõ.
- [ ] ROAS not used if revenue tracking missing.
- [ ] Consent timing checked against first-session UX.
- [ ] Rollback owner exists.
- [ ] App/build version included in required events.

## Curated References

- [Google Play Help - Provide information for Google Play's Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Google Developers - AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Firebase - Log events in Unity](https://firebase.google.com/docs/analytics/unity/events)
- [Privacy Sandbox - Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple Developer - AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
