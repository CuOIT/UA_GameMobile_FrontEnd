---
day: 21
title: "Week 3 synthesis: creative and store readiness"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [ASO, Creative testing, Soft launch]
artifact: "Creative readiness packet"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Creative readiness packet**: bộ tối thiểu để bước sang Week 4 campaign operation mà không mua traffic vào một promise mơ hồ.

Packet gồm: hook family, creative format, store proof, first-session proof, event proof, metric readout và launch gate cho từng hook.

Quyết định chính: **hook nào đủ proof để launch, hook nào phải hold, và nếu số xấu thì sửa creative, store, product hay tracking**.

Artifact này cập nhật field **creativeMatrix**, **tracking**, **successCriteria**, **killCriteria** và **nextAction** trong Final UA Plan.

## Why this matters

Week 3 rất dễ kết thúc bằng cảm giác "đã có nhiều ý tưởng ad". Nhưng micro soft-launch không cần nhiều ý tưởng. Nó cần một packet nhỏ mà mọi cell đều đọc được.

Nếu hook thắng `CTR` nhưng store page không chứng minh promise, bạn sẽ mất budget ở `CVR`. Nếu store chứng minh tốt nhưng first session không giữ lời, D1 sẽ xấu và team không biết sửa onboarding hay creative. Nếu event proof chưa QA, report Week 4 chỉ là noise có giao diện đẹp.

Readiness không phải production polish. Readiness là chain đủ chắc để khi metric lệch, team biết stage nào đang phản bội promise.

## Core model: readiness equals proof chain

Đọc readiness theo chuỗi:

`hook promise -> format proof -> store proof -> first-session proof -> tracking proof -> metric rule -> launch decision`

| Gate | Câu hỏi pass/fail | Nếu fail thì không launch vì | Owner |
| --- | --- | --- | --- |
| Hook promise | Hook có gắn với một motivation rõ không? | Không biết user click vì động cơ nào | UA/creative |
| Format proof | Format có chứng minh promise nhanh không? | Asset chỉ đẹp hoặc theo trend | Creative |
| Store proof | Screenshot/video/copy có tiếp lời hứa không? | `CTR` tốt có thể chết ở store `CVR` | Store owner |
| First-session proof | Tutorial/level đầu có deliver promise không? | Install không biến thành retention | Product |
| Tracking proof | Event đo stage đó đã QA chưa? | Report không chẩn đoán được | Engineering |
| Metric rule | Có win/weak/kill action trước khi chạy không? | Team tranh luận sau khi mất tiền | UA owner |

Một hook chỉ launch-ready khi **tất cả gate quan trọng đều có bằng chứng đủ dùng**. Không cần hoàn hảo, nhưng không được mù.

## Creative readiness packet mẫu

| Hook family | Format | Variants | Store proof | First-session proof | Event proof | Read metric | Launch call |
| --- | --- | ---: | --- | --- | --- | --- | --- |
| Clear chaos | 8s gameplay video | 2 | Screenshot 1 shows messy-to-clean board | Level 2 gives real combo clear | `level_complete`, `moves_used`, `tutorial_complete` | `CTR`, `IPM`, `CVR`, D1 direction | Launch after event QA |
| Calm break | Static + short video | 2 | Store page says no timer, calm board | Tutorial has no timer pressure | `session_start`, `tutorial_complete` | `CVR`, D1 direction | Hold if tutorial still feels rushed |
| Perfect move | Static puzzle frame | 2 | Near-fail board is readable in screenshot | Level 1-3 has fair challenge | `level_fail`, `hint_used`, `level_complete` | `CTR`, `CVR`, retry/fail pattern | Launch only if store proof is readable |
| Cozy unlock | Store screenshot + meta clip | 1 | Meta/collection visible | Unlock appears in first session | `unlock_viewed`, `session_start` | `CVR`, D1, unlock engagement | Hold if meta not built |

First packet nên có 2-3 hook families, không phải 8-10. Với `$100-500`, ít cells nhưng chain sạch thường học tốt hơn packet lớn.

### Launch acceptance contract

Trước Week 4, mỗi hook cần một contract ngắn: nếu launch thì được phép học điều gì, và điều gì vẫn chưa được phép kết luận. Contract này ngăn team biến một test nhỏ thành cuộc bỏ phiếu cảm tính về "game có tiềm năng không".

| Hook family | Allowed launch question | Blocked conclusion | Proof required before spend | Owner |
| --- | --- | --- | --- | --- |
| Clear chaos | Người chơi có phản hồi với promise "dọn rối thành gọn" không? | Không kết luận toàn bộ core loop tốt nếu thiếu D1/event proof | Store screenshot 1 + level 2 combo + `level_complete(moves_used)` QA | UA + Design |
| Calm break | Relax hook có thể kéo install chất lượng không nếu first session đúng tone? | Không launch khi tutorial còn countdown, vì D1 xấu sẽ bị đọc sai | Tutorial không áp lực thời gian + `tutorial_complete(duration_sec)` QA | Product |
| Perfect move | Puzzle challenge frame có tạo click/store interest không? | Không gọi hook thắng nếu store screenshot không đọc được trên mobile | Screenshot readability pass + `level_fail(fail_reason)` QA | Creative + Store |
| Cozy unlock | Meta/unlock có đủ thật để test không? | Không dùng ad/store để hứa feature chưa có trong build | Unlock visible in first session + event proof; nếu chưa có thì remove | Product |

Decision rule: mỗi hook chỉ được vào launch packet khi có ít nhất một **allowed launch question** và danh sách **blocked conclusions** rõ. Nếu không viết được blocked conclusion, team chưa hiểu rủi ro đọc sai của hook đó.

## Readiness gate diagram

```text
![Readiness gate diagram](content/assets/usecases/day-21-hero-diagram.svg)Type: hero operating diagram.
Lesson section: Readiness gate diagram.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Gate order | Pass evidence | Hold evidence | Launch decision |
| --- | --- | --- | --- |
| 1. Hook | Motivation + promise written in one sentence | Hook is just a catchy line | Hold until motivation is named |
| 2. Creative format | Opening frame proves promise in 1-2 seconds | Format chosen because "trend" | Remake asset, do not add budget |
| 3. Store proof | First screenshot/video continues ad promise | Store shows menu/meta unrelated to hook | Fix store before traffic |
| 4. First session | Tutorial/level 1-3 delivers promise | First session contradicts ad/store | Fix product or remove hook |
| 5. Tracking | Event order and parameters pass QA | Events missing or inconsistent by build | QA tracking first |
| 6. Metric rule | Win/weak/kill actions defined | Team will decide later | Write rules before launch |

**Inspect:** đọc theo thứ tự gate. Một hook fail ở gate sớm thì chưa cần tranh luận metric sau.

**Conclude:** launch packet nhỏ nhưng gate rõ tốt hơn packet lớn không đọc được.

**Do not infer:** readiness không yêu cầu asset đẹp như studio lớn; nó yêu cầu proof chain đủ thật để học.

## Packet completeness scorecard

```text
![Creative packet gate scorecard](content/assets/usecases/day-21-data-visual.svg)Type: scorecard / launch gate heatmap.
Lesson section: Packet completeness scorecard.
Visual brief: turn the packet scorecard and triage rule into a compact heatmap where each hook family shows weakest gate, launch call, and next action.
Teaching job: help the learner identify why a hook is launch-ready, held, repaired, or removed from the Week 4 packet.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Hook family | Hook clarity | Store proof | First-session proof | Event proof | Decision rule | Launch call |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Clear chaos | 4/5 | 4/5 | 4/5 | 3/5 | 4/5 | Launch-ready after event QA |
| Calm break | 4/5 | 3/5 | 2/5 | 3/5 | 3/5 | Fix tutorial tone first |
| Perfect move | 5/5 | 3/5 | 2/5 | 2/5 | 3/5 | Hold; curiosity trap risk |
| Cozy unlock | 3/5 | 2/5 | 1/5 | 1/5 | 2/5 | Remove from first packet |

**Inspect:** score thấp nhất trong chain quan trọng hơn điểm trung bình.

**Conclude:** một hook có `Hook clarity` 5/5 vẫn chưa launch nếu first-session proof 2/5.

**Do not infer:** scorecard không phải pseudo-science. Nó là forcing function để team nói rõ gate nào còn mù.

Readiness triage rule:

| Lowest weak gate | What it means | Week 4 action | Do not do yet |
| --- | --- | --- | --- |
| Hook promise | Motivation is unclear | Rewrite hook sentence and target player situation | Do not produce more variants |
| Creative format | Asset does not prove promise fast | Remake opening frame/first 2 seconds | Do not blame store or product |
| Store proof | Clicker cannot verify promise on listing | Replace screenshot 1, preview video opening, or short description | Do not scale because CTR looks good |
| First-session proof | Install does not receive the promised payoff | Fix tutorial, level 1-3, difficulty, reward timing | Do not call it creative fatigue |
| Tracking proof | Report cannot diagnose the chain | QA events, parameters, build/source tags | Do not choose winner/loser |
| Metric rule | Team has no pre-agreed action | Write win/weak/kill rules and owner | Do not launch and decide later |

Triage principle: launch only hooks whose weakest gate is actionable and named. If the weakest gate is unknown, the packet is not ready; if the weakest gate is known, the next action must target that one gate first.

Launch decision matrix:

| Packet state | Risk level | Decision | Required note in Final UA Plan |
| --- | --- | --- | --- |
| All critical gates pass, event QA pending only | Low/medium | Launch after QA | "Launch-ready after event QA" with exact missing event/parameter |
| Hook/store/first-session pass, metric rule weak | Medium | Hold one review cycle | Write win/weak/kill action before spend |
| Store proof weak, creative looks strong | Medium/high | Repair store first | Name screenshot/video/copy to replace before traffic |
| First-session proof weak | High | Hold or reduce promise | Name level/tutorial/reward fix, not a creative task |
| Tracking proof weak | High | No paid launch | Name events, parameters, build tags and QA owner |
| Multiple gates weak or unclear | Very high | Remove from first packet | Move to backlog with missing proof condition |

Decision depth:

```text
Launch = enough proof to learn safely.
Hold = promising hook, but one named gate is not ready.
Repair = gate is known and fix is small enough before Week 4.
Remove = promise requires product/store/tracking work outside current sprint.
```

Không dùng "launch-ready" như nhãn cảm tính. Viết nó như câu có điều kiện: "Clear chaos launch-ready after moves_used QA" hoặc "Perfect move held until screenshot 1 is readable on mobile". Câu càng cụ thể, Week 4 càng ít tranh luận.

## Hướng dẫn đọc số

| Pattern sau launch | Readiness diagnosis | Next action |
| --- | --- | --- |
| `CTR` tốt, store `CVR` thấp | Store proof yếu hoặc mismatch với ad promise | Sửa screenshot/video/copy trước khi làm hook mới |
| `CTR` thấp, `CVR` và tutorial complete tốt | Motivation có fit nhưng opening frame yếu | Refresh creative first 2 seconds, giữ promise |
| `CTR` và `CVR` tốt, D1 thấp | First-session proof không giữ lời | Sửa tutorial/level 1-3 hoặc giảm promise |
| D1 xấu nhưng event thiếu | Packet chưa thật sự ready | Fix tracking, không kết luận product |
| Tất cả signal yếu | Motivation/promise có thể sai | Pause hook family, quay lại hook bank |
| Một hook thắng nhưng không biết vì sao | Matrix thay đổi quá nhiều biến | Rebuild packet với one learning variable per cell |

Rule: một report Week 4 tốt phải chỉ được **stage lỗi trong chain**, không chỉ xếp hạng ad theo `CTR`.

## Worked example: packet audit

Calming Hex Puzzle chuẩn bị chạy Android micro campaign `$200`. Team có 4 hook families.

| Hook | Missing piece | Risk | Decision |
| --- | --- | --- | --- |
| Clear chaos | `level_complete` có nhưng thiếu `moves_used` | Không đọc được combo proof | Launch sau khi thêm parameter và QA |
| Calm break | Tutorial có countdown gây áp lực | Promise relax mismatch | Hold; sửa tutorial hoặc bỏ calm hook |
| Perfect move | Store screenshot quá nhỏ, board khó đọc | `CVR` có thể fail vì proof yếu | Replace screenshot before launch |
| Cozy unlock | Game chưa có meta unlock thật | Promise không chứng minh được | Remove from packet |

Final packet chỉ launch 2 hook families: Clear chaos và Perfect move. Calm break được hold cho đến khi tutorial không còn áp lực. Cozy unlock bị loại.

Verdict: giảm packet từ 4 hook xuống 2 hook không phải mất cơ hội. Nó tăng khả năng đọc signal trong budget nhỏ.

Second-pass audit:

| Hook | Nếu vẫn launch thì chuyện gì có thể xảy ra? | Better action | Learning protected |
| --- | --- | --- | --- |
| Clear chaos | Report có thể nói combo tốt nhưng thiếu `moves_used`, team không biết clear có thật sự efficient không | Launch sau event parameter QA | Đọc được promise "smart move" thay vì chỉ level complete |
| Calm break | User click vì relax nhưng gặp timer pressure, D1 xấu sẽ bị hiểu nhầm là motivation fail | Hold và sửa tutorial tone | Tách product mismatch khỏi audience mismatch |
| Perfect move | CTR có thể cao nhưng store CVR fail vì screenshot khó đọc trên mobile | Repair screenshot trước launch | Biết challenge hook fail do promise hay do store proof |
| Cozy unlock | Store/ad hứa meta chưa có thật, mọi metric xấu đều khó đọc | Remove khỏi packet | Tránh mua traffic vào feature chưa tồn tại |

Packet decision note nên viết theo format:

```text
Launch:
- Clear chaos: pass hook/store/first-session; event QA missing moves_used only.
- Perfect move: launch only after screenshot readability repair.

Hold:
- Calm break: timer pressure contradicts relax promise.

Remove:
- Cozy unlock: meta unlock not in build, no first-session proof.
```

Điểm quan trọng: "hold" và "remove" cũng là quyết định chất lượng, không phải thất bại. Chúng bảo vệ budget để Week 4 học từ cell có thể đọc được.

### Second-pass packet read

Đọc lại packet bằng vai trò của từng owner trước khi bước sang Week 4:

| Owner | Cần xác nhận | Nếu fail | Không được làm |
| --- | --- | --- | --- |
| UA/creative | Mỗi hook test đúng một promise/motivation | Gộp hoặc rewrite hook | Không sản xuất thêm variant trước khi promise rõ |
| Store owner | Screenshot/video đầu tiên chứng minh cùng promise | Sửa listing asset | Không đổ lỗi cho channel khi `CVR` thấp |
| Product/design | First 3 phút deliver payoff thật | Sửa tutorial/level/reward timing | Không gọi D1 xấu là creative fatigue |
| Engineering/analytics | Event proof pass trong build đúng version | QA event/parameter/build tag | Không chọn winner khi tracking fail |

Packet tốt phải làm rõ cả **launch list** và **hold list**. Nếu chỉ có launch list, team sẽ quên vì sao một hook bị loại và dễ kéo nó trở lại campaign khi cần thêm asset cho đủ số lượng.

## Launch readiness checklist

| Check | Pass condition |
| --- | --- |
| Hook bank | 2-3 hook families, mỗi hook có motivation |
| Format choice | Format chứng minh promise, không chạy theo trend |
| Store proof | First screenshot/video/copy tiếp tục ad promise |
| First-session proof | Tutorial/level 1-3 deliver promise trong 3 phút đầu |
| Tracking | Event đo proof đã QA trong build |
| Budget fit | Số cells phù hợp budget, không chia nhỏ quá mức |
| Decision rule | Có win/weak/kill action trước khi launch |
| Hold list | Hook thiếu proof được ghi rõ lý do hold |

Quality chain: `packet -> campaign -> report -> diagnosis -> decision -> learning log`.

### Packet freeze memo

Ngay trước khi chuyển sang campaign operation, viết một memo freeze packet. Mục tiêu không phải khóa sáng tạo mãi mãi, mà là khóa phạm vi học để report Week 4 không bị nhiễu bởi thay đổi liên tục.

```md
Creative packet freeze - Week 4 handoff

Launch cells:
- Clear chaos / 8s gameplay / variants A-B
  Allowed question: does messy-to-clean promise create qualified installs?
  Required proof: screenshot 1, level 2 combo, level_complete(moves_used), tutorial_complete.
  Weak action: CTR ok + CVR low -> repair store proof, not product.

- Perfect move / static puzzle frame / variants A-B
  Allowed question: does readable challenge frame create curiosity without clickbait?
  Required proof: readable screenshot, level_fail(fail_reason), hint_used, level_complete.
  Weak action: CTR high + tutorial drop high -> reduce tension or fix onboarding promise.

Held cells:
- Calm break: blocked by timer pressure in tutorial.
- Cozy unlock: blocked by missing first-session unlock proof.

Frozen variables:
- Do not change hook sentence, store screenshot 1, first-session proof, or event definition during first readout window.
- Only change a cell after the pre-agreed weak action triggers.

Report rule:
- Every Week 4 readout must map signal to creative/store/product/tracking, not just rank ads.
```

Một packet chưa freeze sẽ khiến team sửa asset giữa chừng, đổi store screenshot, thêm event, rồi cuối tuần không biết signal đến từ đâu. Freeze nhỏ trong 3-5 ngày giúp budget ít vẫn tạo learning thật.

### Week 4 handoff certificate

Trước khi chuyển sang campaign operation, viết certificate này để team biết packet nào được launch, packet nào bị hold, và readout sẽ route signal về đâu.

```text
Week 4 handoff certificate
- Launch cells:
- Held cells:
- Missing proof by held cell:
- Frozen variables:
- Allowed Week 4 decisions:
- Blocked conclusions:
- Readout routing:
- Owner/date:
```

Certificate này là cầu nối giữa creative/store readiness và campaign operation. Nếu nó chưa có held cells hoặc blocked conclusions, packet chưa đủ chặt để mua traffic.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play dùng feature graphic, screenshots, short description và videos để showcase app features/functionality trên listing và promotional surfaces. | Store proof là một launch gate: ad promise cần được preview assets xác nhận trước khi mua traffic. | Không suy ra screenshot phải copy y hệt ad frame; chỉ cần chứng minh cùng promise. |
| [Apple product page screenshots](https://developer.apple.com/app-store/product-page/) | Apple nói screenshot nên visually communicate user experience và highlight essence/main benefit của app. | First screenshots không phải trang trí; chúng phải nối promise với user experience thật. | Không suy ra có thể hứa feature chưa xuất hiện trong first session. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Developers phải khai báo privacy/security practices trong Play Console; thông tin này hiển thị trên store listing. | Creative readiness cần tracking/privacy gate nếu packet phụ thuộc analytics/ads/attribution SDK. | Không dùng bài này thay policy/legal review; đây là checklist vận hành cho launch readiness. |

Readout table:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Store screenshot 1 | Có chứng minh cùng promise với ad không? | Nếu không, `CTR` tốt vẫn chưa đủ launch. | Không dùng screenshot đẹp nhưng không liên quan. |
| Event proof | Event có đo được proof stage không? | Nếu thiếu, report Week 4 sẽ không chẩn đoán được. | Event valid không đồng nghĩa product tốt. |
| Hold list | Hook bị hold vì thiếu proof nào? | Hold list giúp tránh mua traffic vào lời hứa chưa thật. | Hold không có nghĩa hook đó tệ mãi mãi. |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Launch vì đã có nhiều ad ideas. | Launch khi từng hook có proof chain rõ. |
| Để store proof sửa sau campaign. | Store proof là gate trước traffic. |
| Không có weak-signal action. | Mỗi hook phải có action nếu `CTR`/`CVR`/D1 lệch. |
| Packet quá lớn so với budget. | Giữ packet nhỏ để mỗi cell có đủ data đọc hướng. |
| Tracking chưa QA nhưng vẫn chạy. | QA event proof trước paid traffic. |
| Không ghi hook bị hold. | Hold list giúp team không quên lý do chưa launch. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Creative readiness` | Mức sẵn sàng của hook, asset, proof và metric rule |
| `Store proof` | Bằng chứng trên store xác nhận ad promise |
| `First-session proof` | Trải nghiệm đầu chứng minh lời hứa |
| `Soft launch` | Test thị trường nhỏ để học trước khi scale |
| `Decision rule` | Điều kiện định sẵn để scale, iterate hoặc stop |
| `Launch gate` | Điều kiện pass/fail trước khi mua traffic |
| `Hold list` | Danh sách hook chưa launch vì thiếu proof |

## Lab output example

```md
Creative readiness packet - Calming Hex Puzzle

Launch-ready hook 1: Clear chaos
- Format: 8s gameplay video, 2 variants.
- Store proof: screenshot 1 shows before/after board.
- First-session proof: level 2 creates a real combo clear.
- Event proof: level_complete(level_id, moves_used, duration_sec), tutorial_complete.
- Metrics: CTR, IPM, store CVR, tutorial_complete, D1 direction.
- Weak action: if CTR ok but CVR low, fix screenshot 1.
- Launch gate: pass after event QA.

Launch-ready hook 2: Perfect move
- Format: static puzzle frame, 2 variants.
- Store proof: readable near-fail board screenshot.
- First-session proof: level 1-3 has fair challenge.
- Event proof: level_fail(fail_reason), hint_used, level_complete.
- Weak action: if CTR high but tutorial drop high, reduce clickbait tension.

Held hook: Calm break
- Missing proof: tutorial still uses timer pressure.
- Next action: remove timer pressure or remove relax hook from packet.

Packet freeze:
- Frozen launch cells: Clear chaos A-B, Perfect move A-B.
- Frozen proof: screenshot 1, tutorial/level proof, required event definitions.
- Blocked conclusions: do not judge IAP, long-term retention, or broad audience fit from this packet.
- Allowed Week 4 decisions: repair store proof, repair first-session proof, pause hook family, or keep one hook for next micro test.

Week 4 handoff certificate:
- Launch cells:
- Held cells:
- Frozen variables:
- Allowed Week 4 decisions:
- Blocked conclusions:
- Readout routing:

Readout routing:
- CTR weak + CVR/tutorial healthy -> creative opening repair.
- CTR healthy + CVR weak -> store proof repair.
- CTR/CVR healthy + tutorial/D1 weak -> product promise repair.
- Any key event not QA-pass -> tracking repair before creative verdict.
```

## Practical Lab

1. Gom hook bank, format choices, creative matrix và store proof từ Week 3.
2. Với mỗi top hook, điền store proof và first-session proof.
3. Gắn event proof cần QA.
4. Chấm readiness 1-5 cho từng gate.
5. Loại hook thiếu proof khỏi launch packet và đưa vào hold list.
6. Viết acceptance/rejection rules cho Week 4.
7. Viết allowed launch question và blocked conclusions cho từng hook.
8. Freeze 2-4 launch cells đầu tiên: hook sentence, asset, store proof, first-session proof và event proof không đổi trong readout window đầu.
9. Viết Week 4 handoff certificate.

Quality check: mỗi hook phải trả lời được "nếu signal xấu thì sửa creative, store, product hay tracking?"

## Final UA Plan Update

Cập nhật field **creativeMatrix**:

```md
Creative readiness packet:
- Launch-ready hooks:
- Held hooks and missing proof:
- Store proof per hook:
- First-session proof per hook:
- Event proof required:
- Allowed launch question per hook:
- Blocked conclusions per hook:
- Frozen variables for first readout:
- Acceptance rule:
- Rejection/iterate rule:
- Week 4 handoff certificate:
```

Cập nhật field **tracking**:

```md
Event proof before launch:
- Required events:
- QA status:
- Missing measurement risks:
```

Cập nhật field **successCriteria**, **killCriteria** và **nextAction**:

```md
Week 4 decision rules:
- Win signal:
- Weak signal:
- Kill/hold signal:
- Signal routing: creative/store/product/tracking
- Next action owner:
```

## Checklist Focus

- [ ] Packet nhỏ, đọc được với budget.
- [ ] Mỗi launch hook có proof chain.
- [ ] Store readiness và tracking readiness đều được check.
- [ ] Có acceptance/rejection rule.
- [ ] Có hold list cho hook thiếu proof.
- [ ] Mỗi hook có allowed launch question và blocked conclusions.
- [ ] Packet đã freeze biến chính trước readout window đầu.
- [ ] Week 4 handoff certificate có launch cells, held cells và blocked conclusions.
- [ ] Weak signal đã route về creative/store/product/tracking, không chỉ "ad thắng/thua".
- [ ] Final UA Plan đã cập nhật creativeMatrix, tracking, successCriteria, killCriteria và nextAction.

## Curated References

- [Google Play Console Help: Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Apple Developer: Creating your product page](https://developer.apple.com/app-store/product-page/)
- [Google Play Console Help: Provide information for Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
