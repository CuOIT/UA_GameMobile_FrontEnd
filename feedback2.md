# Visual Feedback 2 - Lessons 1-30

Nguồn kiểm tra: `C:\Users\DPC00212\Downloads\full_visual_report.md` bản đã tinh chỉnh.

## Tổng quan

- Bản visual đã sửa tốt hơn nhiều so với bản trước.
- Các lỗi nặng kiểu template generic ở lesson 24-30, text rác, duplicate 3.1/3.2, duplicate 4.1/4.2, swap 10.1/10.2 gần như đã được xử lý.
- Tuy nhiên bộ visual hiện tại vẫn hơi **lạm dụng AI-generated diagram**. Nên bổ sung nhiều ảnh thật hơn từ các báo cáo, dashboard, case study hoặc public report có thật trên internet, đặc biệt ở các bài nói về UA, attribution, ROAS, creative testing, SKAN, store listing và campaign operations.
- Bộ visual cũng hơi **lạm dụng SVG**. SVG sạch và dễ sửa, nhưng nếu quá nhiều bài đều là sơ đồ vector đơn giản thì cảm giác học sẽ bị khô và thiếu bằng chứng thực tế. Nên cân bằng bằng ảnh báo cáo thật, screenshot public, chart từ nguồn đáng tin cậy, và diagram tự dựng chỉ khi cần giải thích framework.

## Feedback chi tiết

| STT | Lesson | ID | Report |
|---:|---:|---:|---|
| 3 | 2 | 2.1 | ⚠️ Vẫn nên kiểm tra layout PNG; bản trước có khung phải hơi chật. |
| 14 | 7 | 7.2 | ❌ Vẫn chưa đúng. File `royal-match.png` là ảnh ad/gameplay, không phải screenshot Google Play store page. Nếu placeholder yêu cầu “Google Play screenshot” thì cần thay. |
| 15 | 8 | 8.1 | ⚠️ Đã sửa trục ARPDAU về `$0.00-$1.00`, nhưng title mới là “Cohort ARPDAU Scaling Curve”, hơi hẹp so với “Metric decision map mẫu”. Dùng được nếu lesson muốn nhấn ARPDAU. |
| 17 | 9 | 9.1 | ⚠️ PNG cũ vẫn khá dày và nhiều flow; không lỗi nặng nhưng nên giản lược nếu dùng làm learning visual. |
| 21 | 11 | 11.1 | ⚠️ Đã sửa logic lớn, nhưng label “Daily IAP ARPU” dễ gây nhầm với ARPDAU. Nếu mẫu số là active users theo ngày, nên gọi là `IAP ARPDAU`. |
| 25 | 12 | 12.3 | ⚠️ Đã thay Candy Crush screenshot bằng SVG đúng chủ đề ROAS delay hơn, nhưng text “D0 Postback / Immediate signal” có thể gây hiểu sai nếu nói về SKAN/iOS. Nên ghi rõ đây là representational readout, không phải SKAN postback thật. |
| 26 | 13 | 13.1 | ⚠️ PNG vẫn dùng dashboard vs true cohort chuẩn hóa 100%; hình sạch nhưng cần caption giải thích normalization để tránh hiểu sai. |
| 27 | 13 | 13.2 | ⚠️ SVG đã sạch hơn nhiều. Tuy nhiên “Android GAID confidence 99%” hơi tuyệt đối; nên đổi thành “High” thay vì số cứng. |
| 28 | 14 | 14.1 | ⚠️ Vẫn lệch nhẹ. Placeholder là “Decision-backward tracking flow”, nhưng ảnh thực tế vẫn thiên về “Unity Game Event Taxonomy Flow”. Dùng được cho event taxonomy, chưa thật đúng decision-backward flow. |
| 29 | 14 | 14.2 | ⚠️ Không phải heatmap, mà là event coverage/drop-off funnel. Nội dung ổn nếu đổi tên thành “Event coverage funnel”. |
| 48 | 24 | 24.1 | ⚠️ Dùng được, nhưng hơi marketing report generic hơn là UA/game-specific. Không phải lỗi AI nặng. |

## Khuyến nghị chỉnh tiếp

- Ưu tiên thay các visual có claim thực tế bằng ảnh/chart từ nguồn thật: Google Play Console, App Store Connect, Firebase/GA4, Adjust/AppsFlyer/SKAN docs, Meta/Google Ads public docs, Sensor Tower/Data.ai report screenshot nếu được phép sử dụng, hoặc chart tự dựng nhưng bám nguồn công khai.
- Với các bài thiên framework, giữ SVG nhưng nên giảm mật độ chữ và tránh số tuyệt đối kiểu `99%`, `95%`, `$1.58` nếu không có nguồn hoặc context rõ.
- Với ảnh AI-generated, tránh dùng như bằng chứng thị trường. Chỉ dùng để minh họa khái niệm; phần case study nên có ảnh thật hoặc public screenshot.
- Nếu visual là SVG, nên export thêm PNG preview để QA render cuối: spacing, text wrap, font, line break, arrow direction.
- Các visual nên phân loại rõ: `source-backed screenshot`, `source-backed chart`, `illustrative diagram`, hoặc `AI-generated concept visual`. Điều này giúp tránh học viên hiểu nhầm ảnh minh họa là dữ liệu thật.
