---
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
![Hero visual: fatigue decision tree](content/assets/usecases/day-20-hero-diagram.svg)Type: hero operating diagram.
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
![Weekly cadence board](content/assets/usecases/day-20-data-visual.svg)Type: data visual/chart or decision board.
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
