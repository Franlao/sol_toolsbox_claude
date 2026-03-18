---
name: st-think
description: "soliThink Phase 1 — Launch expert panel analysis in parallel"
---

# soliThink — THINK Phase (Multi-Expert Analysis)

## Pre-check
Read `.solithink/state.json`. Verify phase is `THINK`.

## Mission
Launch **up to 8 domain experts in parallel** to analyze the idea from every angle. Each expert is deeply knowledgeable in their field (informed by roadmap.sh best practices).

## Expert Selection

First, read the idea from `.solithink/state.json`. Then select which experts are RELEVANT:

- Not every idea needs all 8 experts
- A CLI tool doesn't need a Frontend Expert
- A static site doesn't need a Backend Expert
- An internal tool doesn't need a Security Expert (or maybe it does — use judgment)

**Always include**: Product Thinker + Software Architect (these are mandatory for any project)

## Launch Experts

Use the Agent tool to launch selected experts **simultaneously** in a single message. Set `mode: "bypassPermissions"` on all calls.

Each agent receives this context:
```
Read .solithink/state.json for the project idea.
You are the <Role> expert. Analyze this idea ONLY from your domain perspective.
Be specific, opinionated, and concrete. No generic advice.
Reference current best practices from your field (2026 standards).
Write your analysis to .solithink/experts/<role>.md
```

### Available Experts

| Agent | File | When to include |
|-------|------|----------------|
| `st-product` | Product Thinker | ALWAYS |
| `st-architect` | Software Architect | ALWAYS |
| `st-frontend` | Frontend Expert | Web/mobile UI exists |
| `st-backend` | Backend Expert | API/server logic exists |
| `st-devops` | DevOps Expert | Needs deployment/infra |
| `st-security` | Security Expert | Handles user data, auth, or payments |
| `st-qa` | QA Expert | Non-trivial logic to test |
| `st-ai` | AI/LLM Expert | AI features or LLM integration |

## After All Experts Complete

1. Read all expert analyses from `.solithink/experts/*.md`
2. Update `.solithink/state.json`:
   - Set `phase` to `DEBATE`
   - List all experts consulted in `experts_consulted`
   - Update `last_updated_at`
3. Present a brief summary of each expert's key finding (2-3 lines each)
4. Say: "Expert analysis complete. Run `/project:st-debate` to resolve contradictions and synthesize."
