# Asset Scorecard Template

## Identity

- Repo: `pbakaus/impeccable`
- Asset: `impeccable`
- Path: `source/skills/impeccable/SKILL.md`
- Asset type: skill
- Primary domain: design
- Secondary tags: `frontend`, `anti-pattern-heavy`, `command-system`, `context-driven`

## Purpose

- What this asset is supposed to do:
  - provide a high-quality design intelligence layer for frontend work, including planning, critique, audits, refinement, and live iteration
- When it should trigger:
  - any frontend design, redesign, or UI improvement task
- What it should produce:
  - design decisions, audits, refinements, and command-routed UI work grounded in project context

## Workflow Shape

- Entry conditions:
  - UI or frontend-oriented request
- Main steps:
  - context gathering from `PRODUCT.md` and optionally `DESIGN.md`
  - register selection: `brand` or `product`
  - apply shared design laws
  - route to the matching command or general design invocation
  - optionally pin shortcuts
- Exit conditions:
  - command-specific completion
- Handoffs:
  - command references such as `audit`, `critique`, `polish`, `shape`, `craft`
- State written:
  - indirect through `teach`, `document`, and pinning
- Files generated:
  - `PRODUCT.md`
  - `DESIGN.md`
  - optional pinned shortcuts

## Runtime Fit

- Intended runtime:
  - multiple providers including Codex
- Codex fit:
  - strong
- Required tools:
  - file access
  - optional `npx impeccable *`
- Browser dependency:
  - optional for `live`
- Test dependency:
  - no
- External service dependency:
  - no

## Guardrails

- Scope control:
  - strong
- Verification requirements:
  - moderate
- Anti-pattern warnings:
  - very strong
- User approval gates:
  - medium

## Strengths

- excellent design vocabulary
- strong context discipline
- clear routing model
- powerful anti-pattern system
- unusually mature for Codex-compatible design work

## Weaknesses

- context setup is mandatory enough that casual users may skip it and get degraded output
- strong style influence can oversteer if used without boundaries

## Conflict Notes

- With orchestration assets:
  - low
- With design assets:
  - medium, especially with other strong anti-slop design systems
- With tone / writing rules:
  - low to medium, because it shapes UX copy as part of UI work

## Static Score

- Instruction Architecture: `15/15`
- Workflow Completeness: `11/12`
- Guardrails And Failure Prevention: `11/12`
- Verification Design: `8/10`
- Artifact Contract Clarity: `9/10`
- Codex Compatibility: `9/10`
- Composability: `7/8`
- Customization Model: `8/8`
- Tooling / Runtime Burden: `4/5`
- Maintainability: `4/5`
- Validation Assets And Examples: `5/5`

- Total: `91/100`

## Decision

- Adopt:
  - yes, conditionally
- Adapt:
  - maybe
- Fork:
  - possible
- Reference only:
  - no
- Reject:
  - no

- Reason:
  - This is the strongest static asset in this batch. It should advance to live testing immediately, especially on design benchmark tasks.
