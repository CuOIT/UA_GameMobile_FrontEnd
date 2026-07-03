---
day: 2
title: "Puzzle market thesis and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
artifact: "Puzzle market thesis"
---

## Mục tiêu / Goal

Sau bài này, bạn tạo được **Puzzle market thesis**: một giả thuyết thị trường đủ cụ thể để biết game puzzle của bạn nên test với ai, lời hứa nào, ở market nào, và vì sao monetization hiện tại có cơ hội pay back.

Kết quả cần có sau bài:

- Một target player segment rõ hơn “người thích puzzle”.
- Một motivation chính: relax, challenge, mastery, satisfying clear, daily habit hoặc collection.
- Hai đến ba reference games để so sánh promise/store/monetization.
- Một market assumption cho micro test, ví dụ Android tier-2/3, English-speaking broad, hoặc Vietnam/SEA soft signal.
- Một risk note: market thesis yếu nhất ở đâu?

## Why this matters

Nhiều team nhỏ làm puzzle game vì nghĩ “puzzle dễ hiểu, audience rộng, CPI chắc rẻ”. Đây là giả định nguy hiểm. Puzzle đúng là dễ truyền tải trong creative, nhưng cũng là genre rất đông đối thủ, dễ bị copy về visual promise, và thường cần retention hoặc ad depth tốt để có LTV đủ trả CPI.

Market thesis giúp bạn không test mù. Nó buộc bạn trả lời: người chơi nào sẽ quan tâm, họ quan tâm vì động lực gì, họ đang quen với loại store promise nào, và game của bạn có đủ production/monetization để phục vụ kỳ vọng đó không.

Một market thesis tốt không cần đúng 100%. Nó cần đủ rõ để chạy test nhỏ và biết phải sửa gì nếu sai.

## Core model: market thesis không phải genre label

“Puzzle” chỉ là genre label. Nó không nói người chơi muốn gì.

Một market thesis có 5 phần:

| Thành phần | Câu hỏi cần trả lời | Ví dụ tốt | Ví dụ yếu |
| --- | --- | --- | --- |
| Player segment | Ai có khả năng quan tâm? | Người lớn muốn brain break ngắn, ít áp lực | Mọi người chơi puzzle |
| Motivation | Họ chơi vì cảm giác nào? | Satisfying clear, calm logic, daily mastery | Vì game vui |
| Promise | Creative/store hứa điều gì? | Clear a messy board in one smart move | Nhiều level hấp dẫn |
| Market context | Test ở đâu trước? | Android SEA/tier-2 với CPI guardrail thấp | Test toàn cầu ngay |
| Monetization path | Vì sao có thể pay back? | Ads + light IAP nếu session depth và rewarded engagement đủ | Có ads nên chắc có tiền |

Nếu bạn không viết được 5 phần này, bạn chưa có market thesis. Bạn mới có một ý tưởng game.

## Puzzle market map

Dùng bảng này để phân biệt các hướng puzzle thường gặp. Các dòng dưới đây không phải phân loại tuyệt đối, nhưng giúp bạn tránh gom tất cả puzzle vào một nhóm.

| Puzzle angle | Player motivation | Creative hook thường hợp | Metric cần xem sớm | Monetization risk |
| --- | --- | --- | --- | --- |
| Calm daily puzzle | Relax, routine | “A 2-minute brain break” | D1/D7, daily challenge return | Session ngắn, ad depth thấp |
| Satisfying clear puzzle | Visual satisfaction | “Clear chaos in one move” | CTR, IPM, level depth | Hook kéo curiosity nhưng D1 yếu |
| Hard challenge puzzle | Mastery, pride | “Only 1% solve this” | CTR, fail/retry, D1 | Attract rage-click, churn cao |
| Collection/meta puzzle | Completion, progress | “Unlock rooms/collections” | Session length, ad engagement | Production scope nặng |
| Fast fail puzzle | Adrenaline, retry | “Can you beat this?” | CPI, early churn, level retry | Low intent traffic, weak LTV |

:::chart
title: Market fit scorecard example, 1-5
Audience clarity|4|Clear relaxing brain-break target
Creative clarity|5|Board clear is visual in 1 second
Production fit|3|Need many polished boards
Retention path|2|Daily habit not proven yet
Monetization path|3|Ads plus light IAP possible
:::

Cách đọc chart: điểm thấp nhất là nơi thesis dễ vỡ. Trong ví dụ này, creative rất dễ hiểu nhưng retention path yếu. Nghĩa là test đầu tiên không nên chỉ hỏi “CPI có rẻ không?”, mà phải hỏi “player có quay lại vì daily habit không?”.

## Worked example: market thesis cho puzzle game

Giả sử game của bạn là block puzzle có cảm giác dọn dẹp board rất đã tay. Bạn có thể tóm tắt market thesis dưới dạng bảng trực quan:

| Thành phần | Chi tiết giả thuyết | Ý nghĩa thực tế |
| --- | --- | --- |
| **Target Segment** | Adults who want a calm but satisfying 2-minute brain break. | Đối tượng: Người lớn cần nghỉ ngơi ngắn bằng câu đố nhẹ nhàng. |
| **Creative Promise** | Visual board-clear (Dọn sạch bàn chơi bằng hiệu ứng thị giác). | Lời hứa quảng cáo chính dùng để thu hút sự chú ý. |
| **Initial Market** | Android SEA / Tier-2 (với chi phí thấp). | Khu vực chạy thử nghiệm để tiết kiệm ngân sách. |
| **Success Signals** | CTR/IPM tốt, CVR không lỗi, D1/level depth ổn định. | Dấu hiệu cho thấy giả thuyết đúng hướng. |
| **Failure Condition** | CPI rất rẻ nhưng level depth và D1 cực kỳ thấp. | Nhận biết lỗi curiosity-trap (chỉ tò mò tải chứ không chơi). |

Cách trình bày này tốt hơn “game puzzle cho mọi người” vì nó làm nổi bật rõ ràng segment, motivation, creative promise, market assumption, metric signal và failure condition.

## Hướng dẫn đọc số cho genre fit

### 1. Đừng dùng CPI để chứng minh genre fit một mình

CPI thấp chỉ nói bạn mua được install rẻ. Nó chưa nói người chơi có phù hợp với game. Nếu CPI thấp nhưng level depth thấp và D1 yếu, bạn có thể đang mua curiosity traffic, không phải target player.

### 2. Đọc CPI cùng retention và engagement

Nếu CPI cao hơn kỳ vọng nhưng D1/engagement tốt, thesis có thể vẫn đáng test tiếp bằng creative/store optimization. Nếu CPI thấp nhưng retention hỏng, thesis có thể sai audience hoặc sai promise.

### 3. Đọc market thesis bằng pattern, không bằng một số đơn lẻ

| Pattern | Cách đọc | Action nên làm |
| --- | --- | --- |
| CPI thấp + D1 thấp | Cheap traffic nhưng fit yếu | Kiểm creative promise và onboarding trước khi scale |
| CTR cao + CVR thấp | Hook có attention, store proof yếu | Sửa first screenshot/description |
| D1 tốt + ARPDAU thấp | Có product interest nhưng monetization yếu | Test ad placement/rewarded economy |
| CPI cao + D1 tốt | Audience có thể đúng nhưng creative/store chưa efficient | Tối ưu creative angle trước khi bỏ thesis |
| CTR thấp + D1 tốt ở cohort nhỏ | Product có thể ổn, hook chưa truyền được | Làm lại opening 1-3 giây đầu |

## Competitor teardown mẫu

Bạn không cần phân tích 20 đối thủ. Với beginner, 3 reference games là đủ để bắt đầu.

> [!TIP]
> **Cách tìm đối thủ cùng quy mô (scope) trên Store**:
> 1. Tìm các từ khóa cốt lõi của game (ví dụ: *wood block puzzle*, *screw sort*) trên Google Play.
> 2. Bỏ qua các game ở top 1-5 quá lớn (như Candy Crush), cuộn xuống tìm các game có lượt tải từ 10k - 500k. Đây là những game có cùng quy mô sản xuất và ngân sách thử nghiệm thực tế với bạn.
> 3. Chụp màn hình trang cửa hàng của họ để phân tích cách họ thể hiện ảnh chụp màn hình đầu tiên (store proof).

| Reference | Visible promise | Store proof | Monetization hint | Pattern học được | Không nên copy |
| --- | --- | --- | --- | --- | --- |
| Calm block puzzle | Relaxing daily board clear | Screenshot sạch, ít UI | Ads nhẹ, remove ads/IAP | Calm + routine | Tone art y hệt |
| Hard logic puzzle | Challenge and mastery | Level khó, fail state rõ | Hints/IAP | Pride hook | Claim “1% solve” nếu game không khó |
| Decor/meta puzzle | Solve to unlock room | Before/after room visual | Ads + bundles | Progression proof | Meta scope quá lớn nếu team nhỏ |

Cách đọc competitor đúng: tìm pattern của promise và proof. Đừng copy art, board, tagline hoặc screenshot. Bạn cần hiểu “vì sao người chơi tin lời hứa này trên store?”.

## LTV và monetization fit ở mức beginner

Bạn chưa cần forecast LTV phức tạp. Nhưng bạn cần biết monetization path có hợp genre angle không.

| Thesis angle | LTV driver có thể có | Câu hỏi cần kiểm tra sớm |
| --- | --- | --- |
| Calm daily puzzle | D7/D14 habit, light ads | Người chơi có quay lại hàng ngày không? |
| Satisfying clear | Ad engagement, session count | Sau khi thỏa mãn 1 lần, họ có chơi tiếp không? |
| Hard challenge | Hints, retry, rewarded ads | Fail có làm họ muốn thử lại hay rời game? |
| Collection/meta | Long-term progression, bundles | Team có sản xuất đủ content không? |

Nếu thesis cần LTV cao nhưng game chỉ có session rất ngắn và không có return hook, bạn đang tự đặt campaign vào thế khó.

## Real usecases đã đối chiếu nguồn

Ở bài market thesis, case thực tế chỉ hữu ích khi bạn tách **genre label** khỏi **motivation + proof + monetization path**.

![Day 2 market thesis visual](content/assets/usecases/day-02-market-thesis-visual.svg)

*Visual minh họa: không phải dữ liệu campaign chính thức. Dùng để tách genre label khỏi motivation, proof và monetization path theo case Candy Crush + Bravestars.*

### Global case: Candy Crush Saga

![Candy Crush public Google Play screenshot](content/assets/usecases/candy-crush.png)

*Public screenshot readout: ảnh Google Play cho thấy board objective, booster, combo visual và progression flavor. Dùng để đọc market thesis về level objective + reward loop, không dùng để suy benchmark. Nguồn ảnh: [Candy Crush Saga on Google Play](https://play.google.com/store/apps/details?id=com.king.candycrushsaga).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Candy Crush Saga là free-to-play tile-matching game của King, phát hành trên Facebook rồi iOS/Android; gameplay là swap candy để match 3+, qua nhiều level với mục tiêu khác nhau. Nguồn: [Wikipedia - Candy Crush Saga](https://en.wikipedia.org/wiki/Candy_Crush_Saga) | “Match-3” không phải market thesis đủ dùng. Thesis mạnh hơn phải nói rõ level objective, progression, fail/retry, booster hoặc daily habit tạo lý do chơi tiếp. | Không suy ra benchmark CPI/D1 hiện tại của Candy Crush hoặc dùng doanh thu lịch sử để chứng minh game indie sẽ payback. |
| Nguồn ghi game dùng freemium model và có in-app purchase giúp vượt board khó. | Monetization path phải khớp với friction của genre: nếu game có challenge/fail state hợp lý, hint/booster/IAP hoặc rewarded support mới có logic. | Không copy hệ thống monetization nếu game của bạn chưa có depth/fail/retry đủ thuyết phục. |

**Decision rule học được:** market thesis không nên viết “puzzle popular”. Hãy viết: người chơi nào, động lực nào, level proof nào, và monetization path nào có thể hợp với động lực đó.

### Vietnam case: Bravestars Games

![Bravestars Wooden Slide public Google Play screenshot](content/assets/usecases/wooden-slide.png)

*Public screenshot readout: ảnh Google Play của Wooden Slide cho thấy sub-genre promise khác với match-3: block escape, spatial logic, path clearing. Dùng để nhắc rằng casual puzzle không phải một audience duy nhất. Nguồn ảnh: [Wooden Slide on Google Play](https://play.google.com/store/apps/details?id=slide.color.block.puzzle).*

| Fact từ nguồn public | UA interpretation cho bài này | Không được suy ra |
| --- | --- | --- |
| Google Play developer page của Bravestars Games liệt kê nhiều casual/puzzle-like products như Wooden Slide: Block Escape, Nuts and Bolts Woody Puzzle, Woolloop! Color Puzzle, Goods Mix Puzzle Master, Save The Pets, Draw Bridge Puzzle. Nguồn: [Google Play - Bravestars Games](https://play.google.com/store/apps/developer?id=Bravestars+Games) | Một portfolio có nhiều sub-genre cho thấy “casual puzzle” không phải một audience duy nhất. Mỗi title hứa một motivation khác: block escape, nuts/bolts logic, color/wool, goods matching, rescue/drawing. | Không suy ra ranking, doanh thu, campaign spend hoặc tỷ lệ thành công của từng game nếu Google Play page không công bố. |
| Nguồn public thể hiện nhiều promise bằng title/action rất cụ thể. | Khi chọn reference games, hãy so theo promise gần nhất với game của bạn, không chỉ chọn game top nổi tiếng. | Không gom tất cả thành “người chơi Bravestars-style”; phải viết motivation row riêng cho từng promise muốn test. |

**Decision rule học được:** nếu thesis của bạn có thể áp vào mọi game casual/puzzle trong portfolio, thesis đó quá rộng. Thu hẹp bằng motivation và proof cụ thể.

## Common mistakes

### Mistake 1: “Puzzle audience rất rộng”

Audience rộng không có nghĩa bạn biết ai sẽ install và quay lại. Broad audience có thể giúp network tìm traffic, nhưng plan của bạn vẫn cần motivation rõ để đọc creative signal.

Correction: viết audience bằng motivation, không chỉ bằng genre. Ví dụ “người muốn brain break nhẹ trong 2 phút” tốt hơn “người thích puzzle”.

### Mistake 2: Chọn competitor quá nổi nhưng không cùng scope

Nếu bạn so game indie prototype với một puzzle game top grossing có hàng năm live ops, meta system và production budget lớn, bạn sẽ học sai.

Correction: chọn reference theo promise và scope gần hơn, không chỉ theo doanh thu hoặc ranking.

### Mistake 3: Nghĩ store screenshot đẹp là đủ

Screenshot đẹp nhưng không chứng minh creative promise thì vẫn có thể làm CVR yếu.

Correction: screenshot đầu tiên phải trả lời “người vừa click ad có thấy đúng thứ họ mong không?”.

### Mistake 4: Không viết failure condition

Market thesis phải có điều kiện sai. Nếu không, bạn sẽ luôn tìm lý do để chạy tiếp.

Correction: viết rõ “nếu pattern X xảy ra, thesis hiện tại yếu ở điểm Y”.
> [!WARNING]
> **Không đặt KPI Failure Condition quá cao**: Trong lần chạy thử đầu tiên, đừng đặt mục tiêu D1 retention phải đạt 40% mới giữ game. Đặt mức sàn thực tế (ví dụ: D1 > 20% hoặc level 3 reach > 30%) để lấy tín hiệu cải thiện sản phẩm, tránh khai tử dự án quá sớm vì kỳ vọng phi thực tế.

## Lab output example

| Field | Example output |
| --- | --- |
| Target segment | Adults who want a calm 2-minute brain break. |
| Motivation | Relaxing satisfaction from clearing a messy board. |
| Reference games | Calm block puzzle, hard logic puzzle, decor/meta puzzle. |
| Initial market | Android SEA/tier-2, micro-budget, broad interest. |
| Creative promise | Clear chaos in one smart move. |
| Monetization path | Ads + light IAP if D1 and rewarded engagement are acceptable. |
| Fit risk | Hook may attract curiosity but not daily retention. |
| Failure condition | CPI cheap but level depth and D1 weak. |

## Practical Lab

Làm trực tiếp trên game của bạn:

1. Chọn 3 reference games gần với game của bạn nhất về promise, không chỉ về genre.
2. Với mỗi reference, ghi promise, first screenshot proof, monetization hint và pattern bạn học được.
3. Viết target segment bằng motivation.
4. Chọn một initial market cho test nhỏ và viết lý do.
5. Viết một failure condition cho market thesis.

## Final UA Plan Update

Cập nhật field **Target audience** theo format:

```text
Target segment: [ai]
Motivation: [vì sao họ chơi]
Reference games: [2-3 game/pattern]
Initial market: [region/platform/channel assumption]
Monetization fit: [ads/IAP path]
Main risk: [điểm thesis dễ sai]
Failure condition: [metric pattern làm thesis yếu]
```

## Checklist Focus

- Viết target segment bằng motivation, không chỉ bằng genre.
- Chọn 3 reference games và ghi visible promise của từng game.
- Ghi store proof: icon/screenshot/title chứng minh promise thế nào.
- Chọn initial market cho micro-budget test và nêu lý do.
- Viết monetization path và risk lớn nhất.
- Viết failure condition để biết khi nào thesis sai.

## English Terms You Should Keep

- **Genre-market fit**: mức độ phù hợp giữa genre, audience, promise, market và monetization.
- **CPI**: cost per install, cần đọc cùng retention/engagement.
- **LTV**: lifetime value, ở bài này chỉ dùng như hướng suy nghĩ monetization path, chưa cần forecast chính xác.
- **Market thesis**: giả thuyết về ai sẽ thích game, vì sao, ở đâu, và game có thể kiếm tiền bằng cách nào.

## Curated References

- Chưa cần đọc reference ngoài trước khi làm lab. Với bài này, reference quan trọng nhất là store pages và creatives của 3 game bạn chọn để teardown.

> Practical rule: Market thesis tốt phải có segment, motivation, reference pattern, initial market, monetization path và failure condition. Nếu thiếu failure condition, bạn chưa có thesis để test.
