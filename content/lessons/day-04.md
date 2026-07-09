---
day: 4
title: "Funnel from impression to retained player"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Funnel, IPM, CVR]
artifact: "Funnel leak map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Funnel leak map**: bản đồ chỉ ra mắt xích nào trong phễu đang rò rỉ mạnh nhất, evidence nào đủ tin, caveat nào còn mù, và action nào nên làm trước khi tăng budget.

Quyết định chính: **không sửa creative, store, build, tutorial, product hay budget bằng cảm tính; sửa mắt xích có evidence rõ nhất trong funnel**.

Artifact này cập nhật field **metricTargets**, **tracking**, **successCriteria** và **nextAction** trong Final UA Plan.

## Why this matters

UA hiếm khi "fail toàn bộ" ngay từ đầu. Nó thường rò ở một link cụ thể:

- ad không kéo đúng attention
- store không chứng minh ad promise
- install xong nhưng app mở chậm/crash
- tutorial làm player rời trước khi thấy value
- first session có win nhưng không có lý do quay lại

Với budget `$100-500`, bạn không đủ tiền để sửa mọi thứ cùng lúc. Funnel leak map giúp team Unity nói rõ: "leak sớm nhất nằm ở đâu, ai sở hữu nó, và sửa gì trước".

Nếu `CTR` yếu, đừng sửa D1 trước. Nếu store `CVR` thấp, đừng sản xuất thêm 10 video. Nếu `first_open` thấp, kiểm tra crash/startup/build trước khi blame audience.

## Core model: promise chain funnel

Đọc funnel như chuỗi lời hứa:

`ad promise -> store proof -> install/open -> first-session proof -> return signal -> next action`

| Funnel link | Main metric | Câu hỏi vận hành | Owner thường sửa |
| --- | --- | --- | --- |
| Impression -> Click | `CTR`, hook rate | Ad có kéo attention đúng motivation không? | Creative/UA |
| Click -> Store/Install | store `CVR`, `IPM` | Store có chứng minh ad promise không? | Store/ASO |
| Install -> First open | `first_open / installs`, crash/startup | Game có mở nhanh và ổn không? | Engineering |
| First open -> Tutorial complete | `tutorial_complete / first_open` | Player có chạm được core value không? | Product/design |
| Tutorial -> D1 return | D1 cohort, return session | Game có lý do quay lại không? | Product/retention |
| D1 -> monetization signal | ads/IAP events, early ROAS direction | Monetization có phá experience hoặc quá yếu không? | Monetization/product |

Confidence ladder cho funnel leak:

| Confidence level | Evidence pattern | Decision allowed | Decision not allowed yet |
| --- | --- | --- | --- |
| Low | 1 metric xấu, sample nhỏ, tracking chưa QA | Ghi hypothesis và giữ budget thấp | Không rewrite product hoặc scale |
| Medium | 2 metric cùng chỉ vào một link, event QA pass | Sửa một surface nhỏ trong link đó | Không thay nhiều link cùng lúc |
| High | Same leak lặp lại qua 2 creative/store cells hoặc 2 build cohorts | Lock diagnosis và tạo treatment rõ owner | Không gọi toàn bộ game fail |
| Contradictory | Top-funnel tốt nhưng downstream xấu, hoặc report giữa network/analytics lệch | Reconcile source/window/build trước | Không chọn winner/loser |

Quy tắc thực hành: nếu confidence chưa đạt `Medium`, action tốt nhất thường là **đo lại sạch hơn**, không phải **sửa nhiều hơn**. Với micro budget, một lần sửa sai link có thể đốt hết learning window.

### Leak priority score

Khi nhiều link đều có vẻ yếu, đừng chọn link gây cảm xúc mạnh nhất. Chấm điểm leak bằng 4 câu hỏi:

| Score component | Câu hỏi | Điểm cao khi | Điểm thấp khi |
| --- | --- | --- | --- |
| Earliest trustworthy link | Leak này xuất hiện sớm nhất trong funnel chưa? | Leak nằm trước các drop khác và tracking sạch | Leak nằm sau một drop lớn chưa được xử lý |
| Evidence quality | Có đủ metric/source để tin không? | 2 nguồn hoặc 2 metric cùng chỉ vào một link | Chỉ có 1 dashboard hoặc sample quá mỏng |
| Actionability | Owner có sửa được trong 1 sprint không? | Có surface rõ: hook, screenshot, startup, tutorial step | Cần rewrite toàn bộ game hoặc chưa biết sửa gì |
| Learning protection | Sửa link này có giúp đọc vòng sau sạch hơn không? | Giữ được các link khác ổn định | Phải đổi nhiều surface cùng lúc |

```text
Leak priority = earliest trustworthy link + evidence quality + actionability + learning protection
```

Ví dụ: `D1 weak` nghe nghiêm trọng, nhưng nếu `Store CVR` đã rò mạnh trước đó, D1 không phải leak ưu tiên. Người chơi còn lại sau store mismatch có thể không đại diện cho đúng promise của game.

Các range trong bài là **decision ranges**, không phải benchmark universal. Dùng chúng để đặt câu hỏi đúng, không dùng để tuyên bố game tốt/xấu tuyệt đối.

## Funnel leak map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Funnel leak map mẫu]
Type: hero operating diagram.
Lesson section: Funnel leak map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Link | Metric to read | Evidence needed | Leak diagnosis | First action |
| --- | --- | --- | --- | --- |
| Impression -> Click | `CTR` by creative | ad network report by variant | Hook/motivation/opening frame yếu | Rewrite first 2 seconds, keep store stable |
| Click -> Install | store `CVR`, `IPM` | store/listing data by source if possible | Store không tiếp ad promise | Replace screenshots/video/copy |
| Install -> First open | `first_open`, crash, ANR/startup | analytics + Android vitals/internal QA | Build/startup/SDK issue | Fix crash/startup before UA verdict |
| First open -> Tutorial | `tutorial_start`, `tutorial_complete` | event taxonomy QA pass | Onboarding friction/value proof late | Shorten tutorial, show first win earlier |
| Tutorial -> D1 | `session_start(days_since_install=1)` | cohort event with build/source caveat | No return reason or wrong expectation | Add early goal/progression/reward |
| D1 -> Monetization | ad/IAP exposure + D1 split | placement/time/session context | Ads too early or weak economy | Delay interstitial, validate rewarded value |

Minimum rule: mỗi link phải có **metric**, **owner**, **next action**, **caveat**. Nếu thiếu caveat, team dễ đọc quá mức.

## Funnel leak operating diagram

```text
[VISUAL PLACEHOLDER: Third-party image request - Funnel leak operating diagram]
Type: data visual/chart or decision board.
Lesson section: Funnel leak operating diagram.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Stage | What user believes | What must prove it | If it leaks | Do first |
| --- | --- | --- | --- | --- |
| Ad | "This puzzle gives me X feeling" | Opening frame and hook | Low `CTR` | Fix creative promise |
| Store | "The game really has that X" | Screenshot/video/copy | Low `CVR` after good `CTR` | Fix store proof |
| First open | "The app works and loads quickly" | Clean launch, no crash | Low `first_open` | Fix technical quality |
| Tutorial | "I can feel the core loop" | First action/win | Low tutorial complete | Fix onboarding |
| D1 | "I have a reason to return" | Goal/progression/memory | Low D1 after good tutorial | Fix return loop |

**Inspect:** mỗi stage nối một lời hứa với một proof cụ thể.

**Conclude:** sửa earliest trustworthy leak trước khi tăng budget.

**Do not infer:** một drop point không chứng minh toàn bộ game fail; nó chỉ chỉ ra stage cần điều tra trước.

## 1000-impression funnel board

| Stage | Example count from 1000 impressions | Readout | Owner |
| --- | ---: | --- | --- |
| Impressions | 1000 | paid attention pool | UA |
| Clicks | 25 | ad got some attention | Creative |
| Store installs | 7 | store filtered the clickers | Store/ASO |
| First opens | 6 | build/startup mostly ok | Engineering |
| Tutorial completes | 4 | first-session proof partial | Product |
| D1 returns | 1-2 | return reason still thin | Product/retention |

**Inspect:** small percentage drops compound fast. A small leak early can erase most downstream learning.

**Conclude:** if Click -> Install is weak, D1 readout is already biased by expectation mismatch.

**Do not infer:** these counts are not targets. They are a teaching board for how leaks compound.

## Hướng dẫn đọc số

| Pattern | Diagnosis | Next action |
| --- | --- | --- |
| `CTR` low, store `CVR` unknown | Creative attention issue first | Rewrite hook/opening, do not touch tutorial yet |
| `CTR` high, store `CVR` low | Ad promise not confirmed by store | Fix screenshot/video/copy before more creative |
| Installs high, `first_open` low | Technical/startup issue | Check crash, startup, build size, SDK init |
| `tutorial_complete` low | First-session friction/value proof late | Simplify tutorial and show payoff earlier |
| Tutorial OK, D1 weak | Return loop/promise fit weak | Add early goal, progression, daily reason or memory |
| D1 OK, ROAS weak | Economics/monetization issue | Inspect placement, rewarded value, ARPDAU, payback |
| Events missing | Tracking issue | Fix event taxonomy before diagnosis |

Do not jump downstream. Nếu first-open tracking broken, D1 diagnosis không đáng tin. Nếu store `CVR` thấp vì screenshot mismatch, product feedback từ D1 có thể bị bias bởi người chơi sai expectation.

Leak triage board:

| If you see this combination | Trust level | First action | Keep stable |
| --- | --- | --- | --- |
| `CTR` weak and every downstream count is tiny | Medium top-funnel read, weak downstream read | Rewrite the opening hook/motivation | Store, build, tutorial |
| `CTR` healthy but store `CVR` weak | Medium store-read if traffic/source is clean | Rewrite screenshot 1-3 and store copy to mirror ad promise | Creative, build, tutorial |
| Installs are fine but `first_open` drops | High technical suspicion | Fix crash/startup/SDK/init path before more UA spend | Creative, store, tutorial |
| `first_open` healthy but tutorial completion drops | Medium product/onboarding read | Move first win earlier and remove friction | Creative, store, acquisition |
| Tutorial completes but D1 is weak | Directional retention read | Add return reason, progression, or next-session goal | Creative, store, install path |
| D1 acceptable but early monetization weak | Early economics read only | Inspect ad timing, rewarded value, ARPDAU caveat | Creative/store/product promise |
| Two links look weak at once | Low causal clarity | Pick earliest trustworthy leak and rerun cleaner | All later links |

Operator rule: change only the link you are diagnosing. If you change creative and store together, a better next read cannot tell whether attention, proof, or expectation changed. A small budget gets stronger when every test protects one clean comparison.

Leak ownership routing:

| Earliest trustworthy leak | Primary owner | Support owner | Action brief | What stays stable |
| --- | --- | --- | --- | --- |
| Impression -> Click | Creative/UA | Product for promise truth | Rewrite hook/opening to express one motivation faster | Store listing, build, tutorial |
| Click -> Install | Store/ASO | Creative for promise continuity | Replace screenshot 1-3 or short description to mirror ad promise | Creative hook, build, tutorial |
| Install -> First open | Engineering | UA for source/build tags | Fix crash/startup/SDK init; verify release build | Creative, store, tutorial |
| First open -> Tutorial complete | Product/design | Engineering for event validity | Move first win earlier, reduce friction, clarify first action | Creative/store promise |
| Tutorial -> D1 | Product/retention | UA for cohort/source caveat | Add return reason, early goal, progression, or reward memory | Acquisition and store surfaces |
| D1 -> monetization signal | Monetization/product | Analytics | Check ad timing, rewarded value, purchase friction, payback window | Creative/store/tutorial unless proven linked |

Decision note format:

```md
Earliest trusted leak:
Owner:
Supporting owner:
Action:
Stable surfaces:
Caveat:
Next read date:
```

Nếu không ghi `stable surfaces`, team rất dễ "nhân tiện" sửa thêm thứ khác. Với micro-budget, "nhân tiện" là kẻ thù của learning.

### Source reconciliation rules

Khi số liệu giữa ad network, store console và analytics lệch, đừng vội kết luận leak. Trước tiên reconcile nguồn.

| Mâu thuẫn | Nguyên nhân hay gặp | Cách reconcile | Decision sau khi reconcile |
| --- | --- | --- | --- |
| Network báo installs cao, analytics báo `first_open` thấp | Attribution window khác, SDK init muộn, crash before analytics | So install date, build version, first_open timestamp và crash/vitals | Nếu crash/startup sạch mới đọc UA chất lượng |
| Store `CVR` yếu nhưng IPM không quá xấu | Ad click quality khác store intent, hoặc store source không tách đúng | Đọc theo campaign/source nếu có, kiểm tra store asset match promise | Sửa store proof nếu promise mismatch rõ |
| Tutorial event thấp bất thường | Event fire sai, tutorial skip path, user quit trước event | QA event order trên device thật và log từng step | Nếu event sai thì không sửa tutorial trước |
| D1 khác giữa analytics và ad dashboard | Timezone/cohort/window khác | Chốt một cohort definition cho readout | Không chọn winner bằng 2 window lẫn lộn |
| Creative A tốt ở network nhưng xấu ở product events | Clickbait hoặc traffic intent thấp | Đọc `CTR -> CVR -> tutorial -> D1` theo cùng cell | Không scale creative chỉ vì network report đẹp |

Rule: nếu nguồn dữ liệu chưa thống nhất, next action là **measurement repair**, không phải **funnel repair**. Một funnel map tốt biết khi nào nó chưa đủ quyền ra diagnosis.

## Worked example: from hook to diagnosis

Team chạy `$150` cho puzzle prototype:

| Metric | Result | Read |
| --- | ---: | --- |
| Impressions | 50,000 | Enough top-funnel exposure for a first read |
| Clicks | 1,500 (`CTR` 3.0%) | Creative pulls attention |
| Installs | 225 (store `CVR` 15%) | Store proof likely weak |
| First opens | 210 | Build/open mostly ok |
| Tutorial completes | 150 | Tutorial acceptable for first pass |
| D1 returns | 33 | D1 direction weak, but earlier store leak biases read |

Diagnosis: `CTR` is not the problem. The earliest actionable leak is Click -> Install. Store proof likely does not continue the ad promise.

Next action: pause scale, replace screenshot 1-3 to mirror the ad promise, keep creative stable, rerun a smaller store-read test.

Tradeoff: D1 is also weak, but if store brought the wrong expectation, product diagnosis is noisy. Fix store proof first, then reread D1.

Second-pass diagnosis:

| Read question | Evidence | Decision |
| --- | --- | --- |
| Leak sớm nhất có đủ tin là gì? | `CTR` 3.0% ổn, store `CVR` 15% yếu, first open ổn | Click -> Install là earliest trusted leak |
| Ai sở hữu leak đó? | Store không tiếp lời ad promise | Store/ASO owner, creative support để giữ promise |
| Downstream nào chưa nên over-read? | D1 yếu nhưng bị bias bởi expectation mismatch | Không rewrite retention loop trước khi store proof sạch hơn |
| Surface nào phải giữ nguyên? | Creative đang kéo attention đủ tốt | Giữ creative hook để đọc tác động screenshot |
| Next read cần nhìn gì? | Store `CVR`, `IPM`, D1 direction sau store repair | Nếu `CVR` tăng mà D1 vẫn yếu, chuyển sang first-session proof |

Decision memo:

```md
Earliest trusted leak: Click -> Install.
Owner: Store/ASO.
Action: Replace screenshots 1-3 with the same clear/combo promise used in the ad.
Stable surfaces: creative hook, country, build, tutorial.
Caveat: D1 is not a clean product verdict until store expectation is repaired.
Next read: compare CVR/IPM direction before and after screenshot change.
```

Điểm sâu: một funnel leak map tốt không chỉ nói "CVR thấp". Nó nói **CVR thấp ở stage nào, owner nào sửa, cái gì phải giữ nguyên, và metric nào chưa được kết luận**.

Treatment ticket cho sprint sửa store:

```md
Treatment ticket - Store proof repair

Diagnosis:
Click -> Install is the earliest trusted leak.

Hypothesis:
Screenshot 1-3 do not prove the ad promise "clear satisfying combos".

Change:
Replace screenshot 1 with a clear before/after combo moment.
Replace screenshot 2 with the same calm-clear fantasy shown in the ad.
Keep screenshot 3 focused on progression, not features list.

Stable surfaces:
Creative hook, target market, build, tutorial flow, event taxonomy.

Success read:
Store CVR/IPM direction improves without tutorial_complete getting worse.

Caveat:
If CVR improves but D1 remains weak, next sprint shifts to first-session proof.
```

Treatment ticket biến diagnosis thành work item. Nếu owner chỉ nhận câu "CVR thấp", họ sẽ dễ sửa theo gu. Nếu nhận ticket có hypothesis, change, stable surfaces và success read, vòng sau mới đọc được.

### Leak repair release memo

Sau khi chọn earliest trusted leak, viết release memo trước khi sửa. Memo này khóa một link được sửa, các surface giữ nguyên, và metric đọc lại sau repair.

```text
Leak repair release memo
- Earliest trusted leak:
- Link being repaired:
- Owner:
- Change shipped:
- Stable surfaces:
- Success read:
- Escalation read:
- Blocked conclusions:
- Next read date:
```

Rule: nếu memo không nói rõ `stable surfaces`, repair chưa đủ sạch để học. Nếu repair cải thiện link hiện tại nhưng downstream vẫn yếu, next action phải chuyển xuống link kế tiếp thay vì tiếp tục polish cùng một surface.

## Unity technical leak checklist

| Leak | Unity-specific check | Pass condition |
| --- | --- | --- |
| Install -> First open weak | Crash on launch, ANR, SDK init, splash loop | Clean install opens reliably |
| Slow startup | First scene load, shader warmup, remote config wait | Value proof appears quickly |
| Huge build | Texture/audio compression, unused assets, Addressables grouping | Size is appropriate for target market |
| Event missing | Analytics init and event fire order | Required events fire once with version/source |
| Ads break session | Ad SDK init and first placement timing | Ads do not block first value proof |
| Build drift | Different event names between builds | `app_version` makes cohort readable |

Quality chain: `store install -> clean first open -> first action -> first win -> return reason`.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play uses feature graphic, screenshots, short description and videos to showcase app features/functionality on store and promotional surfaces. | Store proof is part of funnel conversion, not separate branding decoration. | Do not infer every game needs the same screenshot style; proof depends on promise. |
| [Android vitals](https://developer.android.com/topic/performance/vitals) | Android vitals tracks quality metrics such as stability, performance, battery use and permission issues, accessible in Play Console/reporting surfaces. | Install -> first open leaks can be technical, not marketing. | Do not blame UA before checking crash/startup quality. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting works with attribution sources/triggers and privacy-preserving reporting. | Funnel readout needs source/window caveats; one dashboard may not be exact truth. | Do not overclaim precision from one report, especially in a micro test. |

Store-proof readout:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Ad frame | Promise and player motivation | If click is strong, attention exists | Click does not prove install quality |
| Store screenshot 1 | Same promise visually confirmed | If mismatch, `CVR` leak is likely | Pretty screenshot is not proof |
| First session | Tutorial/level delivers the promise | If missing, D1 can fail after good `CVR` | Good store cannot fix weak first session |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Chỉ nhìn `CPI` để tăng budget. | Read `CTR`, `CVR`, first-session and D1 together. |
| Sửa gameplay khi store `CVR` là leak chính. | Fix store proof first. |
| Blame traffic khi `first_open` thấp. | Check build/crash/startup/SDK. |
| Dùng D1 khi `tutorial_complete` missing. | Fix event taxonomy first. |
| Chạy nhiều changes cùng lúc. | Fix one funnel link and rerun. |
| Không ghi caveat. | Every diagnosis needs "what this does not prove yet". |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Funnel` | Chuỗi chuyển đổi từ ad tới retained player |
| `CTR` | Click-through rate, attention signal |
| `CVR` | Conversion rate for store/click/install path |
| `IPM` | Installs per mille, install efficiency per 1000 impressions |
| `Leak` | Điểm rò rỉ trong phễu |
| `First open` | Event mở app lần đầu sau install |
| `Cohort` | Nhóm user theo install/source/build để đọc retention |

## Lab output example

```md
Funnel leak map - Calming Hex Puzzle

Impression -> Click:
- CTR: 3.0%
- Diagnosis: attention ok.
- Caveat: creative may still attract curiosity users.

Click -> Install:
- Store CVR: 15%
- Diagnosis: store proof weak.
- Action: replace screenshots 1-3 to mirror ad promise.

Install -> First open:
- First open rate: 93%
- Diagnosis: build/startup acceptable.

First open -> Tutorial:
- tutorial_complete: 71%
- Diagnosis: tutorial usable for first pass.

Tutorial -> D1:
- D1: directional weak.
- Caveat: fix store proof before making product verdict.

Earliest major leak:
- Click -> Install.

Leak priority score:
- Earliest trustworthy link: high, because Click -> Install appears before downstream product reads.
- Evidence quality: medium, because CTR is healthy and first_open is mostly clean.
- Actionability: high, because screenshot 1-3 can be changed without touching build.
- Learning protection: high, because creative/build/tutorial can stay stable.

Next action:
- Update store proof, rerun small test with the same creative.

Treatment ticket:
- Owner: Store/ASO.
- Hypothesis: screenshot 1-3 do not prove the ad promise.
- Change: replace screenshot 1-3 only.
- Stable surfaces: creative hook, country, build, tutorial.
- Success read: CVR/IPM direction improves; tutorial_complete does not degrade.

Leak repair release memo:
- Earliest trusted leak:
- Link being repaired:
- Stable surfaces:
- Success read:
- Escalation read:
- Blocked conclusions:
```

## Practical Lab

1. Fill the five funnel links for your game.
2. Mark the earliest major leak you trust.
3. Assign the likely owner: creative, store, tech, product, tracking or monetization.
4. Write one next action for that link only.
5. Add one caveat: which downstream metric is not trustworthy yet?
6. Decide whether the next test keeps creative/store/product stable or changes one link.
7. Score the leak with `earliest trustworthy link`, `evidence quality`, `actionability`, and `learning protection`.
8. If any data source conflicts, write a measurement repair step before product/marketing repair.
9. Write one treatment ticket with owner, hypothesis, change, stable surfaces and success read.
10. Write one leak repair release memo.

Quality check: if your next action changes more than one funnel link, narrow it. If the owner cannot explain what stays stable, the next read will be muddy.

## Final UA Plan Update

Cập nhật field **metricTargets**:

```md
Funnel leak map:
- Attention target:
- Store conversion target:
- First open / startup target:
- Tutorial / first-session target:
- D1 direction:
- Earliest major leak:
- Leak priority score:
- Next action:
- Caveat:
```

Cập nhật field **nextAction**:

```md
Treatment ticket:
- Owner:
- Hypothesis:
- Change:
- Stable surfaces:
- Success read:
- Caveat:
- Leak repair release memo:
```

Cập nhật field **tracking**:

```md
Required events:
- first_open
- tutorial_start
- tutorial_complete
- level_complete
- session_start(days_since_install)
```

Cập nhật field **successCriteria**:

```md
Success is not one metric.
The test succeeds if it identifies the earliest trustworthy leak and one next action.
```

## Checklist Focus

- [ ] Funnel map có đủ 5 links.
- [ ] Earliest major leak được chọn.
- [ ] Leak priority score giải thích vì sao sửa link đó trước.
- [ ] Next action chỉ sửa một link.
- [ ] Treatment ticket có owner, hypothesis, change, stable surfaces và success read.
- [ ] Leak repair release memo có stable surfaces và blocked conclusions.
- [ ] Tracking caveat rõ.
- [ ] Data-source conflict được reconcile trước khi sửa funnel.
- [ ] Technical leak không bị nhầm thành UA leak.
- [ ] Final UA Plan có metricTargets, tracking và successCriteria.

## Curated References

- [Google Play: Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Android Developers: Android vitals](https://developer.android.com/topic/performance/vitals)
- [Privacy Sandbox: Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
