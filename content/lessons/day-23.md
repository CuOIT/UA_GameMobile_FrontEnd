---
day: 23
title: "Budget and sample-size sanity"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [CPI, Cohort, Sample size]
artifact: "Budget sanity sheet"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Budget sanity sheet** để trả lời một câu hỏi rất thực tế trước khi bấm launch: ngân sách hiện tại có đủ nuôi quyết định bạn muốn đưa ra không?

Quyết định chính: **nếu budget không đủ nuôi số cell trong test, hãy giảm số cell hoặc hạ độ mạnh của kết luận trước khi tăng spend**.

Artifact này cập nhật các field **budget**, **successCriteria**, **killCriteria**, **creativeMatrix** và **nextAction** trong Final UA Plan.

Đầu ra cần có:

| Field | Bạn điền gì | Dùng để quyết định |
| --- | --- | --- |
| Total budget | Tổng tiền tối đa cho run này | Scope học được rộng đến đâu |
| Daily cap | Chi tiêu/ngày | Test có đủ nhịp học hay bị nhỏ giọt |
| CPI scenario | Low/base/high CPI | Install/cell trong các tình huống |
| Cell count | Số creative/audience/country cells | Matrix có bị chia quá mỏng không |
| Expected installs/cell | Budget/cell chia cho CPI | Kết luận được phép mạnh đến đâu |
| Expected D1 users/cell | Installs/cell nhân D1 scenario | Retention có đọc được không |
| Confidence language | Weak hint, directional, stronger directional | Câu chữ trong report |
| Rerun trigger | Khi nào chạy lại sạch hơn | Next action không bị đoán mò |

## Why this matters

Với budget `$100-500`, sai lầm lớn nhất không phải là sample nhỏ. Sai lầm lớn nhất là **kết luận như thể sample lớn**.

Một micro test vẫn có giá trị nếu nó dùng để:

- phát hiện mismatch rõ giữa `ad promise -> store proof -> first-session proof`;
- chọn hướng hook/store đáng validate tiếp;
- loại setup quá yếu trước khi đốt thêm tiền;
- viết một next action cụ thể cho team dev/UA.

Nhưng micro test rất dễ bị lạm dụng để tuyên bố winner, scale mạnh, hoặc kill product concept. Một vài install đầu có thể làm `CPI`, `CTR`, `CVR`, `IPM` nhảy mạnh. Một vài retained users có thể làm D1 nhìn quá tốt hoặc quá xấu. Một vài revenue events có thể khiến `ROAS` trông có vẻ có ý nghĩa, dù thực tế chỉ là noise.

Bài này dạy bạn biến budget thành **ngôn ngữ kết luận an toàn**. Budget không chỉ quyết định bạn spend bao nhiêu; nó quyết định bạn được phép nói chắc đến mức nào.

## Core model: budget -> cells -> installs -> retained users -> confidence

Đừng bắt đầu từ câu "mình có bao nhiêu tiền?". Hãy bắt đầu từ câu: **mình muốn quyết định điều gì, và quyết định đó cần bao nhiêu signal?**

Chuỗi co mẫu:

```text
Total budget
  -> budget per cell
  -> installs per cell
  -> D1 users per cell
  -> revenue events per cell
  -> allowed decision strength
```

| Layer | Câu hỏi vận hành | Dễ đọc sai | Output cần có |
| --- | --- | --- | --- |
| Total budget | Test tối đa đốt bao nhiêu? | Không có spend guardrail | Total cap + daily cap |
| CPI scenario | Một install có thể tốn bao nhiêu? | Dùng một CPI tưởng tượng | Low/base/high CPI |
| Cell count | Budget bị chia cho bao nhiêu variant? | Matrix quá rộng | Candidate cell counts |
| Installs/cell | Mỗi cell đủ đọc acquisition/store không? | Gọi winner từ sample mỏng | Allowed conclusion |
| D1 users/cell | Sau D1 còn bao nhiêu user thật? | Dùng D1 như proof mạnh | Retention caveat |
| Revenue events | Có đủ signal kinh tế không? | ROAS sớm thành kill/scale rule | Economics guardrail |
| Confidence | Kết luận mạnh đến đâu? | Câu chữ mạnh hơn dữ liệu | Confidence label |

Rule: càng đi xa khỏi install, sample càng mỏng. Vì vậy conclusion càng phải khiêm tốn.

## Budget sanity sheet mẫu

Copy khung này trước khi launch:

| Field | Example cho puzzle micro test | Decision job |
| --- | --- | --- |
| Total budget | `$240` | Chặn scope |
| Daily cap | `$40/day` trong 6 ngày | Không để delivery quá chậm |
| CPI low/base/high | `$0.60 / $0.90 / $1.30` | Không phụ thuộc một giả định |
| Candidate cells | 3, 6, 9 | So matrix width |
| Chosen cells | 4-6 max | Giữ signal đọc được |
| Budget/cell | `$40-60` nếu chọn 4-6 cells | Kiểm tra over-split |
| Installs/cell base | khoảng `44-67` | Directional creative/store read |
| D1 users/cell nếu D1 25% | khoảng `11-17` | Retention phải caveat |
| Allowed decision | Chọn hook/store direction để validate | Kết luận vừa sức |
| Not allowed | Hard ROAS scale, product kill | Chặn overclaim |
| Rerun trigger | Signal thú vị nhưng sample mỏng | Biết bước tiếp theo |

Decision strength ladder:

| Evidence state | Được phép quyết định | Không được phép quyết định |
| --- | --- | --- |
| `<25` installs/cell | Ghi weak hint, tìm lỗi rõ | Winner/kill claim |
| `25-75` installs/cell | Directional creative/store read | Scale mạnh |
| `75-150` installs/cell | Stronger directional read, focused rerun | Universal benchmark |
| `150+` installs/cell | Stable hơn cho next-stage test | Bỏ qua cohort/quality caveat |

Các band trên là operating guardrail cho micro test, không phải benchmark chung cho mọi genre, country, channel.

### Sample authority contract

Trước khi launch, hãy viết một **sample authority contract**: sample này được phép ra quyết định gì, và không được phép ra quyết định gì.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Decision to buy | Budget này đang mua quyết định gì? | Chọn 1-2 hook/store directions để validate tiếp |
| Minimum readable cell | Mỗi cell cần tối thiểu bao nhiêu install để đọc directional? | Base scenario: `75+ installs/cell`; high CPI scenario: chấp nhận weak hint |
| Confidence ceiling | Kết luận mạnh nhất được phép nói là gì? | "Directional acquisition/store signal", không "winner" |
| Blocked decision | Dù số đẹp, chưa được làm gì? | Không scale mạnh, không kill product, không chốt ROAS |
| Compression trigger | Khi nào phải giảm matrix? | CPI base > plan 25% hoặc installs/cell dự kiến < 40 |
| Rerun trigger | Khi nào signal thú vị nhưng chưa đủ tin? | Cell có CVR/D1 tốt nhưng sample/delivery bias mỏng |

Action ladder:

| Sample authority | Action được phép | Action bị chặn |
| --- | --- | --- |
| Weak hint | Log, simplify matrix, repeat cleaner | Scale, kill, rewrite roadmap |
| Directional | Iterate hook/store/proof asset | Increase spend aggressively |
| Stronger directional | Pick candidates for next sprint | Declare universal winner |
| Repeated | Update operating rule | Ignore context/caveat |

Rule: budget sheet không chỉ là calculator. Nó là **quyền hành pháp lý của kết luận** trong test.

## Hero visual: sample-size funnel

![Hero visual: sample-size funnel](content/assets/usecases/day-23-hero-diagram.svg)


```text
Budget $240
   |
   v
4 cells x $60/cell
   |
   v
Base CPI $0.90 -> ~67 installs/cell
   |
   v
D1 scenario 25% -> ~17 D1 users/cell
   |
   v
Revenue events -> usually too thin for proof
   |
   v
Allowed conclusion:
"Directional hook/store signal; retention and ROAS unproven"
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Budget/cell thấp hơn total budget rất nhiều | Matrix width là biến quyết định sample | Thêm nhiều variants luôn học nhiều hơn |
| D1 users/cell chỉ là một phần của installs/cell | D1 cần caveat mạnh hơn CPI/CVR | D1 mỏng đủ để kill product |
| Revenue events nằm ở tầng mỏng nhất | ROAS sớm chỉ là guardrail | Economy đã được chứng minh |
| Confidence language nằm cuối funnel | Report phải phản ánh sample thật | Cứ có số là có thể kết luận mạnh |

## Data visual: confidence language table

![Data visual: confidence language table](content/assets/usecases/day-23-data-visual.svg)


| Metric layer | Signal thường có trong micro test | Allowed language | Forbidden language | Next action |
| --- | --- | --- | --- | --- |
| `CTR`/click | Nhiều hơn install | "Ad attention looks stronger/weaker" | "Player quality proven" | Check store/product chain |
| Store `CVR` | Install-level | "Store proof direction" | "Product-market fit proven" | Improve screenshot/copy |
| `CPI` | Install-level nhưng bị delivery bias | "Cost direction under this setup" | "This audience is permanently cheap" | Compare with spend/cell caveat |
| D1 | Nhỏ hơn installs nhiều | "Retention direction with caveat" | "Retention winner" | Wait cohort or reduce cells |
| `ROAS`/revenue | Mỏng nhất | "Economics guardrail" | "Payback proof" | Use as caution, not scale rule |

Budget calculator readout:

| Input | Formula | Example | Interpretation |
| --- | --- | ---: | --- |
| Total budget | given | `$240` | Total cap |
| Cells | chosen | `6` | Matrix width |
| Budget/cell | budget / cells | `$40` | Thin cell |
| Installs/cell at CPI `$0.90` | budget/cell / CPI | `44` | Directional only |
| D1 users/cell at 25% | installs/cell x D1 | `11` | Retention caveat |
| Confidence label | map sample to decision | `Directional` | Do not scale/kill hard |

Readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| 6 cells gives only `$40/cell` | The matrix is wide for a `$240` test | All 6 cells can produce a clean winner |
| D1 users/cell is near 11 | D1 can flag concern, not prove retention | A low D1 here automatically kills the game |
| CPI scenario controls installs/cell heavily | Write low/base/high outcomes | One CPI estimate is enough |

## Hướng dẫn đọc số

Đọc theo thứ tự này, không nhảy thẳng vào conclusion:

1. **Budget/cell**: mỗi cell thật sự được nuôi bao nhiêu tiền?
2. **Installs/cell**: với CPI low/base/high, mỗi cell có bao nhiêu install?
3. **Metric layer**: bạn đang kết luận từ click, install, D1 hay revenue?
4. **Spend distribution**: cells có được phân phối tương đối công bằng không?
5. **Confidence language**: câu kết luận có mạnh hơn sample không?

Decision table:

| Pattern | Cách đọc | Next action |
| --- | --- | --- |
| CPI cao hơn high scenario | Installs/cell thấp hơn kế hoạch, confidence giảm | Giảm cells hoặc tăng cap có chủ đích |
| Một cell thắng mạnh nhưng `<25` installs | Interesting hint, chưa phải winner | Rerun cleaner hoặc gom variants |
| `CTR` tốt, `CVR` yếu | Ad promise kéo click nhưng store proof yếu | Sửa store proof trước khi mở thêm cells |
| `CVR` tốt, D1 yếu nhưng D1 users rất ít | First-session concern, sample mỏng | Ghi caveat, đợi cohort hoặc validate |
| D1 nhìn tốt từ cohort nhỏ | Early positive direction | Không scale mạnh từ D1 mỏng |
| Spend lệch giữa cells | Delivery bias | Không gọi winner nếu spend không công bằng |
| ROAS sớm âm | Chưa đủ kết luận economy | Dùng như guardrail, không kill concept |

Confidence rule: nếu câu kết luận nghe mạnh hơn sample cho phép, sửa câu trước khi sửa campaign.

## Worked example: `$240` budget, 6 cells

Team có `$240`, muốn test 3 motivations, mỗi motivation có 2 executions. Tổng cộng 6 cells.

| Setup | Cells | Budget/cell | Installs/cell at `$0.60` | Installs/cell at `$0.90` | Installs/cell at `$1.30` | D1 users/cell nếu D1 25% |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 3 motivations | 3 | `$80` | `133` | `89` | `62` | `16-33` |
| 6 executions | 6 | `$40` | `67` | `44` | `31` | `8-17` |
| 9 variants | 9 | `$27` | `44` | `30` | `21` | `5-11` |

Diagnosis:

- Nếu mục tiêu là chọn giữa **3 player motivations**, 3 cells hợp lý hơn. Mỗi cell có đủ install hơn để đọc direction.
- Nếu mục tiêu là so execution detail trong từng motivation, 6 cells có thể chạy, nhưng conclusion phải yếu hơn.
- 9 cells tạo cảm giác "test nhiều", nhưng với `$240` nó biến report thành noise.

Verdict:

Chọn 3 cells cho first run. Nếu team rất cần so 2 executions/motivation, chọn 6 cells nhưng viết trước caveat: "This run can identify acquisition/store direction. It cannot prove retention or ROAS."

Tradeoff:

Ít cells học ít dimension hơn nhưng đọc sạch hơn. Nhiều cells học nhiều surface hơn nhưng tăng delivery bias, giảm installs/cell và làm team dễ overclaim.

Report sentence tốt:

```md
Cell B has the strongest directional acquisition/store signal in this run.
Because it has 44 installs and ~11 D1 users, retention remains unproven.
Next action: rerun 2-3 cleaned cells around this motivation before scale.
```

Report sentence xấu:

```md
Cell B is the winner. Scale it and kill the other motivations.
```

### Post-test sample readout memo

Sau test, viết memo ngắn này trước khi update creative matrix hoặc budget.

```md
Sample readout memo - W4 Budget sanity

Setup:
$240 total, 3 cells, $80/cell, base CPI $0.90.

Actual delivery:
Cell A: $78 spend, 88 installs.
Cell B: $81 spend, 92 installs.
Cell C: $63 spend, 51 installs.

Sample authority:
Cells A/B are directional.
Cell C is weak hint because delivery is lower.

Signal:
Cell B has stronger Store CVR and tutorial_complete.
Cell A has higher CTR but weaker downstream proof.

Decision:
Do not scale. Pick Cell B as the next validation candidate.

Blocked decisions:
No retention winner.
No ROAS conclusion.
No product kill decision.

Next action:
Rerun Cell B against one cleaned Cell A variant with store proof frozen.
```

Memo này ép team phân biệt **actual delivery** với **creative quality**. Nếu một cell bị ít spend hơn, nó có thể thua vì delivery, không phải vì promise yếu.

### Budget go/no-go certificate

Trước khi bấm launch hoặc sau khi đọc sample, viết certificate để quyết định test có được chạy như plan, phải reduce scope, hay chỉ được rerun cleaner.

| Certificate field | Câu hỏi | Go / reduce / hold logic |
| --- | --- | --- |
| Planned decision | Budget đang mua quyết định gì? | Nếu quyết định quá mạnh, reduce conclusion |
| Chosen structure | Bao nhiêu cells, budget/cell bao nhiêu? | Nếu installs/cell quá mỏng, reduce cells |
| Confidence ceiling | Kết luận mạnh nhất được phép nói là gì? | Nếu sample thấp, chỉ weak hint/directional |
| Delivery fairness | Spend có đủ công bằng để so cell không? | Nếu lệch, rerun cleaner hoặc caveat |
| Blocked decisions | Dù số đẹp, chưa được làm gì? | Chặn scale/kill/ROAS proof |
| Final call | Launch, reduce scope, hold, rerun cleaner? | Một call duy nhất với owner/date |

```text
Budget go/no-go certificate
- Planned decision:
- Chosen structure:
- Confidence ceiling:
- Delivery fairness requirement:
- Blocked decisions:
- Final call:
- Owner/date:
```

Certificate này làm rõ một điều: budget nhỏ không cấm launch, nhưng budget nhỏ cấm kết luận quá mạnh. Nếu team muốn kết luận mạnh hơn, action đúng thường là giảm cells hoặc chạy rerun sạch hơn, không phải thêm bảng metric.

## Budget quality checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| CPI scenario | Có low/base/high, không dùng một số cứng | Viết lại scenario |
| Cell count | Tính installs/cell trước launch | Giảm variants |
| D1 caveat | Ước lượng retained users/cell | Không dùng D1 làm kill rule |
| ROAS caveat | Revenue event được xem là guardrail | Không scale/kill từ ROAS sớm |
| Spend cap | Total cap và daily cap rõ | Đặt cap trước launch |
| Delivery fairness | Spend/cell đủ gần để so sánh | Ghi delivery bias hoặc rerun |
| Decision scope | Kết luận phù hợp sample | Hạ confidence language |
| Rerun rule | Có điều kiện validate nếu signal thú vị nhưng mỏng | Viết next action |

Quality chain:

```text
budget -> CPI range -> cells -> installs/cell -> D1 users -> confidence language -> allowed decision
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Ads App campaigns best practices](https://support.google.com/google-ads/answer/6167162?hl=en) | Google khuyến nghị daily budget đủ lớn so với target CPI/CPA để hệ thống có đủ data. | Nếu micro-budget thấp hơn mức nền tảng cần để tối ưu, hãy xem test là learning run, không phải proof để scale. | Không suy ra Google threshold là benchmark bắt buộc cho mọi indie test; dùng nó như cảnh báo về data starvation. |
| [Meta ads budgets, costs and schedules](https://www.facebook.com/business/ads/pricing) | Meta nhấn mạnh ngân sách cần đủ để hệ thống học và phân bổ tốt hơn trong thời gian chạy. | Budget quá nhỏ hoặc quá phân mảnh làm delivery/learning khó ổn định, nên kết luận cần caveat. | Không suy ra Meta sẽ luôn cần cùng mức budget cho mọi game/country. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting ghép source/trigger và gửi event-level hoặc aggregatable reports trong môi trường privacy-preserving. | Measurement layer có caveat riêng; sample nhỏ cộng với reporting caveat làm conclusion càng phải rõ confidence. | Không biến privacy caveat thành lý do không đo gì hoặc không chạy test. |
| [Attribution Reporting API developer guide](https://privacysandbox.google.com/private-advertising/attribution-reporting/android/developer-guide) | Android client cần register attribution sources/triggers và enable report generation. | Nếu event setup/source/trigger chưa đúng, budget sheet phải ghi measurement risk trước khi đọc `ROAS`/conversion. | Không xem report thiếu event như evidence rằng creative/product yếu. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Official platforms đều nói về đủ data/budget để hệ thống học | Micro-budget cần scope nhỏ và language khiêm tốn | Small budget vô dụng |
| Measurement design ảnh hưởng report | Sample-size sheet phải ghi cả tracking risk | Chỉ cần tăng budget là hết noise |
| Learning systems cần thời gian và signal | Daily cap quá thấp có thể làm test kéo dài nhưng vẫn mỏng | Một con số threshold áp dụng cho mọi project |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Gọi winner khi mỗi cell quá ít installs | Viết "directional signal" và validate |
| Tăng cell count vì có nhiều ý tưởng | Giảm matrix theo budget/cell |
| Dùng D1 mỏng để kill product | Ghi retention caveat và đợi/rerun |
| Dùng ROAS sớm làm scale rule | Dùng ROAS như guardrail, chưa phải proof |
| Không ghi CPI assumption | Dùng CPI scenario range |
| Quên delivery bias | So cells chỉ khi spend đủ công bằng hoặc caveat rõ |
| Copy platform budget threshold thành luật cứng | Dùng threshold như cảnh báo về data starvation, không phải benchmark tuyệt đối |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `CPI` | Cost per install, dùng trực tiếp trong ads/report |
| `Cohort` | Nhóm user theo ngày/source cài |
| `Sample size` | Kích thước mẫu để đọc một loại decision |
| `Confidence caveat` | Ghi chú độ tin cậy của kết luận |
| `Delivery bias` | Spend phân phối không đều giữa cells |
| `Directional signal` | Tín hiệu hướng đi, chưa phải proof mạnh |
| `Guardrail` | Ranh giới vận hành để tránh quyết định quá tay |
| `Data starvation` | Campaign/cell không đủ signal để hệ thống học hoặc team đọc |

## Lab output example

```md
Budget sanity sheet - W4 Test 1

Budget:
- Total: $240
- Daily cap: $40
- CPI scenario: low $0.60 / base $0.90 / high $1.30
- Candidate cells: 3, 6, 9

Chosen structure:
- Choose 3 cells for first run.
- Budget/cell: $80.
- Expected installs/cell:
  - Low CPI: ~133
  - Base CPI: ~89
  - High CPI: ~62
- Expected D1 users/cell if D1 25%: ~16-33.

Allowed:
- Directional hook/store read.
- Identify clear mismatch.
- Choose what to validate next.

Not allowed:
- Hard ROAS scale decision.
- Product kill decision.
- Winner claim from thin D1 sample.

Confidence language:
- If one cell wins acquisition/store: "stronger directional signal".
- If CPI rises above $1.30: reduce matrix or stop low-quality delivery.
- If D1 users/cell <20: retention unproven.

Next action:
- Rerun top 2 motivations with cleaned store proof and same event setup.

Sample authority contract:
- Decision to buy: choose validation candidates, not final winners.
- Minimum readable cell: 75+ installs/cell for directional read.
- Confidence ceiling: stronger directional signal.
- Blocked decisions: no ROAS proof, no product kill, no aggressive scale.
- Compression trigger: reduce cells if expected installs/cell falls below 40.
- Rerun trigger: any interesting signal with delivery bias or thin D1.

Budget go/no-go certificate:
- Planned decision:
- Chosen structure:
- Confidence ceiling:
- Delivery fairness requirement:
- Blocked decisions:
- Final call:
- Owner/date:
```

## Practical Lab

1. Nhập total budget, daily cap và CPI range thực tế nhất bạn có.
2. So sánh 3, 6, 9 cells.
3. Tính budget/cell cho từng cấu trúc.
4. Ước lượng installs/cell ở low/base/high CPI.
5. Ước lượng D1 users/cell với D1 scenario thận trọng.
6. Chọn cell count phù hợp decision cần học.
7. Viết allowed/not allowed conclusion.
8. Viết rule giảm matrix nếu CPI cao hơn dự kiến.
9. Viết confidence sentence dùng trong report.
10. Viết sample authority contract.
11. Sau test, viết sample readout memo trước khi gọi winner.
12. Viết Budget go/no-go certificate.
13. Copy Budget sanity sheet vào Final UA Plan.

Quality check: mọi conclusion phải có confidence caveat tương ứng với sample.

## Final UA Plan Update

Cập nhật field **budget**:

```md
Budget sanity:
- Total budget:
- Daily cap:
- CPI scenario range:
- Candidate cell counts:
- Chosen cell count:
- Budget per cell:
- Expected installs per cell:
- Expected D1 users per cell:
- Allowed decisions:
- Not allowed decisions:
- Confidence caveat:
- Sample authority contract:
- Budget go/no-go certificate:
- Compression trigger:
- Rerun trigger:
```

Cập nhật field **successCriteria / killCriteria**:

```md
Sample guardrail:
- Do not scale from:
- Do not kill from:
- Validate if:
- Reduce matrix if:
- Treat ROAS as:
- Treat D1 as:
- Blocked decisions:
- Minimum readable cell:
```

Cập nhật field **creativeMatrix**:

```md
Matrix compression:
- Original cells:
- Removed/merged cells:
- Reason:
- Rerun candidates:
```

Cập nhật field **nextAction**:

```md
If sample is too thin:
- Reduce cells:
- Rerun cleaner:
- Wait for cohort:
- Change conclusion language:
- Write sample readout memo:
- Write go/no-go certificate:
```

## Checklist Focus

- [ ] Budget/cell đã tính.
- [ ] CPI dùng range, không dùng một số cứng.
- [ ] Matrix không bị over-split.
- [ ] Sample authority contract đã viết trước launch.
- [ ] Budget go/no-go certificate đã viết.
- [ ] D1/ROAS có caveat riêng.
- [ ] Spend/cell đủ công bằng hoặc có delivery-bias note.
- [ ] Decision scope không vượt dữ liệu.
- [ ] Blocked decisions rõ: không scale/kill/ROAS proof khi sample mỏng.
- [ ] Có rerun trigger nếu signal thú vị nhưng delivery/sample chưa sạch.
- [ ] Sample readout memo được viết trước khi gọi winner.
- [ ] Budget sanity sheet đã copy vào Final UA Plan.

## Curated References

- [Google Ads Help - Best practices guide: Setting up your App campaigns](https://support.google.com/google-ads/answer/6167162?hl=en)
- [Meta for Business - Facebook and Instagram Ads: Budgets, Costs and Schedules](https://www.facebook.com/business/ads/pricing)
- [Privacy Sandbox - Attribution Reporting for Android overview](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Privacy Sandbox - Attribution Reporting API developer guide](https://privacysandbox.google.com/private-advertising/attribution-reporting/android/developer-guide)
