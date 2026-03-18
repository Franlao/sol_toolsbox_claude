---
name: st-plan
description: "soliThink Phase 3 — Generate the final actionable plan from debate resolution"
---

# soliThink — PLAN Phase (Final Deliverable)

## Pre-check
Read `.solithink/state.json`. Verify phase is `PLAN` and `debate_resolved` is `true`.

## Mission
Generate the **final actionable plan** that synthesizes all expert analyses and debate resolutions into a single, concrete document. This plan should be detailed enough to either hand to a dev team or feed directly into BMAD-Ralph.

## Input
Read:
- `.solithink/state.json` (original idea)
- `.solithink/experts/*.md` (all expert analyses)
- `.solithink/debate-summary.md` (resolved tensions and decisions)

## Generate Plan

Write `.solithink/plan.md`:

```markdown
# soliThink Plan: <project name>

## 1. Vision
### What we're building
<1 paragraph — concrete, not abstract>

### What we're NOT building (explicit scope boundaries)
<bullet list of out-of-scope items to prevent scope creep>

### Success criteria
<3-5 measurable outcomes>

## 2. Target Users
<personas from Product Thinker, refined by debate>

## 3. Core Features (MVP)
For each feature:
- **F1: <name>** — <one-line description>
  - User value: <why users need this>
  - Technical approach: <how, from Architect>
  - Complexity: S/M/L
  - Priority: P0/P1/P2

## 4. Technical Architecture
### Stack
| Layer | Technology | Justification |
|-------|-----------|---------------|
<from debate resolution>

### High-Level Architecture
<text diagram or description of components and how they connect>

### Data Model (key entities)
| Entity | Key Fields | Relationships |
|--------|-----------|--------------|

### API Surface (key endpoints)
| Method | Path | Description |
|--------|------|------------|

## 5. Frontend Plan (if applicable)
- Key pages/screens
- Component strategy
- State management approach
- Responsive/mobile strategy

## 6. Backend Plan (if applicable)
- Service architecture (monolith vs micro)
- Auth strategy
- External integrations
- Caching strategy

## 7. Infrastructure & DevOps
- Hosting recommendation
- CI/CD approach
- Environment strategy (dev/staging/prod)
- Estimated monthly cost range

## 8. Security Plan
- Authentication method
- Authorization model
- Data protection approach
- Key OWASP considerations

## 9. Testing Strategy
- Unit test approach
- Integration test approach
- E2E test approach (if applicable)
- Target coverage

## 10. AI/LLM Integration (if applicable)
- What AI features are planned
- Model selection and justification
- Cost estimation per request
- Fallback strategy if AI is unavailable

## 11. Risks & Mitigations
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|-----------|
<consolidated from all experts>

## 12. Implementation Roadmap
### Sprint 1-2 (MVP)
<what gets built first and why>

### Sprint 3-4 (V1)
<what comes next>

### Future (V2+)
<deferred features>

## 13. Estimated Effort
- Total sprints: <number>
- Key dependencies: <external services, APIs, etc.>
- Biggest technical risk: <from debate>
- Recommended team composition: <roles needed>
```

## Plan Quality Checklist

Before finalizing, verify:
- [ ] Every feature traces back to a user need (not invented)
- [ ] The stack matches the project's actual complexity (not over-engineered)
- [ ] Security is addressed for every user-facing surface
- [ ] The MVP scope is genuinely minimal — could ship and be useful
- [ ] Risks are concrete, not generic placeholders
- [ ] The plan stays faithful to the original idea (no scope inflation)

## After Completion

1. Update `.solithink/state.json`:
   - Set `phase` to `DONE`
   - Set `plan_ready` to `true`
   - Update `last_updated_at`

2. Present the full plan to the user

3. Say: "Plan complete. You can:
   - Review and ask me to adjust any section
   - Run `/project:st-expert <name>` to deep-dive a specific domain
   - Run `/project:st-to-bmad` to convert this into a BMAD-Ralph project and start building"