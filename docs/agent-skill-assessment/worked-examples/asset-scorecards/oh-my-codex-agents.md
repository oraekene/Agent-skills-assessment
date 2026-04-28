# Asset Scorecard Template

## Identity

- Repo: `Yeachan-Heo/oh-my-codex`
- Asset: `AGENTS.md`
- Path: `AGENTS.md`
- Asset type: AGENTS file
- Primary domain: orchestration
- Secondary tags: `multi-agent`, `session-contract`, `Codex-native`, `stateful`

## Purpose

- What this asset is supposed to do:
  - define the top-level operating contract for a Codex session running with OMX
- When it should trigger:
  - continuously, as the global instruction layer
- What it should produce:
  - disciplined routing behavior, mode selection, delegation rules, and verification norms

## Workflow Shape

- Entry conditions:
  - OMX is active or its AGENTS file is loaded
- Main steps:
  - establish direct-work default
  - route to skills when keywords or task shape demand it
  - constrain child-agent usage
  - require verification and final reporting
- Exit conditions:
  - none, this is persistent session policy
- Handoffs:
  - `$deep-interview`
  - `$ralplan`
  - `$team`
  - `$ralph`
- State written:
  - indirect, via OMX runtime and downstream skills
- Files generated:
  - none directly

## Runtime Fit

- Intended runtime:
  - Codex CLI with OMX
- Codex fit:
  - structurally excellent, environment-sensitive
- Required tools:
  - OMX runtime surfaces
- Browser dependency:
  - no
- Test dependency:
  - indirect
- External service dependency:
  - no

## Guardrails

- Scope control:
  - strong
- Verification requirements:
  - strong
- Anti-pattern warnings:
  - present
- User approval gates:
  - moderate; tends to proceed automatically unless the action is destructive or ambiguous

## Strengths

- strong operating contract
- clear lane selection
- good delegation discipline
- explicit verification expectations

## Weaknesses

- heavy global influence
- high risk of collision with another top-level workspace contract
- best in an OMX-owned runtime, less clean as a drop-in file elsewhere

## Conflict Notes

- With orchestration assets:
  - high conflict with other full-session workflow systems
- With design assets:
  - low direct conflict
- With tone / writing rules:
  - medium, because it shapes response style and execution posture globally

## Static Score

- Instruction Architecture: `13/15`
- Workflow Completeness: `10/12`
- Guardrails And Failure Prevention: `10/12`
- Verification Design: `8/10`
- Artifact Contract Clarity: `7/10`
- Codex Compatibility: `7/10`
- Composability: `4/8`
- Customization Model: `6/8`
- Tooling / Runtime Burden: `2/5`
- Maintainability: `4/5`
- Validation Assets And Examples: `3/5`

- Total: `74/100`

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
  - Strong orchestration guidance, but too global and environment-bound to install blindly into this workspace. Best treated as a pattern source or adapted top-level contract.
