---
day: 6
title: "Channel map for small Unity teams"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Ad network, Campaign, Optimization]
artifact: "Channel selection note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Channel selection note**: một ghi chú chọn `1 primary channel`, `1 deferred channel`, và `1 thing not testing yet` cho sprint UA đầu tiên.

Quyết định bạn học cách đưa ra: **kênh nào trả lời learning question nhanh nhất với budget, creative và tracking hiện tại?**

Output cần có:

- Một `learning job` rõ cho kênh đầu tiên.
- Rubric chấm ít nhất 3 channel options.
- Lý do chọn `primary channel` và lý do hoãn kênh khác.
- Risk note để tránh blame nhầm channel khi store/tracking/first session đang yếu.
- Block copy được vào field **budget / test scope** trong Final UA Plan.

---

## Why this matters

Team nhỏ thường chọn channel theo danh tiếng: "Meta dễ test", "Google scale tốt", "Apple Search intent cao", "network game có user đúng genre". Các câu đó có thể đúng trong một ngữ cảnh nào đó, nhưng chưa đủ để quyết định sprint đầu tiên.

Với `$100-500`, lỗi không phải là chọn channel "kém". Lỗi là **mở quá nhiều channel cùng lúc** hoặc chọn channel không trả lời được câu hỏi hiện tại.

Ví dụ:

- Nếu bạn chưa có store screenshot khớp ad promise, channel nào cũng có thể trông tệ vì `Store CVR` bị rò.
- Nếu tracking chưa đo `tutorial_complete`, channel nào cũng khó nói user quality sau install.
- Nếu chỉ có 1 creative yếu, chạy social/video channel rồi kết luận "channel không hợp game" là quá vội.
- Nếu dùng machine-led campaign quá sớm, bạn có thể nhận install nhưng khó biết asset/hook nào tạo learning.

Bài này không dạy "channel nào tốt nhất". Nó dạy **channel nào hợp với câu hỏi học tập hiện tại**.

---

## Core model: Channel = learning instrument

Hãy xem mỗi channel như một dụng cụ đo. Dụng cụ khác nhau đo tín hiệu khác nhau.

```text
Learning question -> readiness -> channel fit -> metric readout -> next action
```

| Nếu learning question là... | Channel job cần ưu tiên | Metric đọc chính | Cần readiness gì trước? |
| --- | --- | --- | --- |
| Hook nào tạo interest sạch nhất? | Creative discovery / social video | CTR, IPM, Store CVR | 2-4 hooks rõ, store proof không quá yếu |
| Store có xác nhận ad promise không? | Store/ASO cleanup hoặc store experiment | Store CVR, install rate | Ad promise rõ, screenshot/copy có thể thay |
| First session có giữ user đúng promise không? | Paid traffic hẹp + event readout | tutorial_complete, level_3_reach, D1 | Event core sạch, onboarding ổn định |
| Search intent có tồn tại không? | Search-intent channel | tap/search conversion, CVR | Metadata/store page tốt, iOS-aware nếu Apple Ads |
| Broad machine distribution có ổn không? | App campaign / automated distribution | CPI, conversion quality, cohort | Asset pack tốt, tracking ổn, budget đỡ mỏng |

Rule: **chọn channel theo việc nó có thể giúp bạn sửa quyết định kế tiếp không**, không theo việc nó nổi tiếng.

---

## Channel selection rubric mẫu

Chấm mỗi channel từ `1-5`. Channel đầu tiên không cần điểm tổng cao nhất trong mọi mặt; nó cần điểm cao ở learning job hiện tại.

| Criterion | 1 điểm | 3 điểm | 5 điểm |
| --- | --- | --- | --- |
| Budget fit | Cần nhiều spend mới đọc được | Có thể đọc directional signal | Phù hợp rõ với `$100-500` |
| Creative fit | Asset hiện tại không đúng định dạng | Cần chỉnh nhẹ | Asset sẵn sàng |
| Measurement clarity | Dashboard khó tách nguyên nhân | Đọc được vài metric | Metric map trực tiếp tới decision |
| Speed of learning | Cần nhiều ngày/volume | Có tín hiệu sau một sprint | Có thể học nhanh trong 3-7 ngày |
| Funnel risk | Store/tracking dễ làm nhiễu nặng | Có risk nhưng kiểm soát được | Risk thấp hoặc đã có guardrail |

Template chấm:

| Channel option | Budget fit | Creative fit | Measurement clarity | Speed | Funnel risk | Decision |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Meta-style social | 4 | 4 | 4 | 4 | 3 | Primary nếu goal là hook/promise fit |
| Google App Campaign | 2 | 3 | 2 | 2 | 3 | Defer nếu budget/asset còn mỏng |
| Apple Ads search | 2 | 3 | 4 | 3 | 3 | Later nếu iOS/search-intent là question |
| Store/ASO cleanup | 5 | 3 | 4 | 4 | 4 | Do before paid nếu store proof yếu |
| Gaming/rewarded network | 3 | 4 | 3 | 3 | 2 | Later nếu first-session proof đã rõ |

### Channel readout contract

Sau khi chọn primary channel, hãy viết contract trước khi spend. Contract này nói rõ channel được phép dạy điều gì, không được phép kết luận điều gì, và điều kiện nào khiến bạn phải hold.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Learning job | Channel này phải trả lời câu hỏi nào? | Hook nào tạo promise fit sạch nhất? |
| Minimum setup | Cần asset/store/event nào trước khi chạy? | 3 hooks, screenshot đầu khớp promise, `tutorial_complete` pass |
| Readout path | Đọc metric theo chuỗi nào? | `CTR/IPM -> Store CVR -> tutorial_complete -> D1` |
| Hold condition | Khi nào không được kết luận channel? | store thay đổi giữa test, event thiếu, spend lệch quá mạnh |
| Not allowed conclusion | Điều gì report không được nói? | không kết luận channel xấu nếu store proof yếu |
| Next action menu | Nếu pattern A/B/C xảy ra thì làm gì? | fix store, iterate hook, hold, or defer channel |

Mẫu contract:

```text
Channel readout contract
- Primary channel:
- Learning job:
- Minimum setup:
- Readout path:
- Hold condition:
- Not allowed conclusion:
- Next action menu:
- Owner/review date:
```

Quy tắc: nếu không viết được "not allowed conclusion", rất dễ blame nhầm channel khi thực ra lỗi nằm ở store, tracking hoặc first session.

---

## Hero visual: decision tree chọn channel

```text
![UA selection decision tree](content/assets/usecases/day-06-hero-diagram.png)Type: hero operating diagram.
Lesson section: Hero visual: decision tree chọn channel.
Previous local asset to replace: content/assets/usecases/day-06-hero-diagram.png.
Visual brief: UA selection decision tree.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

**Visual readout**

- **Inspect:** Decision tree bắt đầu từ readiness và learning question, không bắt đầu từ tên platform.
- **Conclude:** Nếu creative/store/tracking chưa sạch, mở thêm channel sẽ làm kết quả khó đọc hơn.
- **Do not infer:** Không suy ra kênh bị hoãn là kênh xấu. "Deferred" nghĩa là chưa đúng thời điểm hoặc chưa đúng câu hỏi.

---

## Channel family comparison

```text
![UA selection data visual comparison](content/assets/usecases/day-06-data-visual.svg)Type: data visual/chart.
Lesson section: Channel family comparison.
Previous local asset to replace: content/assets/usecases/day-06-data-visual.png.
Visual brief: UA selection data visual comparison.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Channel fit giả lập cho first sprint, 1-5
Meta-style social|4|Fast creative and promise learning if assets are ready
Store/ASO cleanup|5|Best if store proof is currently the bottleneck
Google App Campaign|2|Useful later, harder to diagnose with thin budget
Apple Ads search|3|Good intent read, less aligned with Android-first first sprint
Gaming network|3|Good when gameplay proof and first session are already clear
:::

| Channel family | Learning job mạnh | Phù hợp first sprint khi | Nên hoãn khi |
| --- | --- | --- | --- |
| Meta-style social/app ads | Test creative promise và ad-to-store continuity | Có 2-4 video hooks, store proof tạm ổn, muốn đọc `CTR -> CVR` | Chỉ có 1 weak creative hoặc store chưa xác nhận promise |
| Google App Campaigns | Automated distribution và asset mix learning | Asset pack đủ, tracking tốt, budget không quá mỏng | Cần biết chính xác hook nào thắng trong budget nhỏ |
| Apple Ads/Search | Search intent và App Store discovery | iOS-aware, metadata tốt, muốn đọc intent cụ thể | Android-first sprint đầu và chưa có iOS readiness |
| Store/ASO cleanup | Sửa bottleneck store trước paid spend | Ad interest có nhưng store proof yếu | Cần user quality/retention learning ngay |
| Gaming/rewarded networks | Gameplay-context traffic, game-like audience | Core loop nhìn rõ, first-session proof khá tốt | Tutorial/first win còn mơ hồ |

**Visual readout**

- **Inspect:** Không có channel nào thắng mọi criterion. Mỗi channel mạnh ở một job.
- **Conclude:** First sprint nên ưu tiên channel dễ trả lời câu hỏi hẹp nhất.
- **Do not infer:** Điểm fit không phải benchmark thị trường. Nó là rubric để team tự chấm theo readiness hiện tại.

---

## Hướng dẫn đọc số theo channel

Đọc channel qua funnel chain:

```text
channel placement -> ad promise -> store proof -> first-session proof -> metric pattern -> next action
```

| Pattern | Cách đọc | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| Social CTR ổn, Store CVR yếu | Creative tạo interest nhưng store không xác nhận promise | Sửa first screenshot/copy hoặc giảm promise lệch | Kết luận social traffic kém |
| Google automated campaign có install nhưng khó biết hook nào tốt | Setup quá broad cho câu hỏi creative | Quay lại test hẹp hơn hoặc nhóm asset theo theme rõ | Đổ thêm tiền để máy tự tìm câu trả lời |
| Apple/search tap intent có nhưng volume nhỏ | Intent signal có ích nhưng không đủ broad learning | Dùng như supplemental read, không thay first sprint Android | Gọi đây là channel strategy hoàn chỉnh |
| Gaming network CPI ổn, D1 yếu | Người chơi thử game nhưng first session không giữ được | Sửa onboarding/first win | Scale vì CPI có vẻ ổn |
| Store cleanup tăng CVR trước paid scale | Store proof từng là bottleneck | Chạy paid sprint sau khi listing sạch hơn | Bỏ qua vì "không phải paid channel" |

Một channel test tốt phải kết thúc bằng câu: "Channel này dạy mình X, nên tuần sau làm Y." Nếu chỉ kết thúc bằng "CPI bao nhiêu", bài test còn thiếu decision.

---

## Worked example: chọn channel cho puzzle prototype với `$300`

Context:

- Android-first block puzzle prototype.
- Có 3 video hooks: `relax clear`, `hard challenge`, `satisfying combo`.
- Store screenshot đầu tạm ổn nhưng chưa hoàn hảo.
- Tracking có `first_open`, `tutorial_complete`, `level_complete`.
- Budget: `$300`, không đủ để mở 3 network cùng lúc.

Chấm rubric:

| Channel | Budget fit | Creative fit | Measurement clarity | Speed | Funnel risk | Read |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Meta-style social | 4 | 4 | 4 | 4 | 3 | Hợp để test hook/promise fit |
| Google App Campaign | 2 | 3 | 2 | 2 | 3 | Có thể useful later, nhưng sprint này khó chẩn đoán |
| Store/ASO cleanup | 5 | 3 | 4 | 4 | 4 | Cần làm song song nếu screenshot yếu |
| Gaming network | 3 | 3 | 3 | 3 | 2 | Hoãn đến khi first-session proof rõ hơn |

Decision:

- **Primary channel:** Meta-style social/app ads.
- **Deferred channel:** Google App Campaign.
- **Not testing yet:** Gaming/rewarded network.
- **Pre-work:** tighten first screenshot để không làm CVR nhiễu.
- **Learning job:** hook nào tạo promise fit sạch nhất từ `CTR -> Store CVR -> tutorial_complete`.

Verdict không phải "Meta tốt hơn Google". Verdict là: **với asset/readiness hiện tại, Meta-style social trả lời câu hỏi của sprint này rõ hơn**.

### Channel launch memo

Khi chốt channel, output tốt nhất là một launch memo nhỏ để team chạy đúng scope và không tự thêm biến.

```text
Channel launch memo
- Primary channel: Meta-style social/app ads.
- Learning job: compare 3 hook promises through CTR/IPM -> Store CVR -> tutorial_complete.
- Budget: $300 total, one primary channel only.
- Asset scope: 3 hooks, 1 variant each; no new hook family mid-test.
- Store scope: screenshot 1 tightened before launch; no store change during read window.
- Tracking scope: first_open, tutorial_complete, level_complete, D1 guardrail.
- Hold rule: if spend distribution is unfair or tutorial event breaks, do not call channel winner/loser.
- Deferred: Google App Campaign until asset pack/tracking mature.
- Not testing yet: gaming network until first-session proof is stronger.
```

Decision memo sau report nên viết:

| Pattern | Channel verdict | Next action |
| --- | --- | --- |
| CTR/IPM khác nhau rõ, CVR/D1 đủ đọc | channel answered hook question | keep channel, iterate winning promise |
| CTR tốt, CVR thấp across hooks | channel can create attention; store proof weak | fix store before judging channel |
| CTR/CVR ổn, tutorial/D1 yếu | channel brought users, product proof weak | fix first session, rerun same channel later |
| Spend lệch mạnh giữa hooks | delivery bias | hold verdict, rerun cleaner |
| Tracking thiếu event chính | measurement block | fix tracking, no channel conclusion |

Điểm quan trọng: channel verdict không phải "kênh tốt/xấu". Verdict tốt là "kênh này đã trả lời hoặc chưa trả lời learning job nào".

### Channel decision certificate

Trước khi launch channel đầu tiên, viết certificate ngắn để khóa scope và cách đọc. Certificate này là "giấy phép" cho channel test: nó nói kênh được dùng để học gì, điều gì phải pass trước spend, và kết luận nào bị cấm.

| Certificate field | Câu hỏi cần khóa | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Primary channel | Kênh duy nhất của sprint là gì? | Một kênh chính, không chia ngân sách | Budget bị loãng |
| Learning job | Kênh phải trả lời câu hỏi nào? | Một câu hẹp gắn với promise/store/first session | Channel test thành CPI report |
| Minimum evidence | Asset/store/event nào phải sẵn sàng? | Hook assets, store proof, core events rõ | Không đọc user quality |
| Deferred list | Kênh nào chưa test và vì sao? | Có condition để mở sau | Scope creep |
| Blocked conclusions | Report không được kết luận gì? | Không blame channel nếu store/tracking fail | Team đổi channel cảm tính |
| Review cadence | Ai đọc, khi nào, đọc bằng template nào? | Owner/date/report path rõ | Report không thành action |

```text
Channel decision certificate
- Primary channel:
- Learning job:
- Minimum evidence before spend:
- Deferred channels:
- Blocked conclusions:
- Review owner/date:
- Condition to keep / defer / stop channel:
```

Certificate tốt có thể nói "channel này chỉ đọc hook/store direction, không đọc ROAS". Câu giới hạn như vậy không làm test yếu đi; nó làm report đáng tin hơn.

---

## Operating checklist trước khi chọn channel

| Check | Pass khi | Nếu fail |
| --- | --- | --- |
| Learning question | Viết được một câu hỏi hẹp | Không chọn channel vội |
| Creative inventory | Có 2-4 cells khác biệt rõ | Làm thêm hoặc giảm scope |
| Store proof | First screenshot xác nhận hook chính | Sửa store trước |
| Event core | Đọc được `first_open`, `tutorial_complete`, early progress | Fix tracking trước |
| Budget concentration | Chỉ 1 primary channel cho first sprint | Dừng ý định chia quá nhiều |
| Deferred list | Có ghi kênh hoãn và lý do | Dễ mở thêm channel theo cảm tính |
| Owner | Có người chốt pause/continue/fix | Test xong không ai ra quyết định |

Checklist này bảo vệ lesson 5: budget nhỏ cần learning density, và channel choice là nơi dễ làm density sụp nhất.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Meta app ads là discovery/creative surface

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Meta mô tả app ads có thể promote app across Facebook, Messenger, Instagram và Audience Network; app promotion objective có thể hướng tới installs hoặc app events. | Với sprint nhỏ có 2-4 hooks, Meta-style social có thể hữu ích để đọc creative promise và ad-to-store continuity. | Không suy ra Meta luôn là first channel. Nếu store/tracking yếu, channel readout vẫn nhiễu. |

### Usecase 2: Google App Campaigns dựa nhiều vào assets và automation

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Ads Help mô tả App campaigns dùng nhiều asset types như headlines, descriptions, images, videos và store assets; Google Ads API docs ghi App campaigns automate targeting and bidding based on goal and provided assets. | Google App Campaigns có thể mạnh khi asset pack và tracking đã đủ trưởng thành, nhưng với first micro sprint, automation có thể làm khó trả lời "hook nào đang dạy gì". | Không suy ra Google kém. Chỉ suy ra rằng nếu learning question cần diagnosis hẹp, setup broad có thể chưa hợp lúc này. |

### Usecase 3: Apple Ads/Search là intent-rich nhưng platform-specific

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple Ads có placements trong App Store journey như Today tab, Search tab, Search results và Product Pages; Search results ads tiếp cận user khi họ đang search app để download. | Đây là intent-rich surface, hữu ích khi bạn muốn đọc iOS/App Store search demand hoặc metadata fit. | Không suy ra Android-first puzzle prototype nên mở Apple Ads trong sprint đầu nếu iOS build, metadata và measurement chưa sẵn sàng. |

### Usecase 4: Case nội bộ - creative spike với cohort ổn

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Case `Idle RPG creative spike`: combat-progression hook có IPM 18 so với account avg 7, CPI `$0.65`, D1 38%, D7 16%, early ROAS direction stable. Recommendation là scale cautiously và tạo variants quanh cùng motivation. | Khi creative signal và cohort quality cùng ổn, channel có thể được dùng để mở rộng có kiểm soát. | Không suy ra spike nào cũng nên scale. Bài học là phải đọc creative signal cùng cohort quality, không đọc IPM/CPI một mình. |

---

## Common mistakes

- **Mistake: Chọn channel theo danh tiếng** - **Correction:** Chọn theo learning question, readiness và metric readout cần có.
- **Mistake: Chia `$300` cho 3-4 channels** - **Correction:** Chọn 1 primary channel, ghi deferred channels cho sprint sau.
- **Mistake: Blame channel khi store proof yếu** - **Correction:** Nếu `CTR` có interest nhưng `Store CVR` yếu, sửa store trước khi đổi channel.
- **Mistake: Dùng automated distribution để trả lời câu hỏi creative hẹp** - **Correction:** Nếu cần biết hook nào học được gì, test hẹp trước.
- **Mistake: Xem ASO/store cleanup là việc phụ** - **Correction:** Store cleanup có thể là channel-readiness work quan trọng nhất trước paid spend.

---

## English Terms You Should Keep

| Term | Cách hiểu trong bài |
| --- | --- |
| `Ad network` | Nơi mua hoặc phân phối traffic paid |
| `Campaign` | Cấu trúc chạy ads gồm objective, budget, targeting/placement và assets |
| `Optimization` | Cách platform hoặc team điều chỉnh để đạt goal đã chọn |
| `Learning job` | Việc cụ thể channel phải dạy trong sprint này |
| `Intent` | Mức chủ động tìm kiếm/quan tâm của user trước khi thấy ad |
| `Primary channel` | Kênh chính duy nhất của sprint hiện tại |
| `Deferred channel` | Kênh tốt nhưng hoãn vì chưa đúng readiness hoặc question |
| `Placement` | Bề mặt ad xuất hiện: feed, search results, product page, in-game inventory |

---

## Lab output example

```text
Channel Selection Note - Sprint 01

Learning question:
Which puzzle hook creates cleaner promise fit from ad click to store install and tutorial completion?

Primary channel:
Meta-style social/app ads.

Why this channel first:
We have 3 short video hooks and need fast creative/promise learning. Budget is too small to split across multiple channels.

Readout metrics:
CTR/IPM -> Store CVR -> tutorial_complete -> D1 guardrail.

Main risk:
First screenshot may depress CVR and make the channel look worse than it is.

Pre-work:
Tighten first screenshot and short description around the selected promise.

Deferred channel:
Google App Campaigns, because the asset pack and tracking confidence are not ready for broad automated distribution.

Not testing yet:
Gaming/rewarded network, because first-session proof is not strong enough.

Channel readout contract:
- Minimum setup:
- Hold condition:
- Not allowed conclusion:
- Owner/review date:

Channel decision certificate:
- Primary channel:
- Learning job:
- Minimum evidence before spend:
- Deferred channels:
- Blocked conclusions:
- Review owner/date:
```

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Viết learning question của sprint tiếp theo bằng một câu.
2. Liệt kê 3 channel options thực tế.
3. Chấm từng channel theo `budget fit`, `creative fit`, `measurement clarity`, `speed of learning`, `funnel risk`.
4. Chọn đúng 1 primary channel.
5. Ghi 1 deferred channel và lý do hoãn.
6. Ghi 1 thing not testing yet để bảo vệ scope.
7. Viết risk note: điều gì có thể làm bạn blame nhầm channel?
8. Viết channel readout contract.
9. Viết launch memo khóa asset/store/tracking scope.
10. Viết Channel decision certificate.

Quality chain check:

- Nếu learning question chưa rõ, channel choice chưa có nghĩa.
- Nếu store proof chưa sạch, paid channel readout sẽ nhiễu.
- Nếu tracking chưa sạch, không dùng channel test để đọc user quality.
- Nếu mở hơn 1 primary channel với `$100-500`, phải giảm scope.

---

## Final UA Plan Update

Cập nhật field **budget / test scope** trong Final UA Plan:

```text
Primary channel:
[one channel]

Learning job:
[what this channel must teach]

Why this channel first:
[budget fit + creative readiness + measurement clarity]

Readout metrics:
[CTR/IPM -> Store CVR -> first-session metric -> guardrail]

Main risk:
[what could make us misread this channel]

Channel readout contract:
[learning job / setup / hold / not allowed conclusion]

Channel decision certificate:
[primary / minimum evidence / blocked conclusions / review cadence]

Launch memo:
[budget / asset scope / store scope / tracking scope / review date]

Deferred channel:
[channel to test later + condition for using it]

Not testing yet:
[channel/surface deliberately excluded from this sprint]
```

Field liên quan sẽ được dùng lại ở Week 2-4: `creativeMatrix`, `metricTargets`, `successCriteria`, `nextAction`.

---

## Checklist Focus

- [ ] Chấm ít nhất 3 channel options bằng cùng một rubric.
- [ ] Chọn đúng 1 primary channel cho first sprint.
- [ ] Viết vì sao channel đó match learning question và asset readiness.
- [ ] Ghi 1 deferred channel.
- [ ] Ghi 1 thing not testing yet.
- [ ] Ghi risk note để tránh blame nhầm channel.
- [ ] Có Channel decision certificate.
- [ ] Có blocked conclusions để không blame nhầm channel.

---

## Curated References

- [Meta Business Help - About app ads on Facebook, Instagram and Audience Network](https://www.facebook.com/business/help/1471413626484885) - official overview về app ads surfaces.
- [Google Ads Help - Asset types for App campaigns](https://support.google.com/google-ads/answer/9948381?hl=en) - official source về asset inputs cho App campaigns.
- [Google Ads API - App campaigns overview](https://developers.google.com/google-ads/api/docs/app-campaigns/overview) - official note về automated targeting/bidding dựa trên goal và assets.
- [Apple Ads - Ads on the App Store](https://ads.apple.com/app-store) - App Store ad placements overview.
- [Apple Ads Help - Search results](https://ads.apple.com/app-store/help/ad-placements/0082-search-results) - official page về search-intent placement.
