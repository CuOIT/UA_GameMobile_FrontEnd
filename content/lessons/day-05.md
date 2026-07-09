---
day: 5
title: "Micro soft-launch strategy"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Soft launch, Retention, Cohort]
artifact: "Micro soft-launch outline"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Micro soft-launch outline**: một kế hoạch test nhỏ dùng `$100-500` để giảm rủi ro trước khi launch rộng hơn.

Quyết định bạn học cách đưa ra: **budget nhỏ này nên được thiết kế để học điều gì, và không được phép kết luận điều gì?**

Output cuối bài:

- Một `learning question` duy nhất cho test đầu tiên.
- Budget tổng, daily cap, số creative cells và sample expectation.
- Stop-loss rule, continue signal và confidence note.
- Một block có thể copy vào field **budget** trong Final UA Plan.

Micro soft-launch không phải "global launch thu nhỏ". Nó là một sprint để kiểm tra readiness: tracking có đọc được không, ad/store có cùng promise không, first session có giữ được người chơi đủ lâu để học tiếp không.

---

## Why this matters

Với team indie Unity, `$300` có thể rất quý nhưng vẫn quá nhỏ để chứng minh `ROAS`, `LTV`, scale toàn cầu hoặc winner tuyệt đối. Nếu bạn dùng micro-budget như một phép bói "game thắng hay thua", bạn sẽ đọc sai dữ liệu.

Một vài lỗi phổ biến:

- Chia `$300` cho 10 creative cells, mỗi cell chỉ có vài install rồi vẫn chọn winner.
- Thấy `CPI` thấp và scale, dù `D1 retention` hoặc `tutorial_complete` đang gãy.
- Thấy một creative có D1 đẹp trên 18 installs rồi gọi là "best creative".
- Không viết stop-loss trước, đến lúc số xấu lại đốt thêm "một ngày nữa cho chắc".

Micro soft-launch tốt không cố trả lời "game này có thành công lớn không?". Nó trả lời câu hẹp hơn nhưng hữu ích hơn: **bước rủi ro nhất trước mắt nằm ở creative, store, first session, tracking hay sample design?**

---

## Core model: Budget nhỏ phải mua learning density

Mỗi dollar trong micro soft-launch phải mua được một đơn vị học hỏi. Gọi đó là **learning density**.

```text
Learning density = số quyết định đọc được / số biến đang test
```

Nếu bạn test quá nhiều biến cùng lúc, learning density giảm. Dashboard có nhiều hàng hơn, nhưng kết luận yếu hơn.

| Lớp quyết định | Micro-budget có đọc được không? | Điều kiện để đọc được | Không nên kết luận |
| --- | --- | --- | --- |
| Tracking readiness | Có | Event tối thiểu chạy đúng trên device thật | Không đọc performance nếu event sai |
| Creative promise | Có, ở mức directional | Ít cells, hook khác biệt rõ, store không quá yếu | Không gọi winner tuyệt đối từ sample nhỏ |
| Store proof | Có | Ad promise và store screenshot có thể đối chiếu | Không đổ lỗi network khi CVR yếu |
| First-session proof | Có, nếu có event sớm | Có `tutorial_complete`, `level_3_reach`, D1 hoặc session 2 | Không kết luận LTV dài hạn |
| Scale economics | Rất yếu | Cần cohort/revenue lớn hơn nhiều | Không dùng `$100-500` để chứng minh ROAS bền vững |

Rule thực hành: **test nhỏ chỉ được kết luận những gì nó được thiết kế để kết luận**. Viết câu này trước khi launch.

---

## Micro soft-launch outline mẫu

Dùng bảng này như bản thiết kế sprint.

| Block | Câu hỏi cần điền | Ví dụ cho puzzle prototype |
| --- | --- | --- |
| Learning question | Test này học đúng một điều gì? | Hook "relax clear" có tạo promise fit tốt hơn hook "hard challenge" không? |
| Budget | Tổng spend và daily cap? | `$300 total`, `$40/day`, giữ `$20` làm buffer |
| Scope | Bao nhiêu region/channel/cell? | 1 Android market, 1 paid channel, 4 creative cells |
| Expected installs | Budget / expected CPI / cells cho mỗi cell bao nhiêu install? | `$300 / $0.60 / 4 = ~125 installs per cell` trước hao hụt |
| Primary metric | Metric nào trả lời learning question? | Store CVR + tutorial_complete |
| Guardrail metric | Metric nào ngăn overread? | D1 retention và event validation |
| Stop-loss | Khi nào dừng sớm? | 2 ngày liên tiếp: CVR yếu + tutorial_complete gãy + tracking sạch |
| Continue signal | Khi nào test tiếp? | 1 hook có CVR ổn, tutorial không gãy, D1 không sụp so với group |
| Not allowed to conclude | Test này không đủ quyền kết luận gì? | Không kết luận ROAS dài hạn hoặc global scale |

Nếu bảng này có hơn 2 learning questions, hãy tách thành nhiều sprint. Một micro-budget không nên gánh cả market research, creative test, store test, onboarding test và monetization test cùng lúc.

### Sprint decision contract

Trước khi bật spend, hãy viết một **sprint decision contract**. Đây là thỏa thuận giúp team không đổi luật giữa trận khi số liệu bắt đầu nhiễu.

| Contract field | Câu phải khóa trước launch | Ví dụ tốt |
| --- | --- | --- |
| Allowed conclusion | Nếu sprint có tín hiệu đủ sạch, team được phép kết luận điều gì? | "Hook relax clear đáng được test vòng 2 với biến store và build giữ nguyên." |
| Blocked conclusion | Dù số đẹp, team vẫn không được kết luận điều gì? | "Không kết luận ROAS, LTV, global scale hoặc winner tuyệt đối." |
| Frozen variables | Biến nào phải giữ nguyên để học được đúng câu hỏi? | Cùng build, cùng store screenshot chính, cùng region, cùng channel, chỉ đổi hook/variant. |
| Review trigger | Khi nào phải dừng để đọc thay vì tiếp tục tiêu? | Khi đạt 60-70% budget, hoặc khi 2 ngày liên tiếp có cùng pattern xấu. |
| Decision owner | Ai có quyền pause, continue, rerun? | UA owner đọc metric, product owner xác nhận first-session issue, founder duyệt spend vòng 2. |

Decision contract không làm bài học phức tạp hơn. Nó làm **ranh giới kết luận** rõ hơn. Với budget nhỏ, rủi ro lớn nhất không phải là "không có data", mà là có data nhưng team tự cho nó nhiều quyền hơn nó thật sự có.

Một ladder đơn giản:

| Evidence level | Team được làm gì | Team chưa được làm gì |
| --- | --- | --- |
| Tracking lỗi | Fix instrumentation, rerun smoke | Đọc creative/store performance |
| Sample quá mỏng | Ghi signal thú vị, gom cells, rerun | Chọn winner |
| Store và first-session cùng ủng hộ một hook | Thiết kế sprint kế tiếp quanh hook đó | Scale budget lớn |
| Store tốt nhưng first-session gãy | Sửa onboarding hoặc first 3 levels | Đổi channel ngay |
| CPI rẻ nhưng retention gãy | Chẩn đoán promise mismatch hoặc traffic intent | Gọi là market fit |

---

## Hero visual: learning sprint flow

```text
[VISUAL PLACEHOLDER: Third-party image request - Day 5 learning sprint visual]
Type: hero operating diagram.
Lesson section: Hero visual: learning sprint flow.
Previous local asset to replace: content/assets/usecases/day-05-learning-sprint-visual.svg.
Visual brief: Micro soft-launch flow: ready, run, read, decide..
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

**Visual readout**

- **Inspect:** Sơ đồ đi theo vòng `ready -> run -> read -> decide`, không đi thẳng từ `run` sang `scale`.
- **Conclude:** Micro soft-launch là một learning sprint. Nếu readiness chưa qua, kết quả performance không đáng tin. Nếu readout chưa có confidence note, decision dễ bị overclaim.
- **Do not infer:** Không suy ra rằng test nhỏ phải chậm hoặc phức tạp. Nó cần hẹp, có rule rõ, và đủ sạch để bước tiếp.

---

## Budget vs signal table

```text
[VISUAL PLACEHOLDER: Third-party image request - Day 5 budget signal visual]
Type: hero operating diagram.
Lesson section: Budget vs signal table.
Previous local asset to replace: content/assets/usecases/day-05-budget-signal-visual.svg.
Visual brief: Budget split visual showing signal dilution when too many cells share a small budget..
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Installs per cell giả lập với budget $300 và CPI $0.60
2 cells|250|Signal mỗi cell dễ đọc hơn, nhưng ít hypothesis
4 cells|125|Cân bằng cho first creative read
6 cells|83|Bắt đầu loãng, cần caution mạnh
10 cells|50|Rất dễ overread winner/loss
:::

Số trên là mô phỏng để dạy cách chia budget, không phải guarantee.

| Budget | Expected CPI | Cells | Installs/cell trước hao hụt | Confidence read |
| ---: | ---: | ---: | ---: | --- |
| `$150` | `$0.50` | 2 | 150 | Có thể đọc directional creative/store signal |
| `$300` | `$0.60` | 4 | 125 | Hợp lý cho sprint đầu nếu tracking/store sạch |
| `$300` | `$1.00` | 6 | 50 | Quá loãng để gọi winner; nên giảm cells |
| `$500` | `$0.80` | 4 | 156 | Tốt hơn, nhưng vẫn chưa chứng minh LTV/ROAS |

**Visual readout**

- **Inspect:** Cùng `$300`, khi cells tăng từ 2 lên 10, installs/cell giảm mạnh.
- **Conclude:** Budget design là một phần của strategy. Càng nhiều biến, kết quả càng khó đọc.
- **Do not infer:** Không suy ra "ít cells luôn tốt". Nếu hai hooks quá giống nhau, ít cells vẫn không học được gì. Cells phải ít **và** khác biệt có chủ ý.

---

## Hướng dẫn đọc số trong test nhỏ

Đọc dữ liệu theo thứ tự này:

1. **Data hygiene:** event có đầy đủ không, campaign/cell naming đúng không, install và `first_open` có lệch bất thường không?
2. **Sample sanity:** mỗi cell có đủ install để đọc directional signal không, hay chỉ là vài chục users?
3. **Creative/store fit:** `CTR/IPM` và `Store CVR` có cùng kể một câu chuyện không?
4. **First-session proof:** `tutorial_complete`, `level_3_reach`, `session_2_start`, D1 có cho thấy promise được giao không?
5. **Decision confidence:** kết luận là high, medium hay low confidence?

| Pattern | Cách đọc | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| 18 installs, D1 44% | Interesting nhưng cohort quá nhỏ | Rerun top concept với ít cells hơn | Scale ngay |
| CTR cao, Store CVR thấp | Ad tạo tò mò, store không xác nhận promise | Sửa first screenshot/copy hoặc giảm clickbait | Tăng spend vì CTR đẹp |
| Store CVR ổn, tutorial_complete thấp | First-session proof yếu | Sửa onboarding/level 1-3 | Đổi channel trước |
| CPI thấp, D1 thấp | Có thể là low-intent traffic hoặc promise mismatch | Đọc cùng creative/store/session events | Gọi là market fit vì install rẻ |
| Tracking thiếu event | Dashboard không đủ tin | Pause, fix instrumentation, rerun | Cố suy luận từ CPI/CTR |

Với micro-budget, câu kết luận nên có dạng: "Tín hiệu này **gợi ý** X với confidence Y, nên next action là Z." Tránh câu: "Creative này thắng" nếu sample chưa đủ.

---

## Worked example: test `$300` trong 7 ngày

Game: block puzzle thư giãn, Android prototype, đã có 2 ad hooks.

| Hook | Promise | Risk |
| --- | --- | --- |
| A - Challenge | "Only 1% solve this" | Kéo curiosity clicks nhưng người chơi không đúng motivation |
| B - Relax clear | "Clear the board and relax" | Ít drama hơn, nhưng gần core loop thật |

Plan:

| Item | Setup |
| --- | --- |
| Budget | `$300`, daily cap `$40`, giữ buffer để xác nhận ngày cuối |
| Region/channel | 1 Android market, 1 paid channel |
| Cells | 2 hooks x 2 variants = 4 cells |
| Learning question | Hook nào tạo promise fit sạch hơn cho store và first session? |
| Primary read | Store CVR + tutorial_complete |
| Guardrail | D1 và event health |
| Stop-loss | Pause cell nếu CVR yếu và tutorial_complete gãy trong 2 ngày liên tiếp |

Kết quả giả lập sau 4 ngày:

| Hook | CTR | Store CVR | CPI | tutorial_complete | D1 | Diagnosis |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| A - Challenge | 4.3% | 14% | `$0.42` | 48% | 12% | Curiosity click mạnh nhưng promise fit yếu |
| B - Relax clear | 2.6% | 31% | `$0.68` | 71% | 27% | Ít click hơn nhưng người chơi hiểu đúng game hơn |

Verdict:

- Không scale Hook B ngay. Sample vẫn nhỏ.
- Pause Hook A hoặc rewrite để giảm clickbait.
- Giữ store assets nếu chúng xác nhận Hook B tốt.
- Sprint tiếp theo: test 2 variants mới quanh "relax clear", giữ cùng first-session build để cô lập creative learning.

Bài học: Hook B không "thắng thị trường". Nó chỉ là **candidate tốt hơn cho vòng test tiếp theo**.

### Post-sprint readout memo

Sau sprint, đừng chỉ chụp dashboard. Hãy viết memo ngắn theo cấu trúc cố định để biến số liệu thành quyết định.

```text
Post-sprint readout - Sprint 01

Learning question:
Hook nào tạo promise fit sạch hơn giữa ad, store và first session?

Data health:
Events clean. Campaign names map được về 4 cells. No obvious install/first_open gap.

Signal read:
Hook A có CTR cao và CPI rẻ hơn, nhưng Store CVR, tutorial_complete và D1 đều yếu.
Hook B có CTR thấp hơn, CPI cao hơn, nhưng store proof và first-session proof sạch hơn.

Decision:
Do not scale. Continue learning around Hook B concept.

Next sprint contract:
Keep build, region, channel and store screenshot fixed.
Create 2 new Hook B variants.
Remove or rewrite Hook A clickbait promise.

Confidence:
Medium-low. Pattern is directionally useful, not enough for winner claim.

Blocked conclusions:
No ROAS claim, no LTV claim, no global launch readiness claim.
```

Memo này buộc team nói rõ **next sprint khác sprint trước ở biến nào**. Nếu sprint sau đổi hook, store, build, channel và region cùng lúc, kết quả mới sẽ lại khó đọc. Hãy chỉ đổi mắt xích đang cần học.

### Sprint closure certificate

Micro soft-launch chỉ đóng khi sprint có một call, một biến đổi cho sprint kế tiếp, và một danh sách kết luận bị khóa.

```text
Sprint closure certificate
- Sprint decision:
- Evidence used:
- Confidence:
- Next sprint variable:
- Frozen variables:
- Blocked conclusions:
- Owner/date:
```

Certificate này giúp team không chuyển từ Sprint 01 sang Sprint 02 bằng cảm giác. Nếu không ghi được `next sprint variable`, sprint sau có nguy cơ đổi quá nhiều thứ và reset learning.

---

## Test readiness checklist cho Unity indie/dev

Trước khi chi tiền, test phải pass các quality gates này:

| Gate | Pass khi | Nếu fail |
| --- | --- | --- |
| Build stability | Không crash ở first open, loading không kẹt trên device thật | Không launch paid traffic |
| Event core | `first_open`, `tutorial_start`, `tutorial_complete`, `level_start`, `level_complete` bắn đúng | Fix tracking trước |
| Store continuity | Icon, screenshot đầu và short description cùng promise với ad | Sửa store trước |
| Creative scope | 2-4 cells với budget `$100-500`, mỗi cell có learning role rõ | Giảm cells |
| Naming convention | Campaign/adset/creative name map được về hook và variant | Sửa naming trước |
| Decision contract | Allowed conclusion, blocked conclusion, frozen variables và owner đã rõ | Không launch vì team sẽ đọc số theo cảm tính |
| Decision owner | Ai pause, ai sửa, ai viết readout được ghi rõ | Không chạy vì decision sẽ trôi |

Checklist này không nhằm làm chậm team. Nó bảo vệ bạn khỏi tình huống tệ nhất: tiêu tiền xong nhưng không biết dữ liệu nói gì.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Google Play closed testing và feedback trước launch

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play hỗ trợ internal/open/closed testing tracks, trong đó closed testing cho phép quản lý tester bằng email hoặc Google Groups và thu feedback trước production. | Micro soft-launch paid traffic không nên là lần đầu build gặp thiết bị thật/người thật. Với team nhỏ, closed testing là lớp readiness trước khi mua traffic. | Không suy ra closed testing thay thế UA test. Tester feedback không đại diện cho paid user motivation hoặc store conversion. |

### Usecase 2: TestFlight cho iOS-aware workflow

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple TestFlight cho phép phân phối beta builds, quản lý tester và thu feedback trước khi submit App Store. | Dù bài này Android-first, iOS-aware team vẫn nên nghĩ theo cùng logic: trước khi đọc UA metrics, build phải đủ ổn để tester không chỉ báo lỗi cơ bản. | Không suy ra tín hiệu TestFlight có thể dùng như paid UA performance. Beta testers thường có intent khác user mua qua ad. |

### Usecase 3: Store listing experiments

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play Store listing experiments cho phép test graphics/text để cải thiện install conversion và retention direction. | Store là một biến có thể test riêng. Nếu ad có interest nhưng CVR yếu, store experiment hoặc store asset rewrite có thể là next action đúng hơn tăng media spend. | Không suy ra micro-budget luôn đủ traffic để A/B store có kết luận mạnh. Khi sample nhỏ, ghi confidence thấp và dùng signal như directional. |

### Usecase 4: Case nội bộ - micro-budget false positive

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Case `Micro-budget false positive`: Creative A có 18 installs với D1 44%; Creative B có 72 installs với D1 31%; group D1 30%. Recommendation là log signal như interesting, không scale cho đến khi có thêm evidence. | Đây là pattern cốt lõi của bài: sample nhỏ có thể làm một cell trông quá đẹp hoặc quá xấu. | Không suy ra Creative A chắc chắn tốt hơn B. Với 18 installs, kết luận phải có confidence thấp. |

---

## Common mistakes

- **Mistake: Dùng test nhỏ để chứng minh winner tuyệt đối** - **Correction:** Dùng test nhỏ để chọn next learning step và loại rủi ro rõ nhất.
- **Mistake: Chia budget cho quá nhiều cells** - **Correction:** Giới hạn 2-4 cells nếu budget chỉ `$100-500`, trừ khi mục tiêu chỉ là smoke test rất thô.
- **Mistake: Không viết `not allowed to conclude`** - **Correction:** Ghi rõ test này không kết luận ROAS/LTV/global scale.
- **Mistake: Scale vì CPI rẻ** - **Correction:** CPI phải đọc cùng Store CVR, D1 và first-session events.
- **Mistake: Rerun test nhưng đổi quá nhiều biến** - **Correction:** Sprint tiếp theo chỉ đổi mắt xích đã được chẩn đoán yếu nhất.

---

## English Terms You Should Keep

| Term | Cách hiểu trong bài |
| --- | --- |
| `Soft launch` | Launch giới hạn để học trước khi mở rộng |
| `Micro-budget` | Budget nhỏ `$100-500`, dùng để giảm rủi ro chứ không chứng minh scale |
| `Cohort` | Nhóm user cùng điều kiện test hoặc cùng ngày install |
| `Daily cap` | Trần chi tiêu mỗi ngày |
| `Creative cell` | Một biến thể test cụ thể: hook/variant/audience setup |
| `Stop-loss` | Điều kiện dừng sớm để tránh đốt tiền vào tín hiệu xấu |
| `Continue signal` | Điều kiện đủ tốt để justify vòng test tiếp theo |
| `Confidence note` | Ghi chú mức tin cậy của kết luận, đặc biệt khi sample nhỏ |

---

## Lab output example

```text
Micro Soft-launch Outline - Sprint 01

Budget:
$300 total, $40/day cap, $20 buffer.

Learning question:
Does the "relax clear" hook produce cleaner promise fit than the "hard challenge" hook?

Scope:
Android, one market, one paid channel, 4 creative cells.

Expected sample:
Expected CPI $0.60 -> about 500 installs total before platform variance -> about 125 installs/cell before uneven delivery.

Primary metric:
Store CVR + tutorial_complete.

Guardrail:
D1 retention, event health, first_open/install sanity.

Decision contract:
Allowed conclusion: choose the cleaner promise-fit candidate for Sprint 02.
Blocked conclusion: no ROAS, no LTV, no global launch readiness, no final creative winner.
Frozen variables: same build, same store screenshot, same channel, same market.
Review trigger: read at 60-70% budget or after 2 repeated bad-pattern days.
Decision owner: [name] pauses cells, [name] confirms product/session issue, [name] approves Sprint 02.

Stop-loss:
Pause any cell after 2 days if Store CVR is weak and tutorial_complete also breaks, assuming tracking is clean.

Continue signal:
At least one hook keeps store proof and first-session proof intact without relying only on CPI.

Not allowed to conclude:
This sprint cannot prove long-term ROAS, scalable LTV, or global launch readiness.

Post-sprint readout:
Decision: [pause / continue / rerun / fix tracking].
Evidence: [data hygiene], [sample sanity], [creative-store fit], [first-session proof].
Next sprint variable: [the one thing that changes].
Confidence: [low / medium / high] because [reason].

Sprint closure certificate:
Sprint decision:
Evidence used:
Next sprint variable:
Frozen variables:
Blocked conclusions:
```

Một lab output tốt không chỉ ghi budget. Nó nói rõ **budget đó mua câu trả lời nào**.

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn một learning question duy nhất cho test `$100-500`.
2. Chọn 1 region, 1 primary channel và tối đa 2-4 creative cells.
3. Dùng calculator **Sample-size sanity check** để ước lượng installs/cell.
4. Ghi primary metric, guardrail metric và event cần có.
5. Viết stop-loss rule, continue signal và `not allowed to conclude`.
6. Tự review: nếu test này thành công hoặc thất bại, team có biết sửa gì vào thứ Hai tuần sau không?
7. Viết sprint decision contract: allowed conclusion, blocked conclusion, frozen variables, review trigger, decision owner.
8. Viết trước khung post-sprint readout memo để sau test không chỉ chụp dashboard rồi tranh luận cảm tính.
9. Viết sprint closure certificate sau khi đọc số.

Quality chain check:

- Nếu sample/cell quá thấp, giảm cells trước khi launch.
- Nếu tracking chưa sạch, không đọc retention.
- Nếu store chưa khớp promise, không blame channel.
- Nếu stop-loss chưa viết, không bật daily spend.
- Nếu `blocked conclusions` chưa rõ, không được dùng số đẹp để kể câu chuyện quá lớn.
- Nếu sprint kế tiếp đổi hơn một biến chính, không thể biết biến nào tạo ra thay đổi.

---

## Final UA Plan Update

Cập nhật field **budget** trong Final UA Plan:

```text
Budget:
[total budget], [daily cap], [buffer if any]

Primary learning question:
[one question this micro soft-launch is allowed to answer]

Scope:
[region], [channel], [number of creative cells]

Expected sample:
[expected CPI] -> [estimated installs total] -> [estimated installs per cell]

Primary metric:
[metric that answers the question]

Guardrail metric:
[metric that prevents overread]

Decision contract:
Allowed conclusion: [what this sprint can decide]
Blocked conclusion: [what this sprint cannot decide]
Frozen variables: [build/store/channel/region/audience/etc.]
Review trigger: [when the team must read and decide]
Decision owner: [who pauses, who diagnoses, who approves next spend]

Stop-loss rule:
[condition to pause early]

Continue signal:
[condition to run the next sprint]

Not allowed to conclude:
[ROAS/LTV/scale/global readiness/etc.]

Post-sprint readout:
Decision: [pause / continue / rerun / fix tracking]
Evidence summary: [what the data actually supports]
Next sprint variable: [the single main variable to change]
Confidence note: [low / medium / high + reason]
Sprint closure certificate: [decision / evidence / frozen variables / blocked conclusions / owner]
```

Field liên quan sẽ được dùng lại ở các bài sau: `metricTargets`, `creativeMatrix`, `successCriteria`, `killCriteria`, `nextAction`.

---

## Checklist Focus

- [ ] Learning question chỉ có một câu hỏi chính.
- [ ] Budget tổng, daily cap và buffer đã rõ.
- [ ] Số creative cells phù hợp với expected installs/cell.
- [ ] Stop-loss rule viết trước launch.
- [ ] Continue signal không dựa vào CPI một mình.
- [ ] Có dòng `not allowed to conclude`.
- [ ] Có sprint decision contract trước launch.
- [ ] Có frozen variables để sprint kế tiếp không đổi quá nhiều thứ cùng lúc.
- [ ] Có post-sprint readout memo sau khi đọc số.
- [ ] Có sprint closure certificate.
- [ ] Có owner cho pause/continue/fix.

---

## Curated References

- [Google Play Help - Set up an open, closed, or internal test](https://support.google.com/googleplay/android-developer/answer/9845334?hl=en) - nguồn chính thức về test tracks trước production.
- [Google Play Console - Closed testing](https://play.google.com/console/about/closed-testing/) - best practices về closed test và tester feedback.
- [Apple Developer - TestFlight](https://developer.apple.com/testflight/) - beta testing workflow cho iOS-aware teams.
- [App Store Connect Help - TestFlight overview](https://developer.apple.com/help/app-store-connect/test-a-beta-version/testflight-overview/) - quản lý beta builds và feedback trước release.
- [Google Play Console - Store listing experiments](https://play.google.com/console/about/store-listing-experiments/) - official source về testing store graphics/text.
