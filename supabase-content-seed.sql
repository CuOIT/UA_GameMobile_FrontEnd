-- Seed UA Marketing course content into Supabase.
-- Run supabase-schema.sql first, then this file.

begin;

insert into public.ua_content_files (content_key, content_type, json_content, text_content, updated_at)
values
  ('course.json', 'json', '{
    "lessons":  [
                    {
                        "day":  1,
                        "title":  "UA mindset for Unity developers",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Understand UA as a product learning loop, not just buying installs.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "UA",
                                              "Funnel",
                                              "CPI"
                                          ],
                        "quizId":  "q01",
                        "checklistId":  "c01",
                        "markdown":  "lessons/day-01.md"
                    },
                    {
                        "day":  2,
                        "title":  "Mobile game market and genre fit",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Map genre, audience, region and monetization before spending.",
                        "stages":  [
                                       "idea",
                                       "prototype"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Genre-market fit",
                                              "CPI",
                                              "LTV"
                                          ],
                        "quizId":  "q02",
                        "checklistId":  "c02",
                        "markdown":  "lessons/day-02.md"
                    },
                    {
                        "day":  3,
                        "title":  "Paid, organic and store discovery",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Separate paid UA, ASO, community and platform discovery.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ASO",
                                              "CTR",
                                              "CVR"
                                          ],
                        "quizId":  "q03",
                        "checklistId":  "c03",
                        "markdown":  "lessons/day-03.md"
                    },
                    {
                        "day":  4,
                        "title":  "Player funnel from impression to payer",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Trace the journey from ad impression to retained user and payer.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Funnel",
                                              "IPM",
                                              "CVR"
                                          ],
                        "quizId":  "q04",
                        "checklistId":  "c04",
                        "markdown":  "lessons/day-04.md"
                    },
                    {
                        "day":  5,
                        "title":  "Soft launch strategy",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Use limited markets and budgets to reduce launch risk.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Soft launch",
                                              "Retention",
                                              "Cohort"
                                          ],
                        "quizId":  "q05",
                        "checklistId":  "c05",
                        "markdown":  "lessons/day-05.md"
                    },
                    {
                        "day":  6,
                        "title":  "UA channels and ad networks",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Learn Meta, Google, Unity, AppLovin-style networks and what each optimizes.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Ad network",
                                              "ROAS",
                                              "Attribution"
                                          ],
                        "quizId":  "q06",
                        "checklistId":  "c06",
                        "markdown":  "lessons/day-06.md"
                    },
                    {
                        "day":  7,
                        "title":  "Week 1 synthesis: first UA hypothesis",
                        "module":  "Week 1 - UA fundamentals",
                        "summary":  "Turn market and funnel thinking into a testable UA hypothesis.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Beginner",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "UA",
                                              "Funnel",
                                              "Soft launch"
                                          ],
                        "quizId":  "q07",
                        "checklistId":  "c07",
                        "markdown":  "lessons/day-07.md"
                    },
                    {
                        "day":  8,
                        "title":  "Metric map for mobile games",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Connect installs, retention, monetization and creative metrics.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "CPI",
                                              "Retention",
                                              "ARPDAU"
                                          ],
                        "quizId":  "q08",
                        "checklistId":  "c08",
                        "markdown":  "lessons/day-08.md"
                    },
                    {
                        "day":  9,
                        "title":  "CPI, CTR, CVR and IPM",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Read acquisition efficiency without confusing surface metrics with quality.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "CPI",
                                              "CTR",
                                              "CVR",
                                              "IPM"
                                          ],
                        "quizId":  "q09",
                        "checklistId":  "c09",
                        "markdown":  "lessons/day-09.md"
                    },
                    {
                        "day":  10,
                        "title":  "Retention and cohorts",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Use D1, D7 and cohort views to judge whether players come back.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Retention",
                                              "Cohort"
                                          ],
                        "quizId":  "q10",
                        "checklistId":  "c10",
                        "markdown":  "lessons/day-10.md"
                    },
                    {
                        "day":  11,
                        "title":  "ARPDAU, LTV and payback",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Estimate economic ceiling before increasing spend.",
                        "stages":  [
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ARPDAU",
                                              "LTV",
                                              "Payback window"
                                          ],
                        "quizId":  "q11",
                        "checklistId":  "c11",
                        "markdown":  "lessons/day-11.md"
                    },
                    {
                        "day":  12,
                        "title":  "ROAS and decision windows",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Define how soon a campaign must show revenue signal.",
                        "stages":  [
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ROAS",
                                              "LTV",
                                              "Payback window"
                                          ],
                        "quizId":  "q12",
                        "checklistId":  "c12",
                        "markdown":  "lessons/day-12.md"
                    },
                    {
                        "day":  13,
                        "title":  "Attribution, ATT, SKAN and signal loss",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Understand why mobile measurement is incomplete and how to plan around it.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Attribution",
                                              "ATT",
                                              "SKAN"
                                          ],
                        "quizId":  "q13",
                        "checklistId":  "c13",
                        "markdown":  "lessons/day-13.md"
                    },
                    {
                        "day":  14,
                        "title":  "Tracking plan for Unity games",
                        "module":  "Week 2 - Metrics and measurement",
                        "summary":  "Choose conceptual game events before SDK implementation.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Event taxonomy",
                                              "Attribution",
                                              "Cohort"
                                          ],
                        "quizId":  "q14",
                        "checklistId":  "c14",
                        "markdown":  "lessons/day-14.md"
                    },
                    {
                        "day":  15,
                        "title":  "Creative strategy and ad hooks",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Turn player motivations into testable ad angles.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Creative testing",
                                              "CTR",
                                              "IPM"
                                          ],
                        "quizId":  "q15",
                        "checklistId":  "c15",
                        "markdown":  "lessons/day-15.md"
                    },
                    {
                        "day":  16,
                        "title":  "Video, static and playable ads",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Choose formats based on genre, clarity and production cost.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Playable ad",
                                              "Creative testing",
                                              "IPM"
                                          ],
                        "quizId":  "q16",
                        "checklistId":  "c16",
                        "markdown":  "lessons/day-16.md"
                    },
                    {
                        "day":  17,
                        "title":  "Creative test matrix",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Design variants so each test has one learning goal.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Creative testing",
                                              "CTR",
                                              "CVR"
                                          ],
                        "quizId":  "q17",
                        "checklistId":  "c17",
                        "markdown":  "lessons/day-17.md"
                    },
                    {
                        "day":  18,
                        "title":  "ASO basics for game pages",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Align icon, screenshots, title and description with UA promise.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ASO",
                                              "CVR"
                                          ],
                        "quizId":  "q18",
                        "checklistId":  "c18",
                        "markdown":  "lessons/day-18.md"
                    },
                    {
                        "day":  19,
                        "title":  "Competitor teardown",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Analyze store pages and creatives without copying blindly.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Genre-market fit",
                                              "ASO",
                                              "Creative testing"
                                          ],
                        "quizId":  "q19",
                        "checklistId":  "c19",
                        "markdown":  "lessons/day-19.md"
                    },
                    {
                        "day":  20,
                        "title":  "Creative fatigue and iteration",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Recognize when a creative stops learning or stops scaling.",
                        "stages":  [
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Creative fatigue",
                                              "CTR",
                                              "ROAS"
                                          ],
                        "quizId":  "q20",
                        "checklistId":  "c20",
                        "markdown":  "lessons/day-20.md"
                    },
                    {
                        "day":  21,
                        "title":  "Week 3 synthesis: store and creative readiness",
                        "module":  "Week 3 - Creative and store readiness",
                        "summary":  "Prepare your first creative set and store checklist.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Core",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ASO",
                                              "Creative testing",
                                              "Soft launch"
                                          ],
                        "quizId":  "q21",
                        "checklistId":  "c21",
                        "markdown":  "lessons/day-21.md"
                    },
                    {
                        "day":  22,
                        "title":  "Campaign structure for beginners",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Structure tests by audience, creative and optimization goal.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Ad network",
                                              "Campaign",
                                              "ROAS"
                                          ],
                        "quizId":  "q22",
                        "checklistId":  "c22",
                        "markdown":  "lessons/day-22.md"
                    },
                    {
                        "day":  23,
                        "title":  "Budget and sample size",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Avoid conclusions from tiny data while keeping spend controlled.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "CPI",
                                              "Cohort",
                                              "Payback window"
                                          ],
                        "quizId":  "q23",
                        "checklistId":  "c23",
                        "markdown":  "lessons/day-23.md"
                    },
                    {
                        "day":  24,
                        "title":  "Reading campaign reports",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Separate creative signal, audience signal and product signal.",
                        "stages":  [
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "CTR",
                                              "IPM",
                                              "Retention",
                                              "ROAS"
                                          ],
                        "quizId":  "q24",
                        "checklistId":  "c24",
                        "markdown":  "lessons/day-24.md"
                    },
                    {
                        "day":  25,
                        "title":  "Scale, iterate or kill",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Use predefined rules to reduce emotional campaign decisions.",
                        "stages":  [
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ROAS",
                                              "Retention",
                                              "Creative testing"
                                          ],
                        "quizId":  "q25",
                        "checklistId":  "c25",
                        "markdown":  "lessons/day-25.md"
                    },
                    {
                        "day":  26,
                        "title":  "Privacy and SDK risk awareness",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Treat ad and analytics SDKs as product architecture decisions.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "ATT",
                                              "SKAN",
                                              "Event taxonomy"
                                          ],
                        "quizId":  "q26",
                        "checklistId":  "c26",
                        "markdown":  "lessons/day-26.md"
                    },
                    {
                        "day":  27,
                        "title":  "Post-mortem and learning log",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Document what each UA test taught you about product and market.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Cohort",
                                              "Creative testing",
                                              "UA"
                                          ],
                        "quizId":  "q27",
                        "checklistId":  "c27",
                        "markdown":  "lessons/day-27.md"
                    },
                    {
                        "day":  28,
                        "title":  "Week 4 synthesis: operating rhythm",
                        "module":  "Week 4 - Campaign operation",
                        "summary":  "Create a weekly UA operating cadence for a small team.",
                        "stages":  [
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Campaign",
                                              "ROAS",
                                              "Soft launch"
                                          ],
                        "quizId":  "q28",
                        "checklistId":  "c28",
                        "markdown":  "lessons/day-28.md"
                    },
                    {
                        "day":  29,
                        "title":  "Build your UA launch plan",
                        "module":  "Capstone",
                        "summary":  "Draft the complete UA plan for your game or a sample Unity game.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "UA",
                                              "Soft launch",
                                              "Event taxonomy"
                                          ],
                        "quizId":  "q29",
                        "checklistId":  "c29",
                        "markdown":  "lessons/day-29.md"
                    },
                    {
                        "day":  30,
                        "title":  "Review, risk and next actions",
                        "module":  "Capstone",
                        "summary":  "Stress-test the plan and define the first real-world next step.",
                        "stages":  [
                                       "idea",
                                       "prototype",
                                       "live"
                                   ],
                        "difficulty":  "Practical",
                        "estimatedMinutes":  25,
                        "glossaryTerms":  [
                                              "Payback window",
                                              "ROAS",
                                              "Retention"
                                          ],
                        "quizId":  "q30",
                        "checklistId":  "c30",
                        "markdown":  "lessons/day-30.md"
                    }
                ]
}
'::jsonb, null, now()),
  ('glossary.json', 'json', '[
    {
        "analogy":  "Giống một feedback loop: build, measure, learn, rồi chỉnh game hoặc creative.",
        "term":  "UA",
        "vi":  "User Acquisition: cách đưa người chơi mới vào game bằng paid, organic và store discovery.",
        "en":  "The practice of acquiring new users through paid and organic channels.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Giá mua một lượt thử game, chưa nói user đó có chất lượng không.",
        "term":  "CPI",
        "vi":  "Cost Per Install: chi phí trung bình để có một install.",
        "en":  "Average media spend per install.",
        "formula":  "Spend / Installs"
    },
    {
        "analogy":  "Đo độ hấp dẫn của hook giống trailer thumbnail.",
        "term":  "CTR",
        "vi":  "Click-through rate: tỷ lệ người thấy ad rồi click.",
        "en":  "Clicks divided by impressions.",
        "formula":  "Clicks / Impressions"
    },
    {
        "analogy":  "Store page có giữ đúng lời hứa của ad hay không.",
        "term":  "CVR",
        "vi":  "Conversion rate: tỷ lệ chuyển đổi từ click sang install hoặc store view sang install.",
        "en":  "Conversions divided by previous funnel step.",
        "formula":  "Installs / Clicks"
    },
    {
        "analogy":  "Một chỉ số gọn để so sánh creative.",
        "term":  "IPM",
        "vi":  "Installs per Mille: số install trên 1.000 impressions.",
        "en":  "Installs per 1,000 ad impressions.",
        "formula":  "Installs / Impressions * 1000"
    },
    {
        "analogy":  "Core loop có đủ lý do để mở game lại không.",
        "term":  "Retention",
        "vi":  "Tỷ lệ người chơi quay lại sau D1, D7 hoặc D30.",
        "en":  "Share of users returning after a period.",
        "formula":  "Returning users / Cohort size"
    },
    {
        "analogy":  "Giống tách save files theo build version để debug đúng nguyên nhân.",
        "term":  "Cohort",
        "vi":  "Nhóm user có cùng điều kiện, thường theo ngày install, source hoặc campaign.",
        "en":  "A grouped set of users used for time-based analysis.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Nhiệt độ economy và monetization mỗi ngày.",
        "term":  "ARPDAU",
        "vi":  "Doanh thu trung bình trên mỗi daily active user.",
        "en":  "Average revenue per daily active user.",
        "formula":  "Daily revenue / DAU"
    },
    {
        "analogy":  "Trần bạn có thể trả cho một install trước khi lỗ.",
        "term":  "LTV",
        "vi":  "Lifetime Value: doanh thu dự kiến một user tạo ra trong vòng đời.",
        "en":  "Expected lifetime revenue per user.",
        "formula":  "ARPDAU * Average lifetime days"
    },
    {
        "analogy":  "Campaign có đang tự nuôi được nó không.",
        "term":  "ROAS",
        "vi":  "Return on Ad Spend: doanh thu thu về so với tiền quảng cáo.",
        "en":  "Revenue attributed to ads divided by ad spend.",
        "formula":  "Attributed revenue / Spend"
    },
    {
        "analogy":  "Thời gian từ lúc spawn user đến lúc user trả đủ chi phí spawn.",
        "term":  "Payback window",
        "vi":  "Khoảng thời gian cần để thu hồi chi phí UA.",
        "en":  "Time needed for acquired users to repay spend.",
        "formula":  "Days until cumulative revenue \u003e= CPI"
    },
    {
        "analogy":  "Store page là scene chọn game trước khi player bấm Play.",
        "term":  "ASO",
        "vi":  "App Store Optimization: tối ưu store listing để tăng discovery và install conversion.",
        "en":  "Optimizing app store assets and metadata.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Closed beta có đo lường UA và economy.",
        "term":  "Soft launch",
        "vi":  "Ra mắt giới hạn để kiểm tra product, UA và monetization trước global launch.",
        "en":  "Limited launch for validation before broader release.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Log nguồn gốc bug/user để biết thay đổi nào tạo ra kết quả.",
        "term":  "Attribution",
        "vi":  "Quy gán install/revenue về nguồn quảng cáo hoặc campaign.",
        "en":  "Connecting user actions to marketing sources.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Một permission gate ảnh hưởng observability của UA.",
        "term":  "ATT",
        "vi":  "Apple App Tracking Transparency: framework consent ảnh hưởng tracking user-level trên iOS.",
        "en":  "Apple privacy framework requiring tracking permission.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Debug log bị nén và delay, nên phải thiết kế event kỹ hơn.",
        "term":  "SKAN",
        "vi":  "SKAdNetwork: hệ thống attribution bảo vệ privacy của Apple với signal bị giới hạn.",
        "en":  "Apple privacy-preserving attribution framework.",
        "formula":  "n/a"
    },
    {
        "analogy":  "A/B test cảm nhận đầu vào trước khi user chạm game.",
        "term":  "Creative testing",
        "vi":  "Quy trình test hook, format, audience promise và visual angle của ad.",
        "en":  "Testing ad variants to find scalable signals.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Một vertical slice siêu nhỏ của core loop.",
        "term":  "Playable ad",
        "vi":  "Ad tương tác mô phỏng gameplay ngắn để tăng intent.",
        "en":  "Interactive ad that lets users try a simplified experience.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Content update cho ads, không chỉ cho game.",
        "term":  "Creative fatigue",
        "vi":  "Khi creative giảm hiệu quả vì audience đã thấy quá nhiều hoặc signal bão hòa.",
        "en":  "Performance decay after repeated creative exposure.",
        "formula":  "n/a"
    },
    {
        "analogy":  "API contract giữa gameplay, analytics và UA.",
        "term":  "Event taxonomy",
        "vi":  "Danh sách event đo lường thống nhất cho funnel, retention và monetization.",
        "en":  "Structured event naming and tracking plan.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Một experiment container có input, output và stop rule.",
        "term":  "Campaign",
        "vi":  "Cấu trúc chạy ads gồm objective, budget, audience, creative và optimization rule.",
        "en":  "A paid acquisition setup inside an ad network.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Không phải game hay là campaign sẽ rẻ; genre quyết định nhiều constraint.",
        "term":  "Genre-market fit",
        "vi":  "Mức độ game, audience, price of traffic và monetization hợp nhau.",
        "en":  "Fit between genre demand, audience, economics and market.",
        "formula":  "n/a"
    },
    {
        "analogy":  "Một black-box optimizer cần input và event signal sạch.",
        "term":  "Ad network",
        "vi":  "Nền tảng phân phối ads như Meta, Google, Unity, AppLovin hoặc ironSource.",
        "en":  "Platform that buys/sells ad inventory and optimizes delivery.",
        "formula":  "n/a"
    }
]
'::jsonb, null, now()),
  ('quizzes.json', 'json', '{
    "q01":  {
                "question":  "Day 1: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q02":  {
                "question":  "Day 2: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q03":  {
                "question":  "Day 3: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q04":  {
                "question":  "Day 4: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q05":  {
                "question":  "Day 5: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q06":  {
                "question":  "Day 6: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q07":  {
                "question":  "Day 7: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q08":  {
                "question":  "Day 8: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q09":  {
                "question":  "Day 9: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q10":  {
                "question":  "Day 10: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q11":  {
                "question":  "Day 11: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q12":  {
                "question":  "Day 12: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q13":  {
                "question":  "Day 13: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q14":  {
                "question":  "Day 14: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q15":  {
                "question":  "Day 15: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q16":  {
                "question":  "Day 16: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q17":  {
                "question":  "Day 17: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q18":  {
                "question":  "Day 18: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q19":  {
                "question":  "Day 19: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q20":  {
                "question":  "Day 20: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q21":  {
                "question":  "Day 21: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q22":  {
                "question":  "Day 22: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q23":  {
                "question":  "Day 23: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q24":  {
                "question":  "Day 24: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q25":  {
                "question":  "Day 25: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q26":  {
                "question":  "Day 26: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q27":  {
                "question":  "Day 27: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q28":  {
                "question":  "Day 28: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q29":  {
                "question":  "Day 29: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            },
    "q30":  {
                "question":  "Day 30: What is the best practical takeaway?",
                "options":  [
                                "Define one measurable learning goal before spending",
                                "Spend first and inspect later",
                                "Only optimize visuals, not product metrics",
                                "Ignore privacy and attribution limits"
                            ],
                "answer":  0,
                "explanation":  "A beginner UA workflow should define the learning goal, metric, and decision rule before budget is spent."
            }
}
'::jsonb, null, now()),
  ('calculators.json', 'json', '[
    {
        "description":  "Estimate the highest CPI you can pay before margin.",
        "name":  "Break-even CPI",
        "id":  "breakEvenCpi",
        "fields":  [
                       {
                           "label":  "LTV ($)",
                           "key":  "ltv",
                           "default":  1.2
                       },
                       {
                           "label":  "Gross margin",
                           "key":  "grossMargin",
                           "default":  0.7
                       }
                   ]
    },
    {
        "description":  "Simple beginner LTV estimate from ARPDAU and lifetime.",
        "name":  "Rough LTV",
        "id":  "roughLtv",
        "fields":  [
                       {
                           "label":  "ARPDAU ($)",
                           "key":  "arpdau",
                           "default":  0.08
                       },
                       {
                           "label":  "Average lifetime days",
                           "key":  "avgLifetimeDays",
                           "default":  10
                       }
                   ]
    },
    {
        "description":  "Convert spend and ROAS target into required attributed revenue.",
        "name":  "ROAS target revenue",
        "id":  "roasTarget",
        "fields":  [
                       {
                           "label":  "Spend ($)",
                           "key":  "spend",
                           "default":  500
                       },
                       {
                           "label":  "Target ROAS",
                           "key":  "targetRoas",
                           "default":  0.4
                       },
                       {
                           "label":  "Day window",
                           "key":  "day",
                           "default":  7
                       }
                   ]
    },
    {
        "description":  "Estimate budget for first-pass creative testing.",
        "name":  "Creative test budget",
        "id":  "testBudget",
        "fields":  [
                       {
                           "label":  "Expected CPI ($)",
                           "key":  "cpi",
                           "default":  0.6
                       },
                       {
                           "label":  "Installs per creative",
                           "key":  "installsPerCreative",
                           "default":  100
                       },
                       {
                           "label":  "Creative count",
                           "key":  "creatives",
                           "default":  5
                       }
                   ]
    }
]
'::jsonb, null, now()),
  ('checklists.json', 'json', '{
    "c01":  [
                "Write one Vietnamese explanation and one English term you learned from Day 1.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c02":  [
                "Write one Vietnamese explanation and one English term you learned from Day 2.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c03":  [
                "Write one Vietnamese explanation and one English term you learned from Day 3.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c04":  [
                "Write one Vietnamese explanation and one English term you learned from Day 4.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c05":  [
                "Write one Vietnamese explanation and one English term you learned from Day 5.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c06":  [
                "Write one Vietnamese explanation and one English term you learned from Day 6.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c07":  [
                "Write one Vietnamese explanation and one English term you learned from Day 7.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c08":  [
                "Write one Vietnamese explanation and one English term you learned from Day 8.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c09":  [
                "Write one Vietnamese explanation and one English term you learned from Day 9.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c10":  [
                "Write one Vietnamese explanation and one English term you learned from Day 10.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c11":  [
                "Write one Vietnamese explanation and one English term you learned from Day 11.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c12":  [
                "Write one Vietnamese explanation and one English term you learned from Day 12.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c13":  [
                "Write one Vietnamese explanation and one English term you learned from Day 13.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c14":  [
                "Write one Vietnamese explanation and one English term you learned from Day 14.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c15":  [
                "Write one Vietnamese explanation and one English term you learned from Day 15.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c16":  [
                "Write one Vietnamese explanation and one English term you learned from Day 16.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c17":  [
                "Write one Vietnamese explanation and one English term you learned from Day 17.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c18":  [
                "Write one Vietnamese explanation and one English term you learned from Day 18.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c19":  [
                "Write one Vietnamese explanation and one English term you learned from Day 19.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c20":  [
                "Write one Vietnamese explanation and one English term you learned from Day 20.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c21":  [
                "Write one Vietnamese explanation and one English term you learned from Day 21.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c22":  [
                "Write one Vietnamese explanation and one English term you learned from Day 22.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c23":  [
                "Write one Vietnamese explanation and one English term you learned from Day 23.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c24":  [
                "Write one Vietnamese explanation and one English term you learned from Day 24.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c25":  [
                "Write one Vietnamese explanation and one English term you learned from Day 25.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c26":  [
                "Write one Vietnamese explanation and one English term you learned from Day 26.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c27":  [
                "Write one Vietnamese explanation and one English term you learned from Day 27.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c28":  [
                "Write one Vietnamese explanation and one English term you learned from Day 28.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c29":  [
                "Write one Vietnamese explanation and one English term you learned from Day 29.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ],
    "c30":  [
                "Write one Vietnamese explanation and one English term you learned from Day 30.",
                "Add one insight to your Final UA Plan page.",
                "Decide whether this lesson changes product, creative, tracking, or budget assumptions."
            ]
}
'::jsonb, null, now()),
  ('cases.json', 'json', '[
    {
        "tags":  [
                     "prototype",
                     "retention"
                 ],
        "reason":  "Acquisition is promising, but retention signal suggests the first-session experience is leaking.",
        "metrics":  "CPI $0.42, CTR 1.8%, D1 22%, D7 4%, ARPDAU $0.03",
        "context":  "A puzzle game gets cheap installs from a broad audience, but users leave before level 4.",
        "title":  "Puzzle soft-launch with good CPI but weak D1",
        "recommendation":  "Iterate product onboarding before scaling."
    },
    {
        "tags":  [
                     "creative",
                     "scale"
                 ],
        "reason":  "Creative signal and retention both support a controlled scale test.",
        "metrics":  "IPM 18 vs account avg 7, CPI $0.65, D1 38%, early ROAS stable",
        "context":  "One combat-progress creative outperforms all economy-focused creatives.",
        "title":  "Idle RPG creative spike",
        "recommendation":  "Scale cautiously and make variants around the same player motivation."
    },
    {
        "tags":  [
                     "store",
                     "creative"
                 ],
        "reason":  "The ad hook creates interest, but the store listing breaks continuity.",
        "metrics":  "CTR 3.9%, CVR 11%, CPI $1.10, store screenshots old",
        "context":  "Ads get clicks, but the store page does not convert.",
        "title":  "Hyper-casual high CTR low CVR",
        "recommendation":  "Fix store promise before blaming ad network."
    },
    {
        "tags":  [
                     "live",
                     "budget"
                 ],
        "reason":  "Retention is not catastrophic, but payback math is not ready for scale.",
        "metrics":  "CPI $0.80, D7 retention 16%, D7 ROAS 8%, target 20%",
        "context":  "A newly live game has acceptable retention but weak monetization.",
        "title":  "Live game ROAS below target",
        "recommendation":  "Do not scale; test monetization/economy changes and lower-cost audiences."
    }
]
'::jsonb, null, now()),
  ('lessons/day-01.md', 'markdown', null, '---
day: 1
title: "UA mindset for Unity developers"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, CPI]
---

## Mục tiêu / Goal
Bài 1 tập trung vào **UA mindset**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
UA không phải là mua install càng rẻ càng tốt. UA là hệ thống học nhanh: ad promise tạo expectation, store page xác nhận promise, game onboarding chứng minh promise, và metrics cho biết promise đó có thật không.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **UA, Funnel, CPI**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Chọn một game bạn đang làm hoặc một game mẫu. Viết 3 giả thuyết: ai sẽ thích game, họ thích vì động lực nào, và quảng cáo nào có thể nói điều đó trong 3 giây đầu.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CPI chỉ là giá vào cửa; kết hợp với retention và LTV mới biết install đó có đáng mua không.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Chạy campaign trước khi biết câu hỏi cần học.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-02.md', 'markdown', null, '---
day: 2
title: "Mobile game market and genre fit"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype]
related_terms: [Genre-market fit, CPI, LTV]
---

## Mục tiêu / Goal
Bài 2 tập trung vào **Genre-market fit**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Mỗi genre có mặt bằng CPI, retention và monetization khác nhau. Puzzle, idle, RPG, hyper-casual và hybrid-casual không thể dùng cùng một benchmark hoặc creative promise.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Genre-market fit, CPI, LTV**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Lập bảng 5 competitor: genre, audience, monetization, hook store, và lý do người chơi quay lại.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Genre-market fit tốt khi traffic cost, retention expectation và monetization ceiling cùng hợp lý.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Chọn genre vì thích build, nhưng không kiểm tra khả năng mua traffic.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-03.md', 'markdown', null, '---
day: 3
title: "Paid, organic and store discovery"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [ASO, CTR, CVR]
---

## Mục tiêu / Goal
Bài 3 tập trung vào **Paid vs organic**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Paid UA tạo dữ liệu nhanh nhưng tốn tiền; organic/ASO chậm hơn nhưng giúp store conversion và brand signal. Hai phần này phải nói cùng một lời hứa.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ASO, CTR, CVR**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết một ad hook và một store subtitle cho cùng một promise. Nếu chúng lệch nhau, CVR thường giảm.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CTR đo ad interest, CVR đo store trust, IPM gom cả hai thành install efficiency.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Tối ưu ad riêng lẻ mà quên store page.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-04.md', 'markdown', null, '---
day: 4
title: "Player funnel from impression to payer"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Funnel, IPM, CVR]
---

## Mục tiêu / Goal
Bài 4 tập trung vào **Funnel**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Funnel mobile game bắt đầu từ impression, click, store view, install, first open, tutorial, session 2, purchase/ad impression. Mỗi bước rơi người dùng vì một nguyên nhân khác nhau.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Funnel, IPM, CVR**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Vẽ funnel 8 bước cho game của bạn và đánh dấu event Unity cần emit ở mỗi bước.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CVR từng bước giúp biết vấn đề nằm ở creative, store, onboarding hay product.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Nhìn tổng install mà không biết leak nằm ở đâu.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-05.md', 'markdown', null, '---
day: 5
title: "Soft launch strategy"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Soft launch, Retention, Cohort]
---

## Mục tiêu / Goal
Bài 5 tập trung vào **Soft launch**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Soft launch là controlled experiment, không phải launch nhỏ cho vui. Mục tiêu là kiểm tra product, tracking, store, creative và economics trước khi global scale.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Soft launch, Retention, Cohort**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Chọn 2 market test, budget giả định, success rule và kill rule cho 14 ngày soft launch.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
D1/D7 retention và early monetization là signal chính trước khi scale.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Soft launch mà không có decision rule từ trước.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-06.md', 'markdown', null, '---
day: 6
title: "UA channels and ad networks"
module: "Week 1 - UA fundamentals"
stages: [prototype, live]
related_terms: [Ad network, ROAS, Attribution]
---

## Mục tiêu / Goal
Bài 6 tập trung vào **Ad networks**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Meta, Google, Unity, AppLovin-style networks và rewarded inventory tối ưu theo signal khác nhau. Network là optimizer, không phải người hiểu game thay bạn. Nhiều network hiện vận hành bằng AI/machine-learning bidding và creative selection, nên input signal sạch quan trọng hơn việc chỉnh tay quá nhiều.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Ad network, ROAS, Attribution**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết input bạn sẽ đưa cho ad network: objective, event signal, creative set, country, budget cap.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
ROAS campaign chỉ đáng tin khi attribution và event quality đủ tốt.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Đổi network liên tục khi creative/event signal còn yếu.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-07.md', 'markdown', null, '---
day: 7
title: "Week 1 synthesis: first UA hypothesis"
module: "Week 1 - UA fundamentals"
stages: [idea, prototype, live]
related_terms: [UA, Funnel, Soft launch]
---

## Mục tiêu / Goal
Bài 7 tập trung vào **UA hypothesis**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Một UA hypothesis tốt nối audience, motivation, creative promise, store promise, product proof và metric decision. Đây là artifact quan trọng nhất sau tuần đầu.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **UA, Funnel, Soft launch**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết 1 hypothesis theo mẫu: For [audience], [creative hook] will drive [metric] because [motivation]. We will scale/stop if [rule].

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Một hypothesis không có metric và rule thì chưa test được.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Ghi mục tiêu mơ hồ như “tăng user” thay vì câu hỏi có thể kiểm chứng.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-08.md', 'markdown', null, '---
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

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-09.md', 'markdown', null, '---
day: 9
title: "CPI, CTR, CVR and IPM"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [CPI, CTR, CVR, IPM]
---

## Mục tiêu / Goal
Bài 9 tập trung vào **CPI CTR CVR IPM**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
CTR cao nghĩa là hook kéo click; CVR cao nghĩa là store thuyết phục; IPM cao nghĩa là impression biến thành install hiệu quả. CPI thấp có thể đến từ traffic kém chất lượng.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **CPI, CTR, CVR, IPM**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
So sánh 3 creative giả định và chọn creative đáng iterate dựa trên CTR, CVR, IPM, không chỉ CPI.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
IPM = installs / impressions * 1000.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Giữ creative CPI thấp nhưng retention quá yếu.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-10.md', 'markdown', null, '---
day: 10
title: "Retention and cohorts"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Retention, Cohort]
---

## Mục tiêu / Goal
Bài 10 tập trung vào **Retention cohorts**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Retention là kiểm tra core loop. Cohort giúp tránh trộn user từ campaign, ngày, build hoặc market khác nhau.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Retention, Cohort**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Định nghĩa cohort naming: install_date, country, campaign, creative_id, build_version.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
D1 phản ánh first-session/onboarding; D7 phản ánh habit và content depth.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
So D7 của cohort mới với D1 của cohort cũ rồi kết luận sai.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-11.md', 'markdown', null, '---
day: 11
title: "ARPDAU, LTV and payback"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ARPDAU, LTV, Payback window]
---

## Mục tiêu / Goal
Bài 11 tập trung vào **ARPDAU LTV**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
ARPDAU đo revenue intensity mỗi ngày; LTV ước tính tổng giá trị vòng đời. Beginner nên dùng rough estimate trước, rồi tinh chỉnh bằng cohort thực tế.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ARPDAU, LTV, Payback window**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Dùng calculator Rough LTV với 3 kịch bản conservative/base/aggressive.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
LTV rough = ARPDAU * average lifetime days.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Scale UA khi chưa biết LTV ceiling.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-12.md', 'markdown', null, '---
day: 12
title: "ROAS and decision windows"
module: "Week 2 - Metrics and measurement"
stages: [live]
related_terms: [ROAS, LTV, Payback window]
---

## Mục tiêu / Goal
Bài 12 tập trung vào **ROAS windows**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
ROAS cần window rõ: D0, D1, D7, D30. Game IAP thường payback dài hơn hyper-casual ads monetization, nên rule phải phù hợp genre.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ROAS, LTV, Payback window**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết target D7 và D30 ROAS giả định, kèm lý do vì sao window đó hợp game.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
ROAS = attributed revenue / spend.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
So sánh ROAS khác window hoặc khác attribution model.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-13.md', 'markdown', null, '---
day: 13
title: "Attribution, ATT, SKAN and signal loss"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Attribution, ATT, SKAN]
---

## Mục tiêu / Goal
Bài 13 tập trung vào **Attribution privacy**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
ATT, SKAN và signal loss làm user-level tracking kém đầy đủ. UA hiện đại cần aggregate thinking, conversion schema và decision rule chịu được dữ liệu trễ/thiếu.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Attribution, ATT, SKAN**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Liệt kê event nào thật sự cần cho early value signal trong 24-48h.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Attribution không phải sự thật tuyệt đối; nó là model hỗ trợ quyết định.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Thiết kế report như thể mọi user đều track được hoàn hảo.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-14.md', 'markdown', null, '---
day: 14
title: "Tracking plan for Unity games"
module: "Week 2 - Metrics and measurement"
stages: [prototype, live]
related_terms: [Event taxonomy, Attribution, Cohort]
---

## Mục tiêu / Goal
Bài 14 tập trung vào **Tracking plan**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Unity event taxonomy nên được thiết kế trước SDK implementation. Event tốt có tên ổn định, parameter ít nhưng có ý nghĩa, và gắn trực tiếp với funnel decision.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Event taxonomy, Attribution, Cohort**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết 10 event conceptual: install, first_open, tutorial_step, level_start, level_complete, fail, ad_impression, purchase, session_start, retention_marker.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Event completeness và consistency quan trọng hơn số lượng event.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Log quá nhiều event nhưng không biết event nào quyết định UA.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-15.md', 'markdown', null, '---
day: 15
title: "Creative strategy and ad hooks"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Creative testing, CTR, IPM]
---

## Mục tiêu / Goal
Bài 15 tập trung vào **Creative hooks**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Creative hook phải nói đúng player motivation: mastery, collection, competition, relaxation, chaos, fantasy, progression. Hook tốt không chỉ đẹp mà còn test được.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Creative testing, CTR, IPM**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Tạo 6 hook cho cùng một game, mỗi hook nhắm một motivation khác nhau.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CTR và IPM là early creative signal; retention kiểm tra ad có hứa sai không.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Làm nhiều video khác nhau nhưng cùng một angle, không học được gì mới.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-16.md', 'markdown', null, '---
day: 16
title: "Video, static and playable ads"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Playable ad, Creative testing, IPM]
---

## Mục tiêu / Goal
Bài 16 tập trung vào **Ad formats**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Static nhanh để test promise, video tốt cho fantasy/progression, playable tốt cho mechanics rõ. Format chọn theo learning goal và production cost.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Playable ad, Creative testing, IPM**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Chọn format cho 3 hypotheses: mechanic clarity, fantasy appeal, reward loop.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Playable có thể tăng intent nhưng tốn production và dễ misrepresent game nếu làm quá khác.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Dùng playable khi core loop thật chưa đủ rõ.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-17.md', 'markdown', null, '---
day: 17
title: "Creative test matrix"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [Creative testing, CTR, CVR]
---

## Mục tiêu / Goal
Bài 17 tập trung vào **Creative matrix**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Creative test matrix giúp mỗi variant trả lời một câu hỏi. Trục thường là hook, visual, first 3 seconds, CTA, character, reward, fail state hoặc progression.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Creative testing, CTR, CVR**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Tạo ma trận 4 hooks x 3 visual treatments, ghi learning goal cho từng nhóm.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Một test tốt thay đổi ít biến để biết nguyên nhân thắng/thua.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Thay hook, visual, CTA cùng lúc rồi không biết biến nào tạo kết quả.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-18.md', 'markdown', null, '---
day: 18
title: "ASO basics for game pages"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [ASO, CVR]
---

## Mục tiêu / Goal
Bài 18 tập trung vào **ASO**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
ASO cho game là store conversion system: icon tạo recognition, screenshots chứng minh promise, video preview giảm uncertainty, copy định vị audience.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ASO, CVR**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết store promise một dòng, rồi kiểm tra icon/screenshot/title có cùng promise không.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Store CVR thấp có thể làm CPI tăng dù ad CTR tốt.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Store page mô tả feature list thay vì player value.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-19.md', 'markdown', null, '---
day: 19
title: "Competitor teardown"
module: "Week 3 - Creative and store readiness"
stages: [idea, prototype, live]
related_terms: [Genre-market fit, ASO, Creative testing]
---

## Mục tiêu / Goal
Bài 19 tập trung vào **Competitor teardown**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Teardown competitor để hiểu market language, visual conventions, monetization expectation và creative angle. Mục tiêu là học pattern, không copy surface.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Genre-market fit, ASO, Creative testing**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Chọn 3 competitor và ghi: hook, audience, first screenshot, monetization clue, review complaint.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Competitor benchmark chỉ là context; game của bạn vẫn cần data riêng.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Copy top game mà không hiểu vì sao pattern đó hoạt động.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-20.md', 'markdown', null, '---
day: 20
title: "Creative fatigue and iteration"
module: "Week 3 - Creative and store readiness"
stages: [live]
related_terms: [Creative fatigue, CTR, ROAS]
---

## Mục tiêu / Goal
Bài 20 tập trung vào **Creative fatigue**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Creative fatigue xảy ra khi audience đã thấy quá nhiều, auction học xong, hoặc hook không còn mới. Cần pipeline iteration, không đợi performance chết mới làm asset.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Creative fatigue, CTR, ROAS**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Định nghĩa rule: khi CTR/IPM giảm bao nhiêu ngày thì refresh creative.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Fatigue thường thấy ở CTR/IPM giảm trước ROAS.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Tăng budget vào creative đã fatigue rồi kết luận network xấu.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-21.md', 'markdown', null, '---
day: 21
title: "Week 3 synthesis: store and creative readiness"
module: "Week 3 - Creative and store readiness"
stages: [prototype, live]
related_terms: [ASO, Creative testing, Soft launch]
---

## Mục tiêu / Goal
Bài 21 tập trung vào **Store creative readiness**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Trước khi spend, bạn cần creative set tối thiểu, store page consistent, tracking plan và decision rule. Đây là readiness gate, không phải checklist trang trí.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ASO, Creative testing, Soft launch**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Tạo readiness checklist gồm creative, ASO, events, budget, benchmark, kill rule.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Readiness tốt làm test đầu tiên học được điều gì đó ngay cả khi fail.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Launch test khi thiếu một mắt xích nên dữ liệu không action được.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-22.md', 'markdown', null, '---
day: 22
title: "Campaign structure for beginners"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Ad network, Campaign, ROAS]
---

## Mục tiêu / Goal
Bài 22 tập trung vào **Campaign structure**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Campaign beginner nên đơn giản: một objective, một market set, một nhóm creative có learning goal, budget cap rõ. Quá nhiều ad sets làm data loãng.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Ad network, Campaign, ROAS**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Thiết kế campaign structure đầu tiên cho soft launch 7 ngày.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Budget fragmentation khiến sample size mỗi creative không đủ.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Tạo quá nhiều campaign vì muốn kiểm tra mọi thứ cùng lúc.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-23.md', 'markdown', null, '---
day: 23
title: "Budget and sample size"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [CPI, Cohort, Payback window]
---

## Mục tiêu / Goal
Bài 23 tập trung vào **Budget sample size**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Sample size quyết định độ tin. Beginner không cần thống kê phức tạp, nhưng cần đủ install mỗi creative để tránh kết luận từ noise.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **CPI, Cohort, Payback window**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Dùng calculator Test Budget để tính ngân sách cho 5 creative, 100 install/creative.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Budget = expected CPI * installs per creative * creative count.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Kill creative sau 10 installs vì số liệu ban đầu xấu.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-24.md', 'markdown', null, '---
day: 24
title: "Reading campaign reports"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [CTR, IPM, Retention, ROAS]
---

## Mục tiêu / Goal
Bài 24 tập trung vào **Campaign reports**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Report cần tách creative signal, audience signal và product signal. Nếu CTR thấp, creative yếu; nếu CVR thấp, store mismatch; nếu retention thấp, product/onboarding hoặc ad promise sai.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **CTR, IPM, Retention, ROAS**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Đọc case report mẫu và ghi nguyên nhân có khả năng nhất.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
CTR, CVR, IPM, CPI, D1, ROAS đọc theo chuỗi, không đọc đơn lẻ.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Đổ lỗi cho product khi vấn đề thật nằm ở store conversion.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-25.md', 'markdown', null, '---
day: 25
title: "Scale, iterate or kill"
module: "Week 4 - Campaign operation"
stages: [live]
related_terms: [ROAS, Retention, Creative testing]
---

## Mục tiêu / Goal
Bài 25 tập trung vào **Scale iterate kill**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Scale khi creative, retention và economics cùng đủ tốt; iterate khi có một signal tốt và một bottleneck rõ; kill khi hypothesis không còn đường sửa hợp lý.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ROAS, Retention, Creative testing**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết 3 rule cụ thể: scale rule, iterate rule, kill rule cho game của bạn.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Rule phải viết trước campaign để giảm bias sau khi đã tốn tiền.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Scale vì thích creative thắng CTR nhưng D1/ROAS không ủng hộ.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-26.md', 'markdown', null, '---
day: 26
title: "Privacy and SDK risk awareness"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [ATT, SKAN, Event taxonomy]
---

## Mục tiêu / Goal
Bài 26 tập trung vào **SDK privacy risk**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Ad/analytics SDK là kiến trúc sản phẩm: tăng observability nhưng thêm privacy, build size, dependency, consent và store compliance risk. Unity dev cần plan trước khi tích hợp.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **ATT, SKAN, Event taxonomy**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Tạo SDK decision checklist: purpose, event list, consent, data retention, bundle/dependency risk.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Tracking quality phụ thuộc vào event taxonomy và consent reality.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Cài SDK trước, rồi mới hỏi event nào cần đo.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-27.md', 'markdown', null, '---
day: 27
title: "Post-mortem and learning log"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Cohort, Creative testing, UA]
---

## Mục tiêu / Goal
Bài 27 tập trung vào **Post-mortem**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
UA test thất bại vẫn có giá trị nếu ghi lại hypothesis, setup, result, interpretation và next action. Learning log giúp không lặp lại cùng sai lầm.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Cohort, Creative testing, UA**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Viết post-mortem 1 trang cho một campaign giả định fail.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Learning velocity quan trọng hơn số campaign đã chạy.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Chỉ lưu screenshot report mà không ghi decision.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-28.md', 'markdown', null, '---
day: 28
title: "Week 4 synthesis: operating rhythm"
module: "Week 4 - Campaign operation"
stages: [prototype, live]
related_terms: [Campaign, ROAS, Soft launch]
---

## Mục tiêu / Goal
Bài 28 tập trung vào **Operating cadence**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
UA rhythm cho team nhỏ nên cố định: weekly creative review, metric readout, product issue triage, next test plan. Cadence giúp UA gắn với development sprint.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Campaign, ROAS, Soft launch**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Thiết kế lịch tuần: Monday report, Tuesday creative brief, Wednesday implementation, Friday decision.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Cadence tốt biến UA thành input cho roadmap.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
UA và dev chạy hai luồng riêng, không feedback cho nhau.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-29.md', 'markdown', null, '---
day: 29
title: "Build your UA launch plan"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [UA, Soft launch, Event taxonomy]
---

## Mục tiêu / Goal
Bài 29 tập trung vào **Launch plan**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Final UA plan gom toàn bộ: game hypothesis, audience, target metrics, tracking, creative matrix, budget, success criteria, kill criteria. Đây là artifact để chạy test thật.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **UA, Soft launch, Event taxonomy**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Điền đủ 8 phần trong Final UA Plan, dùng dữ liệu giả định nếu chưa có game live.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Plan tốt có numbers, assumptions và decision rules.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Plan dài nhưng không chỉ ra hành động đầu tiên.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now()),
  ('lessons/day-30.md', 'markdown', null, '---
day: 30
title: "Review, risk and next actions"
module: "Capstone"
stages: [idea, prototype, live]
related_terms: [Payback window, ROAS, Retention]
---

## Mục tiêu / Goal
Bài 30 tập trung vào **Review risk**. Sau bài này, bạn không chỉ nhớ thuật ngữ mà phải tạo được một artifact nhỏ cho UA plan: giả thuyết, checklist, metric target, creative angle, tracking note hoặc decision rule. Với Unity dev, mục tiêu là hiểu UA như một hệ thống feedback giữa game build, analytics, store page và campaign, không phải một công việc marketing tách rời.

## Khái niệm chính / Core Idea
Ngày cuối là stress test. Bạn kiểm tra assumption yếu nhất, rủi ro đo lường, rủi ro creative, rủi ro product và bước tiếp theo nhỏ nhất có thể chạy.

Trong mobile game UA hiện nay, dữ liệu thường bị thiếu hoặc trễ vì privacy, attribution window và network optimization. Vì vậy người mới cần học cách ra quyết định bằng signal đủ tốt thay vì chờ dữ liệu hoàn hảo. Một bài học thực chiến luôn phải trả lời được: chúng ta đang test điều gì, metric nào chứng minh hoặc bác bỏ giả thuyết, và nếu kết quả xấu thì sửa creative, store, tracking hay product?

## English Terms You Should Keep
Các thuật ngữ liên quan hôm nay: **Payback window, ROAS, Retention**. Nên giữ tiếng Anh khi làm việc với dashboard, MMP, ad network hoặc tài liệu quốc tế, nhưng giải thích nội bộ bằng tiếng Việt để cả dev, designer và producer hiểu cùng một nghĩa. Ví dụ, khi nói CPI, đừng chỉ nói “giá install”; hãy nói rõ đó là media spend chia cho install và chưa chứng minh chất lượng user.

## Unity Dev Lens
Trong Unity, bạn quen nghĩ bằng systems: input, state, event, output. UA cũng vậy. Creative và store là input expectation; gameplay là runtime experience; analytics event là log; dashboard là debugger; UA decision là patch hoặc rollback. Nếu game không emit đúng event, marketer giống như debug build không có log. Nếu ad promise khác gameplay, retention giảm giống như tutorial dạy sai control.

## Practical Lab
Review Final UA Plan và đánh dấu 3 rủi ro lớn nhất cùng mitigation.

Cách làm: viết câu trả lời ngắn trong Final UA Plan, rồi tự hỏi “nếu ngày mai có report campaign, mình sẽ nhìn metric nào trước?”. Nếu không trả lời được, artifact của bạn vẫn còn quá mơ hồ.

## Metric Focus
Next action phải nhỏ, đo được, và có deadline.

Không nên đọc metric đơn lẻ. CPI rẻ nhưng D1 thấp thường là traffic hoặc ad promise sai. CTR cao nhưng CVR thấp thường là store mismatch. D1 tốt nhưng ROAS thấp có thể là monetization/economy hoặc payback window chưa đủ dài. Beginner nên tập đọc chuỗi nguyên nhân trước khi tối ưu dashboard.

## Common Mistake
Kết thúc khóa với kiến thức nhưng không có experiment tiếp theo.

Cách tránh: luôn viết hypothesis và decision rule trước khi chạy test. Sau khi có data, chỉ được thay đổi kết luận nếu bạn ghi rõ assumption nào sai và bằng chứng nào mới xuất hiện.

## Update Your Final UA Plan
- Ghi 1 insight cụ thể từ bài này.
- Ghi 1 metric hoặc checklist item liên quan.
- Ghi 1 quyết định sẽ làm khác trong game, creative, store, tracking hoặc budget.
- Nếu chưa có game, dùng một sample game: casual puzzle, idle RPG hoặc hybrid-casual runner.

> Practical rule: một bài học UA tốt phải để lại decision artifact, không chỉ để lại cảm giác “đã hiểu”.', now())
on conflict (content_key) do update set
  content_type = excluded.content_type,
  json_content = excluded.json_content,
  text_content = excluded.text_content,
  updated_at = now();

commit;
