---
name: st-to-bmad
description: "Convert soliThink plan into a BMAD-Ralph project — bridge thinking to building"
---

# soliThink → BMAD-Ralph Export

## Pre-check
1. Read `.solithink/state.json`. Verify `plan_ready` is `true`.
2. Verify BMAD-Ralph is installed: check if `.claude/commands/br-init.md` exists.
   - If not: say "BMAD-Ralph skill not installed. Install it first with: `bash ~/bmad-ralph-skill/install.sh --project`"

## Mission
Convert the soliThink plan into BMAD-Ralph project files, skipping the DISCOVER and PLAN phases (soliThink already did that work, but better).

## Step 1: Create BMAD-Ralph State

Create `.bmad-ralph/` directory structure and `state.json` with phase set to `ARCHITECT` (skip DISCOVER and PLAN since soliThink's output is superior).

```json
{
  "project": {
    "name": "<from plan>",
    "description": "<original idea>",
    "base_branch": "<current git branch>"
  },
  "phase": "ARCHITECT",
  "phases_completed": ["DISCOVER", "PLAN"],
  "current_sprint": 0,
  "total_sprints": 0,
  "deliverables": {
    "business_brief": ".bmad-ralph/docs/business-brief.md",
    "prd": ".bmad-ralph/docs/prd.md"
  },
  "metrics": {
    "stories_total": 0,
    "stories_completed": 0
  },
  "created_at": "<timestamp>",
  "last_updated_at": "<timestamp>",
  "source": "solithink"
}
```

## Step 2: Convert soliThink Plan → BMAD Business Brief

Read `.solithink/plan.md` and `.solithink/debate-summary.md`.

Write `.bmad-ralph/docs/business-brief.md` containing:
- Executive Summary (from plan Vision)
- Problem Statement (from plan)
- User Personas (from plan Target Users)
- Competitive Landscape (from Product Thinker analysis)
- Technical Assessment (from debate-resolved stack decisions)
- Risks & Mitigations (from plan)
- Recommended Approach (from plan Implementation Roadmap)

## Step 3: Convert soliThink Plan → BMAD PRD

Read `.solithink/plan.md`.

Write `.bmad-ralph/docs/prd.md` following the standard BMAD PRD format:
- Convert Features → User Stories with acceptance criteria
- Convert Technical Architecture → Data Model + API Surface sections
- Convert Implementation Roadmap → Release Plan
- Set priorities based on plan's P0/P1/P2

## Step 4: Copy Architecture Hints

Write `.bmad-ralph/docs/solithink-architecture-hints.md` with:
- The full stack recommendation from the debate
- The data model from the plan
- The API surface from the plan
- Security requirements from the Security Expert

This file gives the BMAD Architect (`/project:br-architect`) a massive head start.

## Step 5: Done

Say:
```
soliThink → BMAD-Ralph export complete!

Created:
  .bmad-ralph/docs/business-brief.md  (from soliThink expert analyses)
  .bmad-ralph/docs/prd.md             (from soliThink plan)
  .bmad-ralph/docs/solithink-architecture-hints.md

BMAD-Ralph is set to ARCHITECT phase (DISCOVER + PLAN skipped).
Run /project:br-architect to design the full architecture, informed by soliThink's expert panel.
```