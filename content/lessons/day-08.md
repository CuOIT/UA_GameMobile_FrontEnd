---
day: 8
title: "Metric map for puzzle UA"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, Retention, ARPDAU]
artifact: "Metric decision map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Metric decision map**: một bản đồ nối từng câu hỏi UA với metric chính, metric hỗ trợ, ngưỡng đọc theo scenario và action kế tiếp.

Quyết định cần học: biết metric nào trả lời câu hỏi nào, và không dùng một metric đơn lẻ để ra quyết định.

Kết quả cần có:

- Map 3 tầng: acquisition, retention, monetization.
- Metric pairs để chẩn đoán gãy ở creative, store, onboarding hay economy.
- Stop-loss rule phù hợp ngân sách `$100-500`.
- Cập nhật trường **Metric targets** trong Final UA Plan.

---

## Why this matters

Dashboard UA luôn trông có vẻ khách quan, nhưng metric đứng một mình rất dễ lừa bạn.

- `CPI` thấp có thể là traffic rẻ nhưng user không quay lại.
- `CTR` cao có thể là clickbait, không phải fit.
- `D1` tốt có thể là early gameplay ổn, nhưng monetization chưa đủ để hoàn vốn.
- `ARPDAU` cao có thể đến từ ép quảng cáo quá sớm và làm hỏng D3/D7.

Với micro soft-launch, bạn không cần một hệ thống BI phức tạp. Bạn cần một bản đồ quyết định rõ: nếu số A và B cùng xảy ra, hành động tiếp theo là gì. Metric map giúp team Unity không tranh luận cảm tính sau khi spend bắt đầu chạy.

---

## Core model: metric trả lời câu hỏi, không trả lời mọi thứ

Mỗi metric chỉ có một "job" chính. Sai lầm là bắt một metric trả lời câu hỏi ngoài phạm vi của nó.

| Câu hỏi vận hành | Metric chính | Metric hỗ trợ | Metric không nên dùng một mình |
| --- | --- | --- | --- |
| Ad có kéo sự chú ý đúng không? | CTR | IPM, thumb-stop/video hold | CPI |
| Store có chứng minh promise không? | Store CVR | Click-to-install, screenshot order | CTR |
| First session có giao đúng promise không? | Tutorial complete, level depth | D1 retention | CPI |
| User có quay lại không? | D1/D3/D7 retention | Session count, level depth | Installs |
| Economy có cơ hội hoàn vốn không? | ARPDAU, ROAS window | Ad impressions/user, payer conversion | D1 |

Metric decision map luôn đọc theo cặp: `primary metric` cho tín hiệu chính, `supporting metric` để biết nguyên nhân.

---

## Metric decision map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Metric decision map mẫu]
Type: hero operating diagram.
Lesson section: Metric decision map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Decision question | Primary metric | Supporting metric | Scenario range để đọc | Nếu yếu thì làm gì |
| --- | --- | --- | --- | --- |
| Hook có đủ rõ để mua traffic học hỏi? | CTR | IPM | So với creative cùng campaign, không dùng benchmark chung | Sửa 3 giây đầu, không sửa product vội |
| Store có khớp hook? | Store CVR | Click-to-install | Đọc theo traffic source và promise | Đổi screenshot/title/video preview |
| Onboarding có làm rơi user? | Tutorial complete | Level 1-3 complete | Đọc theo build/version | Rút tutorial, đưa proof sớm hơn |
| Retention có đủ để tiếp tục học? | D1/D3 | Session count, level depth | Đọc theo thesis: relax/challenge/meta | Sửa pacing hoặc promise |
| Monetization có hướng? | ARPDAU | Ad impressions/user, rewarded opt-in | Chỉ đọc directional trong test nhỏ | Điều chỉnh placement, chưa scale |
| Có nên dừng spend? | Spend cap | Installs + quality floor | Rule viết trước khi chạy | Pause, ghi diagnosis, không chase losses |

Điểm quan trọng: `scenario range` là ngôn ngữ quyết định nội bộ, không phải benchmark vĩnh viễn. Bạn sẽ tinh chỉnh range sau mỗi cohort.

### Metric owner and confidence layer

Metric map chỉ thật sự dùng được khi mỗi số có **owner**, **window**, và **confidence level**. Nếu không, team sẽ tranh luận "D1 thấp" mà không biết D1 đó đến từ build nào, source nào, cohort nào, và event đã QA chưa.

| Metric | Owner | Read window | Confidence nếu... | Decision được phép |
| --- | --- | --- | --- | --- |
| CTR/IPM | UA/operator | campaign day, creative variant | spend/impression đủ đọc direction và delivery không lệch quá mạnh | sửa creative opening, hook, thumbnail |
| Store CVR | Store owner/UA | store visit -> install | traffic source rõ và store listing không đổi giữa test | sửa screenshot/title/proof |
| Tutorial complete | Game/analytics owner | first session | event QA pass trên build live và không đổi tên event | sửa tutorial, level 1-3, proof moment |
| D1/D3 | Product owner | cohort day | cohort đủ sạch theo source/build và crash không bất thường | hold/iterate promise, chưa scale lớn |
| ARPDAU/ROAS | Monetization owner | D0/D3/D7 tùy rule | revenue delay được hiểu và sample không quá nhỏ | đặt guardrail, không kill sớm |

Decision memo nên luôn ghi:

```text
Metric:
Owner:
Window:
Confidence:
Allowed decision:
Not allowed decision:
Next checkpoint:
```

Ví dụ: `D1 = 17%` không tự nói phải kill product. Nếu `tutorial_complete = 51%` và event đã QA, quyết định gần nhất là sửa first session. Nếu event chưa QA, quyết định gần nhất là QA tracking.

### Metric authority matrix

Metric map chỉ đủ sâu khi mỗi metric có "quyền quyết định" rõ ràng. Một metric có thể hữu ích để quan sát nhưng chưa đủ quyền để scale, kill hoặc đổi thesis.

| Metric | Quyết định được phép | Quyết định bị cấm | Bằng chứng cần đi kèm |
| --- | --- | --- | --- |
| `CTR` / `IPM` | Sửa opening hook, thumbnail, first 3 seconds, angle wording | Kết luận user quality hoặc product fit | Store CVR và guardrail sau install không phản đối |
| Store CVR | Sửa screenshot order, title/subtitle, preview proof | Kết luận gameplay yếu | Cùng source/campaign scope và store asset stable |
| `tutorial_complete` | Sửa tutorial, first win, level 1-3 proof | Kết luận channel fail nếu acquisition/store vẫn ổn | Event QA pass, build/source segment rõ |
| D1/D3 | Hold/iterate promise, kiểm pacing và motivation | Kill product từ một cohort nhỏ | Cohort sạch, crash không bất thường, sample đủ đọc direction |
| ARPDAU/ROAS early | Đặt watchlist hoặc guardrail monetization | Scale/kill economy sớm | Revenue delay/window hiểu rõ, retention floor tạm ổn |
| CPI | Giữ spend cap hoặc pause nếu cost vượt learning budget | Scale vì install rẻ hoặc kill vì install đắt | IPM, CVR, D1 và test scope đi kèm |

Rule: quyết định phải đi theo metric có confidence cao nhất ở mắt xích đang gãy. Nếu metric đẹp nằm upstream nhưng guardrail downstream đỏ, action đúng là kiểm downstream trước khi tăng budget.

---

## Hero visual: metric funnel decision map

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: metric funnel decision map]
Type: data visual/chart or decision board.
Lesson section: Hero visual: metric funnel decision map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[METRIC FUNNEL DECISION MAP]

```text
Impression
  Question: Ad co lam dung nguoi dung lai khong?
  Read: CTR + IPM + thumb-stop/video hold
  If weak: sua 3 giay dau, hook, visual promise
        |
        v
Click -> Store page
  Question: Store co chung minh dung promise cua ad khong?
  Read: Store CVR + click-to-install + screenshot order
  If weak: sua screenshot 1, title/subtitle, preview video
        |
        v
Install -> Tutorial start
  Question: User co vao duoc first session sach khong?
  Read: install_to_tutorial_start + crash-free/session_start
  If weak: kiem tra build, loading, permission, first open friction
        |
        v
Tutorial -> Level 1-3 proof
  Question: Gameplay co giao dung ad promise trong vai phut dau khong?
  Read: tutorial_complete + level_3_complete + first_clear/combo event
  If weak: sua onboarding, level pacing, proof moment
        |
        v
D1/D3 Retention
  Question: Promise co tao du ly do quay lai khong?
  Read: D1 + D3 + session_count + level_depth by cohort
  If weak: sua pacing, difficulty curve, motivation mismatch
        |
        v
Revenue / Economy
  Question: User giu duoc co tao duong hoan von khong?
  Read: ARPDAU + rewarded_opt_in + ad_impressions/user + payer signal
  If weak: test placement sau khi retention floor tam on, chua scale
```

| Funnel leak | Metric pair can xem | Diagnosis co kha nang | Action uu tien |
| --- | --- | --- | --- |
| Ad attention leak | `CTR + IPM` | Hook khong ro hoac promise khong thay trong 1-3 giay | Sua creative opening, giu store/product neu cac tang sau tot |
| Store proof leak | `CTR + Store CVR` | Ad keo click nhung store khong chung minh promise | Sua screenshot/title/video preview theo dung hook |
| Build/friction leak | `Install + tutorial_start` | User da install nhung khong vao duoc first session sach | QA crash/loading/permission, khong ket luan UA voi build loi |
| Onboarding leak | `tutorial_complete + D1` | Game khong giao proof som, tutorial lam roi user | Rut tutorial, dua clear/win/proof moment vao level 1-3 |
| Retention leak | `D1/D3 + session_count` | First session qua mong hoac motivation mismatch | Sua pacing/difficulty hoac quay lai motivation map |
| Economy leak | `ARPDAU + ad_impressions/user` | Co user nhung placement/reward loop chua co huong | Test rewarded placement nhe, khong ep interstitial qua som |


**Inspect:** mỗi đoạn funnel có metric riêng và action riêng.
**Conclude:** khi metric gãy, bạn sửa đoạn funnel tương ứng thay vì đổi toàn bộ chiến dịch.
**Do not infer:** funnel không chứng minh game có thể scale; nó chỉ giúp đọc test nhỏ có kỷ luật.

---

## Chart: three scenario readout

:::chart
title: Example decision pressure by metric group, 1-5
Creative pressure|4|CTR/IPM weak relative to other variants
Store pressure|2|CVR acceptable for current promise
Onboarding pressure|5|Tutorial complete is the biggest leak
Retention pressure|4|D1 follows onboarding weakness
Monetization pressure|1|Too early and sample too small
:::

**Inspect:** pressure cao nhất nằm ở onboarding, không phải acquisition.
**Conclude:** action đúng là sửa first session trước khi làm thêm creative scale.
**Do not infer:** chart không nói monetization chắc chắn tốt; nó chỉ nói monetization chưa phải vấn đề đọc được trong mẫu hiện tại.

---

## Hướng dẫn đọc số

| Pattern | Diagnosis | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| CTR thấp, CVR/D1 tốt | Creative không truyền tải được product proof | Làm lại opening hook, giữ thesis | Đổi audience hoặc onboarding |
| CTR cao, CVR thấp | Ad-store mismatch hoặc clickbait | Sửa store proof theo hook | Scale vì CTR cao |
| CVR cao, tutorial complete thấp | Store hứa đúng nhưng first session rơi user | Sửa tutorial/level 1-3 | Làm thêm store screenshot |
| D1 tốt, ARPDAU rất thấp | Game giữ được user nhưng economy chưa có placement | Test rewarded placement nhẹ | Nhồi interstitial sớm |
| CPI cao, D1/ARPDAU tốt | User đắt nhưng chất lượng có thể có giá trị | Tối ưu creative/channel để hạ CPI | Kill product chỉ vì CPI |
| CPI thấp, D1 thấp | Traffic rẻ nhưng không có value | Pause source/hook, kiểm tra mismatch | Tăng budget vì install rẻ |

Với test nhỏ, đọc theo severity: một metric gãy nhẹ chưa đủ kết luận, nhưng hai metric cùng tầng gãy thường đủ để chọn action.

Metric verdict ladder:

| Verdict | Evidence pattern | Next action | What to avoid |
| --- | --- | --- | --- |
| Keep reading | Spend/install floor chưa đủ, event QA pass, no severe leak | Let campaign reach the pre-written read floor | Refreshing dashboard and changing assets hourly |
| Fix creative | `CTR/IPM` weak while store/onboarding quality is acceptable | Rewrite first 1-3 seconds, thumbnail, promise clarity | Changing product or store before ad promise is readable |
| Fix store proof | `CTR` acceptable but Store CVR/click-to-install weak | Rewrite screenshot order, title/subtitle, preview proof | Scaling because attention looks good |
| Fix first session | Store CVR acceptable but tutorial/level proof and D1 weak | Shorten tutorial, move proof moment earlier, retest same thesis | Adding a new channel or killing the market thesis |
| Fix economy later | Retention direction acceptable but ARPDAU/rewarded opt-in weak | Test gentle rewarded placement after retention floor | Forcing interstitials before retention is stable |
| Pause source/hook | CPI cheap but D1/tutorial quality weak, or CPI high with no quality signal | Pause or isolate that source/hook and write caveat | Chasing cheap installs or blaming product from bad traffic |
| Retest cleanly | More than one layer changed during the test | Freeze variables and rerun the smallest readable cell | Declaring a winner from a dirty report |

Decision rule: always name the **highest-confidence leak** before naming the winner. If the leak is upstream, do not diagnose downstream metrics yet; if the report is dirty, the action is a cleaner test, not a stronger opinion.

---

## Worked example: $250 calming puzzle test

Setup:

```text
Budget: $250
Thesis: calming/satisfying block puzzle
Primary question: promise chain có giữ được user sau install không?
Stop-loss: pause nếu spend >= $80 và tutorial complete < 60% hoặc D1 < 18%
```

Kết quả sau $250:

| Metric | Value | Read |
| --- | ---: | --- |
| Impressions | 62,500 | đủ để đọc creative direction sơ bộ |
| CTR | 1.8% | hơi yếu, nhưng chưa fatal |
| Store CVR | 36% | store proof ổn |
| Installs | 405 | CPI khoảng $0.62 |
| Tutorial complete | 51% | gãy nặng |
| D1 retention | 17% | gãy theo onboarding |
| ARPDAU | $0.018 | quá sớm để kết luận economy |

Diagnosis:

- Store không phải vấn đề chính vì CVR ổn.
- Creative cần cải thiện, nhưng leak lớn nhất là tutorial/first session.
- D1 thấp đi cùng tutorial complete thấp, nên không nên scale traffic.

Verdict: **pause spend, fix onboarding, retest same thesis**. Không đổi market thesis và không thêm channel mới cho đến khi tutorial complete vượt floor nội bộ.

### Decision memo and retest plan

Sau worked example, output không nên là "D1 thấp". Output phải là một memo ngắn giúp team thống nhất hành động trong sprint tiếp theo.

```text
Metric decision memo
- Highest-confidence leak: tutorial_complete at 51% after event QA.
- Supporting pattern: D1 at 17% follows the onboarding leak.
- Not the main leak: store proof, because Store CVR is acceptable for this test.
- Decision: pause spend above maintenance cap, fix onboarding/level proof, retest same calming thesis.
- Do not do: add a new channel, rewrite market thesis, or scale because CPI is cheap.
```

Retest plan:

| Retest item | Keep unchanged | Change one thing | Metric to read | Pass signal | Fail signal |
| --- | --- | --- | --- | --- | --- |
| Same calming promise | hook family, store proof, channel | tutorial length/proof moment | tutorial_complete, D1 | tutorial rises without CVR collapse | tutorial still weak, D1 flat |
| Opening clarity variant | market thesis, first level payoff | first 3 seconds creative | CTR, IPM, Store CVR | CTR/IPM improve and CVR holds | CTR improves but CVR drops |
| Rewarded placement probe | retention build, traffic source | one gentle rewarded moment | rewarded_opt_in, ad impressions/user, D1 | opt-in appears without D1 drop | ad pressure hurts D1/session |

Retest rule: chỉ đổi một tầng chính. Nếu vừa đổi creative, store, tutorial và ad placement, report sau đó sẽ lại không đọc được nguyên nhân.

### Metric readout acceptance memo

Trước khi đưa một report vào decision meeting, hãy viết acceptance memo. Memo này biến bảng số thành quyết định có ranh giới.

```text
Metric readout acceptance - Calming Puzzle Test 01

Accepted source/window:
- Acquisition: same channel, same country, same store page, 3-day read.
- Gameplay: tutorial_complete and level_3_complete QA pass on build 0.3.7.
- Monetization: ARPDAU is watchlist only, D0 window too early.

Highest-confidence leak:
- tutorial_complete 51%, supported by D1 17%.

Decision allowed:
- Pause scale.
- Fix onboarding / first-session proof.
- Retest same thesis with same store proof.

Decision blocked:
- Do not add a new channel.
- Do not rewrite market thesis.
- Do not judge economy from ARPDAU.
- Do not scale because CPI looks acceptable.

Next checkpoint:
- Rerun clean cell after tutorial fix, read tutorial_complete + level_3_complete + D1.
```

Acceptance memo tốt luôn nói rõ **source/window nào được chấp nhận**. Nếu source/window không sạch, action đầu tiên là clean test hoặc QA measurement, không phải creative/product verdict.

---

## Metric instrumentation checklist

| Area | Check | Vì sao cần |
| --- | --- | --- |
| Acquisition | Campaign/ad/source naming nhất quán | Biết creative nào tạo traffic nào |
| Store | Tách traffic theo source nếu có thể | CVR khác nhau theo promise/channel |
| Tutorial | `tutorial_start` và `tutorial_complete` | Biết user rơi trước khi hiểu game |
| Level proof | `level_start`, `level_complete`, `level_fail` | Đọc level depth và friction |
| Ads | `ad_impression`, `rewarded_started`, `rewarded_completed` | Đọc ARPDAU không tách khỏi ad pressure |
| Cohort | Cài ngày nào, build nào | Không trộn bug build với performance marketing |

Không cần log 80 event. Cần log đúng các event trả lời decision map.

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Firebase Analytics events](https://firebase.google.com/docs/analytics/events) | Firebase hỗ trợ logging events và recommended events để phân tích hành vi app/game. | Metric map cần event taxonomy tối thiểu trước khi đọc retention/onboarding. | Không cần log mọi hành vi hoặc copy toàn bộ recommended events nếu không phục vụ decision. |
| [Google AdMob Unity rewarded ads](https://developers.google.com/admob/unity/rewarded) | AdMob Unity docs mô tả rewarded ad flow và callback/reward handling. | Monetization metric như rewarded opt-in/ad impressions cần implementation sạch để không đọc sai ARPDAU. | Không suy ra rewarded ads sẽ tăng LTV nếu placement làm hỏng retention. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Google Play yêu cầu khai báo cách app thu thập/chia sẻ dữ liệu. | Metric tracking phải đi cùng data/privacy readiness, nhất là khi thêm SDK analytics/ads. | Không dùng tracking nhiều hơn chỉ vì muốn dashboard đẹp. |

Usecase readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Tài liệu SDK/event nói rõ event nào được log và callback nào tồn tại. | Metric chỉ đáng tin khi event được fire đúng thời điểm và đúng build. | Không suy ra số tốt/xấu trước khi QA event. |

---

## Common mistakes

- **Mistake - Correction:** Chỉ nhìn CPI.
  **Correction:** CPI phải đi cùng D1 hoặc tutorial complete để biết install có value không.

- **Mistake - Correction:** Copy benchmark trên mạng làm target cứng.
  **Correction:** Viết scenario range theo thesis, channel, build và budget của bạn.

- **Mistake - Correction:** Đọc ARPDAU quá sớm từ 100 installs.
  **Correction:** Dùng ARPDAU early như directional signal, chưa làm scale rule.

- **Mistake - Correction:** Sửa creative, store và onboarding cùng lúc sau một report.
  **Correction:** Chọn leak lớn nhất theo metric pair, sửa một tầng để lần retest đọc được nguyên nhân.

- **Mistake - Correction:** Không viết stop-loss trước khi chạy.
  **Correction:** Stop-loss phải có spend cap, sample floor và quality floor trước khi campaign bật.

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong bài |
| --- | --- |
| CPI | Cost Per Install, chi phí cho một install |
| Retention | Tỷ lệ user quay lại sau D1/D3/D7 |
| ARPDAU | Average Revenue Per Daily Active User |
| ROAS | Return On Ad Spend, doanh thu / chi phí ads |
| IPM | Installs per Mille, installs trên 1000 impressions |
| Cohort | Nhóm user theo ngày cài/source/build để đọc hành vi cùng điều kiện |
| Stop-loss | Quy tắc dừng spend khi tín hiệu vượt ngưỡng rủi ro |

---

## Lab output example

```text
Metric Decision Map - v1

Campaign question:
- Does the calming/satisfying promise chain produce retained players?

Acquisition:
- Primary: CTR by creative
- Supporting: IPM, Store CVR
- Action if weak: rewrite first 3 seconds or screenshot proof

Retention:
- Primary: D1 retention
- Supporting: tutorial_complete, level_3_complete
- Action if weak: fix onboarding/level pacing before scaling

Monetization:
- Primary: ARPDAU early directional
- Supporting: rewarded_opt_in, ad_impressions_per_user
- Action if weak: test rewarded placement after retention floor is met

Stop-loss:
- Pause if spend >= $80 and installs < 120
- Pause if tutorial_complete < 60%
- Pause if D1 < 18% after enough installs for directional read

Do not change yet:
- Do not add a new channel until onboarding leak is fixed
```

Decision memo example:

```text
Highest-confidence leak:
Metric owner:
Read window:
Allowed decision:
Not allowed decision:
Retest cell:
Next checkpoint:
```

Retest cell example:

```text
Keep unchanged: calming promise, store screenshot order, same source.
Change one thing: shorten tutorial and surface satisfying clear in level 1.
Read: tutorial_complete, level_3_complete, D1.
Pass: onboarding rises and D1 no longer follows the leak.
Fail: same leak persists, revisit promise-game fit before adding channel.
```

Metric authority example:

```text
Metric:
Decision allowed:
Decision blocked:
Required companion metric:
Confidence condition:
```

---

## Practical Lab

1. Viết 3 câu hỏi bạn muốn campaign đầu trả lời.
2. Với mỗi câu hỏi, chọn 1 primary metric và 1 supporting metric.
3. Viết action nếu metric pair yếu.
4. Viết stop-loss theo budget cap, installs floor và quality floor.
5. Kiểm tra event trong Unity/Firebase/analytics SDK có đủ để đọc các metric đó không.
6. Gán owner, window và confidence cho 5 metric quan trọng nhất.
7. Viết một decision memo từ report giả lập.
8. Viết một retest cell chỉ đổi một tầng chính.
9. Viết metric authority cho 3 metric bạn dễ over-read nhất: metric đó được phép quyết định gì và bị cấm quyết định gì.
10. Viết metric readout acceptance memo trước khi đưa report vào meeting.

Pass lab khi bạn có thể nhìn một report giả lập và chọn đúng một action: creative, store, onboarding, economy hoặc pause.

---

## Final UA Plan Update

Cập nhật trường **Metric targets**:

```text
Campaign question:
Acquisition primary metric:
Acquisition supporting metric:
Retention primary metric:
Retention supporting metric:
Monetization metric:
Stop-loss spend cap:
Stop-loss quality floor:
Sample floor before diagnosis:
Action if creative leak:
Action if store leak:
Action if onboarding leak:
Action if economy leak:
Metric owner/window/confidence:
Metric authority:
Readout acceptance memo:
Decision memo:
Retest cell:
```

Liên kết với Day 2-3: metric targets phải đọc được market thesis và motivation đã chọn. Nếu motivation là relax, đừng chỉ tối ưu CTR bằng challenge clickbait.

---

## Checklist Focus

- [ ] Mỗi câu hỏi campaign có primary + supporting metric.
- [ ] Không có quyết định nào dựa trên CPI một mình.
- [ ] Stop-loss viết trước khi chạy ads.
- [ ] Event taxonomy đủ để đọc tutorial, level depth, D1 và ads.
- [ ] Scenario ranges được ghi là directional, không phải benchmark cố định.
- [ ] Metric chính có authority rõ: được phép và bị cấm quyết định gì.
- [ ] Readout acceptance memo có source/window, decision allowed và decision blocked.
- [ ] Final UA Plan có action cho từng leak.

---

## Curated References

- [Firebase Analytics - Events](https://firebase.google.com/docs/analytics/events)
- [Google AdMob Unity - Rewarded ads](https://developers.google.com/admob/unity/rewarded)
- [Google Play Help - Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
