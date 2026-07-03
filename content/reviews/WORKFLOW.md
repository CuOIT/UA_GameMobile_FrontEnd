# Lesson Review Flow

## Files
- `content/reviews/outputs/day-XX.review-1.md`: 9Router round-1 review.
- `content/reviews/outputs/day-XX.codex-rebuttal.md`: Codex acceptance/rejection note after reading round 1.
- `content/reviews/outputs/day-XX.review-2.md`: 9Router round-2 review of the Codex note.
- `content/reviews/outputs/day-XX.final-decision.md`: Codex final decision before editing the lesson.

## Commands
```bash
node scripts/review-lesson-9router.mjs --day 4 --round review-1 --model xai/grok-code-fast-1
node scripts/review-lesson-round2-9router.mjs --day 4 --review-file content/reviews/outputs/day-04.review-1.md --codex-file content/reviews/outputs/day-04.codex-rebuttal.md --round review-2 --model xai/grok-code-fast-1
```

## Codex note format
Use this structure in `day-XX.codex-rebuttal.md`:

```md
## Verdict

## Accept Now
- ...

## Reject or Defer
- ...

## Lesson Edits To Apply
- ...

## Final Editing Stance
```
