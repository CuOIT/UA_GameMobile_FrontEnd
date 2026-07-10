---
day: 1
title: "UA as a product learning loop"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
artifact: "UA learning loop map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **UA learning loop map** cho game puzzle của mình: một bản đồ nối `ad promise -> store proof -> first-session proof -> metric pattern -> next action`.

Quyết định bạn học cách đưa ra: **test UA đầu tiên nên học điều gì trước khi chi tiền?** Không phải "làm sao mua install rẻ nhất", mà là "nếu bỏ $100-500 vào một test nhỏ, mình sẽ biết nên sửa creative, store, onboarding, tracking hay giả thuyết sản phẩm".

Kết quả cần có sau bài:

- Một câu `hypothesis` đủ rõ để copy vào Final UA Plan.
- Một bản đồ 5 mắt xích cho funnel đầu tiên.
- Một metric chính và một metric phụ cho từng mắt xích quan trọng.
- Một `next action` viết sẵn cho trường hợp tín hiệu tốt, yếu hoặc mâu thuẫn.

---

## Why this matters

Với team Unity indie, lỗi nguy hiểm nhất không phải là "chưa biết chạy ads". Lỗi nguy hiểm hơn là **chạy ads như một bài kiểm tra may rủi**: có CPI rẻ thì vui, CPI cao thì buồn, nhưng không biết phải sửa gì trong game.

Ngân sách `$100-500` không đủ để chứng minh game có thể scale toàn cầu. Nhưng nó đủ để phát hiện vài sự thật đắt giá:

- Ad có hứa đúng động cơ người chơi không?
- Store page có xác nhận đúng thứ khiến người ta click không?
- First session có giao được cảm giác mà ad/store đã hứa không?
- Dashboard có đo được sự kiện tối thiểu để ra quyết định không?

Nếu không định nghĩa learning loop trước, bạn dễ tiêu hết tiền rồi chỉ có một câu mơ hồ: "traffic không tốt". Câu đó không giúp dev sửa tutorial, designer sửa screenshot, hay producer quyết định test tiếp. Một UA test tốt phải kết thúc bằng **một quyết định vận hành**, không phải chỉ bằng ảnh chụp dashboard.

---

## Core model: UA Promise Chain

Hãy coi UA là hệ thống kiểm tra lời hứa của sản phẩm.

```text
Ad promise -> Store proof -> First-session proof -> Metric pattern -> Next action
```

Mỗi mắt xích trả lời một câu hỏi khác nhau:

- **Ad promise**: Người chơi click vì kỳ vọng điều gì?
- **Store proof**: Trang store có làm họ tin game thật sự có điều đó không?
- **First-session proof**: 3 phút đầu có giao đúng cảm giác đã hứa không?
- **Metric pattern**: Số liệu đang chỉ ra mắt xích nào yếu nhất?
- **Next action**: Team sẽ sửa gì, giữ gì, test lại gì?

Điểm quan trọng: một chỉ số đơn lẻ hiếm khi đủ. `CTR` cao chỉ nói ad gây chú ý. `CPI` thấp chỉ nói bạn mua được install rẻ trong bối cảnh đó. `D1 retention` yếu chỉ nói người chơi không quay lại, nhưng chưa nói nguyên nhân nằm ở promise, store, tutorial, performance, difficulty hay tracking.

Vì vậy bài 1 đặt nền cho toàn khóa: **đọc funnel như một chuỗi bằng chứng**, không đọc từng metric như một kết luận độc lập.

---

## Khung UA learning loop map mẫu

Điền bảng này trước khi chạy test đầu tiên. Nếu chưa điền được, test chưa sẵn sàng.

| Mắt xích | Câu hỏi vận hành | Bằng chứng cần thấy | Metric đọc chính | Next action nếu yếu |
| --- | --- | --- | --- | --- |
| Player motivation | Người chơi nào đang có vấn đề/cảm giác nào? | Một motivation cụ thể, không phải demographic chung chung | CTR theo hook hoặc IPM | Viết lại hook quanh motivation khác |
| Ad promise | Video/ảnh ad hứa trải nghiệm gì trong 3 giây đầu? | Gameplay thật hoặc dramatization trung thực | CTR, thumb-stop, IPM | Sửa 3 giây đầu, không sửa game vội |
| Store proof | Store có xác nhận đúng lời hứa không? | Icon, first screenshot, short description cùng một promise | Store CVR, CPI sau click | Đổi screenshot/short copy trước khi đổi network |
| First-session proof | Người chơi có cảm thấy promise trong 30-180 giây đầu không? | `first_open`, `level_start`, `tutorial_complete`, early win | tutorial_complete, level_3_reach, D1 | Sửa onboarding, pacing, level 1-3 |
| Learning decision | Sau test này team sẽ làm gì? | Một rule: continue / iterate / pause / fix tracking | Pattern nhiều metric | Ghi decision và confidence vào learning log |

Không cần bảng này hoàn hảo. Cần nó **cụ thể đủ để team không tranh luận bằng cảm tính** sau khi có kết quả.

### Learning loop decision contract

Trước khi chạy test đầu tiên, viết một contract nhỏ cho loop. Contract này trả lời: test này được phép tạo quyết định gì, và điều gì vẫn nằm ngoài phạm vi vì sample quá nhỏ.

| Mắt xích | Quyết định được phép sau test nhỏ | Quyết định bị cấm | Evidence tối thiểu |
| --- | --- | --- | --- |
| Ad promise | Giữ, sửa hoặc bỏ một hook promise | Kết luận market fit hoặc channel fit | `CTR`/`IPM` theo ad angle, cùng scope |
| Store proof | Sửa first screenshot, title, short description | Đổ lỗi gameplay nếu store chưa nối promise | Store CVR hoặc click-to-install direction |
| First-session proof | Sửa onboarding, level 1-3, early win, pacing | Kết luận motivation sai khi game chưa giao promise | `tutorial_complete`, early level milestone, D1 direction |
| Tracking | Hold decision và sửa event/source mapping | Chọn winner/loser khi event chưa QA | `first_open`, milestone event, campaign naming pass |
| Learning decision | Continue / iterate / pause / rerun gọn hơn | Scale mạnh hoặc kill product từ một cohort nhỏ | Metric pattern + confidence note + owner |

Câu contract tốt nên có dạng:

```text
This test can decide: [which chain link to fix first].
This test cannot decide: [market fit / LTV / broad channel quality / product kill].
```

Nếu không ghi dòng "cannot decide", dashboard sau test sẽ rất dễ bị dùng để kể câu chuyện lớn hơn dữ liệu.

---

## Sơ đồ vận hành: từ lời hứa đến quyết định

![The UA Promise Chain Diagram](content/assets/usecases/day-01-hero-diagram.svg)

**Visual readout**

- **Inspect:** Nhìn luồng từ trái sang phải: ad tạo kỳ vọng, store xác nhận, first session thực thi, metric phản ánh chỗ rò rỉ, rồi team chọn hành động.
- **Conclude:** UA không đứng ngoài product. Nếu ad và game không cùng một lời hứa, dashboard sẽ trả về tín hiệu nhiễu: có thể rẻ ở đầu funnel nhưng hỏng ở retention.
- **Do not infer:** Không suy ra rằng mọi creative phải mô tả game khô cứng 100%. Ad có thể được edit, tăng nhịp, làm rõ drama; vấn đề là không được hứa một trải nghiệm mà build thật không giao nổi.

---

## Bảng đọc pattern: cheap traffic không luôn là good traffic

![Funnel alignment comparison chart](content/assets/usecases/day-01-data-visual.svg)

:::chart
title: D1 active users giả lập trên 10.000 impressions
Clickbait promise|2.4|CTR cao nhưng store và D1 sụp vì lời hứa lệch
Aligned promise|24.0|CTR vừa phải nhưng store và first session cùng xác nhận promise
:::

Bảng dưới dùng số giả lập để luyện tư duy, không phải benchmark chung cho mọi game.

| Scenario | CTR | Store CVR | D1 retention | D1 active users / 10k impressions | Cách đọc |
| --- | ---: | ---: | ---: | ---: | --- |
| Clickbait promise | 6.0% | 8% | 5% | 2.4 | Nhiều người tò mò click, ít người tin store, rất ít người ở lại |
| Aligned promise | 2.0% | 30% | 40% | 24.0 | Ít click hơn, nhưng người click hiểu đúng game và ở lại tốt hơn |
| Weak hook, good proof | 0.7% | 32% | 35% | 7.8 | Product/store có thể ổn, creative chưa tạo đủ chú ý |
| Store mismatch | 3.2% | 9% | 28% | 8.1 | Ad có interest, store không xác nhận được promise |

**Visual readout**

- **Inspect:** So sánh output cuối funnel, không chỉ nhìn `CTR`. Scenario aligned có CTR thấp hơn clickbait nhưng tạo nhiều D1 active users hơn.
- **Conclude:** Với micro-budget, mục tiêu đầu tiên là tìm mắt xích yếu nhất và giảm rủi ro, không phải tối ưu một metric đẹp.
- **Do not infer:** Đừng lấy các con số này làm target cứng. Hãy dùng chúng như mô hình đọc pattern: metric đầu funnel phải được đối chiếu với store và retention.

---

## Hướng dẫn đọc số và chẩn đoán phễu

Khi có kết quả test nhỏ, đọc theo thứ tự này:

1. **Tracking có đáng tin không?** Nếu `first_open` trùng lặp, `tutorial_complete` thiếu, hoặc campaign name sai, dừng đọc performance. Sửa đo lường trước.
2. **Ad có tạo interest không?** Nhìn `CTR` hoặc `IPM`, nhưng chỉ dùng để đọc sức hút của promise.
3. **Store có xác nhận promise không?** Nếu `CTR` ổn mà `Store CVR` yếu, nghi store mismatch trước khi nghi product.
4. **First session có giao promise không?** Nếu store ổn nhưng `tutorial_complete`, `level_3_reach`, `D1` yếu, nghi onboarding/pacing.
5. **Decision có đủ tự tin không?** Nếu install quá ít, ghi "directional signal" và chọn bước nhỏ hơn, không scale.

| Pattern | Chẩn đoán ưu tiên | Hành động đúng | Hành động dễ sai |
| --- | --- | --- | --- |
| CTR cao, Store CVR thấp | Ad-to-store mismatch | Làm lại first screenshot/short description hoặc sửa ad để đúng gameplay | Tăng budget vì nghĩ "ad thắng" |
| Store CVR ổn, tutorial_complete thấp | Store-to-game mismatch | Rút ngắn tutorial, cho early win sớm hơn, kiểm crash/performance | Đổi network ngay |
| CPI thấp, D1 thấp | Cheap low-intent traffic hoặc promise lệch | Đối chiếu creative promise với first-session behavior | Kết luận game có market fit vì CPI rẻ |
| CTR thấp, Store CVR/D1 ổn trên sample nhỏ | Hook yếu nhưng product proof có tín hiệu | Viết thêm creative quanh cùng motivation | Sửa core loop lớn khi chưa cần |
| Metric mâu thuẫn, sample rất nhỏ | Evidence yếu | Ghi confidence thấp, giảm số biến test, rerun gọn hơn | Chọn winner quá sớm |

---

## Worked example: Calming Hex Puzzle

Team làm một game puzzle lục giác thư giãn. Họ có $150 cho test Android đầu tiên. Trước khi chạy, họ viết hypothesis:

> "Người chơi casual muốn một puzzle thư giãn, ít áp lực sẽ click vào ad gameplay ghép lục giác có combo mềm, tin store nếu screenshot đầu cho thấy board rõ ràng, và ở lại nếu level đầu cho họ một early win trong 30 giây."

Thiết lập test:

- 1 ad creative: 12 giây gameplay thật, có tăng tốc nhẹ, mở đầu bằng một combo clear.
- Store: icon và 3 screenshot đầu đều dùng board lục giác sáng, ít chữ.
- Build: level 1 solvable trong 3 move, không có popup dài trước lượt chơi đầu.
- Events: `first_open`, `level_1_start`, `level_1_complete`, `tutorial_complete`, `session_2_start`.

Kết quả giả lập sau test nhỏ:

| Metric | Kết quả | Cách đọc |
| --- | ---: | --- |
| CTR | 1.9% | Có interest vừa đủ, không phải creative thắng lớn |
| Store CVR | 31% | Store đang xác nhận promise tương đối tốt |
| tutorial_complete | 54% | Nhiều người rơi trong first session |
| level_3_reach | 29% | Early pacing hoặc hướng dẫn có vấn đề |
| D1 retention | 22% | Chưa đủ tự tin để scale |

Verdict:

- Không sửa ad trước. Ad và store chưa phải mắt xích yếu nhất.
- Không kết luận "game dở". Pattern đang chỉ vào **first-session proof**.
- Next action: giữ cùng ad/store, sửa onboarding level 1-3, giảm text tutorial, thêm early combo trong 15 giây đầu, rồi rerun một test nhỏ để cô lập thay đổi product.

Điểm học được: test đầu tiên không "thua". Nó đã trả lời được câu hỏi quan trọng: **promise có thể kéo người vào store, nhưng build chưa giao promise đủ nhanh**.

### First-test readout memo

Khi data về, viết memo ngắn trước khi bàn giải pháp. Memo giúp team không nhảy từ "D1 yếu" sang "game fail" hoặc từ "CPI rẻ" sang "scale ngay".

```text
First UA learning loop readout - Calming Hex Puzzle

Learning question:
Does the calm hex-clear promise survive ad -> store -> first session?

Observed pattern:
- CTR is directional, not a breakout.
- Store CVR is healthy for this sprint.
- tutorial_complete, level_3_reach and D1 point to first-session leak.

Decision allowed:
- Keep ad/store constant.
- Repair first-session proof: shorter tutorial, earlier combo, level 1-3 pacing.
- Rerun a small test to isolate product-side change.

Decision blocked:
- Do not call the channel bad.
- Do not rewrite the ad promise yet.
- Do not scale because store CVR is healthy.
- Do not kill the product from one small cohort.

Next owner:
Product/design owns first-session repair; UA owner freezes current ad/store for rerun.
```

Một readout đạt chuẩn luôn có `Decision allowed` và `Decision blocked`. Hai dòng này biến UA từ “báo cáo số” thành hệ thống học hỏi có kỷ luật.

---

## Checklist kỹ thuật thiết lập learning loop

Trước khi bật paid traffic, dùng checklist này để bảo vệ chất lượng học hỏi.

| Check | Pass khi | Nếu fail thì |
| --- | --- | --- |
| Hypothesis rõ | Có player motivation, ad promise, store proof, first-session proof | Không chạy test; viết lại hypothesis |
| Creative trung thực | Ad dùng gameplay thật hoặc dramatization không lừa expectation | Sửa creative scope trước khi spend |
| Store continuity | First screenshot xác nhận cùng một promise với ad | Đổi screenshot/copy trước khi chạy |
| First-session proof | Người chơi cảm nhận core value trong 30-180 giây | Sửa onboarding/pacing trước scale |
| Event tối thiểu | `first_open`, early progress, tutorial/level milestone hoạt động trên device thật | Fix analytics trước khi đọc số |
| Decision rule | Có action nếu good/weak/mixed signal | Không launch vì kết quả sẽ gây tranh luận |

Đây là checklist chất lượng, không phải thủ tục giấy tờ. Mỗi dòng phải giúp bạn tránh một quyết định sai sau khi có dashboard.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Merge Mansion và sức mạnh của promise khác biệt

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Trang Google Play của Merge Mansion mô tả game là mystery/merge puzzle, nhấn vào việc restore mansion, collect clues và câu chuyện Grandma. Trang Metacore cũng giới thiệu Merge Mansion như hit đầu tiên của studio với promise về mansion, mystery và merge gameplay. | Một puzzle/merge game có thể bán bằng **promise động cơ** rộng hơn mechanic thuần túy: bí ẩn, tiến triển, curiosity. Với indie team, bài học không phải copy drama, mà là viết rõ ad promise đang bán "cảm giác gì". | Không suy ra rằng indie puzzle game phải làm live-action ad hoặc narrative phức tạp. Studio lớn có ngân sách và brand context khác; ta chỉ học cách promise được đóng gói nhất quán. |

### Usecase 2: Google Play Store Listing Experiments

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play Console có tính năng Store listing experiments để A/B test text và graphics nhằm cải thiện install conversion và retention direction. | Store page là một mắt xích có thể kiểm chứng, không phải nơi "up ảnh cho đủ". Nếu ad kéo được click nhưng install yếu, screenshot/copy store là một biến cần test trước khi đổ lỗi network. | Không suy ra rằng A/B test store sẽ cho câu trả lời sạch với mọi micro-budget. Với traffic ít, kết quả vẫn cần confidence note và không nên overread. |

### Usecase 3: Case nội bộ của khóa - cheap installs, weak D1

| Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Case `Puzzle soft-launch: cheap installs, weak D1` có CPI `$0.42`, CTR `1.8%`, Store CVR `32%`, tutorial_complete `54%`, D1 `22%`, D7 `4%`. | Acquisition và store có tín hiệu hứa hẹn, nhưng cohort rơi trước khi game chứng minh core promise. Next action hợp lý là pause scale, sửa first-session proof, rồi rerun cùng hook tốt nhất. | Không suy ra rằng CPI `$0.42` là target chung. Đây là dữ liệu luyện đọc pattern trong khóa, không phải benchmark thị trường. |

---

## Common mistakes

- **Mistake: Chạy test để "xem CPI bao nhiêu"** - **Correction:** Viết learning question trước: "Mình đang kiểm chứng promise nào, ở mắt xích nào, và nếu fail sẽ sửa gì?"
- **Mistake: CTR cao thì gọi creative thắng** - **Correction:** CTR chỉ là interest. Creative chỉ đáng giữ nếu store proof và early cohort không bị phá bởi mismatch.
- **Mistake: CPI thấp thì tăng budget ngay** - **Correction:** Đối chiếu CPI với D1, early progress và traffic intent. Cheap installs có thể là low-intent traffic.
- **Mistake: Sửa cùng lúc ad, store, tutorial và audience** - **Correction:** Nếu thay quá nhiều biến, test sau không nói được nguyên nhân. Chọn một mắt xích yếu nhất để sửa trước.
- **Mistake: Đọc số khi tracking chưa ổn** - **Correction:** Một dashboard sai nguy hiểm hơn không có dashboard. Validate event tối thiểu trên device thật trước spend.

---

## English Terms You Should Keep

| Term | Giữ nguyên vì | Cách hiểu trong bài này |
| --- | --- | --- |
| `UA` | Thuật ngữ chuẩn trong mobile growth | Hệ thống học hỏi để mua user mới và cải thiện product-market signal |
| `Funnel` | Dashboard/tool thường dùng | Chuỗi bước từ impression đến install, first session, return |
| `CPI` | Metric media phổ biến | Chi phí trung bình cho install, không tự chứng minh user quality |
| `CTR` | Metric creative phổ biến | Tín hiệu ad có tạo click/interest hay không |
| `CVR` | Metric conversion phổ biến | Tỷ lệ chuyển đổi ở store hoặc một bước funnel cụ thể |
| `D1 retention` | Metric cohort phổ biến | Tín hiệu người chơi có đủ lý do quay lại sau ngày đầu không |
| `Hypothesis` | Ngôn ngữ experiment | Câu giả thuyết nối player, promise, proof, metric và next action |

---

## Lab output example

Mẫu output bạn có thể copy vào note hoặc Final UA Plan:

```text
UA Learning Loop Map - Test 01

Hypothesis:
Casual puzzle players who want a calm 3-minute break will respond to a "satisfying hex clear" ad promise if the store first screenshot shows the same board state and the first session gives an early combo within 30 seconds.

Ad promise:
12s gameplay clip, first 3s shows one clear combo, no fake failure scene.

Store proof:
Icon and first 3 screenshots show the same hex board, calm colors, no meta menu as first image.

First-session proof:
Level 1 starts within 10 seconds after open. Player completes first clear within 30 seconds. No long text tutorial before first move.

Metric pattern to read:
- CTR/IPM tells whether the promise attracts interest.
- Store CVR tells whether store confirms the promise.
- tutorial_complete + level_3_reach + D1 tells whether game delivers the promise.

Decision rule:
If CTR weak but Store CVR/D1 acceptable -> make new hooks around same motivation.
If CTR acceptable but Store CVR weak -> fix first screenshot and short description.
If Store CVR acceptable but tutorial/D1 weak -> fix first-session proof before scale.

Learning contract:
This test can decide which link to repair first: ad, store, first session or tracking.
This test cannot decide LTV, ROAS, broad market fit, or whether the game should be killed.

Readout memo:
- Learning question:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next owner:
```

Một bản tốt phải có đủ 5 dòng: `hypothesis`, `ad promise`, `store proof`, `first-session proof`, `decision rule`. Nếu thiếu `decision rule`, bạn chưa có learning loop; bạn chỉ có mô tả campaign.

---

## Practical Lab

Làm cho game của bạn trong 25-30 phút:

1. Viết một câu hypothesis theo mẫu: `Player + motivation + ad promise + store proof + first-session proof + metric`.
2. Điền bảng 5 mắt xích: ad, store, first session, metric pattern, next action.
3. Chọn đúng **một** learning question cho test đầu tiên. Ví dụ: "Store có xác nhận promise của ad không?" hoặc "First session có giao early win đủ nhanh không?"
4. Gắn một metric chính và một metric phụ cho learning question đó.
5. Viết 3 action rule: nếu tín hiệu tốt, nếu tín hiệu yếu, nếu tín hiệu mâu thuẫn.
6. Viết learning contract: test này được phép quyết định gì và không được phép quyết định gì.
7. Viết readout memo mẫu trước khi data về để team biết cách đọc kết quả.

Quality chain check:

- Nếu `ad promise` không thấy trong store screenshot đầu, chưa chạy.
- Nếu first session không giao promise trong 30-180 giây, chưa scale.
- Nếu metric không dẫn tới action cụ thể, chưa chạy.
- Nếu tracking chưa validate trên device thật, chưa đọc kết quả.

---

## Final UA Plan Update

Cập nhật trường **hypothesis** trong Final UA Plan. Nếu app hiện tại chỉ có một field `hypothesis`, copy block này vào đó:

```text
Hypothesis:
[Player segment] có [motivation/problem] sẽ quan tâm đến [ad promise] nếu store chứng minh bằng [store proof] và first session giao [first-session proof] trong [time window].

Primary learning question:
Test đầu tiên đang kiểm chứng [ad interest / store proof / first-session proof / tracking readiness].

Primary metric:
[CTR/IPM/Store CVR/tutorial_complete/level_3_reach/D1]

Learning contract:
This test can decide:
This test cannot decide:

Decision rule:
Nếu [metric pattern tốt] -> [continue/produce variant].
Nếu [metric pattern yếu] -> [specific fix].
Nếu [metric mâu thuẫn hoặc sample nhỏ] -> [rerun smaller / reduce variables / mark low confidence].

Readout memo:
- Learning question:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next owner:
```

Các field sẽ được dùng lại ở bài sau: `audience`, `metricTargets`, `tracking`, `creativeMatrix`, `successCriteria`.

---

## Checklist Focus

- [ ] Có một hypothesis nối player motivation với ad/store/first session.
- [ ] Có một learning question duy nhất cho test đầu tiên.
- [ ] Có metric chính và metric phụ cho câu hỏi đó.
- [ ] Có action rule cho good / weak / mixed signal.
- [ ] Có learning contract: test này được phép và không được phép quyết định gì.
- [ ] Có readout memo mẫu để đọc kết quả mà không over-read.
- [ ] Có event tối thiểu để đọc first-session proof.
- [ ] Đã ghi rõ điều test này **không được phép kết luận**.

---

## Curated References

- [Google Play Console - Store listing experiments](https://play.google.com/console/about/store-listing-experiments/) - nguồn chính thức về việc test graphics/text trên store listing để cải thiện conversion.
- [Merge Mansion on Google Play](https://play.google.com/store/apps/details?hl=en_US&id=com.everywear.game5) - ví dụ public về cách một puzzle/merge game đóng gói promise quanh mystery, restore và merge tasks.
- [Metacore Games - Merge Mansion](https://metacoregames.com/games) - trang studio mô tả positioning của Merge Mansion như một mystery merge puzzle.
- [Deconstructor of Fun - Merge Mansion analysis](https://www.deconstructoroffun.com/blog/2021/8/22/merge-mansion) - case analysis để đọc cách marketability/creative/product promise được bàn trong bối cảnh merge game.
