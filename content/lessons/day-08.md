---
day: 8
title: "Metric map for mobile games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, Retention, ARPDAU]
---

## Mục tiêu / Goal
Bài 8 tập trung vào **Metric map**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Metrics chia thành acquisition, engagement, retention và monetization. Đọc riêng từng nhóm dễ sai; đọc cùng nhau mới thấy product-market-economics fit.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **CPI, Retention, ARPDAU**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Tạo bảng metric map cho game: input ad, store conversion, game event, revenue event, owner decision.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CPI, D1, D7, ARPDAU, LTV và ROAS tạo thành minimum dashboard.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Tối ưu một metric làm hỏng metric khác.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.