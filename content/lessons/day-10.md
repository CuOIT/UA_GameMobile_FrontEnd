---
day: 10
title: "Retention cohorts and first-session proof"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Retention, Cohort, Onboarding]
artifact: "First-session proof checklist"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **First-session proof checklist**: một checklist chứng minh 3-5 phút đầu của game có giao đúng lời hứa mà ad và store đã tạo ra hay không.

Quyết định cần ra:

- Nếu `D1` yếu, bạn nên sửa onboarding/level pacing hay nghi ngờ traffic?
- Nếu `tutorial_complete` yếu, điểm gãy nằm ở loading, tutorial, control, difficulty hay promise mismatch?
- Nếu acquisition metrics đẹp nhưng retention yếu, có được scale tiếp không?
- Trường **tracking** trong Final UA Plan cần event nào để Week 2 đọc cohort đúng?

Lesson này không dạy “D1 bao nhiêu là tốt cho mọi game”. Nó dạy cách dùng `cohort`, `D1/D7`, `tutorial_complete`, `level_3_complete` và event funnel để ra quyết định sửa build.

---

## Why this matters

Day 9 giúp bạn tránh scale nhầm vì `CTR`, `IPM`, `CPI` nhìn đẹp. Nhưng ngay cả khi acquisition đầu phễu ổn, người chơi vẫn có thể rơi khỏi game vì first session không giao lời hứa.

Ví dụ: ad hứa “calm block puzzle, no timer pressure”, store screenshot cho board sạch và nhẹ. Người chơi install, mở game, gặp loading lâu, tutorial nhiều chữ, level 2 quá khó, rồi interstitial xuất hiện trước khi họ có một combo thỏa mãn. `D1` thấp trong trường hợp này không phải do channel. Nó là **promise delivery failure**.

Với budget `$100-500`, retention guardrail là phanh an toàn. Nó ngăn team đổ thêm tiền vào traffic khi game chưa chứng minh được core value trong phiên đầu tiên.

---

## Core model: first-session proof loop

First session là nơi lời hứa marketing gặp sự thật sản phẩm.

```text
Ad promise
  -> Store proof
  -> First open
  -> First core action
  -> First win / first satisfying moment
  -> Early mastery
  -> D1 return
```

Đọc theo logic:

1. **First open**: Game mở được, không crash, không loading quá lâu.
2. **First core action**: Người chơi được chạm vào mechanic chính rất sớm.
3. **First win**: Người chơi thấy mình làm đúng và nhận feedback rõ.
4. **Early mastery**: Level 2-5 cho người chơi cảm giác hiểu game, không bị phạt quá sớm.
5. **D1 return**: Người chơi có lý do quay lại vì promise đã được giao.

Nếu acquisition nói “người chơi muốn thử”, first-session proof trả lời “game có giữ lời không?”.

---

## Khung First-session proof checklist mẫu

Điền checklist này trước khi chạy test hoặc trước khi đọc `D1`.

| Proof point | Event / signal | Câu hỏi chẩn đoán | Pass khi |
| :--- | :--- | :--- | :--- |
| **Launch health** | `first_open`, crash-free start, loading time | Người chơi có vào được game nhanh không? | Mở app ổn trên device mục tiêu, không mất kiên nhẫn trước tutorial. |
| **Promise arrival** | `tutorial_start`, first screen inspect | Màn đầu có giống lời hứa ad/store không? | Người chơi thấy mechanic/board/cảm giác đã được hứa. |
| **First core action** | `first_core_action` | Người chơi có tự tay làm hành động chính sớm không? | Không bị giữ quá lâu bởi text, dialog, login, permission. |
| **First win** | `level_1_complete` hoặc `first_success` | Người chơi có thắng nhỏ đủ rõ không? | Feedback, âm thanh, animation, score đều nói “bạn làm đúng”. |
| **Tutorial completion** | `tutorial_complete` | Tutorial có đang là điểm gãy không? | Drop-off không tập trung ở một bước hướng dẫn cụ thể. |
| **Early mastery** | `level_3_complete`, `level_5_reach` | Difficulty ramp có quá gắt không? | Người chơi qua vài level đầu mà vẫn hiểu luật. |
| **Return intent** | `D1`, session 2 start | Có lý do quay lại không? | D1 không bị sụp so với cohort/build cùng phạm vi. |

Checklist này nên gắn với hypothesis Day 7. Nếu promise là “no timer pressure”, first session không được mở bằng countdown căng thẳng.

### Proof confidence gate

Trước khi dùng `D1` để ra quyết định, hãy kiểm tra confidence của bằng chứng. Một `D1` yếu có thể là product issue, nhưng cũng có thể là event sai, build lỗi, traffic mix lệch, hoặc cohort quá nhỏ.

| Gate | Câu hỏi | Pass khi | Nếu fail thì |
| :--- | :--- | :--- | :--- |
| Event QA | Event có fire đúng trong build thật không? | `first_open`, `tutorial_complete`, `level_complete` được test trên device mục tiêu | sửa tracking trước khi kết luận |
| Cohort cleanliness | Cohort có cùng build/source/country không? | không trộn organic với paid, build cũ với build mới | tách cohort lại |
| Sample floor | Cohort có đủ installs để đọc direction không? | đủ để thấy pattern, không chỉ vài chục users | ghi directional only |
| Promise continuity | Ad, store và first screen có cùng lời hứa không? | người chơi thấy đúng mechanic/cảm giác đã hứa | sửa proof chain |
| Product inspect | Có xem replay/playtest/session path không? | số liệu được đối chiếu với hành vi thật | inspect build trước khi sửa |

Confidence label nên viết trong report:

```text
Retention read confidence:
- High for tutorial friction if event QA passed and drop-off repeats across same build.
- Medium for first-session diagnosis if cohort is clean but sample is still small.
- Low for channel verdict if first-session funnel is broken.
```

Quy tắc: khi first-session proof yếu, `D1` chưa được phép dùng để kết luận channel xấu. Nó chỉ được phép khóa scale và yêu cầu sửa proof chain.

---

## Sơ đồ retention decay và first-session proof

![Retention decay curve comparison](content/assets/usecases/day-10-hero-diagram.png)

> [!NOTE]
> **Inspect**: Nhìn độ dốc từ Day 0 sang Day 1 trước. Nếu đường rơi mạnh ngay sau install, hãy kiểm first-session funnel trước khi sửa channel.
>
> **Conclude**: D1 yếu thường là cảnh báo rằng lời hứa chưa được giao trong phiên đầu, hoặc tracking/cohort đang bị đọc sai. Hành động tốt nhất là khoanh điểm gãy bằng event funnel.
>
> **Do not infer**: Không dùng đường retention này làm benchmark cố định. Một puzzle prototype, một hybrid-casual live game và một game có meta progression sẽ có đường retention khác nhau.

---

## Bảng first-session funnel và cohort readout

![First session progression funnel](content/assets/usecases/day-10-data-visual.png)

:::chart
title: First-session proof funnel, scenario example
first_open|100|Base users who opened the app
tutorial_start|94|Small launch/loading loss
first_core_action|82|Some users blocked before touching gameplay
tutorial_complete|58|Main friction appears inside tutorial
level_3_complete|38|Early mastery is not stable yet
:::

**Inspect**: Điểm rơi lớn nhất trong ví dụ là từ `first_core_action`/`tutorial_start` sang `tutorial_complete`. Nghĩa là người chơi có vào được game nhưng không hoàn thành hướng dẫn.

**Conclude**: Sửa tutorial hoặc interaction instruction trước khi sửa acquisition. Nếu bạn đổi ad trước, bạn sẽ đưa thêm user mới vào cùng một điểm gãy.

**Do not infer**: Không kết luận toàn bộ game loop fail chỉ vì level 3 thấp. Cần xem điểm rơi bắt đầu từ tutorial, difficulty spike hay crash/loading.

---

## Hướng dẫn đọc số

Đọc retention theo cohort, không đọc tổng trung bình.

| Pattern | Diagnosis | Next action | Không nên làm |
| :--- | :--- | :--- | :--- |
| `first_open` thấp hoặc crash report cao | Launch health issue. User chưa kịp trải nghiệm promise. | Sửa crash, memory, loading, device compatibility trước. | Sửa ad hoặc store vì nghĩ traffic kém. |
| `tutorial_start` ổn, `tutorial_complete` thấp | Tutorial friction hoặc instruction không rõ. | Giảm text, cho làm core action sớm, thêm visual hand/ghost move. | Tăng reward cuối tutorial để ép người chơi chịu đựng. |
| `tutorial_complete` ổn, `level_3_complete` thấp | Early difficulty spike hoặc pacing sai. | Làm level 1-5 dễ hơn, tăng feedback, giảm fail state. | Viết tutorial dài hơn. |
| Acquisition tốt, first-session guardrail yếu | Promise delivery failure. | Tạm dừng scale, fix first session, rerun cùng winning acquisition angle. | Scale vì `CPI` rẻ hoặc `IPM` cao. |
| D1 yếu nhưng first-session funnel ổn | Có thể là return hook, content depth, notification, economy hoặc sample issue. | Xem session length, level depth, D2/D3, qualitative playtest. | Kết luận onboarding fail mà không có event proof. |
| D1 khác nhau mạnh giữa cohorts | Build/channel/store variant hoặc country mix ảnh hưởng. | Tách cohort theo install date, build version, channel, country. | Lấy average toàn app để ra quyết định. |

Decision ranges nên là “range cho build/sprint này”. Ví dụ: “Nếu `tutorial_complete` của cohort paid Android mới thấp hơn cohort organic/internal build gần nhất một khoảng lớn, sửa tutorial trước.” Cách này tốt hơn đặt một benchmark tuyệt đối.

### Cohort triage matrix

Khi retention yếu, đừng nhảy thẳng vào "sửa tutorial". Hãy phân loại case trước.

| Case | Signal pattern | Diagnosis gần nhất | Decision |
| :--- | :--- | :--- | :--- |
| Tracking suspect | event đứt bất thường, rates không khớp playtest, build mới đổi event | measurement issue | QA event, không sửa game vội |
| Build health issue | `first_open` thấp, crash/loading cao | technical launch problem | fix crash/loading trước UA |
| Tutorial friction | `tutorial_start` ổn nhưng `first_core_action/tutorial_complete` rơi mạnh | instruction hoặc guided flow quá nặng | rút tutorial, cho core action sớm |
| Difficulty spike | tutorial ổn, `level_3_complete` rơi | early level ramp quá gắt | sửa level 1-5, feedback, fail state |
| Promise mismatch | store CVR ổn nhưng first screen/first win không giống ad/store | product không giao lời hứa | sửa first screen hoặc ad/store promise |
| Return hook weak | first-session funnel ổn, D1/D3 vẫn yếu | thiếu lý do quay lại/content depth | đọc session length, level depth, meta/reward |
| Traffic mismatch | cùng build tốt ở organic/internal nhưng paid source mới yếu rõ | source/hook mua sai intent | sửa creative/source, không đổ lỗi toàn game |

Triage output nên là một dòng:

```text
Retention triage: tutorial friction with medium-high confidence.
Evidence: first_open and tutorial_start are healthy; drop-off begins before first_core_action and repeats in same build.
Action: fix tutorial flow, rerun same acquisition angle.
Do not conclude: channel is bad or market thesis failed.
```

---

## Worked example: Calming Hex Puzzle

Team chạy `$200` UA test cho Calming Hex Puzzle. Day 9 readout cho thấy acquisition không tệ:

- `CTR`: 2.1%
- `Store CVR`: 28%
- `IPM`: 5.9
- `CPI`: $0.44

Nhưng cohort install ngày 05/07 có retention yếu. Team đọc first-session funnel:

| Event / metric | Users | Rate from previous step | Cách đọc |
| :--- | :---: | :---: | :--- |
| Installs | 455 | - | Paid cohort đủ để đọc direction. |
| `first_open` | 438 | 96% | Launch không phải điểm gãy chính. |
| `tutorial_start` | 420 | 96% | Loading/màn đầu tạm ổn. |
| `first_core_action` | 305 | 73% | Nhiều user chưa chạm được mechanic sớm. |
| `tutorial_complete` | 222 | 73% | Tutorial vẫn còn friction. |
| `level_3_complete` | 117 | 53% | Early mastery tiếp tục yếu. |
| `D1` | 61 | 13% of installs | Return guardrail yếu. |

**Diagnosis**: Vấn đề không nằm ở ad/store đầu tiên. Người chơi install và mở game, nhưng first session không giao promise “calm, quick, no pressure”. Khi inspect build, team phát hiện tutorial có 5 popup chữ, bắt người chơi đặt 3 khối chính xác trước khi được clear board, và level 2 đã có fail state.

**Tradeoff**: Tắt campaign để sửa game có vẻ làm mất learning momentum. Nhưng tiếp tục chạy sẽ chỉ mua thêm user cho cùng một tutorial yếu. Với budget nhỏ, sửa first-session proof rồi rerun cùng ad angle là cách học sạch hơn.

**Verdict**:

1. Pause scale, giữ lại winning acquisition angle làm control.
2. Rút tutorial xuống một core action trong 10 giây đầu.
3. Cho level 1 có một clear/combo chắc chắn.
4. Dời fail state sang sau level 4.
5. Log thêm `first_core_action`, `first_success`, `level_3_complete`.
6. Rerun cùng country/channel để isolate product change.

### Sprint fix memo

Sau khi có verdict, output tốt nhất không phải là "D1 thấp". Output tốt nhất là một sprint memo đủ cụ thể để game team sửa đúng một mắt xích và UA team không đổi biến lung tung.

```text
First-session sprint fix memo
- Diagnosis: tutorial friction + early mastery weakness.
- Confidence: medium-high because launch/store are healthy and drop-off repeats before tutorial_complete.
- Keep unchanged: country, channel, winning ad angle, store screenshot order.
- Change one thing: tutorial flow and level 1-4 pacing.
- Required implementation: core action within 10 seconds, first success before any fail state, no interstitial before first win.
- Required events: first_core_action, first_success, level_3_complete, build_version.
- Retest rule: same source and same promise after build update.
- Stop rule: if first_core_action improves but D1 does not, inspect return hook/content depth next.
```

Decision ladder cho rerun:

| Rerun result | Cách đọc | Next action |
| :--- | :--- | :--- |
| `first_core_action` tăng, `tutorial_complete` tăng, D1 tăng | fix đúng mắt xích | giữ build, đọc economics tiếp |
| `first_core_action` tăng, D1 không tăng | onboarding friction giảm nhưng return hook yếu | inspect session depth, level variety, Day 11 economics later |
| `tutorial_complete` không tăng | tutorial fix chưa đủ hoặc event sai | playtest, QA event, sửa instruction tiếp |
| D1 tăng ở organic nhưng paid vẫn yếu | paid promise/source mismatch | sửa creative/store promise, không sửa game thêm |
| CVR giảm sau store/first-screen đổi | proof chain bị lệch | rollback hoặc align ad/store/first screen |

### First-session retest contract

Sau khi sửa onboarding/level đầu, retest phải đủ sạch để biết fix có tác dụng không. Contract này khóa biến sẽ giữ nguyên và biến được phép đổi.

| Contract field | Câu hỏi | Pass condition | Nếu fail |
| :--- | :--- | :--- | :--- |
| Diagnosis being tested | Fix đang nhắm vào điểm gãy nào? | tutorial friction, difficulty spike, promise mismatch... | sửa quá rộng |
| Change allowed | Build được đổi đúng cái gì? | một mắt xích chính: tutorial flow hoặc level 1-4 pacing | không biết fix nào hiệu quả |
| Variables frozen | Source, country, ad promise, store proof nào giữ nguyên? | ghi rõ trước rerun | không so được trước/sau |
| Required events | Event nào phải pass để đọc fix? | `first_core_action`, `first_success`, `tutorial_complete`, `level_3_complete` | D1 không có nguyên nhân |
| Success read | Pattern nào chứng minh fix đúng? | funnel step tăng cùng D1/session depth direction | fix chỉ đẹp ở một event |
| Failure read | Pattern nào nói fix chưa đủ hoặc sai chỗ? | event trước tăng nhưng D1 không tăng | tiếp tục sửa mù |
| Blocked conclusions | Điều gì retest không được kết luận? | channel/market/product death nếu proof chain chưa sạch | overclaim |

```text
First-session retest contract
- Diagnosis being tested:
- Change allowed:
- Variables frozen:
- Required events:
- Success read:
- Failure read:
- Blocked conclusions:
- Owner/date:
```

Contract tốt giúp product team sửa đúng một mắt xích, còn UA team không đổi creative/channel cùng lúc. Nếu cả build, ad, store và source cùng đổi, D1 có tăng cũng khó biết vì sao.

---

## Event taxonomy and cohort setup checklist

Không cần event quá nhiều. Cần event đủ để tìm điểm gãy.

| Event | Khi nào bắn | Properties nên có | Decision hỗ trợ |
| :--- | :--- | :--- | :--- |
| `first_open` | Lần mở app đầu tiên sau install | `build_version`, `platform`, `country` nếu có | Launch health, cohort base. |
| `tutorial_start` | Khi tutorial hoặc first guided step bắt đầu | `tutorial_variant`, `build_version` | Loading/màn đầu có làm rơi user không. |
| `first_core_action` | Khi user tự làm action chính đầu tiên | `seconds_since_open`, `action_type` | User có được chạm gameplay đủ sớm không. |
| `first_success` | Khi user nhận feedback thắng nhỏ đầu tiên | `seconds_since_open`, `level_number` | Promise có được giao nhanh không. |
| `tutorial_complete` | Khi tutorial xong | `duration_seconds`, `steps_count` | Tutorial friction. |
| `level_complete` | Khi hoàn thành level | `level_number`, `moves_used`, `fail_count` | Early difficulty ramp. |
| `session_start_day1` hoặc D1 cohort | Khi user quay lại ngày sau | `cohort_date`, `build_version` | Return proof. |

Quality rules:

- Tên event dùng snake_case và nhất quán.
- Luôn gắn `build_version` để không trộn cohort cũ/mới.
- Đừng gửi event chỉ vì “có thể cần”. Mỗi event phải trả lời một decision.
- Không đổi nhiều event cùng lúc nếu đang cố so cohort trước/sau.

---

## Real usecases đã đối chiếu nguồn

### Internal case: Puzzle soft-launch cheap installs, weak D1

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case nội bộ `puzzle-onboarding-leak`: `CPI $0.42`, `CTR 1.8%`, `store CVR 32%`, `tutorial_complete 54%`, `D1 22%`, `D7 4%`. | Acquisition không phải điểm gãy đầu tiên. Store CVR ổn nhưng tutorial and D1 yếu, nên cần sửa first-session proof trước khi scale. | Không kết luận CPI rẻ là campaign khỏe. Không kết luận D1 yếu chắc chắn do traffic nếu store/tut funnel chỉ ra product friction. |

### Official analytics surfaces

| Source signal | Cách dùng trong bài này | Không được suy ra |
| :--- | :--- | :--- |
| Unity Analytics custom events cho phép tạo event riêng theo nhu cầu game; event name dùng chữ/số/underscore. | Dùng để tạo event như `first_core_action`, `tutorial_complete`, `level_complete`. | Không cần spam event mọi click; event phải phục vụ diagnosis. |
| Unity Analytics Funnels dùng ordered steps để xem user đi từ đầu tới cuối sequence và drop-off ở đâu. | Dùng cho first-session funnel: `first_open -> tutorial_start -> first_core_action -> tutorial_complete -> level_3_complete`. | Funnel không tự giải thích nguyên nhân. Bạn vẫn phải inspect gameplay và playtest. |
| Google Play Acquisition reports cho biết user tìm store listing thế nào và họ dùng app sau install ở mức reporting của Play Console. | Dùng như nguồn store/acquisition hỗ trợ, nhất là Android-first. | Không thay thế internal event taxonomy khi cần debug tutorial step cụ thể. |

---

## Common mistakes

**Mistake 1 - Đọc retention average thay vì cohort.**

**Correction**: Tách theo install date, build version, channel và country. Average toàn app che mất build mới bị lỗi.

**Mistake 2 - D1 thấp là đổ lỗi cho traffic.**

**Correction**: Kiểm `tutorial_complete`, `level_3_complete`, crash/loading trước. Nếu first-session funnel gãy, sửa game trước.

**Mistake 3 - Tutorial dạy quá nhiều trước khi cho chơi.**

**Correction**: Cho user làm core action sớm. Với casual puzzle, một thắng nhỏ rõ thường tốt hơn 5 popup giải thích.

**Mistake 4 - Dùng benchmark retention như luật cứng.**

**Correction**: So với cohort/build/channel cùng phạm vi. Dùng ranges cho sprint, không dùng “D1 phải là X%” cho mọi game.

**Mistake 5 - Không log build version.**

**Correction**: Mọi event first-session nên có `build_version`. Nếu không, bạn không biết retention cải thiện do build mới hay traffic mix.

---

## English Terms You Should Keep

- **Retention**: Tỷ lệ người chơi quay lại sau một khoảng thời gian.
- **Cohort**: Nhóm user cùng đặc điểm, thường là cùng ngày install hoặc cùng build/channel.
- **D1 / D7 retention**: Tỷ lệ user quay lại ngày 1 hoặc ngày 7 sau install.
- **First session**: Phiên chơi đầu tiên ngay sau khi install/mở app.
- **Onboarding**: Trải nghiệm làm quen ban đầu.
- **FTUE**: First-Time User Experience, toàn bộ trải nghiệm lần đầu.
- **Event taxonomy**: Hệ thống tên event và properties dùng để đo hành vi.
- **Funnel drop-off**: Tỷ lệ user rơi khỏi một bước trong chuỗi event.

---

## Lab output example

```text
FIRST-SESSION PROOF CHECKLIST

Hypothesis promise:
Calm block puzzle, no timer pressure, satisfying clear in under 2 minutes.

Cohort scope:
Android paid cohort / VN / build 0.3.4 / install date 2026-07-05.

First-session proof:
- first_open: 96% of installs
- tutorial_start: 96% of first_open
- first_core_action: 73% of tutorial_start
- first_success: 62% of tutorial_start
- tutorial_complete: 53% of tutorial_start
- level_3_complete: 28% of installs
- D1: 13% of installs

Diagnosis:
Promise delivery failure inside tutorial and early mastery. Acquisition is not the first fix.

Action:
Reduce tutorial to one move, guarantee first clear, delay fail state until after level 4, log build_version on all events, rerun same ad angle.

Do not conclude:
Do not conclude channel is bad. Do not conclude game has no market until first-session proof is repaired.

First-session retest contract:
- Diagnosis being tested:
- Change allowed:
- Variables frozen:
- Required events:
- Success read:
- Failure read:
- Blocked conclusions:
```

Sprint memo example:

```text
Diagnosis:
Confidence:
Keep unchanged:
Change one thing:
Required implementation:
Required events:
Retest rule:
Stop rule:
Do not conclude:
```

Bảng nộp lab:

| Field | Your value |
| :--- | :--- |
| Hypothesis promise | |
| Cohort scope | |
| Build version | |
| `first_open` | |
| `tutorial_start` | |
| `first_core_action` | |
| `first_success` | |
| `tutorial_complete` | |
| `level_3_complete` | |
| D1 | |
| Biggest drop-off | |
| Diagnosis | |
| Confidence label | |
| Product action | |
| Keep unchanged | |
| Change one thing | |
| Retest rule | |
| Stop rule | |
| Do not conclude | |

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Lấy hypothesis từ Day 7 và viết lại promise trong một câu.
2. Chọn cohort scope: platform, channel, country, build version, install date.
3. Điền first-session funnel bằng event thật hoặc playtest telemetry nếu chưa launch.
4. Tìm bước drop-off lớn nhất.
5. Gắn diagnosis: launch issue, tutorial friction, early difficulty spike, promise mismatch, return hook weak, hoặc inconclusive.
6. Viết một product action duy nhất cho sprint tiếp theo.
7. Ghi điều không được kết luận từ data hiện tại.
8. Ghi confidence label cho diagnosis.
9. Viết retest rule giữ nguyên source/promise hoặc nói rõ biến nào được đổi.
10. Viết First-session retest contract.

Quality chain check:

- Có cohort scope rõ chưa?
- Có build version chưa?
- Có event cho first core action và first success chưa?
- Có phân biệt tutorial friction với early difficulty chưa?
- Action có sửa đúng mắt xích đang gãy không?
- Có nói rõ giữ nguyên gì trong rerun không?
- Retest contract có required events và blocked conclusions không?

---

## Final UA Plan Update

Cập nhật trường **tracking** trong Final UA Plan:

```text
First-session proof tracking:
- Cohort scope: [platform / channel / country / build_version / install_date]
- Promise to prove: [ad/store promise from hypothesis]

Required events:
- first_open
- tutorial_start
- first_core_action
- first_success
- tutorial_complete
- level_complete with level_number
- D1/session_2_start

Decision ranges for this sprint:
- Tutorial completion concern range: [scenario-specific]
- Level 3 completion concern range: [scenario-specific]
- D1 concern range: [scenario-specific]

Action rules:
- Launch issue: [crash/loading fix]
- Tutorial friction: [tutorial simplification]
- Early difficulty spike: [level 1-5 pacing fix]
- Acquisition good + first-session weak: [pause scale, fix build, rerun same angle]
- Retest rule: [what stays unchanged / what changes]
- Confidence label: [high / medium / low + why]
- First-session retest contract:
- Blocked conclusions:
```

Plan field được cập nhật: **tracking**. Bài này cũng cập nhật cách bạn dùng **metricTargets** từ Day 9 vì retention guardrail là điều kiện để scale acquisition.

---

## Checklist Focus

- [ ] Đã viết first-session proof checklist cho hypothesis hiện tại.
- [ ] Đã xác định cohort scope và build version.
- [ ] Đã có event cho `first_open`, `tutorial_start`, `first_core_action`, `first_success`, `tutorial_complete`, `level_complete`.
- [ ] Đã tìm biggest drop-off và diagnosis.
- [ ] Đã viết một product action cụ thể cho sprint tiếp theo.
- [ ] Đã viết First-session retest contract.
- [ ] Variables frozen và blocked conclusions rõ.
- [ ] Đã cập nhật trường **tracking** trong Final UA Plan.

---

## Curated References

- [Unity Analytics - Create a custom event](https://docs.unity.com/en-us/analytics/events/custom-event) - Official Unity guidance for creating custom events and event naming constraints.
- [Unity Analytics - Funnels](https://docs.unity.com/en-us/analytics/funnels/funnels) - Official Unity documentation for visualizing ordered user flow and drop-off through game stages.
- [Google Play Console Help - Measure your app's acquisition and retention](https://support.google.com/googleplay/android-developer/answer/6263332?hl=en) - Official Play Console help for reviewing how users find your store listing and use the app after install.
