# Asset Scorecard Template

## Identity

- Repo: `Yeachan-Heo/oh-my-codex`
- Asset: `deep-interview`
- Path: `skills/deep-interview/SKILL.md`
- Asset type: skill
- Primary domain: orchestration
- Secondary tags: `clarification`, `planning`, `stateful`, `multi-step`

## Purpose

- What this asset is supposed to do:
  - convert vague requests into execution-ready clarified scope through structured questioning and ambiguity reduction
- When it should trigger:
  - unclear or high-risk work
- What it should produce:
  - clarified requirements, explicit non-goals and decision boundaries, and handoff readiness

## Workflow Shape

- Entry conditions:
  - ambiguity, missing boundaries, or explicit request for deeper clarification
- Main steps:
  - preflight context intake
  - brownfield exploration
  - one-question-per-round interview
  - ambiguity scoring
  - readiness gates
  - handoff to downstream lane
- Exit conditions:
  - ambiguity below threshold plus readiness gates satisfied
- Handoffs:
  - `$ralplan`
  - `$autopilot`
  - `$ralph`
  - `$team`
- State written:
  - OMX mode state and context snapshots
- Files generated:
  - `.omx/context/...`

## Runtime Fit

- Intended runtime:
  - OMX inside Codex CLI
- Codex fit:
  - conceptually strong, operationally dependent on OMX-owned question flow
- Required tools:
  - `omx question`
  - state persistence
- Browser dependency:
  - no
- Test dependency:
  - no
- External service dependency:
  - no

## Guardrails

- Scope control:
  - very strong
- Verification requirements:
  - moderate
- Anti-pattern warnings:
  - strong
- User approval gates:
  - strong through thresholds and decision-boundary checks

## Strengths

- unusually rigorous clarification design
- explicit readiness gates
- good anti-ambiguity pressure
- strong brownfield awareness

## Weaknesses

- operational complexity is high
- depends on OMX-specific structured question tooling
- can be heavier than necessary for lighter work

## Conflict Notes

- With orchestration assets:
  - medium to high, especially against other mandatory planning systems
- With design assets:
  - low
- With tone / writing rules:
  - low

## Static Score

- Instruction Architecture: `14/15`
- Workflow Completeness: `11/12`
- Guardrails And Failure Prevention: `11/12`
- Verification Design: `7/10`
- Artifact Contract Clarity: `8/10`
- Codex Compatibility: `6/10`
- Composability: `5/8`
- Customization Model: `7/8`
- Tooling / Runtime Burden: `2/5`
- Maintainability: `4/5`
- Validation Assets And Examples: `3/5`

- Total: `78/100`

## Decision

- Adopt:
  - no
- Adapt:
  - yes
- Fork:
  - yes
- Reference only:
  - possible
- Reject:
  - no

- Reason:
  - One of the strongest clarification workflows statically, but too dependent on OMX runtime machinery to adopt unmodified in this workspace.
