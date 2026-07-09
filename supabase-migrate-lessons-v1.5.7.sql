-- Upsert the 30 optimized UA lesson markdown files into Supabase.
-- Source: content/lessons/day-01.md ... day-30.md
-- Version: 1.5.7
-- Generated: 2026-07-09T16:23:22.419Z
-- Run supabase-schema.sql first if public.ua_content_files does not exist.

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
  ('lessons/day-01.md', 'markdown', null, '---
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

```text
[VISUAL PLACEHOLDER: Third-party image request - The UA Promise Chain Diagram]
Type: hero operating diagram.
Lesson section: Sơ đồ vận hành: từ lời hứa đến quyết định.
Previous local asset to replace: content/assets/usecases/day-01-hero-diagram.png.
Visual brief: The UA Promise Chain Diagram.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

**Visual readout**

- **Inspect:** Nhìn luồng từ trái sang phải: ad tạo kỳ vọng, store xác nhận, first session thực thi, metric phản ánh chỗ rò rỉ, rồi team chọn hành động.
- **Conclude:** UA không đứng ngoài product. Nếu ad và game không cùng một lời hứa, dashboard sẽ trả về tín hiệu nhiễu: có thể rẻ ở đầu funnel nhưng hỏng ở retention.
- **Do not infer:** Không suy ra rằng mọi creative phải mô tả game khô cứng 100%. Ad có thể được edit, tăng nhịp, làm rõ drama; vấn đề là không được hứa một trải nghiệm mà build thật không giao nổi.

---

## Bảng đọc pattern: cheap traffic không luôn là good traffic

```text
[VISUAL PLACEHOLDER: Third-party image request - Funnel alignment comparison chart]
Type: data visual/chart.
Lesson section: Bảng đọc pattern: cheap traffic không luôn là good traffic.
Previous local asset to replace: content/assets/usecases/day-01-data-visual.png.
Visual brief: Funnel alignment comparison chart.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

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
', now()),
  ('lessons/day-02.md', 'markdown', null, '---
day: 2
title: "Puzzle market thesis and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
artifact: "Puzzle market thesis"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Puzzle market thesis**: một luận điểm thị trường đủ cụ thể để quyết định game puzzle của bạn nên test ai, hứa điều gì, đo tín hiệu nào và dừng khi điều kiện nào bị gãy.

Output không phải là câu "game của tôi dành cho người thích puzzle". Output phải trả lời được:

- Người chơi nào có một nhu cầu đủ rõ để bạn làm creative trong 3 giây đầu?
- Gameplay hiện tại có chứng minh được lời hứa đó trong first session không?
- Monetization path nào có cơ hội kéo `LTV` vượt `CPI` trong micro soft-launch?
- Với ngân sách `$100-500`, điều kiện nào khiến bạn pause, iterate hoặc bỏ thesis?

Stage phục vụ: `idea` và `prototype`. Bài này cập nhật trường **Target audience** trong Final UA Plan.

---

## Why this matters

Puzzle là một genre rộng đến mức gần như vô dụng nếu dùng làm định vị UA. Hai game đều là puzzle nhưng có thể bán hai cảm giác hoàn toàn khác nhau: một game bán cảm giác "dọn sạch hỗn loạn", game khác bán cảm giác "tôi đủ thông minh để giải câu đố khó".

Với team Unity nhỏ, sai lầm phổ biến là nghĩ rằng genre rộng sẽ giúp mua được user rẻ. Thực tế vận hành lại ngược: càng mô tả rộng, creative càng nhạt, store càng giống đối thủ, first session càng khó chứng minh lời hứa. Khi đó bạn không biết CPI cao vì thị trường đắt, vì hook yếu, vì store không chứng minh được, hay vì sản phẩm chưa giữ chân được.

Market thesis giúp bạn bảo vệ ngân sách nhỏ bằng cách biến "tôi nghĩ game này có thị trường" thành một chuỗi giả thuyết có thể kiểm chứng:

`player motivation -> ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Nếu một mắt xích gãy, bạn biết sửa đúng chỗ thay vì đổi mọi thứ cùng lúc.

---

## Core model: market thesis không phải genre label

**Genre label** trả lời "game thuộc nhóm nào trên store". **Market thesis** trả lời "vì sao một nhóm người chơi cụ thể sẽ cài, chơi tiếp và có thể tạo doanh thu".

Một market thesis tốt có 6 lớp:

| Lớp | Câu hỏi phải trả lời | Dấu hiệu yếu |
| --- | --- | --- |
| Segment | Ai có hành vi hoặc ngữ cảnh chơi cụ thể? | "mọi người", "casual gamer", "người thích puzzle" |
| Motivation | Họ muốn cảm giác gì? | chỉ mô tả tuổi/giới tính |
| Promise | Ad hứa trải nghiệm nào trong 3 giây đầu? | hook không nhìn ra gameplay |
| Proof | Store và first session chứng minh lời hứa ra sao? | screenshot đẹp nhưng không liên quan hook |
| Economics | LTV đến từ ads, IAP hay hybrid? | chỉ nói "sẽ monetization bằng ads" |
| Kill rule | Khi nào thesis bị bác bỏ? | không có ngưỡng pause/iterate |

Quy tắc: nếu thesis không gợi ra được ít nhất 2 creative hook và 1 metric pattern để đọc sau test, thesis còn quá mơ hồ.

---

## Puzzle market thesis map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Puzzle market thesis map mẫu]
Type: hero operating diagram.
Lesson section: Puzzle market thesis map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Puzzle angle | Motivation chính | Ad promise | Store proof cần có | First-session proof | Metric đọc sớm | Rủi ro kinh tế |
| --- | --- | --- | --- | --- | --- | --- |
| Calm daily puzzle | Nghỉ não, routine nhẹ | "A 2-minute brain break" | Screenshot sạch, ít áp lực, màu dễ đọc | Level 1 thắng nhanh, không popup dày | D1, session count | Session ngắn khiến ad impressions thấp |
| Satisfying clear | Dọn sạch, đã mắt | "Clear chaos in one smart move" | Before/after board, combo rõ | Clear moment xuất hiện trong 60-90s | CTR, CVR, D1 | Click tốt nhưng retention dễ mỏng |
| Hard challenge | Tự hào, chứng minh trí tuệ | "Only 1% solve this" | Board khó nhìn có logic, không fake | Thử thách sớm nhưng công bằng | CTR, fail/retry, D1 | CTR cao nhưng churn cao |
| Meta collection | Hoàn thiện bộ sưu tập | "Solve to unlock rooms" | Room/progression visible | Reward meta xuất hiện sớm | Session length, D3 | Scope nội dung nặng cho team nhỏ |
| Fast retry puzzle | Thử lại nhanh, căng nhẹ | "Can you beat this run?" | Run ngắn, fail rõ | Restart nhanh, feedback mạnh | CPI, early churn | User rẻ nhưng LTV thấp |

Cách dùng map: chọn tối đa 2 angle cho test đầu. Nếu chọn 4-5 angle cùng lúc, bạn sẽ không biết metric đang phản hồi motivation nào.

### Thesis decision gate

Trước khi đưa một thesis vào test, hãy kiểm xem nó có đủ quyền trở thành **testable thesis** chưa. Một thesis nghe hay nhưng không có proof chain sẽ làm bạn đốt budget vào creative mơ hồ.

| Gate | Câu hỏi | Pass khi | Nếu fail thì |
| --- | --- | --- | --- |
| Motivation clarity | Người chơi muốn cảm giác gì trong context nào? | Nói được context chơi và emotion chính trong một câu | phỏng vấn/đọc review thêm, không sản xuất ad vội |
| Visual promise | 3 giây đầu có show được action verb không? | `clear`, `sort`, `merge`, `escape`, `decorate` nhìn thấy trên màn hình | storyboard lại hook |
| Store proof | Screenshot/video đầu có chứng minh đúng promise không? | store asset lặp lại cùng action verb của ad | sửa screenshot order/title |
| First-session proof | Level 1-3 có giao cảm giác đó không? | người chơi làm được action chính và nhận feedback sớm | sửa onboarding/level pacing |
| Economics fit | Revenue path có hợp với motivation không? | monetization không phá cảm giác chính | đổi placement/IAP hypothesis |
| Kill/iterate rule | Nếu fail, biết sửa đâu không? | có `keep / revise / pause / kill thesis` rule | viết rule trước khi chạy |

Một thesis chỉ nên chạy khi ít nhất 4/6 gate pass, và hai gate yếu nhất đã được ghi thành risk. Với budget nhỏ, risk được viết rõ còn tốt hơn confidence giả.

```text
Thesis readiness verdict
- Ready to test:
- Main risk:
- Must fix before test:
- Metric pair to read:
- If weak, first action:
- Do not change during test:
```

Quy tắc vận hành: nếu `ad promise` và `store proof` chưa cùng nói một action verb, đừng chạy paid test. Nếu paid test fail, bạn sẽ không biết người chơi từ chối thesis hay chỉ không hiểu lời hứa.

### First-test thesis contract

Trước khi thesis được đưa vào paid test, hãy viết contract một trang. Contract này khóa điều được test và điều không được đổi, để sau report bạn biết thesis yếu thật hay chỉ execution/proof chain bẩn.

| Contract field | Câu hỏi cần khóa | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Thesis sentence | Ai, motivation gì, action verb gì? | Một câu có segment + motivation + gameplay proof | Thesis vẫn là genre label |
| Proof chain | Ad, store, first session có cùng lời hứa không? | Cùng một action verb xuất hiện ở 3 surface | Test fail sẽ không biết sửa đâu |
| Metric pair | Cặp số nào đọc promise và proof? | Ví dụ `CTR/CVR`, `CVR/D1`, `D1/ARPDAU` | Dễ over-read CPI |
| Frozen variables | Cái gì không đổi trong test đầu? | store/build/geo/channel hoặc onboarding được ghi rõ | Report bị dirty |
| First weak-action | Nếu signal yếu, sửa gì đầu tiên? | creative, store, onboarding, economics hoặc thesis | Team đổi mọi thứ cùng lúc |
| Kill/pause condition | Khi nào thesis bị pause thật? | clean read + spend cap + quality floor | bỏ thesis vì một ngày nhiễu |
| Blocked conclusions | Điều gì test đầu không được kết luận? | market size, final LTV, genre winner, product death | overclaim |

```text
First-test thesis contract
- Thesis sentence:
- Proof chain:
- Metric pair:
- Frozen variables:
- First weak-action:
- Pause/kill condition:
- Blocked conclusions:
- Owner/date:
```

Contract tốt thường rất cụ thể: "Nếu CTR yếu nhưng CVR/D1 ổn, chỉ sửa creative opening" tốt hơn "nếu yếu thì tối ưu marketing". Nó giúp team học từ test nhỏ mà không vỡ scope.

---

## Hero visual: thesis chain operating diagram

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: thesis chain operating diagram]
Type: data visual/chart or decision board.
Lesson section: Hero visual: thesis chain operating diagram.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
MARKET THESIS CHAIN - Calming Block Puzzle

Player motivation
  "Tôi muốn nghỉ não 2 phút và thấy một board lộn xộn được dọn sạch"
        |
        v
Ad promise
  Video mở bằng một board gỗ rối, sau đó một nước đặt tạo clear lớn
        |
        v
Store proof
  Screenshot 1: before/after clear moment
  Screenshot 2: level sạch, không áp lực timer
        |
        v
First-session proof
  Level 1-3 cho người chơi tạo một clear moment trong 60-90 giây
  Không interstitial hoặc popup bán hàng trước khi promise được giao
        |
        v
Metric verdict
  CTR/CVR đọc sức hút của promise
  Tutorial complete/D1 đọc first-session proof
  ARPDAU/ad impressions đọc economics, chưa dùng quá sớm để kill thesis
```

Diagram này có một job duy nhất: buộc mọi claim trong thesis phải đi qua bằng chứng. Nếu một ô nghe hay nhưng ô tiếp theo không chứng minh được, đó là chỗ cần sửa trước test.

| Chain node | Evidence cần có trước test | Nếu yếu thì sửa gì trước |
| --- | --- | --- |
| Motivation | Một câu mô tả context chơi cụ thể, ví dụ `office break`, `commute`, `bedtime unwind` | Phỏng vấn/đọc review để đổi từ demographic sang tình huống chơi |
| Ad promise | Hook 3 giây có action verb nhìn thấy được: `clear`, `sort`, `merge`, `rescue` | Storyboard lại opening; bỏ claim không hiện trên màn hình |
| Store proof | Screenshot đầu tiên chứng minh đúng action verb của ad | Đổi thứ tự screenshot, title/subtitle hoặc feature graphic |
| First-session proof | Level 1-3 giao được cảm giác đã hứa trước khi monetization chen vào | Sửa onboarding, level pacing, tutorial friction |
| Metric verdict | Có cặp metric để phân biệt creative/store/product, không chỉ CPI | Gắn event tối thiểu và viết trước rule `iterate / pause / keep` |

**Inspect:** nhìn xem từng lời hứa trong ad có bằng chứng tương ứng ở store và trong 3 phút chơi đầu không.
**Conclude:** thesis mạnh khi cùng một motivation xuất hiện nhất quán ở cả creative, store và gameplay.
**Do not infer:** đừng suy ra rằng chỉ cần một diagram đẹp là thesis đúng; diagram chỉ giúp phát hiện chỗ cần test.

---

## Chart: market thesis risk score

Điểm dưới đây là ví dụ giả lập theo thang 1-5. Điểm cao nghĩa là dễ kiểm chứng với prototype nhỏ, không phải "cơ hội thị trường chắc chắn".

:::chart
title: Market thesis confidence for a small puzzle prototype
Audience clarity|4|Segment and context are concrete
Creative clarity|5|Clear moment is visible in 1 second
Store proof|3|Needs stronger screenshot order
Retention path|2|Daily habit is unproven
Monetization path|3|Rewarded ads need placement validation
:::

**Inspect:** điểm thấp nhất là `Retention path`, nghĩa là thesis có thể thu hút install nhưng chưa chứng minh người chơi quay lại.
**Conclude:** test đầu nên ưu tiên đo D1/tutorial/level depth, không chỉ đo CPI.
**Do not infer:** không dùng các điểm này làm benchmark chung cho mọi puzzle game; đây là scorecard cho một scenario.

---

## Hướng dẫn đọc số

Đọc market thesis bằng cặp số, không đọc một metric đơn lẻ.

| Pattern sau test nhỏ | Chẩn đoán | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| CTR thấp, D1 tốt | Game có proof tốt nhưng promise chưa hấp dẫn | Làm lại 3 giây đầu video, giữ thesis | Đổi target audience ngay |
| CTR cao, Store CVR thấp | Hook gây tò mò nhưng store không chứng minh lời hứa | Sửa screenshot/icon/title theo hook | Tăng budget vì tưởng ad thắng |
| CPI đạt, D1 thấp | Install mua được nhưng motivation không khớp first session | So lại tutorial/level 1-3 với promise | Scale vì CPI rẻ |
| CPI cao, D1 tốt, ARPDAU có tín hiệu | User đắt nhưng chất lượng có thể tốt | Test thêm creative để hạ CPI, chưa kill product | Kill game vì CPI vượt kỳ vọng |
| D1 tốt, ad impressions/user thấp | Retention có nhưng monetization path yếu | Thiết kế rewarded placement tự nhiên | Nhồi interstitial sớm |

Với ngân sách `$100-500`, hãy dùng ngôn ngữ "tín hiệu đủ/không đủ để học tiếp" thay vì "game thắng/thua". Mẫu nhỏ dễ nhiễu, nhưng vẫn đủ để thấy một mắt xích đang gãy nặng.

---

## Worked example: calming hex puzzle thesis

Team có prototype Unity cho game xếp khối lục giác bằng gỗ. Thesis ban đầu:

```text
Segment: người đi làm muốn nghỉ não 2 phút
Motivation: satisfying clear + calm focus
Ad promise: clear a messy wood board in one smart move
Store proof: screenshot 1 là before/after board clear
First-session proof: level 1-3 có clear moment trong 90 giây
Economics: rewarded hint + no-ads IAP
Kill rule: pause nếu spend $80 mà D1 < 18% và tutorial complete < 60%
```

Sau 3 ngày:

| Spend | Installs | CPI | CTR | Store CVR | Tutorial complete | D1 | ARPDAU early |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $96 | 240 | $0.40 | 1.4% | 31% | 86% | 34% | $0.025 |

Diagnosis:

- `Store CVR` và `D1` ổn trong scenario này, nghĩa là store và first session đang chứng minh promise khá tốt.
- `CTR` thấp làm CPI cao. Vấn đề nhiều khả năng nằm ở creative opening, không phải product-market thesis.
- ARPDAU còn sớm và thấp; chưa đủ để kết luận LTV, nhưng đủ để thêm câu hỏi monetization cho test tiếp.

Verdict: **iterate creative, giữ thesis**. Làm 3 biến thể hook nhanh hơn: one-move clear, impossible fit, calm ASMR clear. Không đổi sang "hard challenge" trước khi có bằng chứng rằng motivation calm/satisfying đã thất bại.

### Post-test thesis decision memo

Sau một test nhỏ, output tốt không phải là "CPI ổn" hay "CTR thấp". Output tốt là một verdict về thesis: giữ, sửa proof chain, đổi motivation, hoặc bỏ thesis.

```text
Post-test thesis memo
- Thesis: calm satisfying clear for 2-minute brain break.
- Strongest signal: D1 and tutorial_complete are healthy for this sprint.
- Weakest signal: CTR is weak, causing CPI pressure.
- Verdict: keep thesis, revise creative opening.
- Do not change: motivation, store proof, first-session proof, country/channel for rerun.
- Change one thing: first 3 seconds of ad.
- Next variants: one-move clear, impossible fit, calm ASMR clear.
- Kill condition for next read: CTR remains weak across 3 controlled openings while CVR/D1 no longer support the promise.
```

Decision ladder:

| Pattern | Thesis verdict | Next action |
| --- | --- | --- |
| CTR weak, CVR/D1 healthy | thesis may be right, communication weak | revise creative opening |
| CTR healthy, CVR weak, D1 unknown | attention exists, store proof weak | revise store proof |
| CTR/CVR healthy, D1 weak | acquisition works, first-session proof weak | fix onboarding/level proof |
| CTR/CVR/D1 all weak across clean tests | thesis likely weak | pause or rewrite motivation |
| CPI high but D1/economics promising | valuable user may be expensive | lower CPI via creative/channel, do not kill product |

Điểm quan trọng: thesis chỉ bị bác bỏ khi **proof chain sạch** mà vẫn yếu. Nếu chain bẩn, action là làm sạch chain, không phải viết thesis mới theo cảm xúc.

---

## Market thesis quality checklist

| Check | Câu hỏi tự kiểm | Pass khi |
| --- | --- | --- |
| Motivation | Người chơi muốn cảm giác gì? | Có một từ/cụm motivation rõ: relax, satisfy, mastery, completion |
| Promise | Ad 3 giây đầu hứa gì? | Có thể storyboard bằng 3-4 frame cụ thể |
| Proof | Store và level đầu chứng minh gì? | Screenshot và level 1-3 cùng nói một lời hứa |
| Economics | LTV đến từ đâu? | Có ít nhất một revenue path và rủi ro của nó |
| Stop-loss | Khi nào dừng? | Có spend cap + metric floor |
| Scope | Team nhỏ có làm nổi proof không? | Không phụ thuộc live ops/content khổng lồ |

Đừng thêm audience mới nếu thesis hiện tại chưa có proof chain sạch. Audience mới làm tăng nhiễu; proof chain sạch giúp bạn học nhanh hơn.

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play preview assets guidance](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play yêu cầu/khuyến nghị preview assets như icon, screenshots, feature graphic, video để trình bày app/game trên store. | Store proof là một phần của thesis, không phải việc trang trí sau cùng. Nếu ad hứa "clear chaos", screenshot đầu nên chứng minh clear moment. | Không suy ra rằng chỉ cần screenshot đẹp là CVR cao; screenshot phải khớp promise và traffic source. |
| [Google Play - Candy Crush Saga](https://play.google.com/store/apps/details?id=com.king.candycrushsaga) | Public listing thể hiện board, match/combo, progression và reward surface của một game puzzle lớn. | Một puzzle hit không chỉ bán "puzzle"; nó bán loop cụ thể: level objective, combo feedback, progression. | Không copy content scope, economy hoặc benchmark của game lớn cho team indie nhỏ. |
| [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games) | Publisher catalog có nhiều puzzle sub-angle như sort, screw, block, rescue. | Một publisher có thể test nhiều market theses khác nhau; mỗi game cần motivation và proof riêng. | Không gom mọi game casual/puzzle thành một audience duy nhất. |

Screenshot readout cần làm khi bạn chọn reference:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot đầu tiên đang show action verb nào: sort, clear, match, decorate, escape? | Action verb đó gợi motivation nào và có gần gameplay của bạn không? | Không suy ra ranking/revenue chỉ từ hình store public. |

---

## Common mistakes

- **Mistake - Correction:** Viết "target là người chơi puzzle".
  **Correction:** Viết "người cần một phiên nghỉ não 2 phút và thích cảm giác dọn board sạch".

- **Mistake - Correction:** Chọn reference là game top grossing rồi copy scope.
  **Correction:** Chọn thêm 2-3 reference cùng action verb và gần khả năng sản xuất của team.

- **Mistake - Correction:** Đặt kill rule bằng một metric duy nhất như CPI.
  **Correction:** Dùng cặp `CPI + D1` hoặc `CTR + CVR`; CPI cao nhưng D1 tốt thường là bài toán creative, không phải kill product.

- **Mistake - Correction:** Đổi thesis sau một ngày data nhiễu.
  **Correction:** Chỉ đổi thesis khi proof chain gãy có pattern rõ, ví dụ store CVR thấp lặp lại qua nhiều creative cùng promise.

---

## English Terms You Should Keep

| Term | Giữ nghĩa vận hành |
| --- | --- |
| Genre-market fit | Mức khớp giữa genre/action verb, motivation, audience và economics |
| CPI | Cost Per Install, chi phí trung bình cho một install |
| LTV | Lifetime Value, giá trị doanh thu kỳ vọng của một user/cohort |
| Market thesis | Luận điểm có thể test về ai sẽ chơi, vì sao chơi, proof nào và economics nào |
| Store proof | Bằng chứng trên store cho lời hứa của ad |
| First-session proof | Bằng chứng trong vài phút đầu rằng gameplay giao đúng promise |

---

## Lab output example

```text
Puzzle Market Thesis - v1

Game: Calming Hex Wood Puzzle
Segment: Office/commute players who want a 2-minute calm brain break
Motivation: satisfying clear + low-pressure focus
Ad promise: clear a messy wooden board in one smart move
Store proof: screenshot 1 shows before/after clear; video starts with a real board clear
First-session proof: level 1-3 creates one clear moment within 90 seconds
Reference set: 2 wood/block sort games + 1 calm daily puzzle
Initial market: Android SEA/Tier-2 for cheaper learning traffic
Economics hypothesis: rewarded hints + no-ads IAP; no forced interstitial before level 4
Metric read: CTR + CVR for promise, D1 + tutorial complete for proof
Stop-loss: pause if spend >= $80 and D1 < 18% with tutorial complete < 60%
Next iteration if weak: fix onboarding before changing audience

First-test thesis contract:
- Thesis sentence:
- Proof chain:
- Metric pair:
- Frozen variables:
- First weak-action:
- Pause/kill condition:
- Blocked conclusions:
- Owner/date:
```

Quality bar: người khác đọc output này phải biết bạn sẽ làm creative nào, store proof nào, event nào cần đo và điều kiện nào khiến campaign dừng.

Decision memo example:

```text
Thesis verdict:
Strongest signal:
Weakest signal:
Keep unchanged:
Change one thing:
Next variants:
Pause/kill condition:
Do not conclude:
```

---

## Practical Lab

1. Chọn 3 reference games cùng action verb gần game của bạn, ví dụ `sort`, `clear`, `merge`, `escape`, `decorate`.
2. Viết 2 market thesis khác nhau cho cùng prototype. Mỗi thesis chỉ được có một motivation chính.
3. Với mỗi thesis, viết một ad promise, một store proof và một first-session proof.
4. Gán metric pair cho từng thesis: `CTR/CVR`, `CPI/D1`, hoặc `D1/ARPDAU`.
5. Chọn thesis đáng test đầu tiên bằng tiêu chí: dễ sản xuất creative, dễ chứng minh trong level đầu, rủi ro kinh tế thấp nhất.
6. Viết readiness verdict cho thesis được chọn.
7. Viết post-test decision memo giả lập cho 2 trường hợp: creative yếu nhưng D1 ổn, và CVR/D1 cùng yếu.
8. Viết First-test thesis contract.

Pass lab khi bạn có thể nói: "Nếu test này fail, tôi biết sửa creative, store, onboarding hay thesis."

---

## Final UA Plan Update

Cập nhật trường **Target audience** trong Final UA Plan:

```text
Target audience:
- Segment:
- Motivation:
- Puzzle action verb:
- Ad promise:
- Store proof:
- First-session proof:
- Reference games:
- Initial market:
- Monetization fit:
- Stop-loss rule:
- First next action if weak:
- Thesis readiness verdict:
- Post-test decision memo:
- Do not change during first test:
- First-test thesis contract:
- Metric pair:
- Blocked conclusions:
- Owner/date:
```

Ghi chú: phần này sẽ được dùng lại ở lesson 3 để tách audience theo motivation và ở lesson 8 để đặt metric targets.

---

## Checklist Focus

- [ ] Thesis không dùng audience chung chung.
- [ ] Có đúng một motivation chính cho test đầu.
- [ ] Ad promise, store proof và first-session proof cùng nói một lời hứa.
- [ ] Có metric pair để chẩn đoán, không chỉ có CPI.
- [ ] Có stop-loss theo spend cap + quality floor.
- [ ] Có First-test thesis contract.
- [ ] Có frozen variables và blocked conclusions.
- [ ] Thesis phù hợp scope team Unity nhỏ, không dựa vào content/live ops quá nặng.

---

## Curated References

- [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Google Play - Candy Crush Saga](https://play.google.com/store/apps/details?id=com.king.candycrushsaga)
- [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games)
', now()),
  ('lessons/day-03.md', 'markdown', null, '---
day: 3
title: "Audience motivation map"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [Audience, Motivation, Hook]
artifact: "Audience motivation map"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Audience motivation map**: một bản đồ nối từng motivation của người chơi với ad hook, store proof, first-session proof và metric pattern tương ứng.

Quyết định cần học: chọn **2 motivation đáng test trước**, không viết audience bằng demographic chung chung.

Kết quả cần có:

- Một audience statement dựa trên hành vi và ngữ cảnh chơi.
- 2-3 motivation candidates có hook riêng.
- Proof chain cho từng motivation: `ad -> store -> first session`.
- Metric pattern để biết motivation nào đang fit hoặc mismatch.
- Cập nhật trường **Target audience** trong Final UA Plan.

---

## Why this matters

Ngân sách `$100-500` không đủ để "để thuật toán tự tìm audience". Nếu bạn nói "nam nữ 18-45 thích puzzle", thuật toán có thể tìm traffic rẻ, nhưng bạn không biết traffic đó muốn relax, muốn thử thách, muốn dọn sạch board hay muốn sưu tầm phần thưởng.

Audience trong UA không phải chỉ là người. Audience là **lý do người đó dừng lại, click, cài và chơi tiếp**.

Khi motivation mơ hồ, mọi thứ phía sau cũng mơ hồ:

- Creative không biết mở đầu bằng cảnh nào.
- Store screenshot không biết chứng minh lời hứa gì.
- Tutorial không biết phải tạo khoảnh khắc proof nào.
- Metric không biết gãy ở audience, hook, store hay product.

Motivation map biến audience thành một hệ thống có thể test.

---

## Core model: audience là motivation, không phải demographic

Demographic có thể hữu ích ở tầng media buying, nhưng chưa đủ cho product-UA decision. Với puzzle game, hai người cùng 30 tuổi có thể chơi vì hai lý do trái ngược: một người muốn thư giãn, một người muốn chứng minh mình giỏi.

Model vận hành:

`context -> motivation -> hook -> proof -> metric signal`

| Layer | Câu hỏi | Ví dụ tốt | Ví dụ yếu |
| --- | --- | --- | --- |
| Context | Người chơi ở tình huống nào? | nghỉ trưa, commute, trước khi ngủ | mọi lúc |
| Motivation | Họ muốn cảm giác gì? | calm focus, satisfying clear, mastery | giải trí |
| Hook | Ad nói gì trong 3 giây? | "clear chaos in one move" | "best puzzle game" |
| Proof | Game chứng minh ra sao? | clear moment trong level 1 | nhiều UI đẹp |
| Signal | Đọc số nào? | CTR/CVR/D1/level depth | chỉ CPI |

Nếu một motivation không thể tạo ra hook và proof cụ thể, nó chưa sẵn sàng để test.

---

## Motivation map mẫu cho puzzle game

```text
[VISUAL PLACEHOLDER: Third-party image request - Motivation map mẫu cho puzzle game]
Type: hero operating diagram.
Lesson section: Motivation map mẫu cho puzzle game.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Motivation | Player wants | Ad hook | Store proof | First-session proof | Metric pattern cần đọc |
| --- | --- | --- | --- | --- | --- |
| Relax | Nghỉ não, ít áp lực | "A calm 2-minute puzzle break" | Màu dễ đọc, board sạch, không drama | Level 1 dễ hiểu, thắng nhanh | D1, session count, tutorial complete |
| Satisfying clear | Dọn sạch, đã mắt | "Clear chaos in one smart move" | Before/after board rõ | Combo/clear trong 60-90 giây | CTR, CVR, level depth |
| Challenge | Tự hào vì giải được | "Only 1% solve this" | Puzzle khó nhìn có logic | Fail/retry công bằng | CTR, retry rate, D1 |
| Mastery | Tiến bộ qua từng level | "Find the perfect move" | Progression/level map | Difficulty curve nhẹ | Level depth, D3/D7 |
| Collection | Mở khóa, hoàn thiện | "Solve to decorate the room" | Room/collection preview | Meta reward xuất hiện sớm | Session length, ad engagement |

Chỉ chọn motivation mà prototype hiện tại có thể chứng minh. Nếu game chưa có meta room, đừng bán collection trong ad chỉ vì competitor làm vậy.

### Motivation selection contract

Khi chọn 2 motivation để test trước, hãy viết contract để team không biến test thành 5 giả thuyết chồng lên nhau. Contract nói rõ motivation nào được test, biến nào được giữ nguyên, và kết luận nào bị khóa.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Motivation selected | Đang test cảm giác nào? | `Satisfying clear` |
| Hook promise | 3 giây đầu hứa điều gì? | clear chaos in one smart move |
| Store proof locked | Screenshot/copy nào phải khớp promise? | before/after board clear |
| First-session proof locked | Level đầu phải giao khoảnh khắc nào? | one clear/combo within 90 seconds |
| Variable allowed to change | Test này được đổi gì? | opening crop/pacing only |
| Blocked conclusions | Report không được kết luận gì? | không kết luận collection/meta demand |
| Review metric pair | Metric nào đọc fit/mismatch? | CTR/CVR + tutorial_complete/D1 |

Mẫu contract:

```text
Motivation test contract
- Motivation:
- Hook promise:
- Store proof:
- First-session proof:
- Variables locked:
- Variable allowed to change:
- Review metric pair:
- Blocked conclusions:
```

Quy tắc: nếu một test thay cả motivation, hook, store proof và tutorial, bạn sẽ không biết audience nào đang phản hồi. Với budget nhỏ, khóa biến là cách mua clarity rẻ nhất.

---

## Hero visual: motivation-to-proof chain

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: motivation-to-proof chain]
Type: data visual/chart or decision board.
Lesson section: Hero visual: motivation-to-proof chain.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
MOTIVATION-TO-PROOF CHAIN

Candidate A: Satisfying clear        TEST FIRST
Context            Lunch break / commute, wants a quick visual payoff
Hook               "Clear chaos in one smart move"
Store proof         Screenshot 1 shows messy board -> clean board
First-session proof One clear/combo moment appears in level 1-3
Metric read         CTR + CVR test promise; tutorial_complete + D1 test proof

Candidate B: Relax                   TEST FIRST, softer creative angle
Context            Before sleep / short break, wants low-pressure focus
Hook               "A calm 2-minute puzzle break"
Store proof         Clean board, readable colors, no pressure timer in screenshots
First-session proof No forced ads/popups before first win; tutorial is quiet
Metric read         CVR + D1 + session_count, not CTR alone

Candidate C: Challenge               HOLD UNTIL BUILD PROVES IT
Context            Wants to feel clever and beat a hard board
Hook               "Only 1% solve this"
Store proof         Hard-looking board with real logic, not fake impossible layout
First-session proof Fail/retry loop feels fair within first 2 minutes
Metric read         High CTR is not enough; retry_rate + D1 must survive

Candidate D: Collection              DEFER
Context            Wants to unlock/decorate/complete a set
Hook               "Solve puzzles to decorate the room"
Store proof         Room/progression screenshot
First-session proof Meta reward appears early
Metric read         Session length + reward engagement, after feature exists
```

Doc diagram theo chieu ngang, khong doc tung o roi rac. Mot motivation chi dang dua vao test khi `context`, `hook`, `store proof`, `first-session proof` va `metric read` cung noi ve mot cam giac. Neu chi co hook manh nhung product proof chua co, do la curiosity trap, khong phai audience insight.

| Decision label | Khi dung | Hanh dong tiep theo |
| --- | --- | --- |
| `TEST FIRST` | Build hien tai chung minh duoc promise trong vai phut dau | Lam 2-3 creative cells cung motivation, chi doi opening/pacing |
| `TEST FIRST, softer creative angle` | Motivation it gay soc nhung proof chain sach | Dung creative ro, khong co bien thanh clickbait |
| `HOLD UNTIL BUILD PROVES IT` | Hook hap dan nhung onboarding/level chua giao duoc cam giac | Sua product proof truoc hoac viet hook trung thuc hon |
| `DEFER` | Feature/reward surface chua ton tai | Khong dua vao ad/store cho den khi build co bang chung |


**Inspect:** motivation nào có đủ proof ở cả store và level đầu.
**Conclude:** motivation đáng test trước là motivation có proof chain đầy đủ nhất, không phải motivation nghe hấp dẫn nhất.
**Do not infer:** không dùng diagram để kết luận audience thắng; diagram chỉ giúp chọn test có khả năng đọc được.

---

## Chart: motivation readiness score

:::chart
title: Motivation readiness for a small calming puzzle prototype
Relax|4|Prototype already supports low-pressure play
Satisfying clear|5|Clear visual payoff is easy to show
Challenge|2|Hard hook risks clickbait and churn
Mastery|3|Needs more level depth before strong claim
Collection|1|Meta scope is not built yet
:::

**Inspect:** `Satisfying clear` và `Relax` có readiness cao vì product proof đã có.
**Conclude:** hai motivation này nên vào first creative test; `Collection` nên để sau.
**Do not infer:** readiness không phải market size; nó chỉ là khả năng test rõ với bản build hiện tại.

---

## Hướng dẫn đọc số theo motivation

| Metric pattern | Cách đọc | Action đúng |
| --- | --- | --- |
| Relax hook: CTR vừa, CVR cao, D1 tốt | Hook không gây sốc nhưng promise khớp người chơi | Giữ direction, làm thêm biến thể nhẹ về pacing/visual |
| Challenge hook: CTR cao, CVR thấp, D1 thấp | Curiosity trap hoặc ad-store mismatch | Không scale; hoặc làm challenge thật hơn trong store/first session |
| Satisfying clear: CTR cao, CVR cao, level depth thấp | Người chơi thích nhìn nhưng gameplay thiếu chiều sâu | Cải thiện level pacing trước khi làm thêm ads |
| Mastery: CTR thấp, D1 tốt | Hook chưa truyền tải được cảm giác "giải được" | Làm creative show decision moment rõ hơn |
| Collection: CVR ổn, session thấp | Store hứa meta nhưng game chưa trả reward sớm | Đưa meta reward vào first session hoặc bỏ promise |

Quy tắc nhỏ: motivation fit phải được đọc qua ít nhất hai tầng. `CTR` chỉ nói ad có thu hút; `D1` và level depth mới nói gameplay có giao đúng cảm giác không.

Priority scoring trước khi chọn 2 motivation:

| Score lens | Câu hỏi | 1 điểm | 3 điểm | 5 điểm |
| --- | --- | --- | --- | --- |
| Proof availability | Build hiện tại chứng minh được promise trong 3 phút đầu không? | Chưa có feature/proof | Có proof nhưng hơi muộn | Proof xuất hiện trong level 1-3 |
| Creative clarity | Hook có thể hiểu trong 3 giây không? | Cần giải thích dài | Hiểu được nếu video rõ | Nhìn một frame đã hiểu payoff |
| Store match | Screenshot/title có chứng minh cùng promise không? | Store nói chuyện khác | Có ảnh liên quan nhưng chưa sắc | Screenshot 1-2 chứng minh trực tiếp |
| Metric readability | Nếu test fail, biết sửa tầng nào không? | Không biết do ad/store/product | Có thể đoán | Có pattern rõ cho creative/store/product |
| Scope discipline | Motivation có kéo thêm feature ngoài scope không? | Đòi feature mới lớn | Cần polish nhỏ | Dùng được build hiện tại |

Decision rule:

```text
Test first = high proof availability + high metric readability + low scope risk.
Hold = hook sounds strong but product/store proof is weak.
Defer = motivation requires a feature not yet in the build.
Reject for now = cannot write a clean metric pattern or proof chain.
```

Nếu hai motivation cùng hấp dẫn, chọn cái làm team học nhanh hơn, không phải cái nghe rộng thị trường hơn. Với micro-budget, một motivation hẹp nhưng proof chain sạch thường đáng test hơn một motivation lớn nhưng mơ hồ.

---

## Worked example: hai hook cho cùng một prototype

Prototype: block puzzle gỗ, level ngắn, có hiệu ứng clear đẹp, chưa có meta collection.

| Creative | Motivation | CTR | Store CVR | Tutorial complete | D1 | Diagnosis |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| A: "Only 1% solve this" | Challenge | 4.2% | 14% | 58% | 12% | Hook gây tò mò nhưng product không chứng minh challenge công bằng; mismatch |
| B: "Clear the board and relax" | Relax + satisfying | 2.4% | 34% | 87% | 31% | Hook ít giật hơn nhưng promise khớp store và first session |

Verdict: chọn B làm direction chính. Không kết luận A "xấu tuyệt đối"; A có thể dùng sau nếu build có level challenge rõ hơn và store proof trung thực hơn.

Tradeoff:

- A có thể hạ CPI ban đầu nếu CTR đủ cao, nhưng sẽ đốt ngân sách nếu CVR/D1 gãy.
- B có thể cần creative polish để tăng CTR, nhưng là learning path sạch hơn vì proof chain đang khớp.

Second-pass read:

| Question | Creative A | Creative B | Decision impact |
| --- | --- | --- | --- |
| Promise có được store proof xác nhận không? | Một hard puzzle screenshot có thể chứng minh, nhưng nếu layout fake thì nguy hiểm | Before/after clear dễ chứng minh bằng screenshot thật | B dễ làm store proof trung thực hơn |
| First session có giao cảm giác đó không? | Nếu level đầu không khó công bằng, hook challenge fail | Clear moment sớm đã có trong prototype | B phù hợp build hiện tại hơn |
| Nếu metric xấu, biết sửa gì không? | Khó biết do challenge fake, store mismatch hay product yếu | Có thể sửa opening nếu CTR thấp, sửa level pacing nếu D1 thấp | B cho learning path rõ hơn |
| Có kéo scope mới không? | Cần thiết kế challenge curve tốt hơn | Chủ yếu cần creative polish | B rẻ hơn cho tuần đầu |

Kết luận vận hành: chọn B không phải vì "relax luôn tốt hơn challenge". Chọn B vì trong bản build hiện tại, B có proof chain sạch hơn và ít làm team học sai hơn. A nên được ghi vào backlog với điều kiện: chỉ test lại khi level đầu có fail/retry công bằng và store proof không dùng puzzle fake.

### Post-test motivation memo

Sau test, đừng chỉ viết "Creative B thắng". Hãy viết memo nói rõ motivation nào giữ, motivation nào hold, và điều gì vẫn chưa được chứng minh.

```text
Post-test motivation memo
- Tested motivations: Challenge vs Relax + satisfying clear.
- Strongest useful signal: Relax/satisfying has better CVR, tutorial_complete and D1.
- Weakest signal: Challenge wins CTR but fails store/product proof.
- Primary decision: keep Relax/satisfying as first audience direction.
- Hold condition for Challenge: retest only after fair fail/retry proof exists in level 1-3.
- Variables to keep unchanged next test: store proof, first-session proof, country/source.
- Next variable to change: first 2 seconds of Relax/satisfying creative to improve CTR.
- Blocked conclusion: do not claim challenge audience does not exist; current build cannot prove it cleanly.
```

Decision ladder:

| Pattern | Motivation verdict | Next action |
| --- | --- | --- |
| CTR low, CVR/D1 healthy | motivation fit possible, communication weak | improve hook opening |
| CTR high, CVR/D1 weak | curiosity or proof mismatch | hold or rewrite promise |
| CVR high, tutorial weak | store promise works, first-session proof weak | fix onboarding/level proof |
| D1 strong, ARPDAU weak | motivation holds attention, economy path unclear | keep motivation, test monetization later |
| all layers weak across clean test | motivation likely weak for this build | pause motivation and write replacement hypothesis |

Memo tốt bảo vệ team khỏi hai sai lầm: scale hook có CTR cao nhưng traffic yếu, hoặc bỏ motivation có CTR vừa nhưng người chơi fit hơn.

### Motivation evidence ledger

Sau khi test, ghi ledger để tách **signal đã dùng**, **signal bị bỏ qua**, và **điều chưa được chứng minh** cho từng motivation. Ledger này đặc biệt hữu ích khi một motivation thắng `CTR` nhưng thua `CVR/D1`.

| Ledger field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Motivation verdict | Giữ, revise, hold hay pause? | keep Relax/satisfying, hold Challenge |
| Evidence used | Metric nào thật sự dùng để ra verdict? | CVR, tutorial_complete, D1 direction |
| Evidence discounted | Metric nào hấp dẫn nhưng chưa đủ quyền? | CTR cao của Challenge vì downstream yếu |
| Proof gap | Ad/store/first-session gãy ở đâu? | Challenge chưa có fair fail/retry proof |
| Next variable | Lần tới chỉ đổi gì? | first 2 seconds của Relax creative |
| Frozen variables | Cái gì giữ nguyên để retest sạch? | store proof, country/source, first-session proof |
| Blocked conclusions | Không được kết luận gì? | Challenge audience không tồn tại |

```text
Motivation evidence ledger
- Motivation:
- Verdict:
- Evidence used:
- Evidence discounted:
- Proof gap:
- Next variable:
- Frozen variables:
- Blocked conclusions:
```

Ledger tốt giúp team nói "motivation này chưa chứng minh được" thay vì "audience này không có". Với game nhỏ, cách nói đó giữ learning chính xác hơn rất nhiều.

---

## First-session proof và Unity event checklist

Motivation map phải nối xuống event tối thiểu trong Unity. Không cần over-log, nhưng cần đủ để biết promise có được giao không.

| Promise | First-session proof | Event gợi ý |
| --- | --- | --- |
| Calm brain break | Người chơi hiểu luật nhanh và thắng level đầu | `tutorial_start`, `tutorial_complete`, `level_complete` |
| Satisfying clear | Có clear/combo moment sớm | `first_clear`, `combo_triggered`, `level_complete` |
| Challenge | Có fail/retry công bằng | `level_fail`, `retry_clicked`, `hint_used` |
| Collection | Reward/meta xuất hiện sớm | `reward_preview_seen`, `item_unlocked` |

Quality check:

- Event name dùng snake_case.
- Event gắn với quyết định UA, không log mọi click.
- Mỗi event có owner trong code và nơi xem trong dashboard.
- Không để UI flow gọi trực tiếp logic UA; event analytics nên là lớp quan sát tách rời.

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play - Monopoly GO!](https://play.google.com/store/apps/details?id=com.scopely.monopolygo) | Store public thể hiện board, dice, city/landmark progression và event/reward surfaces. | Audience không chỉ là "board game players"; motivation có thể là completion, progression, social/light competition. | Không copy IP, live ops complexity hoặc UA scale của một sản phẩm lớn cho puzzle prototype nhỏ. |
| [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Listing thể hiện action verb cụ thể: screw/sort/unscrew, không chỉ nói "puzzle". | Với puzzle nhỏ, action verb giúp creative và store proof rõ hơn demographic. | Không suy ra mọi sort puzzle dùng chung audience; motivation có thể là organize, untangle hoặc satisfying clear. |
| [Google Play preview assets guidance](https://support.google.com/googleplay/android-developer/answer/9866151) | Store assets là bề mặt chính để mô tả app/game trước install. | Store proof phải khớp motivation đã hứa trong ad. | Không nhồi mọi motivation lên screenshot đầu; mỗi test cần một promise rõ. |

Screenshot/usecase readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Store screenshot đang nhấn vào action verb, reward hay progression? | Từ đó suy ra motivation mà listing đang cố chứng minh. | Không dùng listing public để suy ra metric nội bộ như CPI/D1. |

---

## Common mistakes

- **Mistake - Correction:** Dùng demographic làm audience chính.
  **Correction:** Bắt đầu từ motivation và ngữ cảnh chơi, rồi mới thêm demographic nếu cần cho media buying.

- **Mistake - Correction:** Một creative hứa cả relax, challenge và collection.
  **Correction:** Một ad chỉ test một motivation chính. Muốn test nhiều motivation thì tạo nhiều creative cells.

- **Mistake - Correction:** Thấy CTR cao là kết luận audience fit.
  **Correction:** CTR phải được đọc cùng `Store CVR`, `tutorial complete`, `D1` và level depth.

- **Mistake - Correction:** Hứa motivation mà product chưa có proof.
  **Correction:** Nếu game chưa có meta, đừng bán collection. Nếu level đầu quá dễ, đừng bán "only 1%".

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong khóa học |
| --- | --- |
| Audience | Nhóm người chơi được định nghĩa bằng motivation, behavior và context |
| Motivation | Lý do cảm xúc/hành vi khiến player click, install và chơi tiếp |
| Hook | Lời hứa ngắn trong creative để kéo sự chú ý |
| Store proof | Bằng chứng trên store rằng hook không nói suông |
| First-session proof | Bằng chứng trong vài phút đầu rằng game giao đúng promise |
| IPM | Installs per Mille, install trên 1000 impressions |

---

## Lab output example

```text
Audience Motivation Map - v1

Primary motivation: Satisfying clear
Audience statement: players who want a short, low-pressure puzzle with an obvious visual payoff
Context: commute break, lunch break, before sleep
Ad hook: clear chaos in one smart move
Store proof: first screenshot shows messy board -> clean board
First-session proof: level 1-3 produces one satisfying clear within 90 seconds
Metric read:
- If CTR low but D1 high: improve creative opening
- If CTR high but CVR low: repair store proof
- If CVR high but D1 low: repair onboarding/level pacing
Secondary motivation: Relax
Not testing yet: Collection, because prototype has no meta reward

Motivation test contract:
- Variables locked:
- Variable allowed to change:
- Review metric pair:
- Blocked conclusions:

Post-test memo:
- Motivation verdict:
- What to keep:
- What to change next:
- What remains unproven:

Motivation evidence ledger:
- Evidence used:
- Evidence discounted:
- Proof gap:
- Frozen variables:
- Blocked conclusions:
```

---

## Practical Lab

1. Viết 5 motivation candidates cho game của bạn.
2. Loại bỏ motivation nào chưa có proof trong build hiện tại.
3. Chọn 2 motivation còn lại và viết hook riêng cho mỗi motivation.
4. Với mỗi hook, ghi screenshot/store proof cần có và event first-session cần đo.
5. Viết metric pattern cho 3 tình huống: creative weak, store mismatch, product mismatch.
6. Viết motivation test contract cho motivation chính.
7. Viết post-test memo giả lập cho trường hợp CTR cao nhưng CVR/D1 yếu.
8. Viết Motivation evidence ledger cho motivation chính.

Pass lab khi bạn có thể đưa motivation map cho một teammate và họ biết nên làm video nào, screenshot nào, level proof nào.

---

## Final UA Plan Update

Cập nhật trường **Target audience**:

```text
Primary motivation:
Audience statement:
Player context:
Main hook:
Store proof:
First-session proof:
Metric pattern for fit:
Metric pattern for mismatch:
Secondary motivation to test later:
Motivation intentionally excluded:
Motivation test contract:
Variables locked:
Blocked conclusions:
Post-test motivation memo:
Motivation evidence ledger:
Evidence used:
Evidence discounted:
Frozen variables:
```

Liên kết với Day 2: phần này phải khớp với Puzzle market thesis. Nếu Day 2 nói "calm brain break" nhưng Day 3 lại chọn "hard challenge", bạn cần ghi rõ lý do đổi thesis.

---

## Checklist Focus

- [ ] Audience statement không dùng demographic chung chung.
- [ ] Có 2 motivation đáng test, không quá 3.
- [ ] Mỗi motivation có hook, store proof và first-session proof riêng.
- [ ] Metric pattern đọc được fit/mismatch.
- [ ] Event first-session đủ để đo proof nhưng không over-log.
- [ ] Có Motivation evidence ledger.
- [ ] Evidence discounted và blocked conclusions được ghi rõ.
- [ ] Final UA Plan có motivation bị loại trừ để tránh scope creep.

---

## Curated References

- [Google Play - Monopoly GO!](https://play.google.com/store/apps/details?id=com.scopely.monopolygo)
- [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
- [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151)
', now()),
  ('lessons/day-04.md', 'markdown', null, '---
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
', now()),
  ('lessons/day-05.md', 'markdown', null, '---
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
', now()),
  ('lessons/day-06.md', 'markdown', null, '---
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
[VISUAL PLACEHOLDER: Third-party image request - UA selection decision tree]
Type: hero operating diagram.
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
[VISUAL PLACEHOLDER: Third-party image request - UA selection data visual comparison]
Type: data visual/chart.
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
', now()),
  ('lessons/day-07.md', 'markdown', null, '---
day: 7
title: "Week 1 synthesis: first UA hypothesis"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, Soft launch]
artifact: "First UA hypothesis card"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **First UA hypothesis card**: một thẻ giả thuyết đủ cụ thể để chạy vòng test UA nhỏ đầu tiên mà không bị biến thành “bắn quảng cáo rồi cầu may”.

Quyết định cần ra sau bài:

- Chọn **một** player motivation chính để test trước.
- Viết rõ chuỗi `ad promise -> store proof -> first-session proof -> metric pattern -> next action`.
- Định nghĩa budget scope, metric signal và action rule cho vòng test `$100-500`.
- Cập nhật trường **hypothesis** trong Final UA Plan để Week 2 có thể đo đúng thứ cần đo.

Thẻ này không nhằm dự đoán game chắc thắng. Nó nhằm ép team nói rõ: “Chúng ta đang kiểm chứng điều gì, bằng tín hiệu nào, và nếu tín hiệu lệch thì sửa phần nào trước?”

---

## Why this matters

Sau 6 bài đầu, bạn đã có các mảnh riêng: UA loop, funnel leak, player motivation, store proof, budget và channel. Nhưng khi chuẩn bị chạy test thật, nhiều team indie lại gom các mảnh đó thành một câu rất mơ hồ:

> “Game puzzle casual của mình sẽ chạy Meta/TikTok để tìm user rẻ.”

Câu này nghe hợp lý nhưng không giúp ra quyết định. Nếu `CPI` rẻ nhưng `D1` thấp, bạn sửa creative, store, tutorial hay level pacing? Nếu `CTR` cao nhưng store `CVR` thấp, bạn scale tiếp vì ad tốt hay dừng để sửa listing? Với budget nhỏ, một lần đọc sai có thể tiêu hết tiền trước khi học được điều quan trọng.

Lesson này biến Week 1 thành một **operating contract**. Trước khi chi tiền, team phải ghi rõ giả thuyết, bằng chứng mong đợi, guardrail metric và hành động tiếp theo. Làm vậy giúp bạn không tranh luận bằng cảm giác sau khi data về.

---

## Core model: Hypothesis = promise chain + action rule

Một giả thuyết UA tốt không phải là “tôi nghĩ game sẽ có người chơi”. Nó là một chuỗi kiểm chứng:

**Player motivation** -> **Ad promise** -> **Store proof** -> **First-session proof** -> **Metric pattern** -> **Next action**

Đọc theo logic vận hành:

1. **Player motivation**: Người chơi tìm cảm giác gì? Nghỉ não, dọn dẹp thỏa mãn, thử thách trí tuệ, sưu tầm, hay tiến triển?
2. **Ad promise**: Video/hook hứa đúng cảm giác đó bằng một hành động nhìn thấy được chưa?
3. **Store proof**: Icon, screenshot đầu, short description có chứng minh cùng lời hứa không?
4. **First-session proof**: 3-5 phút đầu trong game có giao ngay cảm giác mà ad/store đã hứa không?
5. **Metric pattern**: Tín hiệu nào cho biết mắt xích nào đang lệch?
6. **Next action**: Nếu lệch, team sửa creative, store, onboarding, level pacing hay dừng test?

Nếu thiếu action rule, hypothesis chỉ là idea. Nếu thiếu store proof hoặc first-session proof, hypothesis dễ tạo click nhưng không tạo learning.

---

## Khung First UA hypothesis card mẫu

Điền card theo 8 dòng. Dòng nào chưa điền được nghĩa là test chưa sẵn sàng.

| Field | Câu hỏi phải trả lời | Ví dụ cho mobile puzzle |
| :--- | :--- | :--- |
| **1. Player motivation** | Người chơi đến vì cảm giác nào, không phải chỉ vì genre nào? | Người chơi casual muốn một phiên “dọn não” 2 phút sau giờ làm. |
| **2. Ad promise** | 3 giây đầu của ad hứa hành động/cảm giác gì? | “Clear a messy board in three satisfying moves.” |
| **3. Store proof** | Screenshot/title nào chứng minh ad không nói quá? | Screenshot đầu là before/after board sạch, không phải menu/meta. |
| **4. First-session proof** | Người chơi nhận được lời hứa ở đâu trong 3-5 phút đầu? | Level 1-3 cho combo dễ, board clear nhanh, không tutorial dài. |
| **5. Channel/budget scope** | Test ở đâu, chi bao nhiêu, trong bao lâu, và không test gì? | Android, một social channel, `$300`, 3-5 ngày, không test monetization. |
| **6. Primary signal** | Metric nào trả lời câu hỏi chính? | `CTR` cho ad promise hoặc `store CVR` cho store proof. |
| **7. Guardrail signal** | Metric nào ngăn team đọc sai? | `tutorial_complete`, `D1`, hoặc early level completion. |
| **8. Action rules** | Nếu good/weak/mixed thì làm gì? | Good: rerun variant. Weak CVR: sửa store. Weak D1: sửa first session. |

Một card mạnh nên có phạm vi hẹp. Ví dụ “test Satisfying Clear cho Android puzzle trong 3 ngày” tốt hơn “test nhiều audience cho game puzzle”.

### Hypothesis decision contract

Hypothesis card không chỉ ghi thứ sẽ test. Nó phải ghi rõ **quyết định nào được phép ra** sau test nhỏ, và **quyết định nào bị cấm** vì data chưa đủ. Đây là cách bảo vệ team khỏi over-read một sample `$100-500`.

| Card field | Decision được phép | Decision bị cấm | Evidence cần có |
| :--- | :--- | :--- | :--- |
| Player motivation | Chọn một motivation để làm hook chính cho vòng kế tiếp | Kết luận đây là audience tốt/xấu vĩnh viễn | Motivation viết bằng tình huống chơi, không phải demographic |
| Ad promise | Sửa hoặc giữ 3 giây đầu creative | Scale channel chỉ vì `CTR` cao | Creative có một promise nhìn thấy được, không trộn 3 promise |
| Store proof | Sửa screenshot/title/copy nếu `CVR` yếu | Đổ lỗi product khi store chưa chứng minh promise | Screenshot đầu và short description lặp lại cùng promise |
| First-session proof | Sửa tutorial/level pacing nếu D1/complete yếu | Kết luận motivation sai khi first session chưa deliver promise | Event/flow chứng minh payoff trong 3-5 phút đầu |
| Primary signal | Chọn next action cho mắt xích chính | Gọi winner/loser nếu guardrail contradict | Metric gắn đúng câu hỏi học hỏi |
| Guardrail signal | Chặn quyết định sai khi primary đẹp nhưng retention/product yếu | Bỏ qua guardrail để scale vì CPI rẻ | Event đã QA hoặc ít nhất có nguồn đo đáng tin |
| Stop-loss rule | Dừng chi để diagnose đúng stage | Tiếp tục mua traffic vì "đã setup rồi" | Daily cap, pause condition và owner rõ |

Một hypothesis chưa có blocked decisions vẫn còn quá rộng. Câu tốt nên có dạng: "Sau test này, chúng ta được phép quyết định sửa ad/store/onboarding cho promise X, nhưng chưa được phép kết luận LTV, monetization hoặc broad market fit."

---

## Sơ đồ vận hành hypothesis chain

```text
[VISUAL PLACEHOLDER: Third-party image request - UA hypothesis chain decision diagram]
Type: hero operating diagram.
Lesson section: Sơ đồ vận hành hypothesis chain.
Previous local asset to replace: content/assets/usecases/day-07-hero-diagram.png.
Visual brief: UA hypothesis chain decision diagram.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Nhìn chuỗi từ trái sang phải: player motivation tạo ad promise, ad promise cần store proof, store proof phải được first-session proof xác nhận, rồi metric pattern mới dẫn tới next action.
>
> **Conclude**: Nếu một mắt xích yếu, đừng nhảy ngay sang kênh khác. Hãy sửa đúng mắt xích đang làm đứt chuỗi học hỏi.
>
> **Do not infer**: Sơ đồ không nói channel nào luôn tốt nhất hoặc metric nào là benchmark cố định. Nó chỉ dạy thứ tự chẩn đoán để micro-budget không bị tiêu vào quyết định sai.

---

## Bảng confidence cho 4 candidate hypotheses

Đây là bảng mẫu để chọn hypothesis đầu tiên. Điểm confidence là **scenario-specific**, chỉ dùng để ưu tiên trong một game puzzle nhỏ có asset còn hạn chế.

| Candidate hypothesis | Player motivation | Asset readiness | Measurement clarity | Confidence | Rủi ro chính |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Satisfying Clear** | Dọn dẹp, clear board, nhìn kết quả ngay | Cao | Cao | **5/5** | Ad đẹp hơn gameplay thật, làm `D1` yếu. |
| **Calming Relax** | Nghỉ não, không áp lực, chơi ngắn | Cao | Trung bình | **4/5** | Dễ hứa “relax” nhưng first session lại có popup/ad quá sớm. |
| **Brain Challenge** | Thử thách, cảm giác thông minh | Trung bình | Trung bình | **3/5** | Người chơi click vì challenge nhưng churn nếu level đầu quá khó. |
| **Mystery/Drama Rescue** | Cứu nhân vật, tò mò tình huống | Thấp | Thấp | **2/5** | Click cao nhưng intent lệch nếu game thật không có rescue loop. |

:::chart
title: Candidate hypothesis confidence, 1-5
Satisfying Clear|5|Best fit when gameplay has visible clear/combo moments
Calming Relax|4|Good if store and first session avoid pressure signals
Brain Challenge|3|Needs careful early difficulty guardrail
Mystery Rescue|2|High mismatch risk for a small puzzle prototype
:::

**Inspect**: Candidate có confidence cao thường là candidate có asset dễ làm, metric dễ đọc và risk mismatch thấp.

**Conclude**: Với vòng test đầu, chọn hypothesis giúp team học nhanh nhất, không nhất thiết là ý tưởng “ngầu” nhất.

**Do not infer**: Điểm trên không phải chuẩn thị trường. Nếu game của bạn có rescue mechanic thật, Mystery/Drama có thể tăng điểm. Nếu game không có combo rõ, Satisfying Clear có thể giảm điểm.

---

## Hướng dẫn đọc số

Đừng đọc từng metric riêng lẻ. Hãy đọc theo cặp để biết mắt xích nào đang hỏng.

| Pattern trong test nhỏ | Cách đọc đúng | Next action | Không nên làm |
| :--- | :--- | :--- | :--- |
| `CTR` ổn, `store CVR` yếu | Ad promise có thể kéo tò mò, nhưng store proof không củng cố lời hứa. | Giữ creative, sửa screenshot đầu, short description, feature graphic. | Đổi target audience ngay. |
| `store CVR` ổn, `tutorial_complete`/`D1` yếu | Store bán đúng lời hứa, nhưng first session chưa giao được lời hứa đó. | Sửa onboarding, level 1-5, tutorial length, early fail state. | Scale vì CPI nhìn rẻ. |
| `CTR` yếu, `D1` của user đã vào game ổn | Product có thể ổn, nhưng ad không truyền được motivation. | Làm lại 3 giây đầu, visual hook, claim cụ thể hơn. | Sửa gameplay trước khi sửa creative. |
| `CPI` rẻ, retention yếu | Traffic rẻ có thể là low-intent hoặc promise mismatch. | Kiểm tra chain ad/store/first session trước khi tăng daily cap. | Kết luận “game có UA tốt” chỉ vì install rẻ. |
| Sample quá nhỏ, signal lẫn lộn | Chưa đủ learning để kết luận mạnh. | Ghi “inconclusive”, giữ phạm vi hẹp, rerun cùng hypothesis nếu vẫn quan trọng. | Tạo 5 biến thể mới và làm nhiễu test. |

Decision ranges nên được ghi dưới dạng **ngưỡng vận hành cho sprint này**, không phải benchmark vĩnh viễn. Ví dụ: “Nếu `store CVR` thấp hơn vùng kỳ vọng của sprint này và `CTR` vẫn ổn, chúng ta sửa store trước.” Cách viết này tốt hơn “CVR phải luôn trên X%”.

---

## Worked example: Calming Block Puzzle hypothesis

Giả sử team có một prototype block puzzle nhẹ, Android-first, budget còn `$300`. Team chọn hypothesis:

```text
Player motivation:
Người chơi casual cần một phiên nghỉ não 2 phút, không áp lực thời gian.

Ad promise:
Video 10 giây cho thấy board lộn xộn được clear thành sạch, âm thanh nhẹ, không countdown.

Store proof:
Screenshot đầu là before/after board clear, headline "Relaxing block puzzle, no timer pressure".

First-session proof:
Level 1-3 cho clear/combo dễ trong 60 giây đầu, không interstitial trước khi hoàn thành level 3.

Channel/budget:
Android social test, $300 cap, 3-5 ngày, chỉ test một promise.

Primary signal:
CTR và store CVR để kiểm tra ad -> store continuity.

Guardrail:
tutorial_complete, level_3_complete, D1.

Action rules:
Weak CTR -> remake hook.
Good CTR + weak CVR -> fix store assets.
Good CVR + weak D1 -> fix first-session pacing.
```

Kết quả sau khi tiêu `$220`:

| Signal | Quan sát | Cách đọc |
| :--- | :--- | :--- |
| `CTR` | 2.4% | Hook có khả năng chạm đúng motivation nghỉ não trong sample này. |
| `store CVR` | 16% | Store proof yếu so với lời hứa của ad trong sprint này. |
| `tutorial_complete` | 72% | Người đã vào game không bị tutorial chặn quá nặng. |
| `D1` | 28% | Chưa đủ mạnh để scale, nhưng không phải điểm gãy đầu tiên. |

**Diagnosis**: Mắt xích yếu nhất là `store proof`, không phải gameplay. Nếu team sửa game ngay, họ có thể bỏ qua vấn đề thật: store page chưa chứng minh lời hứa “calm/no pressure”.

**Tradeoff**: Dừng ad sớm có vẻ tiếc vì `CTR` đang ổn, nhưng tiếp tục chi sẽ mua thêm click đi qua một store page chưa thuyết phục. Với `$80` còn lại, hành động tốt hơn là thay screenshot đầu và short description, rồi retest cùng creative để isolate store change.

**Next action**:

1. Pause campaign.
2. Thay screenshot đầu bằng before/after board clear.
3. Đổi short description sang một promise cụ thể: “No timer, quick relaxing boards.”
4. Rerun cùng ad hook bằng phần budget còn lại.
5. Không sửa level pacing cho đến khi store proof được kiểm lại.

### First readout memo

Sau khi tiêu một phần budget đầu tiên, đừng chỉ gửi bảng metric. Viết memo 8-10 dòng để khóa cách đọc trước khi team tranh luận.

```text
First UA hypothesis readout - Calming Block Puzzle

Hypothesis tested:
Casual players want a calm 2-minute clear-board session.

Budget spent:
$220 of $300, Android social, one promise, no monetization test.

Observed pattern:
- CTR healthy for this sprint.
- Store CVR weak relative to the ad promise.
- Tutorial completion acceptable.
- D1 directional but not a scale signal yet.

Decision allowed:
Repair store proof and rerun the same ad hook with remaining budget.

Decision blocked:
- Do not scale because CPI looks cheap.
- Do not rewrite core gameplay yet.
- Do not conclude calm motivation is bad until store proof is retested.

Next action owner:
Store owner replaces screenshot 1 and short description; UA owner reruns same creative.
```

Readout memo tốt phải có ba dòng bắt buộc: **observed pattern**, **decision allowed**, **decision blocked**. Nếu thiếu dòng blocked, team rất dễ dùng số nhỏ để kể câu chuyện quá lớn.

---

## Quality chain verification checklist

Trước khi chạy test, kiểm thẻ hypothesis bằng checklist này.

| Check | Câu hỏi kiểm tra | Pass khi |
| :--- | :--- | :--- |
| **Motivation clarity** | Player được định nghĩa bằng motivation hay bằng demographic chung chung? | Có cụm như “muốn nghỉ não”, “thích clear board”, “thích thử thách ngắn”. |
| **Promise visibility** | Ad promise có thể nhìn thấy trong 3 giây đầu không? | Một người ngoài team xem frame đầu vẫn hiểu hook. |
| **Store continuity** | Screenshot/title có lặp lại đúng lời hứa của ad không? | Store không chuyển sang nói feature/meta khác. |
| **First-session proof** | Game giao lời hứa trong 3-5 phút đầu không? | Có event/flow đo được: `tutorial_complete`, `level_3_complete`, `first_combo`. |
| **Measurement readiness** | Primary signal và guardrail đã gắn với event/metric thật chưa? | Không có metric “cảm giác tốt”; tất cả có nguồn đo. |
| **Action rule** | Team biết sửa gì nếu từng signal yếu chưa? | Mỗi failure pattern có một owner và một next action. |
| **Stop-loss** | Biết khi nào không chi tiếp không? | Có daily cap và ngưỡng “pause to diagnose”. |

Nếu một check chưa pass, đừng mở rộng test. Thu hẹp hypothesis trước.

---

## Real usecases đã đối chiếu nguồn

### Internal case: Puzzle soft-launch cheap installs, weak D1

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case data nội bộ: `CPI $0.42`, `CTR 1.8%`, `store CVR 32%`, `tutorial_complete 54%`, `D1 22%`, `D7 4%`. | Store đang chuyển đổi khá tốt, nhưng first session không giao đủ promise để giữ người chơi. Hypothesis card cần action rule cho onboarding/level pacing. | Không kết luận channel tốt chỉ vì CPI rẻ. Cũng không kết luận creative vô dụng khi store CVR vẫn ổn. |

### Public case: Royal Match as promise continuity caution

```text
[VISUAL PLACEHOLDER: Third-party image request - Royal Match public Google Play screenshot]
Type: public screenshot/source visual.
Lesson section: Public case: Royal Match as promise continuity caution.
Previous local asset to replace: content/assets/usecases/royal-match.png.
Visual brief: Royal Match public Google Play screenshot.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Screenshot/market-facing surface của Royal Match tập trung vào nhân vật King Robert, puzzle board, và cảm giác match-3 rõ ràng. Bài phân tích của Deconstructor of Fun cũng nhấn mạnh tốc độ, độ mượt, power-up và cảm giác agency trong core gameplay.
>
> **Conclude**: Khi ad/store/gameplay cùng củng cố một promise, funnel dễ được đọc hơn: người chơi click vì điều gì, store xác nhận điều gì, first session giao điều gì.
>
> **Do not infer**: Không copy “cứu vua”, layout store, ngân sách UA hay kỳ vọng scale của Royal Match. Với indie team, bài học là **continuity of promise**, không phải bắt chước execution của studio lớn.

| Source signal | Cách dùng trong lesson này | Không được suy ra |
| :--- | :--- | :--- |
| Deconstructor of Fun phân tích Royal Match như một puzzle game có cảm giác chơi nhanh, mượt, power-up generous và agency cao. | Nếu hypothesis của bạn hứa “satisfying/clear/control”, first session phải giao cảm giác đó thật, không chỉ nói trên ad. | Không dùng Royal Match làm benchmark KPI cho game nhỏ. |
| Google Play có Store Listing Experiments để A/B test graphics và localized text nhằm cải thiện installs/retention direction. | Nếu `CTR` ổn nhưng `store CVR` yếu, store asset test là action hợp lý trước khi đổ lỗi cho channel. | Không hiểu A/B test store là cách sửa retention nếu first session thật sự yếu. |

---

## Common mistakes

**Mistake 1 - “Everyone who likes puzzle” là audience.**

**Correction**: Viết motivation cụ thể: “người muốn nghỉ não 2 phút”, “người thích dọn board sạch”, “người thích thử thách logic ngắn”.

**Mistake 2 - Chỉ ghi target metric, không ghi action rule.**

**Correction**: Mỗi metric yếu phải dẫn tới một hành động. `CTR` yếu -> sửa hook. `store CVR` yếu -> sửa listing. `D1` yếu -> sửa first session.

**Mistake 3 - Test 4 promises trong một budget nhỏ.**

**Correction**: Với `$100-500`, ưu tiên một promise chính và tối đa một biến thể gần. Nhiều promise làm data khó đọc hơn, không “an toàn” hơn.

**Mistake 4 - Thấy CPI rẻ rồi scale.**

**Correction**: CPI rẻ chỉ nói bạn mua install rẻ trong điều kiện hiện tại. Nếu `tutorial_complete`, `D1`, hoặc `level_3_complete` yếu, scale chỉ phóng to vấn đề.

**Mistake 5 - Dùng benchmark như luật cứng.**

**Correction**: Ghi decision ranges cho sprint cụ thể. Một con số chỉ có nghĩa khi gắn với game, channel, creative, country, build size và sample.

---

## English Terms You Should Keep

- **UA hypothesis**: Giả thuyết user acquisition cần kiểm chứng bằng traffic thật.
- **Ad promise**: Lời hứa mà creative tạo ra cho người xem.
- **Store proof**: Bằng chứng trên store page cho thấy lời hứa của ad là thật.
- **First-session proof**: Bằng chứng trong 3-5 phút đầu rằng game giao đúng promise.
- **Primary signal**: Metric chính để trả lời câu hỏi test.
- **Guardrail metric**: Metric phụ giúp tránh đọc sai primary signal.
- **Decision range**: Khoảng vận hành dùng để ra quyết định trong sprint, không phải benchmark cố định.
- **Stop-loss rule**: Quy tắc dừng chi để bảo vệ budget khi signal đủ xấu.

---

## Lab output example

```text
FIRST UA HYPOTHESIS CARD

Game:
Calming Block Puzzle, Android prototype.

Player motivation:
Casual player wants a calm 2-minute brain break after work.

Ad promise:
"Clear a messy wooden board in three satisfying moves."

Store proof:
First screenshot shows before/after board clear. Short description says "No timer, quick relaxing boards."

First-session proof:
Player can clear level 1 within 45 seconds and trigger one satisfying combo before any monetization prompt.

Channel/budget scope:
Android social test, $300 total, $25/day cap, 3-5 days, one promise only.

Primary signal:
CTR and store CVR for ad -> store continuity.

Guardrail:
tutorial_complete, level_3_complete, D1.

Action rules:
- Weak CTR: remake first 3 seconds of video.
- Good CTR + weak store CVR: replace first screenshot and short description.
- Good store CVR + weak D1: shorten tutorial and rebalance level 1-3.
- Cheap CPI + weak D1: do not scale; diagnose promise mismatch.
- Inconclusive sample: rerun same hypothesis or narrow country/budget, do not add five new ideas.

Decision contract:
- Allowed decision: choose whether the first repair should be creative, store, or first-session pacing.
- Blocked decision: do not conclude channel scalability, LTV, monetization strength, or broad market fit.
- Stop-loss: pause after $300 or earlier if CTR/CVR/D1 pattern clearly points to one broken stage.

Readout memo:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next action owner:
```

Một lab output đạt chuẩn phải cho người khác trong team đọc và biết ngay test đang hỏi gì, đo gì, và sửa gì.

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn **một** motivation chính từ Week 1.
2. Viết ad promise bằng một hành động nhìn thấy được trong 3 giây đầu.
3. Ghi store proof: screenshot, icon, title hoặc short description nào chứng minh promise đó.
4. Ghi first-session proof: level/event/flow nào giao promise trong 3-5 phút đầu.
5. Chọn primary signal và guardrail metric.
6. Viết 3 action rules: weak ad, weak store, weak first session.
7. Ghi rõ điều **không test** trong sprint này.
8. Viết 2 quyết định được phép ra sau test và 3 quyết định bị cấm vì sample nhỏ.
9. Chuẩn bị readout memo mẫu gồm observed pattern, decision allowed, decision blocked và owner.

Quality chain check trước khi nộp:

- Nếu bỏ tên game đi, card vẫn nói rõ người chơi muốn cảm giác gì không?
- Nếu nhìn ad mà không đọc caption, promise có hiểu được không?
- Nếu nhìn screenshot đầu, người chơi có thấy cùng promise không?
- Nếu chơi 3 phút đầu, người chơi có nhận được promise không?
- Nếu một metric yếu, team có biết sửa asset/flow nào không?

---

## Final UA Plan Update

Cập nhật trường **hypothesis** trong Final UA Plan bằng mẫu này:

```text
Hypothesis:
We believe [player motivation] will respond to [ad promise] because [store proof] and [first-session proof] can make the promise believable.

Test scope:
[Platform/country/channel], [budget cap], [duration], [what we are not testing].

Primary signal:
[Metric + why it answers the test question].

Guardrail:
[Metric/event that prevents a false read].

Allowed decision:
[What this test can decide after the first readout].

Blocked conclusions:
[What this test cannot prove yet].

Stop-loss:
[Spend cap, pause condition, owner].

Action rules:
- If ad signal is weak: [creative action].
- If store signal is weak: [store action].
- If first-session signal is weak: [product/onboarding action].
- If signal is mixed or sample is too small: [rerun/narrow/inconclusive rule].

Readout memo format:
- Observed pattern:
- Decision allowed:
- Decision blocked:
- Next action owner:
```

Plan field được cập nhật: **hypothesis**. Các bài Week 2 sẽ dùng field này để xây metric map, event taxonomy và test readout.

---

## Checklist Focus

- [ ] Hypothesis card có đủ player motivation, ad promise, store proof và first-session proof.
- [ ] Test scope có budget cap, duration và điều không test.
- [ ] Primary signal và guardrail metric đã gắn với câu hỏi học hỏi.
- [ ] Action rules tách rõ weak ad, weak store, weak first session.
- [ ] Có decision allowed và blocked conclusions để tránh over-read sample nhỏ.
- [ ] Có stop-loss rule và owner rõ trước khi chạy.
- [ ] Readout memo mẫu đã chuẩn bị trước khi data về.
- [ ] Không dùng benchmark như luật cứng; chỉ dùng decision ranges cho sprint.
- [ ] Final UA Plan field **hypothesis** đã được cập nhật.

---

## Curated References

- [Google Play Console - Store listing experiments](https://play.google.com/console/about/store-listing-experiments/) - Official Play Console surface for testing graphics and localized text to improve listing performance.
- [Royal Match - The New King from Turkey? - Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/3/21/royal-match-the-new-king-from-turkey) - Public puzzle teardown useful for reading gameplay promise, speed, power-up feel and player agency as continuity signals.
- [Royal Match on Google Play](https://play.google.com/store/apps/details?hl=en_US&id=com.dreamgames.royalmatch) - Public store surface for observing how a puzzle product presents its promise.
', now()),
  ('lessons/day-08.md', 'markdown', null, '---
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
', now()),
  ('lessons/day-09.md', 'markdown', null, '---
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
[VISUAL PLACEHOLDER: Third-party image request - Vanity trap diagnosis tree]
Type: hero operating diagram.
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
[VISUAL PLACEHOLDER: Third-party image request - Acquisition metric trap board]
Type: metric board / decision heatmap.
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
', now()),
  ('lessons/day-10.md', 'markdown', null, '---
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

```text
[VISUAL PLACEHOLDER: Third-party image request - Retention decay curve comparison]
Type: data visual/chart.
Lesson section: Sơ đồ retention decay và first-session proof.
Previous local asset to replace: content/assets/usecases/day-10-hero-diagram.png.
Visual brief: Retention decay curve comparison.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Nhìn độ dốc từ Day 0 sang Day 1 trước. Nếu đường rơi mạnh ngay sau install, hãy kiểm first-session funnel trước khi sửa channel.
>
> **Conclude**: D1 yếu thường là cảnh báo rằng lời hứa chưa được giao trong phiên đầu, hoặc tracking/cohort đang bị đọc sai. Hành động tốt nhất là khoanh điểm gãy bằng event funnel.
>
> **Do not infer**: Không dùng đường retention này làm benchmark cố định. Một puzzle prototype, một hybrid-casual live game và một game có meta progression sẽ có đường retention khác nhau.

---

## Bảng first-session funnel và cohort readout

```text
[VISUAL PLACEHOLDER: Third-party image request - First session progression funnel]
Type: data visual/chart.
Lesson section: Bảng first-session funnel và cohort readout.
Previous local asset to replace: content/assets/usecases/day-10-data-visual.png.
Visual brief: First session progression funnel.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

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
- [Google Play Console Help - Measure your app''s acquisition and retention](https://support.google.com/googleplay/android-developer/answer/6263332?hl=en) - Official Play Console help for reviewing how users find your store listing and use the app after install.
', now()),
  ('lessons/day-11.md', 'markdown', null, '---
day: 11
title: "ARPDAU, LTV and payback for ads plus light IAP"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ARPDAU, LTV, Payback window]
artifact: "Rough economics note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Rough economics note**: một ghi chú kinh tế đủ đơn giản để quyết định có nên tiếp tục mua traffic, giảm spend, hay sửa monetization trước.

Bạn sẽ không xây mô hình tài chính phức tạp. Bạn sẽ viết một guardrail vận hành:

- `ARPDAU` hiện tại có đủ để nuôi `CPI` không?
- `LTV` early estimate đang nằm dưới hay gần economics ceiling?
- `Payback window` có hợp với budget và runway của team không?
- Nếu retention ổn nhưng revenue yếu, sửa rewarded ad/IAP ở đâu?
- Nếu revenue ngày đầu cao nhưng retention sụp, có phải monetization đang quá gắt không?

Plan field cập nhật: **metricTargets**. Artifact: **Rough economics note**.

---

## Why this matters

Sau Day 9-10, bạn biết cách đọc acquisition và first-session quality. Nhưng một game live vẫn có thể gặp câu hỏi khó hơn: “Nếu user có vẻ ổn, mình có được mua thêm user không?”

Team indie thường rơi vào hai lỗi:

- Không tính economics vì nghĩ `$100-500` quá nhỏ để đo.
- Tính economics quá tự tin, lấy vài ngày doanh thu non rồi forecast như chắc chắn.

Cả hai đều nguy hiểm. Nếu `CPI` là `$0.60` còn LTV direction chỉ quanh `$0.20`, scale chỉ phóng to lỗ. Nếu retention ổn nhưng `ARPDAU` thấp, dừng UA ngay có thể bỏ lỡ cơ hội sửa rewarded placement. Nếu `ARPDAU` cao do ép interstitial quá sớm nhưng D1 sụp, revenue đó là “đốt cohort”, không phải monetization khỏe.

Rough economics note giúp bạn đặt stop-loss trước khi cảm xúc thắng spreadsheet.

---

## Core model: economics ceiling, not exact prediction

Với game puzzle ads + light IAP, bạn đọc economics bằng 4 khối:

```text
Retention depth -> Lifetime days
Monetization intensity -> ARPDAU
Lifetime days * ARPDAU -> rough LTV
Rough LTV vs CPI -> buy / hold / stop decision
```

Các công thức dùng cho sprint:

```text
ARPDAU = daily revenue / DAU

Rough LTV ≈ estimated lifetime active days * ARPDAU

Payback ratio at day N = cumulative revenue by cohort / acquisition cost for that cohort

Stop-loss CPI ceiling = rough LTV * safety margin
```

Safety margin là phần giảm trừ để tránh forecast lạc quan. Ví dụ rough LTV direction là `$0.30`, team có thể đặt stop-loss CPI quanh `$0.18-$0.22` cho sprint này, tùy độ tin của data. Đây không phải công thức luật cứng; nó là cách bảo vệ budget khi signal còn non.

---

## Khung Rough economics note mẫu

| Field | Cách điền | Vì sao cần |
| :--- | :--- | :--- |
| **Cohort scope** | Platform, country, channel, build version, install date. | Không trộn paid/organic hoặc build cũ/mới. |
| **Revenue mix** | Ad %, IAP %, rewarded/interstitial/no-ads pack. | Biết doanh thu đến từ đâu và có phá retention không. |
| **Retention anchor** | D1/D7/session depth hoặc lifetime active days estimate. | LTV không thể cao nếu user rời quá sớm. |
| **ARPDAU direction** | Daily revenue / DAU theo cohort hoặc live segment. | Đo tốc độ kiếm tiền mỗi active user. |
| **Rough LTV range** | Conservative / expected / optimistic. | Không tin một con số duy nhất. |
| **Payback window** | Khi nào revenue cần bù đủ CPI? D7, D30, D60? | Biết team có đủ runway chờ không. |
| **Stop-loss CPI** | CPI trần cho sprint này, có safety margin. | Ngăn scale khi economics âm. |
| **Next action** | Scale nhẹ, hold, fix monetization, fix retention, hoặc stop. | Biến spreadsheet thành quyết định. |

Một note tốt luôn có dòng **Do not conclude**. Ví dụ: “Không kết luận LTV thật của game; đây chỉ là early guardrail cho paid test nhỏ.”

### Revenue quality and confidence layer

Không phải mọi revenue đều có cùng chất lượng. Với game puzzle nhỏ, revenue tốt là revenue xuất hiện **sau khi người chơi đã hiểu giá trị game**, không phá retention, và có thể lặp lại ở cohort kế tiếp. Revenue xấu là revenue đến từ việc ép quảng cáo quá sớm, làm D1/D3 rơi, hoặc chỉ xuất hiện trong một sample nhỏ rồi biến mất.

| Revenue signal | Confidence nếu... | Decision được phép | Không được kết luận |
| :--- | :--- | :--- | :--- |
| Rewarded opt-in tăng | User tự chọn xem ad sau một value moment, D1/session depth không giảm | tối ưu reward value, placement, frequency | cứ thêm rewarded là LTV tăng |
| Interstitial revenue tăng | xuất hiện sau first win/level depth, frequency cap rõ | test cap nhẹ và đọc retention guardrail | ARPDAU cao là monetization khỏe |
| No-ads/IAP purchase có vài đơn | purchase gắn với pain point rõ và cohort không quá nhỏ | viết IAP hypothesis, test copy/price nhẹ | payer conversion đã ổn định |
| ARPDAU tăng nhưng D1 giảm | revenue đến cùng retention damage | giảm ad pressure, kiểm placement | scale vì revenue/day đẹp |
| Paid LTV thấp hơn organic | paid traffic intent khác hoặc promise mismatch | tách cohort, đọc lại creative/store promise | dùng organic LTV để justify paid UA |

Confidence label nên đi cùng mỗi economics verdict:

```text
Economics confidence:
- High enough to pause scale: CPI is far above rough LTV range.
- Medium to test monetization: retention is workable, revenue mix has clear placement hypotheses.
- Low to forecast LTV: cohort is small and payback window is immature.
```

Khi confidence khác nhau, quyết định cũng phải khác nhau. Bạn có thể **dừng scale** với confidence cao hơn việc **dự báo LTV thật**.

---

## Sơ đồ tính rough LTV

```text
[VISUAL PLACEHOLDER: Third-party image request - LTV calculation components]
Type: hero operating diagram.
Lesson section: Sơ đồ tính rough LTV.
Previous local asset to replace: content/assets/usecases/day-11-hero-diagram.png.
Visual brief: LTV calculation components.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Inspect**: Nhìn hai nhánh chính: retention tạo lifetime active days, còn monetization tạo `ARPDAU`. LTV direction chỉ xuất hiện khi hai nhánh này cùng tồn tại.
>
> **Conclude**: Nếu một nhánh yếu, đừng cố chữa bằng nhánh còn lại quá sớm. ARPDAU cao nhưng retention sụp có thể là ad aggression. Retention ổn nhưng ARPDAU thấp có thể là under-monetized.
>
> **Do not infer**: Không suy ra tăng số ad sẽ tự tăng LTV. Nếu ads phá first-session hoặc D1, lifetime days giảm và LTV có thể đi xuống.

---

## Bảng scenario LTV và CPI ceiling

Các số dưới đây là **scenario example** cho một live puzzle nhỏ có ads + light IAP. Dùng để học cách đặt guardrail, không dùng làm benchmark.

| Scenario | Retention / lifetime days direction | ARPDAU direction | Rough LTV | Stop-loss CPI idea | Decision posture |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Conservative** | D1 yếu hoặc session depth mỏng, ~2-3 active days | $0.015-$0.025 | $0.03-$0.08 | Rất thấp | Stop paid UA; fix product/monetization. |
| **Expected** | First-session ổn, D1/D7 đủ để học tiếp, ~4-6 active days | $0.035-$0.060 | $0.14-$0.36 | Có safety margin dưới LTV | Hold or run controlled tests. |
| **Optimistic** | Retention dày hơn cohort trước, ~7-10 active days | $0.070-$0.110 | $0.49-$1.10 | Có room scale nhỏ | Scale cautiously, watch guardrails. |

```text
[VISUAL PLACEHOLDER: Third-party image request - LTV projection scenarios]
Type: data visual/chart.
Lesson section: Bảng scenario LTV và CPI ceiling.
Previous local asset to replace: content/assets/usecases/day-11-data-visual.png.
Visual brief: LTV projection scenarios.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Rough LTV range by scenario, illustrative only
Conservative|0.06|Weak depth and weak monetization
Expected|0.27|Enough signal for controlled testing
Optimistic|0.82|Potential room for cautious scale
:::

**Inspect**: Khoảng cách giữa các scenario rất lớn. Chỉ cần retention hoặc ARPDAU lệch một chút, CPI ceiling thay đổi mạnh.

**Conclude**: Khi data còn ít, hãy ra quyết định bằng range và stop-loss, không bằng forecast một dòng.

**Do not infer**: Không nói game của bạn phải đạt `$0.27` LTV. Con số này chỉ minh họa cách biến LTV direction thành decision posture.

---

## Hướng dẫn đọc số

Đọc economics theo thứ tự này:

1. **Tách cohort**: Paid users, organic users, country, build version, channel.
2. **Kiểm retention guardrail**: Nếu D1/first-session yếu, revenue early có thể không bền.
3. **Tách revenue mix**: Rewarded ads, interstitials, banners, IAP/no-ads.
4. **Tính ARPDAU direction**: Daily revenue chia DAU, nhưng đọc theo vài ngày/cohort.
5. **Ước tính lifetime days**: Dựa trên retention/session depth hiện có, luôn dùng range.
6. **Tính rough LTV range**: Conservative, expected, optimistic.
7. **So với CPI**: Nếu CPI vượt stop-loss, không scale.

| Pattern | Diagnosis | Next action | Không nên làm |
| :--- | :--- | :--- | :--- |
| Retention ổn, ARPDAU thấp | Under-monetized hoặc rewarded value chưa hấp dẫn. | Test rewarded placement/reward value, no-ads pack, end-level offer. | Dừng game vì “không kiếm tiền” sau 2 ngày. |
| ARPDAU cao, retention sụp | Ad aggression hoặc paywall/popup phá trải nghiệm. | Giảm interstitial, dời ad sau first win/level depth, kiểm D1. | Scale vì thấy revenue/day cao. |
| CPI cao hơn rough LTV range | Negative unit economics trong sprint này. | Pause paid UA, giảm CPI bằng creative hoặc tăng LTV bằng product/monetization. | Tăng budget để thuật toán “học thêm”. |
| LTV gần CPI nhưng sample nhỏ | Có thể còn học tiếp nhưng rủi ro cao. | Giữ daily cap thấp, thêm cohort, không scale. | Đọc như ROAS-positive chắc chắn. |
| Organic LTV cao, paid LTV thấp | Paid traffic intent khác organic. | Tách cohorts, đọc creative promise và first-session fit. | Dùng organic average để justify paid spend. |

---

## Worked example: Live Calming Hex Puzzle

Team có live build Android với ads + no-ads IAP. Sau Day 9-10:

- Acquisition angle “real combo clear” có `CPI` khoảng `$0.48`.
- First-session guardrail tạm ổn: `tutorial_complete 76%`, `D1 31%`.
- Team muốn biết có nên tăng daily cap không.

Economics readout sau cohort nhỏ:

| Metric | Observed direction | Cách đọc |
| :--- | :---: | :--- |
| Paid installs | 420 | Sample nhỏ, chỉ đọc direction. |
| Spend | $202 | CPI = `$0.48`. |
| D1 | 31% | First-session không phải blocker chính trong sprint này. |
| D7 early direction | 11% | Có depth vừa phải, chưa chứng minh long-term. |
| DAU from cohort days 1-5 | 310 avg active-user-days total | Dùng để estimate lifetime days rất thận trọng. |
| Ad revenue | $7.80 | Rewarded + interstitial còn mỏng. |
| IAP revenue | $3.00 | Một vài no-ads purchases, chưa ổn định. |
| ARPDAU direction | ~$0.035 | Monetization chưa đủ khỏe. |
| Rough lifetime days range | 3.5-5.5 | Based on early retention, không forecast quá xa. |
| Rough LTV range | `$0.12-$0.19` | Dưới CPI `$0.48`. |

**Diagnosis**: Retention không tệ, nhưng economics chưa đủ mua traffic ở CPI hiện tại. Đây không phải “game chết”. Đây là “paid UA chưa có unit economics”.

**Tradeoff**: Team có hai hướng: giảm CPI bằng creative/channel hoặc tăng ARPDAU bằng monetization. Vì first-session ổn, sửa monetization có thể đáng thử. Nhưng scale paid UA ngay là sai.

**Verdict**:

1. Không tăng daily cap.
2. Giữ một test nhỏ nếu cần thêm cohort, nhưng đặt stop-loss CPI thấp hơn.
3. Test rewarded ad ở end-level “double reward” và continue khi sắp thua, không đặt interstitial trước level 3.
4. Test no-ads pack price/copy nhẹ, không ép popup sớm.
5. Rerun economics note sau khi có cohort mới.

### Payback decision ladder

Worked example trên không chỉ nói "LTV thấp hơn CPI". Nó dạy cách chọn posture theo khoảng cách giữa `rough LTV`, `CPI`, `retention` và `confidence`.

| Situation | Economics read | Decision posture | Sprint action |
| :--- | :--- | :--- | :--- |
| Rough LTV far below CPI, retention weak | product + economics đều chưa đủ | stop paid UA | sửa first-session/retention trước |
| Rough LTV far below CPI, retention workable | monetization/CPI chưa đủ | hold cap, no scale | test rewarded/IAP và giảm CPI |
| Rough LTV near CPI, sample small | có thể học tiếp nhưng rủi ro cao | controlled test | thêm cohort nhỏ, không tăng daily cap |
| Rough LTV above CPI but payback slow | unit direction tốt nhưng cashflow căng | cautious scale | giới hạn cap theo runway/payback window |
| ARPDAU high, retention falling | revenue có thể đang đốt cohort | reduce ad pressure | dời placement, cap interstitial |

Decision memo cho case này:

```text
Economics decision memo
- Confidence to scale: Low.
- Confidence to continue tiny learning test: Medium.
- Main blocker: rough LTV $0.12-$0.19 is far below CPI $0.48.
- Product note: D1 31% means first-session is not the main blocker this sprint.
- Monetization hypothesis: rewarded/no-ads value may be underdeveloped.
- Action: hold paid UA cap, test monetization placement, test lower-CPI creative.
- Do not conclude: final LTV, ROAS-positive potential, or product death.
```

Điểm quan trọng: economics note tốt không biến thành "có/không" tuyệt đối. Nó chia quyết định thành scale, hold, learn, fix, stop.

### Economics action contract

Một Rough economics note chỉ hữu ích khi nó nói rõ quyết định nào được phép làm ngay và quyết định nào chưa đủ bằng chứng. Với sample nhỏ, bạn thường có đủ confidence để **không scale**, nhưng chưa đủ confidence để **forecast LTV thật**.

| Decision | Evidence tối thiểu | Action được phép | Action bị cấm |
| :--- | :--- | :--- | :--- |
| Stop scale / cap spend | CPI vượt xa rough LTV range, cohort scope rõ | giữ cap thấp, pause scale, giảm spend | kết luận game chết |
| Keep tiny learning test | retention workable, sample nhỏ, economics chưa phá hẳn | mua thêm cohort nhỏ có cap | tăng daily cap vì "cần thêm data" |
| Fix monetization | retention ổn, ARPDAU/revenue mix yếu, placement hypothesis rõ | test rewarded/no-ads/interstitial timing | nhồi ad sớm không có retention guardrail |
| Reduce CPI | ARPDAU/retention có signal, CPI là bottleneck | test creative/channel/store efficiency | đổi monetization khi acquisition mới là leak |
| Pause product/economics thesis | retention yếu và economics cũng yếu qua clean read | sửa first session hoặc rewrite promise | optimize ROAS trên user không ở lại |
| Forecast LTV | cohort đủ lớn, window đủ dài, revenue mapping sạch | planning estimate with caveat | gọi early rough LTV là LTV thật |

```text
Economics action contract
- Cohort scope:
- Decision allowed now:
- Decision not allowed yet:
- Main blocker:
- Action size:
- Variables to keep stable:
- Next read window:
- Do not conclude:
```

Contract này bảo vệ team khỏi một lỗi rất phổ biến: dùng cùng một bảng số để vừa "không scale", vừa "forecast LTV", vừa "kill product". Mỗi decision cần mức bằng chứng khác nhau.

---

## Monetization and economics checklist

| Check | Pass khi | Nếu fail thì sao |
| :--- | :--- | :--- |
| **Cohort split** | Paid/organic, country, build, channel tách rõ. | LTV bị pha loãng hoặc phóng đại. |
| **Revenue source split** | Ad revenue và IAP revenue tách riêng. | Không biết nên sửa ad placement hay IAP offer. |
| **Rewarded placement logic** | Rewarded ads là opt-in và xuất hiện ở điểm có giá trị. | Viewer rate thấp hoặc phá experience. |
| **Interstitial frequency** | Không xuất hiện trước first win/early value; có cap/frequency. | ARPDAU tăng ngắn hạn, retention giảm. |
| **IAP sanity** | No-ads/starter pack có giá và value rõ. | IAP quá sớm hoặc quá mơ hồ, conversion thấp. |
| **Safety margin** | Stop-loss CPI thấp hơn rough LTV expected. | Team scale trên forecast quá đẹp. |
| **Payback window** | D7/D30/D60 expectation phù hợp cash runway. | Game có thể “có LTV” nhưng team hết tiền trước khi payback. |

---

## Real usecases đã đối chiếu nguồn

### Internal case: Live puzzle game, retention acceptable, ROAS short

| Observable facts | Lesson interpretation | What not to infer |
| :--- | :--- | :--- |
| Case nội bộ `live-roas-shortfall`: `CPI $0.80`, `D1 34%`, `D7 16%`, `D7 ROAS 8%`, target direction 15-20%. | Retention không phải blocker chính. Economics shortfall có thể đến từ monetization placement, ARPDAU thấp, hoặc CPI quá cao. | Không scale chỉ vì retention acceptable. Không kill product ngay nếu monetization chưa được test đúng. |

### Official monetization surfaces

| Source signal | Cách dùng trong bài này | Không được suy ra |
| :--- | :--- | :--- |
| Unity LevelPlay Rewarded Ad là ad unit user-initiated, đổi full-screen ad lấy in-app reward. | Ưu tiên rewarded placement có value rõ thay vì ép interstitial sớm. | Rewarded ads không tự đảm bảo ARPDAU cao; reward value và timing vẫn cần test. |
| AdMob cung cấp monetization reporting/insights và có thể tích hợp với Firebase để hiểu user interaction với ads. | Dùng reporting để tách revenue source và đọc ad behavior cùng cohort. | Không dùng aggregate revenue để justify paid UA nếu paid cohort riêng đang âm. |
| Unity rewarded ads best practices nhấn mạnh placement/design phù hợp để tối ưu monetization. | Monetization là product design decision, không chỉ bật SDK. | Không nhồi ad vào mọi transition chỉ vì muốn tăng ARPDAU. |

---

## Common mistakes

**Mistake 1 - Dùng LTV early như forecast chắc chắn.**
**Correction**: Gọi nó là rough LTV direction. Luôn dùng range và safety margin.

**Mistake 2 - Trộn paid với organic.**
**Correction**: Paid cohorts thường có intent khác organic. Tách trước khi tính LTV/CPI ceiling.

**Mistake 3 - Tăng interstitial để kéo ARPDAU.**
**Correction**: Kiểm retention guardrail. Nếu D1/session depth sụp, ARPDAU cao là tín hiệu monetization quá gắt.

**Mistake 4 - Quên payback window.**
**Correction**: Một game có thể payback chậm hơn runway của team. Ghi rõ D7/D30/D60 expectation.

**Mistake 5 - Chỉ sửa monetization khi CPI cao.**
**Correction**: CPI cao có thể là creative/channel issue. Nếu ARPDAU và retention ổn nhưng CPI quá cao, quay lại Day 9 creative economics.

---

## English Terms You Should Keep

- **ARPDAU**: Average Revenue Per Daily Active User.
- **LTV**: Lifetime Value, tổng giá trị kinh tế dự kiến từ một user.
- **Payback window**: Thời gian cần để cumulative revenue bù acquisition cost.
- **CPI ceiling**: CPI trần mà game có thể chịu trong một scenario.
- **Stop-loss CPI**: CPI buộc phải dừng hoặc giảm spend.
- **Ad mediation**: Nền tảng quản lý nhiều ad networks để tối ưu fill/eCPM.
- **Rewarded ad**: Ad tự nguyện xem để nhận reward.
- **Interstitial ad**: Ad toàn màn hình thường xuất hiện ở transition.
- **Safety margin**: Biên an toàn trừ khỏi rough LTV trước khi đặt CPI ceiling.

---

## Lab output example

```text
ROUGH ECONOMICS NOTE

Cohort scope:
Android paid / VN / build 0.4.1 / real combo clear creative / install week 2026-W27.

Revenue mix:
Rewarded ads primary, interstitial after level 4+, no-ads pack secondary.

Retention anchor:
D1 31%, early D7 direction 11%, estimated lifetime active days range 3.5-5.5.

ARPDAU direction:
Ad revenue + IAP revenue / DAU = ~$0.035.

Rough LTV range:
Conservative: 3.5 * $0.025 = $0.09
Expected: 4.5 * $0.035 = $0.16
Optimistic: 5.5 * $0.050 = $0.28

Current CPI:
$0.48

Stop-loss CPI for next sprint:
$0.14-$0.20 unless monetization improves.

Diagnosis:
Retention is workable, but economics cannot support CPI $0.48 yet.

Next action:
Do not scale. Test rewarded placement and no-ads pack. Also test lower-CPI creative variant.

Do not conclude:
Do not claim final LTV. Do not claim ROAS-positive. This is an early guardrail only.

Economics action contract:
- Decision allowed now:
- Decision not allowed yet:
- Main blocker:
- Action size:
- Variables to keep stable:
- Next read window:
- Do not conclude:
```

Sprint decision memo:

```text
Confidence to scale:
Confidence to keep learning:
Main economics blocker:
Retention guardrail:
Monetization hypothesis:
CPI reduction hypothesis:
Action this sprint:
Do not conclude:
Next read date/window:
```

Bảng nộp lab:

| Field | Your value |
| :--- | :--- |
| Cohort scope | |
| Revenue mix | |
| D1 / D7 direction | |
| Estimated lifetime active days range | |
| ARPDAU direction | |
| Conservative LTV | |
| Expected LTV | |
| Optimistic LTV | |
| Current CPI | |
| Stop-loss CPI | |
| Payback window | |
| Diagnosis | |
| Next action | |
| Confidence to scale | |
| Confidence to keep learning | |
| Monetization hypothesis | |
| CPI reduction hypothesis | |
| Decision allowed now | |
| Decision not allowed yet | |
| Variables to keep stable | |
| Next read window | |
| Do not conclude | |

---

## Practical Lab

Làm trực tiếp cho game của bạn:

1. Chọn một paid cohort hoặc một live cohort rõ scope.
2. Tách revenue: rewarded, interstitial, banner, IAP/no-ads.
3. Ghi retention anchor: D1, D7 direction, session depth hoặc lifetime active days estimate.
4. Tính ARPDAU direction.
5. Tạo 3 scenario rough LTV: conservative, expected, optimistic.
6. Đặt stop-loss CPI có safety margin.
7. Viết decision: scale nhẹ, hold, fix monetization, reduce CPI, hoặc stop paid UA.
8. Gán confidence cho từng quyết định: scale, keep learning, stop, forecast.
9. Viết một sprint decision memo.
10. Viết Economics action contract.

Quality chain check:

- Paid và organic đã tách chưa?
- Có revenue mix chưa?
- Có retention guardrail chưa?
- Stop-loss CPI có thấp hơn expected LTV không?
- Có dòng “do not conclude” chưa?
- Memo có phân biệt confidence to scale và confidence to keep learning chưa?
- Contract có tách decision allowed now và decision not allowed yet chưa?

---

## Final UA Plan Update

Cập nhật trường **metricTargets** trong Final UA Plan:

```text
Economics guardrails:
- Cohort scope: [platform / country / channel / build / install window]
- Primary revenue stream: [rewarded / interstitial / IAP / no-ads pack]
- ARPDAU direction: [range, not exact forecast]
- Lifetime active days estimate: [conservative / expected / optimistic]
- Rough LTV range: [conservative / expected / optimistic]
- Current CPI: [observed]
- Stop-loss CPI: [with safety margin]
- Payback window: [D7 / D30 / D60 expectation]

Action rules:
- Retention good + ARPDAU weak: [monetization placement test]
- ARPDAU high + retention weak: [reduce ad pressure]
- CPI above stop-loss: [pause or reduce spend]
- LTV close to CPI but sample small: [hold cap, gather cohort]
- Confidence to scale: [high / medium / low + why]
- Confidence to keep learning: [high / medium / low + why]
- Decision allowed now: [stop scale / keep learning / fix monetization / reduce CPI]
- Decision not allowed yet: [forecast LTV / scale / kill product / ROAS verdict]
- Variables to keep stable: [cohort / build / channel / placement]
- Sprint economics decision memo: [one paragraph]
```

Plan field được cập nhật: **metricTargets**. Bài này cũng tạo input cho Day 12 về ROAS windows.

---

## Checklist Focus

- [ ] Đã tạo Rough economics note cho một cohort rõ scope.
- [ ] Đã tách paid/organic và revenue source.
- [ ] Đã tính ARPDAU direction và rough LTV range.
- [ ] Đã đặt stop-loss CPI có safety margin.
- [ ] Đã ghi payback window phù hợp runway.
- [ ] Đã viết Economics action contract.
- [ ] Đã tách decision allowed now và decision not allowed yet.
- [ ] Đã cập nhật **metricTargets** trong Final UA Plan.

---

## Curated References

- [Unity LevelPlay - Rewarded ads integration for Unity](https://docs.unity.com/en-us/grow/levelplay/sdk/unity/rewarded-ad-integration-package) - Official Unity LevelPlay rewarded ad documentation describing user-initiated ads exchanged for in-app rewards.
- [Google AdMob - Google for Developers](https://developers.google.com/admob) - Official AdMob developer surface for mobile app ad monetization and mediation integration.
- [Unity Ads - Rewarded ads best practices](https://docs.unity3d.com/Packages/com.unity.ads%403.3/manual/MonetizationResourcesBestPracticesAds.html) - Unity guidance on designing rewarded ad monetization strategy and placements.
', now()),
  ('lessons/day-12.md', 'markdown', null, '---
day: 12
title: "ROAS windows and signal delay"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ROAS, LTV, Payback window]
artifact: "ROAS decision window"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **ROAS decision window**: một ma trận quy tắc quyết định ràng buộc chặt chẽ thời điểm đọc dữ liệu ROAS (Day 0, Day 3, Day 7, Day 30) với các hành động vận hành (Tăng tiền, Tạm dừng sửa ad, hay Tắt chiến dịch cắt lỗ).

Kết quả đạt được:
- Hiểu rõ độ trễ dữ liệu (signal delay) do cơ chế bảo mật Apple SKAN/AdAttributionKit và Google Privacy Sandbox gây ra.
- Thiết lập bộ ba quy tắc hành động (Hold, Iterate, Stop) dựa trên sự kết hợp giữa CPI thực tế và tỷ lệ hoàn vốn ROAS.
- Tự cấu hình kịch bản xử lý cảnh báo dương tính giả (false positives) khi chạy test ngân sách nhỏ.
- Cập nhật các mốc thời gian đọc ROAS vào Final UA Plan.

---

## Why this matters

Khi bạn chạy một chiến dịch quảng cáo paid với ngân sách nhỏ $15-30/ngày, số liệu ROAS đổ về dashboard trong 24 giờ đầu tiên (Day 0 ROAS) sẽ cực kỳ biến động và nhiễu loạn:
- Một ngày nọ, tự dưng có 1 người chơi hứng thú nạp gói IAP $9.99. Chỉ số ROAS hiển thị trên dashboard vọt lên `250%`. Bạn mừng rỡ nghĩ game đã thành công lớn và scale ngân sách gấp 5 lần. Tuy nhiên, các ngày tiếp theo không có ai nạp thêm tiền, ROAS tụt về `2%`, tài khoản bị âm vốn nặng. Đây gọi là **bẫy dương tính giả (false positive)**.
- Ngược lại, một ad group khác chạy 3 ngày chưa ghi nhận đồng doanh thu nào (ROAS = 0%). Bạn lập tức tắt chiến dịch. Nhưng thực tế, người chơi tải game ngày đầu tiên cần chơi đến màn 10 (thường là ở Ngày 3) mới có nhu cầu click xem ad rewarded hay mua vật phẩm. Bạn tắt quá sớm nên đã đánh mất một chiến dịch có tiềm năng hoàn vốn tốt.

Bạn cần xác định rõ **cửa sổ thời gian đọc số (ROAS windows)** tương ứng với từng giai đoạn học hỏi để có hành động chính xác, tránh đưa ra quyết định dựa trên số liệu nhiễu loạn ngày đầu.

---

## Core model: Các mốc cửa sổ thời gian đọc ROAS (D0 -> D3 -> D7 -> D30)

Đối với game puzzle casual kết hợp ads/IAP nhẹ, việc đọc chỉ số ROAS bắt buộc phải chia theo 4 checkpoints thời gian rõ ràng:

1.  **Day 0 ROAS (Đọc vị ad hook)**: Doanh thu thu được ngay trong ngày đầu tiên người chơi cài đặt.
    *   *Mục đích*: Đánh giá xem creative quảng cáo có hút đúng đối tượng có hành vi chi trả nhanh hay không.
2.  **Day 3 ROAS (Đọc vị onboarding)**: Doanh thu tích lũy sau 3 ngày hoạt động.
    *   *Mục đích*: Chỉ số này phản ánh chất lượng trải nghiệm màn chơi đầu (Level 1-15) và các vị trí đặt ad đầu tiên.
3.  **Day 7 ROAS (Chẩn đoán cắt lỗ)**: Doanh thu tích lũy sau 1 tuần chơi.
    *   *Mục đích*: Đây là mốc quan trọng nhất để áp dụng quy tắc stop-loss (cắt lỗ). Nếu D7 ROAS thấp rõ rệt so với rule nội bộ bạn đã đặt cho game đó, hãy dừng campaign hoặc giữ ở mức tối thiểu để đọc lại sản phẩm.
4.  **Day 30 ROAS (Đo lường điểm hòa vốn)**: Doanh thu tích lũy sau 1 tháng.
    *   *Mục đích*: Dự báo xem game có khả năng hoàn vốn (break-even) ở mốc Ngày 90 hoặc Ngày 180 hay không.

### ROAS decision contract

Trước khi campaign chạy, hãy viết một **ROAS decision contract**. Contract này khóa lại: mốc nào được đọc, mốc nào chưa được đọc, và team được phép làm gì tại từng checkpoint.

| Contract field | Câu hỏi phải chốt trước launch | Ví dụ cho micro soft-launch |
| --- | --- | --- |
| Primary checkpoint | Mốc chính để ra quyết định tiền là D3, D7 hay D30? | D7 là mốc stop/iterate chính; D0 chỉ dùng để phát hiện anomaly |
| Allowed decision | Ở checkpoint này team được phép quyết định gì? | D7 được phép hold, iterate monetization, hoặc stop-loss |
| Blocked conclusion | Dù số đẹp, team chưa được kết luận gì? | Không kết luận LTV dài hạn, D90 payback, hoặc global scale từ D7 |
| Freshness rule | Dữ liệu mấy giờ/ngày gần nhất bị loại khỏi quyết định? | Không dùng 48 giờ gần nhất nếu postback/revenue delay chưa ổn |
| Cohort rule | Cohort nào được đọc? | Chỉ đọc cohort có cùng build, geo, channel, creative cell và store version |
| Owner | Ai có quyền đổi budget hoặc stop campaign? | UA owner đề xuất, product owner xác nhận retention/monetization caveat |

Blocked conclusions theo window:

| Window | Được đọc | Chưa được kết luận |
| --- | --- | --- |
| D0 | Install quality rất sớm, anomaly, tracking/revenue event có bắn không | Winner, payback, retention, scale |
| D3 | Onboarding monetization, rewarded ad/IAP early exposure | Long-term ROAS hoặc final stop-loss nếu sample nhỏ |
| D7 | Directional stop/iterate decision cho micro-budget | D30/D90 payback chắc chắn |
| D30 | Payback direction rõ hơn | Global scale nếu creative/source/cohort chưa lặp lại |

Một contract tốt không làm team chậm hơn. Nó ngăn một lỗi đắt: dùng mốc ngắn để kể câu chuyện dài.

---

## Khung Ma trận Quyết định phối hợp CPI và D7 ROAS (Main framework/map mẫu)

Dưới đây là ma trận quyết định 4 ô phối hợp giữa chi phí mua user (CPI) và hiệu quả hoàn vốn (ROAS) ở Ngày 7:

| Chỉ số phối hợp | D7 ROAS Đạt Chỉ Tiêu | D7 ROAS Dưới Chỉ Tiêu |
| :--- | :--- | :--- |
| **CPI Thực Tế Rẻ** | **Ô 1: SCALE (Tăng tiền)**<br>Ad kéo user tốt và game kiếm tiền hiệu quả. Chỉ tăng ngân sách theo nhịp nhỏ, có kiểm soát. | **Ô 2: ITERATE GAMEPLAY**<br>Ad rẻ chứng tỏ hook quảng cáo đang ổn, nhưng game giữ chân/monetization kém. Sửa lại game, giữ ad ở mức học. |
| **CPI Thực Tế Đắt** | **Ô 3: ITERATE CREATIVE**<br>Game giữ chân và kiếm tiền tốt, nhưng giá mua user quá cao. Tiến hành làm video quảng cáo mới để kéo CPI xuống. | **Ô 4: STOP (Tắt dừng lỗ)**<br>Chiến dịch thất bại hoàn toàn ở cả ad lẫn game. Tắt ad hoặc giảm về mức tối thiểu để tránh tiếp tục tiêu tiền vô nghĩa. |

### Confidence ladder cho quyết định ROAS

Ma trận CPI x ROAS chỉ đáng tin khi confidence đủ cao. Với ngân sách nhỏ, cùng một con số D7 ROAS có thể dẫn tới hai action khác nhau nếu sample, freshness hoặc revenue mix khác nhau.

| Confidence layer | Câu hỏi kiểm tra | Nếu pass | Nếu fail |
| --- | --- | --- | --- |
| Sample sanity | Cohort có đủ installs/users để đọc directional chưa? | Có thể đưa ra call có caveat | Hold hoặc gom thêm cohort tương tự |
| Data freshness | Postback/revenue event đã qua vùng delay chưa? | Dùng được cho D3/D7 readout | Loại 24-48h gần nhất khỏi quyết định |
| Cohort consistency | Build, geo, channel, store, creative cell có ổn định không? | Đọc CPI/ROAS cùng một cohort | Không gọi winner/loser |
| Revenue mix | Doanh thu đến từ nhiều user hay một whale/IAP bất thường? | Dùng ROAS direction | Ghi false positive risk, không scale |
| Downstream support | Retention/session depth có ủng hộ monetization không? | Iterate hoặc scale có kiểm soát | Không tăng budget chỉ vì ROAS spike |

Decision ladder:

| Confidence | Action được phép | Action chưa được phép |
| --- | --- | --- |
| Low | Hold, fix measurement, extend readout window | Scale, stop, rewrite monetization lớn |
| Medium | Iterate creative/product/monetization nhỏ, keep budget low | Scale mạnh hoặc kết luận payback |
| High | Scale nhẹ, stop-loss, hoặc lock next sprint decision | Global scale không có cohort lặp lại |

Rule: **không có confidence ladder thì không có budget change**. Nếu team chưa nói được vì sao confidence là low/medium/high, action đúng thường là hold hoặc rerun sạch hơn.

---

## Sơ đồ Quy trình ROAS windows và Độ trễ Dữ liệu (Hero visual or operating diagram)

```text
[VISUAL PLACEHOLDER: Third-party image request - ROAS Windows & Signal Delay Timeline]
Type: hero operating diagram.
Lesson section: Sơ đồ Quy trình ROAS windows và Độ trễ Dữ liệu (Hero visual or operating diagram).
Previous local asset to replace: content/assets/usecases/day-12-hero-diagram.png.
Visual brief: ROAS Windows & Signal Delay Timeline.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ quy trình (Hero Visual Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Xem xét khoảng thời gian trễ (grey zone) kéo dài 24-48 giờ từ khi người dùng phát sinh hành động nạp tiền ở Ngày 3 đến khi ad network nhận được postback cập nhật và hiển thị trên dashboard.
> *   **Kết luận rút ra (Conclude)**: Tuyệt đối không được chỉnh sửa ngân sách hoặc tắt campaign dựa trên dữ liệu ROAS của 48 giờ gần nhất, vì dữ liệu này luôn bị thiếu hụt (under-reported) do độ trễ postback.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng độ trễ này chỉ xảy ra trên iOS. Trình theo dõi Android (như Google Privacy Sandbox) cũng đang áp dụng cơ chế gửi postback trễ ngẫu nhiên để bảo vệ quyền riêng tư của người dùng.

---

## Biểu đồ ma trận quyết định phối hợp CPI và D7 ROAS (Chart/visual/table)

```text
[VISUAL PLACEHOLDER: Third-party image request - CPI vs D7 ROAS Decision Matrix]
Type: data visual/chart.
Lesson section: Biểu đồ ma trận quyết định phối hợp CPI và D7 ROAS (Chart/visual/table).
Previous local asset to replace: content/assets/usecases/day-12-data-visual.png.
Visual brief: CPI vs D7 ROAS Decision Matrix.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Ngưỡng D7 ROAS mục tiêu theo từng mức giá CPI ($ USD)
CPI < $0.30|D7 ROAS > 10%|Ad rẻ, chỉ cần game đạt mức hoàn vốn cơ bản là có thể duy trì chiến dịch
CPI $0.30 - $0.60|D7 ROAS > 22%|Mức giá trung bình, yêu cầu game có khả năng monetization khá hơn
CPI > $0.60|D7 ROAS > 35%|Ad đắt, bắt buộc game phải có IAP sâu để bù đắp chi phí thu hút cao
:::

*Cách đọc chart*: Mức ROAS mục tiêu không phải là một con số cố định. Hãy dùng chart này như ví dụ minh họa cho logic ra quyết định: CPI càng rẻ thì ROAS checkpoint có thể mềm hơn; CPI càng đắt thì checkpoint phải nghiêm hơn. Khi áp dụng thật, hãy thay các mốc số bằng rule nội bộ của chính game bạn.

---

## Hướng dẫn đọc số và chẩn đoán theo mốc thời gian

Hãy chẩn đoán kết quả hoàn vốn dựa trên bảng quy tắc quyết định dưới đây:

| Pattern số liệu | Chẩn đoán lỗi (Diagnosis) | Hành động ĐÚNG (Next Action) | Hành động SAI thường gặp |
| :--- | :--- | :--- | :--- |
| **D3 ROAS = 15%**<br>**D7 ROAS = 18%** | **Monetization Plateau**: Game thu tiền rất tốt ở 3 ngày đầu, nhưng sau đó người chơi không còn gì để nạp (thiếu chiều sâu IAP/Ad). | Thiết kế thêm các màn chơi khó hơn, bổ sung tính năng xem ad nhận lượt đi tiếp ở level cao. | Tiếp tục tăng tiền vì thấy 3 ngày đầu ROAS tăng trưởng nhanh. |
| **D7 ROAS = 5%** (Thấp hơn nhiều so với target nội bộ)<br>**D1 Retention = 35%** (Đạt) | **Under-monetized Active Users**: Game giữ chân người chơi cực kỳ tốt, nhưng hệ thống kiếm tiền bị giấu quá kỹ hoặc quá yếu. | Bật thêm quảng cáo xen kẽ (interstitial ads) ở cuối màn hoặc tạo gói IAP "No Ads" tặng kèm booster. | Tắt game vì nghĩ game thất bại (bỏ phí game có retention tốt). |
| **D7 ROAS = 2%**<br>**D1 Retention = 12%** | **Double Failure**: Cả sản phẩm giữ chân lẫn cơ chế kiếm tiền đều thất bại. | Tắt chiến dịch ad ngay lập tức. Quay lại sửa core loop game và thiết kế lại hướng dẫn onboarding. | Tiếp tục chạy ad để "đợi máy học tự tối ưu hóa". |

ROAS readout ledger:

| Read question | Evidence cần có | Nếu thiếu evidence | Action an toàn |
| --- | --- | --- | --- |
| Revenue có bị spike bởi 1 user không? | Số paying users, ad revenue users, revenue distribution | Không biết doanh thu đến từ bao nhiêu user | Không scale, ghi false-positive risk |
| Dữ liệu có bị delay không? | Postback freshness, revenue event timestamp, dashboard lag caveat | 48h gần nhất chưa ổn | Loại window mới nhất khỏi quyết định |
| CPI và ROAS đang đọc cùng cohort không? | Build/geo/channel/campaign/cell/store version match | Cohort lẫn lộn | Không dùng ma trận 4 ô để chốt call |
| ROAS yếu nhưng retention tốt không? | D1/session depth/level progression | Chưa biết user có ở lại không | Không stop product; kiểm tra monetization exposure |
| ROAS tốt nhưng retention yếu không? | D1/D3/session depth | Không biết quality có bền không | Không tăng budget mạnh |

Một câu readout tốt nên có dạng: "D7 ROAS gợi ý X với confidence Y, nhưng blocked conclusion là Z, nên next action là A." Tránh viết: "D7 ROAS thấp nên game fail" nếu retention hoặc monetization exposure chưa được đọc.

---

## Worked example: Calming Hex Puzzle

Một tựa game xếp hình lục giác thư giãn (Calming Hex Puzzle) chạy thử nghiệm $300 chiến dịch quảng cáo với các ngưỡng thiết lập:
- Ngưỡng CPI trần stop-loss: `$0.40`
- Ngưỡng D7 ROAS mục tiêu nội bộ: `> 20%` (ví dụ minh họa cho build này, nhằm hướng tới hòa vốn D30)

**Kết quả thu thập thực tế sau 8 ngày**:
- Ngân sách chi tiêu: $210.
- Số install thu được: 700 users.
- CPI thực tế tính toán: `$210 / 700 = $0.30` (*Đạt, dưới mức trần $0.40*).
- D1 Retention: 31% (*Đạt*).
- Doanh thu Day 7 tích lũy của cohort này: $12.6.
- D7 ROAS thực tế: `$12.6 / $210 = 6%` (*Không đạt chỉ tiêu 20%*).

**Phân tích chẩn đoán & Quyết định (Verdict)**:
*   Đây là trường hợp thuộc ô số 2 của Ma trận quyết định (CPI rẻ, game giữ chân tốt nhưng ROAS yếu). Người dùng chơi game đều đặn nhưng game chưa kích hoạt được nhu cầu nạp tiền hoặc xem quảng cáo.
*   **Hành động quyết định**: Không tắt ad hoàn toàn (vì CPI $0.30 vẫn rẻ theo mô hình này và traffic còn hữu ích cho việc học). Nhà phát triển giữ nguyên campaign ở mức ngân sách tối thiểu $15/ngày, tiến hành cập nhật bản build game mới: đưa gói mua booster $0.99 hiển thị ngay khi người chơi bị thua ở Level 8, và đặt thêm nút hồi sinh bằng cách xem video ad nhận thưởng. Chờ thêm 3 ngày để đọc số liệu của cohort mới sau khi cập nhật.

### Post-readout memo

Sau khi đọc D7, hãy viết memo thay vì chỉ copy screenshot dashboard.

```md
ROAS post-readout memo - Calming Hex Puzzle

Checkpoint:
D7 ROAS, excluding the latest 48h delayed window.

Cohort:
Android, market A, build 0.7.3, store v2, relax/satisfaction campaign cells.

Data health:
Install, first_open, rewarded_ad_impression and IAP purchase events present.
Ad revenue postback enabled, but latest 48h marked as delayed.

Readout:
CPI is healthy at $0.30.
D1 retention is directionally healthy at 31%.
D7 ROAS is weak at 6%.

Diagnosis:
Under-monetized active users. Acquisition is not the main problem in this read.

Decision:
Hold campaign at minimum learning spend. Do not scale.
Iterate monetization exposure in level 6-10.

Blocked conclusions:
No D30 payback claim.
No global scale claim.
No final product-fail claim because retention is still healthy.

Next read:
Compare D3/D7 ROAS and D1 retention for the new monetization build.
```

Memo này bắt team ghi rõ **cohort**, **data health**, **blocked conclusions** và **next read**. Nếu không có các dòng đó, ROAS dễ biến thành một con số tạo cảm xúc hơn là một quyết định.

---

## Checklist kỹ thuật đo lường ROAS (Implementation checklist)

Đảm bảo các cấu hình truyền gửi postback doanh thu chính xác:

| Hạng mục | Trạng thái cần có | Tác hại nếu bỏ qua |
| :--- | :--- | :--- |
| **1. Conversion Value Setup** | Đã cấu hình dải doanh thu (Conversion Value Schema) từ $0 đến $10+ trong MMP dashboard (như AppsFlyer, Adjust). | Mọi postback gửi về ad network chỉ hiển thị lượt tải, không hiển thị giá trị doanh thu IAP/Ad. |
| **2. Ad Revenue Postback** | Bật tính năng tích hợp doanh thu ad (Ad Revenue SDK integration) từ mediation sang MMP. | Doanh thu quảng cáo trong game không được đẩy về dashboard UA, làm ROAS hiển thị thấp hơn thực tế. |
| **3. Purchase Validation** | Cấu hình xác thực biên lai mua hàng IAP (In-App Purchase Validation) với Google Play/App Store. | Ghi nhận doanh thu ảo do người dùng sử dụng các bản hack/mod IAP để lừa hệ thống. |

---

## Real usecases đã đối chiếu nguồn

### Case Study: Rovio Sugar Blast — Tối ưu hóa ROAS dưới độ trễ postback của platform

```text
[VISUAL PLACEHOLDER: Third-party image request - Rovio Sugar Blast ROAS Delay optimization representational diagram]
Type: public screenshot/source visual.
Lesson section: Case Study: Rovio Sugar Blast — Tối ưu hóa ROAS dưới độ trễ postback của platform.
Previous local asset to replace: content/assets/usecases/day-12-hero-diagram.png.
Visual brief: Rovio Sugar Blast ROAS Delay optimization representational diagram.
Teaching job: create a clear decision-support visual for the learner, not decorative game art.
Required style: clean SaaS learning infographic, light background, readable labels, mobile-safe composition.
Must preserve the lesson readout that follows: Inspect, Conclude, and Do not infer.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

> [!NOTE]
> **Hướng dẫn đọc Sơ đồ tối ưu hóa của Rovio (Screenshot Readout)**:
> *   **Học viên cần quan sát (Inspect)**: Quan sát dải trễ dữ liệu (Delay window) từ Ngày 0 đến Ngày 3. Ad network chỉ nhận được tín hiệu chuyển đổi sau khi Apple giải phóng postback với độ trễ ngẫu nhiên (random delay).
> *   **Kết luận rút ra (Conclude)**: Rovio Sugar Blast chuyển dịch từ chạy ads cài đặt đại trà sang tối ưu hóa giá trị (Value-Based Optimization). Họ huấn luyện máy học bằng cách đẩy nhanh các event IAP/Ad đầu tiên của user vào 24 giờ đầu để "khóa" conversion value sớm, giúp nhận postback nhanh hơn mà vẫn tôn trọng luật bảo mật của platform.
> *   **Không được suy ra (Do not infer)**: Không suy ra rằng bạn bắt buộc phải nạp tiền chạy ad tối ưu hóa giá trị ngay từ đầu. Game indie nhỏ của bạn nên bắt đầu bằng tối ưu hóa lượt cài đặt (Install Optimization) và dùng bảng tính cohorted ROAS thủ công ở Ngày 7 để tự tối ưu bằng tay.

| Fact từ nguồn public | UA Interpretation cho bài học này | Không được suy ra |
| --- | --- | --- |
| Rovio đã công bố chi tiết về mô hình tối ưu hóa giá trị (Value-Based Optimization), nhấn mạnh việc vẽ đường cong LTV:CAC phân rã theo cohort để đạt ROAS dương cho dòng game giải đố casual. Nguồn: [LTV Modeling của Rovio trên Deconstructor of Fun](https://www.deconstructoroffun.com/blog/2021/10/25/the-game-analytics-masterclass) | Thiết lập mốc đọc ROAS bắt buộc phải tính toán độ trễ chuyển đổi dữ liệu của platform quảng cáo để tránh ra quyết định sai lầm. | Không tự suy diễn rằng cứ có độ trễ là bạn phải chờ thụ động. Bạn vẫn cần rule rõ cho hold, iterate và stop, chỉ là rule đó phải tôn trọng signal delay. |

---

## Common mistakes (Các sai lầm phổ biến)

*   **Mistake 1: Quyết định tắt/bật ad dựa trên ROAS của 24 giờ gần nhất**
    *   *Correction*: Bỏ qua số liệu ROAS Day 0 khi tối ưu chiến dịch. Hãy luôn sử dụng số liệu D7 ROAS tích lũy làm căn cứ tối ưu chính để tránh sai lệch dữ liệu do trễ postback.
*   **Mistake 2: Tăng ngân sách quá nhanh (>50%/ngày) khi thấy ROAS Day 3 cao đột biến**
    *   *Correction*: Khi có user nạp IAP lớn (dương tính giả), hãy giữ nguyên ngân sách thêm 3 ngày để xem có người tiếp theo nạp hay không, tránh việc scale vội vã làm loãng tệp.
*   **Mistake 3: Đặt mục tiêu ROAS hoàn vốn 100% ngay ở Ngày 7**
    *   *Correction*: Đừng đặt kỳ vọng hoàn vốn 100% quá sớm. Hãy dùng checkpoint Day 7 như một mốc chẩn đoán xem game có đang đi đúng hướng hay không, thay vì biến nó thành đích hoàn vốn cuối cùng.
*   **Mistake 4: Không ghi blocked conclusions**
    *   *Correction*: Mỗi readout phải ghi điều chưa được kết luận. D7 có thể hỗ trợ stop/iterate direction, nhưng chưa chứng minh D30/D90 payback hoặc global scale.
*   **Mistake 5: Scale vì một user mua IAP lớn**
    *   *Correction*: Kiểm tra revenue mix trước khi đổi budget. Nếu ROAS spike đến từ một user hoặc một event bất thường, ghi false-positive risk và giữ spend ở mức học.

---

## English Terms You Should Keep

*   **ROAS**: Return On Ad Spend (Tỷ lệ doanh thu thu được trên chi phí quảng cáo).
*   **postback**: Lệnh truyền dữ liệu chuyển đổi tự động từ MMP về ad network.
*   **conversion value**: Giá trị chuyển đổi (nhãn số hóa dùng để biểu diễn doanh thu trên iOS SKAN).
*   **false positive**: Dương tính giả (hiện tượng chỉ số tăng cao đột biến nhất thời do sai số mẫu nhỏ).
*   **payback day**: Ngày hoàn vốn thực tế.

---

## Lab output example (Mẫu kết quả thực hành)

### Xem trước Quy tắc Quyết định ROAS (ROAS Decision Window Preview)
```text
┌────────────────────────────────────────────────────────────────────────┐
│                        ROAS DECISION WINDOW                            │
├────────────────────────────────────────────────────────────────────────┤
│ Target Scenario: Hybrid Puzzle | Checkpoint: Day 7 ROAS                 │
│ Target D7 ROAS threshold: > 20% | Target CPI: < $0.35                  │
│                                                                        │
│ Decision Rules:                                                        │
│ - Rule 1 (Scale): If CPI < $0.35 AND D7 ROAS > 20% -> increase spend 20%│
│ - Rule 2 (Iterate): If CPI < $0.35 AND D7 ROAS < 10% -> update game    │
│ - Rule 3 (Stop): If CPI > $0.45 OR D7 ROAS < 5% -> pause campaign      │
│ Caveat: Do not adjust budget using last 48-hour delayed data.          │
└────────────────────────────────────────────────────────────────────────┘
```

Dưới đây là một mẫu ROAS decision window hoàn chỉnh dạng bảng mà học viên cần điền (mốc CPI và ROAS được điều chỉnh mềm dẻo dựa trên LTV thực tế của từng build game):

| Trạng thái CPI thực tế | D7 ROAS thực tế | Quyết định vận hành (Action) | Sửa đổi chi tiết sản phẩm / ad |
| :--- | :---: | :---: | :--- |
| **CPI < LTV * 0.8** (Rẻ) | D7 ROAS > 20% | **SCALE** | Tăng ngân sách chiến dịch thêm 20% mỗi 3 ngày. |
| **CPI < LTV * 0.8** (Rẻ) | D7 ROAS < 10% | **ITERATE GAME** | Sửa thiết kế nút rewarded ad hồi sinh màn chơi. |
| **CPI > LTV * 1.2** (Đắt) | D7 ROAS > 20% | **ITERATE AD** | Làm 2 video ad mới thay đổi intro 3 giây đầu. |
| **CPI > LTV * 1.2** (Đắt) | D7 ROAS < 5% | **STOP** | Tắt hoàn toàn chiến dịch quảng cáo để cắt lỗ. |

```md
ROAS decision contract
- Primary checkpoint: D7
- Allowed decision: hold, iterate monetization, stop-loss, or small scale
- Blocked conclusions: no D30 payback, no D90 LTV, no global scale from this read
- Freshness rule: exclude latest 48h delayed data
- Cohort rule: same build, geo, channel, store version and creative cell
- Confidence: [low / medium / high] because [sample, freshness, cohort consistency, revenue mix]

Post-readout memo
- Cohort:
- Data health:
- Readout:
- Diagnosis:
- Decision:
- Blocked conclusions:
- Next read:

ROAS sign-off:
- Checkpoint used:
- Data excluded for freshness:
- Decision allowed:
- Decision blocked:
- Budget action:
- Next read window:
- Owner/date:
```

---

## Practical Lab

Làm trực tiếp cho game của bạn:
1.  Điền hoàn chỉnh ma trận quy tắc quyết định ROAS cho game của bạn theo mẫu ở phần **Lab output example**.
2.  Áp dụng **Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check)** dưới đây để tự duyệt:
    *   *Ràng buộc mốc thời gian*: Bạn đã ghi rõ mốc Ngày 7 làm checkpoint đánh giá cắt lỗ chính thay vì Ngày 1 chưa? (Đạt/Không)
    *   *Xử lý độ trễ*: Kịch bản ra quyết định của bạn có điều khoản loại trừ dữ liệu của 48 giờ gần nhất để tránh độ trễ postback chưa? (Đạt/Không)
    *   *Mốc số phối hợp*: Các hành động tăng/giảm ngân sách có được phối hợp chặt chẽ giữa cả hai chỉ số CPI và ROAS không (tránh nhìn một chiều)? (Đạt/Không)
    *   *Cấu hình MMP*: Hệ thống của bạn đã bật tính năng truyền gửi doanh thu ad (Ad Revenue Postback) sang MMP chưa? (Đạt/Không)
3.  Viết **ROAS decision contract** trước khi nhìn dashboard: primary checkpoint, allowed decision, blocked conclusions, freshness rule, cohort rule và owner.
4.  Chấm confidence cho quyết định: sample sanity, data freshness, cohort consistency, revenue mix, downstream support.
5.  Viết **post-readout memo** sau khi đọc số. Memo phải có diagnosis, decision, blocked conclusions và next read.
6.  Viết **ROAS sign-off** trước khi đổi budget.

---

## Final UA Plan Update

Cập nhật trường **roas_decision_matrix** trong Final UA Plan theo định dạng chuẩn dưới đây:

```text
- ROAS evaluation checkpoint: [Mốc checkpoint chính, ví dụ: Day 7]
- Target D7 ROAS threshold: [Mức ROAS mong muốn tại checkpoint]
- Scale rule definition: [Điều kiện để tăng tiền chiến dịch]
- Iterate rule definition: [Điều kiện để giữ campaign và sửa game/ad]
- Stop rule definition: [Điều kiện bắt buộc tắt campaign cắt lỗ]
- Freshness rule: [Dữ liệu mới nhất nào bị loại khỏi decision vì postback/revenue delay]
- Cohort rule: [Build/geo/channel/store/creative cell phải match thế nào]
- Confidence ladder: [Low/Medium/High và action được phép]
- Blocked conclusions: [Điều chưa được kết luận ở D0/D3/D7/D30]
- Post-readout memo owner: [Ai viết memo và cập nhật next read]
- ROAS sign-off: [checkpoint / excluded data / budget action / next read / owner]
```

---

## Checklist Focus

*   [ ] Thiết lập ma trận quyết định 4 ô phối hợp chi tiết giữa CPI và D7 ROAS.
*   [ ] Viết rõ điều khoản loại trừ dữ liệu trễ postback 48 giờ trong quy tắc vận hành.
*   [ ] Có ROAS decision contract trước khi launch.
*   [ ] Có confidence ladder trước khi scale/stop.
*   [ ] Có blocked conclusions theo từng window.
*   [ ] Có post-readout memo sau D7 hoặc checkpoint chính.
*   [ ] Có ROAS sign-off trước khi đổi budget.
*   [ ] Hoàn thành 4 mục trong Bảng quy trình kiểm tra chất lượng (ROAS Quality Chain Check).
*   [ ] Cập nhật trường roas_decision_matrix vào Final UA Plan.

---

## Curated References

*   [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit)
*   [Android Attribution Reporting](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
*   Tài liệu hướng dẫn cấu hình Conversion Value và đo lường postback của Apple App Store Connect.
', now()),
  ('lessons/day-13.md', 'markdown', null, '---
day: 13
title: "Attribution, ATT, SKAN and Android privacy signals"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Attribution, ATT, SKAN]
artifact: "Measurement risk note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Measurement risk note** cho Final UA Plan: một ghi chú vận hành nói rõ metric nào đáng tin ở mức nào, metric nào bị trễ/gom nhóm/modeled, và quyết định nào được phép hoặc không được phép đưa ra từ từng loại tín hiệu.

Quyết định cần học: khi attribution không hoàn hảo, bạn vẫn chạy micro soft-launch có kỷ luật bằng cách gắn **confidence level** cho từng metric trước khi scale, iterate hoặc kill.

Output cần có:

- Signal confidence ladder cho campaign đầu.
- Dashboard reconciliation rule khi ad network, store và analytics không khớp.
- Danh sách decision không được ra từ low-confidence data.
- Cập nhật trường **tracking** trong Final UA Plan, có liên hệ tới **successCriteria** và **killCriteria**.

---

## Why this matters

Mobile UA hiện đại không còn là đường thẳng sạch: `click -> install -> user id -> revenue`. iOS có `ATT`, SKAN-era reporting và AdAttributionKit. Android cũng đi theo hướng privacy-preserving attribution qua Privacy Sandbox. Dữ liệu vì vậy thường bị trễ, bị gom nhóm, modeled, thiếu user-level path, hoặc lệch nhau giữa ad network, store console và analytics trong game.

Với ngân sách `$100-500`, vấn đề lớn nhất không phải thiếu dữ liệu. Vấn đề lớn nhất là **đối xử với dữ liệu không hoàn hảo như dữ liệu hoàn hảo**.

Ví dụ:

- Network báo CPI rẻ, nhưng analytics báo tutorial complete thấp.
- Store CVR tăng, nhưng first_open thấp hơn install reported.
- ROAS D0 xấu, nhưng ad revenue có delay và cohort quá nhỏ.
- SKAN/aggregated signal không đủ granular, nhưng team vẫn muốn tách quá nhiều ad set.

Bài này giúp bạn viết rule trước: metric nào chỉ dùng để quan sát, metric nào đủ để iterate, metric nào đủ để pause, và metric nào tuyệt đối chưa đủ để scale hoặc kill product.

---

## Core model: signal confidence ladder

Đừng chia data thành "đúng" và "sai". Hãy chia theo độ tin cậy vận hành.

| Level | Signal type | Ví dụ | Dùng tốt cho | Không dùng cho |
| --- | --- | --- | --- | --- |
| High | Direct gameplay event đã QA | `tutorial_complete`, `level_3_complete`, `rewarded_completed` | Product/onboarding diagnosis | Attribution source-level nếu source chưa sạch |
| Medium | Platform/store/network metric | spend, clicks, installs, Store CVR, CPI | Creative/store/channel direction | Scale lớn nếu không có retention/economy |
| Medium-Low | Aggregated/modeled attribution | SKAN/AdAttributionKit-style reporting, modeled conversions | Directional pattern, cohort-level read | User-level conclusion |
| Low | Early revenue hoặc tiny cohort | D0 ROAS, ARPDAU từ 100 installs | Guardrail, not final verdict | Kill/scale decision lớn |
| Unknown | Missing/mismatched signal | install != first_open, event not QA''d | QA task | Any business decision |

Quy tắc: metric càng xa event gameplay trực tiếp và càng bị privacy/window/modeling ảnh hưởng, quyết định càng phải nhỏ hơn.

---

## Measurement risk map mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Measurement risk map mẫu]
Type: hero operating diagram.
Lesson section: Measurement risk map mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Decision | Primary signal | Risk | Confidence | Allowed decision | Not allowed |
| --- | --- | --- | --- | --- | --- |
| Creative có đáng iterate? | CTR, IPM | network window, click noise | Medium | làm thêm variant nhỏ | scale mạnh |
| Store promise có khớp? | Store CVR, click-to-install | traffic mix, store attribution window | Medium | sửa screenshot/title | kết luận product fit |
| First session có giao promise? | tutorial/level events | event QA risk | High nếu QA pass | sửa onboarding/level 1-3 | đổ lỗi cho channel ngay |
| Retention có đủ học tiếp? | D1/D3 cohort | sample nhỏ, build mix | Medium | hold/iterate | kill product từ 1 cohort |
| Economy có thể hoàn vốn? | ARPDAU, ROAS window | revenue delay, modeled data | Low-Medium | đặt guardrail | scale/kill trước D7 rule |
| Dashboard không khớp | install vs first_open | definition/window/SDK/consent | Unknown | reconcile trước | tranh luận số nào "đúng tuyệt đối" |

Bạn không cần một câu trả lời hoàn hảo. Bạn cần giới hạn đúng phạm vi của từng câu trả lời.

### Confidence-to-decision contract

Mỗi metric trong risk note cần một contract: confidence hiện tại cho phép quyết định gì, cấm quyết định gì, và cần bằng chứng nào để nâng cấp quyền quyết định.

| Confidence hiện tại | Decision được phép | Decision bị cấm | Cách nâng confidence |
| --- | --- | --- | --- |
| High gameplay event QA''d | Sửa onboarding, level pacing, reward placement, first-session proof | Quy attribution/source quality nếu source mapping chưa sạch | Giữ event name stable, lưu QA evidence, segment theo build/source |
| Medium platform/store metric | Iterate creative/store, pause cell yếu, giữ control | Scale lớn, kill product, kết luận retention | Đối chiếu với guardrail gameplay và cohort sạch |
| Medium-Low aggregated/modeled | Đọc directional trend, gom cell, giảm phân mảnh campaign | User-level diagnosis, winner/loser quá granular | Chờ reporting window, gom đủ volume, đọc ở cấp thesis |
| Low early revenue/tiny cohort | Watchlist, đặt guardrail, quyết định chờ thêm data | Kill economy, scale vì ROAS sớm, đổi monetization lớn | Chờ D3/D7, kiểm mediation/revenue delay, đủ cohort |
| Unknown/mismatch | QA measurement, hold business decision | Scale, fraud claim, product verdict | Reconcile definition/window/event/source naming |

Rule vận hành: **decision size không được lớn hơn confidence level**. Nếu signal chỉ medium, quyết định nên là iterate/hold nhỏ. Nếu signal unknown, quyết định duy nhất là QA/reconcile.

---

## Hero visual: attribution confidence ladder

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: attribution confidence ladder]
Type: data visual/chart or decision board.
Lesson section: Hero visual: attribution confidence ladder.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[ATTRIBUTION CONFIDENCE LADDER]

```text
HIGH CONFIDENCE
Direct gameplay event da QA
Examples: tutorial_complete, level_3_complete, rewarded_completed
Allowed: fix onboarding, level pacing, reward placement
Not allowed alone: attribute user quality to one ad source if source mapping is messy
        ^
        |
MEDIUM CONFIDENCE
Platform/store/network metric with known window
Examples: spend, CTR, IPM, Store CVR, CPI
Allowed: iterate creative/store, pause a weak ad cell, compare variants
Not allowed alone: scale hard or kill product without retention proof
        ^
        |
MEDIUM-LOW CONFIDENCE
Aggregated or modeled attribution
Examples: SKAN-style cohorts, modeled conversions, privacy-limited source reports
Allowed: read directional pattern, simplify campaign structure
Not allowed alone: user-level diagnosis or tiny ad-set split decisions
        ^
        |
LOW CONFIDENCE
Early revenue or tiny cohort
Examples: D0 ROAS, ARPDAU from small sample, early payer signal
Allowed: guardrail, watchlist, "collect more data" decision
Not allowed alone: scale/kill/economy verdict
        ^
        |
UNKNOWN
Missing or mismatched signal
Examples: installs != first_open, event not QA''d, build/source naming broken
Allowed: QA task, reconciliation memo
Not allowed: any business verdict before source/window/event is fixed
```

| Confidence level | Decision size allowed | Typical next action | Report language to use |
| --- | --- | --- | --- |
| High | Product/onboarding fix, small spend hold, retest same thesis | Fix first-session proof or evented gameplay moment | "High confidence to fix onboarding because gameplay event is QA''d." |
| Medium | Creative/store iteration, channel comparison, small pause | Change hook, screenshot order, campaign cell | "Medium confidence to iterate creative, not enough to scale." |
| Medium-Low | Directional read only | Merge cells, wait for cohort, simplify structure | "Directional signal; do not split more ad sets." |
| Low | Guardrail/watchlist | Wait for D3/D7, inspect placement, avoid hard verdict | "Low confidence revenue signal; hold decision." |
| Unknown | No business decision | QA SDK/event/window/source naming | "Unknown until reconciled." |


**Inspect:** bậc cao nhất là event gameplay đã QA, bậc thấp nhất là signal thiếu hoặc mismatch.
**Conclude:** cùng một metric có thể hữu ích nhưng không đủ quyền ra quyết định lớn.
**Do not infer:** ladder không nói ad network/store/analytics "sai"; nó chỉ nói nguồn nào phù hợp với quyết định nào.

---

## Dashboard reconciliation board

| Source | Metric/window | Definition question | Delay/privacy risk | Decision allowed |
| --- | --- | --- | --- | --- |
| Ad network | spend, impressions, clicks, installs, modeled conversion | conversion window là gì? install hay first open? | attribution/modeling/network logic | creative/channel direction |
| Store console | store visitors, installs, conversion | traffic source có tách được không? | store window, organic/paid mix | store proof readiness |
| Game analytics | first_open, tutorial, level, retention | event có fire đúng build/version không? | SDK consent, event bug | product/onboarding diagnosis |
| Revenue/ad tool | ad revenue, IAP, ARPDAU, ROAS | revenue delay bao lâu? cohort đủ lớn chưa? | delayed revenue, mediation reporting | economics guardrail |
| Spreadsheet readout | combined view | source nào là owner cho metric nào? | manual error | decision memo, not raw truth |

**Inspect:** mỗi source có một job, một window và một decision scope.
**Conclude:** dashboard mismatch là điều bình thường; workflow đúng là reconcile definition/window/event trước.
**Do not infer:** không chọn một dashboard làm source of truth tuyệt đối cho mọi quyết định.

### Reconciliation decision ledger

Khi dashboard lệch nhau, team rất dễ biến buổi đọc số thành tranh luận "dashboard nào đúng". Cách vận hành tốt hơn là ghi một ledger nhỏ: mỗi mismatch phải dẫn tới **một câu hỏi định nghĩa**, **một owner kiểm tra**, và **một decision được phép hoặc bị khóa**.

| Mismatch | Câu hỏi đầu tiên | Owner kiểm tra | Decision được phép | Decision bị khóa |
| --- | --- | --- | --- | --- |
| Network installs cao hơn `first_open` | network đang đếm install, app open hay modeled conversion? | UA/operator + analytics owner | kiểm naming/window, giữ campaign ở mức học | scale vì CPI nhìn rẻ |
| Store installs cao nhưng analytics thấp | build nào đang nhận traffic? SDK có fire ở first launch không? | game engineer | QA build/version/source path | kết luận store page thắng |
| `tutorial_complete` giảm sau build mới | event đổi tên hay tutorial thật sự khó hơn? | gameplay + analytics | so sánh event payload và level flow | đổ lỗi audience |
| ROAS tool trễ hơn analytics | revenue source có delay/mediation lag không? | monetization owner | ghi watchlist và chờ window | kill campaign D0 |
| SKAN/aggregated report thiếu granularity | campaign cell có quá nhỏ để privacy system trả tín hiệu không? | UA/operator | gom cell, đọc ở cấp thesis | tách thêm ad set |

Ledger này không thay thế phân tích sâu. Nó ngăn team ra quyết định lớn trước khi biết mình đang so cùng một định nghĩa hay chưa.

Decision note nên dùng câu ngắn:

```text
Mismatch: network installs > analytics first_open by 29%.
Likely causes to inspect: install/open definition, SDK first_open event, build version, consent path.
Allowed now: QA measurement and hold scale.
Not allowed now: call traffic fraudulent or scale because CPI is cheap.
Next checkpoint: re-read after event QA + 24h reporting delay.
```

---

## Hướng dẫn đọc số

| Pattern | Cách đọc đúng | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| Network install cao hơn analytics first_open >20% | Có thể do install/open definition, SDK, consent, version hoặc store path | kiểm first_open event, build version, source naming | kết luận traffic fraud ngay |
| CTR cao, Store CVR thấp | Attention có, store proof hoặc promise continuity yếu | sửa screenshot/title/preview video | scale vì CTR đẹp |
| Store CVR cao, tutorial complete thấp | Người chơi tin store nhưng game không giao proof sớm | sửa onboarding/level 1-3 | đổi channel hoặc đổ lỗi cho audience |
| D1 thấp, event chưa QA | Không biết product yếu hay event sai | QA event trước khi ra verdict | kill product |
| D0 ROAS thấp, D1 ổn | revenue còn trễ hoặc placement chưa đủ | chờ D3/D7 rule, đọc ARPDAU directional | tắt campaign vì D0 xấu |
| Aggregated report quá ít granularity | test cell bị phân mảnh hoặc privacy signal không đủ | gom cell, đọc decision lớn hơn | tách thêm ad sets |

Ngôn ngữ nên dùng trong report: "High confidence to fix onboarding", "Medium confidence to iterate creative", "Low confidence to make scale decision".

---

## Worked example: two dashboards disagree

Team chạy `$250` cho một calming puzzle prototype. Sau 3 ngày:

| Metric | Ad network | Store/analytics | Confidence | Read |
| --- | ---: | ---: | --- | --- |
| Installs | 238 | 184 first_open | Unknown until reconciled | mismatch cần QA |
| CPI | $1.05 | n/a | Medium | acquisition cost có vẻ cao nhưng chưa fatal |
| Store CVR | n/a | 33% | Medium | store proof khá ổn |
| tutorial_complete | n/a | 49% | High nếu event QA pass | first-session leak lớn |
| D1 | modeled estimate | 16% early cohort | Medium-Low | không scale |
| D0 ROAS | 2% | 1.5% | Low | chỉ là guardrail sớm |

Diagnosis:

- Không scale vì tutorial/D1 yếu.
- Không kết luận creative fail hoàn toàn vì store CVR ổn.
- Không kill product vì install vs first_open mismatch chưa reconcile.
- Action đúng: pause scale, QA first_open/tutorial events, sửa tutorial proof, retest same promise với one-clean-cell.

Tradeoff: chờ dữ liệu hoàn hảo sẽ chậm, nhưng quyết định lớn từ dữ liệu low-confidence sẽ đốt tiền. Vì vậy decision size phải khớp confidence.

### Second-pass confidence read

Đọc lần một trả lời "số đang nói gì". Đọc lần hai phải trả lời "số này có đủ quyền cho quyết định nào". Với case trên, report tốt không viết "campaign failed" hoặc "traffic bad". Report tốt viết rõ quyền quyết định theo từng tín hiệu.

| Decision | Highest-confidence signal | Confidence | Verdict | Next action |
| --- | --- | --- | --- | --- |
| Có nên scale campaign? | D1 16%, tutorial 49%, install mismatch | Low-Medium | Không scale | giữ spend nhỏ hoặc pause scale |
| Có nên bỏ creative thesis? | Store CVR 33%, CPI $1.05 | Medium | Chưa bỏ | giữ promise, đổi proof/variant nhỏ |
| Có nên sửa first session? | `tutorial_complete` 49% nếu event QA pass | High sau QA | Có | sửa 3 phút đầu và level proof |
| Có nên kill product? | D1 early + D0 ROAS thấp + mismatch | Low | Không | chờ clean cohort và D3/D7 rule |
| Có nên QA measurement? | install vs first_open lệch | Unknown | Bắt buộc | kiểm SDK, source naming, build path |

Một decision memo đủ tốt cho team indie nên giống thế này:

```text
Measurement decision memo
- Can iterate: store proof and tutorial delivery, because Store CVR has medium confidence and tutorial event can become high confidence after QA.
- Must QA first: install -> first_open mismatch before any scale or fraud claim.
- Cannot claim: product-market fit failed, creative thesis failed, or ROAS is final.
- Next action: one clean retest cell, fixed first-session proof, same promise, same budget cap.
```

Điểm quan trọng: cùng một report có thể cho phép **sửa onboarding** nhưng chưa cho phép **kill product**. Đây là khác biệt giữa metric literacy và đọc dashboard theo cảm xúc.

### Measurement acceptance gate

Trước khi Week 3/4 dùng metric làm successCriteria hoặc killCriteria, metric đó phải đi qua acceptance gate.

```text
Measurement acceptance gate - Calming Puzzle

Metric proposed for decision:
tutorial_complete used to decide whether first-session proof needs repair.

Source/window:
Game analytics, same build, first session, day 0.

Confidence:
High only after event QA confirms tutorial_start -> tutorial_complete order and no double-fire.

Decision allowed:
Repair tutorial length, first level pacing, early win timing.

Decision blocked:
Do not blame channel.
Do not kill product.
Do not scale/stop campaign solely from this event without acquisition context.

Upgrade requirement:
Segment by app_version/source_group and compare with level_3_complete + D1 direction.
```

Acceptance gate giúp success/kill criteria không bị nhét metric "có vẻ hợp lý" nhưng chưa đủ sạch. Với micro-budget, một metric chưa accepted vẫn có thể quan sát, nhưng chưa được dùng làm verdict.

---

## Measurement QA checklist

| Check | Pass condition |
| --- | --- |
| Metric owner | Mỗi metric có source owner: network/store/analytics/revenue |
| Window | Có cửa sổ đọc số: D0, D1, D3, D7 hoặc campaign day |
| Event QA | Event gameplay quan trọng có test trong build thật |
| Source naming | Campaign/ad/build/source naming đủ nối dữ liệu |
| Confidence label | Metric chính có High/Medium/Low/Unknown |
| Decision limit | Low-confidence data không được dùng để scale/kill lớn |
| Reconciliation rule | Có rule khi dashboards lệch |
| Privacy note | ATT/SKAN/Android privacy signal được ghi trong tracking risk |

Quality chain:

`privacy constraint -> source/window -> confidence label -> allowed decision -> next action`

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Privacy Sandbox Attribution Reporting hướng tới attribution bảo vệ quyền riêng tư cho advertising measurement. | Android plan cần chuẩn bị cho signal ít user-level hơn và cần đọc theo aggregation/window rõ hơn. | Không suy ra Android measurement vô dụng; nó vẫn hữu ích nếu decision scope đúng. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit) | Apple cung cấp framework attribution cho app advertising trong hệ sinh thái Apple. | iOS UA cần confidence/window language thay vì kỳ vọng raw journey đầy đủ. | Không dùng aggregated attribution để kết luận hành vi cá nhân. |
| [Apple App Tracking Transparency](https://developer.apple.com/documentation/AppTrackingTransparency) | ATT liên quan quyền user cho tracking qua app/web thuộc công ty khác. | Consent/tracking context ảnh hưởng dữ liệu marketing; UA plan phải ghi rủi ro signal loss. | Không xem ATT là việc legal tách rời measurement. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Google Play yêu cầu khai báo dữ liệu app thu thập/chia sẻ và mục đích. | SDK/event plan phải đi cùng data safety readiness, nhất là khi thêm analytics/ads SDK. | Không thêm tracking chỉ vì dashboard đẹp nếu không phục vụ decision. |

Readout worksheet:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Source có nói về privacy, attribution, consent hoặc data disclosure không? | Measurement design phải có risk note, không chỉ event list. | Không suy ra compliance hay signal quality từ một dòng docs duy nhất. |

---

## Common mistakes

- **Mistake - Correction:** "Network dashboard nói CPI rẻ nên scale."
  **Correction:** CPI cần đi với Store CVR, D1 và first-session proof trước khi tăng budget.

- **Mistake - Correction:** "Analytics và network không khớp nên data vô dụng."
  **Correction:** Reconcile source/window/event; nhiều quyết định nhỏ vẫn dùng được.

- **Mistake - Correction:** "SKAN/ATT là phần legal, không liên quan UA."
  **Correction:** Privacy signal quyết định campaign structure, event taxonomy và kill criteria.

- **Mistake - Correction:** "D0 ROAS xấu nên kill campaign."
  **Correction:** Ghi payback/ROAS window trước, đọc D0 như guardrail chứ không phải verdict cuối.

- **Mistake - Correction:** "Micro-budget đủ để kết luận product-market fit."
  **Correction:** Micro-budget chỉ đủ để kiểm một promise chain hoặc một risk cụ thể.

---

## English Terms You Should Keep

| Term | Nghĩa vận hành |
| --- | --- |
| Attribution | Gán conversion/revenue về nguồn traffic |
| ATT | Apple App Tracking Transparency |
| SKAN | SKAdNetwork-era attribution/reporting context |
| AdAttributionKit | Apple attribution framework cần hiểu cùng nhóm iOS attribution |
| Modeled conversion | Conversion được ước lượng/modeling, không phải raw user event |
| Confidence level | Nhãn High/Medium/Low/Unknown để giới hạn quyết định |
| Reconciliation | Đối chiếu dashboard theo source, window và event definition |

---

## Lab output example

```text
Measurement Risk Note - v1

Primary campaign decision:
- Should we continue testing the calming/satisfying promise after 3 days?

Source map:
- Ad network: spend, impressions, CTR, CPI. Confidence: Medium.
- Store: Store CVR. Confidence: Medium.
- Game analytics: first_open, tutorial_complete, level_3_complete, D1. Confidence: High after event QA.
- Revenue: ARPDAU, D3/D7 ROAS. Confidence: Low until cohort/window matures.

Dashboard mismatch rule:
- If network installs are >20% higher than analytics first_open, pause scale and QA source naming, SDK version, first_open event and consent path.

Allowed decisions:
- Medium confidence: iterate creative/store.
- High confidence gameplay event: fix onboarding/level proof.
- Low confidence ROAS: hold or collect more data.

Not allowed:
- Do not scale >2x from CPI alone.
- Do not kill product from modeled ROAS alone.
- Do not split more ad cells if aggregated signal is already too thin.

Measurement acceptance gate:
- Metric proposed for decision:
- Source/window:
- Current confidence:
- Decision allowed:
- Decision blocked:
- Upgrade requirement:
```

---

## Practical Lab

1. Chọn 6 metric quan trọng nhất cho micro soft-launch đầu tiên.
2. Với mỗi metric, ghi source owner, window, confidence và allowed decision.
3. Viết một dashboard mismatch rule.
4. Viết một list "not allowed decisions" cho low-confidence data.
5. Kiểm tra event taxonomy ngày 14 có đủ event high-confidence chưa.
6. Chọn 2 metric sẽ xuất hiện trong successCriteria/killCriteria và viết acceptance gate cho từng metric.
7. Copy note vào Final UA Plan.

Pass lab khi team nhìn note và biết khi nào được iterate, khi nào chỉ hold, khi nào phải QA event trước.

---

## Final UA Plan Update

Cập nhật field **tracking**:

```text
Measurement risk:
- Source map:
- High-confidence gameplay events:
- Medium-confidence platform metrics:
- Low-confidence delayed/modeled metrics:
- Dashboard reconciliation rule:
- Measurement acceptance gates:
- Decisions allowed by confidence level:
- Decisions not allowed from low-confidence data:
- Privacy/attribution notes for Android/iOS:
```

Cập nhật **successCriteria / killCriteria** bằng confidence language:

```text
Scale only if:
- acquisition signal is acceptable AND
- first-session events are QA''d AND
- retention floor is met in a clean cohort.

Do not kill product if:
- only modeled ROAS is weak,
- event QA is incomplete,
- install vs first_open mismatch is unresolved.
```

---

## Checklist Focus

- [ ] Mỗi metric quan trọng có source owner.
- [ ] Mỗi metric có window đọc số.
- [ ] Có confidence label cho metric dùng để quyết định.
- [ ] Có dashboard mismatch rule.
- [ ] Metric đưa vào successCriteria/killCriteria có measurement acceptance gate.
- [ ] Decision size khớp confidence level, không scale/kill từ signal unknown hoặc low.
- [ ] Low-confidence data không được dùng để scale/kill lớn.
- [ ] Tracking field trong Final UA Plan đã cập nhật.
- [ ] Android/iOS privacy attribution risk được ghi rõ.

---

## Curated References

- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/AdAttributionKit)
- [Apple App Tracking Transparency](https://developer.apple.com/documentation/AppTrackingTransparency)
- [Google Play Help - Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
', now()),
  ('lessons/day-14.md', 'markdown', null, '---
day: 14
title: "Event taxonomy for Unity games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Event taxonomy, Attribution, Cohort]
artifact: "Unity event taxonomy v1"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Unity event taxonomy v1** cho micro soft-launch: 8-12 event tối thiểu đủ để đọc acquisition quality, first-session proof, retention risk, ad pacing và light IAP signal.

Quyết định chính: **event nào đáng instrument ngay trong v1, event nào phải bỏ khỏi v1 dù dev thấy dễ log**. Với budget `$100-500`, taxonomy không cần trả lời mọi câu hỏi BI. Nó cần trả lời câu hỏi vận hành: ad promise có dẫn đúng người vào game, store proof có khớp first session, user drop ở đâu, và có nên tiếp tục mua traffic không.

Artifact này cập nhật field **tracking** trong Final UA Plan, đồng thời làm checklist chuẩn bị cho SDK/privacy pass ở Week 4.

## Why this matters

Unity dev thường log theo nơi code dễ bắt hook: button click, scene loaded, menu opened. Nhưng UA cần log theo nơi quyết định bị mù. Khi `D1` thấp, bạn không cần biết user đã bấm bao nhiêu UI nhỏ. Bạn cần biết họ có mở game, bắt đầu tutorial, hoàn thành loop đầu, gặp ad sớm, dùng hint, quay lại ngày sau hay không.

Nếu taxonomy quá mỏng, paid test chỉ tạo ra cảm giác "game không ổn" mà không biết sửa gì. Nếu taxonomy quá dày, team mất thời gian QA, dashboard nhiễu, privacy/data disclosure phức tạp hơn. Bài này dạy cách chọn lớp event đủ nhỏ để ship nhanh nhưng đủ sâu để ra quyết định.

Rule thực dụng: event v1 chỉ được vào nếu nó giúp một người trong team nói được câu "nếu số này xấu, tôi sẽ sửa phần này".

## Core model: decision-backward taxonomy

Đừng bắt đầu từ code hook. Bắt đầu từ quyết định:

`UA decision -> funnel question -> event -> minimum parameters -> QA proof -> dashboard readout -> next action`

Ví dụ:

- UA decision: có nên mua thêm traffic không?
- Funnel question: user từ ad/store có hoàn thành first-session proof không?
- Event: `first_open`, `tutorial_start`, `tutorial_complete`, `level_1_complete`, `session_start`.
- Minimum parameters: `app_version`, `platform`, `country`, `session_index`, `days_since_install`.
- QA proof: tester đi qua journey 5 phút và thấy event đúng thứ tự.
- Dashboard readout: cohort theo install date/source có drop ở stage nào.
- Next action: sửa store promise, tutorial, level pacing hoặc dừng campaign.

Một taxonomy tốt không phải là danh sách event dài. Nó là bản đồ những câu hỏi bạn thật sự dám dùng để ra quyết định trong soft-launch.

## Event taxonomy v1 mẫu

| Funnel question | Event | Minimum parameters | Decision supported | Owner |
| --- | --- | --- | --- | --- |
| User có mở game sau install không? | `first_open` | `app_version`, `platform`, `country` | Kiểm install-to-open mismatch hoặc build/store issue | Engineering |
| Đây là session thứ mấy? | `session_start` | `session_index`, `days_since_install`, `source_group` | Đọc retention và phân biệt same-day replay với return | Analytics |
| User có vào onboarding không? | `tutorial_start` | `entry_source`, `session_index` | Drop trước value proof | Product |
| User có hiểu onboarding không? | `tutorial_complete` | `duration_sec`, `attempt_count` | Tutorial clarity và time-to-fun | Product |
| Core loop có bắt đầu không? | `level_start` | `level_id`, `session_index` | Level pacing và content exposure | Design |
| User có thấy win/clear proof không? | `level_complete` | `level_id`, `duration_sec`, `moves_used` | First-session proof và difficulty | Design |
| User kẹt vì gì? | `level_fail` | `level_id`, `fail_reason` | Difficulty/friction diagnosis | Design |
| Hint có cứu friction không? | `hint_used` | `level_id`, `hint_type` | Hint economy và fail recovery | Design |
| Rewarded ad có value không? | `rewarded_ad_completed` | `placement`, `reward_type`, `session_time_sec` | Ads fit với player intent | Monetization |
| Interstitial có chen quá sớm không? | `interstitial_shown` | `placement`, `session_time_sec`, `session_index` | Ads pacing risk | Monetization |
| IAP có signal sớm không? | `purchase_complete` | `sku`, `price_usd`, `session_index` | Light IAP signal, không phải LTV proof | Monetization |

Không thêm vào v1 nếu chưa có quyết định rõ: `tile_clicked`, `settings_opened`, `skin_previewed`, `daily_popup_seen`, `button_hovered`. Những event này có thể hữu ích sau này, nhưng trong paid test đầu tiên chúng dễ làm dashboard rối hơn là giúp hành động.

### Event decision contract

Mỗi event trong v1 cần có một "quyền quyết định" rõ ràng. Nếu event chỉ tồn tại để team thấy dashboard đầy hơn, nó chưa đủ quyền vào v1. Contract bên dưới buộc team nối event với quyết định, evidence và hành động cụ thể.

| Event | Decision owner | Decision allowed when QA passes | Decision blocked until QA passes | Minimum proof |
| --- | --- | --- | --- | --- |
| `first_open` | Engineering / Analytics | Xác nhận install có biến thành open theo build/platform không | Không kết luận creative/store fail nếu open thấp | Event fire một lần sau fresh install, có `app_version`, `platform`, `country` |
| `tutorial_complete` | Product | Đánh giá ad/store promise có được chứng minh trong first session không | Không kill campaign vì "user không hiểu game" | `tutorial_start -> tutorial_complete` đúng thứ tự, có `duration_sec`, `attempt_count` |
| `level_complete` | Design | Đọc first-win proof và độ khó level 1-3 | Không chỉnh difficulty dựa vào completion rate nếu thiếu `level_id` | `level_start -> level_complete/level_fail` không double-fire |
| `rewarded_ad_completed` | Monetization | Đọc rewarded ad có fit với intent hay đang chen sai moment | Không kết luận ads tốt/xấu nếu thiếu placement/time | Có `placement`, `reward_type`, `session_time_sec`, không fire khi ad fail |
| `session_start` | Analytics | Đọc return/D1 direction theo install cohort | Không nói retention yếu nếu session index/days_since_install sai | `session_index` tăng đúng, `days_since_install` đúng theo cohort |

Thang authority nên dùng trong tracking sheet:

| Status | Ý nghĩa | Có được dùng cho UA decision không? |
| --- | --- | --- |
| Not instrumented | Event chưa có trong build | Không |
| Logged only | Event có log nhưng chưa QA journey | Không |
| QA pass | Event đúng trigger/order/parameter trong test build | Có điều kiện, chỉ cho readout nhỏ |
| Dashboard mapped | Event đã vào funnel/cohort chart đúng tên | Có, nếu chart trả lời đúng câu hỏi |
| Decision-approved | Owner đã ký event, readout và action boundary | Có, dùng được trong success/kill criteria |

Rule vận hành: metric chỉ được xuất hiện trong `successCriteria` hoặc `killCriteria` khi event nguồn đạt `Decision-approved`. Nếu chưa đạt, metric đó vẫn có thể theo dõi nội bộ nhưng không được dùng để scale/kill campaign.

## Sơ đồ decision-backward tracking

```text
[VISUAL PLACEHOLDER: Third-party image request - Decision-backward tracking flow]
Type: process flow / decision map.
Lesson section: Sơ đồ decision-backward tracking.
Visual brief: create a left-to-right flow showing how a UA decision becomes a funnel question, then an event, parameters, QA proof, dashboard readout, and next action.
Teaching job: help a Unity dev stop logging from code convenience and start logging from launch decisions.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Layer | Câu hỏi cần trả lời | Output phải có | Nếu thiếu layer này |
| --- | --- | --- | --- |
| Decision | Team đang định scale, iterate hay kill? | 1 quyết định cụ thể | Event trở thành "log cho có" |
| Funnel question | Drop có thể nằm ở ad/store/session nào? | 1 câu hỏi đo được | Dashboard không dẫn tới sửa gì |
| Event | Hành vi nào chứng minh câu hỏi? | Event name stable | Metric bị proxy quá xa |
| Parameter | Cần segment theo gì để không đọc sai? | 2-4 parameter thật cần | Không phân biệt source/build/cohort |
| QA proof | Event có fire đúng trong build không? | Test journey + expected order | Paid traffic tạo data rác |
| Readout | Dashboard có trả lời next action không? | Funnel/cohort/chart rõ | Số đẹp nhưng không vận hành được |

**Inspect:** đọc từ trái sang phải. Mỗi event phải trace ngược về một quyết định, không chỉ về một vị trí code.

**Conclude:** nếu một event không có `Decision` hoặc `Readout`, đưa nó ra backlog thay vì đưa vào v1.

**Do not infer:** bảng này không nói game chỉ được có 11 event mãi mãi; nó nói paid test đầu tiên cần tối giản để học nhanh.

## Event coverage heatmap

```text
[VISUAL PLACEHOLDER: Third-party image request - Event coverage heatmap]
Type: hero operating diagram.
Lesson section: Event coverage heatmap.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Stage | Required coverage | Green signal | Yellow signal | Red signal |
| --- | --- | --- | --- | --- |
| Open | `first_open`, `session_start` | Có app/source/build context | Có event nhưng thiếu source/build | Không phân biệt install và open |
| Promise proof | `tutorial_start`, `tutorial_complete` | Đo được start/completion/duration | Có complete nhưng thiếu duration | Chỉ biết user "đã vào game" |
| Core loop | `level_start`, `level_complete`, `level_fail` | Đo được level 1-3 và fail reason | Có complete rate nhưng thiếu fail reason | Không biết first-session proof có xảy ra |
| Friction relief | `hint_used` | Đo hint theo level và type | Có hint count tổng | Không biết hint cứu hay phá economy |
| Monetization | `rewarded_ad_completed`, `interstitial_shown`, `purchase_complete` | Có placement/time/session | Có revenue nhưng thiếu placement | Không biết monetization có phá retention |
| Privacy/QA | QA journey, no PII, consent note | Event pass trong build test | QA thủ công chưa lưu bằng chứng | Chạy paid traffic trước khi event đáng tin |

**Inspect:** heatmap không chấm theo "nhiều event", mà theo khả năng đọc stage.

**Conclude:** stage nào đỏ thì quyết định liên quan stage đó phải bị khóa trước khi tiêu tiền.

**Do not infer:** green không có nghĩa product tốt; nó chỉ có nghĩa measurement đủ sạch để đọc product.

## Hướng dẫn đọc số

| Metric pattern | Event cần tin | Diagnosis hợp lý | Next action |
| --- | --- | --- | --- |
| Installs có, `first_open` thấp | `first_open` QA pass, `app_version`, `platform` | Store/install/open mismatch, build issue hoặc tracking issue | Kiểm build, store path, SDK init trước khi sửa creative |
| `tutorial_start` cao, `tutorial_complete` thấp | `tutorial_start`, `tutorial_complete`, `duration_sec` | Tutorial dài, khó, hoặc không chứng minh promise | Rút tutorial, đưa first win sớm hơn, test lại nội bộ |
| `level_1_complete` ổn, D1 thấp | `session_start`, `days_since_install`, `level_complete` | First session hiểu được nhưng chưa có lý do quay lại | Thêm goal/progression sớm, calendar/reward không quá nặng |
| Rewarded watch có, D1 giảm | `rewarded_ad_completed`, placement/session context | Reward hoặc placement đang kéo hành vi sai | Đổi reward, delay placement, đọc cohort theo exposure |
| Revenue tool và event không khớp | `purchase_complete`, SKU, price, source revenue | SKU mapping/window/currency issue | QA revenue mapping trước khi tính LTV |

Đừng đọc từng metric riêng lẻ. Hãy đọc theo chuỗi:

`ad promise -> store proof -> first_open -> tutorial_complete -> level_1_complete -> session_start D1 -> monetization exposure`

Nếu chuỗi gãy ở đâu, sửa stage đó trước. Nếu chain đo chưa sạch, không kết luận product/creative.

### Event cutline ledger

Khi team tranh luận "event này có nên vào v1 không?", dùng cutline này thay vì cảm giác. Event được vào v1 khi nó có owner, câu hỏi, action và QA proof rõ. Event bị đưa sang backlog nếu chỉ làm dashboard trông đầy hơn.

| Candidate event | Decision it supports | Include in v1? | Reason | Backlog condition |
| --- | --- | --- | --- | --- |
| `first_open` | Install có biến thành open không | Yes | Gate đầu tiên của paid traffic | Không backlog |
| `tutorial_complete` | First-session proof có được thấy không | Yes | Gắn trực tiếp với ad/store promise | Không backlog |
| `level_3_complete` | Early depth có đủ không | Maybe | Hữu ích nếu level 1 quá dễ | Chỉ thêm khi level 1/2 không đủ phân biệt |
| `tile_clicked` | User tương tác từng ô ra sao | No | Quá gần implementation, khó ra UA action | Thêm sau khi cần level-design diagnosis sâu |
| `skin_previewed` | Cosmetic interest có không | No | Chưa liên quan paid test đầu nếu economy chưa test | Thêm khi có economy/storefront experiment |
| `interstitial_shown` | Ads có phá D1 không | Yes, if interstitial exists | Placement/time ảnh hưởng retention | Nếu build chưa có interstitial thì bỏ |

Launch gate: nếu một event có trong success/kill criteria nhưng chưa pass QA journey, criteria đó phải bị khóa. Ví dụ, không được dùng `tutorial_complete` để kill campaign nếu event đang fire trùng khi scene reload.

## Worked example: taxonomy cho Calming Hex Puzzle

Team chạy internal build cho một puzzle game thư giãn. Họ muốn biết có nên mở campaign Android nhỏ `$150` không.

Taxonomy hiện tại:

| Có event | Thiếu gì | Rủi ro đọc sai | Fix trước paid test |
| --- | --- | --- | --- |
| `first_open` | `app_version` | Không biết cohort thuộc build nào | Thêm build context |
| `level_start`, `level_complete` | `tutorial_start`, `tutorial_complete` | Không biết user drop trước level hay trong tutorial | Thêm onboarding events |
| `rewarded_ad_completed` | `placement`, `session_time_sec` | Không biết reward ad có xuất hiện quá sớm không | Thêm placement/time |
| `purchase_complete` | QA revenue mapping | Có thể tính sai light IAP signal | Test SKU sandbox |
| Không có `session_start` | `days_since_install` | Không đọc được D1 cohort đúng | Thêm session event |

Diagnosis: chưa nên chạy paid traffic. Game có thể đã playable, nhưng tracking chưa đủ để biết paid user gãy ở đâu. Một campaign nhỏ lúc này có thể chỉ tạo data không dùng được.

Verdict: dành 1 ngày instrument và QA 11 event v1, chạy 10-20 internal journeys, sau đó mới mở micro campaign. Tradeoff này đáng làm vì nếu paid test fail, team còn biết sửa creative/store/onboarding hay monetization.

### Second-pass measurement read

Đọc taxonomy như một hệ thống chống tự lừa:

1. **Có decision owner không?** Nếu không ai chịu trách nhiệm sửa khi số xấu, event đó chỉ tạo noise.
2. **Có parameter tối thiểu không?** Thiếu `app_version`, `source_group` hoặc `session_index` sẽ làm cohort lẫn nhau.
3. **Có QA evidence không?** Event valid trong dashboard chưa đủ; cần thấy đúng thứ tự trong journey thật.
4. **Có action boundary không?** Số xấu phải chỉ ra sửa ad/store/tutorial/level/ad pacing, không chỉ nói "game fail".

Decision memo cho ví dụ:

```md
Tracking decision memo
- Do not launch paid traffic today.
- Required before launch: add tutorial_start, tutorial_complete, session_start, app_version, placement/session_time parameters.
- QA proof: 10-20 internal journeys with saved event stream screenshots.
- Locked criteria: D1, tutorial_complete, rewarded_ad_completed cannot be used for decisions until QA passes.
- First paid readout: open -> tutorial_complete -> level_1_complete -> D1 direction, segmented by app_version/source_group.
```

### Event QA acceptance memo

Khi taxonomy đã có đủ event, vẫn chưa nên xem là xong. Cần một memo chấp nhận QA để phân biệt "đã log được" với "đủ sạch để dùng tiền thật".

```md
Event QA acceptance - Calming Hex Puzzle

Decision allowed after this pass:
- Start a $150 Android micro campaign only if first_open, session_start, tutorial_complete, level_complete and rewarded_ad_completed are Decision-approved.
- Read first paid cohort by app_version/source_group, but only as directional signal.

Events decision-approved:
- first_open: fresh install fires once, app_version/platform/country present.
- session_start: session_index and days_since_install verified across same-day replay and next-day simulation.
- tutorial_complete: order and duration_sec verified in 20 internal journeys.
- level_complete: level_id, duration_sec, moves_used verified for levels 1-3.

Events still blocked:
- purchase_complete: sandbox SKU maps inconsistently; do not use IAP signal in launch readout.
- interstitial_shown: placement timing not final; do not judge ad pacing yet.

Launch gate:
- Paid traffic can start only with a readout that excludes blocked events.
- Success/kill criteria must name which events are Decision-approved.
```

Điểm quan trọng: memo này không cần dài, nhưng phải ghi rõ quyết định nào được phép, quyết định nào bị khóa. Đây là lớp bảo vệ giúp team không dùng data bẩn để tự thuyết phục mình rằng product fail hoặc campaign fail.

## Unity implementation checklist

| Check | Pass condition |
| --- | --- |
| Naming | `snake_case`, ổn định qua build, không đặt theo tên scene/button tạm thời |
| Registration | Custom event được tạo/kiểm trong analytics dashboard hoặc pipeline tương ứng |
| Parameters | 2-4 parameter có decision value, không gửi PII |
| Versioning | Có `app_version` hoặc build context ở event/cấu hình chung |
| Trigger point | Event fire ở một hành vi thật, không fire trùng khi scene reload |
| QA journey | Tester có script 5 phút để trigger event theo thứ tự expected |
| Dashboard mapping | Mỗi event map tới một funnel/cohort/chart hoặc decision note |
| Privacy review | Parameter không mâu thuẫn Data safety/consent policy |

Pseudo-flow cho dev:

```text
For each event in taxonomy_v1:
  define purpose
  define trigger point
  define minimum parameters
  run QA journey
  compare expected order vs observed order
  only then use metric for UA decision
```

Quality chain: `event purpose -> implementation point -> QA proof -> dashboard readout -> UA decision`.

### Decision-approved event checklist

| Gate | Câu hỏi kiểm tra | Fail thì làm gì |
| --- | --- | --- |
| Purpose gate | Event này trả lời quyết định nào trong soft-launch? | Đưa ra backlog nếu không có decision owner |
| Trigger gate | Event fire ở đúng hành vi thật, không phụ thuộc scene reload? | Sửa trigger point trước khi QA dashboard |
| Parameter gate | Parameter đủ để phân đoạn build/source/cohort không? | Thêm parameter tối thiểu, không thêm PII |
| Order gate | Event order trong 5 phút đầu có khớp journey không? | Chạy lại internal journey, sửa double-fire/missing event |
| Readout gate | Dashboard có biến event thành funnel/cohort/action được không? | Chưa dùng trong paid readout |
| Authority gate | Owner đã ghi allowed/blocked decision chưa? | Không đưa metric vào success/kill criteria |

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Unity Analytics Custom Events](https://docs.unity.com/en-us/analytics/events/custom-event) | Unity yêu cầu custom event có naming hợp lệ và được tạo trong dashboard/Event Manager flow. | Event taxonomy cần naming ổn định, dashboard-aware, không chỉ là string rải trong code. | Không suy ra mọi event nên custom; standard events và tool-specific events vẫn có chỗ dùng. |
| [Unity Analytics Event Manager](https://docs.unity.com/en-us/analytics/events/event-manager) | Event Manager cho phép xem standard/custom events và trạng thái valid/invalid gần đây. | QA taxonomy phải kiểm event valid/invalid, không chỉ kiểm log console trong Unity Editor. | Không suy ra event valid là metric đủ để scale; valid chỉ là điều kiện measurement. |
| [Firebase Analytics Log events](https://firebase.google.com/docs/analytics/events) | Firebase mô tả events là cách hiểu user actions/system behavior và có auto/recommended/custom events. | Nếu dùng Firebase/GA4 song song, taxonomy nên ưu tiên event recommended/standard khi khớp và chỉ custom khi cần decision riêng. | Không copy nguyên danh sách recommended events vào game nếu không phục vụ soft-launch decision. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469) | Play Console yêu cầu khai báo data collection/sharing phù hợp. | Event parameters càng chi tiết càng cần cân nhắc privacy/disclosure; v1 nên tránh data không cần thiết. | Không biến Data safety thành việc cuối cùng; nó ảnh hưởng thiết kế taxonomy từ đầu. |

Screenshot/readout thay thế bằng QA evidence table:

| QA step | Expected event order | Evidence to save |
| --- | --- | --- |
| Fresh install, open game | `first_open` -> `session_start` | Screenshot Event Manager/Test dashboard có timestamp |
| Play tutorial to first win | `tutorial_start` -> `tutorial_complete` -> `level_start` -> `level_complete` | Row export hoặc screenshot event stream |
| Use hint and watch rewarded | `hint_used` -> `rewarded_ad_completed` | Placement/reward_type visible |
| Start next day/session simulation | `session_start(days_since_install=1)` | Cohort/session parameter verified |

**Inspect:** source official nói event phải được quản lý và kiểm trạng thái, không chỉ gửi string từ code.

**Conclude:** taxonomy v1 nên đi kèm QA evidence table trước paid traffic.

**Do not infer:** các nguồn không đưa benchmark retention/CPI; chúng chỉ hỗ trợ cách thiết kế và kiểm event.

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Log mọi click vì "sau này chắc cần". | Chỉ đưa vào v1 event có decision owner và next action rõ. |
| Đặt event theo scene/button hiện tại. | Đặt theo hành vi ổn định: `level_complete`, `hint_used`, `rewarded_ad_completed`. |
| Thiếu `app_version` hoặc build context. | Gắn version để không trộn cohort giữa build khác nhau. |
| Dùng parameter quá chi tiết. | Giữ parameter tối thiểu, tránh PII và giảm Data safety risk. |
| Tin số dashboard trước khi QA journey. | Paid decision chỉ được phép sau khi event order và parameter pass QA. |
| Đọc monetization mà thiếu placement/time. | Ads/IAP event phải có context để biết revenue đến từ moment nào trong session. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Event taxonomy` | Tên chuẩn cho hệ event đo lường có cấu trúc |
| `Custom event` | Event tự định nghĩa khi standard/recommended event không đủ |
| `Parameter` | Thuộc tính đi kèm event để segment/diagnose |
| `Cohort` | Nhóm user theo install date/source/build để đọc retention |
| `QA` | Kiểm event fire đúng trước khi tin dashboard |
| `PII` | Personally identifiable information, cần tránh trong event v1 |
| `Event Manager` | Surface để quản lý/kiểm trạng thái event trong analytics tool |

## Lab output example

```md
Unity event taxonomy v1 - Calming Hex Puzzle

Primary decisions:
- Ad/store promise có tạo first-session proof không?
- Tutorial có gây drop trước level 1 không?
- Ads có chen quá sớm và ảnh hưởng D1 không?

Required events:
1. first_open(app_version, platform, country)
2. session_start(session_index, days_since_install, source_group)
3. tutorial_start(entry_source, session_index)
4. tutorial_complete(duration_sec, attempt_count)
5. level_start(level_id, session_index)
6. level_complete(level_id, duration_sec, moves_used)
7. level_fail(level_id, fail_reason)
8. hint_used(level_id, hint_type)
9. rewarded_ad_completed(placement, reward_type, session_time_sec)
10. interstitial_shown(placement, session_time_sec, session_index)
11. purchase_complete(sku, price_usd, session_index)

Excluded from v1:
- tile_clicked: no immediate UA decision
- menu_opened: not needed for first paid test
- skin_previewed: cosmetic intent can wait until economy test

QA plan:
- 10 fresh install journeys on Android internal build.
- Save event stream screenshots for open, tutorial, level, ad, purchase sandbox.
- Do not launch paid traffic until event order and parameters pass.

Event authority:
- Decision-approved now: first_open, session_start, tutorial_start, tutorial_complete, level_start, level_complete, level_fail, hint_used, rewarded_ad_completed.
- Logged only: interstitial_shown, because placement timing is not final.
- QA blocked: purchase_complete, because sandbox SKU mapping needs one more pass.

Blocked decisions:
- Do not judge IAP intent in the first paid readout.
- Do not tune interstitial pacing from paid users until placement/time parameters are verified.
- Do not use D1 as kill criteria unless session_start and days_since_install remain clean in the paid cohort.

Measurement release certificate:
- Decision-approved events:
- Logged-only events:
- QA-blocked events:
- Decisions unlocked:
- Decisions still blocked:
- Launch gate owner/date:
```

## Practical Lab

1. Viết 5 UA decisions bạn muốn đọc trong soft-launch.
2. Với mỗi decision, viết funnel question tương ứng.
3. Chọn 8-12 event v1, mỗi event có owner, trigger point và minimum parameters.
4. Gạch bỏ ít nhất 5 event "nice to have" và ghi lý do chưa đưa vào v1.
5. Viết QA journey 5 phút đầu game: expected event order và evidence cần lưu.
6. Gán authority status cho từng event: Not instrumented, Logged only, QA pass, Dashboard mapped hoặc Decision-approved.
7. Viết 3 quyết định bị khóa nếu event chưa sạch. Ví dụ: "không dùng D1 để kill campaign nếu `session_start` chưa QA".
8. Copy taxonomy, authority status và blocked decisions vào Final UA Plan.
9. Viết Measurement release certificate trước paid launch.

## Final UA Plan Update

Cập nhật field **tracking**:

```md
Tracking / Event taxonomy v1
- Primary decisions:
- Required events:
- Minimum parameters:
- Events intentionally excluded:
- QA journey:
- Dashboard readout:
- Event authority status:
- Decision-approved metrics:
- Blocked decisions while QA is incomplete:
- QA acceptance owner/date:
- Privacy/Data safety notes:
- Launch gate: paid traffic starts only after event QA passes.
- Measurement release certificate:
```

Liên kết với field **successCriteria** và **killCriteria**: chỉ dùng metric làm criteria nếu event tạo ra metric đó đã pass QA.

## Checklist Focus

- [ ] Taxonomy v1 có 8-12 event, không phải 30+ event.
- [ ] Mỗi event trace được tới một UA/product decision.
- [ ] Mỗi parameter có lý do segment/diagnosis rõ.
- [ ] Không gửi PII hoặc parameter không cần thiết.
- [ ] Event order đã QA trong journey 5 phút.
- [ ] Mỗi event có authority status rõ, không lẫn "logged" với "decision-approved".
- [ ] Success/kill criteria chỉ dùng metric từ event đã decision-approved.
- [ ] Blocked decisions đã ghi rõ để team không over-read data bẩn.
- [ ] Tracking field trong Final UA Plan đã cập nhật.
- [ ] Paid traffic bị khóa nếu event QA chưa pass.
- [ ] Measurement release certificate tách decisions unlocked và still blocked.

## Curated References

- [Unity Analytics: Create a custom event](https://docs.unity.com/en-us/analytics/events/custom-event)
- [Unity Analytics: Event Manager](https://docs.unity.com/en-us/analytics/events/event-manager)
- [Firebase Analytics: Log events](https://firebase.google.com/docs/analytics/events)
- [Google Analytics recommended events](https://developers.google.com/analytics/devguides/collection/ga4/reference/events)
- [Google Play Console: Data safety](https://support.google.com/googleplay/android-developer/answer/10787469)
', now()),
  ('lessons/day-15.md', 'markdown', null, '---
day: 15
title: "Creative hooks from player motivation"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Creative testing, CTR, IPM]
artifact: "Hook bank"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Hook bank** cho puzzle game: 6-10 hook được nhóm theo player motivation, mỗi hook có promise, proof asset, expected metric signal và failure action.

Quyết định chính: **hook nào đáng đưa vào creative matrix đầu tiên, hook nào phải bỏ dù nghe hấp dẫn vì game/store chưa chứng minh được**.

Artifact này cập nhật field **creativeMatrix**, **audience** và **successCriteria** trong Final UA Plan. Output không phải "20 câu headline". Output là một bảng quyết định giúp bạn mua ít traffic hơn nhưng học rõ hơn.

## Why this matters

Creative hook là lời hứa đầu tiên người chơi nhìn thấy. Với puzzle game, cùng một board có thể kể nhiều lời hứa khác nhau:

- "Only one move saves this board" đánh vào **Challenge**.
- "Clear the chaos in one combo" đánh vào **Satisfaction**.
- "A quiet puzzle break before sleep" đánh vào **Relaxation**.

Nếu bạn trộn các motivation này trong một ad, `CTR`, `IPM`, store `CVR` và first-session behavior sẽ khó đọc. Bạn không biết người chơi click vì tò mò, vì muốn thư giãn, vì thích combo đã mắt, hay vì tưởng game có meta progression.

Với budget `$100-500`, hook bank phải giảm số biến trong test đầu. Bài này giúp bạn không hỏi "hook nào hay nhất?", mà hỏi "hook nào tạo ra signal dễ đọc nhất và game/store có thể chứng minh thật nhất?".

## Core model: motivation promise proof signal

Hook tốt là một hypothesis về động cơ người chơi:

`player motivation -> hook promise -> visual proof -> store continuity -> first-session proof -> metric signal -> next action`

5 motivation thường gặp trong mobile puzzle:

| Motivation | Player wants | Hook shape | Proof needed |
| --- | --- | --- | --- |
| Challenge | Chứng minh mình thông minh | "Can you solve this?" | Board có tension và solution rõ |
| Satisfaction | Nhìn cleanup/combo đã mắt | "Clear the chaos" | Before/after payoff thật |
| Relaxation | Nghỉ nhẹ, ít áp lực | "A calm puzzle break" | No timer, soft pacing, clean UX |
| Mastery | Tối ưu nước đi, tiến bộ | "Find the smarter move" | Choice, replay, score, elegance |
| Progression | Mở khóa, sưu tập, hoàn thành | "Unlock new boards" | Meta/progression thật trong game |

Không có motivation nào mặc định tốt hơn. Chỉ có motivation **khớp hoặc không khớp** với game hiện tại.

## Hook bank mẫu

| Hook ID | Motivation | Hook promise | Proof asset | Expected signal | Failure action |
| --- | --- | --- | --- | --- | --- |
| H1 | Challenge | "One move saves this board" | Near-fail board, one elegant move | `CTR`/`IPM` có thể cao, watch `CVR` | Nếu `CVR` thấp, làm store screenshot chứng minh challenge rõ hơn |
| H2 | Challenge | "Most players miss this clean move" | 2-choice board state | Curiosity click, risk overpromise | Nếu tutorial drop, giảm độ "trick" trong promise |
| H3 | Satisfaction | "Clear the chaos in one combo" | Messy-to-clean animation | Balanced `CTR` + better first-session fit | Nếu `CTR` thấp, tăng payoff ở 2 giây đầu |
| H4 | Satisfaction | "Watch the board breathe again" | Before/after clear with calm pacing | Strong store continuity | Nếu `IPM` thấp, sharpen opening frame |
| H5 | Relaxation | "A quiet puzzle break before sleep" | No timer, gentle input, soft board | Lower attention, better D1 direction if true | Nếu D1 không tốt, relax promise không thật |
| H6 | Mastery | "Find the smarter move" | 2 options, one efficient path | Quality installs, longer session | Nếu click thấp, make decision moment more obvious |
| H7 | Progression | "Unlock a calmer board set" | Collection/meta preview | Store `CVR` only if meta exists | If product lacks meta, remove from first test |

First creative matrix nên chọn 3-4 hook có proof thật nhất, không chọn tất cả.

### Hook test contract

Trước khi đưa hook vào creative matrix, viết contract ngắn để tránh biến test thành cuộc thi câu chữ.

| Contract field | Câu hỏi phải trả lời | Ví dụ cho puzzle |
| --- | --- | --- |
| Motivation lane | Hook này test động cơ nào, chỉ một động cơ chính? | Satisfaction: muốn thấy board bừa bộn được dọn sạch |
| Promise | Người chơi được hứa trải nghiệm gì trong 1-2 giây đầu? | "Clear the chaos in one combo" |
| Proof chain | Ad, store và first session chứng minh promise bằng gì? | Clip combo clear, screenshot before/after, level 1 có payoff thật |
| Success read | Pattern nào cho thấy hook đáng test tiếp? | CTR vừa đủ, Store CVR không gãy, tutorial_complete không giảm |
| Failure read | Pattern nào cho thấy phải sửa hoặc loại? | CTR cao nhưng CVR/D1 gãy là overpromise |
| Frozen surfaces | Những gì không được đổi trong test này? | Cùng store screenshot, cùng build, cùng region, cùng tutorial |

Contract này giúp team phân biệt **hook đẹp tai** với **hook có thể học được**. Một hook nghe rất hay nhưng không có proof chain là nợ sản xuất, không phải candidate sạch cho micro-budget.

## Hook motivation operating map

```text
[VISUAL PLACEHOLDER: Third-party image request - Hook motivation operating map]
Type: hero operating diagram.
Lesson section: Hook motivation operating map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Step | Challenge lane | Satisfaction lane | Relaxation lane | Mastery lane | Progression lane |
| --- | --- | --- | --- | --- | --- |
| Promise | Solve the tense board | Clean the mess | Take a calm break | Choose the smarter move | Unlock/complete something |
| Opening frame | Threatened board | Messy board | Quiet board | Two choices | Reward/progression preview |
| Store proof | Screenshot shows real puzzle tension | Screenshot shows combo payoff | Screenshot shows calm UX | Screenshot shows depth | Screenshot shows actual meta |
| First-session proof | Level 1 has readable challenge | First win feels satisfying | No early pressure/ad spam | Player sees better move logic | Unlock appears early |
| Readout | `CTR`, `IPM`, tutorial drop | `CVR`, tutorial complete | D1 direction, session length | level repeat/complete | `CVR`, progression engagement |

**Inspect:** mỗi lane giữ một motivation riêng, một promise riêng và một proof asset riêng.

**Conclude:** hook đáng test là hook có đủ ad proof, store proof và first-session proof.

**Do not infer:** một lane nhiều metric hơn không có nghĩa tốt hơn; nó chỉ có nhiều chỗ để đọc mismatch hơn.

## Hook signal board

```text
[VISUAL PLACEHOLDER: Third-party image request - Hook signal board]
Type: data visual/chart or decision board.
Lesson section: Hook signal board.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Signal pattern | Likely meaning | Bad conclusion to avoid | Next action |
| --- | --- | --- | --- |
| `CTR` high, store `CVR` low | Hook bắt mắt nhưng store không chứng minh promise | "Hook thắng, tăng budget" | Rewrite screenshots/video to continue promise |
| `CTR` low, `CVR` and tutorial complete good | Motivation đúng nhưng opening frame yếu | "Hook fail" | Keep motivation, remake first 2 seconds |
| `IPM` high, D1 weak | Ad/store overpromise product experience | "Creative team did well, product bad" | Check first-session proof and promise mismatch |
| Challenge hook wins click, relax hook wins retention | Two distinct player motivations | "Average them together" | Split cells; choose based on objective |
| Progression hook gets `CVR`, but tutorial confused | Store promised meta before core loop | "Add more meta in ads" | Delay progression hook until product proof is stronger |
| All hooks unreadable | Too many variables changed | "Need more ads" | Rebuild matrix: one motivation, one promise, one proof per cell |

**Inspect:** không đọc `CTR` một mình. Đọc attention -> install -> store -> first session.

**Conclude:** hook test đầu tiên nên tối ưu learning clarity, không tối ưu vanity winner.

**Do not infer:** bảng này không đưa benchmark universal; pattern phải đọc theo game, channel, geo và asset quality.

## Hướng dẫn đọc số

Đọc hook theo chuỗi:

`creative hook -> store proof -> install quality -> tutorial_complete -> level_1_complete -> D1 direction`

| Metric | Nó nói gì | Nó không nói gì | Khi xấu thì làm gì |
| --- | --- | --- | --- |
| `CTR` | Opening frame/text có kéo attention không | User có đúng motivation không | Sửa 2 giây đầu, không vội sửa product |
| `IPM` | Creative có biến impression thành install không | Store/product có giữ user không | Check store continuity và install path |
| Store `CVR` | Store page có chứng minh ad promise không | First session có deliver promise không | Sửa screenshot/video/caption store |
| `tutorial_complete` | User có hiểu first-session proof không | D1 có tốt không | Rút onboarding, đưa payoff sớm hơn |
| D1 direction | Promise có tạo lý do quay lại không | Hook cụ thể nào thắng nếu attribution mờ | Đọc theo cohort và creative cell nếu có |

Decision rule: chỉ scale hook khi **ít nhất hai tầng sau click** không phản bội promise. Ví dụ `CTR` tốt nhưng store `CVR` thấp là lỗi continuity, chưa phải winner.

### Hook priority ledger

Trước khi đưa hook vào creative matrix, chấm từng hook theo 4 câu hỏi vận hành. Mục tiêu không phải tìm câu chữ "nghe hay", mà tìm hook ít làm nhiễu bài test nhất.

| Gate | Câu hỏi kiểm tra | Pass | Warning |
| --- | --- | --- | --- |
| Motivation clarity | Hook đang gọi đúng một động cơ chính hay trộn nhiều động cơ? | Một hook = một motivation chính | "Relaxing challenge with progression rewards" quá nhiều promise |
| Proof availability | Ad, store và first session có bằng chứng thật cho promise không? | Có clip/screenshot/level 1 chứng minh được | Chỉ có ý tưởng art hoặc feature chưa build |
| Metric readability | Nếu hook fail, team biết đọc fail ở tầng nào không? | Có expected signal + failure action | Chỉ ghi "CTR tốt là thắng" |
| Product fit | Hook có kéo đúng người chơi mà game hiện tại giữ được không? | First-session payoff khớp lời hứa | Click rẻ nhưng tutorial/drop/D1 xấu |

Nếu một hook fail ở **Proof availability**, đừng đưa vào test đầu dù cả team thích nó. Nếu fail ở **Metric readability**, viết lại hypothesis trước khi quay asset. Nếu fail ở **Product fit**, hook có thể để sau roadmap, không nên dùng để mua traffic hiện tại.

### Proof-debt filter

Một hook có thể bị loại không phải vì ý tưởng yếu, mà vì **proof debt** quá cao. Proof debt là khoảng cách giữa lời hứa trong creative và bằng chứng hiện có trong ad/store/game.

| Proof debt level | Dấu hiệu | Quyết định |
| --- | --- | --- |
| Low | Hook có thể quay bằng gameplay hiện tại, store có screenshot match, level 1 deliver payoff | Đưa vào first matrix |
| Medium | Ad quay được nhưng store hoặc level 1 cần chỉnh nhỏ | Cho vào backlog hoặc test nếu chỉnh được trước launch |
| High | Hook hứa meta/progression/social/reward chưa có trong build | Loại khỏi test đầu |
| Dangerous | Hook tạo click bằng claim sai, IP/copy competitor, hoặc promise không thể deliver | Không dùng |

Rule: micro-budget nên mua tín hiệu từ hook `low proof debt` trước. Hook `high proof debt` có thể là roadmap idea, nhưng nếu đem vào UA test quá sớm, bạn đang đo khoảng cách giữa quảng cáo và sản phẩm chứ không đo market motivation.

## Worked example: Calming Hex Puzzle hook bank

Game giả định: puzzle lục giác nhẹ, không timer, có combo clear và hint.

First draft của team có 10 hook, nhưng chỉ 4 hook có proof thật:

| Candidate | Keep? | Why |
| --- | --- | --- |
| "One move saves this board" | Keep | Có board near-fail thật, dễ quay clip 3 giây |
| "Clear the chaos in one combo" | Keep | Có payoff rõ trong core loop |
| "A quiet puzzle break before sleep" | Keep | Pacing/no timer khớp product |
| "Find the smarter move" | Keep as mastery variant | Có thể dùng 2-choice board |
| "Unlock a cozy island" | Cut | Game chưa có meta island |
| "Compete with friends" | Cut | Không có social proof |
| "Win real rewards" | Cut | Sai product, rủi ro policy/trust |

Mini test outcome giả định:

| Hook | Pattern | Diagnosis | Decision |
| --- | --- | --- | --- |
| Challenge | `CTR` high, store `CVR` medium, tutorial drop medium | Hook mạnh nhưng first level hơi khó | Keep, simplify tutorial board |
| Satisfaction | `CTR` medium, store `CVR` good, tutorial complete good | Best promise-product fit | Make 2 more variants |
| Relaxation | `CTR` low, D1 direction better | Audience nhỏ hơn nhưng fit hơn | Keep for retention-oriented cell |
| Mastery | Low attention, high level completion among installers | Opening not obvious | Remake first frame, not kill motivation yet |

Verdict: first creative matrix nên có 3 cells: Challenge, Satisfaction, Relaxation. Progression bị khóa cho đến khi game có meta proof thật.

### Second-pass hook read

Đọc lại outcome theo thứ tự ngược để tránh bị `CTR` làm lệch quyết định:

1. **First-session proof:** người chơi có thấy đúng payoff mà hook hứa không? Nếu không, hook đang bán nhầm experience.
2. **Store continuity:** screenshot/video đầu tiên có nối tiếp promise không? Nếu không, sửa store trước khi kết luận hook sai.
3. **Install quality:** `IPM` cao nhưng tutorial drop cao là overpromise, không phải winner sạch.
4. **Attention:** `CTR` chỉ được dùng để chọn variant mở đầu khi các tầng sau không phản bội promise.

Decision memo cho ví dụ này:

```md
Hook decision memo
- Scale candidate: Satisfaction, vì attention vừa đủ và proof chain sạch nhất.
- Repair candidate: Challenge, vì attention tốt nhưng first-session difficulty cần mềm hơn.
- Keep as niche: Relaxation, vì attention thấp hơn nhưng retention direction có thể hữu ích.
- Hold: Progression, vì product chưa có meta proof thật.
- Next asset request: 2 combo payoff clips + 1 calmer no-timer clip, không request progression art.
```

Creative production ticket cho hook Satisfaction:

```md
Creative production ticket - H3 Satisfaction

Motivation:
Satisfaction - player wants to see messy board become clean.

Hook promise:
"Clear the chaos in one combo."

Required asset:
3-5 second gameplay clip. Frame 1 shows cluttered board. Frame 2 shows the chosen move. Frame 3 shows clear payoff.

Store continuity:
Screenshot 1 must show the same before/after payoff, not a generic menu or feature list.

First-session proof:
Level 1 or level 2 must let player experience one clean combo within the first minute.

Expected signal:
CTR may be lower than clickbait challenge, but Store CVR and tutorial_complete should be cleaner.

Failure action:
If CTR is weak but downstream is clean, remake opening frame.
If CTR is strong but downstream breaks, reduce promise intensity or inspect store mismatch.

Frozen surfaces:
Do not change build, region, tutorial, or store layout during the first read.
```

Asset ticket càng cụ thể, bên làm creative càng ít phải tự đoán. Với indie team, đoán sai ở creative brief thường đắt hơn một lần viết ticket cẩn thận.

### Hook release memo

Trước khi đưa hook vào creative matrix, viết memo ngắn để xác nhận hook đã đủ proof và đủ điều kiện sản xuất. Memo này giúp team không lấy hook nghe hay nhưng proof debt cao vào test đầu.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Hook status | release, repair, hold hay cut? | Một trạng thái duy nhất |
| Proof debt | low, medium, high hay dangerous? | high/dangerous không vào first matrix |
| Evidence needed | Asset nào phải có trước launch? | ad proof, store proof, first-session proof |
| Blocked conclusions | Test này không được kết luận gì? | không gọi audience/product winner từ `CTR` alone |
| Production owner | Ai làm asset, deadline nào? | owner/date rõ |
| Readout plan | Metric nào đọc hook sau launch? | attention + store + first-session |

```text
Hook release memo
- Hook:
- Status:
- Proof debt:
- Evidence needed:
- Blocked conclusions:
- Production owner/date:
- Readout plan:
```

Memo tốt giúp creative backlog bớt "đầy ý tưởng" và trở thành một queue có quyền ưu tiên. Hook nào chưa đủ proof thì không bị xóa khỏi trí nhớ team; nó được giữ ở trạng thái repair/hold với điều kiện quay lại.

## Hook quality checklist

| Check | Pass condition |
| --- | --- |
| One motivation | Hook map về đúng một motivation chính |
| Promise visible | Người xem hiểu promise trong 1-2 giây đầu |
| Product truth | Game thật có thể deliver promise trong first session |
| Store continuity | Screenshot/video đầu tiên tiếp tục promise từ ad |
| Metric hypothesis | Có expected pattern cho `CTR`, `IPM`, `CVR`, first-session metric |
| Failure action | Nếu signal xấu, biết sửa ad, store hay product |
| IP/IP risk | Không copy competitor art, character, exact board hoặc claim |

Quality chain: `motivation -> hook -> proof asset -> store proof -> first-session proof -> metric readout -> next action`.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play dùng feature graphic, screenshots, short description và video để showcase app trên listing/promotional surfaces. | Hook trong ad cần store asset tiếp lời hứa; nếu không, click attention dễ biến thành store `CVR` thấp. | Không suy ra mọi hook cần cùng loại asset; proof tùy promise. |
| [Meta Creative Guidance Navigator](https://www.facebook.com/business/news/introducing-creative-guidance-navigator-data-backed-best-practices) | Meta mô tả creative guidance như các best practices bite-sized/data-backed để cải thiện creative. | Creative testing nên được thiết kế như học có cấu trúc: message, visual, pacing, audience response. | Không copy trend/format máy móc nếu motivation không khớp game. |
| [Apple App Store screenshots and app previews](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots/) | Apple mô tả screenshots/app previews dùng để visually communicate app user experience. | Store proof không chỉ là trang trí; nó phải giúp user hiểu experience sau khi click ad. | Không suy ra store screenshot có thể hứa feature chưa có trong first session. |

Ad-to-store readout:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Ad opening frame | Motivation và promise có rõ trong 1-2 giây không? | Nếu mơ hồ, `CTR` thấp chưa nói motivation sai. | Không đánh giá hook chỉ bằng câu chữ. |
| Store screenshot 1 | Screenshot có tiếp tục cùng promise không? | Nếu ad nói combo mà store chỉ show menu/meta, continuity gãy. | Không dùng screenshot đẹp nhưng không chứng minh promise. |
| First session | Tutorial/level 1 có deliver payoff không? | Nếu product không deliver, `IPM` tốt vẫn nguy hiểm. | Không scale vì click rẻ nếu D1 direction yếu. |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Viết nhiều hook nhưng không nhóm theo motivation. | Nhóm theo Challenge/Satisfaction/Relaxation/Mastery/Progression trước khi viết biến thể. |
| Test câu chữ khác nhau nhưng visual/store/product cũng đổi toàn bộ. | Mỗi cell chỉ nên có một learning variable chính. |
| Dùng challenge hook cho game relax không có tension thật. | Hứa đúng experience; attention rẻ không đáng nếu retention fail. |
| Hứa progression khi game chưa có meta proof. | Khóa progression hook cho đến khi store và first session chứng minh được. |
| Chỉ đọc `CTR`. | Đọc thêm `IPM`, store `CVR`, tutorial_complete và D1 direction. |
| Copy competitor execution. | Học pattern, không copy art/IP/board/claim cụ thể. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Hook` | Lời hứa mở đầu creative |
| `Creative testing` | Test message/visual/pacing để học signal |
| `CTR` | Attention signal: click-through rate |
| `IPM` | Installs per mille, signal kết hợp attention và install efficiency |
| `CVR` | Conversion rate ở store/click/install path |
| `Creative matrix` | Bảng test biến thể creative có cấu trúc |
| `Proof asset` | Asset chứng minh promise: clip, screenshot, board state, payoff |

## Lab output example

```md
Hook bank - Calming Hex Puzzle

Chosen motivations:
1. Challenge: player wants to solve a tense board.
2. Satisfaction: player wants a clean combo payoff.
3. Relaxation: player wants a low-pressure break.

First test hooks:
- H1 Challenge: "One move saves this board"
  Proof asset: near-fail board with one elegant clear.
  Store proof: screenshot 1 shows the same board tension.
  Expected signal: higher CTR/IPM, watch store CVR and tutorial drop.
  Failure action: simplify opening board or reduce challenge promise.

- H3 Satisfaction: "Clear the chaos in one combo"
  Proof asset: before/after combo clear.
  Store proof: short video/screenshot shows real payoff.
  Expected signal: balanced CTR/CVR/tutorial_complete.
  Failure action: increase visual payoff in first 2 seconds.

- H5 Relaxation: "A quiet puzzle break before sleep"
  Proof asset: no timer, calm board, soft pacing.
  Store proof: screenshot sequence avoids pressure/timer language.
  Expected signal: lower CTR, better D1 direction if promise is true.
  Failure action: remove relax promise if first-session pacing is not calm.

Excluded:
- Progression hook because meta unlock is not ready.
- Social challenge hook because no friend/leaderboard proof.

Hook test contract:
- H3 Satisfaction tests one motivation: satisfying cleanup.
- Promise: clear visible chaos in one combo.
- Proof chain: ad clip -> store before/after screenshot -> first-session combo payoff.
- Success read: acceptable attention plus clean CVR/tutorial_complete.
- Failure read: if attention weak, remake opening; if downstream weak, inspect promise mismatch.
- Frozen surfaces: build, region, store layout and tutorial stay stable.

Production ticket:
- Asset: 3-5 second before/move/after combo clip.
- Store continuity: screenshot 1 mirrors the same combo payoff.
- First-session proof: first minute includes one clear payoff.

Hook release memo:
- Hook:
- Status:
- Proof debt:
- Evidence needed:
- Blocked conclusions:
- Production owner/date:
- Readout plan:
```

## Practical Lab

1. Viết 10 hook thô cho game của bạn.
2. Gắn mỗi hook vào đúng 1 motivation chính.
3. Với mỗi hook, ghi proof asset trong ad, store proof và first-session proof.
4. Xóa hook không có proof thật trong build hiện tại.
5. Chọn 3 hook cho first creative matrix.
6. Viết expected metric pattern và failure action cho từng hook.
7. Viết hook test contract cho từng hook được chọn.
8. Chấm proof debt: low, medium, high hoặc dangerous.
9. Viết creative production ticket cho ít nhất một hook để designer/video editor không phải tự đoán promise.
10. Viết Hook release memo cho 3 hook được chọn.

## Final UA Plan Update

Cập nhật field **creativeMatrix**:

```md
Creative hook bank:
- Motivation groups:
- Hooks selected for first test:
- Hook test contract:
- Proof debt level:
- Proof asset required:
- Creative production ticket:
- Hook release memo:
- Store continuity check:
- First-session proof:
- Expected metric signal:
- Failure action:
- Frozen surfaces:
```

Cập nhật field **audience** bằng motivation, không chỉ demographic:

```md
Audience hypothesis:
- Players who want [motivation]
- They respond to [hook promise]
- The game proves it through [proof asset / first-session proof]
```

Cập nhật field **successCriteria**:

```md
Hook success is not CTR alone.
Winner must show acceptable ad attention + store continuity + first-session proof.
```

## Checklist Focus

- [ ] Có ít nhất 6 hook, nhóm theo motivation.
- [ ] Mỗi hook có proof asset trong ad/store/game.
- [ ] Hook được chọn có hook test contract.
- [ ] Hook có proof debt cao bị loại khỏi first matrix.
- [ ] Có creative production ticket cho hook ưu tiên.
- [ ] Có Hook release memo cho hook vào first matrix.
- [ ] First test chỉ chọn 3-4 hook dễ đọc.
- [ ] Mỗi hook có expected signal và failure action.
- [ ] Frozen surfaces rõ để không đổi quá nhiều biến cùng lúc.
- [ ] Store screenshot/video đầu tiên tiếp tục ad promise.
- [ ] Creative matrix, audience và successCriteria trong Final UA Plan đã cập nhật.

## Curated References

- [Google Play: Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Meta: Introducing Creative Guidance Navigator](https://www.facebook.com/business/news/introducing-creative-guidance-navigator-data-backed-best-practices)
- [Apple Developer: Upload app previews and screenshots](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots/)
- [Google Ads Best Practices](https://support.google.com/google-ads/answer/6154846)
', now()),
  ('lessons/day-16.md', 'markdown', null, '---
day: 16
title: "Video, static and playable concepts"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Playable ad, Creative testing, IPM]
artifact: "Format selection matrix"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Format selection matrix** cho 3-5 hook creative đầu tiên của game puzzle mobile. Artifact này giúp bạn quyết định hook nào nên test bằng `static`, hook nào cần `short video`, và khi nào mới đáng làm `playable concept`.

Quyết định chính: **chọn format rẻ nhất nhưng vẫn chứng minh đúng lời hứa của hook**.

Kết quả cần có:
- Mỗi hook có một format test phù hợp với mức độ cần chứng minh.
- Mỗi format ghi rõ nó có thể chứng minh điều gì và không chứng minh được điều gì.
- Mỗi format có metric đọc chính: `CTR`, `CVR`, `IPM`, `D1`, hoặc first-session depth.
- Final UA Plan được cập nhật ở phần **Creative matrix** và **Production scope**.

---

## Why this matters

Với ngân sách `$100-500`, sai format có thể làm hỏng toàn bộ vòng học. Nếu bạn làm playable quá sớm, tiền sản xuất ăn hết tiền test. Nếu bạn chỉ dùng static cho một hook cần motion, bạn có thể kết luận sai rằng hook yếu, trong khi thật ra format chưa đủ sức chứng minh gameplay.

Team indie thường mắc bẫy: thấy các studio lớn dùng video đẹp hoặc playable polished rồi cố bắt chước ngay. Cách đọc đúng cho micro soft-launch là: format không phải để "làm ad cho hay", mà để trả lời một câu hỏi vận hành cụ thể.

Chuỗi cần bảo vệ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Nếu format không chứng minh được mắt xích đầu tiên, mọi metric phía sau đều khó debug.

---

## Core model: format là mức độ chứng minh promise

Đừng hỏi "format nào performance tốt nhất?". Hãy hỏi:

> Hook này cần chứng minh bằng ảnh tĩnh, chuyển động, hay tương tác?

| Format | Chứng minh tốt | Không chứng minh tốt | Khi nên dùng |
| --- | --- | --- | --- |
| **Static** | Visual promise, board state, before/after, style, clarity của một ý tưởng | Flow chuyển động, cảm giác thao tác, độ thỏa mãn của combo | Test hook rẻ, test store-like promise, test angle đầu tiên |
| **Short video** | Motion clarity, satisfying moment, sequence trước và sau hành động | Người chơi có thật sự muốn thao tác không | Hook cần thấy hành động như clear, sort, merge, explode |
| **Playable concept** | Interaction promise, "tôi chạm vào là hiểu", friction của điều khiển | Retention dài hạn, monetization, full game quality | Chỉ làm khi static/video đã có tín hiệu và core interaction là lý do mua traffic |

Quy tắc thực hành:

1. Nếu hook có thể hiểu trong 1 khung hình, bắt đầu bằng static.
2. Nếu hook cần thấy thay đổi trạng thái, dùng short video.
3. Nếu hook phụ thuộc vào cảm giác tự tay thao tác, mới cân nhắc playable.

### Format readiness gate

Trước khi chọn format, hãy hỏi 4 gate này. Gate giúp team không dùng format đắt để che một hook chưa rõ.

| Gate | Câu hỏi | Static đủ khi | Cần video/playable khi |
| --- | --- | --- | --- |
| Promise clarity | Người xem có hiểu lời hứa trong một frame không? | Board state, outcome hoặc mood đọc được ngay | Cần thấy trước/sau hoặc thao tác mới hiểu |
| Proof debt | Ad/store/game đã có bằng chứng thật cho promise chưa? | Screenshot hoặc gameplay hiện tại đã chứng minh được | Cần quay sequence mới hoặc cần interaction slice |
| Learning risk | Nếu signal yếu, team biết sửa surface nào không? | Biết sửa hook/crop/store screenshot | Không biết fail vì motion, input hay product |
| Production affordability | Chi phí asset có để lại đủ tiền media test không? | Static/video nhẹ vẫn để lại budget học | Playable ăn mất phần lớn ngân sách test |

```text
Format readiness = promise clarity + proof debt + learning risk + production affordability
```

Nếu readiness thấp, đừng escalate format. Hãy sửa hook, proof chain hoặc production scope trước. Format đắt hơn chỉ đáng làm khi nó trả lời câu hỏi mà format thấp hơn không thể trả lời.

---

## Format selection matrix mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Format selection matrix mẫu]
Type: hero operating diagram.
Lesson section: Format selection matrix mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


Điền bảng này trước khi sản xuất asset:

| Hook | Player promise | Format chọn | Vì sao format này đủ | Metric chính | Nếu tín hiệu yếu thì sửa gì |
| --- | --- | --- | --- | --- | --- |
| "Clear chaos in one smart move" | Người chơi thấy board rối rồi được dọn sạch | Short video | Cần thấy trước, hành động, sau | `CTR`, `IPM`, first-session clear event | Sửa 3 giây đầu hoặc làm rõ board state |
| "A calm 2-minute puzzle break" | Nghỉ não nhẹ, không áp lực | Static hoặc short video nhẹ | Một screenshot sạch có thể chứng minh mood | `CTR`, store `CVR`, D1 | Sửa store screenshot hoặc tutorial friction |
| "Can you solve this one move?" | Thử thách trí tuệ nhanh | Static trước, video nếu cần | Board state phải đủ đọc trong ảnh | `CTR`, `CVR`, retry rate | Giảm clickbait, làm challenge công bằng hơn |
| "Drag the screws out" | Cảm giác tháo gỡ bằng tay | Playable concept sau khi video có tín hiệu | Interaction là promise chính | `IPM`, playable completion, install quality | Sửa input friction hoặc quay lại video |

Framework này dùng để ra quyết định production: bạn không sản xuất asset vì "thiếu format", bạn sản xuất vì một hook cần bằng chứng ở cấp độ đó.

### Production scope contract

Mỗi format được chọn cần một contract nhỏ trước khi gửi đi sản xuất.

| Contract field | Ý nghĩa | Ví dụ |
| --- | --- | --- |
| Proof job | Format này phải chứng minh điều gì? | Video phải chứng minh board chuyển từ chaos sang clear payoff |
| Minimum viable asset | Asset nhỏ nhất đủ học là gì? | 1 video 6-8s, 1 hook, 1 opening, không cần 5 end cards |
| Frozen surfaces | Những gì phải giữ nguyên để đọc được kết quả? | Cùng store screenshot, cùng build, cùng country, cùng tutorial |
| Escalation trigger | Khi nào mới nâng format? | Static có CTR/CVR đủ sạch nhưng câu hỏi tiếp theo là motion |
| De-escalation trigger | Khi nào phải quay về format rẻ hơn? | Playable có completion cao nhưng install quality hoặc D1 yếu |

Contract này làm rõ format không phải "level cao hơn" của creative. Nó là công cụ bằng chứng. Nếu proof job chỉ là "nhìn board có hấp dẫn không", static có thể đủ. Nếu proof job là "combo có thỏa mãn không", video hợp lý hơn. Nếu proof job là "người chơi có muốn tự kéo/thả không", playable mới có quyền xuất hiện.

---

## Operating diagram: chọn format theo độ cần chứng minh

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: chọn format theo độ cần chứng minh]
Type: data visual/chart or decision board.
Lesson section: Operating diagram: chọn format theo độ cần chứng minh.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Hook idea
  |
  v
Can the promise be understood in one frame?
  | yes -> Static test -> read CTR + Store CVR
  | no
  v
Does the promise need motion/change of state?
  | yes -> Short video -> read CTR + IPM + first-session proof
  | no
  v
Does the promise depend on touch/interactivity?
  | yes -> Playable concept only after video/static signal
  | no -> Rewrite hook, because the proof job is unclear
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Format tăng dần theo chi phí và độ chứng minh: static -> video -> playable | Playable không phải bước mặc định, mà là bước sau khi hook cần interaction proof | Không suy ra playable luôn tốt hơn video hoặc static |
| Mỗi nhánh gắn với một metric đọc khác nhau | Format choice quyết định bạn sẽ debug creative, store hay first session | Không dùng một metric duy nhất để so sánh mọi format |

---

## Data visual: cost of learning by format

:::chart
title: Relative production cost and proof strength, 1-5
Static|1|Low production cost, proves visual promise
Short video|3|Medium cost, proves motion and sequence
Playable concept|5|High cost, proves interaction but can overpromise
:::

| Format | Relative cost | Proof strength | Micro-budget rule |
| --- | ---: | ---: | --- |
| Static | 1/5 | 2/5 | Dùng để loại hook mơ hồ trước khi tốn công quay video |
| Short video | 3/5 | 4/5 | Dùng cho 2-3 hook mạnh nhất cần chứng minh motion |
| Playable concept | 5/5 | 5/5 | Chỉ dùng khi interaction là hook chính và đã có tín hiệu trước |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Playable có proof strength cao nhưng cost cũng cao | Trong micro soft-launch, playable là công cụ xác nhận, không phải công cụ khám phá đại trà | Không dùng chart này như benchmark giá sản xuất cố định |

---

## Hướng dẫn đọc số

Đọc format test theo câu hỏi format đó được thiết kế để trả lời:

| Metric pattern | Cách đọc | Next action đúng | Next action sai |
| --- | --- | --- | --- |
| Static có `CTR` thấp | Hook hoặc visual promise chưa đủ rõ trong một khung hình | Viết lại promise, đổi crop, làm board state dễ đọc hơn | Chuyển ngay sang playable để "cứu" hook |
| Static `CTR` ổn, store `CVR` thấp | Ad promise hấp dẫn nhưng store không xác nhận promise | Sửa icon, first screenshot, short description | Kết luận audience sai |
| Video `CTR` cao, D1 thấp | Motion gây tò mò nhưng first-session proof không giữ lời | Kiểm tra tutorial, level 1-3, difficulty spike | Scale vì video hút click |
| Playable completion cao, install quality thấp | Playable vui hơn hoặc khác game thật | Làm playable trung thực hơn hoặc sửa game first session | Giữ playable fake vì IPM đẹp |

Với budget nhỏ, đọc `IPM` như tín hiệu tổng hợp của ad + store. Nhưng đừng dùng `IPM` để bỏ qua chất lượng người chơi. Nếu `IPM` ổn mà D1 hoặc level depth thấp, bạn đang mua curiosity, không phải motivation fit.

Format escalation ledger:

| Current signal | Format decision | Why | Next production request |
| --- | --- | --- | --- |
| Static có `CTR` yếu và promise đã rõ trong một frame | Stay static or rewrite hook | Motion không sửa được motivation mơ hồ | Rewrite promise/crop/board state trước khi làm video |
| Static có `CTR` ổn nhưng store `CVR` yếu | Do not escalate format yet | Store proof có thể là leak, không phải ad format | Sửa screenshot 1/copy với cùng promise |
| Static có `CTR` và `CVR` ổn, nhưng hook cần transformation proof | Escalate to short video | Uncertainty tiếp theo là before/after sequence | Làm một video 6-8s, giữ hook/store ổn định |
| Short video có `IPM` mạnh nhưng D1 yếu | Do not make playable yet | Promise có thể đang mua curiosity user | Kiểm tra first-session proof và promise honesty |
| Short video có `CTR/CVR/D1` nhất quán và interaction là core promise | Consider playable concept | Câu hỏi còn lại là touch/friction, không phải attention | Làm playable slice nhỏ khớp gameplay thật |
| Playable completion cao nhưng install quality thấp | De-escalate or rebuild playable | Playable có thể vui hơn hoặc khác game thật | Làm playable trung thực hơn hoặc quay lại video |

Decision rule:

```text
Escalate format only when the next unanswered question requires a higher proof level.
Do not escalate because the previous asset performed badly.
Do not keep a high-cost format if it creates better ad metrics but worse player quality.
```

Format choice phải bảo vệ learning budget. Static dùng cho clarity, video dùng cho sequence, playable dùng cho interaction truth. Nếu câu hỏi thật là store continuity hoặc first-session proof, đổi format có thể là sai lever.

Format change log:

```md
Format change log
- Hook:
- Previous format:
- New format:
- Reason for change:
- Question the old format could not answer:
- Surface kept stable:
- Metric that will confirm the change helped:
```

Nếu không điền được dòng "question the old format could not answer", việc đổi format có thể chỉ là phản ứng cảm tính với số xấu.

### Format production release memo

Trước khi asset được sản xuất hoặc format được escalate, viết memo này. Nó khóa lý do format được chọn và điều gì format đó không được phép chứng minh.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Selected format | Static, short video hay playable? | Một format chính |
| Proof job | Format phải chứng minh điều gì? | visual clarity, motion, transformation, interaction |
| Minimum viable asset | Asset nhỏ nhất đủ học là gì? | không làm full production nếu 6s video đủ |
| Blocked conclusions | Format không được kết luận gì? | retention, LTV, product fit nếu chỉ test attention |
| Escalation trigger | Khi nào nâng format? | câu hỏi cũ không trả lời được bằng format thấp hơn |
| De-escalation trigger | Khi nào quay lại format rẻ hơn? | format đắt tạo vanity metric nhưng quality yếu |

```text
Format production release memo
- Hook:
- Selected format:
- Proof job:
- Minimum viable asset:
- Blocked conclusions:
- Escalation trigger:
- De-escalation trigger:
- Owner/date:
```

Memo này giúp team nói "chúng ta cần video vì phải chứng minh before/after motion", thay vì "video chắc performance tốt hơn". Với micro-budget, lý do sản xuất phải là lý do học.

---

## Worked example: chọn format cho 3 hook puzzle

Giả sử game của bạn là block puzzle có một khoảnh khắc clear board rất thỏa mãn.

| Hook | Format test | Kết quả giả định | Diagnosis | Quyết định |
| --- | --- | --- | --- | --- |
| "Clear chaos in one smart move" | 8s video | `CTR` 2.8%, store `CVR` 31%, D1 ổn | Video chứng minh được motion, store cũng khớp promise | Giữ hook, làm 2 biến thể mở đầu khác nhau |
| "Only 1% can solve this" | Static | `CTR` 4.1%, store `CVR` 13%, D1 yếu | Curiosity trap: click cao nhưng promise có mùi clickbait | Giảm lời hứa, thêm proof challenge công bằng |
| "Drag blocks into perfect order" | Playable concept | Completion cao, install quality thấp | Playable đang vui hơn game thật hoặc khác core loop | Không scale, sửa game/input trước |

Verdict: format thắng không phải format có `CTR` cao nhất. Format thắng là format tạo được tín hiệu nhất quán qua `ad -> store -> first session`.

Second-pass format read:

| Hook | First read | Hidden risk | Better decision |
| --- | --- | --- | --- |
| Clear chaos | Video ổn qua ad/store/D1 | Có thể vẫn hỏng nếu store screenshot không khớp video | Giữ video, làm 2 opening variants, giữ store proof aligned |
| Only 1% | Static kéo click tốt | Challenge promise có thể là curiosity trap, không phải motivation fit | Rewrite claim trước khi escalate sang video |
| Drag blocks | Playable completion đẹp | Playable có thể overpromise so với input/game feel thật | Rebuild playable cho khớp first session hoặc pause playable spend |

Decision memo:

```text
Keep:
- Clear chaos as short video; next test changes opening only.

Revise before escalation:
- Only 1% challenge; fix promise honesty and store proof before video.

Hold:
- Playable concept until real game interaction and playable interaction match.
```

Điểm sâu: escalation không phải phần thưởng cho hook thắng. Escalation là câu trả lời cho câu hỏi "cần bằng chứng cao hơn ở đâu?". Nếu câu hỏi chưa rõ, format đắt hơn chỉ làm noise đẹp hơn.

---

## Production and quality checklist

Trước khi sản xuất asset, kiểm tra chuỗi chất lượng:

| Check | Câu hỏi pass/fail |
| --- | --- |
| Promise honesty | Asset có đang hứa đúng gameplay thật không? |
| Proof fit | Format có đủ để chứng minh promise không? |
| Store continuity | First screenshot hoặc preview video trên store có xác nhận hook không? |
| First-session proof | Level 1-3 có cho người chơi trải nghiệm đúng điều ad hứa không? |
| Metric plan | Bạn đã biết đọc metric nào để quyết định tiếp theo chưa? |
| Production scope | Bạn có đang sản xuất nhiều hơn mức cần học không? |

Quality chain verification:

`hook -> format -> store asset -> level 1-3 -> metric -> next action`

Nếu một mắt xích không rõ, đừng tăng ngân sách.

Production brief template:

```md
Creative production brief

Hook:

Selected format:

Proof job:

Required frames / beats:
1.
2.
3.

Store continuity:

First-session proof:

Frozen surfaces:

Primary metric:

Weak-signal action:

Do not include:
```

Trường `Do not include` quan trọng hơn vẻ ngoài của brief. Nó ngăn asset team thêm logo dài, meta chưa có, effect không tồn tại trong game, hoặc playable interaction khác first session chỉ vì thấy "hấp dẫn hơn".

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Google Play preview video và screenshots

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nói screenshots nên thể hiện trải nghiệm in-game thật, còn preview video nên cho thấy giá trị và trải nghiệm thật sớm trong video. | Store assets là phần tiếp nối của creative format. Nếu ad dùng video để hứa motion, store preview/screenshot đầu phải xác nhận motion hoặc gameplay state tương ứng. | Không suy ra rằng cứ thêm video là store `CVR` sẽ tăng. Video sai promise vẫn có thể làm CVR kém hơn. |
| Google Play khuyến nghị video game tập trung vào core features sớm, trong khoảng đầu video. | Với puzzle game, video test nên đưa satisfying move hoặc board transformation vào sớm, không mở đầu bằng logo dài. | Không dùng quy tắc này như benchmark giây tuyệt đối cho mọi game. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Icon, first screenshot, preview video có cùng promise không | Store continuity là điều kiện để đọc `CVR` công bằng | Không kết luận ad traffic kém khi store chưa chứng minh cùng promise |

### Usecase 2: Apple Product Page Optimization

Nguồn: [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple cho phép thử nhiều treatment trên product page để đo page nào convert tốt hơn. | Store page có thể được xem như một phần của creative testing, không phải asset tĩnh sau cùng. | Không suy ra Android-first team cần làm iOS experiment ngay trong micro test đầu tiên. |
| Treatment có thể thay đổi screenshots, app previews và icon. | Nếu hook video thắng nhưng store yếu, next action hợp lý là sửa store proof trước khi đổi audience. | Không dùng store experiment để che một ad promise không trung thực. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Làm playable ngay vì nghe "playable ads perform tốt" | Chỉ làm playable khi hook phụ thuộc vào cảm giác tương tác và static/video đã có tín hiệu đủ tốt |
| So sánh static, video, playable bằng một metric duy nhất | Đọc mỗi format theo proof job của nó: static đọc clarity, video đọc motion/IPM, playable đọc interaction quality |
| Video mở đầu bằng logo, menu, hoặc meta screen | Đưa core action hoặc before/after promise vào rất sớm |
| Playable khác game thật để tăng completion | Playable phải trung thực với first-session proof, nếu không install quality sẽ nhiễu |
| Sản xuất quá nhiều biến thể cùng lúc | Với budget nhỏ, test ít cell hơn nhưng mỗi cell có câu hỏi rõ hơn |

---

## English Terms You Should Keep

- **Static ad**: Creative dạng ảnh tĩnh, dùng để test visual promise rẻ.
- **Short video**: Video ngắn chứng minh motion, sequence, before/after.
- **Playable ad**: Creative cho người xem tương tác thử, phù hợp khi interaction là promise chính.
- **IPM**: Installs per Mille, số install trên 1000 impressions.
- **Creative testing**: Quy trình test hook/format/variant để học điều gì kéo người chơi phù hợp.
- **Store proof**: Bằng chứng trên store xác nhận lời hứa của ad.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Hook | Clear chaos in one smart move |
| Format | Short video, 8 seconds |
| Why this format | Cần thấy board rối, một move, và board clear |
| Store proof | First screenshot là before/after board clear |
| First-session proof | Level 2 tạo một clear moment trong 90 giây đầu |
| Primary metric | `IPM`, store `CVR`, level depth |
| Weak signal action | Nếu `CTR` ổn nhưng D1 thấp, sửa level 1-3 trước khi scale |
| Production note | Chưa làm playable cho tới khi video có tín hiệu ổn |
| Readiness gate | Motion proof needed, production cost acceptable, store proof available |
| Frozen surfaces | Same build, same first screenshot, same market, same tutorial |
| Format change log | Static skipped because one frame cannot prove before/after payoff |
| Format production release memo | Proof job, minimum asset, blocked conclusions, escalation/de-escalation trigger |

Card preview:

```text
Creative format card
Hook: Clear chaos in one smart move
Format: Short video
Proof job: Show transformation
Metric: IPM + store CVR + first-session clear
Next action if weak: Fix proof chain, not audience first
Frozen: store screenshot, build, tutorial
```

---

## Practical Lab

1. Chọn 3 hook mạnh nhất từ creative backlog.
2. Với mỗi hook, ghi rõ promise cần chứng minh.
3. Chọn format thấp nhất đủ chứng minh promise: static, short video, hoặc playable concept.
4. Ghi metric đọc chính và một weak-signal action.
5. Kiểm tra lại store proof và first-session proof tương ứng.
6. Điền format readiness gate cho từng hook trước khi sản xuất.
7. Viết production scope contract cho asset tốn công nhất.
8. Nếu đổi format sau test, viết format change log trước khi làm asset mới.
9. Viết Format production release memo cho asset được sản xuất.

Quality chain check:

- Ad promise có thật trong game không?
- Store proof có xác nhận cùng promise không?
- Level 1-3 có cho người chơi thấy promise đó không?
- Metric đọc có phân biệt được creative issue, store issue và game issue không?
- Format được chọn có phải format thấp nhất đủ chứng minh promise không?
- Production brief có ghi rõ frozen surfaces và `Do not include` không?
- Release memo có blocked conclusions và trigger escalate/de-escalate không?

---

## Final UA Plan Update

Cập nhật các field sau trong Final UA Plan:

```text
Creative matrix:
- Hook:
- Selected format:
- Proof job:
- Format readiness:
- Minimum viable asset:
- Store proof:
- First-session proof:
- Frozen surfaces:
- Primary metric:
- Weak signal action:
- Format production release memo:

Production scope:
- Assets to produce this week:
- Assets intentionally delayed:
- Reason for delaying playable:
- Format change log, if any:
```

Không ghi "test video/static/playable". Hãy ghi format theo hook và proof job.

---

## Checklist Focus

- Chọn format rẻ nhất nhưng vẫn chứng minh đúng hook.
- Không làm playable nếu chưa rõ interaction là promise chính.
- Mỗi format có một metric đọc chính và một next action.
- Format readiness gate đã pass trước khi sản xuất.
- Production scope contract có proof job, minimum asset, frozen surfaces.
- Format production release memo có blocked conclusions.
- Store proof và first-session proof phải khớp với ad promise.
- Nếu đổi format, format change log giải thích câu hỏi mới cần chứng minh.
- Production scope đủ nhỏ để `$100-500` còn tiền học từ media spend.

---

## Curated References

- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
', now()),
  ('lessons/day-17.md', 'markdown', null, '---
day: 17
title: "Creative test matrix"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Creative testing, CTR, CVR]
artifact: "Creative test matrix v1"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Creative test matrix v1**: một bảng test nhỏ nhưng đọc được, dùng để quyết định hook nào nên giữ, hook nào cần sửa, và hook nào phải bỏ trước khi bước vào soft-launch.

Quyết định chính: **trong mỗi test cell, chỉ thay đổi một biến lớn để kết quả còn đọc được**.

Kết quả cần có:
- 3 hook chính, mỗi hook có 2 variant có kiểm soát.
- Mỗi row có learning goal, primary metric và next action rõ.
- Không còn backlog creative kiểu "làm thêm vài video cho đủ".
- Final UA Plan được cập nhật ở field **Creative matrix v1** và **Creative decision rules**.

---

## Why this matters

Creative testing với budget nhỏ rất dễ thành random testing. Nếu mỗi variant đổi cả hook, style, CTA, camera angle và gameplay moment, bạn sẽ không biết thắng vì điều gì. Khi đó `CTR` cao chỉ tạo cảm giác vui, không tạo quyết định sản phẩm.

Với `$100-500`, mục tiêu không phải tìm "winner tuyệt đối". Mục tiêu là loại bỏ các promise sai, tìm 1-2 motivation đáng test tiếp, và bảo vệ tiền khỏi những cell không thể đọc.

Chuỗi cần giữ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

Creative matrix tốt giúp bạn biết khi nào sửa creative, khi nào sửa store, và khi nào sửa game.

---

## Core model: one learning question per cell

Một creative cell tốt trả lời một câu hỏi duy nhất:

> Nếu cell này thắng hoặc thua, mình biết phải làm gì tiếp không?

| Cell type | Câu hỏi học | Biến được thay đổi | Metric đọc chính |
| --- | --- | --- | --- |
| Hook test | Motivation nào hút đúng người chơi hơn? | Promise/hook | `CTR`, `IPM`, store `CVR` |
| Opening test | 3 giây đầu nào làm người xem hiểu nhanh hơn? | Opening frame/sequence | `CTR`, thumbstop nếu có, `IPM` |
| Proof test | Store/game proof nào giữ promise tốt hơn? | Store proof hoặc first-session proof | `CVR`, D1, level depth |
| CTA/copy test | Câu chữ nào giảm hiểu nhầm? | CTA hoặc caption | `CTR`, `CVR` |

Không trộn nhiều cell type trong cùng một test nhỏ.

---

## Creative test matrix mẫu

```text
[VISUAL PLACEHOLDER: Third-party image request - Creative test matrix mẫu]
Type: hero operating diagram.
Lesson section: Creative test matrix mẫu.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Hook family | Variant A | Variant B | One variable changed | Learning goal | Primary metric | Next action |
| --- | --- | --- | --- | --- | --- | --- |
| Satisfying clear | Starts with messy board | Starts with near-clear board | Opening state | Board state nào dễ hiểu hơn? | `CTR`, `IPM` | Giữ opening thắng, làm 2 visual variants |
| Relax | Calm colors, no timer | Calm colors, soft timer visible | Pressure cue | Có nên nhấn "no pressure" không? | `CTR`, D1 | Nếu timer làm D1 yếu, bỏ pressure cue |
| Challenge | "Can you solve this?" | "Find the perfect move" | Copy framing | Challenge có bị clickbait không? | `CTR`, `CVR`, D1 | Nếu CTR cao CVR thấp, giảm curiosity copy |

Decision gates cho moi row:

| Gate | Evidence pattern | Decision | Production request |
| --- | --- | --- | --- |
| Keep | `CTR/IPM` tot hon baseline, store `CVR` khong gay, D1 khong xau di | Giu hook family | Lam 1-2 variants chi doi opening/proof |
| Revise creative | `CTR` yeu nhung store/D1 tu installs con khoe | Sua ad execution | Doi first 2 seconds, crop, caption, pacing |
| Fix store proof | `CTR` tot nhung `CVR/IPM` yeu | Sua store/listing proof | Screenshot 1-3 phai match ad promise |
| Rewrite promise | `CTR` tot, `CVR` yeu, D1 yeu lap lai | Hook co nguy co curiosity trap | Viet lai motivation, khong reskin asset |
| Pause | sample nho, spend lech, tracking conflict | Khong ket luan | Reconcile setup truoc khi production them |

Gate rule: mot cell chi duoc len production request khi no co `evidence pattern + decision + owner + next variant`. Neu chi co "asset nay dep", row do chua phai learning cell.

Điều quan trọng: mỗi row thay đổi một biến lớn. Nếu A và B khác cả hook, visual, CTA và gameplay moment, kết quả không còn dùng được.

### Production brief gate

Matrix tốt không dừng ở việc chọn winner. Nó phải biến kết quả thành **creative production brief** đủ rõ để artist/editor làm đúng variant tiếp theo mà không đoán.

Trước khi gửi yêu cầu sản xuất, mỗi winning row phải qua 4 câu hỏi:

| Gate | Câu hỏi | Pass nếu | Fail thì |
| --- | --- | --- | --- |
| Learning clarity | Row này học được điều gì cụ thể? | Có một câu học rõ: opening, promise, proof hoặc copy | Viết lại learning goal |
| Funnel integrity | Winner có giữ được store proof và first-session proof không? | `CTR/IPM` không thắng bằng cách làm hỏng `CVR` hoặc D1 | Sửa promise/proof trước |
| Next variant logic | Variant tiếp theo thay đổi biến nào? | Có 1-2 biến nhỏ được phép đổi | Không sản xuất thêm asset |
| Budget discipline | Test tiếp theo cần bao nhiêu cell? | Giảm hoặc giữ số cell; không phình backlog | Cắt bớt hook yếu |

Creative request nên viết theo format:

```text
Production brief
- Hook family:
- Evidence pattern:
- Decision:
- Keep unchanged:
- Change one thing:
- Store proof required:
- First-session proof required:
- Stop rule for next test:
```

Nếu production brief không điền được, row đó chưa đủ chín để làm thêm video. Với budget nhỏ, "sản xuất thêm" chỉ đúng khi nó làm giảm uncertainty, không phải khi team thấy cần nhiều asset hơn cho đẹp backlog.

---

## Operating diagram: creative test flow

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: creative test flow]
Type: data visual/chart or decision board.
Lesson section: Operating diagram: creative test flow.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Backlog hooks
  |
  v
Group by motivation
  |
  v
Pick 3 hook families
  |
  v
Create 2 controlled variants per family
  |
  v
Run small test
  |
  v
Read pattern:
  CTR only? -> creative curiosity
  CTR + CVR? -> ad/store fit
  CTR + CVR + D1? -> stronger motivation fit
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Matrix đi từ motivation đến controlled variants | Test tốt bắt đầu bằng grouping, không bắt đầu bằng sản xuất ngẫu nhiên | Không suy ra variant thắng là "winner forever" |
| Metric đọc theo tầng funnel | `CTR` chỉ là cửa đầu, không đủ để scale | Không bỏ qua store/game chỉ vì ad click tốt |

---

## Chart: interpretability vs number of changed variables

:::chart
title: Interpretability drops when variants change too much, 1-5
One variable changed|5|Easy to diagnose
Two variables changed|3|Usable but cautious
Three or more variables changed|1|Hard to know why it won
:::

| Variant design | Interpretability | Micro-budget decision |
| --- | ---: | --- |
| Chỉ đổi opening frame | 5/5 | Tốt cho test nhanh |
| Đổi opening + caption | 3/5 | Chấp nhận nếu ghi rõ tradeoff |
| Đổi hook + gameplay + style + CTA | 1/5 | Không nên dùng cho learning test |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Càng nhiều biến đổi, càng khó biết lý do thắng | Budget nhỏ cần cell dễ đọc hơn cell đẹp | Không hiểu chart như luật cấm mọi thay đổi sáng tạo |

---

## Hướng dẫn đọc số

| Pattern | Diagnosis | Next action |
| --- | --- | --- |
| `CTR` cao, `CVR` thấp, D1 thấp | Hook gây tò mò nhưng promise yếu hoặc clickbait | Sửa hook/store proof, không scale |
| `CTR` vừa, `CVR` cao, D1 ổn | Hook ít ồn ào nhưng fit tốt hơn | Làm thêm variant quanh motivation này |
| `CTR` thấp, D1 cao từ installs ít | Game giữ chân được, ad truyền tải chưa tốt | Sửa opening hoặc format, không bỏ game loop |
| `CTR` cao, `IPM` thấp | Click có nhưng install không theo | Kiểm tra store screenshot, app name, short description |
| Hai variant khác nhau quá nhiều | Kết quả không đọc được | Chạy lại test với biến kiểm soát rõ hơn |

Đừng dùng `CTR` như bảng xếp hạng sáng tạo. Với puzzle game, `CTR` cao từ curiosity có thể làm bạn mua nhầm người chơi không muốn ở lại.

Decision depth: trước khi chọn winner, hãy đọc mỗi cell qua 4 lớp.

| Lớp đọc | Câu hỏi cần trả lời | Nếu câu trả lời chưa rõ |
| --- | --- | --- |
| Signal quality | Cell có đủ impression/click/install tối thiểu để không bị nhiễu quá mạnh không? | Không kết luận winner; chỉ ghi là directional signal |
| Spend fairness | Hai variant có được phân phối tương đối công bằng không? | Không so sánh trực tiếp; kiểm tra setup campaign/ad set |
| Promise fit | Ad promise có được store proof và first session xác nhận không? | Sửa proof chain trước khi sản xuất thêm creative |
| Decision usefulness | Kết quả dẫn đến action cụ thể nào? | Row chưa đạt chuẩn learning cell, cần viết lại câu hỏi học |

Một cách đọc thực tế:

```text
If signal is weak -> label as directional, do not scale.
If CTR wins but CVR/D1 loses -> diagnose promise mismatch.
If CTR loses but D1 wins -> improve communication, do not kill the loop.
If metrics conflict -> choose the action that preserves the promise chain.
```

Micro-budget rule: kết quả tốt nhất không phải là cell có số đẹp nhất, mà là cell làm giảm uncertainty nhiều nhất cho quyết định tiếp theo.

### Budget allocation read

Với `$100-500`, bạn không có quyền đọc mọi cell như nhau. Matrix cần rule phân bổ tiền trước khi test để tránh winner giả do một variant được delivery quá nhiều hoặc quá ít.

| Situation | Cách đọc | Budget action | Không nên làm |
| --- | --- | --- | --- |
| Một variant được delivery vượt xa variant còn lại | So sánh trực tiếp dễ sai | giữ kết luận ở mức directional, kiểm campaign delivery | tuyên bố winner |
| Hook family có cả `CTR` và `CVR` yếu | Tín hiệu yếu khá rõ | dừng family hoặc viết lại promise | bơm thêm variant cùng logic |
| Hook có `CTR` yếu nhưng D1 tốt | Communication yếu, loop có thể ổn | cấp ít budget cho execution retest | bỏ luôn core loop |
| Hook có `CTR` cao nhưng `CVR/D1` yếu | Attention không chuyển thành intent/fit | giảm budget, sửa proof chain | scale vì ad rẻ click |
| Hai hook đều directional tốt | Chưa có winner mạnh | chọn hook dễ chứng minh bằng store/first-session hơn | chia nhỏ budget thêm nhiều cell |

Một rule thực tế cho micro test:

```text
Spend rule:
- Start with 3 hook families x 2 variants only.
- Do not add a new family until one existing family is paused.
- Give extra production only to rows that have a clear next variant and proof chain.
- Never increase budget because CTR alone looks exciting.
```

### Creative cell acceptance contract

Trước khi một row được gọi là "winner", "weak" hoặc "paused", hãy điền contract này. Nó ép team tách signal đọc được khỏi kết luận bị cấm.

| Contract field | Câu hỏi cần trả lời | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Cell question | Row này học điều gì? | Một learning question duy nhất | Row chỉ là asset backlog |
| Variable changed | A/B khác nhau ở biến nào? | Một biến lớn hoặc tradeoff được ghi rõ | Không biết vì sao thắng/thua |
| Evidence pattern | Metric nào ủng hộ decision? | `CTR/CVR/D1/IPM` được đọc theo chain | Chỉ chọn theo cảm giác |
| Blocked conclusions | Điều gì chưa được kết luận? | Không scale/kill/product verdict nếu chưa đủ proof | Overclaim từ `CTR` |
| Frozen variables | Cái gì giữ nguyên ở retest? | store/build/geo/hook/proof được ghi rõ | Retest bẩn |
| Production ticket | Sản xuất gì tiếp theo? | giữ gì, đổi gì, owner/date | team làm thêm video mơ hồ |
| Stop/retest trigger | Khi nào pause hoặc rerun? | spend/sample/metric trigger rõ | tiếp tục mua noise |

```text
Creative cell acceptance contract
- Cell question:
- Variable changed:
- Evidence pattern:
- Decision:
- Blocked conclusions:
- Frozen variables:
- Production ticket:
- Stop/retest trigger:
```

Acceptance rule: nếu contract không nói được `blocked conclusions`, row chưa đủ sạch để production tiếp. Trong micro-budget, biết điều gì **chưa được kết luận** quan trọng ngang với biết cell nào đang hứa hẹn.

---

## Worked example: 3x2 matrix cho puzzle hook

| Hook family | A | B | Result giả định | Diagnosis | Decision |
| --- | --- | --- | --- | --- | --- |
| Satisfying clear | Messy board -> one clear | Almost solved board -> final clear | A có `CTR` thấp hơn B, nhưng `CVR` và D1 tốt hơn | A nói đúng core loop hơn, B hơi quá dễ | Giữ A, làm lại opening rõ hơn |
| Challenge | "Only 1% solve this" | "Find the perfect move" | A `CTR` cao, `CVR` thấp; B `CTR` vừa, D1 ổn | A curiosity trap, B honest challenge | B là direction an toàn hơn |
| Relax | No timer, soft colors | Timer visible, faster pace | Timer tăng `CTR`, giảm D1 | Người click vì pressure nhưng game fit relax hơn | Bỏ timer trong relax family |

Verdict: matrix giúp bạn tránh chọn nhầm variant có click cao nhưng làm hỏng promise chain.

Second-pass read:

| Row | First read | Risk if you stop there | Better decision |
| --- | --- | --- | --- |
| Satisfying clear | B có `CTR` cao hơn nên tưởng là tốt hơn | B có thể over-promise vì board quá dễ | Giữ motivation của A, sửa opening để rõ hơn |
| Challenge | A thắng attention | A có thể mua nhầm người chơi thích câu đố mẹo, không thích core loop | Dùng B làm base, test thêm proof mạnh hơn |
| Relax | Timer tăng click | Timer kéo sai audience vào một game relax | Tách timer sang challenge family, không trộn vào relax |

Khi ghi decision, đừng viết "A wins". Hãy viết: "A wins for acquisition clarity, but B is safer for retention" hoặc "B wins attention but loses promise fit". Câu decision phải nói được tradeoff, không chỉ nói người thắng.

### Production ticket examples

Sau khi đọc matrix, output tốt nhất là 1-2 ticket sản xuất rất cụ thể, không phải danh sách asset chung chung.

```text
Ticket 1 - Satisfying clear retest
Evidence pattern: Messy board variant has weaker CTR but stronger CVR/D1 than almost-solved variant.
Decision: Keep honest board state, improve first 2 seconds clarity.
Keep unchanged: hook family, gameplay moment, store screenshot proof.
Change one thing: opening crop/zoom so the solvable move is visible faster.
Do not change: CTA, color palette, reward moment, store proof.
Stop rule: pause if CTR stays weak and IPM does not improve after same spend window.
```

```text
Ticket 2 - Challenge rewrite
Evidence pattern: "Only 1% solve this" wins CTR but loses CVR.
Decision: retire curiosity trap, keep challenge motivation.
Keep unchanged: puzzle difficulty cue.
Change one thing: copy from impossible claim to concrete task.
Store proof required: screenshot/video must show the exact puzzle logic promised in ad.
Stop rule: pause if honest challenge copy cannot reach acceptable IPM while D1 stays flat.
```

Hai ticket này giúp creative team biết **cái gì được giữ**, **cái gì được đổi**, và **vì sao**. Đây là điểm khác nhau giữa creative testing có hệ thống và chỉ làm thêm video.

---

## Creative matrix quality checklist

| Check | Pass condition |
| --- | --- |
| Hook family | Mỗi row gắn với một motivation rõ |
| Variant control | A/B chỉ đổi một biến lớn |
| Proof chain | Ad promise có store proof và first-session proof |
| Metric read | Mỗi row có primary metric và supporting metric |
| Next action | Có hành động cho win, weak signal, loss |
| Stop rule | Biết khi nào bỏ hook thay vì sản xuất thêm |

Quality chain verification:

`motivation -> hook family -> variant -> metric pattern -> decision`

Nếu thiếu next action, row đó chưa nên chạy.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Apple Product Page Optimization

Nguồn: [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Apple cho phép test alternate product page versions với app icons, screenshots và app preview videos. | Creative testing không dừng ở ad. Store proof cũng là một biến cần ghi trong matrix nếu `CVR` là metric đọc. | Không suy ra Android-first team cần chạy iOS PPO ngay trong micro test đầu tiên. |
| Apple khuyến nghị cân nhắc số element thay đổi trong treatment vì điều đó ảnh hưởng khả năng biết element nào tạo ra kết quả. | Đây là cùng logic với creative matrix: càng đổi nhiều biến, kết quả càng khó đọc. | Không dùng product page test để che một ad promise không trung thực. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Treatment có thể đổi icon, screenshot hoặc app preview | Creative matrix nên ghi rõ store proof tương ứng với từng hook | Không chạy nhiều store variants nếu chưa đủ traffic để đọc |

### Usecase 2: Google Play preview assets

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nêu screenshots nên thể hiện trải nghiệm app/game thật và giúp người dùng dự đoán trải nghiệm sau khi tải. | Khi matrix test hook, hãy ghi luôn store proof tương ứng để không đọc nhầm `CVR`. | Không suy ra screenshot đẹp là đủ nếu nó không chứng minh hook. |
| Google Play nói preview video nên cho thấy core value và gameplay thật sớm. | Nếu variant video thắng nhờ motion, store proof nên có video hoặc screenshot xác nhận cùng gameplay moment. | Không bắt buộc thêm video khi static/screenshot đã đủ chứng minh promise. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Làm 10 variant nhưng mỗi variant khác hoàn toàn | Làm 3x2 matrix, mỗi row một hook family, mỗi pair đổi một biến lớn |
| Chọn winner chỉ bằng `CTR` | Đọc `CTR` cùng `CVR`, `IPM`, D1 hoặc level depth |
| Không ghi learning goal trước khi chạy | Mỗi row phải có câu hỏi học và next action |
| Gộp creative test với store test mà không ghi rõ | Tách ad variable và store proof variable |
| Thấy kết quả nhiễu rồi sản xuất thêm | Giảm số cell, tăng độ kiểm soát của test |

---

## English Terms You Should Keep

- **Creative testing**: Test creative để học hook, motivation, format hoặc proof nào đáng giữ.
- **CTR**: Click-through rate, tỷ lệ click trên impression.
- **CVR**: Conversion rate, tỷ lệ chuyển đổi từ click hoặc store visit sang install.
- **IPM**: Installs per Mille, install trên 1000 impressions.
- **Variant**: Một phiên bản creative trong test.
- **Control variable**: Biến được giữ nguyên để kết quả còn đọc được.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Hook family | Satisfying clear |
| Variant A | Messy board -> one move -> clear |
| Variant B | Almost solved board -> final clear |
| Variable changed | Opening board state |
| Learning goal | Opening nào làm promise dễ hiểu hơn? |
| Primary metric | `CTR`, `IPM` |
| Supporting metric | Store `CVR`, first-session clear depth |
| Win action | Produce 2 more variants around winning opening |
| Weak action | Rewrite hook or improve store proof |
| Loss action | Pause hook family for this sprint |

Card preview:

```text
Creative test row
Hook family: Satisfying clear
Question: Which opening board state communicates the payoff faster?
Variable: Opening state only
Decision: Keep, revise, or pause
```

Production ticket preview:

```text
Creative production ticket
Hook family:
Evidence pattern:
Decision:
Keep unchanged:
Change one thing:
Proof required:
Stop rule:
Owner:
```

Creative cell acceptance contract:

```text
Cell question:
Variable changed:
Evidence pattern:
Decision:
Blocked conclusions:
Frozen variables:
Production ticket:
Stop/retest trigger:
```

---

## Practical Lab

1. Gom creative backlog thành 3 hook families theo motivation.
2. Với mỗi family, tạo 2 variant chỉ khác một biến lớn.
3. Viết learning goal cho từng row.
4. Ghi primary metric, supporting metric và next action.
5. Xóa hoặc hoãn mọi cell không trả lời được câu hỏi học.
6. Viết 1 production ticket cho row mạnh nhất.
7. Viết 1 stop rule cho row dễ gây nhầm nhất.
8. Điền Creative cell acceptance contract cho ít nhất 2 row.

Quality chain check:

- Nếu A thắng, bạn biết làm gì tiếp không?
- Nếu B thắng, bạn biết vì sao không?
- Nếu cả hai thua, bạn biết sửa creative, store hay first session không?
- Có cell nào đổi quá nhiều biến không?
- Production ticket có nói rõ giữ gì và đổi gì không?
- Stop rule có ngăn team scale từ `CTR` đơn lẻ không?
- Contract có ghi blocked conclusions và frozen variables không?

---

## Final UA Plan Update

Cập nhật các field sau:

```text
Creative matrix v1:
- Hook family:
- Variant A:
- Variant B:
- Controlled variable:
- Learning goal:
- Primary metric:
- Supporting metric:
- Win action:
- Weak signal action:
- Stop rule:
- Creative cell acceptance contract:
- Blocked conclusions:
- Frozen variables:

Creative decision rules:
- CTR alone is not a scale signal.
- Keep variants interpretable.
- Store proof must match each top hook.
- Production request must state evidence pattern, what stays unchanged, what changes, and stop rule.
- Every accepted row must state blocked conclusions before new production.
```

---

## Checklist Focus

- Mỗi row có một learning question.
- Mỗi A/B pair chỉ đổi một biến lớn.
- Không chọn winner bằng `CTR` đơn lẻ.
- Mỗi hook có store proof và first-session proof.
- Có win action, weak-signal action và stop rule.
- Mỗi accepted row có Creative cell acceptance contract.
- Có blocked conclusions và frozen variables trước production ticket.

---

## Curated References

- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
', now()),
  ('lessons/day-18.md', 'markdown', null, '---
day: 18
title: "ASO and store promise continuity"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [ASO, CVR, Store listing]
artifact: "Store promise checklist"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Store promise checklist**: một checklist nối từng top ad hook với icon, first screenshot, short description, preview video và first-session proof trên game thật.

Quyết định chính: **trước khi đổ tiền vào traffic, store page có đang xác nhận đúng lời hứa của ad không?**

Kết quả cần có:
- Mỗi top hook có ít nhất một store proof cụ thể.
- Bạn biết đọc `CVR` như tín hiệu store continuity, không chỉ là "traffic quality".
- Bạn biết khi nào sửa store trước khi sửa audience hoặc creative.
- Final UA Plan được cập nhật ở field **Store readiness** và **Creative/store continuity**.

---

## Why this matters

Store page là cây cầu giữa click và install. Với budget `$100-500`, một store mismatch nhỏ có thể làm bạn kết luận sai rằng hook thua hoặc audience kém.

Ví dụ: ad hứa "clear chaos in one smart move", nhưng screenshot đầu lại là menu, map progression hoặc shop. Người xem đã click vì gameplay payoff, nhưng store không cho họ bằng chứng. `CVR` thấp trong tình huống này không phải traffic kém trước tiên, mà là promise chain bị đứt.

Chuỗi cần bảo vệ:

`ad promise -> store proof -> first-session proof -> metric pattern -> next action`

ASO trong micro soft-launch không chỉ là keyword. Nó là promise continuity.

---

## Core model: store page là bằng chứng, không phải brochure

Store listing nên trả lời 3 câu hỏi trong vài giây:

1. Game này hứa điều gì?
2. Screenshot/video đầu có chứng minh lời hứa đó không?
3. Người chơi có thấy cùng promise trong session đầu không?

| Store surface | Job chính | Câu hỏi kiểm tra |
| --- | --- | --- |
| Icon | Tạo nhận diện và tín hiệu genre/mood | Nhìn icon có đoán được game puzzle hoặc object chính không? |
| First screenshot | Chứng minh promise quan trọng nhất | Có thấy gameplay state thật không? |
| Short description | Tóm gọn core value | Có lặp lại hook bằng ngôn ngữ trung thực không? |
| Preview video | Chứng minh motion/sequence | 10 giây đầu có cho thấy gameplay thật không? |
| Data safety/privacy | Giảm friction trust | Có sẵn sàng cho review và traffic paid không? |

---

## Store promise checklist mẫu

| Ad hook | Store proof cần có | First-session proof | Metric đọc | Nếu yếu thì sửa |
| --- | --- | --- | --- | --- |
| Clear chaos in one smart move | Screenshot đầu: board rối -> clear result | Level 1-3 có clear moment | `CVR`, `IPM`, level depth | Đổi screenshot đầu trước khi đổi audience |
| Calm 2-minute puzzle break | Icon/screenshot màu sạch, ít áp lực | Tutorial nhẹ, không timer sớm | `CVR`, D1, session count | Giảm UI noise, bỏ pressure cue |
| Find the perfect move | Screenshot có board đọc được và move gợi ý | Challenge công bằng trong level sớm | `CTR`, `CVR`, retry rate | Sửa copy clickbait hoặc difficulty |
| Sort screws by color | Screenshot tập trung object/action | Người chơi thao tác sort trong 60-90 giây | `CVR`, tutorial complete | Đưa object/action lên first screenshot |

Store continuity audit ladder:

| Audit order | Surface | Pass signal | If weak | Owner |
| --- | --- | --- | --- | --- |
| 1 | Screenshot 1 / first visible frame | Shows the same gameplay payoff promised by the ad | Replace with before/after board, object action, or payoff moment | Store/creative |
| 2 | Short description | Confirms the hook in plain language without overclaim | Rewrite to mirror the top hook and remove vague keyword stuffing | Store/UA |
| 3 | Preview video | Shows real gameplay or payoff in the first seconds | Recut opening, remove menu/setup delay, show the move/result sooner | Creative/product |
| 4 | Icon / feature graphic | Signals genre, object, mood without contradicting hook | Simplify visual cue; avoid meta/progression if hook is gameplay payoff | Art/store |
| 5 | First-session proof | Level 1-3 delivers the same promise the store sold | Fix tutorial, first win, difficulty, reward timing | Product/design |

Rule: audit theo thu tu nay truoc khi doi audience. Neu `CTR` on nhung `CVR` yeu, surface dau tien can nhin thuong la screenshot 1, khong phai bid, audience hay them creative moi.

Framework này dùng để quyết định store asset nào phải sửa trước soft-launch.

### Store proof contract

Trước khi sửa store, viết contract cho từng top hook. Contract giúp store asset không bị biến thành "trang đẹp hơn" nhưng lệch lời hứa.

| Contract field | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Ad promise | Người click đang kỳ vọng điều gì? | "Clear chaos in one smart move" |
| Store proof | Surface nào chứng minh promise đầu tiên? | Screenshot 1: before/after board clear |
| First-session proof | Game thật giao promise ở đâu? | Level 2 có clear moment trong 90 giây đầu |
| Not allowed to imply | Store không được hứa điều gì? | Không hứa meta map, character story hoặc reward chưa có |
| Frozen surfaces | Khi repair store, thứ gì giữ nguyên để đọc được? | Hook, country, build, tutorial, campaign setup |
| Success read | Metric nào chứng minh repair có ích? | Store CVR/IPM tăng, D1 không xấu thêm |

Nếu không có `not allowed to imply`, store rất dễ thêm promise phụ để trông hấp dẫn hơn. Với puzzle game nhỏ, promise phụ chưa có trong first session thường tạo install rẻ hơn nhưng D1 xấu hơn.

---

## Operating diagram: đọc store continuity

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: đọc store continuity]
Type: hero operating diagram.
Lesson section: Operating diagram: đọc store continuity.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Ad click
  |
  v
Store visit
  |
  v
Does the first visible store surface prove the ad promise?
  | yes
  v
Install
  |
  v
Does first session prove the same promise?
  | yes -> read retention/quality
  | no -> fix onboarding or early level proof
  |
  no -> fix store proof before blaming traffic
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Store proof nằm giữa ad và install | `CVR` thấp thường là dấu hiệu cần audit store continuity | Không kết luận traffic sai nếu store chưa chứng minh hook |
| First session nằm sau install | D1 thấp có thể là game promise mismatch, không phải ASO đơn thuần | Không sửa keyword nếu lỗi nằm ở gameplay proof |

---

## Chart: promise-chain risk

```text
[VISUAL PLACEHOLDER: Third-party image request - Chart: promise-chain risk]
Type: data visual/chart or decision board.
Lesson section: Chart: promise-chain risk.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


:::chart
title: Promise-chain risk by surface, 1-5
Ad hook clear, store mismatch|5|High CVR risk
Store clear, first session mismatch|4|High retention risk
Ad vague, store clear|3|CTR risk first
Ad/store/session aligned|1|Lower mismatch risk
:::

| Pattern | Risk | Decision |
| --- | ---: | --- |
| Ad rõ, store lệch | 5/5 | Sửa first screenshot hoặc preview video |
| Store rõ, first session lệch | 4/5 | Sửa tutorial/level 1-3 trước khi scale |
| Ad mơ hồ, store rõ | 3/5 | Sửa creative opening hoặc hook copy |
| Ad/store/session đồng bộ | 1/5 | Có thể đọc traffic quality công bằng hơn |

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Rủi ro cao nhất là promise bị đứt giữa ad và store | Store asset là một phần của UA test, không phải việc làm sau | Không dùng bảng này như benchmark numeric cố định |

---

## Hướng dẫn đọc số

| Metric pattern | Cách đọc | Next action đúng |
| --- | --- | --- |
| `CTR` cao, store `CVR` thấp | Ad tạo interest, store không xác nhận promise | Audit icon, screenshot đầu, short description |
| `CTR` thấp, `CVR` cao | Store thuyết phục người đã đến, ad chưa kéo đủ attention | Sửa creative opening hoặc format |
| `CVR` cao, D1 thấp | Store hứa được, game session đầu không giữ lời | Sửa tutorial, level 1-3, difficulty hoặc reward timing |
| `IPM` thấp trên mọi hook | Có thể là store tổng thể yếu hoặc tracking/market issue | Kiểm tra store listing, tracking, geo, bid trước khi kết luận game |
| `CVR` cải thiện sau đổi screenshot nhưng D1 không đổi | Store proof tốt hơn, game quality chưa đổi | Tiếp tục đo retention riêng, không overclaim |

Với Android-first micro launch, hãy đọc `CVR` như tín hiệu continuity. ASO không chỉ là search ranking; nó là bước xác nhận lời hứa sau click.

Store repair priority:

| Symptom | Surface cần kiểm trước | Lý do | Repair nhỏ nhất |
| --- | --- | --- | --- |
| `CTR` cao, `CVR` thấp ngay từ đầu | Screenshot 1 / first visible frame | Người click không thấy bằng chứng của hook vừa click | Đưa gameplay payoff hoặc before/after state lên đầu |
| `CVR` thấp trên mọi hook | Icon, title, screenshot 1, build/tracking setup | Có thể là listing tổng thể yếu hoặc setup sai, không phải một hook | Audit store surface chung trước khi sản xuất thêm ads |
| `CVR` khá nhưng D1 thấp | First-session proof | Store bán được promise, game chưa giao đúng promise | Sửa tutorial/level 1-3 hoặc giảm lời hứa |
| `CVR` tăng sau screenshot nhưng D1 không tăng | Product proof | Store proof đã tốt hơn nhưng retention vẫn do gameplay/onboarding | Không tiếp tục tối ưu store để chữa D1 |
| Hook challenge có `CTR` đẹp nhưng `CVR` yếu | Screenshot readability / overpromise copy | Người chơi tò mò nhưng không tin hoặc không hiểu proof | Làm board thật, đọc được; bỏ wording fake-hard |
| Hook relax có `CVR` yếu | Visual noise / pressure cue | Store có thể đang làm người chơi relax thấy căng | Giảm timer, flashing UI, hard challenge framing |

Decision rule:

```text
Repair one surface at a time when the metric question is clear.
If screenshot 1 changes, keep hook/country/campaign setup stable enough to read direction.
If store and first session both change, do not claim which one fixed CVR/D1.
```

Với budget nhỏ, repair tốt là repair giúp bạn học nguyên nhân. Một store revamp lớn có thể đẹp hơn, nhưng nếu nó đổi icon, screenshot, copy và video cùng lúc, bạn mất khả năng biết surface nào thật sự sửa được promise chain.

### Store repair decision gate

Không phải `CVR` thấp nào cũng sửa store. Dùng gate này để chọn đúng lever:

| Gate | Nếu pass | Nếu fail |
| --- | --- | --- |
| Ad click intent rõ | Đọc store proof tiếp theo | Sửa creative hook/opening trước |
| Store surface đầu lệch promise | Sửa screenshot/copy/video trước | Kiểm tra bid, geo, tracking hoặc hook quality |
| First-session proof có trong game | Store có quyền hứa promise đó | Giảm lời hứa store hoặc sửa level 1-3 trước |
| Measurement sạch | Đọc CVR/IPM direction | Fix campaign/source tracking trước |
| Repair scope nhỏ | Test được nguyên nhân | Nếu đổi nhiều surface, ghi là revamp, không gọi là causal repair |

Decision rule:

```text
Store repair is valid only when ad intent is readable, store proof is the suspected leak, and first-session proof can deliver the same promise.
```

Nếu first-session proof chưa tồn tại, store không nên "bán trước" promise đó. Hãy sửa product proof hoặc hạ promise trước khi polish store.

---

## Worked example: ad thắng click nhưng store thua install

Game puzzle chạy 2 hook:

| Hook | CTR | Store CVR | D1 | Store first screenshot | Diagnosis | Decision |
| --- | ---: | ---: | ---: | --- | --- | --- |
| Clear chaos in one smart move | 3.4% | 12% | 14% | Main menu + character | Store không chứng minh board clear | Đổi screenshot đầu sang before/after gameplay |
| Calm puzzle break | 2.1% | 28% | 25% | Clean gameplay board | Promise chain tốt hơn dù CTR thấp | Giữ direction, làm thêm variant |

Sau khi đổi screenshot đầu của hook "clear chaos" sang before/after board:

| Metric | Before | After | Cách đọc |
| --- | ---: | ---: | --- |
| Store CVR | 12% | 22% | Store proof đã bớt lệch promise |
| D1 | 14% | 15% | Game first-session chưa cải thiện nhiều |

Verdict: sửa store có thể cải thiện install conversion, nhưng không tự sửa retention. Nếu D1 vẫn yếu, tiếp theo phải kiểm tra gameplay proof.

Second-pass read:

| Read layer | Câu hỏi | Clear chaos | Calm puzzle break |
| --- | --- | --- | --- |
| Ad promise | Người click mong thấy gì ngay sau click? | Board rối được clear bằng một move thông minh | Board sạch, cảm giác nhẹ, ít áp lực |
| Store proof | Screenshot đầu có xác nhận promise không? | Không, đang là menu + character | Có, clean gameplay board |
| Install intent | `CVR` đang nói điều gì? | Người click không được trấn an sau click | Người đến store hiểu và tin promise hơn |
| First-session proof | D1 có xác nhận product giao promise không? | D1 vẫn yếu sau sửa screenshot, cần xem level proof | D1 tương đối khỏe, nên polish creative thay vì đổi thesis |
| Next smallest action | Sửa gì ít nhất để học tiếp? | Thêm clear moment thật vào level 1-3 hoặc đo level depth | Làm 1-2 creative variants cùng promise |

Decision note nên ghi:

```text
Clear chaos:
- Store CVR improved after screenshot repair, so store mismatch was real.
- D1 did not materially improve, so next action is first-session proof, not more store polish.

Calm puzzle break:
- Lower CTR but healthier CVR/D1 means motivation may fit.
- Next action is stronger opening creative, not a different store promise.
```

Điểm sâu ở đây: store continuity chỉ sửa đoạn click -> install. Nếu install -> D1 vẫn gãy, bạn đã chuyển sang bài toán product proof, không còn là ASO thuần.

Store repair ticket:

```md
Store repair ticket - Clear chaos

Diagnosis:
CTR is healthy but Store CVR is weak. Screenshot 1 does not prove the ad promise.

Change:
Replace screenshot 1 with before/after board clear.
Keep screenshot 2-3 unchanged for this read.
Rewrite short description only if it currently contradicts the hook.

Frozen surfaces:
Ad hook, campaign, market, build, tutorial, first-session content.

Success read:
Store CVR/IPM improves without D1 getting worse.

Escalation:
If CVR improves but D1 stays weak, next action moves to first-session proof.

Do not do:
Do not add meta map, character story, fake rewards, or a polished menu screenshot.
```

Ticket này tách **store repair** khỏi **store redesign**. Repair sửa một nghi vấn cụ thể; redesign có thể dùng sau, nhưng không nên là action đầu tiên khi budget chỉ đủ đọc vài tín hiệu.

### Store repair release memo

Sau khi sửa store, viết memo này trước khi đọc lại report. Memo giúp team không overclaim rằng "store đã sửa xong game" chỉ vì `CVR` tăng.

| Memo field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Store change shipped | Surface nào đổi? | screenshot 1, short description, preview opening... |
| Frozen surfaces | Cái gì giữ nguyên để đọc được repair? | hook, campaign, build, tutorial, geo/source |
| Success read | Metric nào chứng minh store repair có tác dụng? | `CVR`/`IPM` tăng, D1 không xấu thêm |
| Escalation read | Nếu CVR tăng nhưng D1 không tăng thì làm gì? | chuyển sang first-session proof |
| Blocked conclusions | Điều gì không được kết luận? | product fit, final LTV, channel winner |
| Rollback trigger | Khi nào revert hoặc chỉnh tiếp? | CVR giảm, D1 xấu, promise lệch |

```text
Store repair release memo
- Store change shipped:
- Frozen surfaces:
- Success read:
- Escalation read:
- Blocked conclusions:
- Rollback trigger:
- Owner/date:
```

Memo này đặc biệt hữu ích khi screenshot repair làm `CVR` tăng nhưng D1 không đổi. Khi đó team đã học rằng click -> install tốt hơn, nhưng install -> return vẫn cần product proof.

---

## Store readiness and event checklist

| Check | Pass condition |
| --- | --- |
| Icon | Không gây hiểu nhầm genre hoặc object chính |
| Screenshot 1 | Có gameplay thật và proof của top hook |
| Screenshot 2-3 | Cho thấy secondary promise, không chỉ UI/menu |
| Short description | Dưới giới hạn store, rõ core value, không nhồi keyword |
| Preview video | Nếu có, mở sớm bằng gameplay thật |
| Data safety | Chuẩn bị khai báo dữ liệu và SDK trước traffic paid |
| First session | Level 1-3 chứng minh promise mà store đã hứa |

Quality chain verification:

`top hook -> store proof -> install -> first-session proof -> metric read`

Nếu screenshot đầu không pass, đừng blame media source trước.

Store asset brief template:

```md
Store asset brief

Top hook:

Promise to prove:

Screenshot 1 job:

Short description job:

Preview video job, if needed:

First-session proof location:

Do not imply:

Metric read:

Weak-signal action:
```

Brief này nên đi cùng creative brief. Nếu ad team và store team dùng hai lời hứa khác nhau, micro soft-launch sẽ đo mismatch chứ không đo market demand.

---

## Real usecases đã đối chiếu nguồn

### Usecase 1: Google Play preview assets

Nguồn: [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play nêu screenshots nên thể hiện trải nghiệm app/game thật để người dùng biết họ sẽ nhận gì sau khi tải. | Với puzzle UA, first screenshot phải là gameplay proof của top hook, không phải decoration. | Không suy ra screenshot đẹp là đủ nếu không chứng minh promise. |
| Short description là phần người dùng thấy sớm và nên tóm tắt core purpose/value. | Copy store nên xác nhận ad hook bằng ngôn ngữ trung thực, ngắn, dễ hiểu. | Không nhồi keyword hoặc CTA nếu nó làm promise kém rõ. |
| Preview video được khuyến nghị cho games và nên show core features sớm. | Nếu ad hứa motion, preview video/store asset nên cho thấy motion hoặc gameplay sequence tương ứng. | Không cần video nếu static/screenshot đã chứng minh đủ cho hook hiện tại. |

Screenshot/readout table:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot đầu có gameplay thật, object/action rõ, ít UI noise | Store đang giúp người click xác nhận lý do cài | Không suy ra đây là bằng chứng retention dài hạn |

### Usecase 2: Google Play Data safety

Nguồn: [Google Play Console Help - Provide information for Google Play''s Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469)

| Observable facts từ source | Lesson interpretation | What not to infer |
| --- | --- | --- |
| Google Play yêu cầu developer cung cấp thông tin về data collection/sharing cho Data safety section. | Store readiness không chỉ là creative. Paid traffic nên đi kèm kiểm tra SDK, analytics và khai báo dữ liệu để tránh friction publish/review. | Không suy ra Data safety sẽ trực tiếp tăng CVR cho mọi game. |
| Data safety liên quan cách app thu thập, chia sẻ, bảo mật dữ liệu. | Khi thêm analytics/ads SDK cho soft-launch, plan phải ghi rõ dữ liệu nào được tracking. | Không dùng bài này thay thế tư vấn pháp lý hoặc policy review đầy đủ. |

---

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Đổ lỗi traffic khi `CVR` thấp | Audit store proof trước: icon, screenshot đầu, short description, preview video |
| Screenshot đầu là menu hoặc meta UI | Đưa gameplay proof của top hook lên screenshot đầu |
| Ad hứa challenge, store lại trông relax | Tách hook hoặc sửa store để promise nhất quán |
| Nhồi keyword vào short description | Viết core value rõ, trung thực, dễ hiểu |
| Quên data safety trước khi gắn SDK ads/analytics | Ghi tracking plan và chuẩn bị khai báo data safety |

---

## English Terms You Should Keep

- **ASO**: App Store Optimization, tối ưu store visibility và conversion.
- **Store listing**: Trang hiển thị app/game trên store.
- **CVR**: Conversion rate, tỷ lệ chuyển đổi từ store visit/click sang install.
- **Preview assets**: Icon, screenshots, feature graphic, preview video.
- **Store proof**: Bằng chứng trên store xác nhận ad promise.
- **Data safety**: Phần khai báo dữ liệu trên Google Play.

---

## Lab output example

| Field | Example output |
| --- | --- |
| Top hook | Clear chaos in one smart move |
| Icon proof | Block puzzle icon with clear board color cue |
| Screenshot 1 | Before/after board clear, no menu |
| Short description | Clear satisfying boards in quick puzzle breaks |
| Preview video | 8s gameplay, clear moment appears early |
| First-session proof | Level 2 has a clear moment within 90 seconds |
| Metric to watch | Store `CVR`, `IPM`, D1, level depth |
| Weak signal action | If CTR high CVR low, change screenshot before changing hook |
| Store proof contract | Ad promise, store proof, first-session proof, not-allowed promise, frozen surfaces |
| Repair scope | Screenshot 1 only; keep hook, campaign, build and tutorial stable |
| Store repair release memo | Surface changed, success read, escalation read, blocked conclusions |

Card preview:

```text
Store promise card
Hook: Clear chaos in one smart move
Store proof: First screenshot shows before/after board clear
First-session proof: Level 2 creates clear moment
Metric: CVR + IPM + D1
Decision: Fix store proof before blaming traffic
Frozen: hook, market, build, tutorial
```

---

## Practical Lab

1. Lấy 3 top hooks từ Creative test matrix.
2. Với mỗi hook, ghi store proof cần có: icon, screenshot 1, short description, preview video nếu cần.
3. Ghi first-session proof tương ứng trong level 1-3.
4. Viết metric pattern cho store mismatch và game mismatch.
5. Ghi một store risk cần sửa trước khi chạy paid traffic.
6. Viết store proof contract cho hook ưu tiên.
7. Nếu cần sửa store, viết store repair ticket với change, frozen surfaces, success read và do-not-do.
8. Nếu first-session proof chưa tồn tại, hạ promise hoặc sửa product trước khi polish store.
9. Viết Store repair release memo trước khi đọc report sau repair.

Quality chain check:

- Người click từ ad có thấy cùng promise trên store trong vài giây đầu không?
- Screenshot đầu có gameplay thật không?
- Short description có nói đúng core value không?
- First session có giữ lời store hứa không?
- Data safety/tracking có sẵn sàng cho soft-launch không?
- Repair scope có đủ nhỏ để đọc được nguyên nhân không?
- Store có tránh hứa feature/meta/reward chưa có trong game thật không?
- Release memo có blocked conclusions và escalation read không?

---

## Final UA Plan Update

Cập nhật các field sau:

```text
Store readiness:
- Top hook:
- Icon signal:
- Screenshot 1 proof:
- Short description:
- Preview video need:
- Store proof contract:
- Not allowed to imply:
- Data safety/tracking readiness:

Creative/store continuity:
- Ad promise:
- Store proof:
- First-session proof:
- Frozen surfaces:
- CVR weak-signal action:
- D1 weak-signal action:
- Store repair ticket, if needed:
- Store repair release memo:
- Blocked conclusions after store repair:
```

Không ghi "làm ASO". Hãy ghi rõ store surface nào chứng minh hook nào.

---

## Checklist Focus

- Mỗi top hook có store proof cụ thể.
- Screenshot đầu ưu tiên gameplay proof, không ưu tiên menu.
- `CVR` được đọc như tín hiệu continuity trước khi blame traffic.
- First session phải chứng minh cùng promise với store.
- Có store proof contract cho hook ưu tiên.
- Store repair ticket chỉ sửa một nghi vấn chính.
- Store repair release memo đã viết trước readout.
- Frozen surfaces rõ khi repair store.
- Data safety và SDK tracking được kiểm tra trước paid traffic.

---

## Curated References

- [Google Play Console Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Google Play Console Help - Provide information for Google Play''s Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
', now()),
  ('lessons/day-19.md', 'markdown', null, '---
day: 19
title: "Competitor teardown without copying"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Genre-market fit, ASO, Creative testing]
artifact: "Competitor teardown sheet"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Competitor teardown sheet** để đọc 3 đối thủ puzzle mà không biến sản phẩm của mình thành bản clone.

Quyết định cần học: pattern nào đáng học, pattern nào phải tránh, và pattern nào có thể chuyển thành một test nhỏ cho creative/store/first session của game bạn.

Kết quả cần có:

- 3 competitor surfaces cụ thể: store page, screenshot order, video/ad surface hoặc publisher catalog.
- Một bảng tách rõ `observable fact`, `market pattern`, `our hypothesis`, `test asset`, `do not copy`.
- Một scoring grid để ưu tiên pattern dựa trên độ lặp lại và khả năng prototype của bạn chứng minh được.
- Cập nhật trường **Audience** trong Final UA Plan, kèm ảnh hưởng sang **Creative matrix** và **Store proof**.

---

## Why this matters

Competitor research rất dễ biến thành moodboard. Bạn nhìn thấy một game puzzle dùng màu xanh, icon nhân vật vui, board gỗ, caption "only 1% can solve", rồi vô thức copy bề mặt đó. Kết quả là bạn vừa không hiểu tại sao đối thủ dùng pattern đó, vừa làm game của mình mất promise riêng.

Với budget `$100-500`, teardown phải giúp bạn giảm mù trước khi test. Bạn không đủ tiền để thử 10 hướng store và 20 hook ngẫu nhiên. Bạn cần biết:

- Đối thủ đang chứng minh promise nào trước install?
- Pattern nào lặp lại qua nhiều listing vì nó giúp user hiểu nhanh?
- Pattern nào phụ thuộc vào IP, content depth, art budget hoặc live ops mà team nhỏ chưa nên hứa?
- Nếu học pattern đó, metric nào sẽ cho biết bạn học đúng hay sai?

Một teardown tốt không hỏi "mình copy cái gì?". Nó hỏi "surface public này dạy mình một giả thuyết testable nào?".

---

## Core model: copy pattern, không copy execution

Tách competitor teardown thành 5 lớp:

| Lớp | Câu hỏi | Ví dụ |
| --- | --- | --- |
| Observable fact | Mắt thường thấy gì trên surface public? | Screenshot 1 show board đang gần clear |
| Market pattern | Fact đó có thể đại diện cho pattern nào? | Core gameplay proof xuất hiện trước brand/meta |
| Our hypothesis | Game mình có nên test pattern đó không? | Screenshot đầu là before/after board clear có thể tăng Store CVR |
| Test asset | Asset nào của mình cần làm? | Store screenshot variant A/B |
| Copy guard | Không được copy điều gì? | Không copy board layout, art style, wording, IP |

Quy tắc: nếu insight không đi được từ fact sang test asset, insight đó chưa dùng được cho micro soft-launch. Nếu insight không có copy guard, nó dễ biến thành sao chép.

---

## Competitor teardown sheet mẫu

| Competitor surface | Observable fact | Market pattern | Our hypothesis | Test asset | Do not copy |
| --- | --- | --- | --- | --- | --- |
| Store screenshot 1 | Gameplay board/action xuất hiện trước meta UI | Proof before decoration | Nếu screenshot đầu chứng minh core action, Store CVR sẽ dễ đọc hơn | Screenshot 1: real board clear | Board layout, exact art, UI frame |
| Video preview opening | Mở bằng near-fail hoặc almost-solved state | Tension in 1 second | Hook "one move can save the board" có thể tăng CTR cho challenge-lite angle | 3-second video opening | Fake gameplay, impossible puzzle claim |
| Title/subtitle | Nêu action verb cụ thể: sort, screw, merge, escape | Action verb clarity | Tên/screenshot nên nói đúng verb chính của game | Store short copy variant | Keyword stuffing |
| Publisher catalog | Nhiều game cùng verb family nhưng khác wrapper | Portfolio tests motivations, not one audience | Chọn reference theo action verb, không theo publisher fame | Reference set for Day 2/3 plan | Scale, ranking, live ops system |

Framework này dùng để tạo 1-2 hypothesis, không dùng để gom mọi thứ hay nhất của đối thủ vào một store page.

### Teardown pattern contract

Mỗi pattern rút ra từ đối thủ cần một contract để tránh trượt từ "học pattern" sang "copy execution".

| Contract field | Câu hỏi cần trả lời | Fail thì làm gì |
| --- | --- | --- |
| Source surface | URL/surface cụ thể là gì? | Không đưa vào sheet nếu không trace được nguồn |
| Observable fact | Điều gì nhìn thấy được, không phải cảm nhận? | Viết lại bằng fact hoặc bỏ row |
| Transferable pattern | Pattern có thể học mà không copy art/IP/layout không? | Hold/reject nếu phụ thuộc execution riêng |
| Our proof | Prototype/store/first session của mình có chứng minh được không? | Không test paid nếu proof chưa có |
| Test asset | Chỉ một asset nào sẽ đổi? | Thu hẹp: screenshot, hook opening hoặc copy, không đổi tất cả |
| Metric pair | Test sẽ đọc bằng metric nào? | Không launch nếu không biết thắng/thua nghĩa là gì |
| Copy guard | Không copy cụ thể điều gì? | Bổ sung guard trước khi giao asset |

Rule: pattern chỉ được vào `Creative matrix` hoặc `Store proof` khi contract có đủ `our proof`, `test asset`, `metric pair`, và `copy guard`.

---

## Hero visual: teardown decision flow

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: teardown decision flow]
Type: hero operating diagram.
Lesson section: Hero visual: teardown decision flow.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[TEARDOWN DECISION FLOW]

```text
1) Pick a concrete public surface
   Store screenshot, video opening, title/subtitle, publisher catalog
        |
        v
2) Record only observable facts
   "Screenshot 1 shows real board clear before reward UI"
   Not: "their store is beautiful"
        |
        v
3) Name the transferable pattern
   proof before decoration / action verb clarity / solvable tension
        |
        v
4) Check our proof gate
   Can our prototype prove this with real asset + first-session moment?
        |
        +-- NO --> Reject or hold pattern
        |         Write: "not now because proof does not exist"
        |
        +-- YES
             |
             v
5) Choose exactly one test asset
   Store screenshot order OR 3-second hook OR title/action verb copy
        |
        v
6) Attach metric pair
   Store asset: Store CVR + D1
   Hook: CTR + CVR + D1
   Action verb: CVR + traffic quality
        |
        v
7) Write copy guard
   Do not copy art, board layout, IP, exact wording, fake difficulty
```

| Gate | Pass question | If fail | If pass |
| --- | --- | --- | --- |
| Surface gate | Co URL/surface public cu the khong? | Bo insight vi khong trace duoc nguon | Ghi source va surface |
| Fact gate | Co fact nhin thay duoc khong? | Viet lai, bo cam nhan mo ho | Dat ten market pattern |
| Transfer gate | Pattern co dung cho game minh ma khong clone khong? | Reject hoac hold | Kiem proof cua minh |
| Proof gate | Prototype/store/first session co chung minh duoc khong? | Khong test trong pass nay | Chon mot asset test |
| Metric gate | Co metric pair doc duoc sau test khong? | Khong chay ad voi pattern nay | Viet expected readout |
| Copy guard gate | Co noi ro khong copy gi khong? | Bo sung guard truoc khi lam asset | Dua vao Creative matrix/store task |


**Inspect:** mọi nhánh đều đi qua bước "check our proof" trước khi chọn test asset.
**Conclude:** pattern chỉ đáng test khi game bạn có thể chứng minh bằng asset thật và first-session proof thật.
**Do not infer:** flow không nói pattern nào chắc chắn thắng; nó chỉ ngăn bạn copy bề mặt mà chưa hiểu điều kiện.

---

## Pattern confidence grid

```text
[VISUAL PLACEHOLDER: Third-party image request - Competitor pattern confidence grid]
Type: confidence grid / transferability matrix.
Lesson section: Pattern confidence grid.
Visual brief: convert the pattern confidence chart and transferability ledger into a 2-axis matrix: repeated in market vs provable by our prototype, with test/hold/reject zones.
Teaching job: help the learner decide which competitor patterns are worth testing without copying execution.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

:::chart
title: Example competitor pattern confidence, 1-5
Gameplay proof first|5|Repeated and easy for prototype to prove
Almost-solved opening|4|Strong attention but must avoid fake difficulty
Deep meta progression|2|Repeated in large games but hard for small team
Character/IP wrapper|1|Not transferable without brand and art budget
Action verb title|4|Easy to adapt without copying execution
:::

**Inspect:** `Gameplay proof first` và `Action verb title` có điểm cao vì vừa lặp lại vừa transferable.
**Conclude:** test đầu nên ưu tiên proof order và action verb clarity, không phải copy art/meta.
**Do not infer:** điểm cao không phải benchmark thị trường; nó là readiness score cho một prototype nhỏ.

---

## Hướng dẫn đọc số

Khi bạn áp dụng một pattern từ teardown, đọc metric để biết pattern đó sửa đúng tầng nào.

| Pattern test | Metric cần đọc | Nếu số này xảy ra | Chẩn đoán | Next action |
| --- | --- | --- | --- | --- |
| Screenshot 1 = gameplay proof | Store CVR, click-to-install | CVR tăng, D1 không đổi | Store proof rõ hơn, product chưa đổi | Giữ screenshot; tiếp tục sửa first session nếu cần |
| Almost-solved video opening | CTR, IPM, CVR | CTR tăng, CVR thấp | Hook hút tò mò nhưng store/game chưa chứng minh | Sửa store proof hoặc giảm clickbait |
| Action verb trong title/copy | CVR, search/store behavior | CVR tăng nhẹ, traffic quality ổn | User hiểu game nhanh hơn | Giữ wording, test screenshot tiếp |
| Meta/progression promise | CVR, session length, D1/D3 | CVR ổn, D1 thấp | Promise vượt quá product proof | Bỏ meta promise hoặc đưa reward sớm |
| Challenge claim | CTR, fail/retry, D1 | CTR cao, retry thấp, D1 thấp | Challenge bị cảm nhận là unfair/fake | Làm puzzle công bằng hơn hoặc bỏ claim |

Không dùng một competitor pattern để sửa tất cả. Mỗi pattern phải có metric pair riêng.

Transferability decision ledger:

| Pattern | Transferability | Proof requirement | Decision | Copy guard |
| --- | --- | --- | --- | --- |
| Proof-before-decoration screenshot | High | Game có gameplay state thật, đọc được trong screenshot | Test first | Không copy layout/UI/art, chỉ copy ordering principle |
| Action verb clarity | High | Core verb của game đủ cụ thể: sort, clear, merge, place, escape | Test in title/copy | Không keyword-stuff hoặc lấy exact wording |
| Almost-solved tension | Medium | Prototype có near-solve board thật và fair | Test cautiously | Không fake impossible board hoặc "1%" claim rỗng |
| Deep meta progression | Low/hold | Meta reward xuất hiện trong first session | Hold until feature proof exists | Không hứa room/collection nếu build chưa có |
| Character/IP wrapper | Reject | Cần IP/art/story equity riêng | Reject for micro test | Không bắt chước mascot, character silhouette, palette |
| Publisher catalog pattern | Directional only | Cần nhiều store surfaces, không có performance data | Use for hypothesis pool | Không suy ra CPI/revenue/ranking |

Decision rule:

```text
Test = transferable + prototype can prove + metric pair exists.
Hold = promising pattern, but proof does not exist yet.
Reject = pattern relies on IP/art/liveops/scope that your team cannot honestly support.
Backlog = useful later, but not needed for the next micro test.
```

Một teardown sheet tốt phải có ít nhất một `Reject` hoặc `Hold`. Nếu mọi pattern đều được đưa vào test, bạn đang làm moodboard chứ không ra quyết định.

### Second-pass teardown read

Đọc lại sheet bằng ba câu hỏi chống clone:

| Question | Nếu câu trả lời yếu | Quyết định đúng |
| --- | --- | --- |
| Pattern này có bắt đầu từ observable fact không? | Insight chỉ là cảm giác "nhìn hay" | Ghi lại surface/fact hoặc bỏ row |
| Prototype của mình có proof thật không? | Pattern cần feature/art/liveops chưa có | Hold hoặc reject, không làm ad promise |
| Metric pair có đọc được sau test không? | Không biết thắng/thua nghĩa là gì | Không chạy paid traffic với pattern này |

Decision memo nên kết thúc bằng 4 bucket:

```text
Competitor teardown decision memo
- Test first:
- Test cautiously:
- Hold until proof exists:
- Reject because copy/scope risk:
```

Nếu bucket `Reject` trống, hãy xem lại. Một teardown tốt không chỉ sinh ý tưởng; nó cũng bảo vệ team khỏi những pattern nhìn hấp dẫn nhưng không trung thực với build hiện tại.

---

## Worked example: đọc 3 puzzle competitors

Bạn đang làm "Calming Hex Wood Puzzle". Bạn xem 3 store pages/publisher surfaces:

| Observation | Pattern | Our proof check | Test decision |
| --- | --- | --- | --- |
| Game A screenshot đầu show board trước khi show daily reward | Core proof first | Prototype có real board clear trong level 1 | Test screenshot 1 là before/after board |
| Game B video mở bằng near-fail state với một nước giải | Solvable tension | Prototype có level almost-solved thật, không cần fake | Test 3-second "one move saves board" |
| Game C show room decoration/meta rất sâu | Meta progression promise | Prototype chưa có room/meta reward | Không hứa meta trong store/ad |

Metric sau test:

| Variant | CTR | Store CVR | D1 | Diagnosis |
| --- | ---: | ---: | ---: | --- |
| Old store: logo + board generic | 1.7% | 18% | 29% | Store proof yếu, product không hẳn yếu |
| New screenshot: before/after board clear | 1.8% | 31% | 30% | Proof order cải thiện conversion |
| Challenge opening: "one move saves board" | 3.4% | 21% | 18% | Hook hút click nhưng mismatch/fairness risk |

Verdict: giữ screenshot proof-first, bỏ challenge opening hoặc làm nó trung thực hơn. Lesson không phải "đối thủ dùng challenge nên mình cũng dùng"; lesson là "proof order giúp store rõ hơn, challenge hook cần product proof mạnh hơn".

Second-pass read:

| Pattern | First read | Hidden risk | Better decision |
| --- | --- | --- | --- |
| Proof-before-decoration | Screenshot proof-first improved Store CVR | Nếu D1 không đổi, store chỉ sửa install path, không sửa retention | Keep screenshot order, then inspect first-session proof separately |
| Almost-solved tension | CTR looks attractive | Can become fake difficulty or curiosity trap if puzzle is not fair | Test only with real level state and CVR/D1 guardrail |
| Deep meta progression | Looks common in large competitors | Requires content depth and early reward proof | Hold; do not put meta promise in first packet |
| Action verb clarity | Easy to adapt | Can become keyword stuffing if verb is too broad | Test honest verb tied to first action |

Decision memo:

```text
Test first:
- Proof-before-decoration screenshot.
- Action verb clarity in short copy.

Test cautiously:
- Almost-solved tension, only with real solvable board.

Hold:
- Deep meta progression until first-session reward exists.

Reject:
- Character/IP wrapper and exact visual execution.
```

Điểm sâu: competitor teardown không tạo ra "things to copy". Nó tạo ra **testable hypotheses with boundaries**. Boundary càng rõ, team càng dễ học pattern mà vẫn giữ identity riêng.

### Source-to-test acceptance memo

Khi chọn một pattern để test, viết memo ngắn để handoff cho creative/store owner.

```text
Source-to-test memo - Proof-before-decoration screenshot

Source surface:
- Competitor store screenshot order.

Observable fact:
- Screenshot 1 shows gameplay proof before reward/meta UI.

Transferable pattern:
- Proof before decoration.

Our proof:
- Level 1 has a real before/after clear state that can be captured honestly.

Test asset:
- Store screenshot 1 variant: before/after board clear.

Metric pair:
- Store CVR + D1 direction.

Copy guard:
- Do not copy board layout, art style, UI frame, wording, color palette or exact puzzle state.

Decision allowed:
- If Store CVR improves and D1 does not degrade, keep proof-first screenshot order.

Decision blocked:
- Do not infer retention solved.
- Do not add meta promise.
- Do not claim competitor execution is the reason; only the ordering principle is being tested.
```

Memo này giúp người làm asset hiểu ranh giới. Họ đang test một **principle**, không tái dựng surface của đối thủ.

---

## Teardown quality checklist

| Check | Pass condition |
| --- | --- |
| Source concrete | Có URL/store/public surface cụ thể |
| Fact visible | Insight bắt đầu bằng điều nhìn thấy, không đoán nội bộ |
| Pattern named | Pattern được viết bằng hành vi: proof first, tension, action verb |
| Transferability | Có đánh giá team mình chứng minh được hay chưa |
| Test mapping | Pattern chuyển thành hook/store/first-session asset |
| Metric pair | Có metric để đọc sau test |
| Copy guard | Có dòng nói rõ không copy gì |

Quality chain:

`competitor surface -> observable fact -> transferable pattern -> our proof -> test asset -> metric read -> next action`

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play mô tả preview assets như icon, screenshots, feature graphic/video để showcase app/game trước khi user cài. | Khi teardown listing, screenshots/video là proof surface; hãy đọc chúng theo lời hứa đang được chứng minh. | Không suy ra mọi listing cần cùng thứ tự asset; context và traffic source vẫn quan trọng. |
| [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/) | Product page optimization cho phép thử nhiều phiên bản product page elements trên App Store. | Teardown chỉ tạo hypothesis; vẫn cần test asset của chính bạn để biết pattern có hợp không. | Không suy ra pattern từ App Store luôn chuyển nguyên sang Google Play hoặc ngược lại. |
| [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio) | Publisher catalog public thể hiện nhiều puzzle/sort games với action verbs khác nhau. | Đọc catalog để nhận diện action verb và motivation family, không gom thành một audience duy nhất. | Không suy ra performance, CPI hoặc revenue từ catalog public. |
| [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle) | Store surface public tập trung vào action verb "screw/sort" và puzzle object cụ thể. | Action verb rõ giúp user hiểu nhanh game làm gì; đây là pattern có thể học mà không copy execution. | Không copy object layout, wording hoặc visual execution của listing. |

Screenshot readout worksheet:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Screenshot/video đầu tiên show gameplay, reward, meta hay brand? | Surface đang ưu tiên proof type nào. | Không suy ra proof type đó thắng nếu chưa test trên game bạn. |
| Text claim dùng verb cụ thể hay claim rộng? | Action verb càng rõ càng dễ tạo creative/store continuity. | Không keyword-stuff title nếu promise không thật. |

---

## Common mistakes

- **Mistake - Correction:** Copy màu, board, character hoặc wording của đối thủ.
  **Correction:** Chỉ học pattern transferable như proof order, action verb clarity, tension type.

- **Mistake - Correction:** Ghi "đối thủ làm ASO tốt" mà không có observable fact.
  **Correction:** Ghi rõ screenshot nào, title nào, video opening nào, proof nào.

- **Mistake - Correction:** Dùng competitor lớn làm benchmark trực tiếp cho indie prototype.
  **Correction:** Dùng họ như caution/directional pattern, không dùng result hoặc scope làm target.

- **Mistake - Correction:** Thêm mọi pattern hay vào một test.
  **Correction:** Một test chỉ thay một layer chính: screenshot order, hook opening hoặc title/action verb.

- **Mistake - Correction:** Không viết "do not copy".
  **Correction:** Mỗi row teardown phải có copy guard để bảo vệ identity và giảm rủi ro clone.

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong bài |
| --- | --- |
| Competitor teardown | Phân tích surface public để rút pattern testable |
| Observable fact | Điều có thể nhìn thấy/ghi lại từ store/ad/public page |
| Transferable pattern | Pattern có thể học mà không copy execution |
| ASO | App Store Optimization, tối ưu store surface để tăng visibility/conversion |
| Creative testing | Test hook/format/variant để học signal |
| Copy guard | Ranh giới nói rõ không copy art, IP, wording, layout, claim |

---

## Lab output example

```text
Competitor Teardown Sheet - v1

Competitor 1 URL:
Surface observed: Google Play screenshot order
Observable fact: screenshot 1 shows real gameplay board before reward/meta UI
Pattern: proof before decoration
Our hypothesis: screenshot 1 with real before/after board clear will improve Store CVR
Test asset: Store screenshot variant A
Metric read: Store CVR + D1
Do not copy: art style, board layout, exact wording

Competitor 2 URL:
Surface observed: video opening
Observable fact: first seconds show almost-solved board
Pattern: solvable tension
Our hypothesis: a real near-solve moment can lift CTR without fake gameplay
Test asset: 3-second creative opening
Metric read: CTR + CVR + D1
Do not copy: fake difficulty, exact puzzle shape

Decision:
- Test first: proof-before-decoration screenshot
- Hold: deep meta/progression promise
- Reject: character/IP wrapper
```

---

## Practical Lab

1. Chọn 3 competitor surfaces cụ thể, ưu tiên store pages hoặc public screenshots/video pages.
2. Ghi 3 observable facts cho mỗi surface. Không ghi cảm nhận như "đẹp" nếu chưa mô tả được đẹp ở đâu.
3. Đặt tên pattern cho mỗi fact bằng hành vi: `proof first`, `action verb clarity`, `solvable tension`, `reward preview`.
4. Đánh giá pattern có transferable không với prototype hiện tại.
5. Chọn 1 pattern để test và viết metric pair.
6. Viết copy guard cho từng row.
7. Viết teardown pattern contract cho pattern được chọn.
8. Viết source-to-test memo để handoff thành asset request cụ thể.

Pass lab khi một teammate có thể nhìn sheet và biết chính xác asset nào cần làm, metric nào cần đọc, và thứ gì không được copy.

---

## Final UA Plan Update

Cập nhật trường **Audience** trong Final UA Plan, đồng thời ghi tác động sang creative/store:

```text
Competitor pattern observed:
Player motivation implied:
Transferable pattern to test:
Our proof asset:
Metric pair to read:
Copy guard:
Pattern contract:
Source-to-test memo:
Pattern rejected and why:

Creative matrix impact:
- Hook/format affected:
- Variant to create:

Store proof impact:
- Screenshot/video element to change:
- Claim to avoid:
```

Nếu pattern được chọn mâu thuẫn với market thesis Day 2 hoặc motivation Day 3, ghi rõ bạn đang đổi thesis hay chỉ test một store/creative execution.

---

## Checklist Focus

- [ ] Có 3 competitor surfaces cụ thể.
- [ ] Mỗi insight bắt đầu bằng observable fact.
- [ ] Có pattern transferable, không chỉ moodboard.
- [ ] Có test asset cụ thể của game mình.
- [ ] Có metric pair để đọc sau test.
- [ ] Có copy guard cho từng competitor row.
- [ ] Pattern được chọn có contract đầy đủ: source, fact, transferability, proof, metric, guard.
- [ ] Có source-to-test memo để biến pattern thành asset request không clone.
- [ ] Có ít nhất một pattern bị reject để tránh scope creep.

---

## Curated References

- [Google Play Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Apple Developer - Product page optimization](https://developer.apple.com/app-store/product-page-optimization/)
- [Google Play - Zego Studio](https://play.google.com/store/apps/developer?id=Zego+Studio)
- [Google Play - Screw Sort 3D](https://play.google.com/store/apps/details?id=com.ig.screw.sort.puzzle)
', now()),
  ('lessons/day-20.md', 'markdown', null, '---
day: 20
title: "Creative fatigue and iteration cadence"
module: "Week 3 - Creative and store readiness"
stages: [live]
related_terms: [Creative fatigue, CTR, ROAS]
artifact: "Creative iteration rule"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Creative iteration rule**: bộ quy tắc nói rõ khi nào `refresh`, khi nào làm `variant`, khi nào `pivot`, và khi nào `hold` vì dữ liệu chưa đủ hoặc vấn đề không nằm ở creative.

Quyết định cần học: không gọi mọi ngày xấu là creative fatigue. Bạn chỉ đổi creative khi metric pattern chỉ đúng tầng creative; nếu leak nằm ở store, onboarding, tracking hoặc monetization thì action phải khác.

Output cần có:

- Rule cho `refresh / variant / pivot / hold`.
- Weekly cadence board có owner, review date và production capacity.
- Metric pattern nối với diagnosis bucket.
- Cập nhật **successCriteria**, **creativeMatrix**, **killCriteria** và **nextAction** trong Final UA Plan.

---

## Why this matters

Team nhỏ thường phản ứng với creative data theo hai cực. Một là đổi quá nhanh: thấy một ngày CTR giảm là làm asset mới, khiến production capacity bị đốt vào noise. Hai là đổi quá chậm: một asset từng thắng bị chạy quá lâu, IPM giảm, CPI tăng, rồi team tưởng product yếu.

Creative fatigue không chỉ là "ad cũ". Nó có thể là:

- Audience đã thấy asset quá nhiều.
- Opening frame không còn kéo attention.
- Store không còn chứng minh promise khi traffic thay đổi.
- Product không giao đúng first-session proof.
- Tracking/window làm report bị nhiễu.

Với budget `$100-500`, bạn không có luxury để sản xuất vô hạn. Bạn cần cadence giúp mọi người biết thứ Hai đọc gì, thứ Ba làm asset nào, thứ Sáu review ra sao, và khi nào không động vào creative.

---

## Core model: refresh, variant, pivot, hold

| Action | Dùng khi | Không dùng khi | Thay đổi gì | Giữ nguyên gì |
| --- | --- | --- | --- | --- |
| Refresh | attention giảm nhưng promise chain còn khỏe | D1/tutorial yếu từ đầu | opening frame, crop, caption, thumbnail, pacing | motivation và core promise |
| Variant | motivation có signal tốt nhưng execution chưa tối ưu | winner chỉ là sample noise | angle nhỏ, first 3s, visual framing | hook family |
| Pivot | motivation/promise fail qua ad + store + first session | chỉ một metric xấu một ngày | hook family hoặc motivation | learning record |
| Hold | sample/window/tracking chưa đủ | rule đủ rõ để action | không đổi asset | budget discipline |

Quy tắc thực tế: creative action phải trả lời câu "tôi đang đổi biến nào để học điều gì?". Nếu câu trả lời là "cho mới", đó không phải iteration strategy.

---

## Iteration cadence mẫu

| Cadence item | Owner | Khi nào làm | Output |
| --- | --- | --- | --- |
| Daily pulse | UA owner | mỗi ngày có spend | flag metric anomalies, không ra verdict lớn |
| Twice-weekly readout | UA + product | sau đủ spend/window | diagnosis bucket: creative/store/product/tracking |
| Weekly production lock | Creative owner | cuối tuần hoặc sau readout | 1-3 asset requests rõ condition |
| Store proof check | UA + ASO/store owner | khi CTR/CVR mismatch | screenshot/copy action |
| Learning log | UA owner | sau mỗi treatment | rule update: keep/kill/iterate |

Capacity guardrail cho team nhỏ:

| Team capacity | Creative request hợp lý |
| --- | --- |
| Solo dev/artist | 1 refresh + 1 variant/tuần |
| 2-3 người | 2 refresh + 2 variants/tuần |
| Có designer/video support | 1 new hook family + 2-3 variants/tuần |

Không viết plan mà production không làm nổi. Cadence tốt là cadence bền.

### Creative queue priority

Khi board có nhiều row cần action, đừng sản xuất theo row gây cảm xúc mạnh nhất. Hãy ưu tiên theo **learning value**, **business risk**, và **capacity fit**.

| Priority | Dùng cho | Vì sao ưu tiên | Action size |
| --- | --- | --- | --- |
| P0 hold/fix setup | tracking conflict, delivery unfair, store changed mid-window | nếu không sửa, mọi creative read bị bẩn | no new asset |
| P1 protect winner | winner cũ có CTR/IPM giảm nhưng CVR/D1 còn khỏe | giữ learning và revenue/installs hiện có | 1 refresh nhỏ |
| P2 rescue good motivation | CTR modest nhưng CVR/D1 tốt | motivation có thể đáng giữ, chỉ cần bán tốt hơn | 1-2 variants |
| P3 test new proof | hook family chưa có proof đủ rõ | mở thêm learning nhỏ nếu capacity còn | 1 controlled variant |
| P4 exploratory | ý tưởng mới chưa gắn metric pattern | chỉ làm khi không ảnh hưởng queue chính | parking lot |

Production queue mẫu:

```text
Creative queue
- P0 setup fix:
- P1 refresh winner:
- P2 variants:
- P3 proof test:
- Deferred:
- Capacity this week:
- Owner:
- Review date:
```

Quy tắc: nếu capacity là `1 refresh + 1 variant/tuần`, mọi request thứ ba phải có lý do cắt một request khác. Queue tốt không chỉ nói làm gì; nó cũng nói **không làm gì tuần này**.

### Iteration acceptance contract

Trước khi tạo asset mới, mỗi request phải pass một contract nhỏ. Contract này ngăn team biến mọi bất an trên dashboard thành "làm thêm creative".

| Request type | Được phép khi | Bị cấm khi | Evidence tối thiểu |
| --- | --- | --- | --- |
| Refresh | attention giảm, Store CVR/D1 còn khỏe | tutorial/D1 đã yếu từ đầu | 2-3 read ổn định, setup không đổi, downstream không đỏ |
| Variant | motivation có downstream signal tốt nhưng attention chưa mạnh | winner chỉ có sample nhỏ hoặc delivery lệch | cùng hook family, CVR/D1 guardrail tốt hơn sibling |
| Pivot | ad + store + first-session đều mismatch qua clean cells | chỉ CTR giảm một ngày | ít nhất 2 hook/proof cells sạch cùng fail |
| Hold | tracking/window/delivery/store thay đổi làm report bẩn | rule đủ sạch để action | mismatch note, next read window hoặc setup fix rõ |
| Store/product fix | metric chỉ leak ở store hoặc first session | creative attention là leak chính | diagnosis bucket không thuộc creative |

Rule vận hành: production request chỉ được vào queue khi có `condition`, `diagnosis`, `change one thing`, `keep unchanged`, `review trigger`, và `blocked conclusions`.

---

## Hero visual: fatigue decision tree

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: fatigue decision tree]
Type: hero operating diagram.
Lesson section: Hero visual: fatigue decision tree.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


[FATIGUE DECISION TREE]

```text
Start with 7-day pattern, not one bad day
        |
        v
Is delivery/spend stable enough to read?
  NO  -> HOLD / diagnose delivery
         Check: budget cap, audience overlap, learning reset, tracking delay.
         Action: do not refresh creative until delivery issue is explained.
  YES
        |
        v
Is CTR/IPM dropping while Store CVR, tutorial completion and D1 stay healthy?
  YES -> REFRESH
         Same promise, new opening frame, crop, pacing, caption or sound.
         Do not change market thesis or store claim.
  NO
        |
        v
Is CTR stable but Store CVR dropping?
  YES -> STORE VARIANT
         Refresh screenshot order, title/subtitle, preview proof or first store frame.
         Do not produce more ads until store proof is repaired.
  NO
        |
        v
Are CTR and CVR okay but tutorial completion or D1 weakening?
  YES -> PRODUCT / FIRST-SESSION FIX
         Improve onboarding, first win, difficulty ramp or promise payoff.
         Do not call it creative fatigue.
  NO
        |
        v
Are CTR, CVR and D1 weak across 2-3 distinct hooks with clean tracking?
  YES -> PIVOT
         Revisit motivation/promise from Day 2-3 and write a new hypothesis.
         Do not recycle the old asset with different wording only.
  NO  -> KEEP / SMALL VARIANT
         Continue current winner and test one controlled variable.
```

| Verdict | Trigger pattern | Action | What not to change |
| --- | --- | --- | --- |
| `REFRESH` | Attention drops, downstream proof still healthy | New first 2-3 seconds, crop, pacing, caption, sound | Market thesis, store promise, onboarding |
| `STORE VARIANT` | Clicks arrive but install conversion weakens | Screenshot order, title/subtitle, preview proof | Core creative hook until store is tested |
| `PRODUCT FIX` | Install is okay but tutorial/D1 weak | Level 1-3, tutorial friction, first clear/win moment | More ads or broader targeting |
| `PIVOT` | Multiple clean hooks fail across CTR/CVR/D1 | Rewrite motivation/promise and new test cell | Do not just reskin the old asset |
| `HOLD` | Signal is noisy or delivery/tracking changed | Wait, reconcile, cap spend, fix setup | Do not overproduce assets |


**Inspect:** tree bắt đầu bằng metric pattern, không bắt đầu bằng ý tưởng creative mới.
**Conclude:** chỉ refresh khi promise chain còn khỏe; pivot khi motivation fail có hệ thống.
**Do not infer:** một ngày xấu hoặc một creative delivery-biased không đủ để pivot.

---

## Weekly cadence board

```text
[VISUAL PLACEHOLDER: Third-party image request - Weekly cadence board]
Type: data visual/chart or decision board.
Lesson section: Weekly cadence board.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Hook family | Current asset | Metric pattern | Diagnosis | Action | Owner | Review date |
| --- | --- | --- | --- | --- | --- | --- |
| Satisfying clear | clear_chaos_v03 | CTR down 34%, CVR/D1 stable | attention fatigue | refresh first 2s | Creative | Fri |
| Calm break | calm_static_v01 | CTR modest, D1 stronger | fit good, attention weak | make 2 video variants | Creative + UA | next Tue |
| Challenge | one_percent_v02 | CTR high, CVR/D1 weak | curiosity trap | pivot/rewrite promise | UA owner | after new build |
| Progression | room_unlock_v01 | low spend, low sample | unreadable | hold | UA owner | after fair spend |

**Inspect:** mỗi row có diagnosis, không chỉ metric.
**Conclude:** cadence board biến report thành production action có owner.
**Do not infer:** board không ép bạn làm asset mới nếu diagnosis là store/product/tracking.

---

## Hướng dẫn đọc số

| Pattern | Diagnosis bucket | Action đúng | Action sai |
| --- | --- | --- | --- |
| CTR giảm 25-40%, CVR và D1 ổn | creative attention fatigue | refresh opening/caption/thumbnail | pivot motivation |
| CTR ổn, CVR giảm | store proof mismatch | sửa screenshot/title/preview | làm thêm 5 ads |
| CTR cao, CVR thấp, D1 thấp | curiosity trap hoặc overpromise | rewrite/pivot hook family | scale vì CTR đẹp |
| CTR vừa, CVR/D1 tốt | motivation fit, attention chưa tối ưu | làm variants cùng promise | bỏ hook vì CTR không cao |
| ROAS yếu, retention ổn | economy/payback issue | xem monetization placement/window | đổi creative ngay |
| Delivery lệch spend giữa variants | test unfair/noisy | hold hoặc reset test setup | gọi winner |
| Tracking/event conflict | measurement risk | reconcile trước | đổi asset theo số sai |

Decision rule: action phải có `condition + diagnosis + production change + owner + review date`.

Pre-flight trước khi gọi fatigue:

| Check | Câu hỏi | Nếu fail check này |
| --- | --- | --- |
| Delivery stability | Spend/impression có phân phối tương đối ổn giữa các ngày hoặc variants không? | Không gọi fatigue; kiểm tra budget cap, learning reset, audience overlap |
| Reporting window | Dữ liệu retention/ROAS đã đủ window chưa? | Không đổi creative theo số chưa chín |
| Store consistency | Store listing/screenshot/title có thay đổi trong cùng window không? | Tách store effect khỏi creative effect |
| Audience mix | Traffic có đổi country, placement, network, campaign objective không? | Gắn diagnosis là mix shift trước khi refresh |
| Event health | Impression, click, install, tutorial, purchase event có mất/đổi tên không? | Reconcile tracking trước khi ra action |

Fatigue thật thường có pattern hẹp: attention yếu đi nhưng downstream vẫn tương đối khỏe. Nếu nhiều tầng cùng yếu, đó thường là promise mismatch, product mismatch, tracking issue hoặc traffic mix shift.

Decision ladder:

```text
One bad day -> annotate, do not act.
Two or three bad reads with stable setup -> diagnose bucket.
Creative-only decline -> refresh.
Creative + store decline -> fix promise/store proof.
Creative + store + first-session decline -> pivot or product-proof repair.
No clean setup -> hold.
```

Micro-budget rule: refresh là action rẻ, pivot là action đắt. Đừng dùng pivot để giải quyết một vấn đề chỉ cần đổi first 2 seconds.

---

## Worked example: refresh hay pivot?

Team có 3 hook families cho puzzle prototype:

| Creative | Week 1 | Week 2 | Read | Decision |
| --- | --- | --- | --- | --- |
| Clear chaos | CTR 2.8%, CVR 31%, D1 24% | CTR 1.7%, CVR 30%, D1 23% | attention giảm, promise chain khỏe | refresh |
| Only 1% solve | CTR 4.2%, CVR 14%, D1 9% | CTR 3.9%, CVR 13%, D1 8% | curiosity trap lặp lại | pivot/rewrite |
| Quiet puzzle break | CTR 1.8%, CVR 28%, D1 26% | CTR 1.9%, CVR 29%, D1 27% | fit ổn, attention vừa | variant |

Production plan:

- `Clear chaos`: thay first 2 seconds bằng close-up board clear, giữ promise.
- `Only 1%`: không refresh. Rewrite thành "Can you find the calm solution?" hoặc bỏ challenge hook.
- `Quiet puzzle break`: làm 2 video variants, một ASMR clear, một no-timer calm flow.

Verdict: không có một nhãn "fatigue" chung. Mỗi hook family có action riêng theo diagnosis.

Second-pass diagnosis:

| Hook family | Điều dễ kết luận nhầm | Cách đọc đúng hơn | Production request tốt |
| --- | --- | --- | --- |
| Clear chaos | "CTR giảm, creative chết rồi" | CVR/D1 vẫn ổn nên promise còn đúng; surface attention bị mòn | Làm 1 refresh first 2s, giữ store proof |
| Only 1% solve | "CTR cao, cứ scale thêm" | CTR đẹp nhưng CVR/D1 yếu lặp lại; đây là overpromise risk | Dừng challenge-copy cũ, viết hook honest hơn |
| Quiet puzzle break | "CTR thấp nên bỏ" | Downstream khỏe hơn, có thể là motivation fit nhưng opening chưa đủ rõ | Làm 2 variants cùng promise, không pivot |

Learning log nên ghi bằng câu có điều kiện:

```text
If Clear chaos CTR drops again while CVR/D1 stay healthy, refresh surface once more.
If refresh does not recover IPM, test a new proof angle before pivoting.
If Quiet puzzle break keeps D1 advantage, invest in attention variants even if CTR is not the top row.
```

Cách ghi này giúp tuần sau không lặp lại tranh luận cũ. Team nhìn log là biết rule nào đã được test, rule nào vẫn chỉ là giả thuyết.

### Weekly production ticket

Sau readout, output nên là ticket nhỏ, không phải "làm thêm creative". Ticket tốt nói rõ metric pattern, action type, biến được đổi, biến bị khóa, và review window.

```text
Creative production ticket
- Hook family: Clear chaos
- Diagnosis: attention fatigue, promise chain still healthy
- Action type: refresh
- Change one thing: first 2 seconds crop/pacing
- Keep unchanged: hook promise, store screenshot order, build, target country
- Required proof: before/after clear appears in first second
- Capacity slot: P1 refresh winner
- Owner: creative owner
- Review trigger: after 72h or $80 spend
- Blocked conclusions: do not infer market thesis change from this refresh alone
```

Weekly review memo:

```text
Creative cadence memo
- What changed this week:
- What stayed frozen:
- Which rule was tested:
- Result:
- Rule update:
- Next queue decision:
```

Nếu ticket không có "keep unchanged", retest sau đó sẽ khó đọc. Nếu ticket không có "blocked conclusions", team dễ overclaim từ một refresh nhỏ.

### Treatment acceptance memo

Sau khi treatment chạy đủ window, đừng chỉ ghi "asset thắng/thua". Viết memo để cập nhật rule.

```text
Treatment acceptance memo - Clear chaos refresh

Treatment tested:
- Refresh first 2 seconds, same promise, same store, same source.

Observed pattern:
- CTR recovered from 1.7% to 2.2%.
- Store CVR stayed stable.
- D1 stayed stable.

Decision allowed:
- Keep refreshed asset as current control.
- Queue one close variant if capacity remains.

Decision blocked:
- Do not call the hook family permanently solved.
- Do not pivot market thesis.
- Do not change store screenshot based on this treatment.

Rule update:
- For Clear chaos, one surface refresh can recover attention when downstream proof is healthy.
- If next refresh fails to recover IPM, test a new proof angle before pivot.
```

Memo này làm creative iteration thành hệ thống học, không phải cảm giác "asset mới có vẻ tốt hơn".

---

## Iteration quality checklist

| Check | Pass condition |
| --- | --- |
| Metric window | Rule ghi rõ đọc sau bao nhiêu ngày/spend/sample |
| Diagnosis bucket | Creative/store/product/tracking/economy được tách |
| Action type | Refresh/variant/pivot/hold rõ |
| Production request | Asset request cụ thể, nhỏ, làm được |
| Owner | Có người chịu trách nhiệm |
| Review date | Có ngày đọc lại |
| Learning log | Kết quả treatment được ghi để tuần sau không lặp |
| Capacity | Số asset phù hợp năng lực team |

Quality chain:

`metric pattern -> diagnosis bucket -> action type -> production request -> owner -> review date -> learning log`

---

## Real usecases đã đối chiếu nguồn

| Source | Observable fact | Lesson interpretation | Do not infer |
| --- | --- | --- | --- |
| [Apple Developer - Product Page Optimization](https://developer.apple.com/app-store/product-page-optimization/) | Apple cho phép thử các phiên bản product page khác nhau để xem performance. | Iteration không chỉ nằm ở ad creative; store surface cũng là một biến trong promise chain. | Không đổi nhiều element cùng lúc nếu mục tiêu là học nguyên nhân. |
| [Google Play Help - Preview assets](https://support.google.com/googleplay/android-developer/answer/9866151) | Google Play mô tả preview assets như screenshots/video giúp showcase trải nghiệm/value của app/game. | Refresh creative/store vẫn phải chứng minh value thật, không chỉ làm visual "mới". | Không dùng preview assets như decoration nếu không chứng minh hook. |
| [Google Play Store Listing Experiments](https://support.google.com/googleplay/android-developer/answer/6227309) | Google Play hỗ trợ store listing experiments cho một số asset/text listing. | Store iteration nên có hypothesis và measurement, không chỉ đổi theo cảm giác. | Không suy ra kết quả store experiment sẽ giống paid ad traffic nếu traffic mix khác. |

Treatment readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Treatment đổi biến nào: opening, screenshot, caption hay hook family? | Biết metric thay đổi do biến nào hơn là "asset mới". | Treatment thắng một lần không phải truth vĩnh viễn. |

---

## Common mistakes

- **Mistake - Correction:** Gọi mọi performance drop là creative fatigue.
  **Correction:** Tách attention, store proof, product proof, tracking và economy trước.

- **Mistake - Correction:** Pivot sau một ngày CTR xấu.
  **Correction:** Pivot chỉ khi motivation fail qua ad/store/first-session trong clean window.

- **Mistake - Correction:** Refresh creative khi D1 yếu từ đầu.
  **Correction:** Sửa first-session proof hoặc rewrite promise; refresh không chữa product mismatch.

- **Mistake - Correction:** Làm 10 assets mới vì một hook thắng.
  **Correction:** Làm 2-3 variants có learning question, theo capacity thực tế.

- **Mistake - Correction:** Không có learning log.
  **Correction:** Ghi `condition -> action -> result -> rule update` sau mỗi treatment.

---

## English Terms You Should Keep

| Term | Nghĩa dùng trong bài |
| --- | --- |
| Creative fatigue | Hiệu suất creative giảm do attention/audience/placement mòn |
| Refresh | Đổi surface execution nhưng giữ promise/motivation |
| Variant | Phiên bản mới quanh motivation đã có bằng chứng |
| Pivot | Đổi motivation hoặc hook family |
| Hold | Không action vì sample/window/tracking chưa đủ |
| IPM | Installs per Mille, đo hiệu quả impression thành install |
| ROAS | Return On Ad Spend, cần window và confidence caveat |

---

## Lab output example

```text
Creative Iteration Rule - v1

Refresh rule:
- If CTR drops >=30% across 3 reporting days while Store CVR and D1 stay stable,
  refresh first 2 seconds, thumbnail or caption. Keep same promise.

Variant rule:
- If Store CVR and D1 are stronger than other hooks but CTR is only modest,
  produce 2 variants around the same motivation.

Pivot rule:
- If CTR is high but Store CVR and D1 are weak across 2 clean cells,
  stop the hook family and rewrite motivation/promise.

Hold rule:
- If spend distribution is unfair, tracking is missing, or cohort window is too early,
  do not call a winner. Reconcile first.

Capacity:
- This team can ship 1 refresh + 1 variant per week.

Learning log format:
- Date / hook family / condition / action / result / rule update.

Production ticket format:
- Hook family:
- Diagnosis:
- Action type:
- Change one thing:
- Keep unchanged:
- Required proof:
- Capacity slot:
- Review trigger:
- Blocked conclusions:
```

---

## Practical Lab

1. Chọn 3 hook families trong creative matrix hiện tại.
2. Với mỗi hook, ghi metric pattern sẽ kích hoạt refresh, variant, pivot hoặc hold.
3. Viết production request nhỏ nhất cho tuần tới.
4. Gắn owner và review date.
5. Thêm capacity guardrail: team làm được bao nhiêu assets/tuần?
6. Tạo learning log format.
7. Sắp xếp creative queue theo P0-P4.
8. Viết một production ticket cho request ưu tiên nhất.
9. Ghi một điều không làm trong tuần này để bảo vệ capacity.
10. Viết iteration acceptance contract cho request đó.
11. Chuẩn bị treatment acceptance memo để cập nhật rule sau khi chạy.

Pass lab khi bạn có thể nhìn report tuần và biết nên làm asset mới, sửa store, sửa product hay không làm gì.

---

## Final UA Plan Update

Cập nhật **creativeMatrix**:

```text
Iteration rules:
- Refresh condition:
- Variant condition:
- Pivot condition:
- Hold condition:
- Weekly creative capacity:
- Owner:
- Review cadence:
- Learning log format:
- Creative queue priority:
- Iteration acceptance contract:
- Production ticket format:
- Treatment acceptance memo:
- Deferred requests:
```

Cập nhật **successCriteria / killCriteria / nextAction**:

```text
Success criteria:
- Winner must keep promise chain healthy: CTR/IPM + Store CVR + D1.

Kill criteria:
- Do not kill hook from one-day CTR drop.
- Kill/rewrite hook family only when ad, store and first-session proof all show mismatch.

Next action:
- This week production request:
- What stays frozen:
- Blocked conclusions:
```

---

## Checklist Focus

- [ ] Có rule riêng cho refresh, variant, pivot, hold.
- [ ] Metric bucket tách creative/store/product/tracking/economy.
- [ ] Production request phù hợp capacity team.
- [ ] Mỗi action có owner và review date.
- [ ] Mỗi production request có contract: condition, diagnosis, change one thing, keep unchanged.
- [ ] Treatment acceptance memo cập nhật rule sau khi chạy.
- [ ] Có learning log format.
- [ ] Final UA Plan đã cập nhật creativeMatrix và successCriteria.

---

## Curated References

- [Apple Developer - Product Page Optimization](https://developer.apple.com/app-store/product-page-optimization/)
- [Google Play Help - Add preview assets to showcase your app](https://support.google.com/googleplay/android-developer/answer/9866151)
- [Google Play Help - Run store listing experiments](https://support.google.com/googleplay/android-developer/answer/6227309)
', now()),
  ('lessons/day-21.md', 'markdown', null, '---
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
[VISUAL PLACEHOLDER: Third-party image request - Readiness gate diagram]
Type: hero operating diagram.
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
[VISUAL PLACEHOLDER: Third-party image request - Creative packet gate scorecard]
Type: scorecard / launch gate heatmap.
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
', now()),
  ('lessons/day-22.md', 'markdown', null, '---
day: 22
title: "Campaign structure for a micro test"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, Ad set, ROAS]
artifact: "Campaign structure note"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Campaign structure note** cho micro test đầu tiên: learning goal, channel/geo, budget cap, cell count, creative grouping, naming convention, required report columns, confidence language và review/stop rule.

Quyết định chính: **không tạo nhiều campaign/ad set/cell hơn mức budget có thể nuôi bằng signal có nghĩa**.

Với budget `$100-500`, structure tốt không phải structure trông "pro" nhất. Structure tốt là structure giúp bạn trả lời một câu hỏi sau test: hook/store/first session/tracking có đủ tốt để iterate tiếp không?

Artifact này cập nhật field **budget**, **creativeMatrix**, **tracking**, **successCriteria** và **nextAction** trong Final UA Plan.

## Why this matters

Campaign structure là cách bạn phân bổ quyền được học. Nếu chia quá nhiều ad set, quá nhiều creative cell, quá nhiều geo hoặc đổi quá nhiều biến cùng lúc, mỗi dòng report sẽ có quá ít spend/install để kết luận. Bạn vẫn có dashboard, nhưng dashboard đó chỉ cho cảm giác vận hành, không cho quyết định.

Micro soft-launch thường không nhằm scale ngay. Nó nhằm đọc:

- hook motivation nào đáng giữ
- store có chứng minh promise không
- first session có giữ lời không
- tracking có đủ để chẩn đoán không
- budget có đang bị chia vụn không

Nguyên tắc vận hành: **test nhỏ nhưng phải đọc được**. Ít cells hơn thường có vẻ kém tham vọng, nhưng với budget nhỏ, nó bảo vệ bạn khỏi kết luận từ noise.

## Core model: structure follows learning goal

Thiết kế structure từ câu hỏi ngược lên:

`learning goal -> decision unit -> variables -> budget per cell -> naming -> report columns -> review rule -> confidence language`

| Layer | Câu hỏi phải trả lời | Bad smell | Output cần có |
| --- | --- | --- | --- |
| Learning goal | Test này học điều gì duy nhất? | "Test xem game có ổn không" | 1 câu hỏi cụ thể |
| Decision unit | Một row/cell đại diện cho quyết định nào? | Row chỉ là tên ad mơ hồ | Hook/geo/variant rõ |
| Variables | Biến nào được phép đổi? | Đổi creative, geo, store và build cùng lúc | Biến chính + biến giữ nguyên |
| Budget per cell | Mỗi cell có đủ signal không? | Spend bị chia vụn | Budget/cell + CPI scenario |
| Naming | Có trace asset về report không? | Campaign name không chứa hook | Naming convention |
| Report columns | Metric có đọc chain không? | Chỉ có CPI/CTR | Spend, CTR, CVR, CPI, IPM, early events, D1 |
| Review rule | Khi nào đọc, khi nào chưa đọc? | Refresh dashboard mỗi giờ | Spend/date floor + caveat |

Rule: nếu một cell không trả lời được "cell này giúp mình quyết định gì?", cell đó nên bị gộp, bỏ hoặc chuyển sang test sau.

## Campaign structure note mẫu

| Field | Example cho mobile puzzle micro test | Decision job |
| --- | --- | --- |
| Learning goal | Đọc 3 hook motivations trước khi sửa product | Giữ test tập trung vào creative promise |
| Channel | Android-first paid social/ad network test | Không trộn platform logic |
| Geo | 1 affordable CPI region cluster | Không fragment signal theo geo |
| Budget cap | `$240` total, daily cap nhỏ | Chặn runaway spend |
| Cells | 3 hook families x 2 variants = 6 cells | Đủ nhỏ để đọc directional signal |
| Control variables | Store page stable; build stable | Tránh creative/store/product bị trộn |
| Naming | `W4_T1_GEO_hook_variant_YYYYMMDD` | Trace asset -> metric |
| Required events | `first_open`, `tutorial_complete`, `level_complete` | Đọc first-session proof |
| Review rule | Review after spend floor or day 4 | Giảm overreaction |
| Confidence language | directional, weak, not enough signal | Không nói quá data |

## Campaign cell map

```text
[VISUAL PLACEHOLDER: Third-party image request - Campaign cell map]
Type: hero operating diagram.
Lesson section: Campaign cell map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Tree level | Example | What it controls | What it must not hide |
| --- | --- | --- | --- |
| Campaign | `W4_T1_Android_HookRead` | One learning goal and total cap | Multiple goals mixed together |
| Geo/ad set | `GEO_AffordableCluster` | Delivery region and budget/schedule | Too many geo splits |
| Hook family | `challenge`, `satisfaction`, `relax` | Motivation/promise being tested | Unlabeled creative ideas |
| Variant | `v1_openingA`, `v2_openingB` | Execution variant | Store/build changes |
| Report row | One hook variant row | Spend, `CTR`, `CVR`, `IPM`, events | Winner claim without caveat |
| Decision note | keep, iterate, hold, rerun | Next action | Metric-only commentary |

**Inspect:** mỗi branch có một budget, một biến chính và một learning question.

**Conclude:** ít branch hơn giúp mỗi branch có cơ hội nhận signal và trace về decision.

**Do not infer:** mọi campaign lớn đều nên đơn giản như micro test; bài này dành cho first learning test với budget nhỏ.

## Budget per cell compression

```text
[VISUAL PLACEHOLDER: Third-party image request - Budget per cell compression board]
Type: budget compression chart / cell-count decision board.
Lesson section: Budget per cell compression.
Visual brief: show how a fixed micro-budget gets thinner as cells increase, and mark which cell counts allow directional learning versus noise.
Teaching job: help the learner decide whether to run 3, 6, 9, or 12 cells before spending money.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Total budget | CPI scenario | Cells | Budget/cell | Approx installs/cell | Decision allowed |
| ---: | ---: | ---: | ---: | ---: | --- |
| `$240` | `$0.80` | 3 | `$80` | ~100 | Stronger directional hook read |
| `$240` | `$0.80` | 6 | `$40` | ~50 | Directional creative/store read |
| `$240` | `$0.80` | 9 | `$27` | ~34 | Weak read, careful caveat |
| `$240` | `$0.80` | 12 | `$20` | ~25 | Too thin for winner claim |
| `$240` | `$1.50` | 6 | `$40` | ~27 | Too thin for retention conclusion |

**Inspect:** giữ total budget cố định, cell count càng cao thì budget/install per cell càng mỏng.

**Conclude:** nếu CPI thực tế cao hơn scenario, giảm cell count trước khi kết luận hook.

**Do not infer:** bảng này không đưa benchmark CPI phổ quát; nó minh họa logic phân bổ signal.

### Budget guardrail read

Trước launch, viết một guardrail để team biết khi nào phải nén structure:

| Trigger | Ý nghĩa | Quyết định đúng |
| --- | --- | --- |
| CPI thực tế cao hơn scenario 50%+ trong ngày đầu | Installs/cell sẽ mỏng hơn plan | Giảm cells hoặc kéo dài read window, không thêm variants |
| 2+ cells gần như không có spend | Delivery bias đang che mất comparison | Rerun ít cells hơn hoặc isolate hook quan trọng |
| Store/build đổi giữa test | Signal không còn cùng điều kiện | Đánh dấu dirty read, không chọn winner |
| D1 quá mỏng dưới mỗi cell | Retention chưa đọc được | Chỉ claim acquisition/store direction |
| Tracking event fail | Product proof không hợp lệ | Hold interpretation, fix tracking trước |

Decision note nên ghi trước launch:

```md
Budget guardrail:
- Planned CPI scenario:
- Max cells:
- Compress trigger:
- Dirty-read trigger:
- Allowed claim if D1 is thin:
```

Với micro-budget, discipline tốt nhất không phải là đọc nhiều chart hơn. Discipline tốt nhất là biết lúc nào chart chưa được phép ra verdict.

### Structure acceptance contract

Trước khi launch, Campaign structure note phải được sign-off như một contract. Mục tiêu không phải là làm giấy tờ đẹp; mục tiêu là ngăn team đổi biến, thêm cell hoặc đọc quá quyền khi data còn mỏng.

| Contract field | Câu hỏi phải khóa trước launch | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Learning question | Test này chỉ học điều gì? | Một câu hỏi duy nhất | Tách test hoặc viết lại goal |
| Max cells | Budget nuôi tối đa bao nhiêu cells? | Có cell count và budget/cell | Giảm variants trước launch |
| Frozen variables | Biến nào không được đổi? | Store/build/geo/tracking được ghi rõ | Report sau test sẽ bị dirty |
| Compress trigger | Khi nào phải nén structure? | CPI/delivery/install trigger cụ thể | Team dễ thêm spend vào noise |
| Dirty-read trigger | Khi nào report mất quyền kết luận? | Tracking, naming, store/build change được nêu | Không winner claim |
| Allowed claims | Nếu D1 mỏng, vẫn được claim gì? | Acquisition/store direction hoặc setup issue | Không nói "retention tốt/xấu" |
| Blocked claims | Report này bị cấm kết luận gì? | Scale/kill/product verdict được khóa nếu thiếu data | Dễ overclaim |
| Owner/date | Ai đọc và khi nào? | Có owner, date, review floor | Không có accountability |

```md
Structure acceptance contract:
- Learning question:
- Max cells:
- Frozen variables:
- Compress trigger:
- Dirty-read trigger:
- Allowed claims if D1 is thin:
- Blocked claims:
- Owner/date:
```

Acceptance rule: nếu chưa viết được `allowed claims` và `blocked claims`, campaign chưa sẵn sàng launch. Khi data về, team sẽ đọc theo cảm xúc thay vì đọc theo quyền kết luận đã thống nhất.

## Hướng dẫn đọc số

| Pattern trong report | Diagnosis | Next action |
| --- | --- | --- |
| Cell nào cũng ít installs | Structure fragment quá mức hoặc CPI cao hơn scenario | Giảm cells, không kết luận hook |
| Một hook nhận spend nhiều, hook khác gần như không | Delivery bias | Ghi caveat; rerun cleaner nếu cần |
| `CTR` cao, `CVR` thấp ở một hook | Ad promise kéo click nhưng store proof yếu | Sửa screenshot/copy trước khi thêm variant |
| `CTR` và `CVR` ổn, early event yếu | First-session proof không giữ lời | Kiểm tutorial/level 1-3 |
| D1 quá ít user | Retention signal chưa đủ | Không scale/kill dựa trên D1 mỏng |
| Store/build đổi giữa test | Biến bị trộn | Đánh dấu report dirty, không winner claim |
| Event thiếu hoặc naming sai | Measurement/readout không trace được | Fix tracking/naming trước test sau |

Confidence language:

| Evidence strength | Nên nói | Tránh nói |
| --- | --- | --- |
| Spend/install mỏng | "Weak directional signal" | "Winner" |
| `CTR`/`CVR` rõ nhưng D1 mỏng | "Acquisition/store signal only" | "Game retention tốt" |
| Delivery không đều | "Platform delivery favored X" | "X chắc chắn thắng" |
| Event thiếu | "Measurement incomplete" | "Product yếu" |

Structure triage gate:

| Gate | Use when | Structure action | Report language |
| --- | --- | --- | --- |
| Keep reading | Most cells have enough spend/install to compare directionally | Keep structure unchanged until review floor | "Directional read in progress" |
| Compress | Installs/cell are too thin across the board | Reduce variants, merge hook variants, keep only strongest learning question | "Signal too fragmented; no winner claim" |
| Rebalance/rerun | Platform delivery starves important cells | Rerun fewer cells or separate the starved hook into a cleaner test | "Delivery-biased read; not a clean loss" |
| Hold | Tracking, naming, store page, or build changed mid-test | Stop interpretation; fix setup before more spend | "Dirty read; measurement/setup invalidates conclusion" |
| Promote to next test | One hook has usable acquisition/store signal and no setup caveat | Build next test around that promise, not around every old variant | "Candidate promise for iteration, not scale proof" |

Decision rule: first decide whether the report is **readable**, then decide whether any hook is promising. A thin or dirty report should change the next structure, not force a fake creative verdict.

Structure decision ledger:

| Report state | Classification | What it means | Next structure decision |
| --- | --- | --- | --- |
| Enough spend across most cells, no setup change | Readable directional test | You can compare hook/store direction with caveats | Keep structure for the planned readout |
| Installs/cell too thin across all cells | Thin read | Budget was fragmented or CPI scenario was too optimistic | Compress cell count before more spend |
| One or two cells starved by delivery | Delivery-biased read | Platform allocation created an unfair comparison | Rerun fewer cells or isolate the starved hook |
| Store/build/tracking changed mid-test | Dirty read | You cannot attribute movement to creative/campaign structure | Hold interpretation and fix setup |
| One hook has usable `CTR`/`CVR` but weak D1 | Acquisition/store signal only | Promise may be worth iterating, but retention is not proven | Promote to next test with first-session proof focus |
| Events missing or names drifted | Measurement-invalid read | Report cannot connect spend to product proof | Fix tracking before campaign changes |

Decision memo format:

```md
Report readability:
- State:
- Classification:
- Evidence:
- What we can claim:
- What we cannot claim:
- Structure change before next spend:
```

Rule: a bad report is still useful if it tells you how to structure the next test. The failure is not "numbers are weak"; the failure is pretending weak numbers are a winner/loser verdict.

### Campaign structure sign-off memo

Sau khi đọc report, viết memo này để chuyển từ "setup đã chạy" sang "next structure phải đổi gì". Memo tốt thường ngắn, nhưng phải ghi rõ quyền kết luận.

```md
Campaign structure sign-off
- Accepted structure:
- Frozen variables:
- Compress triggers:
- Dirty-read triggers:
- Allowed conclusions:
- Blocked conclusions:
- Structure change before next spend:
- Owner/date:
```

Example:

```md
Campaign structure sign-off
- Accepted structure: 3 hook families x 2 variants, one geo cluster, stable store/build.
- Frozen variables: store screenshots, tutorial build, required events.
- Compress triggers: CPI rises above scenario by 50%+ or installs/cell stay too thin after spend floor.
- Dirty-read triggers: tracking event fail, store/build change, naming cannot trace asset.
- Allowed conclusions: directional hook/store read; acquisition/store signal only if D1 is thin.
- Blocked conclusions: scale-ready hook, product retention verdict, Hook B lost if delivery-starved.
- Structure change before next spend: compress to 3 hook cells if delivery remains skewed.
- Owner/date: UA owner reviews day 4 or after spend floor.
```

Memo này biến structure thành một operating agreement. Khi platform delivery lệch hoặc CPI khác scenario, team không cần tranh luận lại từ đầu; trigger đã nói phải compress, rerun hoặc hold.

## Worked example: 6 cells hay 3 cells?

Team có `$240`, expected CPI khoảng `$0.80`, muốn test hook motivation cho puzzle prototype.

| Plan | Structure | Approx installs/cell | What can be learned | Risk |
| --- | --- | ---: | --- | --- |
| 3 hooks only | 3 cells | ~100 | Motivation direction | Ít biết execution variant |
| 3 hooks x 2 variants | 6 cells | ~50 | Motivation + rough execution | D1 caveat lớn |
| 3 hooks x 4 variants | 12 cells | ~25 | Mostly noise | Delivery bias, thin sample |

Verdict: chọn **6 cells** nếu 6 assets đã sẵn, store/build giữ nguyên và team chấp nhận D1 chỉ là directional. Nếu CPI thực tế tăng lên khoảng `$1.50`, giảm còn **3 hook cells** thay vì giữ 6 cells và giả vờ sample đủ.

Diagnosis sau 2 ngày:

| Signal | Read | Action |
| --- | --- | --- |
| Hook A spend cao, `CTR` tốt, `CVR` thấp | Store proof cho promise A yếu | Sửa screenshot đầu tiên cho hook A |
| Hook B ít spend, `CTR` chưa đọc được | Delivery bias | Không kill B; rerun nếu motivation quan trọng |
| Hook C `CTR` thấp nhưng users hoàn thành tutorial tốt | Creative opening yếu, product promise có thể ổn | Rewrite first 2 seconds |

Tradeoff: 3 cells học ít dimension hơn nhưng đọc sạch hơn. 12 cells nhìn tham vọng hơn nhưng dễ khiến team kết luận sai từ noise.

Second-pass structure read:

| Question | Answer | Decision impact |
| --- | --- | --- |
| Report có readable không? | 6-cell plan readable only if CPI stays near scenario and delivery is not too skewed | Keep a spend/review floor before verdict |
| Hook nào bị delivery-biased? | Hook B ít spend, chưa đủ đọc | Do not kill Hook B; rerun cleaner if strategically important |
| Hook nào có store mismatch? | Hook A `CTR` tốt nhưng `CVR` thấp | Fix store proof for A, do not create 4 more A videos |
| Hook nào có product-proof caveat? | Hook C has weak `CTR` but tutorial completion good | Improve opening creative; keep product proof stable |
| Nếu CPI rises to `$1.50`, structure đổi thế nào? | Installs/cell collapse | Compress to 3 hook cells before continuing |

Decision memo:

```md
Report readability:
- State: partially readable, with delivery caveat.
- Can claim: Hook A attracts attention but store proof is weak; Hook C may have product fit but opening is weak.
- Cannot claim: Hook B lost; D1 proves retention; any hook is scale-ready.
- Next structure: compress to 3 hook cells if CPI rises or delivery remains skewed.
- Stable variables: store/build unchanged except the named screenshot repair for Hook A.
```

Điểm sâu: campaign structure không kết thúc ở setup. Nó tiếp tục trong cách bạn đọc report và thiết kế test kế tiếp. Nếu report không đọc được, next action đúng thường là sửa structure, không phải sửa game.

## Campaign setup checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Learning goal | 1 câu rõ: hook, store, first session hay economics | Rewrite goal trước setup |
| Cell count | Budget/cell đủ cho directional read | Giảm variants/cells |
| Variables | Chỉ đổi biến chính | Tách test hoặc giữ biến ổn định |
| Naming convention | Week, test id, geo, hook, variant, date | Sửa trước launch |
| Creative mapping | Mỗi asset map về hook/motivation | Không upload asset mơ hồ |
| Tracking | Install và early events đã QA | Không chạy paid traffic |
| Budget control | Total cap, daily cap, review floor | Đặt cap trước launch |
| Report owner | Ai đọc report, ngày nào, format nào | Assign owner |

Quality chain: `learning goal -> cell count -> budget allocation -> naming -> report -> confidence -> decision`.

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Ads App campaigns setup best practices](https://support.google.com/google-ads/answer/6167162) | Google Ads guidance emphasizes enough budget/data for campaign learning, including budget guidance tied to target CPI/CPA. | Micro-budget teams should not fragment campaign cells beyond what budget can feed. | Do not copy Google budget multipliers blindly into a $100-500 indie test; use them as a warning about data hunger. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting is designed for privacy-preserving measurement without cross-party identifiers. | Campaign structure should include source/window/reporting caveats instead of pretending every dashboard is exact truth. | Do not overclaim precision from one platform report. |
| [Meta budgets, costs and schedules](https://www.facebook.com/business/ads/pricing) | Meta frames budget/schedule as inputs that affect ad delivery and learning over time. | Structure needs budget/schedule rules before launch, not emotional refreshes every hour. | Do not assume Meta/Google/TikTok delivery logic is identical. |

Report naming readout:

| Readout point | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Campaign/ad set name | Week, test id, geo, hook, variant visible | Report can trace asset to decision | Good naming fixes weak sample |
| Spend distribution | Did cells receive comparable signal? | Delivery bias must be named | Highest-spend row is automatically best |
| Required events | first open/tutorial/level events present | Product proof can be read | Event presence proves retention quality |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Chia quá nhiều ad sets vì muốn "test nhiều". | Structure theo one learning goal và budget/cell. |
| Vừa đổi geo, creative, store và build cùng lúc. | Chỉ đổi biến chính; ghi rõ biến giữ nguyên. |
| Không đặt naming convention. | Name phải chứa week/test/geo/hook/variant/date. |
| Dùng D1 mỏng để scale/kill. | Ghi confidence caveat, dùng D1 như directional. |
| Thấy platform spend lệch rồi gọi creative thắng. | Đánh dấu delivery bias; không winner claim. |
| Chạy traffic khi event chưa QA. | Fix tracking trước campaign. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Campaign` | Container chính của paid test |
| `Ad set` | Nhóm targeting/budget/placement tùy platform |
| `Cell` | Đơn vị test có thể đọc và ra quyết định |
| `Naming convention` | Quy tắc đặt tên để trace asset/report |
| `Delivery bias` | Platform phân phối spend không đều giữa variants |
| `Spend floor` | Mức spend tối thiểu trước khi đọc report |
| `Confidence language` | Cách diễn đạt độ chắc của kết luận |
| `ROAS` | Return on ad spend, cần caveat trong micro test |

## Lab output example

```md
Campaign structure note - W4 Test 1

Learning goal:
- Read 3 hook motivations for Android puzzle prototype without fragmenting signal.

Structure:
- Channel: Android-first paid social/ad network.
- Geo: one affordable CPI region cluster.
- Budget: $240 total, $40 directional cap per cell.
- Cells: 3 hook families x 2 variants.
- Control variables: store page stable; build stable; no mid-test tutorial change.

Naming:
- W4_T1_[geo]_[hook]_[variant]_[date]

Required report columns:
- Spend, impressions, CTR, CVR, CPI, IPM, tutorial_complete, level_complete, D1 direction, caveat, decision.

Review rule:
- Review after spend floor or day 4, whichever comes first.
- If CPI is much higher than scenario and installs/cell is thin, reduce to 3 cells.

Confidence language:
- Winner claim: not allowed in this test.
- Allowed conclusion: directional hook/store signal.

Structure acceptance contract:
- Learning question:
- Max cells:
- Frozen variables:
- Compress trigger:
- Dirty-read trigger:
- Allowed claims if D1 is thin:
- Blocked claims:
- Owner/date:

Campaign structure sign-off:
- Accepted structure:
- Frozen variables:
- Allowed conclusions:
- Blocked conclusions:
- Structure change before next spend:
```

## Practical Lab

1. Viết một learning goal duy nhất cho campaign đầu tiên.
2. Chọn channel/geo đơn giản và ghi biến sẽ giữ nguyên.
3. Tính budget per cell cho 3, 6, 9 và 12 cells.
4. Chọn cell count phù hợp với budget/cell và CPI scenario.
5. Viết naming convention có hook/variant/date.
6. Viết required report columns, gồm acquisition, store và early product event.
7. Viết review rule và confidence language trước khi launch.
8. Điền Structure acceptance contract.
9. Viết blocked claims: report này không được kết luận điều gì.
10. Viết Campaign structure sign-off memo cho next structure decision.

Quality check: nếu một row report không map được về hook/promise/asset/decision, structure chưa ready.

## Final UA Plan Update

Cập nhật field **budget**:

```md
Campaign budget:
- Total budget:
- Daily cap:
- Budget per cell:
- CPI scenario range:
- Cell count decision:
- Spend/review floor:
- Compress trigger:
```

Cập nhật field **creativeMatrix**:

```md
Campaign cells:
- Hook family:
- Variant:
- Asset name:
- Promise being tested:
- Store proof:
- Frozen variables:
```

Cập nhật field **tracking / successCriteria / nextAction**:

```md
Campaign readout:
- Required report columns:
- Required early events:
- Review date:
- Allowed confidence language:
- Stop/iterate rule:
- Next action if signal is too thin:
- Dirty-read trigger:
- Allowed claims:
- Blocked claims:
- Structure change before next spend:
```

## Checklist Focus

- [ ] Structure bám one learning goal.
- [ ] Cell count phù hợp budget/cell.
- [ ] Biến chính và biến giữ nguyên được ghi rõ.
- [ ] Có Structure acceptance contract trước launch.
- [ ] Có compress trigger.
- [ ] Có dirty-read trigger.
- [ ] Có allowed claims và blocked claims.
- [ ] Naming map được creative -> report.
- [ ] Có review date, spend floor và stop rule.
- [ ] Tracking event tối thiểu đã QA trước traffic.
- [ ] Confidence language không nói quá sample.

## Curated References

- [Google Ads Help: Setting up your App campaigns](https://support.google.com/google-ads/answer/6167162)
- [Privacy Sandbox: Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Meta: Facebook and Instagram Ads budgets, costs and schedules](https://www.facebook.com/business/ads/pricing)
', now()),
  ('lessons/day-23.md', 'markdown', null, '---
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

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: sample-size funnel]
Type: hero operating diagram.
Lesson section: Hero visual: sample-size funnel.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


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

```text
[VISUAL PLACEHOLDER: Third-party image request - Data visual: confidence language table]
Type: data visual/chart or decision board.
Lesson section: Data visual: confidence language table.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


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
', now()),
  ('lessons/day-24.md', 'markdown', null, '---
day: 24
title: "Reading campaign reports"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [CTR, IPM, Retention, ROAS]
artifact: "Report readout template"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Report readout template** để biến một campaign report thành **một recommended call**: scale cautiously, iterate creative, fix store, fix product, fix tracking, hold, hoặc stop.

Quyết định chính: **một report chưa kết thúc bằng diagnosis + primary call + confidence caveat + owner/date thì chưa phải report vận hành**.

Artifact này cập nhật field **successCriteria**, **killCriteria**, **nextAction**, **tracking** và **learningLog** trong Final UA Plan.

Report readout cuối bài phải trả lời:

| Câu hỏi | Output |
| --- | --- |
| Test đang hỏi hypothesis nào? | 1 câu rõ ràng |
| Metric nào thuộc creative/store/product/traffic/economics/tracking? | Bucketed metric table |
| Signal nào mâu thuẫn? | Contradiction line |
| Sample/measurement đáng tin đến đâu? | Confidence caveat |
| Team nên làm gì tiếp? | One primary call |
| Ai làm và khi nào review? | Owner/date |

## Why this matters

Report rất dễ biến thành bảng số dài. Với non-UA Unity team, vấn đề thường không phải thiếu metric. Vấn đề là không biết metric nào đang nói về creative, store, audience, product, monetization hay tracking.

Khi không bucket signal trước, team thường sửa nhầm chỗ:

- làm thêm ad mới dù store page đang không chứng minh promise;
- sửa tutorial dù tracking event bị thiếu;
- scale traffic rẻ dù D1/user quality yếu;
- kill creative có `CTR` thấp dù những user vào game lại giữ tốt;
- tranh luận quanh `ROAS` sớm dù payback window chưa đủ.

Một report vận hành không hỏi "số nào đẹp?". Nó hỏi: **số này đang chỉ vào đoạn nào của promise chain, độ tin cậy ra sao, và action tiếp theo là gì?**

Với budget nhỏ, report càng phải kỷ luật. Bạn không cần dashboard lớn; bạn cần readout ngắn, có diagnosis, có confidence, có quyết định, và có người chịu trách nhiệm cho bước tiếp theo.

## Core model: bucket before action

Đọc report theo chuỗi:

```text
hypothesis
  -> metric bucket
  -> contradiction check
  -> confidence caveat
  -> primary call
  -> owner/date
  -> learning log
```

| Bucket | Metric thường đọc | Câu hỏi vận hành | Action thường gặp |
| --- | --- | --- | --- |
| Creative | `CTR`, thumbstop, asset rating, first-hook signal | Ad có kéo attention đúng không? | Rewrite first 2 seconds, variant hook |
| Store | Store `CVR`, install rate, `IPM` split | Store có xác nhận ad promise không? | Fix screenshot/copy/icon order |
| Product | D1, `tutorial_complete`, level depth | First session có giữ lời hứa không? | Fix onboarding/level 1-3 |
| Traffic | CPI, delivery split, geo/source mix | Traffic có phù hợp test không? | Narrow/hold channel, rerun cleaner |
| Economics | ARPDAU, `ROAS`, payback window | Có guardrail kinh tế để tiếp tục không? | Cap spend, wait window, adjust monetization |
| Tracking | Missing events, attribution gaps, revenue event quality | Số có đáng tin không? | Fix measurement before call |

Rule: nếu bucket chưa rõ, action chưa nên mạnh. Nếu tracking bucket fail, mọi bucket sau đó phải có caveat.

## Report readout template mẫu

Copy khung này cho mỗi review:

| Field | Example |
| --- | --- |
| Hypothesis | "Satisfying clear hook will bring better install fit than challenge hook." |
| Evidence | Challenge có `CTR` cao; satisfying có `CVR` và D1 direction tốt hơn |
| Bucket diagnosis | Challenge thắng creative attention nhưng thua store/product fit |
| Contradiction | Cheap CPI không đi cùng quality signal |
| Confidence | Directional; ~50 installs/cell; event QA pass; D1 still thin |
| Primary call | Iterate satisfying clear; do not scale challenge |
| Backup caveat | Need stronger opening before rerun |
| Owner/date | Creative owner, next Monday |
| Learning log | "Curiosity hook creates low-quality traffic in this geo." |

Readout tốt phải có **one primary call**. Nếu có 4 action ngang nhau, report chưa đọc xong hoặc hypothesis quá rộng.

### Primary call arbitration

Khi report có nhiều tín hiệu trái chiều, đừng chọn call theo metric "đẹp nhất". Hãy chọn call bảo vệ bước học tiếp theo.

| Conflict | Primary call nên chọn | Vì sao | Backup caveat |
| --- | --- | --- | --- |
| Tracking gap vs any positive metric | Fix tracking / hold | dữ liệu bẩn làm mọi conclusion yếu | no scale/kill read |
| Cheap CPI vs weak D1 | Audit promise/traffic, do not scale | traffic rẻ nhưng không giữ user | compare first-session proof |
| High CTR vs weak CVR/D1 | Fix store/promise or pause hook | attention không đủ nếu downstream fail | do not call winner |
| Low CTR vs strong CVR/D1 | Iterate creative | product fit có thể tồn tại nhưng bán chưa tốt | action size small |
| Good retention vs immature ROAS | Cap spend / wait economics window | payback chưa đủ chứng cứ | no aggressive scale |
| Two buckets weak, tracking clean | Stop/rewrite hypothesis | chain fail rộng hơn một surface | write replacement hypothesis |

Primary call memo:

```text
Report arbitration
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Backup caveat:
- Decisions explicitly blocked:
- Owner/date:
```

Rule: một report tốt có thể nói "iterate creative", đồng thời block "scale", "kill product" và "ROAS verdict". Blocked conclusions giúp team không overclaim.

### Report acceptance contract

Trước khi report được dùng để scale, stop hoặc đổi roadmap, nó phải pass một contract ngắn. Contract này không làm report dài hơn; nó làm rõ report **được phép quyết định gì** và **bị cấm quyết định gì**.

| Contract field | Câu hỏi phải trả lời | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Report scope | Report đang đọc test/campaign/cell nào? | Có tên test, ngày, geo/channel, spend window | Không dùng report để so sánh |
| Accepted source/window | Data lấy từ đâu và đủ window chưa? | Ad platform + event source + cohort window được ghi rõ | Chỉ ghi observation, chưa ghi call |
| Strongest useful signal | Signal nào đáng dùng nhất? | Signal gắn với một bucket cụ thể | Không được chọn action theo cảm giác |
| Weakest blocking signal | Signal nào đang chặn conclusion mạnh? | Blocker được nêu tên, không bị giấu | Giảm action size |
| Dirty/missing signal | Event/report nào thiếu hoặc bẩn? | Tracking caveat có impact rõ | Fix tracking trước khi scale/kill |
| Primary call | Một action chính là gì? | Scale cautiously, iterate, fix, hold, stop hoặc rerun | Report chưa được sign-off |
| Blocked conclusions | Điều gì report này không được kết luận? | Có ít nhất 1-3 blocked conclusions | Team dễ overclaim |
| Owner/date | Ai làm, review khi nào? | Có owner và checkpoint | Readout chưa thành việc làm |

Contract tốt thường ngắn hơn một màn hình. Nếu bạn phải viết 2 trang để giải thích vì sao report được chấp nhận, có thể hypothesis quá rộng hoặc data chưa đủ sạch.

```text
Report acceptance contract
- Scope:
- Accepted source/window:
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Blocked conclusions:
- Owner/date:
```

Acceptance rule: report chưa có `primary call + blocked conclusions + owner/date` thì chỉ là analysis draft, chưa phải operating report.

## Hero visual: report diagnosis map

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: report diagnosis map]
Type: hero operating diagram.
Lesson section: Hero visual: report diagnosis map.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
Metric appears in report
        |
        v
Is tracking/event setup trustworthy?
        | yes
        v
Map metric to bucket
  CTR/thumbstop ---------> Creative action
  CVR/IPM --------------> Store action
  D1/tutorial/depth ----> Product action
  CPI/source/geo -------> Traffic action
  ROAS/ARPDAU ----------> Economics action
        |
        v
Check contradiction + sample
        |
        v
Write one primary call + caveat + owner/date
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Tracking check đứng trước bucket | Data bẩn làm mọi diagnosis yếu | Tracking pass nghĩa là mọi conclusion mạnh |
| Mỗi metric bucket dẫn tới action khác nhau | Report tốt giúp sửa đúng chỗ trong funnel | Một metric đơn lẻ đủ làm toàn bộ decision |
| Contradiction nằm trước primary call | Số trái chiều phải được ghi rõ | Bỏ qua metric xấu để giữ narrative đẹp |
| Owner/date đứng cuối | Report chỉ có giá trị khi biến thành việc làm | Diagnosis tự động tạo progress |

## Data visual: call selection table

```text
[VISUAL PLACEHOLDER: Third-party image request - Data visual: call selection table]
Type: data visual/chart or decision board.
Lesson section: Data visual: call selection table.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Pattern | Likely bucket | Confidence check | Primary call |
| --- | --- | --- | --- |
| `CTR` high, store `CVR` low | Store mismatch hoặc curiosity hook | Store changed during test không? | Fix store proof before more creative |
| Store `CVR` high, D1 low | Product/first-session proof weak | Early events QA pass chưa? | Fix onboarding/level 1-3 |
| `CTR` low, D1 good | Creative undersells product | Sample đủ chưa? | Iterate creative opening |
| CPI low, D1 weak | Cheap wrong traffic hoặc misleading promise | Source/geo mix clean không? | Hold scale; audit traffic/promise |
| CPI high, D1 good | Expensive but qualified traffic | Budget/cell đủ không? | Improve creative/store efficiency, do not kill product |
| `ROAS` short, retention acceptable | Economics/payback window | Window đủ chưa? | Cap spend; wait/adjust monetization |
| Events missing | Tracking risk | Missing event có là decision metric không? | Fix tracking before call |
| One cell gets most spend | Delivery bias | Spend/cell comparable không? | Do not declare winner; rerun cleaner |

Report card preview:

| Block | Good wording | Weak wording |
| --- | --- | --- |
| Diagnosis | "Hook A wins attention but fails store/product proof." | "Hook A has mixed results." |
| Confidence | "Directional: 48 installs/cell, D1 thin, event QA pass." | "Looks good." |
| Call | "Iterate Hook B; do not scale Hook A." | "Keep testing." |
| Owner/date | "Creative owner ships 2 openings by Monday." | "Team will improve creatives." |

## Hướng dẫn đọc số

Triage order khi số mâu thuẫn:

| Step | Hỏi gì trước | Vì sao |
| --- | --- | --- |
| 1. Tracking | Event/attribution có đủ tin không? | Data bẩn làm mọi diagnosis yếu |
| 2. Sample | Installs/cohort đủ cho loại conclusion không? | Tránh winner/kill từ sample mỏng |
| 3. Promise chain | Ad -> store -> first session lệch ở đâu? | Tìm đúng nơi sửa |
| 4. Economics | Cost/revenue có guardrail gì? | Không scale thứ không có ceiling |
| 5. Action | Một primary call là gì? | Report phải kết thúc bằng việc làm |

Metric patterns:

| Pattern | Cách đọc | Next action |
| --- | --- | --- |
| High `IPM`, weak D1 | Acquisition efficient nhưng promise/user quality yếu | Audit first session và hook honesty |
| Low `CTR`, strong retention | Product có signal, creative chưa bán được | New opening/hook variant |
| `CTR` high, `CVR` low | Hook hút click nhưng store không confirm | Fix screenshot/title/copy |
| `CVR` high, D1 low | Store promise tốt, product không deliver | Fix onboarding/level 1-3 |
| Platform numbers inconsistent | Measurement caveat | Validate tracking before decision |
| One cell got most spend | Delivery bias | Do not overclaim winner |
| `ROAS` weak, D7 not mature | Payback window chưa đủ | Wait/cap, do not hard kill |

Decision rule: mỗi report chỉ nên có một primary call và một backup caveat.

Report call arbitration board:

| If the report contains | Primary call | Backup caveat | Owner lane |
| --- | --- | --- | --- |
| Tracking gap affects the decision metric | Fix tracking / hold | No scale/kill read until event is trustworthy | Tech + UA |
| Sample is thin but direction is coherent | Keep reading / small iterate | Directional only; action size must stay small | UA owner |
| Creative wins attention but downstream quality is weak | Fix store/promise or pause hook | Do not scale from `CTR` alone | Creative + store owner |
| Store and first session are healthy but attention is weak | Iterate creative | Preserve store/build so retest stays clean | Creative owner |
| Store is healthy, first session is weak | Fix product/onboarding | Do not rewrite acquisition until first-session proof improves | Product owner |
| Retention is acceptable but economics is unclear | Cap spend / wait economics window | No aggressive scale until payback read matures | UA + monetization |
| Two buckets are weak and tracking is clean | Stop or rewrite hypothesis | Write replacement hypothesis before next spend | UA + product |

Priority rule: a report should choose the call that protects the next learning step. When confidence is weak, reduce action size; when tracking is dirty, reduce conclusion strength; when the weak bucket is clear, assign one owner instead of creating a team-wide vague fix.

## Worked example: one-page readout

| Metric | Hook A: challenge | Hook B: satisfying clear | Read |
| --- | ---: | ---: | --- |
| `CTR` | 4.0% | 2.4% | A wins attention |
| Store `CVR` | 12% | 30% | B store promise stronger |
| D1 direction | 9% | 24% | B better user fit |
| CPI | Lower | Higher | A cheaper but lower quality |
| Event QA | Pass | Pass | Product read usable |
| Installs/cell | 54 | 47 | Directional, not final |

Diagnosis:

Hook A is a curiosity trap. It gets clicks cheaply, but those users do not convert through store/product proof. Hook B has lower attention, but the users who install appear closer to the promise chain.

Recommended call:

**Iterate Hook B**, do not scale Hook A. Produce two stronger openings for satisfying clear, keep store proof unchanged, and review after the next spend floor.

Confidence:

Directional only. D1 cohort is not large enough for a hard retention claim, but strong enough to choose the next creative iteration direction.

Tradeoff:

Cheaper traffic is not better if it creates weak first-session proof. The next iteration should improve Hook B''s first 2 seconds, not copy Hook A''s curiosity angle blindly.

Good report sentence:

```md
Hook A wins attention but fails store/product proof. Hook B is a better promise-chain candidate.
Primary call: iterate Hook B with stronger opening; do not scale Hook A.
Confidence: directional, ~50 installs/cell, D1 thin but event QA pass.
```

### Report audit and blocked conclusions

Một readout tốt nên có audit trail giống release note nhỏ: metric nào được dùng, metric nào bị bỏ qua, kết luận nào bị khóa, và review khi nào.

```text
Report audit
- Evidence used: CTR, Store CVR, D1 direction, event QA, installs/cell.
- Evidence ignored: D0 ROAS because payback window is immature.
- Primary call: iterate Hook B.
- Decisions blocked: scale Hook A, kill challenge motivation, claim final retention.
- Owner/date: creative owner, next Monday.
- Review trigger: after two new openings reach the same spend floor.
- What remains unproven: whether satisfying clear can achieve cheaper CPI at scale.
```

Audit này đặc biệt quan trọng khi report có một metric hấp dẫn như CPI rẻ hoặc CTR cao. Metric hấp dẫn thường kéo team về action quá mạnh; audit giữ action đúng kích thước.

### One-page report sign-off memo

Sau audit, viết một memo ngắn để khóa cách team sẽ hành động. Memo này là phần bạn có thể paste vào Slack, Notion, Linear ticket hoặc Final UA Plan.

```text
Report sign-off - Test name/date

Accepted read:
- Report is accepted for:
- Report is not accepted for:

Primary call:
- TBD

Action size:
- TBD

Owner/date:
- TBD

Next checkpoint:
- TBD

Learning log entry:
- TBD
```

Ví dụ với Hook A vs Hook B:

```text
Report sign-off - W4 Hook Direction Test

Accepted read:
- Accepted for choosing next creative iteration direction.
- Not accepted for scale, product kill, or final retention claim.

Primary call:
- Iterate Hook B with two stronger openings; keep store proof unchanged.

Action size:
- Small rerun only; same geo/channel; no budget increase.

Owner/date:
- Creative owner ships by Monday; UA owner reviews after spend floor.

Next checkpoint:
- Compare CTR, store CVR, D1 direction, and event QA after both new openings reach comparable delivery.

Learning log entry:
- Curiosity/challenge angle can buy clicks but appears weaker on store/product proof for this prototype.
```

Sign-off memo tốt bảo vệ team khỏi hai lỗi: tự tin quá mức khi chỉ có directional signal, hoặc không làm gì vì report có quá nhiều metric trái chiều.

## Report quality checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Hypothesis | Report says what was tested | Rewrite first line |
| Bucketed metrics | Creative/store/product/traffic/economics/tracking separated | Re-bucket before action |
| Contradiction | Conflicting signals are named | Do not hide inconvenient metric |
| Confidence | Sample and measurement caveat stated | Add confidence line |
| Diagnosis | Explains why metrics point to a bucket | Replace metric list with read |
| Call | One recommended action | Pick primary, move rest to caveat |
| Owner/date | Next action assigned | Add owner/date |
| Learning log | What was learned is captured | Save readout |

Quality chain:

```text
hypothesis -> evidence -> bucket diagnosis -> confidence -> primary call -> owner/date -> learning log
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Analytics reports overview](https://support.google.com/analytics/answer/9212670?hl=en) | GA reports are organized around customer journey stages such as acquisition, engagement, monetization and retention. | A good campaign readout should map metrics to journey/funnel stages instead of listing numbers flatly. | Do not assume GA''s UI structure alone tells you what action to take. |
| [Firebase Analytics documentation](https://firebase.google.com/docs/analytics) | Firebase/Google Analytics helps measure app usage and user engagement. | Product buckets like `tutorial_complete`, level depth and retention need event instrumentation, not only ad platform numbers. | Do not infer product quality from ad metrics if in-app events are missing. |
| [Firebase Log events documentation](https://firebase.google.com/docs/analytics/ios/events) | Events describe what happens in the app, including user actions, system events or errors. | Tracking bucket is operational: if decision events are missing, the report call must be weaker or blocked. | Do not treat missing events as proof that users did not do the action. |
| [Google Ads App campaign asset reporting](https://support.google.com/google-ads/answer/6310436?hl=en) | Asset reports help review performance of assets used by App campaigns. | Creative bucket should look at asset-level/creative signals, but still compare them with store/product quality. | Do not declare an asset winner from creative reporting without downstream checks. |
| [Google Ads enhanced asset reporting](https://support.google.com/google-ads/answer/14594955?hl=en) | Enhanced reports expose app network/campaign/asset performance templates in Report editor. | Report structure can be built deliberately; choose views that answer the hypothesis. | Do not pull every available report if it does not change the primary call. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Analytics tools split journey stages | Bucket diagnosis mirrors the funnel | Tool UI automatically makes decisions |
| Firebase events define in-app behavior | Product reads need clean event taxonomy | Missing event means behavior did not happen |
| App campaign asset reporting focuses on creative assets | Creative signal is one bucket, not the whole answer | Highest-performing asset is always best player fit |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Report chỉ list metric | Thêm diagnosis và recommended call |
| Chọn action theo `CTR` | Đọc `CTR` cùng `CVR`, D1 và event QA |
| Bỏ qua metric trái chiều | Viết contradiction line |
| Không ghi confidence | Ghi sample/measurement caveat |
| Fix creative khi tracking missing | Validate tracking trước |
| Kết thúc bằng nhiều action ngang nhau | Chọn primary call, backup caveat |
| Nhầm report UI với insight | Chỉ lấy view/report phục vụ hypothesis |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `CTR` | Click-through rate |
| `IPM` | Installs per mille |
| `Retention` | Tỷ lệ user quay lại |
| `ROAS` | Return on ad spend |
| `Readout` | Bản đọc số kèm diagnosis/action |
| `Bucket diagnosis` | Gán metric pattern vào nơi cần sửa |
| `Primary call` | Quyết định chính sau report |
| `Confidence caveat` | Ghi chú độ chắc của conclusion |
| `Delivery bias` | Spend/impression lệch làm so sánh cell yếu |

## Lab output example

```md
Report readout - W4 Test 1

Hypothesis:
- Satisfying clear beats challenge for install fit.

Evidence:
- Challenge: higher CTR, lower CVR, weak D1.
- Satisfying: lower CTR, stronger CVR and D1 direction.
- Event QA: pass.
- Sample: directional, not final.

Bucket diagnosis:
- Challenge wins creative attention but appears to create curiosity traffic.
- Satisfying clear aligns store and first-session proof better.

Contradiction:
- Challenge has cheaper CPI, but quality signal is weaker.

Confidence:
- Directional, 40-55 installs/cell; D1 is not hard retention proof.

Primary call:
- Iterate satisfying clear.
- Do not scale challenge.

Owner/date:
- Creative owner produces 2 stronger openings by next Monday.

Learning log:
- Curiosity/challenge angle can buy clicks, but store/product proof is weaker for this puzzle prototype.

Report audit:
- Evidence used:
- Evidence ignored:
- Decisions blocked:
- Owner/date:
- Review trigger:
- What remains unproven:

Report acceptance contract:
- Scope:
- Accepted source/window:
- Strongest useful signal:
- Weakest blocking signal:
- Dirty or missing signal:
- Primary call:
- Blocked conclusions:
- Owner/date:

Report sign-off:
- Accepted for:
- Not accepted for:
- Action size:
- Next checkpoint:
```

## Practical Lab

1. Chọn một report hoặc sample pattern từ test gần nhất.
2. Viết hypothesis của test trong một câu.
3. Bucket metric thành creative/store/product/traffic/economics/tracking.
4. Viết contradiction line nếu có số mâu thuẫn.
5. Ghi confidence caveat dựa trên sample và tracking.
6. Chọn một primary call và một backup caveat.
7. Gán owner/date.
8. Viết learning log một câu.
9. Copy readout vào Final UA Plan.
10. Viết blocked conclusions: điều gì report này không được kết luận.
11. Điền Report acceptance contract.
12. Viết one-page sign-off memo.
13. Viết review trigger cho lần đọc tiếp theo.

Quality check: nếu có nhiều call ngang nhau, report chưa đủ rõ hoặc hypothesis quá rộng.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Report readout template:
- Hypothesis:
- Evidence:
- Bucket diagnosis:
- Contradiction:
- Confidence:
- Primary call:
- Backup caveat:
- Owner/date:
- Decisions blocked:
- Review trigger:
- Acceptance contract:
```

Cập nhật field **killCriteria / nextAction / tracking**:

```md
Campaign report action:
- Do not scale if:
- Do not kill if:
- Tracking risk:
- Next review date:
- Learning log entry:
- Blocked conclusions:
- Action size:
```

Cập nhật field **learningLog**:

```md
Learning log entry:
- What we tested:
- What the report suggests:
- What we will change:
- What remains unproven:
- Evidence ignored:
- Decisions blocked:
- Review trigger:
- Sign-off memo:
```

## Checklist Focus

- [ ] Report kết thúc bằng one primary call.
- [ ] Metric được bucket đúng.
- [ ] Contradiction được ghi rõ.
- [ ] Có confidence caveat.
- [ ] Có Report acceptance contract.
- [ ] Có blocked conclusions.
- [ ] Có action size.
- [ ] Có sign-off memo đủ ngắn để paste vào team update.
- [ ] Tracking risk không bị bỏ qua.
- [ ] Owner/date rõ.
- [ ] Learning log được cập nhật.

## Curated References

- [Google Analytics Help - Overview of Google Analytics reports](https://support.google.com/analytics/answer/9212670?hl=en)
- [Firebase - Google Analytics for Firebase](https://firebase.google.com/docs/analytics)
- [Firebase - Log events](https://firebase.google.com/docs/analytics/ios/events)
- [Google Ads Help - About asset reporting for App campaigns](https://support.google.com/google-ads/answer/6310436?hl=en)
- [Google Ads Help - About enhanced asset reporting for App campaigns](https://support.google.com/google-ads/answer/14594955?hl=en)
', now()),
  ('lessons/day-25.md', 'markdown', null, '---
day: 25
title: "Scale, iterate or kill decision rules"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [ROAS, Retention, Creative testing]
artifact: "Scale-iterate-kill rules"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Scale-iterate-kill rules** để quyết định trước khi cảm xúc của team can thiệp vào report.

Quyết định chính: **mỗi rule phải có gate, condition, diagnosis, action size, owner, review date và confidence caveat**. Rule không chỉ nói "scale nếu tốt" hay "kill nếu xấu"; rule phải nói rõ dữ liệu nào đủ sạch để ra quyết định, hành động lớn đến đâu, và khi nào đọc lại.

Artifact này cập nhật field **successCriteria**, **killCriteria**, **budget**, **tracking**, **nextAction** và **learningLog** trong Final UA Plan.

Đầu ra cần có:

| Rule type | Cần viết rõ | Dùng để tránh |
| --- | --- | --- |
| Scale | Gate pass, condition, scale size, cap, review window | Tăng spend quá tay từ signal mỏng |
| Iterate | Bottleneck nằm ở creative/store/product/economics | Sửa lung tung nhiều thứ cùng lúc |
| Hold | Tracking/sample/window chưa đủ | Đọc noise như winner/loser |
| Pause/kill | Repeated clean evidence + next hypothesis | Kill vì một ngày xấu |

## Why this matters

Micro soft-launch dễ làm team swing giữa "scale ngay" và "kill hết". Với dữ liệu nhỏ, một ngày đẹp có thể chỉ là noise; một ngày xấu có thể là delivery bias, sample mỏng, store mismatch hoặc tracking gap. Nếu không có rule định sẵn, report biến thành tranh luận theo mood.

Decision rule tốt bảo vệ learning:

- **Scale** khi ad, store, first session, economics guardrail và tracking cùng đủ sạch.
- **Iterate** khi một mắt xích yếu nhưng promise vẫn đáng giữ.
- **Hold** khi tracking/sample/window chưa đủ để ra call mạnh.
- **Pause/kill** khi chain fail lặp lại qua clean evidence hoặc economics không còn đáng mua thêm data.

Điểm quan trọng: **kill không phải hình phạt**, và **scale không phải phần thưởng**. Cả hai chỉ là action phù hợp với bằng chứng hiện có.

## Core model: gates before calls

Đọc rule theo thứ tự:

```text
tracking gate
  -> sample gate
  -> promise-chain gate
  -> economics gate
  -> call
  -> action size
  -> review date
  -> learning log
```

| Gate | Câu hỏi | Nếu fail thì |
| --- | --- | --- |
| Tracking gate | Required events/attribution có đủ tin không? | Hold decision, fix measurement |
| Sample gate | Installs/cohort đủ cho loại conclusion không? | Hạ confidence hoặc collect more |
| Promise-chain gate | Ad -> store -> first session aligned không? | Scale/iterate/pause theo bottleneck |
| Economics gate | Cost/revenue có guardrail để tiếp tục không? | Cap spend, wait window, adjust monetization |
| Action gate | Action size có phù hợp confidence không? | Giảm scale size hoặc rerun cleaner |

Rule mạnh cần nhiều gate pass hơn. Scale cần alignment. Iterate cần bottleneck rõ. Pause/kill cần repeated clean evidence hoặc invalid economics/tracking, không chỉ một metric xấu.

## Scale-iterate-kill rules mẫu

| Call | Required gates | Condition | Action | Review |
| --- | --- | --- | --- | --- |
| Scale cautiously | Tracking pass, sample directional+, promise chain aligned | `CTR`, store `CVR`, D1 direction đều không weak trong scenario | Increase daily cap 15-25%, không mở thêm biến | 48-72h hoặc spend floor |
| Iterate creative | Tracking pass, store/product signal usable | `CTR` thấp nhưng `CVR`/D1 khỏe | Produce 2 new openings, giữ store/build | Next report |
| Fix store | Tracking pass, creative attention usable | `CTR` ổn/cao, store `CVR` thấp | Replace screenshot/copy/title proof | After store update |
| Fix product/promise | Tracking pass, store usable | `CVR` tốt, D1/tutorial weak | Fix onboarding/level 1-3 or rewrite promise | Next build/test |
| Hold | Tracking/sample/economics chưa đủ | Missing event, sample mỏng, ROAS window quá sớm | Stop reading as winner/loser | After data readiness |
| Pause/kill | Clean repeated failure | Weak chain across 2 clean reads or economics guardrail broken | Pause hook/campaign, write replacement hypothesis | After new proof |

Action size rule: confidence thấp thì action nhỏ. Nếu sample chỉ directional, scale không vượt "cautious". Nếu tracking thiếu, không scale.

### Decision audit trail

Mỗi call cần để lại audit trail đủ ngắn để team nhìn lại sau 3-7 ngày và biết mình đã quyết định dựa trên gì. Không có audit trail, team sẽ nhớ sai lý do scale hoặc kill.

| Audit field | Câu hỏi phải trả lời | Ví dụ tốt |
| --- | --- | --- |
| Rule triggered | Rule nào được kích hoạt? | `Iterate creative: CTR weak, CVR/D1 healthy` |
| Evidence used | Metric/source/window nào được dùng? | `48h read, Android VN paid cohort, build 0.6.1` |
| Evidence ignored | Metric nào chưa đủ quyền dùng? | `D0 ROAS ignored because revenue window immature` |
| Action size | Hành động lớn đến đâu? | `2 new openings, cap unchanged` |
| Variables frozen | Cái gì giữ nguyên để retest đọc được? | `same store page, same build, same source` |
| Review trigger | Khi nào đọc lại? | `after 72h or $80 spend, whichever first` |
| Unproven claim | Điều gì chưa được kết luận? | `market thesis not proven, only creative opening suspected` |

Audit memo mẫu:

```text
Decision audit
- Rule triggered:
- Evidence used:
- Evidence ignored:
- Action:
- Action size:
- Variables frozen:
- Owner:
- Review trigger:
- What remains unproven:
```

Quy tắc: nếu bạn không viết được "variables frozen", action có nguy cơ làm bẩn test tiếp theo.

### Decision rule acceptance gate

Trước khi một rule được dùng để scale, iterate, hold hoặc pause, nó phải pass acceptance gate. Gate này giúp rule không còn là câu nói chung chung, mà trở thành điều kiện vận hành có thể audit.

| Acceptance field | Scale | Iterate | Hold | Pause/kill |
| --- | --- | --- | --- | --- |
| Required data gates | tracking + sample + promise-chain + economics | tracking + enough signal to locate weak link | tracking/sample/window gap named | repeated clean evidence or economics break |
| Condition | metric pattern and scenario caveat | weak link named | why conclusion is not allowed | failure pattern repeated and clean |
| Action size | cap increase %, max budget, review window | 1-2 changes only | no winner/loser call | stop spend or remove hypothesis from next test |
| Variables frozen | geo/store/build/source unless named | surfaces not being fixed stay stable | paid decision frozen | replacement hypothesis written before spend |
| Owner/date | UA owner + review checkpoint | specific creative/store/product owner | tech/UA owner | UA + product owner |
| Blocked conclusions | not proven scale ceiling | not proven product/market fit | no business verdict | not proof that whole game is bad |

```text
Decision rule acceptance gate
- Call type:
- Required gates:
- Condition:
- Action size:
- Variables frozen:
- Owner/date:
- Blocked conclusions:
- Review trigger:
```

Acceptance rule: nếu `action size` và `blocked conclusions` trống, rule chưa được dùng. Đây là hai dòng chống overreaction mạnh nhất trong micro-budget soft-launch.

## Hero visual: decision rule ladder

```text
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: decision rule ladder]
Type: hero operating diagram.
Lesson section: Hero visual: decision rule ladder.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
1. Tracking gate
   If required events are missing -> HOLD

2. Sample gate
   If installs/cohort are too thin -> WEAKEN CALL

3. Promise-chain gate
   Ad promise -> Store proof -> First-session proof
   If one link is weak -> ITERATE THAT LINK

4. Economics gate
   CPI, ARPDAU, ROAS window, payback direction
   If economics is unclear -> CAP OR WAIT

5. Action-size gate
   Strong alignment -> scale cautiously
   Clear bottleneck -> iterate
   Dirty data -> hold
   Repeated clean failure -> pause/kill
```

Visual readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Tracking and sample gates stand before every strong call | Data readiness controls decision strength | Tracking pass means scale automatically |
| Promise-chain gate separates ad/store/product | Iterate should target the weak link | Fixing every link at once improves learning |
| Economics gate happens before scale | Retention without economics may still need cap/wait | Early ROAS alone proves payback |
| Pause/kill is last | Kill needs repeated clean evidence | One bad day is enough to kill a hypothesis |

## Data visual: call matrix

```text
[VISUAL PLACEHOLDER: Third-party image request - Data visual: call matrix]
Type: data visual/chart or decision board.
Lesson section: Data visual: call matrix.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Acquisition/store signal | Product/retention signal | Tracking confidence | Economics guardrail | Call |
| --- | --- | --- | --- | --- |
| Strong | Strong | High/Medium | Acceptable or improving | Scale cautiously |
| Strong | Weak | High | Not broken | Fix product or rewrite promise |
| Weak creative, strong product | Strong | High | Not broken | Iterate creative opening |
| Weak store, strong creative | Unknown/usable | High | Not broken | Fix store proof |
| Strong | Strong | Low | Unknown | Hold, fix tracking |
| Weak | Weak | High | Broken across repeated reads | Pause/kill hypothesis |
| Strong D1 | Weak monetization | High | Payback short | Hold scale; test monetization |
| Cheap CPI | Weak D1 | High | Cheap but low-quality | Do not scale; audit promise/traffic |

Decision board:

| Board row | Evidence required | Action size | Owner/date |
| --- | --- | --- | --- |
| Scale row | 4 gates pass + no major contradiction | 15-25% cap increase | UA owner + 72h review |
| Iterate row | One weak link identified | 1-2 changes only | Creative/store/product owner |
| Hold row | Tracking/sample/window not ready | No winner/loser call | Tech/UA owner |
| Pause row | Repeated clean failure | Stop spend on that hypothesis | UA + product owner |

## Hướng dẫn đọc số

| Pattern | Decision | Guardrail |
| --- | --- | --- |
| Good `CTR`/`CVR`, D1 direction healthy | Scale cautiously | Increase small, keep variables stable |
| Good `CTR`, poor `CVR` | Fix store | Do not change hook first |
| Poor `CTR`, good `CVR`/D1 | Iterate creative | Product may be worth selling better |
| Good `CVR`, weak tutorial/D1 | Fix product/promise | Do not blame ad first |
| Good `ROAS`, tracking caveat | Hold/validate | Do not scale blind |
| Low CPI, weak D1 | Do not scale just because cheap | Audit user fit/promise |
| Strong D1, weak monetization | Hold economics call | Check ad/IAP placement and payback window |
| High `IPM`, low retention | Acquisition may be efficient but misleading | Inspect promise and source quality |

Rule phrasing:

| Call | Good wording | Bad wording |
| --- | --- | --- |
| Scale | "Increase cap 20% after tracking pass and aligned store/D1" | "Scale if numbers good" |
| Iterate | "Rewrite first 2 seconds because CTR is weak while CVR/D1 are healthy" | "Make new ads" |
| Hold | "Hold decision until tutorial event is fixed" | "Maybe wait" |
| Pause | "Pause hook after two clean reads show CTR high, CVR/D1 weak" | "Kill because yesterday was bad" |

Conflict resolver:

| When two calls seem possible | Choose this call first | Why | Follow-up |
| --- | --- | --- | --- |
| Scale vs Hold | Hold | Tracking/sample weakness can make scale look safer than it is | Fix readiness, then re-read same rule |
| Scale vs Iterate | Iterate small | A clear weak link means extra spend may only buy more of the same leak | Ship one focused change, keep cap flat |
| Scale vs Monetization wait | Cap/Wait | Retention quality without payback direction is not yet scale proof | Add economics readout window and placement test |
| Pause/kill vs Iterate | Iterate once if promise chain has one strong link | A recoverable weak link is not the same as failed thesis | Define what evidence would pause next time |
| Pause/kill vs Hold | Hold | Dirty data cannot support a strong negative call | Clean tracking/sample before killing |
| Creative iterate vs Store iterate | Fix the earliest proven leak | Upstream leaks distort downstream metrics | Keep the other surface stable until retest |

Priority rule: **dirty data beats optimistic calls, clear bottleneck beats broad reaction, repeated clean failure beats hope**. If the team cannot agree on the call, shrink the action size and write the uncertainty into `learningLog`.

## Worked example: four calls

| Case | Metrics | Gate read | Diagnosis | Call |
| --- | --- | --- | --- | --- |
| A | `CTR` 2.6%, `CVR` 32%, D1 25%, events pass | Tracking/sample pass | Chain aligned | Scale cautiously +20% cap |
| B | `CTR` 4.1%, `CVR` 12%, D1 10%, events pass | Tracking pass | Curiosity trap/store-product mismatch | Pause hook, rewrite promise |
| C | `CTR` 1.1%, `CVR` 35%, D1 28%, events pass | Product/store signal good | Product fit, weak selling | Iterate creative opening |
| D | `CTR` 3.0%, `CVR` 28%, D1 missing event | Tracking fail | Decision invalid | Hold paid decision |

Verdict: the best CPI is not automatically the scale call. Quality chain decides.

Tradeoff: cautious scale is slower than aggressive scale, but it keeps learning alive when sample is still limited. Pause is not failure; it prevents buying more noise.

Operational note:

```md
If action size feels exciting, check confidence again.
If confidence is only directional, action size must stay small.
If tracking is dirty, the correct call is hold, not optimism.
```

### Exception and override memo

Thực tế đôi khi team vẫn phải hành động dù data chưa đẹp: sắp hết budget, store issue nghiêm trọng, SDK bug, hoặc stakeholder muốn thử một biến thể. Khi đó không được giả vờ rule vẫn sạch. Hãy ghi override như một ngoại lệ.

```text
Override memo
- Original rule call: Hold because tutorial_complete event is missing.
- Override requested: Run $30 technical smoke to verify campaign delivery.
- Allowed conclusion: technical delivery only.
- Blocked conclusion: creative winner, product quality, retention, ROAS.
- Risk owner: UA + tech owner.
- Stop condition: stop immediately after delivery smoke or if event still missing.
```

Override không phải cách né rule. Nó là cách bảo vệ ngôn ngữ report: team được làm hành động nhỏ, nhưng không được rút ra kết luận lớn.

| Override reason | Allowed action | Blocked conclusion |
| --- | --- | --- |
| Technical smoke needed | spend tối thiểu để verify delivery/tracking | creative/product winner |
| Store hotfix urgent | sửa store proof và ghi break in comparability | direct before/after verdict nếu traffic mix đổi |
| Budget runway pressure | reduce cap/pause earlier than planned | claim thesis failed |
| Stakeholder asks for extra variant | run as separate exploratory cell | merge into clean test read |
| SDK/report bug | hold business call, fix instrumentation | ROAS/retention verdict |

### Post-call review memo

Sau khi rule chạy xong, review lại rule thay vì chỉ review metric. Đây là phần giúp team học được liệu decision system của mình có đang đúng không.

```text
Post-call review
- Rule triggered:
- Expected result:
- Actual result:
- Did action size fit confidence?
- Did frozen variables stay frozen?
- Rule update:
- What remains unproven:
- Next owner/date:
```

Ví dụ:

```text
Post-call review
- Rule triggered: Iterate creative because CTR was weak while store CVR and D1 direction were usable.
- Expected result: new openings improve CTR without damaging CVR.
- Actual result: CTR improved, CVR stayed stable, D1 still directional.
- Did action size fit confidence? yes, only two openings changed and cap stayed flat.
- Did frozen variables stay frozen? yes, same store/build/geo.
- Rule update: keep creative iteration rule; add review floor before comparing variants.
- What remains unproven: whether higher CTR holds after broader delivery.
- Next owner/date: UA owner reviews after both variants reach spend floor.
```

Post-call review tốt giúp bạn tránh "survivorship bias" trong learning log. Nếu scale nhỏ làm số xấu đi, có thể rule scale cần thêm caveat. Nếu hold vì tracking fail giúp tránh một quyết định sai, rule hold đã tạo giá trị dù không có campaign winner.

## Decision checklist

| Check | Pass condition | Fail action |
| --- | --- | --- |
| Tracking valid | Required events present and QA pass | Hold decision |
| Sample caveat | Confidence language included | Lower action size |
| Bucket diagnosis | Creative/store/product/economics/tracking separated | Re-read report |
| Repeated evidence | Kill/pause uses more than one noisy point | Rerun/validate |
| Action scoped | One primary action, not five | Choose primary call |
| Owner/date | Assigned | Add owner/date |
| Spend guardrail | Scale has cap and review window | Add cap/window |
| Learning log | Rule result captured | Save readout |

Quality chain:

```text
valid data -> metric pattern -> bucket diagnosis -> rule gate -> call -> owner/date -> learning log
```

## Real usecases đã đối chiếu nguồn

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Ads App campaign tips](https://support.google.com/google-ads/answer/9176652?hl=en) | Google recommends enough daily budget relative to target CPI/CPA so App campaigns can learn. | Scale rules should respect budget/data readiness; underfed campaigns create unstable reads. | Do not copy Google''s budget ratio as a universal indie benchmark; use it as a data-starvation warning. |
| [Google Ads App campaign best practices](https://support.google.com/google-ads/answer/14104492?hl=en) | Best practices include bid-budget ratio, constrained campaign checks and targeting one in-app action. | Scale/iterate rules should avoid too many simultaneous goals and should name the target action. | Do not optimize for many actions at once in a tiny soft-launch test. |
| [Meta ads budgets, costs and schedules](https://www.facebook.com/business/ads/pricing) | Meta frames budget as something the system uses over time to learn and allocate delivery. | A scale rule needs review window and budget discipline, not sudden big jumps from one read. | Do not assume a short positive spike is stable learning. |
| [Firebase Log events](https://firebase.google.com/docs/analytics/ios/events) | Events describe user actions, system events or errors in the app. | Tracking gate is not optional; decision rules need the events that prove first-session/product behavior. | Do not read missing events as user failure. |
| [Privacy Sandbox Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Attribution Reporting matches sources/triggers and can produce event-level or aggregatable reports in a privacy-preserving system. | Attribution confidence should appear in scale/kill caveats, especially for small samples. | Do not treat privacy-preserving reporting as perfect user-level proof. |

Source readout:

| Inspect | Conclude | Do not infer |
| --- | --- | --- |
| Platforms need enough data/budget to learn | Scale rules need sample and spend gates | Small budget cannot teach anything |
| In-app events define user behavior | Kill/iterate product calls need event QA | Missing events prove users failed |
| Attribution can be aggregated/privacy-preserving | Confidence caveats protect decisions | Aggregated reporting is useless |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Rule chỉ ghi "scale nếu tốt" | Ghi metric condition, action size, cap và review date |
| Kill hook do một signal yếu | Bucket diagnosis và repeated evidence trước |
| Scale khi tracking missing | Validate tracking first |
| Không có owner/date | Mỗi rule phải assign được |
| Dùng CPI/CTR đơn lẻ để scale | Scale cần ad + store + product + tracking alignment |
| Scale quá mạnh từ sample directional | Giảm action size theo confidence |
| Iterate quá nhiều thứ cùng lúc | Chỉ sửa một weak link chính để giữ learning sạch |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Scale` | Tăng spend/scope có kiểm soát |
| `Iterate` | Sửa một mắt xích cụ thể |
| `Kill criteria` | Điều kiện dừng/pause |
| `ROAS` | Return on ad spend |
| `Retention` | User quay lại sau install |
| `Guardrail` | Giới hạn giúp tránh quyết định quá mạnh |
| `Action size` | Mức độ lớn nhỏ của hành động |
| `Repeated evidence` | Bằng chứng lặp lại đủ sạch để gọi pause/kill |
| `Spend floor` | Mức spend tối thiểu trước khi đọc lại |

## Lab output example

```md
Scale/iterate/kill rules - W4 Test 1

Scale cautiously:
- Gates: tracking pass, sample directional+, store and D1 not weak.
- Condition: CTR and CVR in scenario-good range, D1 direction healthy.
- Action: increase daily cap by 20%, keep geo/store/build stable.
- Owner: UA owner.
- Review: after 72h or fixed spend cap.
- Caveat: no scale if tracking confidence drops.

Iterate creative:
- Condition: CTR low but CVR/D1 healthy.
- Diagnosis: product promise may be good, creative opening weak.
- Action: produce 2 new openings for same hook.
- Owner: creative owner.
- Review: next report window.

Hold:
- Condition: required tutorial_complete or revenue event missing.
- Action: pause decision, fix tracking.
- Owner: tech owner.
- Review: before paid spend resumes.

Pause/kill:
- Condition: hook has high CTR but weak CVR and weak D1 across two clean reads.
- Action: pause hook family, rewrite promise.
- Owner: UA + product.
- Review: after new build or new store proof.

Decision audit:
- Rule triggered:
- Evidence used:
- Evidence ignored:
- Acceptance gate:
- Action size:
- Variables frozen:
- Override used: yes/no
- Blocked conclusions:
- Review trigger:

Post-call review:
- Expected result:
- Actual result:
- Did action size fit confidence?
- Did frozen variables stay frozen?
- Rule update:
- What remains unproven:
```

## Practical Lab

1. Viết một tracking gate.
2. Viết một sample gate.
3. Viết một scale rule có action size và cap cụ thể.
4. Viết một iterate creative/store/product rule.
5. Viết một hold tracking/sample/window rule.
6. Viết một pause/kill rule có repeated clean evidence.
7. Gắn owner/date cho từng rule.
8. Ghi confidence caveat.
9. Copy decision board vào Final UA Plan.
10. Viết decision audit cho một case scale và một case hold.
11. Viết override memo cho trường hợp bắt buộc chạy technical smoke.
12. Điền Decision rule acceptance gate cho ít nhất 2 rule.
13. Viết Post-call review memo cho lần đọc tiếp theo.

Quality check: rule không có gate/owner/date/caveat thì chưa operational.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Scale rule:
- Gates required:
- Condition:
- Action size:
- Spend cap:
- Owner:
- Review date:
- Caveat:
- Blocked conclusions:
```

Cập nhật field **killCriteria**:

```md
Pause/kill rule:
- Condition:
- Required repeated evidence:
- Tracking caveat:
- Sample caveat:
- Owner:
- Next action after pause:
- Replacement hypothesis:
- Blocked conclusions:
```

Cập nhật field **budget / tracking / nextAction**:

```md
Decision board:
- Tracking gate:
- Sample gate:
- Scale cap:
- Hold rule:
- Report cadence:
- Learning log location:
- Decision audit fields:
- Override policy:
- Acceptance gate fields:
- Post-call review cadence:
```

Cập nhật field **learningLog**:

```md
Decision result:
- Rule triggered:
- Evidence:
- Action taken:
- What remains unproven:
- Review date:
- Variables frozen:
- Evidence ignored:
- Override used:
- Blocked conclusions:
- Post-call review:
- Rule update:
```

## Checklist Focus

- [ ] Rule có gate/condition/action/owner/date.
- [ ] Rule có Decision rule acceptance gate.
- [ ] Rule có blocked conclusions.
- [ ] Rule có variables frozen.
- [ ] Tracking valid trước scale.
- [ ] Không dùng CPI/CTR đơn lẻ.
- [ ] Rule phù hợp sample size.
- [ ] Pause/kill cần repeated clean evidence.
- [ ] Action size khớp confidence.
- [ ] Có post-call review memo sau khi action chạy.
- [ ] Scale-iterate-kill rules đã copy vào Final UA Plan.

## Curated References

- [Google Ads Help - Tips for maximizing your App campaign](https://support.google.com/google-ads/answer/9176652?hl=en)
- [Google Ads Help - Best practices for App campaigns](https://support.google.com/google-ads/answer/14104492?hl=en)
- [Meta for Business - Facebook and Instagram Ads: Budgets, Costs and Schedules](https://www.facebook.com/business/ads/pricing)
- [Firebase - Log events](https://firebase.google.com/docs/analytics/ios/events)
- [Privacy Sandbox - Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
', now()),
  ('lessons/day-26.md', 'markdown', null, '---
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
[VISUAL PLACEHOLDER: Third-party image request - Hero visual: SDK risk map]
Type: hero operating diagram.
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
[VISUAL PLACEHOLDER: Third-party image request - Data visual: event validation board]
Type: data visual/chart or decision board.
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

- [Google Play Help - Provide information for Google Play''s Data safety section](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Google Developers - AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Firebase - Log events in Unity](https://firebase.google.com/docs/analytics/unity/events)
- [Privacy Sandbox - Attribution Reporting for Android](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple Developer - AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
', now()),
  ('lessons/day-27.md', 'markdown', null, '---
day: 27
title: "Post-mortem and learning log"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Cohort, Creative testing, UA]
artifact: "Learning log entry"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được một **Learning log entry** cho mỗi UA test: không chỉ ghi "asset nào thắng", mà ghi rõ **assumption nào đã đổi** và test tiếp theo phải làm gì.

Quyết định chính: sau một campaign nhỏ `$100-500`, bạn có đủ bằng chứng để **update rule**, chỉ **iterate thêm**, hay phải **repeat test vì evidence còn yếu**?

Artifact của bài này cập nhật trực tiếp các field **successCriteria**, **nextAction** và phần learning cadence trong Final UA Plan.

## Why this matters

Indie team thường kết thúc post-mortem bằng vài câu nghe có vẻ đúng: "hook A thắng", "store page chưa tốt", "ads đắt". Vấn đề là các câu đó không cho biết **vì sao thắng**, **độ tin cậy bao nhiêu**, và **lần sau nên thay đổi điều gì**.

Với budget nhỏ, phần nguy hiểm nhất không phải là thua một test. Nguy hiểm là học sai từ test đó. Một creative có `CTR` cao sau 18 installs có thể chỉ là weak hint. Một store screenshot làm `CVR` tăng nhưng D1 không đổi có thể chỉ chứng minh proof rõ hơn, không chứng minh product-market fit. Một iOS result có thể bị ảnh hưởng bởi attribution window và privacy reporting, nên không được đọc như user journey đầy đủ.

Learning log biến campaign report thành product learning loop:

`ad promise -> store proof -> first-session proof -> metric pattern -> assumption update -> next action`

Nếu post-mortem không làm thay đổi một assumption hoặc một rule trong plan, nó chỉ là meeting note.

## Core model: Assumption Change Log

Một post-mortem tốt không hỏi "campaign này thắng hay thua?" trước. Nó hỏi:

> Bằng chứng này làm mình tin điều gì **ít hơn**, tin điều gì **nhiều hơn**, và cần test gì tiếp theo?

| Log field | Câu hỏi vận hành | Output đủ tốt |
| --- | --- | --- |
| Hypothesis | Trước test, team tin điều gì? | Một câu có thể bị chứng minh sai |
| Setup | Test chạy ở đâu, bao lâu, budget/cell nào? | Channel, geo, platform, window, spend |
| Evidence | Metric nào thật sự đổi? | Tách `CTR`, `CVR`, D1, revenue, tracking |
| Confidence | Evidence mạnh đến đâu? | Sample/window/tracking caveat |
| Interpretation | Metric pattern nói gì về promise chain? | Creative, store, first session, economy, tracking |
| Assumption changed | Niềm tin nào được update? | Một câu mới có thể dùng lại |
| Next action | Làm gì tiếp, ai làm, khi nào? | Owner, deadline, artifact |

Nguyên tắc: **evidence là điều xảy ra; interpretation là điều bạn tin sau khi đọc evidence**. Đừng trộn hai thứ này.

## Learning log mẫu

Copy framework này vào Notion, sheet, hoặc Final UA Plan:

| Field | Prompt | Example cho puzzle soft-launch |
| --- | --- | --- |
| Test ID | Test này là gì? | W4-Hook-Relax-vs-Challenge |
| Original hypothesis | Team tin điều gì trước khi chạy? | Challenge hook kéo player puzzle fit hơn |
| Setup | Spend/window/platform/geo/cells? | `$240`, Android, 4 ngày, 3 creatives, US-lite geo |
| Evidence observed | Metric nào đổi theo bucket? | Challenge `CTR` cao hơn, `CVR` thấp hơn, D1 yếu |
| Confidence level | Weak/directional/repeated? | Directional; sample nhỏ; events pass |
| Promise-chain diagnosis | Chain đứt ở đâu? | Ad curiosity không được store + first session chứng minh |
| Assumption changed | Rule mới là gì? | "Challenge angle cần proof công bằng ngay 3s đầu" |
| Next action | Artifact tiếp theo? | Rewrite challenge thành fair puzzle, update first 3 levels proof |

Learning log không cần dài. Nó cần đủ rõ để người đọc sau 2 tuần không phải đoán vì sao team chọn next action.

### Rule-update gate

Không phải learning log nào cũng được phép update rule trong Final UA Plan. Dùng gate này để phân biệt **ghi nhận observation**, **iterate thêm**, hay **đổi operating rule**.

| Gate | Câu hỏi | Nếu pass | Nếu fail |
| --- | --- | --- | --- |
| Hypothesis existed before test | Team có ghi hypothesis trước khi nhìn report không? | Có thể đọc evidence với ít hindsight bias hơn | Ghi là retroactive interpretation, không update rule cứng |
| Evidence maps to one chain link | Pattern chỉ rõ creative/store/first-session/economy/tracking không? | Next action có thể sửa đúng artifact | Repeat hoặc instrument sạch hơn |
| Confidence is named | Weak hint, directional, repeated hay operating rule? | Action có đúng mức độ tin cậy | Không scale/kill, chỉ log caveat |
| Blocked conclusions are explicit | Log nói điều gì chưa được kết luận không? | Team ít overclaim hơn | Bắt buộc thêm caveat trước khi plan update |
| Next action changes an artifact | Có creative/store/event/budget/successCriteria thay đổi không? | Learning đi vào sprint sau | Log chỉ là meeting note |

Action ladder:

| Evidence outcome | Quyền hành động | Không được làm |
| --- | --- | --- |
| Weak hint | Repeat cleaner, reduce variables, fix tracking | Update rule, scale, kill hypothesis |
| Directional signal | Iterate one artifact, keep budget modest | Rewrite strategy toàn bộ |
| Repeated evidence | Update creative/store/product rule | Gọi là universal truth |
| Operating rule | Codify into Final UA Plan and checklist | Bỏ qua caveat/source context |

Rule: nếu log không có `blocked conclusions`, nó chưa đủ trưởng thành để đổi rule.

## Operating diagram: learning loop sau mỗi test

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: learning loop sau mỗi test]
Type: hero operating diagram.
Lesson section: Operating diagram: learning loop sau mỗi test.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
[1. Hypothesis: "Player wants X"]
        |
        v
[2. Test setup: creative / store / geo / budget]
        |
        v
[3. Evidence: CTR / CVR / D1 / revenue]
        |
        v
[4. Confidence: sample + tracking caveats]
        |
        v
[5. Assumption update: belief changed]
        |
        v
[6. Next action: artifact + owner]
        |
        +--> feeds the next hypothesis
```

**Inspect:** assumption update nằm giữa evidence và next action, không nằm ở cuối như một câu summary cho đẹp.

**Conclude:** team chỉ thật sự học khi report làm thay đổi hypothesis, creative rule, store proof, first-session proof, hoặc metric rule.

**Do not infer:** loop này không yêu cầu một dashboard phức tạp. Một bảng 7 field cũng đủ nếu team ghi đúng evidence và caveat.

## Evidence strength scale

```text
[VISUAL PLACEHOLDER: Third-party image request - Evidence strength ladder]
Type: evidence ladder / confidence scale.
Lesson section: Evidence strength scale.
Visual brief: turn the confidence levels into a ladder from anecdote to operating rule, showing which language and action are allowed at each level.
Teaching job: help the learner avoid turning one small campaign result into an overconfident rule.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

| Evidence strength | Dấu hiệu thường thấy | Ngôn ngữ được phép dùng | Action phù hợp |
| --- | --- | --- | --- |
| Anecdote | 1-2 comment, một screenshot, cảm giác của team | "observation" | Discuss, chưa update plan |
| Weak hint | Rất ít installs, delivery lệch, tracking chưa chắc | "weak hint" | Simplify setup hoặc repeat |
| Directional signal | Một test đọc được, events pass, pattern có logic | "directional signal" | Iterate có kiểm soát |
| Repeated evidence | 2+ tests cùng hướng hoặc nhiều cohort nhỏ khớp nhau | "stronger evidence" | Update creative/store/product rule |
| Operating rule | Evidence lặp lại qua channel/window khác nhau | "operating rule" | Codify vào Final UA Plan |

**Inspect:** scale này giới hạn ngôn ngữ của post-mortem. "Challenge hook là hướng sai" chỉ hợp lý khi evidence đã lặp lại; với one-off test, hãy viết "challenge hook đang có weak/directional risk".

**Conclude:** confidence language bảo vệ team khỏi scale quá sớm hoặc kill quá vội.

**Do not infer:** evidence yếu không vô dụng. Nó chỉ chưa được phép biến thành rule cứng.

## Hướng dẫn đọc số

Đọc log theo pattern, không đọc từng metric riêng lẻ:

| Report pattern | Evidence bucket | Interpretation nên ghi | Next test nên làm |
| --- | --- | --- | --- |
| `CTR` cao, `CVR` thấp, D1 yếu | Creative attention mạnh, store/product proof yếu | Promise gây tò mò nhưng chưa chứng minh được fit | Viết hook honest hơn hoặc đổi screenshot proof |
| `CTR` vừa phải, `CVR` tốt, D1 tốt hơn | Motivation fit rõ hơn raw attention | Player được kéo vào bởi promise đúng hơn | Produce thêm variants cùng motivation |
| `CVR` tăng sau store update, D1 không đổi | Store proof tốt hơn, first session chưa đổi | Listing giảm friction nhưng game chưa giữ chân hơn | Giữ store proof, sửa first session proof |
| D1 tốt, ROAS/revenue yếu | Product retention ổn, economy/monetization yếu | Learning thuộc monetization chứ không phải creative | Test ad placement/IAP/onboarding economy |
| Result chỉ mạnh ở một geo/window nhỏ | Measurement/sample caveat | Chưa đủ để scale rule | Repeat ở clean window hoặc geo khác |
| Tracking missing/mismatch | Data quality failure | Không có product conclusion hợp lệ | Fix event taxonomy rồi repeat |
| Spend dồn vào 1 cell quá sớm | Delivery bias | Winner claim yếu | Rerun với cleaner setup hoặc log caveat |

Rule thực hành:

1. Ghi metric raw trước: spend, impressions, clicks, installs, `CTR`, `CVR`, CPI, D1, revenue nếu có.
2. Bucket metric vào chain: creative, store, first session, economy, tracking.
3. Viết confidence caveat trước khi viết verdict.
4. Chỉ update plan nếu next action thay đổi artifact thật: creative matrix, store proof, event taxonomy, budget rule, success criteria.

### Learning decision ledger

Sau post-mortem, đừng viết một verdict duy nhất. Tách verdict thành ba lớp để tránh học sai:

| Layer | Câu hỏi | Ví dụ câu trả lời | Quyền hành động |
| --- | --- | --- | --- |
| Evidence | Số liệu/thực tế nào đã xảy ra? | Relax có `CVR` và D1 tốt hơn Challenge trong window này | Được ghi raw, chưa được thành rule |
| Interpretation | Pattern này nói gì về promise chain? | Challenge tạo attention nhưng store/FTUE chưa chứng minh fairness | Được dùng để thiết kế test kế tiếp |
| Rule update | Niềm tin nào đủ mạnh để đổi plan? | Calm/satisfying promise ưu tiên hơn cho build hiện tại, với confidence directional | Chỉ update rule nếu caveat rõ |

Nếu ba lớp này bị trộn, team dễ biến "A thắng tuần này" thành "A luôn đúng". Với micro-budget, phần quan trọng nhất là biết **được phép tin đến đâu**.

## Worked example: false positive micro-budget

Team chạy test cho mobile puzzle "Calming Hex Puzzle".

| Field | Entry |
| --- | --- |
| Original hypothesis | "Challenge hook sẽ kéo user có puzzle intent tốt hơn relax hook." |
| Setup | 2 creatives, `$120`, Android, 4 ngày, same store listing, D1 read sau 48h |
| Evidence observed | Challenge: `CTR` cao hơn; Relax: `CVR` và D1 tốt hơn; spend hơi dồn vào Challenge ngày đầu |
| Confidence | Directional, không phải rule. Sample nhỏ, delivery biased nhẹ, events pass. |
| Promise-chain diagnosis | Challenge tạo curiosity ở ad nhưng store/first session không chứng minh challenge công bằng đủ nhanh. Relax promise khớp hơn với gameplay hiện tại. |
| Assumption changed | "Với build hiện tại, calm/satisfying promise đáng ưu tiên hơn challenge-hard promise, trừ khi first 3 levels chứng minh fairness tốt hơn." |
| Next action | Làm 2 relax variants, sửa challenge opening thành fair puzzle, thêm screenshot proof về clear/satisfying moment. |

Verdict: **iterate**, không scale và không kill challenge vĩnh viễn.

Tradeoff: nếu chỉ nhìn `CTR`, team sẽ scale Challenge. Nếu chỉ nhìn D1, team có thể bỏ qua rằng Challenge vẫn có attention. Learning log giữ cả hai: attention có thật, nhưng promise chain chưa đủ proof.

### Second-pass post-mortem read

Đọc lại log bằng checklist phản biện:

| Question | Nếu câu trả lời là "không" | Sửa log bằng cách |
| --- | --- | --- |
| Hypothesis có được ghi trước test không? | Có nguy cơ hindsight bias | Ghi rõ "retroactive interpretation", không gọi là hypothesis gốc |
| Evidence có tách khỏi interpretation không? | Team đang kể chuyện theo số | Tách một bảng raw metric và một đoạn diagnosis riêng |
| Confidence có giới hạn không? | One-off test dễ thành rule cứng | Thêm sample/window/tracking caveat |
| Next action có đổi artifact không? | Log chưa chuyển thành learning loop | Gắn action vào creative matrix, store proof, event taxonomy hoặc successCriteria |

Post-mortem tốt là post-mortem làm sprint sau rõ hơn. Nếu kết thúc bằng "monitor thêm" nhưng không nói monitor metric nào, window nào, ai owner, thì log chưa đủ sắc.

Log acceptance contract:

```md
Learning log acceptance

Evidence level:
[weak hint / directional signal / repeated evidence / operating rule]

Allowed update:
[observation only / iterate artifact / update rule / codify checklist]

Blocked conclusions:
[what this test cannot prove]

Artifact changed:
[creativeMatrix / store proof / event taxonomy / successCriteria / budget rule / none]

Repeat condition:
[when this learning needs another test before becoming a rule]

Owner/date:
[who updates the plan and when]
```

Ví dụ:

```md
Evidence level:
Directional signal.

Allowed update:
Iterate creative and store proof. Do not update global audience rule yet.

Blocked conclusions:
This test does not prove Challenge is a bad motivation overall. It only shows current Challenge execution overpromises fairness.

Artifact changed:
creativeMatrix and store proof checklist.

Repeat condition:
Run one cleaner Challenge-fairness cell after first 3 levels are adjusted.
```

Acceptance contract biến log thành một checkpoint vận hành. Nếu log không đổi artifact nào, team vẫn có thể lưu nó, nhưng không nên gọi là learning đã được hấp thụ vào plan.

### Learning absorption certificate

Sau khi viết learning log, hãy xác nhận learning đã được hấp thụ vào workflow. Certificate này trả lời: log đã đổi field nào trong Final UA Plan, ticket nào được tạo, và rule nào vẫn chưa đủ mạnh để codify.

| Certificate field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Plan field changed | Field nào trong Final UA Plan đổi? | `creativeMatrix`, `store proof`, `tracking`, `successCriteria`, `budget`, hoặc `nextAction` |
| Ticket created | Artifact nào được giao owner? | creative ticket, store ticket, event QA ticket, retest ticket |
| Rule status | Observation, directional rule hay operating rule? | Không gọi directional signal là rule cứng |
| Repeat requirement | Cần test lại trước khi codify không? | Có condition cụ thể |
| Archive note | Người đọc sau 2 tuần hiểu vì sao đổi không? | hypothesis + evidence + caveat đủ rõ |

```text
Learning absorption certificate
- Plan field changed:
- Ticket created:
- Rule status:
- Repeat requirement:
- Archive note:
- Owner/date:
```

Nếu certificate không điền được `Plan field changed` hoặc `Ticket created`, learning vẫn đang nằm ngoài operating system. Nó có thể đúng, nhưng chưa biến thành hành động.

## Post-mortem operating checklist

| Check | Pass condition | Fail symptom |
| --- | --- | --- |
| Original hypothesis saved | Hypothesis được ghi trước khi đọc report | Team reverse-write cho hợp data |
| Setup reproducible | Có budget, window, geo, channel, cells | Không ai rerun được test |
| Evidence bucketed | Creative/store/product/economy/tracking tách riêng | "Ads tốt/xấu" quá chung |
| Confidence explicit | Có sample/window/tracking caveat | One-off test biến thành rule |
| Assumption changed | Có một câu belief mới | Log chỉ ghi winner |
| Next action owned | Có owner/date/artifact | Meeting xong không ai làm |
| Plan linked | Ghi field nào trong Final UA Plan đổi | Knowledge nằm ngoài workflow |

Quality chain:

`test setup -> evidence -> confidence -> interpretation -> assumption update -> next artifact`

Nếu thiếu một mắt xích, post-mortem chưa đủ để ra quyết định.

## Real usecases đã đối chiếu nguồn

Các nguồn dưới đây không phải case "hãy làm giống họ". Chúng là source để hiểu vì sao learning log cần ghi setup, event, report type và caveat.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase nói events giúp hiểu user actions, system events, errors; Unity app có thể log suggested/custom events; dashboard aggregate cập nhật định kỳ, debug/logcat hữu ích cho kiểm tra nhanh. | Learning log phải ghi event nào đã pass/fail. Nếu `tutorial_complete` hoặc `level_3_start` không log đúng, D1/retention interpretation yếu. | Không suy ra Firebase tự trả lời creative nào thắng; nó chỉ cung cấp event evidence khi setup đúng. |
| [GA4 Life cycle collection](https://support.google.com/analytics/answer/12924233?hl=en) | GA4 Life cycle giúp đọc funnel từ acquisition đến retention, gồm acquisition, engagement, monetization và retention reports. | Post-mortem nên bucket evidence theo journey stage thay vì gộp tất cả vào một verdict "campaign tốt/xấu". | Không dùng GA4 category như benchmark cứng cho game của bạn; nó là cách tổ chức câu hỏi. |
| [Privacy Sandbox Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting bỏ reliance vào cross-party identifiers; có event-level và aggregatable reports; event-level trigger data bị giới hạn và có noise/reporting windows. | Log phải ghi attribution/reporting caveat, đặc biệt khi so test window hoặc platform khác nhau. | Không suy ra attribution privacy làm UA vô dụng; chỉ cần confidence language cẩn thận hơn. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit như framework đo campaign success trong khi giúp duy trì user privacy. | Với iOS learning, winner label cần đi kèm attribution window và confidence caveat. | Không đọc attribution postback như full user journey hay proof tuyệt đối về motivation. |

### Learning log card readout

| Card area | What to inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Hypothesis | Có phải câu có thể sai không? | Nếu hypothesis mơ hồ, evidence sẽ không đổi được belief | Không cần biến hypothesis thành slogan marketing |
| Evidence | Metric có tách creative/store/product/economy không? | Bucket đúng giúp next action đúng artifact | Một metric đơn lẻ không nói toàn bộ chain |
| Confidence | Có sample/window/tracking caveat không? | Caveat quyết định scale/iterate/repeat | Caveat không làm log yếu; nó làm log trung thực |
| Assumption changed | Có belief mới dùng lại được không? | Đây là phần tạo learning thật | Không biến belief mới thành rule vĩnh viễn khi evidence mới directional |
| Next action | Có owner/date/artifact không? | Learning phải bước vào sprint tiếp theo | Không để next action là "monitor thêm" nếu chưa nói monitor cái gì |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Log chỉ ghi "A won". | **Correction:** Ghi "A thắng ở metric nào, vì assumption nào đổi, confidence bao nhiêu." |
| **Mistake:** Dùng `CTR` làm verdict cuối. | **Correction:** Đọc `CTR` như attention, rồi kiểm store `CVR` và first-session/D1. |
| **Mistake:** Reverse-write hypothesis sau khi thấy data. | **Correction:** Save original hypothesis trước khi launch test. |
| **Mistake:** Không ghi tracking caveat. | **Correction:** Nếu event fail/missing, log "no valid product conclusion". |
| **Mistake:** Trộn creative learning với product learning. | **Correction:** Bucket evidence: creative, store, first session, economy, tracking. |
| **Mistake:** Next action không có owner/date. | **Correction:** Mỗi log kết thúc bằng artifact cụ thể và người chịu trách nhiệm. |
| **Mistake:** Update operating rule từ một directional signal. | **Correction:** Chỉ iterate artifact; đợi repeated evidence trước khi codify rule. |
| **Mistake:** Không ghi blocked conclusions. | **Correction:** Mỗi log phải nói rõ điều test này chưa chứng minh, ví dụ "không chứng minh motivation này chết". |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Post-mortem` | Review sau test để học và sửa system, không phải đổ lỗi |
| `Learning log` | Artifact ghi hypothesis, evidence, confidence, assumption update |
| `Confidence caveat` | Câu giới hạn độ tin cậy của evidence |
| `Assumption` | Niềm tin vận hành có thể đúng/sai |
| `Directional signal` | Bằng chứng có hướng nhưng chưa đủ thành rule |
| `Operating rule` | Rule đã đủ repeated evidence để codify vào plan |
| `Cohort` | Nhóm user theo source/window/time để đọc retention |
| `Attribution window` | Khoảng thời gian report gán conversion về source |

## Lab output example

```md
Learning log entry - W4 Relax vs Challenge

Test ID:
- W4-Hook-Relax-vs-Challenge

Original hypothesis:
- Challenge hook will attract stronger puzzle-fit users than relax hook.

Setup:
- Android, 4 days, $120 total.
- 2 creatives, same store listing, same geo cluster.
- Events checked: install, tutorial_start, level_3_start, session_day_1.

Evidence observed:
- Challenge: higher CTR, weaker store CVR and D1.
- Relax: lower CTR, stronger CVR and D1.
- Spend delivery biased slightly toward Challenge on Day 1.

Confidence:
- Directional signal, not an operating rule.
- Sample small; tracking passed; rerun needed before scale.

Promise-chain diagnosis:
- Challenge creates attention, but current store + first session do not prove fairness fast enough.
- Relax promise matches current gameplay proof better.

Assumption changed:
- For this build, calm/satisfying promise is safer than hard-challenge promise unless first 3 levels are redesigned to prove fairness.

Learning log acceptance:
- Evidence level: Directional signal.
- Allowed update: Iterate creative/store proof; do not codify global audience rule yet.
- Blocked conclusions: Challenge motivation is not dead; current execution lacks fair proof.
- Artifact changed: creativeMatrix, store proof checklist.
- Repeat condition: rerun one cleaner Challenge-fairness cell after first 3 levels improve.

Learning absorption certificate:
- Plan field changed:
- Ticket created:
- Rule status:
- Repeat requirement:
- Archive note:
- Owner/date:

Next action:
- Creative owner: produce 2 relax variants by Monday.
- Game owner: improve first 3 levels'' fairness proof by Wednesday.
- Store owner: add one screenshot showing satisfying clear moment.
```

## Practical Lab

1. Chọn một test thật hoặc giả định từ tuần này.
2. Viết original hypothesis trước khi nhìn report.
3. Fill setup: spend, channel, platform, geo, window, cells.
4. Ghi evidence raw theo metric.
5. Bucket evidence vào creative/store/first session/economy/tracking.
6. Chọn confidence level: weak hint, directional signal, repeated evidence, operating rule.
7. Viết đúng một câu **assumption changed**.
8. Viết next action có owner/date/artifact.
9. Cập nhật Final UA Plan field liên quan.
10. Viết learning log acceptance: evidence level, allowed update, blocked conclusions, artifact changed, repeat condition.
11. Nếu evidence chưa đủ rule-update gate, chuyển next action thành repeat/simplify thay vì update rule.
12. Viết Learning absorption certificate.

Quality gate: nếu câu "assumption changed" không làm thay đổi creative matrix, store proof, event taxonomy, success criteria hoặc next action, log chưa đủ sâu.

## Final UA Plan Update

Cập nhật field **successCriteria**:

```md
Learning rule:
- A campaign result is considered actionable only when evidence is bucketed by creative/store/first-session/economy/tracking and has a confidence caveat.

Confidence language:
- Weak hint = repeat/simplify.
- Directional signal = iterate with caution.
- Repeated evidence = update rule.
- Operating rule = codify into plan.
```

Cập nhật field **nextAction**:

```md
Next assumption to validate:
- Current assumption:
- Evidence needed:
- Test setup:
- Owner:
- Deadline:
- Artifact to update:
```

Cập nhật field **creativeMatrix** nếu bài học thuộc creative:

```md
Creative learning:
- Winning/losing cell:
- Metric pattern:
- Promise-chain diagnosis:
- Assumption changed:
- Evidence level:
- Blocked conclusions:
- Artifact changed:
- Repeat condition:
- Next creative rule:
```

Cập nhật field **learningCadence**:

```md
Learning log acceptance:
- Evidence level:
- Allowed update:
- Blocked conclusions:
- Artifact changed:
- Repeat condition:
- Owner/date:

Learning absorption certificate:
- Plan field changed:
- Ticket created:
- Rule status:
- Archive note:
```

## Checklist Focus

- [ ] Learning log có original hypothesis, không reverse-write.
- [ ] Setup ghi đủ spend, platform, geo, window, cells.
- [ ] Evidence tách khỏi interpretation.
- [ ] Metric được bucket theo promise chain.
- [ ] Confidence caveat nói rõ sample/window/tracking.
- [ ] Rule-update gate đã pass trước khi sửa operating rule.
- [ ] Blocked conclusions được ghi rõ.
- [ ] Assumption changed là một câu có thể dùng lại.
- [ ] Learning log acceptance có evidence level, allowed update, artifact changed.
- [ ] Learning absorption certificate có plan field changed và ticket created.
- [ ] Next action có owner/date/artifact.
- [ ] Final UA Plan được cập nhật bằng rule hoặc next test cụ thể.

## Curated References

- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [GA4 Life cycle collection](https://support.google.com/analytics/answer/12924233?hl=en)
- [Privacy Sandbox Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
', now()),
  ('lessons/day-28.md', 'markdown', null, '---
day: 28
title: "Weekly UA operating rhythm"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, ROAS, Soft launch]
artifact: "Weekly operating cadence"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Weekly operating cadence** cho micro soft-launch: một nhịp làm việc rõ owner, deadline, artifact, readiness gate, report readout, decision meeting và learning log.

Quyết định chính: tuần tới team nên chạy **một loop nhỏ nhưng đóng được**, hay giảm scope vì creative/build/store/tracking chưa đủ capacity?

Artifact này cập nhật field **nextAction**, **budget**, **creativeMatrix**, **tracking** và **successCriteria** trong Final UA Plan.

## Why this matters

UA của indie team hiếm khi hỏng vì thiếu ý tưởng. Nó thường hỏng vì rhythm lỏng: creative export muộn, build chưa validate event, store listing đổi giữa test, report đọc quá sớm, meeting không chốt call, learning log bị bỏ qua. Khi đó team tưởng mình đang "soft-launch", nhưng thật ra chỉ đang đốt budget vào một chuỗi việc chưa khép kín.

Với budget `$100-500`, cadence quan trọng hơn ambition. Một tuần chạy 2 creatives, 1 store proof, 1 build QA, 1 readout rõ và 1 decision thật thường có giá trị hơn một plan 8 creatives nhưng không có D1 window, không có owner, và không biết ai update plan.

Cadence tốt biến UA thành loop vận hành:

`learning question -> readiness -> launch -> readout -> decision -> learning log -> next question`

Nếu cadence không có owner/deadline/artifact, nó chỉ là wishlist.

## Core model: Close the loop before adding scope

Đừng hỏi "tuần này team làm được bao nhiêu task?" trước. Hãy hỏi:

> Tuần này team có thể đóng trọn một learning loop nào mà không làm hỏng measurement không?

| Loop stage | Câu hỏi cần chốt | Output bắt buộc | Không có output này thì |
| --- | --- | --- | --- |
| Learning question | Tuần này học điều gì? | 1 hypothesis + allowed decision | Test quá rộng, report không có verdict |
| Readiness | Build/store/events/creative đã đủ chưa? | Gate pass hoặc caveat | Data unreadable |
| Launch | Campaign chạy theo setup nào? | Spend/window/platform/cells | Không rerun được |
| Readout | Metric đọc theo bucket nào? | Creative/store/product/economy/tracking readout | Meeting thành cảm tính |
| Decision | Scale/iterate/hold/fix gì? | One primary call | Không ai làm bước tiếp |
| Learning log | Assumption nào đổi? | Log entry + plan update | Tuần sau lặp lại lỗi cũ |

Rule vận hành: nếu tuần này không thể đóng đủ 6 stage, hãy giảm creative cells, giảm store changes, hoặc dời launch.

## Weekly cadence mẫu

| Timebox | Owner | Job | Done means | Decision protected |
| --- | --- | --- | --- | --- |
| Monday AM | UA/product | Lock learning question | 1 hypothesis, 1 allowed call, 1 metric bucket | Không test lan man |
| Monday PM | Creative/UA | Lock creative matrix | 2-4 cells, filenames, promise labels | Không nhầm variant |
| Tuesday | Tech/product | Validate build + events | install, tutorial, level/progression, revenue/ad events checked | Không đọc sai D1/economy |
| Wednesday | Store/product | Freeze store proof | screenshot/copy version named | Không trộn store effect vào creative test |
| Thu-Fri | UA | Launch + monitor spend | spend pacing and delivery caveats logged | Không declare winner từ delivery bias |
| Next Monday AM | UA/product | Readout + decision meeting | one primary call + owner/date | Không kết thúc bằng "theo dõi thêm" mơ hồ |
| Next Monday PM | UA owner | Learning log + plan update | assumption changed + next question | Không mất learning |

Cadence không cần giống calendar này. Nhưng mọi cadence phải có: **owner, deadline, artifact, gate, readout, decision, log**.

### Weekly capacity contract

Trước khi commit tuần, team cần một contract nhỏ để không hứa nhiều hơn khả năng đóng loop.

| Contract field | Câu hỏi | Ví dụ tốt |
| --- | --- | --- |
| One learning question | Tuần này chỉ học điều gì? | Relax hook có tạo player fit sạch hơn challenge hook không? |
| Max creative cells | Team thật sự export/QA được bao nhiêu cell? | 2-3 cells, không phải 8 cells |
| Required gates | Gate nào phải pass trước spend? | Event QA, store freeze, build version, campaign naming |
| Readout windows | D0/D1/D7 đọc lúc nào? | Friday đọc acquisition/store, Monday đọc D1 |
| Decision vocabulary | Meeting được phép chốt call nào? | launch, hold, fix-readiness, iterate, rerun |
| Scope cut rule | Nếu gate fail thì cắt gì trước? | Cắt cell mới trước, không cắt event QA |

Contract này bảo vệ cadence khỏi một lỗi rất phổ biến: giữ nguyên deadline nhưng giảm chất lượng gate. Với micro-budget, event QA và store freeze không phải "nice to have"; chúng là điều kiện để số liệu có nghĩa.

## Operating diagram: weekly UA loop

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: weekly UA loop]
Type: hero operating diagram.
Lesson section: Operating diagram: weekly UA loop.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
┌──────────────────────┐
│ 1. Learning question  │
│ one hypothesis        │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 2. Readiness gate     │
│ creative/build/store  │
│ events/privacy        │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 3. Campaign run       │
│ spend/window/cells    │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 4. Bucketed readout   │
│ CTR/CVR/D1/revenue    │
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 5. Decision meeting   │
│ scale/iterate/hold/fix│
└──────────┬───────────┘
           v
┌──────────────────────┐
│ 6. Learning log       │
│ assumption + next Q   │
└──────────┴───────────┘
```

**Inspect:** loop có readiness gate trước launch và learning log sau decision. Đây là hai chỗ indie team hay bỏ qua nhất.

**Conclude:** cadence khỏe không phải là chạy campaign liên tục; cadence khỏe là mỗi test đóng thành một learning unit.

**Do not infer:** tuần nào cũng phải scale. Có tuần quyết định đúng nhất là hold/fix readiness.

## Capacity board: scope theo bottleneck thật

```text
[VISUAL PLACEHOLDER: Third-party image request - Capacity board: scope theo bottleneck thật]
Type: data visual/chart or decision board.
Lesson section: Capacity board: scope theo bottleneck thật.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Workstream | Healthy weekly capacity cho team nhỏ | Nếu quá tải sẽ thấy | Scope rule |
| --- | --- | --- | --- |
| Creative | 2-4 variants có cùng naming rule | asset muộn, QA yếu, hook lệch matrix | giảm cells trước khi tăng budget |
| Build/events | 1 validated build | event mismatch, crash, D1 unreadable | thêm QA day, không launch nếu core events fail |
| Store proof | 0-1 listing update | không biết `CVR` đổi vì creative hay store | freeze store khi creative test |
| Campaign/report | 1 clean readout | nhiều charts nhưng không có call | dùng one-call template |
| Product proof | 1 small first-session fix | refactor rộng, không ship kịp | chọn proof trong 3 phút đầu |
| Privacy/compliance | 1 review khi SDK/data behavior đổi | launch bị block, disclosure thiếu | đưa vào readiness gate |

**Inspect:** board này không đo "team bận bao nhiêu"; nó đo bottleneck nào làm evidence mất đọc được.

**Conclude:** nếu một workstream miss 2 tuần liên tiếp, cadence phải giảm scope hoặc đổi sequence.

**Do not infer:** giảm scope là chậm. Với micro-budget, giảm scope thường là cách duy nhất để data đọc được.

## Hướng dẫn đọc số

Đọc metrics để chẩn đoán cadence, không chỉ chẩn đoán campaign.

| Metric/report pattern | Cadence issue có thể xảy ra | Câu hỏi cần hỏi | Next action |
| --- | --- | --- | --- |
| Report luôn trễ | Review meeting quá sớm hoặc owner thiếu | D1/revenue window đã đủ chưa? | Tách D0 readout và D1 readout |
| `CTR` có nhưng `CVR` caveat nặng | Store đổi giữa test hoặc listing proof yếu | Store version có freeze không? | Freeze store hoặc rerun |
| D1 không đọc được | Event/taxonomy/build QA fail | D1 event pass trước launch chưa? | Fix tracking, repeat |
| CPI rẻ nhưng cohort yếu | Learning question quá rộng | Test đang học creative hay audience? | Reduce cells và tighten hypothesis |
| Spend dồn vào 1 variant | Delivery bias | Có đủ delivery để gọi winner không? | Log caveat, rerun cleaner |
| Meeting có nhiều insight, không có action | Decision rule thiếu | Call được phép là scale/iterate/hold/fix gì? | Require one primary call |
| Creative muộn 2 tuần | Scope vượt capacity | Team thật sự ship được mấy cells? | Chạy 2 strong cells thay vì 6 weak cells |
| Privacy/store disclosure block launch | Readiness gate thiếu compliance | SDK/data behavior có đổi không? | Add privacy/data safety review slot |

Cadence rule: **nếu data không đọc được, đừng hỏi creative nào thắng; hỏi stage nào làm loop bị hở**.

Cadence triage ledger:

| Weekly state | Classification | What it means | Decision for this week |
| --- | --- | --- | --- |
| Creative/store/build/events all pass readiness | Launch loop | Team can run a small paid test and close a readout | Launch with fixed scope and scheduled readout |
| Creative ready but event/store gate fails | Fix-readiness week | Paid spend would create unreadable data | Hold launch, fix gate, keep creative packet |
| Build/events pass but creative packet late | Reduce-scope week | Measurement is ready but production capacity is the bottleneck | Run fewer cells or shift to store/readout work |
| Campaign ran but D1/revenue window not ready | Readout-split week | D0 can be read, retention/economy cannot | Do D0 readout now, schedule D1/D7 decision |
| Report has insights but no owner/action | Decision-debt week | Learning is not converting into execution | Block next launch until owner/date/action exists |
| Multiple workstreams miss deadlines | Reset-cadence week | Scope exceeds operating capacity | Cut the loop to one question, one asset packet, one gate |

Decision rule:

```text
Launch only when the loop can close.
If readiness fails, the week is not "lost"; it becomes a fix-readiness week.
If readout is incomplete, split the readout instead of forcing a fake decision.
```

Weekly UA rhythm should label the week honestly. A "hold/fix" week with clean evidence is better than a "launch" week that creates a report nobody can trust.

### Decision meeting one-call template

Decision meeting phải kết thúc bằng một primary call. Không cần dài, nhưng phải đủ 6 dòng:

```md
Weekly decision call

Primary call:
[launch / hold / fix-readiness / iterate / rerun / stop]

Evidence:
[2-3 facts that support the call]

Blocked conclusions:
[what this week''s data cannot prove]

Owner:
[name]

Due date:
[date]

Plan update:
[field in Final UA Plan changed]
```

Nếu meeting chưa điền được `owner`, `due date`, và `plan update`, meeting chưa đóng. "Theo dõi thêm" chỉ hợp lệ khi có metric trigger cụ thể, ví dụ: "monitor D1 until Monday 10:00; if D1 remains below cohort direction, product owner opens first-session proof ticket."

## Worked example: một tuần bị quá tải

Team "Calming Hex Puzzle" muốn test 6 videos, update store screenshots, thêm ad placement, và chạy campaign trong cùng tuần.

| Plan ban đầu | Reality | Diagnosis | Fix cadence |
| --- | --- | --- | --- |
| 6 videos | 2 videos delivered đúng deadline | Creative capacity mismatch | Chạy 2 cells, phần còn lại backlog |
| Store screenshot update | Store copy đổi sau launch | Store effect trộn creative effect | Freeze store trước launch |
| Build QA Wednesday | `level_3_start` event fail | Tracking gate quá muộn | Validate Tuesday, launch Thursday only if pass |
| Report Friday | D1 chưa đủ window | Review quá sớm | Friday D0 readout, Monday D1 decision |
| Meeting Monday | Không ai nhận next action | Decision meeting thiếu owner rule | Meeting không close nếu chưa có owner/date |

Verdict: **hold launch scope**, không tăng cells. Chạy 2 creative cells với build/event/store freeze sạch.

Tradeoff: ít cells hơn làm test nhìn "nhỏ" hơn, nhưng readout có thể dùng được. Sáu cells với tracking/store caveat chỉ tạo thêm noise.

Second-pass cadence read:

| Question | Evidence | Better call |
| --- | --- | --- |
| Loop có thể close trong tuần này không? | Creative only delivers 2/6, event gate fails, store changed mid-test | Không launch full scope |
| Bottleneck thật là gì? | Creative capacity + tracking readiness + store freeze | Reduce to 2 cells and add readiness gate |
| Metric nào không được đọc tuần này? | D1 chưa đủ window; `level_3_start` event fail | Không gọi retention verdict |
| Action nào phải có owner/date? | Event QA, store freeze, 2-cell creative export, Monday D1 readout | Assign owner before any spend |
| Learning log ghi gì? | 6-cell plan exceeds operating capacity | Next week starts with max 2 cells unless readiness passes early |

Decision memo:

```md
Weekly state: Fix-readiness + reduce-scope week.
Launch call: hold full 6-cell launch.
Allowed launch: 2 cells only after event QA and store freeze.
D0 readout: Friday acquisition/store only.
D1 decision: Monday, after cohort window.
Learning log: capacity supports 2 clean cells, not 6 noisy cells.
```

Điểm sâu: cadence không chỉ là lịch. Cadence là cơ chế nói "không" với scope làm hỏng learning. Nếu team không thể close loop, giảm scope là quyết định UA, không phải quản lý dự án phụ.

Weekly operating ticket:

```md
Weekly operating ticket - W5

Learning question:
Does relax/satisfaction promise create cleaner player fit than challenge promise?

Scope:
2 creative cells, 1 store version, 1 Android market, $120 spend cap.

Readiness gates:
Event QA pass, store freeze v3, campaign naming pass, data safety unchanged.

Readout split:
Friday D0 acquisition/store readout.
Monday D1 first-session/retention readout.

Primary decision vocabulary:
iterate relax, repair challenge proof, hold for readiness, or rerun cleaner.

Scope cut rule:
If event QA fails, no launch.
If creative export misses deadline, run 1 cell smoke or hold.
If store changes after launch, mark caveat and do not call creative winner.
```

Operating ticket giúp cadence sống trong công việc thật: ai cũng biết tuần này cắt gì trước, không phải tranh luận lại khi deadline sát.

### Weekly closure certificate

Một tuần UA chỉ được coi là "đóng loop" khi có certificate này. Nó xác nhận tuần đó đã tạo ra decision, learning log và next question, hoặc đã được phân loại là fix-readiness week có owner rõ.

| Certificate field | Câu hỏi | Pass condition |
| --- | --- | --- |
| Weekly state | Launch, fix-readiness, reduce-scope, readout-split hay reset-cadence? | Một nhãn duy nhất |
| Primary call | Tuần này chốt call gì? | launch / iterate / hold / fix / rerun / stop |
| Blocked conclusions | Metric nào chưa đủ quyền kết luận? | D1, ROAS, winner, channel, product verdict được ghi rõ nếu blocked |
| Plan field updated | Field nào đổi trong Final UA Plan? | budget, creativeMatrix, tracking, nextAction, successCriteria |
| Next question | Tuần sau học điều gì? | Một learning question mới hoặc repeat condition |
| Owner/date | Ai mở loop tiếp theo, khi nào? | owner + date + artifact |

```text
Weekly closure certificate
- Weekly state:
- Primary call:
- Blocked conclusions:
- Plan field updated:
- Next question:
- Owner/date:
```

Certificate này giúp team tránh cảm giác "tuần này bận nhiều nên chắc đã tiến bộ". Tiến bộ thật là khi loop có call, plan update và câu hỏi kế tiếp.

## Weekly operating checklist

| Check | Pass condition | Fail response |
| --- | --- | --- |
| Learning question locked | 1 hypothesis, 1 allowed decision | Cancel extra cells |
| Creative matrix named | filename, promise, motivation, proof | Rename before export |
| Build/event gate | core events verified in debug/logcat/dashboard where relevant | Do not launch product read |
| Store freeze | listing version named | Mark caveat or rerun |
| Privacy/data safety reviewed | SDK/data behavior changes checked | Add compliance owner |
| Launch setup documented | spend, platform, geo, window, cells | No scale call allowed |
| Readout bucketed | creative/store/product/economy/tracking | Meeting cannot close |
| Decision owner assigned | owner/date/artifact | No "monitor more" without metric |
| Learning log written | assumption changed + next question | Next sprint not allowed to start |

Quality chain:

`owner -> deadline -> artifact -> readiness gate -> campaign -> readout -> decision -> learning log`

Decision debt checklist:

| Debt signal | Meaning | Required fix |
| --- | --- | --- |
| "Monitor thêm" không có trigger | Meeting né quyết định | Ghi metric, date, owner và action trigger |
| Report có nhiều chart nhưng không có primary call | Readout chưa chuyển thành execution | Chọn 1 call: iterate, hold, fix, rerun, stop |
| Owner mơ hồ như "team" | Action sẽ trôi | Gán một người và artifact |
| Tuần sau mở test mới khi learning log chưa viết | Learning không tích lũy | Block next launch cho tới khi log xong |
| Gate fail nhưng vẫn launch | Cadence ưu tiên activity hơn evidence | Đổi tuần thành fix-readiness week |

## Real usecases đã đối chiếu nguồn

Các nguồn này được dùng như operating constraints cho cadence, không phải benchmark.

| Source | Observable facts | Cadence interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs tập trung vào privacy/consent strategies cho Google Mobile Ads Unity Plugin. | Nếu tuần này thay ad SDK, consent flow hoặc monetization behavior, cadence cần readiness slot trước launch. | Không biến privacy review thành lý do hoãn vô thời hạn; cần owner và deadline. |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en) | Google Play yêu cầu developers có app trên closed, open hoặc production testing tracks hoàn thành Data safety form. | Store/compliance không nằm ngoài UA. Nếu SDK/data behavior đổi, weekly cadence phải check disclosure risk. | Không suy ra Data safety form tự đảm bảo compliance đúng; developer vẫn phải hiểu app/SDK behavior. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase events giúp hiểu user actions/system events/errors; Unity app có thể log events và dùng debug/logcat để verify nhanh. | Build/event validation nên có slot riêng trước launch, nhất là khi D1/tutorial/economy là success criteria. | Không suy ra dashboard có số là event taxonomy đúng; phải verify event names/parameters. |
| [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en) | Google Ads mô tả creative assets như ingredients cho App campaigns và có best practices cho text, image, video, HTML5. | Creative cadence nên có asset packet rõ format/naming/proof, không gửi file rời rạc sát giờ launch. | Không suy ra nhiều asset hơn luôn tốt với micro-budget; capacity và readable test vẫn giới hạn scope. |

### Weekly board readout

| Board area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Learning question | Có một hypothesis duy nhất không? | Nếu có nhiều câu hỏi, report sẽ khó gọi action | Không cần giải quyết mọi risk trong một tuần |
| Readiness gate | Creative/build/store/events/privacy có pass/caveat không? | Gate bảo vệ data quality | Gate không phải bureaucracy nếu có owner/deadline |
| Report date | D0/D1/revenue window có đủ chưa? | Timing quyết định metric nào được phép đọc | Đừng gọi D1 khi D1 chưa đủ window |
| Decision call | Có scale/iterate/hold/fix rõ không? | Meeting phải tạo next action | "Discussed" không phải decision |
| Learning log | Assumption changed có được ghi không? | Cadence tích lũy learning qua tuần | Calendar đẹp không chứng minh rhythm tốt |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Cadence chỉ ghi ngày launch. | **Correction:** Include learning question, readiness, launch, readout, decision, log. |
| **Mistake:** Mọi tuần đều cố tăng số creatives. | **Correction:** Scale cells theo capacity và measurement clarity. |
| **Mistake:** Review D1 quá sớm. | **Correction:** Split D0 acquisition readout và D1 retention decision. |
| **Mistake:** Store đổi giữa creative test. | **Correction:** Freeze store hoặc log caveat và rerun. |
| **Mistake:** Không có owner cho build/event QA. | **Correction:** Treat tracking as launch readiness, not cleanup task. |
| **Mistake:** Meeting kết thúc bằng "monitor thêm". | **Correction:** Ghi monitor metric, owner, deadline, trigger action. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Operating cadence` | Nhịp vận hành lặp lại để đóng learning loop |
| `Readiness gate` | Điều kiện pass trước khi launch/read data |
| `Decision meeting` | Buổi chốt scale/iterate/hold/fix từ readout |
| `Readout` | Bản đọc số có diagnosis và action |
| `Soft launch` | Launch nhỏ có kiểm soát để học |
| `Creative matrix` | Bảng quản lý hook/promise/proof/variant |
| `Owner` | Người chịu trách nhiệm artifact/action |
| `Scope guardrail` | Giới hạn scope để bảo vệ capacity và data quality |

## Lab output example

```md
Weekly UA cadence - Week 5

Learning question:
- Does calm/satisfying hook create better player fit than challenge hook?

Allowed decision:
- Iterate relax angle, fix challenge proof, or hold if tracking/store caveat appears.

Monday AM:
- UA/Product owner: lock hypothesis and metric bucket.
- Artifact: W5-decision-brief.md

Monday PM:
- Creative owner: export 2 relax variants + 1 challenge-proof variant.
- Artifact: creative-matrix-w5.csv

Tuesday:
- Tech owner: verify install, tutorial_start, level_3_start, ad_impression.
- Artifact: event-qa-w5.md

Wednesday:
- Store owner: freeze screenshot set v3.
- Artifact: store-proof-v3.md

Thu-Fri:
- UA owner: launch $120 Android test and monitor delivery.
- Artifact: campaign-setup-w5.md

Friday:
- UA owner: D0 acquisition/store readout only.

Next Monday:
- Team: D1 decision meeting.
- Output: one call + learning log + next question.

Weekly decision call:
- Primary call: reduce-scope launch, 2 cells only.
- Evidence: creative capacity is 2 cells, event QA scheduled, store v3 can freeze.
- Blocked conclusions: no D7 retention or economy verdict this week.
- Owner: UA owner for campaign, tech owner for event QA.
- Due date: Friday D0 readout, Monday D1 call.
- Plan update: budget cap, creative cells, tracking gate.

Weekly closure certificate:
- Weekly state:
- Primary call:
- Blocked conclusions:
- Plan field updated:
- Next question:
- Owner/date:
```

## Practical Lab

1. Viết một learning question cho tuần tới.
2. Chọn allowed decision: scale, iterate, hold, fix readiness, hoặc repeat.
3. Ghi capacity thật của creative/build/store/report.
4. Giảm scope đến khi từng workstream có owner/deadline/artifact.
5. Đặt readiness gate trước launch.
6. Tách D0 readout và D1/retention readout nếu window khác nhau.
7. Tạo one-call meeting template.
8. Bắt buộc learning log sau meeting.
9. Viết weekly capacity contract trước khi commit launch.
10. Viết scope cut rule: gate nào fail thì cắt scope nào, hoặc hold launch.
11. Viết decision debt checklist để meeting không kết thúc bằng "monitor thêm" mơ hồ.
12. Viết Weekly closure certificate.

Quality check: nếu một task không có owner/deadline/artifact, nó không được tính là part of cadence.

## Final UA Plan Update

Cập nhật field **nextAction**:

```md
Weekly operating cadence:
- This week''s learning question:
- Weekly capacity contract:
- Allowed decision:
- Decision meeting date:
- One-call template:
- Learning log owner:
- Next question selected by:
- Weekly closure certificate:
```

Cập nhật field **budget**:

```md
Weekly scope guardrail:
- Max spend this week:
- Max creative cells:
- Scope cut rule:
- Hold rule if readiness gate fails:
- Retention readout date:
```

Cập nhật field **creativeMatrix**:

```md
Creative cadence:
- Variant count:
- Naming rule:
- Promise labels:
- Proof requirement:
- Export deadline:
```

Cập nhật field **tracking**:

```md
Readiness gate:
- Required events:
- Debug verification owner:
- Store/data safety review needed? yes/no
- Known caveats:
- Decision debt checklist:
```

## Checklist Focus

- [ ] Cadence có một learning question rõ.
- [ ] Weekly capacity contract giới hạn scope theo năng lực thật.
- [ ] Mỗi workstream có owner/deadline/artifact.
- [ ] Creative scope fit capacity thật.
- [ ] Build/event readiness gate trước launch.
- [ ] Store proof được freeze hoặc caveat rõ.
- [ ] Scope cut rule nói rõ gate fail thì cắt gì.
- [ ] Report date tách D0/D1 nếu cần.
- [ ] Decision meeting có one primary call.
- [ ] Decision meeting có owner, due date, blocked conclusions và plan update.
- [ ] Learning log bắt buộc sau decision.
- [ ] Weekly closure certificate xác nhận plan update và next question.
- [ ] Final UA Plan cập nhật nextAction, budget, creativeMatrix, tracking.

## Curated References

- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en)
', now()),
  ('lessons/day-29.md', 'markdown', null, '---
day: 29
title: "Build the one-page UA launch plan"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [UA, Soft launch, Event taxonomy]
artifact: "One-page launch plan"
---

## Mục tiêu / Goal

Sau bài này, bạn hoàn thiện **One-page UA launch plan** cho micro soft-launch đầu tiên: hypothesis, audience/motivation, promise chain, tracking, creative matrix, campaign structure, budget, decision rules, risk caveats và next action.

Quyết định chính: field nào không giúp team ra quyết định launch, đọc số, hoặc sửa next sprint thì **cắt, gộp, hoặc chuyển sang task ticket**.

Artifact này tổng hợp toàn bộ Final UA Plan thành một trang vận hành mà team có thể mở trong tuần launch và biết: chạy gì, vì sao chạy, đọc số nào, khi nào dừng, ai làm bước tiếp theo.

## Why this matters

Capstone không phải deck chiến lược. Nó là cockpit cho test `$100-500`. Khi campaign đang tiêu tiền, team không cần 12 trang mô tả thị trường. Team cần một trang trả lời nhanh:

- Promise nào đang được kiểm tra?
- Store có chứng minh promise đó không?
- First session có deliver promise trong 3 phút đầu không?
- Event nào phải pass để report đáng tin?
- Budget/cell có đủ đọc không?
- Nếu số ra pattern A/B/C thì team làm gì?

Plan dài dễ che giấu lỗ hổng. One-page plan ép mọi field nối vào decision chain:

`hypothesis -> audience motivation -> ad promise -> store proof -> first-session proof -> event proof -> campaign setup -> metric readout -> decision rule -> next action`

Nếu một field không cải thiện decision nào, nó không thuộc one-page plan.

## Core model: one page = decision surface

Một one-page launch plan tốt không phải bản tóm tắt ngắn. Nó là **decision surface**: mỗi block phải giúp team chọn scale, iterate, hold, fix, hoặc repeat.

| Field | Job trong launch | Câu hỏi phải trả lời | Nếu yếu thì |
| --- | --- | --- | --- |
| Hypothesis | Định nghĩa điều cần học | Test này chứng minh/loại bỏ belief nào? | Campaign không có mục tiêu |
| Audience/motivation | Định nghĩa player fit | Người chơi muốn payoff gì? | Hook và store khó diagnose |
| Promise chain | Nối ad-store-game | Ad promise có proof ở store và first session không? | `CTR`, `CVR`, D1 rời rạc |
| Tracking | Bảo vệ readout | Event nào chứng minh proof? | Report không đáng tin |
| Creative matrix | Giữ asset có logic | Variant khác nhau ở promise nào? | Creative production thành noise |
| Campaign/budget | Phân bổ signal | Spend/cell/window có đọc được không? | Sample quá mỏng |
| Decision rules | Chốt hành động trước khi có data | Pattern nào dẫn đến scale/iterate/hold/fix? | Meeting tranh luận cảm tính |
| Risk caveat | Gọi điểm yếu nhất | Assumption nào có thể làm test vô nghĩa? | Team overclaim |
| Next action | Biến plan thành work | Ai làm gì, khi nào, đo bằng gì? | Plan không chuyển thành sprint |

Rule: mỗi field phải trả lời được "decision nào sẽ tốt hơn nhờ field này?"

## One-page launch plan mẫu

| Section | Example content | Decision supported |
| --- | --- | --- |
| Hypothesis | Satisfying clear hook can acquire better-fit puzzle players than challenge hook | What to test |
| Audience/motivation | Players seeking quick visual payoff and low-friction puzzle progress | Which promise to write |
| Ad promise | "Clear the chaos in one combo" | Creative direction |
| Store proof | Screenshot 1 shows before/after board; short description mirrors the promise | Store readiness |
| First-session proof | Level 2 clear moment appears within 3 minutes | Product proof |
| Tracking | `first_open`, `tutorial_complete`, `level_3_start`, `ad_impression`, `purchase_attempt` | Report validity |
| Creative matrix | 3 hook families x 2 variants; each mapped to motivation/proof | Asset scope |
| Campaign | Android, 1 geo cluster, `$240` cap, 4-day read | Signal allocation |
| Rules | Scale cautiously if chain aligned; fix store if `CTR` high and `CVR` weak; hold if event missing | Operating call |
| Top risk | D1 may be unreadable if `level_3_start` event fails | Readiness priority |
| Next action | Tech validates required events by Friday 17:00 | Immediate work |

Điểm quan trọng: plan không cố "nói hay". Plan cố làm mọi decision trở nên khó hiểu sai.

### One-page acceptance gate

Trước khi gọi plan là xong, kiểm tra 5 gate này. Chỉ cần một gate fail, page chưa launch-ready.

| Gate | Pass khi | Nếu fail |
| --- | --- | --- |
| Decision compression | Người đọc biết test này sẽ dẫn tới scale, iterate, hold/fix hay kill hypothesis | Cắt field mô tả, viết lại thành pattern -> action |
| Proof chain | Ad promise, store proof và first-session proof nói cùng một lời hứa | Sửa store/FTUE hoặc hạ promise trước launch |
| Measurement right | Required events có QA status và caveat | Hold launch hoặc đổi success criteria sang metric đọc được |
| Budget sanity | Spend/cell/window đủ đọc directional signal | Giảm cells hoặc tăng window, không thêm variants |
| Ownership | Next action có owner, date, artifact | Plan chưa chuyển thành sprint |

Acceptance gate không đánh giá plan đẹp hay không. Nó hỏi: **nếu mở page này trong ngày launch, team có biết hành động đúng kế tiếp không?**

Launch/no-launch contract:

```md
Launch call:
[launch / hold / fix-readiness / reduce scope]

Launch only if:
- Tracking gate:
- Store proof gate:
- Creative matrix gate:
- Budget/cell gate:
- Owner/date gate:

No-launch if:
- Required event missing
- Store proof contradicts top hook
- Budget split makes cell unreadable
- Decision rule is still "scale if good"
- No owner for next action
```

## Operating diagram: one-page plan flow

```text
[VISUAL PLACEHOLDER: Third-party image request - Operating diagram: one-page plan flow]
Type: hero operating diagram.
Lesson section: Operating diagram: one-page plan flow.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


```text
[Hypothesis: belief to test]
        |
        v
[Motivation: player job]
        |
        v
[Promise chain: ad -> store -> FTUE]
        |
        v
[Tracking: events + QA]
        |
        v
[Campaign: cells + spend]
        |
        v
[Decision rule: scale / iterate / hold / fix]
        |
        v
[Next action: owner + date]
```

**Inspect:** mỗi block có mũi tên xuống decision kế tiếp. Tracking nằm trước campaign vì nếu event fail, campaign không thể tạo product learning hợp lệ.

**Conclude:** one-page plan là operating system nhỏ, không phải summary. Nó buộc hypothesis, proof, tracking và budget cùng nói một ngôn ngữ.

**Do not infer:** one page không có nghĩa là nông. Nó có nghĩa là chỉ decision-critical content được sống sót.

## Readiness scorecard

```text
[VISUAL PLACEHOLDER: Third-party image request - One-page launch readiness board]
Type: readiness scorecard / risk heatmap.
Lesson section: Readiness scorecard.
Visual brief: turn the readiness table into a compact board that highlights the lowest-scoring launch risk, not an average score.
Teaching job: help the learner see which field blocks launch even when the rest of the page looks polished.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

Chấm nhanh trước khi launch. Điểm thấp nhất là launch risk chính.

| Area | 1 = launch risk cao | 3 = directional | 5 = ready | Must fix nếu dưới 3 |
| --- | --- | --- | --- | --- |
| Hypothesis | vague learning | one belief but broad | falsifiable belief | Rewrite as testable sentence |
| Audience/motivation | demographic only | motivation hinted | behavior + payoff clear | Replace demographic with player job |
| Promise chain | ad/store/game mismatch | partial proof | ad-store-first session aligned | Fix store screenshot or FTUE proof |
| Tracking | required events unknown | events listed, QA pending | events verified | Validate before spend |
| Creative matrix | random variants | variants named | each cell maps to promise/proof | Cut noisy variants |
| Budget/cells | over-split spend | readable but tight | spend/cell/window sane | Reduce cells |
| Decision rules | "scale if good" | partial rules | scale/iterate/hold/fix rules | Write pattern-to-action rules |
| Next action | no owner/date | owner OR date | owner + date + artifact | Assign before launch |

**Inspect:** không lấy điểm trung bình để tự trấn an. Hãy nhìn điểm thấp nhất.

**Conclude:** một launch plan có tracking 2/5 hoặc budget/cells 2/5 chưa ready dù creative rất hay.

**Do not infer:** scorecard không dự đoán campaign thắng. Nó chỉ kiểm tra test có tạo learning đọc được không.

### Plan reducer: cut, merge, ticket

Nếu page dài hơn một trang, đừng chỉ giảm font. Hãy xử lý từng dòng bằng 3 lựa chọn:

| Action | Dùng khi | Ví dụ |
| --- | --- | --- |
| Cut | Dòng không thay đổi launch/readout/next action | "Market mobile puzzle rất cạnh tranh" nếu không dẫn tới risk/action |
| Merge | Hai dòng trả lời cùng một quyết định | Audience motivation và ad promise có thể gộp nếu quá lặp |
| Ticket | Chi tiết cần làm nhưng không cần nằm trên page | "Export 6 size variants" chuyển sang creative production ticket |

Rule: one-page plan chỉ giữ **decision-critical facts**. Task detail sống trong ticket. Research detail sống trong appendix. Dashboard detail sống trong readout.

## Hướng dẫn đọc số

One-page plan giúp bạn đọc số theo gap, không panic theo từng metric.

| Plan gap | Metric consequence | Diagnosis | Fix before/after launch |
| --- | --- | --- | --- |
| Audience vague | `CTR`/`CVR` khó giải thích | Không biết click đến từ motivation nào | Rewrite motivation and hook labels |
| Store proof missing | `CTR` ổn, `CVR` yếu | Ad promise không được listing chứng minh | Fix screenshot/copy before rerun |
| First-session proof weak | `CVR` ổn, D1 yếu | User vào game nhưng promise không được deliver | Fix level 1-3 proof |
| Tracking weak | D1/ROAS invalid | Measurement failure, not product conclusion | Validate events then repeat |
| Budget over-split | Noisy winner, spend bias | Too many cells for budget | Reduce cells and rerun |
| Rules vague | Meeting tranh luận lâu | No pre-committed call | Write pattern-to-action rules |
| Risk caveat missing | Team overclaims | Confidence language absent | Add caveat to decision |
| Next action vague | Plan stalls | No owner/date/artifact | Assign one smallest action |

Decision rule: không launch từ plan thiếu **tracking proof**, **budget/cell sanity**, hoặc **next action**.

### Launch-call ledger

Sau khi đọc số, team chỉ nên chọn một trong bốn call. Nếu plan không phân biệt được bốn call này, nó vẫn còn quá mơ hồ.

| Call | Khi nào dùng | Bằng chứng cần có | Hành động tiếp theo |
| --- | --- | --- | --- |
| Scale cautiously | Promise chain sạch, events pass, budget delivery không lệch, signal sau click không phản bội ad | `CTR`/store `CVR`/first-session/D1 direction cùng chiều | Tăng cap nhỏ, giữ cell structure, không thêm biến mới |
| Iterate creative/store | Attention có nhưng store hoặc first-session proof yếu | `CTR` ổn, `CVR` hoặc tutorial/level proof yếu | Sửa screenshot, opening frame, hoặc FTUE proof rồi rerun |
| Hold and repair measurement | Event thiếu, event duplicate, attribution/campaign delivery không đọc được | QA fail hoặc spend bias quá mạnh | Dừng decision, sửa tracking/setup trước |
| Kill hypothesis for now | Chain đã sạch nhưng motivation/promise không tạo signal đủ tốt | Nhiều tầng đều yếu sau khi measurement pass | Ghi learning, chuyển motivation sang backlog, chọn hypothesis khác |

Quan trọng: **Hold** không phải thất bại. Với budget nhỏ, hold đúng lúc bảo vệ team khỏi việc kết luận sai từ data bẩn.

## Worked example: cut draft thành one page

| Draft text | Problem | One-page rewrite |
| --- | --- | --- |
| "Target casual puzzle players globally" | Vague audience | "Players seeking quick satisfying clear moments in short sessions" |
| "Make fun ads showing gameplay" | No promise/proof | "Hook: clear chaos in one combo; proof: before/after board in first 3s" |
| "Run several creatives" | Not actionable | "3 hook families x 2 variants, `$40/cell` cap" |
| "Measure success" | No readout | "`CTR`, store `CVR`, `tutorial_complete`, `level_3_start`, D1 direction" |
| "Improve onboarding if needed" | No owner/date | "Product owner reviews level 1-3 proof by Wednesday" |
| "Scale if results are good" | No condition | "Scale +20% cap only if `CTR`/`CVR`/D1 align and events pass" |
| "Risk: competition is high" | Generic risk | "Top risk: D1 cannot be read if `level_3_start` event fails" |

Verdict: concise is not shallow. It removes details that do not affect launch decisions and makes weak fields visible.

Tradeoff: implementation details still matter, but they belong in task tickets. The one-page plan keeps launch decisions readable under pressure.

### Second-pass one-page read

Đọc lại page theo vai trò trong team:

| Role | Cần nhìn thấy gì trong 60 giây | Nếu thiếu thì hỏi câu gì? |
| --- | --- | --- |
| Founder/producer | Hypothesis, budget cap, decision rule, next action | "Test này giúp mình ra quyết định kinh doanh nào?" |
| Product/design | First-session proof và risk caveat | "Nếu D1 yếu, mình sửa level/onboarding nào trước?" |
| UA/creative | Motivation, ad promise, creative matrix, store proof | "Cell nào đang test promise nào, khác nhau ở biến gì?" |
| Engineering/analytics | Required events, QA status, tracking caveat | "Event nào đang khóa report hoặc launch call?" |

Nếu một role phải đọc lại ba lần mới biết phần mình cần làm, one-page plan chưa đủ sắc. Sửa bằng cách đổi văn mô tả thành owner/action/evidence, không thêm trang mới.

One-page review memo:

```md
One-page review memo

Launch call:
[launch / reduce scope / hold for readiness]

Lowest readiness score:
[area + score + why it blocks learning]

Decision this page supports:
[scale / iterate / hold/fix / kill hypothesis]

Fields cut:
[what was removed because it did not support decision]

Tickets created:
[details moved out of the one-page plan]

Owner/date:
[who updates page before launch]
```

Memo này làm rõ plan đã được biên tập vì decision, không phải vì thiếu nội dung. Một capstone tốt có thể có nhiều ticket phía sau, nhưng page chính phải đứng vững một mình.

### Release handoff pack

One-page plan chỉ thật sự release-ready khi nó có handoff pack: các artifact chứng minh readiness và các ticket triển khai nằm ngoài trang chính. Handoff pack giúp page vẫn gọn nhưng team vẫn biết bằng chứng nằm ở đâu.

| Handoff item | Cần ghi gì | Vì sao |
| --- | --- | --- |
| Evidence links | event QA, store proof, creative matrix, budget sheet, risk note | chứng minh page không chỉ là lời hứa |
| Open blockers | blocker còn lại + owner/date | biết vì sao hold/reduce scope |
| Accepted caveats | caveat được phép launch cùng | tránh overclaim trong readout |
| Tickets created | task chi tiết đã tách khỏi page | giữ one-page không phình |
| First readout kit | template, owner, date, metric order | report đầu tiên không bị orphan |
| Change control | ai được sửa page sau launch | tránh đổi rule giữa test |

```text
Release handoff pack
- Evidence links:
- Open blockers:
- Accepted caveats:
- Tickets created:
- First readout kit:
- Change control:
- Final owner/date:
```

Handoff pack tốt cho phép một người không tham gia viết plan vẫn mở page, xem bằng chứng, biết ticket nào đang chạy, và biết report đầu tiên sẽ đọc như thế nào.

## Plan quality checklist

| Check | Pass condition | Fail symptom |
| --- | --- | --- |
| Field is decision-linked | Each field supports a launch/readout/action call | Strategy prose with no action |
| Promise chain complete | Ad/store/first session say the same promise | `CTR`, `CVR`, D1 cannot be tied together |
| Tracking ready | Required events listed and QA status known | Product learning invalid |
| Budget sane | Spend/cell/window fit micro-budget | Winner likely noise |
| Rules pre-committed | Scale/iterate/hold/fix conditions present | Meeting debates from taste |
| Risk named | Weakest assumption visible | Team overclaims |
| Owner/date present | Next action assigned | Plan sits untouched |

Quality chain:

`plan field -> decision it supports -> evidence required -> owner/date`

## Real usecases đã đối chiếu nguồn

Các nguồn này hỗ trợ các constraint của launch plan: attribution limits, event readiness, privacy/store readiness và creative asset discipline.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit là framework đo campaign success trong khi giúp duy trì user privacy. | Launch plan nên ghi platform/attribution caveat nếu iOS được đưa vào test hoặc roadmap. | Không cần implement iOS attribution nếu tuần này Android-first và chưa chạy iOS traffic. |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting là privacy-preserving và dựa trên source/trigger/reporting logic. | Tracking field là launch decision field, không phải phụ lục kỹ thuật. Setup/reporting caveat ảnh hưởng confidence. | Không đọc early attribution như full user journey chính xác tuyệt đối. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase Unity docs hướng dẫn log events để hiểu user actions, system events và errors; có suggested/custom events. | One-page plan cần liệt kê events chứng minh first-session proof và economy proof. | Không suy ra dashboard có số là taxonomy đúng; QA event names/parameters vẫn cần thiết. |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs đặt privacy/consent strategy trong implementation context của Google Mobile Ads Unity Plugin. | Nếu plan dùng ads monetization signal, SDK/privacy readiness phải hiện trên launch page. | Không biến SDK/privacy thành block mơ hồ; cần owner, deadline, known caveat. |
| [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en) | Google Ads xem creative assets như inputs/ingredients của App campaigns và có best practices theo asset type. | Creative matrix nên ghi asset type, promise, proof và naming rule để campaign setup không bị lẫn. | Không suy ra càng nhiều assets càng tốt với budget nhỏ; readable cells vẫn quan trọng hơn volume. |

### One-page preview readout

| Page area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Hypothesis | Có falsifiable belief không? | Nếu mơ hồ, campaign không biết học gì | Không cần biến hypothesis thành slogan |
| Promise chain | Ad/store/first session có cùng proof không? | Chain aligned giúp đọc `CTR`/`CVR`/D1 | `CTR` cao không chứng minh product fit |
| Tracking | Required events + QA status có hiện không? | Tracking là điều kiện đọc số | Event listed chưa nghĩa là event pass |
| Budget/cells | Spend có bị chia quá mỏng không? | Budget protects signal quality | Small budget không cấm test, chỉ cấm over-split |
| Decision rules | Pattern nào dẫn tới action nào? | Meeting sẽ ngắn và ít cảm tính hơn | Rule không loại bỏ judgement, nó giới hạn overreaction |
| Next action | Có owner/date/artifact không? | Plan đã sẵn sàng bước vào sprint | Page polished không chứng minh launch-ready |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Plan biến thành strategy essay. | **Correction:** Keep only fields that affect launch/readout/next action. |
| **Mistake:** Audience chỉ là demographic. | **Correction:** Viết behavior/motivation/job-to-be-done. |
| **Mistake:** Promise chain thiếu store hoặc FTUE proof. | **Correction:** Map ad promise to screenshot and first 3 minutes. |
| **Mistake:** Tracking field ghi "Firebase installed". | **Correction:** List required events, parameters if needed, and QA status. |
| **Mistake:** Budget không tied to cells. | **Correction:** Add spend/cell, total cap, window, and hold rule. |
| **Mistake:** Rules nói "scale if good". | **Correction:** Write metric pattern and caveat for scale/iterate/hold/fix. |
| **Mistake:** Next action quá lớn. | **Correction:** Pick the smallest owner/date/artifact step before launch. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `UA` | User acquisition |
| `Soft launch` | Controlled market test before wider scale |
| `Event taxonomy` | Event system needed for decision quality |
| `Launch plan` | Operating page for the first test |
| `Decision rule` | Condition for scale/iterate/hold/fix |
| `Readiness scorecard` | Pre-launch risk check by field |
| `Promise chain` | Ad -> store -> first-session proof |
| `Attribution caveat` | Measurement limitation that affects confidence |

## Lab output example

```md
One-page UA launch plan - Calming Hex Puzzle

Hypothesis:
- Satisfying clear hook can acquire better-fit players than challenge hook.

Audience/motivation:
- Players wanting quick visual payoff in short sessions.

Promise chain:
- Ad: clear the chaos in one combo.
- Store: screenshot 1 shows before/after board.
- First session: level 2 clear combo within 3 minutes.

Tracking:
- Required: first_open, tutorial_complete, level_3_start, ad_impression.
- QA status: pending Android release build validation.

Creative matrix:
- 3 hook families x 2 variants.
- Naming: W5_[hookFamily]_[proof]_[variant].

Campaign:
- Android, 1 geo cluster, 4-day read.
- $240 total cap, $40/cell planning cap.

Decision rules:
- Scale cautiously if CTR/CVR/D1 align and events pass.
- Fix store if CTR is healthy but CVR is weak.
- Fix first session if CVR is healthy but D1 is weak.
- Hold/repeat if required event is missing or spend delivery is biased.

Top risk:
- D1 cannot be trusted if level_3_start event fails.

Next action:
- Tech owner validates 4 required events by Friday 17:00.

Launch/no-launch contract:
- Launch only if event QA passes, store screenshot 1 matches top hook, and no cell has less than readable planned spend.
- Hold if level_3_start is missing.
- Reduce scope if creative export misses more than 2 cells.

One-page review memo:
- Launch call: hold until tracking gate passes.
- Lowest readiness score: tracking 2/5.
- Tickets created: event QA ticket, store proof screenshot ticket.
- Owner/date: UA owner updates page after Friday QA.

Release handoff pack:
- Evidence links:
- Open blockers:
- Accepted caveats:
- Tickets created:
- First readout kit:
- Change control:
```

## Practical Lab

1. Fill every Final UA Plan field.
2. Cut each field to decision language.
3. Map promise chain: ad -> store -> first session.
4. List required events and QA status.
5. Check budget/cell/window sanity.
6. Write scale/iterate/hold/fix rules.
7. Name top launch risk.
8. Write the smallest next action with owner/date/artifact.
9. Run the one-page acceptance gate.
10. Apply cut/merge/ticket to every line that does not support a launch/readout/action decision.
11. Write launch/no-launch contract and one-page review memo.
12. Write Release handoff pack.

Quality check: if someone cannot act from the page in 5 minutes, shorten or sharpen it.

## Final UA Plan Update

Cập nhật toàn bộ Final UA Plan thành one-page launch plan:

```md
One-page launch plan:
- Hypothesis:
- Audience/motivation:
- Promise chain:
  - Ad promise:
  - Store proof:
  - First-session proof:
- Tracking/event QA:
- Creative matrix:
- Campaign structure:
- Budget/cell:
- Success criteria:
- Kill/hold criteria:
- Launch/no-launch contract:
- Top risk:
- Lowest readiness score:
- Next action:
- Release handoff pack:
```

Thêm readiness score:

```md
Readiness scorecard:
- Hypothesis:
- Motivation:
- Promise chain:
- Tracking:
- Creative matrix:
- Budget/cells:
- Decision rules:
- Next action:
- Lowest score and fix:
- Fields cut/merged/ticketed:
- Review memo owner/date:
- Evidence links:
- First readout kit:
- Change control:
```

## Checklist Focus

- [ ] Plan đọc được trong một trang.
- [ ] Every field affects a launch decision.
- [ ] One-page acceptance gate đã pass.
- [ ] Có launch/no-launch contract.
- [ ] Có Release handoff pack.
- [ ] Audience is motivation/behavior, not only demographic.
- [ ] Promise chain complete: ad, store, first session.
- [ ] Required events and QA status visible.
- [ ] Budget/cell/window sane for `$100-500`.
- [ ] Decision rules include scale, iterate, hold/fix.
- [ ] Lowest readiness score có fix cụ thể.
- [ ] Các chi tiết không critical đã cut, merge hoặc chuyển thành ticket.
- [ ] Evidence links và first readout kit rõ.
- [ ] Top launch risk named.
- [ ] Next action small, dated, measurable.

## Curated References

- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
- [Google Ads - Make better creative assets for App campaigns](https://support.google.com/google-ads/answer/6167158?hl=en)
', now()),
  ('lessons/day-30.md', 'markdown', null, '---
day: 30
title: "Stress-test risks and choose next action"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [Payback window, ROAS, Retention]
artifact: "Risk register and next action"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Risk register and next action** để stress-test one-page launch plan và chọn bước nhỏ nhất tiếp theo trước khi tiêu tiền thật.

Quyết định chính: next action phải **nhỏ, có ngày, có owner, đo được, và giảm top launch risk**. Nếu không giảm risk lớn nhất, nó chỉ là việc bận rộn.

Artifact này chốt các field **nextAction**, **killCriteria**, **successCriteria**, **tracking** và risk notes trong Final UA Plan.

## Why this matters

Một plan nhìn đẹp vẫn có thể fail vì một assumption yếu: promise không rõ, store proof thiếu, first session không giữ lời, tracking chưa validate, budget chia quá mỏng, monetization không có payback logic, hoặc team không có cadence để đọc report.

Ngày cuối không phải để thêm ý tưởng. Nó là lúc tấn công plan:

- Nếu launch tuần này, điều gì dễ làm data vô nghĩa nhất?
- Nếu chỉ được làm một việc trước launch, việc nào giảm risk lớn nhất?
- Nếu phải hold launch, hold vì blocker nào, không phải vì cảm giác sợ?

Với budget `$100-500`, paid test đầu tiên không cần hoàn hảo. Nhưng nó phải **đọc được**. Risk register giúp team phân biệt blocker thật với worry list.

## Core model: risk -> evidence -> mitigation -> next action

Mọi risk trong register phải có evidence và action. Nếu không, nó chỉ là nỗi lo.

| Risk type | Câu hỏi stress-test | Evidence nên tìm | Mitigation thường gặp |
| --- | --- | --- | --- |
| Promise risk | Người chơi có hiểu hook không? | creative script, 3s opening, feedback | simplify hook, test static clarity |
| Store risk | Store có xác nhận ad promise không? | screenshot 1, short description, icon/copy | replace screenshot/copy |
| First-session risk | Game có giữ lời trong 3 phút đầu không? | level 1-3 flow, tutorial completion | fix FTUE proof |
| Tracking risk | Events có đọc được không? | debug output, event QA, dashboard sanity | validate events before spend |
| Budget risk | Matrix có quá nhiều cells không? | spend/cell, expected installs, delivery split | reduce cells |
| Economics risk | CPI/payback có plausible không? | CPI ceiling, ad/IAP assumptions, ROAS window | set ceiling and review window |
| Cadence risk | Ai đọc report và chốt call? | calendar, owner, readout template | schedule decision meeting |
| Compliance risk | SDK/data/store disclosure có blocker không? | SDK list, consent/data safety status | assign privacy/store owner |

Rule: **top risk = high severity x high likelihood x makes data unreadable**.

## Risk register mẫu

| Risk | Evidence | Severity | Likelihood | Mitigation | Next action |
| --- | --- | ---: | ---: | --- | --- |
| Tracking missing D1 proof | `tutorial_complete` and `level_3_start` not QA''d | High | Medium | QA events before spend | Tech validates 5 events by Fri 17:00 |
| Store proof weak | screenshot 1 shows menu, not clear/combo promise | High | High | replace screenshot 1 | Store owner updates by Wed |
| Budget over-split | 9 cells, `$200` cap | Medium | High | reduce to 4-6 cells | UA revises matrix today |
| ROAS window unclear | ad revenue delayed, no D3/D7 caveat | Medium | Medium | set review window | UA writes D3/D7 caveat |
| Cadence missing | no decision meeting scheduled | High | Medium | schedule readout | Team books Monday decision meeting |

Điểm quan trọng: register kết thúc bằng next action, không kết thúc bằng danh sách sợ hãi.

Final launch decision board:

| Launch call | Use when | Required evidence | Next action style |
| --- | --- | --- | --- |
| Launch | No high/high risk makes the report unreadable | Tracking QA pass, store proof acceptable, budget/cell readable, owner/date set | Start smallest paid test and schedule first readout |
| Launch with caveat | Risk exists but does not invalidate the main learning question | Caveat written beside metric interpretation and owner assigned | Launch reduced scope with explicit non-claims |
| Hold | A high/high blocker would make the first report useless | Missing event QA, broken store proof, too many cells, no decision owner | Fix blocker first, then relaunch decision review |
| Reduce scope | Budget is too thin for the planned matrix | Spend/cell or expected installs too low for directional read | Cut cells, keep strongest hooks, preserve readable chain |
| Rewrite plan | Core promise or success/kill rule is unclear | Team cannot state what win/weak/kill means | Rewrite one-page plan before any traffic |

Decision rule: if two launch calls seem possible, choose the call that protects readability. A smaller readable test beats a bigger test that creates confident-looking noise.

## Risk heatmap: chọn blocker thật

```text
[VISUAL PLACEHOLDER: Third-party image request - Risk heatmap: chọn blocker thật]
Type: hero operating diagram.
Lesson section: Risk heatmap: chọn blocker thật.
Visual brief: turn the framework/table in this section into a clean, readable learning visual.
Teaching job: help the learner inspect the decision logic faster than prose alone.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```


| Likelihood \ Severity | Low severity | Medium severity | High severity |
| --- | --- | --- | --- |
| Low likelihood | Watch | Log caveat | Monitor with trigger |
| Medium likelihood | Accept | Mitigate this sprint | Candidate blocker |
| High likelihood | Contain | Fix before scale | Fix before launch |

**Inspect:** ô "High severity + High likelihood" không được xử lý như task backlog. Nó là blocker hoặc launch caveat cần owner.

**Conclude:** next action nên đến từ ô risk cao nhất làm report mất đọc được, thường là tracking, store proof, budget split, hoặc first-session proof.

**Do not infer:** mọi risk đều phải xóa trước khi học. Một số risk có thể accepted caveat nếu không làm data vô nghĩa.

## Next-action filter

```text
[VISUAL PLACEHOLDER: Third-party image request - Next-action decision filter]
Type: decision filter / action funnel.
Lesson section: Next-action filter.
Visual brief: turn the next-action filter into a funnel where candidate actions must pass small, dated, owner, measurable, and reduces-top-risk gates before becoming the final next action.
Teaching job: help the learner choose one executable action instead of ending the course with a vague backlog.
Required style: premium SaaS learning infographic, light background, clear labels, no decorative game art.
Must include: Inspect / Conclude / Do not infer cues from the surrounding section.
Do not generate final image inside this repo; this placeholder is for a third-party visual pass.
```

Chạy mọi candidate action qua filter này:

| Candidate action | Small | Dated | Owner | Measurable | Reduces top risk | Verdict |
| --- | --- | --- | --- | --- | --- | --- |
| "Improve tracking" | No | No | No | No | Unclear | Rewrite |
| "Validate 5 required events on Android release build by Friday 17:00" | Yes | Yes | Yes | Yes | Yes | Good |
| "Make more creatives" | Maybe | No | Maybe | Unclear | No if tracking is top risk | Not first |
| "Launch `$300` test Monday" | No | Yes | Yes | Yes | No if store/tracking blocker exists | Hold |
| "Replace screenshot 1 with before/after clear proof by Wednesday" | Yes | Yes | Yes | Yes | Yes if store risk top | Good |

**Inspect:** "small" không có nghĩa là dễ. Nó nghĩa là có thể hoàn tất và verify.

**Conclude:** next action tốt là một executable sentence: verb + artifact + owner + date + measurement + risk reduced.

**Do not infer:** nếu action không pass filter, ý tưởng có thể vẫn đúng, nhưng chưa đủ để là next action.

### Capstone decision ledger

Trước khi chốt khóa, hãy chuyển risk register thành decision ledger. Ledger này không hỏi "còn việc gì phải làm?", mà hỏi "việc nào quyết định launch call?".

| Item | Câu hỏi quyết định | Output bắt buộc | Nếu thiếu |
| --- | --- | --- | --- |
| Top blocker | Risk nào làm report đầu tiên vô nghĩa nhất? | 1 blocker chính, không quá 2 | Team sẽ chọn việc dễ thay vì việc quan trọng |
| Accepted caveat | Risk nào được chấp nhận nhưng phải ghi giới hạn interpretation? | Caveat + metric không được over-read | Sau launch dễ overclaim |
| Backlog risk | Risk nào có thật nhưng không chặn test nhỏ đầu tiên? | Backlog note + trigger | Risk register biến thành fear list |
| Launch condition | Điều kiện nhỏ nhất để chuyển từ hold sang launch là gì? | Observable pass condition | Hold vô hạn |
| First readout | Ngày nào đọc số, ai chốt call, đọc metric nào? | Calendar + owner + template | Report thành orphan report |

Decision ledger mẫu:

| Risk | Classification | Evidence | Decision | Owner/date |
| --- | --- | --- | --- | --- |
| `tutorial_complete` chưa QA | Blocker | event chưa thấy trên Android release build | Hold spend until QA pass | Tech, Fri 17:00 |
| ROAS D7 chưa đủ window | Accepted caveat | revenue delayed beyond first report | Do not judge ROAS before D7 | UA, first readout |
| Need more creative styles | Backlog | current matrix already has 4 readable cells | Not next action | Creative, after first report |
| Screenshot 1 weak | Repair before launch | store proof does not match top hook | Replace screenshot before spend | Store, Wed |

Rule: chỉ có blocker mới được phép chặn launch. Caveat phải đi kèm câu "không được kết luận gì". Backlog risk phải có trigger để quay lại, không được lẩn vào next action.

### Final decision sanity pass

Trước khi đóng Final UA Plan, đọc lại bằng câu "nếu ngày mai phải tiêu tiền, mình có dám đọc report không?".

| Sanity question | Nếu không trả lời được | Action |
| --- | --- | --- |
| Report đầu tiên sẽ trả lời learning question nào? | Plan vẫn là strategy essay | Rewrite launch call và successCriteria |
| Metric nào không được over-read? | Caveat chưa rõ | Thêm accepted caveat vào risk register |
| Blocker nào chặn launch thật sự? | Risk register là fear list | Chọn tối đa 1-2 blocker, còn lại backlog |
| Next action verify bằng artifact nào? | Action chưa executable | Rewrite thành owner/date/measurement |

Final memo nên ngắn nhưng sắc:

```md
Final capstone memo
- Launch call:
- Top blocker:
- Accepted caveat:
- Not next:
- First readout owner/date:
```

Nếu memo này không thể viết trong 5 dòng, plan vẫn còn lẫn giữa blocker, caveat và backlog.

### Final launch certificate

Trước khi coi Final UA Plan là sẵn sàng, hãy viết một certificate ngắn. Certificate này không phải tài liệu pháp lý; nó là cách team tự xác nhận rằng paid test đầu tiên **có thể đọc được**.

| Certificate field | Câu hỏi phải khóa | Pass condition | Nếu fail |
| --- | --- | --- | --- |
| Launch call | Launch, hold, reduce scope hay launch with caveat? | Một call duy nhất | Team chưa được tiêu traffic |
| Top blocker | Risk nào thật sự chặn report? | Tối đa 1-2 blocker có evidence | Risk register vẫn là fear list |
| Accepted caveats | Risk nào được chấp nhận nhưng giới hạn interpretation? | Có câu "không được kết luận gì" | Report dễ overclaim |
| Evidence pack | Artifact nào chứng minh readiness? | Link/tên artifact: event QA, store proof, matrix, budget/cell | Next action chưa verify được |
| First readout contract | Ai đọc số, khi nào, theo template nào? | Owner/date/template rõ | Report sẽ bị orphan |
| Not-next list | Việc hấp dẫn nào cố ý không làm? | Có ít nhất 1-3 item bị hoãn | Team dễ quay lại busywork |

```text
Final launch certificate
- Launch call:
- Top blocker:
- Accepted caveats:
- Evidence pack:
- First readout owner/date:
- Not-next list:
- Condition to change call:
```

Một certificate tốt có thể nói "hold" mà vẫn là kết quả mạnh. Nếu hold dựa trên blocker rõ, owner/date rõ và condition to launch rõ, team đã tiến gần launch hơn nhiều so với việc launch vội rồi không đọc được report.

## Hướng dẫn đọc số

Risk register giúp bạn đọc metric như warning system.

| Risk signal | Cách đọc | Launch call | Next action |
| --- | --- | --- | --- |
| D1 rule exists but event missing | Decision invalid | Hold paid launch | Validate event first |
| Store `CVR` risk before launch | Store proof weak | Fix before clean creative test | Replace screenshot/copy |
| CPI ceiling unknown | Economics unclear | Launch only with caveat or estimate first | Run break-even CPI estimate |
| Budget/cell too low | Sample risk | Reduce scope | Cut variants |
| ROAS window too short | Delayed revenue risk | Do not judge ROAS early | Add D3/D7 review window |
| Creative matrix has no hold rule | Action risk | Do not launch decisionless campaign | Add hold/iterate/scale rules |
| No owner for decision meeting | Cadence risk | Launch likely creates orphan report | Schedule owner/date |
| SDK/privacy disclosure unclear | Store/compliance risk | Hold if required disclosure unknown | Assign SDK/data review |

Rule: if a signal can make the report unreadable, fix or caveat it before spend.

## Worked example: choose the next action

Team has a one-page plan for "Calming Hex Puzzle". They want to launch `$240` next week.

| Candidate | Why tempting | Why not first | Better action |
| --- | --- | --- | --- |
| Make 6 new videos | Feels productive | Tracking and screenshot proof are weaker risks | Validate events + replace screenshot |
| Launch `$240` test Monday | Wants real signal | `level_3_start` not verified; D1 decision could be invalid | Hold until event QA passes |
| Rewrite whole plan | Feels thorough | Too broad, no measurable output | Fix top 2 scorecard fields |
| Add more metrics | Feels safer | More metrics can create noise | Validate required events only |
| Increase budget to "get significance" | Sounds analytical | Budget/cell split still weak | Reduce cells before increasing spend |

Verdict: **hold launch until event QA passes**, then launch smaller matrix.

Next action:

```md
Tech owner validates first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt on Android release build by Friday 17:00.
Measurement: event debug screenshot attached to Final UA Plan.
Risk reduced: D1/product-proof readout invalid.
```

Tradeoff: holding one week feels slow, but it protects the first paid test from becoming unreadable.

Second-pass decision read:

| Candidate | Classification | Why | Final handling |
| --- | --- | --- | --- |
| Validate required events | Blocker mitigation | Nếu thiếu event, D1/product-proof readout không hợp lệ | Must do before spend |
| Replace screenshot 1 | Repair before launch | Store proof yếu có thể làm `CVR` fail dù hook đúng | Do before launch if top hook depends on visual proof |
| Make 6 new videos | Backlog / later iteration | Không giảm tracking/store blocker hiện tại | Wait until first readout or after blockers pass |
| Increase budget | False confidence risk | Thêm tiền không sửa được test unreadable | Only revisit after matrix is readable |
| Rewrite whole plan | Too broad | Không có artifact nhỏ, khó verify | Split into top 2 fields only |

Capstone conclusion nên viết như một decision memo:

```md
Launch call: HOLD.
Reason: required events are not QA''d, so D1/product-proof interpretation is invalid.
Condition to launch: first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt verified on Android release build.
Accepted caveat: ROAS is directional until D7.
Not next: more videos, more budget, full plan rewrite.
First readout: Monday 10:00 after first 48h spend, UA owner leads.
```

Đây là điểm khác giữa "kết thúc khóa" và "sẵn sàng vận hành": bạn không cần sửa mọi thứ, nhưng bạn cần biết chính xác điều gì đang chặn launch, điều gì được chấp nhận như caveat, và điều gì không được làm trước dù nghe hấp dẫn.

## Final audit checklist

| Check | Pass condition | Fail response |
| --- | --- | --- |
| Top 5 risks written | At least one risk per weak plan area | Re-read one-page scorecard |
| Evidence attached | Each risk has observable reason | Rewrite vague risk |
| Severity/likelihood scored | Rough high/medium/low enough | Score before choosing action |
| Mitigation scoped | Actionable and realistic | Split mitigation |
| Next action filtered | small/dated/owner/measurable/risk-linked | Rewrite action |
| Plan link visible | Each top risk maps to Final UA Plan field | Add field reference |
| Launch call clear | launch, hold, or launch with caveat | Do not close course yet |

Quality chain:

`risk evidence -> severity/likelihood -> mitigation -> next action -> launch/hold call -> plan update`

## Real usecases đã đối chiếu nguồn

Các nguồn dưới đây giúp xác định loại risk nào cần hiện trên capstone: store/data responsibility, privacy-era attribution, event readiness và ads SDK/privacy readiness.

| Source | Observable facts | Lesson interpretation | What not to infer |
| --- | --- | --- | --- |
| [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en) | Google Play yêu cầu developers có app trên testing/production tracks hoàn thành Data safety form và chịu trách nhiệm về app/SDK data behavior. | Data safety/store disclosure có thể là launch risk thật nếu SDK/data behavior đổi. | Đây không phải legal advice; dùng như trigger để assign owner/checklist. |
| [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit) | Apple mô tả AdAttributionKit là framework đo campaign success trong khi duy trì privacy. | Nếu iOS có trong roadmap/test, attribution caveat nên xuất hiện trong risk register. | Không suy ra iOS measurement cho Android-first test là blocker ngay. |
| [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android) | Android Attribution Reporting là privacy-preserving và source/trigger/report-based. | Attribution/report timing là confidence risk, đặc biệt khi team muốn gọi winner sớm. | Không đọc early report như exact real-time user journey. |
| [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events) | Firebase Unity supports logging events to understand user actions/system events/errors. | Event QA là mitigation cụ thể cho tracking risk. | Không suy ra event tồn tại trong code là event đã được verify trên release build. |
| [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies) | AdMob Unity docs frame privacy/consent strategies for Google Mobile Ads Unity Plugin. | Monetization SDK/privacy choices belong in launch risk if ads revenue or consent affects the test. | Không biến mọi SDK concern thành blocker; score severity/likelihood. |

### Risk register readout

| Register area | Inspect | Conclude | Do not infer |
| --- | --- | --- | --- |
| Risk name | Có gắn với plan gap cụ thể không? | Vague risk sẽ tạo vague action | "Marketing risk" không đủ cụ thể |
| Evidence | Có artifact/metric/status chứng minh không? | Evidence biến worry thành decision input | Không cần perfect data trước khi ghi risk |
| Severity/likelihood | Risk có làm report unreadable không? | High/high risk cần action hoặc hold call | Không lấy average để che blocker |
| Mitigation | Có giảm risk thật không? | Mitigation phải nhỏ hơn "fix everything" | More work không luôn là mitigation |
| Next action | Có owner/date/measurement không? | Course kết thúc bằng executable step | Risk register không phải backlog vô hạn |

## Common mistakes

| Mistake | Correction |
| --- | --- |
| **Mistake:** Next action quá lớn. | **Correction:** Rewrite into one artifact with owner/date/measurement. |
| **Mistake:** Risk không có evidence. | **Correction:** Tie risk to plan gap, event status, metric caveat, or artifact. |
| **Mistake:** Fix easy task, not top risk. | **Correction:** Prioritize severity x likelihood x data-readability impact. |
| **Mistake:** Treat risk register as fear list. | **Correction:** Convert every high risk into mitigation or accepted caveat. |
| **Mistake:** Launch despite tracking/store/budget blocker. | **Correction:** Hold or reduce scope if report would be unreadable. |
| **Mistake:** No launch call. | **Correction:** End with launch, hold, or launch-with-caveat. |

## English Terms You Should Keep

| Term | Giữ nguyên vì |
| --- | --- |
| `Risk register` | Bảng risk, evidence, mitigation, owner |
| `Launch blocker` | Risk khiến test không đọc được hoặc không thể launch đúng |
| `Payback window` | Thời gian cần để spend có cơ hội hoàn vốn |
| `ROAS` | Return on ad spend |
| `Retention` | User quay lại sau install/session |
| `Next action` | Bước nhỏ nhất có thể làm ngay |
| `Mitigation` | Việc giảm risk hoặc giới hạn damage |
| `Accepted caveat` | Risk được chấp nhận có ghi rõ giới hạn interpretation |

## Lab output example

```md
Risk register and next action - Final capstone

Top risk:
- Tracking event validation missing.

Evidence:
- tutorial_complete and level_3_start not QA''d on Android release build.

Severity / likelihood:
- Severity: High
- Likelihood: Medium

Mitigation:
- Run clean install event QA before paid traffic.

Next action:
- Tech owner validates first_open, tutorial_complete, level_3_start, ad_impression, purchase_attempt by Friday 17:00.

Measurement:
- Event debugger screenshot attached to Final UA Plan.

Launch call:
- Hold paid launch until this passes.

Accepted caveat:
- ROAS will be directional only until D7 revenue window.

Final launch certificate:
- Launch call:
- Top blocker:
- Accepted caveats:
- Evidence pack:
- First readout owner/date:
- Not-next list:
- Condition to change call:
```

## Practical Lab

1. List top 5 risks from your one-page launch plan.
2. Add evidence for each risk.
3. Score severity and likelihood: low/medium/high.
4. Mark each risk as blocker, caveat, or backlog.
5. Choose mitigation for each blocker/high risk.
6. Pick one smallest next action with owner/date/measurement.
7. Write launch call: launch, hold, or launch with caveat.
8. Write the Final launch certificate.
9. Update Final UA Plan.

Quality check: if next action cannot be verified, rewrite it.

## Final UA Plan Update

Cập nhật field **nextAction**:

```md
Next action:
- Action:
- Owner:
- Date:
- Measurement:
- Risk reduced:
- Launch call:
```

Cập nhật field **killCriteria / successCriteria / tracking**:

```md
Risk register:
- Top 5 risks:
- Evidence:
- Severity/likelihood:
- Mitigation:
- Launch blockers:
- Accepted caveats:
- Decision rule affected:
```

Ghi final launch call:

```md
Launch call:
- Status: launch / hold / launch with caveat
- Reason:
- Required condition before spend:
- First readout date:
- Evidence pack:
- Accepted caveats:
- Not-next list:
- Condition to change call:
```

## Checklist Focus

- [ ] Top risks have evidence.
- [ ] Severity/likelihood scored.
- [ ] Blockers separated from accepted caveats.
- [ ] Final launch certificate written.
- [ ] Evidence pack names the artifacts proving readiness.
- [ ] Not-next list prevents attractive busywork.
- [ ] Next action is small/datable/measurable.
- [ ] Owner assigned.
- [ ] Launch/hold/caveat call is clear.
- [ ] Final UA Plan ready for one real-world step.

## Curated References

- [Google Play Data safety](https://support.google.com/googleplay/android-developer/answer/10787469?hl=en)
- [Apple AdAttributionKit](https://developer.apple.com/documentation/adattributionkit)
- [Android Attribution Reporting for mobile](https://privacysandbox.google.com/private-advertising/attribution-reporting/android)
- [Firebase Analytics for Unity - Log events](https://firebase.google.com/docs/analytics/unity/events)
- [Google AdMob Unity privacy strategies](https://developers.google.com/admob/unity/privacy/strategies)
', now())
on conflict (content_key)
do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = now();

commit;

-- Quick verification after running this migration:
select count(*) as migrated_lessons
from public.ua_content_files
where content_key in ('lessons/day-01.md', 'lessons/day-02.md', 'lessons/day-03.md', 'lessons/day-04.md', 'lessons/day-05.md', 'lessons/day-06.md', 'lessons/day-07.md', 'lessons/day-08.md', 'lessons/day-09.md', 'lessons/day-10.md', 'lessons/day-11.md', 'lessons/day-12.md', 'lessons/day-13.md', 'lessons/day-14.md', 'lessons/day-15.md', 'lessons/day-16.md', 'lessons/day-17.md', 'lessons/day-18.md', 'lessons/day-19.md', 'lessons/day-20.md', 'lessons/day-21.md', 'lessons/day-22.md', 'lessons/day-23.md', 'lessons/day-24.md', 'lessons/day-25.md', 'lessons/day-26.md', 'lessons/day-27.md', 'lessons/day-28.md', 'lessons/day-29.md', 'lessons/day-30.md');

select content_key, char_length(text_content) as lesson_chars, updated_at
from public.ua_content_files
where content_key in ('lessons/day-01.md', 'lessons/day-15.md', 'lessons/day-30.md')
order by content_key;
