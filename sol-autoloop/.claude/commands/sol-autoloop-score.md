---
name: sol-autoloop-score
description: "Score a skill or file against the quality rubric without modifying it"
---

# Sol AutoLoop — Score Only

## Mission
Score a target without modifying it. Useful for benchmarking before starting a loop or comparing skills.

## Arguments

`$ARGUMENTS` should contain the target:
- `"skill:solithink"` → score the soliThink skill
- `"skill:bmad-ralph"` → score BMAD-Ralph
- `"file:path/to/file.md"` → score a single file

## Execution

1. Identify and read all target files
2. Launch the scorer agent (`sol-scorer`) with `mode: "bypassPermissions"`
3. Present the full scorecard to the user

No changes are made. This is read-only.
