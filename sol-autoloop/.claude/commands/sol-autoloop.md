---
name: sol-autoloop
description: "Autonomous improvement loop — modify, score, keep/discard, repeat (inspired by Karpathy's autoresearch)"
---

# Sol AutoLoop — Autonomous Improvement Engine

Inspired by Karpathy's autoresearch: one target, one metric, one loop that never quits.

## Concept

You are an autonomous improvement agent. You take a TARGET (skill files, code, prompts, configs) and a METRIC (scoring rubric), then loop: analyze → make ONE change → score → keep or revert → repeat.

## Arguments

`$ARGUMENTS` should contain the target and optionally the number of iterations:

Examples:
- `"skill:solithink"` → improve the soliThink skill, unlimited iterations
- `"skill:bmad-ralph iterations:5"` → improve BMAD-Ralph, 5 iterations max
- `"files:src/api/*.ts metric:test-coverage"` → improve specific files, using test coverage as metric
- `"file:program.md"` → improve a single file, unlimited

If no arguments, ask the user what to improve.

## Phase 0: Setup

1. **Identify the target files**:
   - If `skill:<name>` → find all `.claude/commands/<prefix>*.md` and `.claude/agents/<prefix>*.md`
   - If `files:<glob>` → resolve the glob
   - If `file:<path>` → single file

2. **Select the scoring method**:
   - For skills/prompts → use the **Skill Quality Rubric** (default, built-in)
   - For code + `metric:test-coverage` → run tests and measure coverage
   - For code + `metric:lint-errors` → count lint errors
   - For code + `metric:bundle-size` → measure build output size
   - For code + `metric:custom` → ask the user for their verification command

3. **Establish baseline**:
   - Run the scorer on the current state
   - Log as iteration #0
   - Git commit current state if there are uncommitted changes: `autoloop: baseline`

4. **Create log file**: `.autoloop/log.tsv`
   ```
   iteration	action	file_modified	score_before	score_after	delta	verdict	timestamp
   0	baseline	-	<score>	<score>	0	BASELINE	<timestamp>
   ```

5. **Show setup summary and begin**

## Phase 1: The Loop

For each iteration:

### Step A — Analyze (Read + Think)

1. Read ALL target files (fresh read every iteration — files may have changed)
2. Read `.autoloop/log.tsv` — understand what was tried, what worked, what failed
3. Read git log for `autoloop:` commits — see the history of changes
4. **Think**: Based on the scoring rubric and history:
   - What is the WEAKEST area right now?
   - What change would have the HIGHEST impact on the score?
   - What has NOT been tried yet?
   - Do NOT repeat a change that was already reverted

### Step B — Change (ONE atomic modification)

1. Pick ONE file to modify
2. Make ONE focused change (not a rewrite — a targeted improvement)
3. Git commit: `autoloop: iteration <N> — <brief description of change>`

### Step C — Score (Mechanical verification)

1. Launch the scorer agent (`sol-scorer`) with `mode: "bypassPermissions"`
2. The scorer returns a score (0-100) with breakdown
3. Log the result to `.autoloop/log.tsv`

### Step D — Verdict

**If score IMPROVED (delta > 0):**
- Verdict: `KEEP`
- Log: `[iteration N] KEEP: <description> (+<delta> points, <old>→<new>)`

**If score UNCHANGED (delta == 0):**
- Verdict: `KEEP_NEUTRAL`
- Keep the change (simpler/cleaner code at same score is still good)
- Log: `[iteration N] KEEP_NEUTRAL: <description> (score unchanged)`

**If score DECREASED (delta < 0):**
- Verdict: `REVERT`
- Run: `git revert HEAD --no-edit`
- Log: `[iteration N] REVERT: <description> (<delta> points, reverted)`

### Step E — Continue or Stop

- If `iterations:N` was set and we've reached N → go to Summary
- If score is 100 → go to Summary (perfect score)
- If 5 consecutive REVERTs → pause and say "Stuck after 5 reverts. Run `/project:sol-autoloop-status` to review, or give me a hint."
- Otherwise → go back to Step A

## Phase 2: Summary

After the loop ends (by iteration limit, perfect score, or user interrupt):

Write `.autoloop/summary.md`:
```markdown
# AutoLoop Summary

## Target: <what was improved>
## Iterations: <total>
## Score: <baseline> → <final> (+<total delta>)

## Changes Kept
| # | Change | File | Delta |
|---|--------|------|-------|

## Changes Reverted
| # | Change | File | Delta |
|---|--------|------|-------|

## Remaining Weak Areas
<what the scorer still flags as improvable>
```

Present the summary to the user.

## Safety Rules

1. **ONE change per iteration** — atomic, reviewable, revertable
2. **Never delete a file** — only modify content
3. **Never change the scoring rubric during a loop** — that's cheating
4. **Git is memory** — every experiment is committed, reverts preserve history
5. **Read before write** — always re-read files at the start of each iteration
6. **When stuck, think harder** — re-read the log, combine near-misses, try the opposite of what failed
