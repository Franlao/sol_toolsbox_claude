---
name: sol-autoloop-status
description: "Show AutoLoop progress — scores, changes kept/reverted, trends"
---

# Sol AutoLoop — Status

## Mission
Show the current state of an AutoLoop run.

## Execution

1. Read `.autoloop/log.tsv`
2. Read `.autoloop/summary.md` if it exists
3. Read git log for `autoloop:` commits

Display:

```
╔══════════════════════════════════════════════╗
║           SOL AUTOLOOP STATUS                ║
╠══════════════════════════════════════════════╣
║ Target:      <target description>            ║
║ Iterations:  <completed> / <max or ∞>        ║
║ Score:       <baseline> → <current> (+<Δ>)   ║
║ Kept:        <count> changes                 ║
║ Reverted:    <count> changes                 ║
║ Streak:      <consecutive keeps or reverts>  ║
╚══════════════════════════════════════════════╝

Score Trend: <baseline> → ... → <current>

Recent iterations:
  #5  KEEP    +3  "Add self-critique step to br-developer"
  #6  REVERT  -2  "Add verbose logging instructions"
  #7  KEEP    +5  "Add dependency manifest check rule"
```

If the loop is stuck (5+ reverts), suggest:
- "Try `/project:sol-autoloop skill:<name>` with a different focus area"
- "Or give the loop a hint: what specific aspect should it improve?"