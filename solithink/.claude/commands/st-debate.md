---
name: st-debate
description: "soliThink Phase 2 — Experts confront findings, resolve contradictions"
---

# soliThink — DEBATE Phase (Expert Confrontation)

## Pre-check
Read `.solithink/state.json`. Verify phase is `DEBATE`.

## Mission
You are the **soliThink Moderator**. Read all expert analyses, identify contradictions and tensions, then resolve them through structured debate.

## Step 1: Read All Expert Analyses

Read every file in `.solithink/experts/`. Build a mental map of:
- What each expert recommends
- Where experts AGREE (consensus)
- Where experts DISAGREE (tensions)
- What experts MISSED that another expert caught

## Step 2: Identify Tensions

Common tensions to look for:

| Tension | Example |
|---------|---------|
| **Scope vs Speed** | Product wants 10 features, Architect says too complex for MVP |
| **Security vs UX** | Security wants MFA, Product says it adds friction |
| **Scale vs Cost** | Architect wants microservices, DevOps says monolith is cheaper |
| **Quality vs Speed** | QA wants 80% coverage, timeline says ship fast |
| **AI vs Simplicity** | AI expert proposes LLM features, Backend says unnecessary complexity |
| **Frontend heaviness** | Frontend wants SPA with animations, Performance says SSR is better |

## Step 3: Resolve Each Tension

For each contradiction, write a resolution:

```markdown
### Tension: <description>

**Expert A says**: <position>
**Expert B says**: <position>

**Resolution**: <your decision with justification>
**Trade-off accepted**: <what we sacrifice and why it's OK>
```

Rules for resolving:
- **MVP scope wins** over feature richness — ship something first
- **Simplicity wins** over elegance — unless the user explicitly asked for scale
- **Security is non-negotiable** for user data — but can be simplified for internal tools
- **The user's original idea is the tiebreaker** — always refer back to what they actually asked

## Step 4: Write Debate Summary

Write `.solithink/debate-summary.md`:

```markdown
# soliThink Debate Summary

## Idea
<restated idea>

## Consensus (all experts agree)
- <point>
- <point>

## Resolved Tensions
### 1. <tension title>
<resolution>

### 2. <tension title>
<resolution>

## Key Decisions Made
| Decision | Justification | Expert(s) who influenced |
|----------|--------------|------------------------|
| <decision> | <why> | <who> |

## Risks Identified (cross-expert)
| Risk | Severity | Mitigation | Flagged by |
|------|----------|------------|-----------|
| <risk> | High/Med/Low | <action> | <expert> |

## Recommended Stack
| Layer | Choice | Justification |
|-------|--------|---------------|
| <layer> | <tech> | <why this over alternatives> |
```

## Step 5: Update State

1. Update `.solithink/state.json`:
   - Set `phase` to `PLAN`
   - Set `debate_resolved` to `true`
   - Update `last_updated_at`

2. Present the debate summary to the user

3. Say: "Debate resolved. Run `/project:st-plan` to generate the final actionable plan."
