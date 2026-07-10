---
day: 9
title: "CPI, CTR, CVR and IPM without vanity traps"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, CTR, CVR, IPM]
artifact: "Acquisition signal readout"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Acquisition signal readout**: một bảng đọc tín hiệu acquisition giúp trả lời câu hỏi:

> “Metric đầu phễu đang nói chúng ta nên sửa creative, store page, audience/channel hay tạm dừng vì data chưa đủ?”

Bạn sẽ học cách đọc `CTR`, `CVR`, `IPM` và `CPI` theo chuỗi, không đọc từng số riêng lẻ. Kết quả cần có:

- Hiểu `CTR` đo sức kéo của ad promise, không đo chất lượng người chơi.
- Hiểu `store CVR` đo độ tin của store proof sau khi người xem đã click.
- Tính được `IPM` để so sánh creative trong cùng một test.
- Đọc `CPI` như outcome của cả chuỗi, không phải bằng chứng game tốt.
- Cập nhật trường **metricTargets** trong Final UA Plan bằng decision ranges và action rules.

---

## Why this matters

Với budget `$100-500`, một dashboard có `CTR` cao rất dễ làm team phấn khích. Nhưng `CTR` cao có thể đến từ hook thật sự rõ, cũng có thể đến từ curiosity bait. `CPI` rẻ có thể là tín hiệu campaign đang khớp, cũng có thể là traffic low-intent sẽ rơi khỏi game sau vài phút.

Sai lầm phổ biến là đọc số theo kiểu “metric nào xanh thì scale”. Với mobile puzzle, bạn cần đọc theo chain:

`impression -> click -> store visit -> install -> first session`

Nếu `CTR` cao nhưng `store CVR` sụp, vấn đề thường nằm giữa ad và store. Nếu `store CVR` ổn nhưng `D1` yếu, vấn đề thường nằm sau install. Nếu `CPI` rẻ nhưng `IPM` yếu so với creative sibling, có thể bạn đang mua click rẻ nhưng không mua được installs đủ khỏe.

Bài này giúp bạn tránh vanity trap: số nhìn đẹp nhưng dẫn tới hành động sai.

---

## Core model: bốn metric, một chuỗi chẩn đoán

Đừng hỏi “CTR bao nhiêu là tốt?” trước. Hãy hỏi “CTR này đang kết hợp với CVR, IPM và CPI như thế nào?”

```text
Impressions
  -> CTR tells: ad promise có kéo được click không?
Clicks / Store visits
  -> Store CVR tells: store proof có giữ được niềm tin không?
Installs
  -> IPM tells: mỗi 1,000 impressions tạo được bao nhiêu install?
Spend / installs
  -> CPI tells: chuỗi này mua install với chi phí nào?
```

Công thức vận hành:

```text
CTR = clicks / impressions
Store CVR = installs / clicks or store visitors
IPM = installs / impressions * 1000
CPI = spend / installs
```

Nếu bạn dùng `CTR` dạng phần trăm và `Store CVR` dạng phần trăm, cách nhẩm:

```text
IPM ≈ CTR% * Store CVR% * 10
Ví dụ: CTR 2.0% và CVR 25% -> IPM ≈ 2.0 * 25 * 10 / 100 = 5 installs per 1,000 impressions
```

Điểm chính: `IPM` gom cả ad và store vào một tín hiệu distribution. Nó không thay retention, nhưng nó giúp bạn biết đầu phễu có tạo installs thật hay chỉ tạo click.

---

## Khung Acquisition signal readout mẫu

Điền bảng này cho từng creative hoặc ad angle. Không trộn tất cả campaign vào một dòng tổng.

| Field | Cách điền | Vì sao cần |
| :--- | :--- | :--- |
| **Ad angle** | Tên promise: “satisfying clear”, “calm no timer”, “brain challenge”. | Để biết số đang gắn với motivation nào. |
| **Impressions** | Số lượt hiển thị của angle này. | Sample quá nhỏ thì không kết luận mạnh. |
| **CTR** | Click / impressions. | Đo sức kéo của 3 giây đầu và promise. |
| **Store CVR** | Installs / store visits hoặc clicks tùy nguồn đo. | Đo ad-to-store continuity. |
| **IPM** | Installs / impressions * 1000. | So sánh hiệu quả tạo install giữa creative sibling. |
| **CPI** | Spend / installs. | Đọc cost outcome sau khi chain đã qua ad và store. |
| **Guardrail** | `tutorial_complete`, `level_3_complete`, `D1`. | Ngăn scale traffic có intent yếu. |
| **Diagnosis** | Creative issue, store mismatch, healthy sync, inconclusive. | Biến số thành quyết định sửa gì. |
| **Next action** | Sửa hook, sửa screenshot, giữ test, pause, rerun. | Tránh tranh luận cảm tính. |

Một readout tốt luôn có **comparison set**: so với creative sibling cùng ngày, cùng country, cùng store page, cùng budget cap. Không nên so `CTR` của một test Android VN với một test iOS US rồi kết luận creative nào hay hơn.

### Acquisition decision authority

Mỗi metric đầu phễu chỉ có quyền trả lời một số câu hỏi nhất định. Nếu dùng sai quyền, team sẽ scale clickbait, sửa product quá sớm hoặc đổ lỗi channel khi store proof mới là mắt xích yếu.

| Metric / pattern | Quyết định được phép | Quyết định bị cấm | Evidence cần đi kèm |
| :--- | :--- | :--- | :--- |
| `CTR` cao hơn sibling | Giữ hoặc remake quanh cùng ad promise/opening frame | Scale campaign, kết luận user quality tốt | Store CVR, IPM và guardrail sau install |
| `Store CVR` yếu khi `CTR` ổn | Sửa screenshot 1, short description, preview video hoặc ad-store continuity | Kết luận product fail | Cùng store page/country/source, sample đủ để đọc direction |
| `IPM` cao hơn sibling | Chọn creative control đầu phễu trong cùng scope | Kết luận retention/economy tốt | `tutorial_complete`, `level_3_complete`, D1 direction |
| `CPI` rẻ | Giữ cell để đọc thêm nếu guardrail không đỏ | Tăng cap mạnh chỉ vì install rẻ | IPM + guardrail quality + spend cap còn kiểm soát |
| Guardrail yếu sau install | Dừng scale và kiểm first-session proof | Đổ lỗi ngay cho channel hoặc creative | Event QA pass, build/source mapping rõ |
| Sample nhỏ/mismatch | Ghi inconclusive, rerun gọn hơn | Chọn winner/loser | Minimum spend/sample rule và scope sạch |

Rule: một metric đẹp chỉ được phép mở **một quyết định nhỏ** nếu metric kế tiếp trong chain không phản đối. Ví dụ `CTR` tốt mở quyền sửa/giữ creative, nhưng chỉ khi `CVR` hoặc `IPM` không cho thấy curiosity bait.

---

## Sơ đồ chẩn đoán vanity traps

```text
![Vanity trap diagnosis tree](content/assets/usecases/day-09-hero-diagram.png)Type: hero operating diagram.
Lesson section: Sơ đồ chẩn đoán vanity traps.
Previous local asset to replace: content/assets/usecases/day-09-hero-diagram.png.
Visual brief: Vanity trap diagnosis tree.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Sơ đồ bắt đầu bằng `CTR`, nhưng không dừng ở `CTR`. Mỗi nhánh đều buộc bạn kiểm tra `Store CVR`, `IPM`, rồi mới quyết định sửa creative hay store.
>
> **Conclude**: `CTR` cao chỉ là “người xem muốn biết thêm”. Nó chưa chứng minh store đáng tin, install chất lượng, hay game giữ được người chơi.
>
> **Do not infer**: Không suy ra `CTR` thấp nghĩa là game fail. Nếu store CVR và guardrail của nhóm người đã install vẫn ổn, việc cần làm đầu tiên có thể chỉ là sửa hook.

---

## Bảng pattern đầu phễu và IPM

Các số dưới đây là **scenario-specific ranges** cho một micro-test giả định của puzzle prototype. Dùng để học cách đọc pattern, không dùng làm benchmark chung.

| Pattern | CTR | Store CVR | IPM | CPI direction | Diagnosis |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Clickbait trap** | 4.0% | 6% | 2.4 | Có thể vẫn rẻ hoặc dao động | Ad kéo curiosity, store không xác nhận promise. |
| **Weak creative, good store** | 0.9% | 34% | 3.1 | Thường cao do thiếu volume | Store proof ổn, nhưng ad hook chưa đủ rõ. |
| **Healthy acquisition sync** | 2.2% | 27% | 5.9 | Có cơ hội ổn định | Ad và store đang cùng hứa một thứ. |
| **Cheap low-intent traffic** | 2.8% | 22% | 6.2 | Rẻ | Đầu phễu ổn nhưng cần guardrail retention để tránh scale sai. |

:::chart
title: IPM by acquisition pattern, scenario example
Clickbait trap|2.4|High CTR collapses at store
Weak creative|3.1|Low CTR limits distribution despite strong store
Healthy sync|5.9|Ad promise and store proof work together
Cheap low-intent|6.2|Looks efficient but needs retention guardrail
:::

```text
![Acquisition metric trap board](content/assets/usecases/day-09-data-visual.svg)Type: metric board / decision heatmap.
Lesson section: Bảng pattern đầu phễu và IPM.
Visual brief: convert the four acquisition patterns into a compact board showing CTR, Store CVR, IPM, CPI direction, guardrail risk, and recommended action.
Teaching job: help the learner see why a high CTR or cheap CPI can still be a bad launch decision.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

**Inspect**: `Cheap low-intent traffic` có IPM đẹp hơn `Healthy sync`, nhưng chưa chắc tốt hơn nếu guardrail như `D1` hoặc `level_3_complete` yếu.

**Conclude**: `IPM` là metric đầu phễu. Nó cần đi kèm guardrail sau install để tránh scale traffic rỗng.

**Do not infer**: Không dùng IPM để thay thế retention, LTV hoặc ROAS. Nó chỉ giúp đọc ad/store acquisition efficiency.

---

## Hướng dẫn đọc số

Đọc theo 5 bước:

1. **Kiểm sample và phạm vi**: Creative có đủ impressions/clicks để so sánh trong sprint này chưa? Có cùng country, channel, store page không?
2. **Đọc `CTR` theo promise**: Người xem có phản ứng với ad angle không?
3. **Đọc `Store CVR` theo continuity**: Người đã click có thấy store page đáng tin không?
4. **Tính `IPM`**: Creative nào biến impressions thành installs tốt hơn?
5. **Đọc `CPI` và guardrail**: Cost có chấp nhận được trong sprint này không, và user sau install có dấu hiệu chất lượng không?

| Metric pattern | Cách đọc đúng | Next action |
| :--- | :--- | :--- |
| `CTR` cao, `CVR` thấp, `IPM` thấp | Ad promise quá xa store proof hoặc creative gây curiosity sai. | Tắt/giảm creative đó, remake ad gần gameplay thật hơn hoặc sửa store để nối promise. |
| `CTR` thấp, `CVR` cao | Người đã vào store tin game, nhưng ad chưa kéo đủ click. | Giữ store, sửa 3 giây đầu của ad, test visual hook mới. |
| `CTR` vừa, `CVR` vừa, `IPM` tốt hơn sibling | Chain đang sync tốt trong phạm vi test. | Giữ angle, tạo biến thể gần, kiểm guardrail retention trước khi tăng cap. |
| `CPI` rẻ, `D1`/early event yếu | Traffic đầu phễu rẻ nhưng intent hoặc first-session proof yếu. | Không scale. Đối chiếu ad promise với first session và Week 1 hypothesis. |
| Số đẹp nhưng sample nhỏ | Data chưa đủ kết luận. | Ghi “inconclusive”; rerun có phạm vi hẹp hơn thay vì đổi quá nhiều biến. |

### Second-pass acquisition read

Sau khi điền bảng, đọc lại bằng ba lớp để tránh vanity trap:

| Layer | Câu hỏi | Nếu câu trả lời yếu | Action đúng |
| :--- | :--- | :--- | :--- |
| Attention | `CTR` có tốt vì promise rõ hay vì curiosity bait? | Store `CVR` không xác nhận click | Sửa ad promise hoặc store continuity, chưa scale |
| Conversion | `CVR` và `IPM` có cùng ủng hộ angle không? | `CTR` tốt nhưng IPM thấp | Ưu tiên chain tạo install thật, không ưu tiên click |
| Quality guardrail | User sau install có hiểu game không? | tutorial/D1 yếu | Dừng scale, kiểm first-session proof |

Decision memo nên viết ngắn:

```text
Acquisition decision memo
- Keep as control:
- Repair creative:
- Repair store:
- Hold for tracking/sample:
- Do not conclude:
```

Nếu memo không chỉ ra được sửa creative, store, first session hay tracking, readout vẫn còn ở mức báo cáo số liệu chứ chưa thành quyết định UA.

### Acquisition readout memo

Sau mỗi test nhỏ, hãy viết memo theo format này trước khi mở dashboard discussion. Memo buộc team tách **observed pattern** khỏi **decision allowed** và **decision blocked**.

```text
Acquisition readout memo - Real combo clear vs Rescue bait

Scope:
Android / one country / same store page / same budget cap / 3 days.

Observed pattern:
- Rescue bait: CTR high, Store CVR low, IPM weaker than sibling, tutorial_complete weak.
- Real combo clear: CTR lower, Store CVR strong, IPM stronger, tutorial_complete healthier.

Decision allowed:
- Pause Rescue bait as clickbait trap.
- Keep Real combo clear as control.
- Produce two close variants around real gameplay promise.

Decision blocked:
- Do not scale Rescue bait because CTR is high.
- Do not conclude the channel is bad.
- Do not change store page yet because Real combo clear already converts well.
- Do not claim ROAS or LTV from this readout.

Next owner:
UA owner pauses A and builds B variants; product owner only watches guardrail, no gameplay change yet.
```

Một memo tốt phải có dòng "Decision blocked". Nếu không ghi điều **không được kết luận**, metric đẹp sẽ kéo team vào câu chuyện quá lớn so với dữ liệu hiện tại.

---

## Worked example: Hexa Block Puzzle acquisition readout

Team chạy test `$180` cho game Hexa Block Puzzle trong 3 ngày, cùng store page, cùng country, cùng daily cap. Có hai ad angle:

- **Creative A - Rescue bait**: Nhân vật gặp nguy hiểm, người xem phải chọn mảnh ghép để cứu.
- **Creative B - Real combo clear**: Gameplay thật, xếp mảnh hex để clear combo lớn.

| Metric | Creative A | Creative B | Cách đọc |
| :--- | :---: | :---: | :--- |
| Impressions | 42,000 | 38,000 | Sample đủ để so sánh direction trong sprint này. |
| CTR | 4.6% | 1.9% | A kéo curiosity mạnh hơn. |
| Store CVR | 7% | 29% | A làm người click thất vọng khi thấy store không giống ad. |
| IPM | 3.2 | 5.5 | B tạo install tốt hơn trên mỗi 1,000 impressions. |
| CPI | $0.78 | $0.46 | A không rẻ thật khi đi tới install. |
| tutorial_complete | 38% | 71% | A đưa user intent lệch vào game. |
| D1 | 11% | 30% | B có quality direction tốt hơn trong sample này. |

**Diagnosis**: Creative A là vanity trap. `CTR` cao nhưng `CVR`, `IPM`, tutorial và `D1` đều yếu. Creative B có `CTR` thấp hơn nhưng chain tốt hơn: người click hiểu store, người install hiểu game.

**Tradeoff**: Tắt Creative A sẽ làm dashboard mất một chỉ số “đẹp”. Nhưng giữ A sẽ huấn luyện team đọc sai và làm ad network tìm thêm người tò mò không phù hợp. Với budget nhỏ, signal đúng quan trọng hơn click rẻ.

**Verdict**:

1. Pause Creative A.
2. Keep Creative B as control.
3. Tạo 2 biến thể gần của B: một biến thể nhấn “big combo”, một biến thể nhấn “no timer”.
4. Không sửa store ngay vì store CVR của B đang ổn.
5. Theo dõi `level_3_complete` và `D1` trước khi tăng daily cap.

---

## Acquisition measurement checklist

Trước khi đọc dashboard, đảm bảo data có thể tin được.

| Check | Pass khi | Nếu fail thì sao |
| :--- | :--- | :--- |
| **Creative naming** | Mỗi ad angle có tên rõ: motivation + promise + variant. | Không biết số thuộc promise nào. |
| **UTM/campaign mapping** | Campaign/ad group/creative id map được về readout. | Dễ trộn số của nhiều test. |
| **Same store page** | Các creative so sánh dùng cùng store page hoặc ghi rõ variant store. | Không biết CVR lệch do creative hay store. |
| **Install source sanity** | Installs khớp giữa ad platform và store/analytics trong mức chấp nhận được. | CPI/IPM có thể bị đọc sai. |
| **Early event guardrail** | Có `first_open`, `tutorial_complete`, `level_3_complete` hoặc event tương đương. | Không biết traffic có quality không. |
| **Budget cap** | Có daily cap và stop-loss rule. | Vanity creative có thể đốt hết budget trước khi team phát hiện. |

Với Unity team, checklist này giống kiểm tra telemetry trước khi debug gameplay. Nếu log sai, diagnosis sai.

---

## Real usecases đã đối chiếu nguồn

### Internal case: Puzzle ad hook wins clicks, store loses installs

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case nội bộ `puzzle-store-mismatch`: `CTR 3.9%`, `CVR 11%`, `CPI $1.10`, `D1 29%`, first screenshot là meta menu. | Ad angle có sức kéo, nhưng store proof không nối tiếp lời hứa. Next action hợp lý là sửa first screenshot và short description trước khi đổ lỗi cho traffic quality. | Không kết luận game fail hoặc channel fail. `D1` của user đã install chưa phải điểm gãy đầu tiên. |

### Internal case: Idle creative spike with stable cohorts

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case nội bộ `idle-creative-spike`: `IPM 18 vs account avg 7`, `CPI $0.65`, `D1 38%`, `D7 16%`, early ROAS direction stable. | Khi creative signal và cohort guardrail cùng ổn, có thể scale thận trọng hoặc tạo variant quanh cùng motivation. | Không lấy IPM 18 làm target cho puzzle prototype. Đây là pattern đọc đồng thuận giữa acquisition và retention, không phải benchmark. |

### Official measurement surfaces

| Source signal | Cách dùng trong bài này | Không được suy ra |
| :--- | :--- | :--- |
| Google Play Acquisition reporting cho phép theo dõi impressions, acquisitions và conversion rate theo nguồn/country/listing/campaign. | Dùng để đọc store-side conversion và tách nguồn traffic khi chẩn đoán `CVR`. | Không thay thế event analytics trong game; nó không tự trả lời vì sao user churn sau install. |
| Google Play Store Listing Experiments cho phép A/B test text/graphics để cải thiện install conversion. | Nếu `CTR` ổn nhưng store `CVR` yếu, store experiment là action hợp lý. | Không dùng store experiment để sửa first-session proof nếu retention guardrail mới là điểm gãy. |
| Apple AdAttributionKit giúp đo campaign performance theo hướng privacy-preserving. | Với iOS-aware plan, biết rằng attribution có giới hạn và cần đọc signal theo cohort/guardrail, không đòi user-level perfection. | Không giả định iOS report sẽ chi tiết như Android dashboard hoặc như internal analytics. |

---

## Common mistakes

**Mistake 1 - Scale vì `CTR` cao.**

**Correction**: Chỉ coi `CTR` là tín hiệu ad promise. Phải kiểm `CVR`, `IPM` và guardrail sau install trước khi tăng daily cap.

**Mistake 2 - So sánh creative khác country/store page.**

**Correction**: So creative sibling trong cùng phạm vi. Nếu store page khác, ghi rõ đó là test store + creative, không phải chỉ creative.

**Mistake 3 - Dùng `CPI` rẻ làm bằng chứng game tốt.**

**Correction**: `CPI` là cost outcome đầu phễu. Game tốt hay không cần first-session, retention và monetization signal.

**Mistake 4 - Không tính `IPM`.**

**Correction**: Luôn tính `IPM` để thấy creative nào thật sự biến impressions thành installs, nhất là khi `CTR` và `CVR` đi ngược nhau.

**Mistake 5 - Nhìn account average thay vì ad angle.**

**Correction**: Đọc theo từng angle. Account average làm mờ mất promise nào đang thắng hoặc đang tạo vanity trap.

---

## English Terms You Should Keep

- **CTR**: Click-Through Rate, tỷ lệ click trên impressions.
- **Store CVR**: Store Conversion Rate, tỷ lệ store visitor/click chuyển thành install.
- **IPM**: Installs Per Mille, số installs trên mỗi 1,000 impressions.
- **CPI**: Cost Per Install, chi phí trung bình cho một install.
- **CPC**: Cost Per Click, chi phí trung bình cho một click; không đủ để đánh giá UA quality.
- **vanity metric**: Metric nhìn đẹp nhưng không dẫn tới decision đúng.
- **creative sibling**: Các creative được test trong cùng phạm vi để so sánh công bằng.
- **guardrail metric**: Metric phụ ngăn team scale một signal đầu phễu sai.

---

## Lab output example

```text
ACQUISITION SIGNAL READOUT

Test scope:
Android / VN / one store page / $180 / 3 days / social feed.

Ad angle:
Real combo clear.

Raw numbers:
Impressions: 38,000
Clicks: 722
Installs: 210
Spend: $96.60

Calculated:
CTR: 1.9%
Store CVR: 29%
IPM: 5.5
CPI: $0.46

Guardrail:
tutorial_complete: 71%
D1: 30%

Diagnosis:
Healthy acquisition sync. CTR is not the highest, but CVR/IPM/guardrail are coherent.

Next action:
Keep this creative as control. Produce two close variants around real combo clear. Do not switch store assets yet.

Do not conclude:
Do not claim ROAS-positive. This readout only proves early acquisition quality direction.
```

Bảng nộp lab:

| Field | Your value |
| :--- | :--- |
| Test scope | |
| Ad angle / promise | |
| Impressions | |
| Clicks | |
| Installs | |
| Spend | |
| CTR | |
| Store CVR | |
| IPM | |
| CPI | |
| Guardrail metric | |
| Diagnosis | |
| Next action | |
| Do not conclude | |

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn 2 creative sibling từ cùng một hypothesis.
2. Điền raw numbers: impressions, clicks, installs, spend.
3. Tính `CTR`, `Store CVR`, `IPM`, `CPI`.
4. Thêm ít nhất một guardrail sau install: `tutorial_complete`, `level_3_complete`, `D1`.
5. Viết diagnosis cho từng creative bằng một trong các nhãn: `clickbait trap`, `weak creative`, `store mismatch`, `healthy sync`, `cheap low-intent`, `inconclusive`.
6. Ghi next action cho từng creative.
7. Ghi một điều không được kết luận từ data hiện tại.
8. Ghi decision authority cho metric chính: metric này cho phép sửa creative, store, first-session hay chỉ hold sample?
9. Viết acquisition readout memo gồm scope, observed pattern, decision allowed, decision blocked và owner.

Quality chain check:

- Bạn có đang so creative cùng scope không?
- Bạn có tính IPM hay chỉ nhìn CTR/CPI?
- Bạn có guardrail sau install không?
- Next action có sửa đúng mắt xích không?
- Có dòng “do not conclude” để tránh over-read không?

---

## Final UA Plan Update

Cập nhật trường **metricTargets** trong Final UA Plan:

```text
Acquisition decision ranges:
- CTR range for this sprint: [not a universal benchmark]
- Store CVR range for this sprint: [not a universal benchmark]
- IPM range for this sprint: [comparison against creative siblings]
- CPI acceptable range: [based on budget and learning goal]

Guardrail:
- Early quality metric: [tutorial_complete / level_3_complete / D1]
- Minimum readout rule: [sample or spend condition before decision]

Action rules:
- High CTR + weak CVR: [store/ad continuity action]
- Low CTR + strong CVR: [creative hook action]
- Strong IPM + weak guardrail: [do not scale; inspect first-session proof]
- Inconclusive: [rerun/narrow scope action]

Metric decision authority:
- Metric allowed to decide:
- Metric not allowed to decide:
- Required guardrail before scale:

Readout memo:
- Scope:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next owner:
```

Plan field được cập nhật: **metricTargets**. Bài này cũng hỗ trợ field **hypothesis** từ Day 7 vì metric ranges phải trả lời đúng hypothesis đã chọn.

---

## Checklist Focus

- [ ] Đã điền acquisition readout theo từng creative/ad angle, không chỉ account average.
- [ ] Đã tính `CTR`, `Store CVR`, `IPM`, `CPI` từ raw numbers.
- [ ] Đã ghi guardrail sau install để tránh scale traffic low-intent.
- [ ] Đã phân loại pattern: clickbait trap, weak creative, store mismatch, healthy sync, cheap low-intent hoặc inconclusive.
- [ ] Đã viết next action cụ thể cho creative/store/first-session.
- [ ] Mỗi metric chính có decision authority: được phép quyết định gì và bị cấm kết luận gì.
- [ ] Readout memo có scope, observed pattern, decision allowed, decision blocked và owner.
- [ ] Đã cập nhật **metricTargets** trong Final UA Plan bằng decision ranges.

---

## Curated References

- [Google Play Console - Acquisition reporting](https://play.google.com/console/about/acquisitionreporting/) - Official Play Console surface for monitoring store listing impressions, acquisitions and conversion rate by source and other dimensions.
- [Google Play Console - Store listing experiments](https://play.google.com/console/about/store-listing-experiments/) - Official tool for A/B testing listing text and graphics when store conversion is the suspected leak.
- [Apple Developer - AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) - Official Apple documentation for privacy-preserving campaign attribution on iOS.
