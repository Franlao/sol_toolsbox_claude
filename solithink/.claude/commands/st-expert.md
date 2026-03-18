---
name: st-expert
description: "Launch a specific soliThink expert on demand for deep-dive analysis"
---

# soliThink — Expert On-Demand

## Mission
Launch a single expert for a deep-dive analysis on a specific aspect of the project.

## Arguments

`$ARGUMENTS` should contain the expert name:
- `product` → Product Thinker
- `architect` → Software Architect
- `frontend` → Frontend Expert
- `backend` → Backend Expert
- `devops` → DevOps Expert
- `security` → Security Expert
- `qa` → QA Expert
- `ai` → AI/LLM Expert

If no argument is provided, list all available experts and ask the user which one to launch.

## Execution

1. Read `.solithink/state.json` for the idea
2. Read `.solithink/plan.md` or `.solithink/debate-summary.md` if they exist (for additional context)
3. Launch the requested expert agent with `mode: "bypassPermissions"`
4. The expert writes/updates their analysis to `.solithink/experts/<role>.md`
5. Present the expert's findings to the user

## Use Cases

- Deep-dive after the plan is done: "I want more detail on the security approach"
- Second opinion: "Re-analyze the backend with a GraphQL focus instead of REST"
- New angle: "What would the AI expert say about adding LLM-powered search?"

The expert has access to all existing analyses and the plan, so it can build on previous work rather than starting from scratch.