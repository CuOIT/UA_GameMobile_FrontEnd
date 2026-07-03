# Tiêu Chí Đánh Giá Chất Lượng Bài Giảng (Lesson Quality Evaluation Rubric)

Tài liệu này định nghĩa hệ thống 7 tiêu chí đánh giá chất lượng (thang điểm 1-5) dùng để kiểm định và tối ưu hóa các bài học trong bootcamp UA Marketing dành cho lập trình viên Unity.

---

## 1. Hệ thống 7 Tiêu chí Đánh giá (Rubric)

### 📊 1. Tính rõ ràng của Quyết định (Decision clarity)
*   **Mô tả**: Bài học có tập trung dạy học viên cách đưa ra một quyết định cụ thể, rõ ràng không?
*   **Thang điểm**:
    *   `5/5`: Nêu bật quyết định cốt lõi cần chọn, giải thích tại sao và cung cấp quy tắc quyết định (decision rule).
    *   `3/5`: Có nhắc đến quyết định nhưng bị chìm lẫn trong các khái niệm định nghĩa lý thuyết.
    *   `1/5`: Chỉ định nghĩa khái niệm, đọc xong không biết phải quyết định điều gì tiếp theo.

### 🧠 2. Độ sâu của Bài giảng (Teaching depth)
*   **Mô tả**: Nội dung giải thích có đủ sâu sắc và dễ hiểu đối với lập trình viên Unity chưa biết gì về Marketing không?
*   **Thang điểm**:
    *   `5/5`: Giải thích trực quan, gắn kết chặt chẽ với kỹ thuật lập trình Unity (ví dụ: tối ưu build size, cấu trúc event, lỗi crash).
    *   `3/5`: Giải thích tương đối dễ hiểu nhưng còn mang tính lý thuyết chung chung của ngành marketing.
    *   `1/5`: Quá nhiều biệt ngữ marketing (marketing jargon) không được giải nghĩa rõ ràng.

### 📈 3. Trực quan hóa Số liệu (Metric literacy)
*   **Mô tả**: Bài học có bao gồm bảng biểu, sơ đồ dòng chảy (flowchart), biểu đồ dữ liệu (`:::chart`) và hướng dẫn cách đọc số cụ thể không?
*   **Thang điểm**:
    *   `5/5`: Có bảng hướng dẫn đọc số (Pattern -> Chẩn đoán -> Hành động đúng -> Hành động sai) kèm biểu đồ trực quan.
    *   `3/5`: Có bảng hoặc biểu đồ nhưng thiếu hướng dẫn chẩn đoán lỗi chi tiết dựa trên số liệu.
    *   `1/5`: Chỉ ghi text suông, không có bảng số liệu hoặc biểu đồ hỗ trợ.

### 🛑 4. Cảnh báo Sai lầm (Mistake coverage)
*   **Mô tả**: Bài giảng có chỉ ra được các sai lầm phổ biến mà đội ngũ phát triển indie thường mắc phải và cách khắc phục không?
*   **Thang điểm**:
    *   `5/5`: Có tối thiểu 3 sai lầm được cấu trúc hóa rõ ràng theo định dạng **Sai lầm (Mistake) - Khắc phục (Correction)**.
    *   `3/5`: Có cảnh báo lỗi nhưng ghi dưới dạng gạch đầu dòng ngắn, thiếu phân tích nguyên nhân sâu xa.
    *   `1/5`: Không đề cập đến bất kỳ sai lầm nào cần tránh.

### 💡 5. Ví dụ thực tế mẫu (Worked example)
*   **Mô tả**: Bài học có cung cấp một bài toán tình huống thực tế (giả lập hoặc có nguồn đối chiếu) kèm chẩn đoán cụ thể không?
*   **Thang điểm**:
    *   `5/5`: Ví dụ có số liệu rõ ràng, phân tích từng bước dẫn tới kết luận chẩn đoán (verdict) và hành động tiếp theo.
    *   `3/5`: Có ví dụ nhưng sơ sài, thiếu số liệu phân tích cụ thể hoặc thiếu kết luận vận hành.
    *   `1/5`: Không có ví dụ thực hành hoặc ví dụ chỉ kể chuyện suông.

### 📝 6. Kết quả thực hành mẫu (Lab output example)
*   **Mô tả**: Có bảng kết quả điền mẫu (bài làm mẫu) để học viên nhìn vào biết mình cần nộp sản phẩm gì không?
*   **Thang điểm**:
    *   `5/5`: Có bảng mẫu hoàn chỉnh hiển thị thông tin thực tế giả định của một game puzzle cụ thể.
    *   `3/5`: Có hướng dẫn đầu ra nhưng viết bằng text mô tả, học viên phải tự đoán định dạng bảng.
    *   `1/5`: Thiếu hoàn toàn bài làm mẫu.

### ⚡ 7. Tính khả thi (Actionability)
*   **Mô tả**: Đọc xong bài học, học viên có thể cập nhật ngay lập tức Final UA Plan mà không cần phải tự đoán mò không?
*   **Thang điểm**:
    *   `5/5`: Có phần Practical Lab rõ ràng và hướng dẫn điền chi tiết trường cụ thể trong Final UA Plan.
    *   `3/5`: Học viên biết phải sửa plan nhưng không được hướng dẫn format điền hoặc không chỉ rõ trường liên quan.
    *   `1/5`: Học viên mơ hồ không biết bước tiếp theo phải làm gì với bản kế hoạch của mình.

---

## 2. Cấu trúc Báo cáo Đánh giá (Review Template)

Mỗi khi tiến hành review bài giảng mới, tác nhân sẽ chấm điểm và trả về báo cáo theo định dạng sau:

```markdown
### I. Bảng điểm chất lượng (Scorecard)
- [Tiêu chí 1]: X/5 - Lý do cụ thể
- [Tiêu chí 2]: X/5 - Lý do cụ thể
...

### II. Top 5 cải tiến cần làm ngay (Top 5 fixes)
1. [Cải tiến 1]
2. [Cải tiến 2]
...

### III. Hình ảnh/Bảng biểu còn thiếu (Missing visuals/tables)
- [Mô tả hình ảnh hoặc bảng cần bổ sung]

### IV. Phần ưu tiên viết lại (Rewrite priority)
1. [Tên mục cần viết lại 1] - Lý do
2. [Tên mục cần viết lại 2] - Lý do
```
