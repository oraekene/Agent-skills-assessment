# Asset Scorecard Template

## Identity

- Repo: `obra/superpowers`
- Asset: `test-driven-development`
- Path: `skills/test-driven-development/SKILL.md`
- Asset type: skill
- Primary domain: coding
- Secondary tags: `testing`, `verification`, `discipline`, `behavior-first`

## Purpose

- What this asset is supposed to do:
  - enforce strict red-green-refactor TDD for implementation work
- When it should trigger:
  - implementation of features, bug fixes, refactors, behavior changes
- What it should produce:
  - behavior-first tests, minimal implementation, refactored verified code

## Workflow Shape

- Entry conditions:
  - implementation or bug-fix work
- Main steps:
  - write one failing test
  - verify it fails correctly
  - write minimal code
  - verify pass
  - refactor
  - repeat
- Exit conditions:
  - all boxes in verification checklist satisfied
- Handoffs:
  - none required
- State written:
  - none direct
- Files generated:
  - test files and code changes in repo

## Runtime Fit

- Intended runtime:
  - any coding agent with code/test execution ability
- Codex fit:
  - strong
- Required tools:
  - test runner
- Browser dependency:
  - no
- Test dependency:
  - yes, central
- External service dependency:
  - no

## Guardrails

- Scope control:
  - strong
- Verification requirements:
  - very strong
- Anti-pattern warnings:
  - very strong
- User approval gates:
  - light

## Strengths

- highly explicit
- strong anti-rationalization language
- clear behavioral emphasis
- excellent verification checklist

## Weaknesses

- rigid for environments without reliable tests
- can be too doctrinaire for low-value or disposable code

## Conflict Notes

- With orchestration assets:
  - low direct conflict
- With design assets:
  - low
- With tone / writing rules:
  - low

## Static Score

- Instruction Architecture: `14/15`
- Workflow Completeness: `11/12`
- Guardrails And Failure Prevention: `12/12`
- Verification Design: `10/10`
- Artifact Contract Clarity: `8/10`
- Codex Compatibility: `8/10`
- Composability: `7/8`
- Customization Model: `5/8`
- Tooling / Runtime Burden: `3/5`
- Maintainability: `4/5`
- Validation Assets And Examples: `4/5`

- Total: `86/100`

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
  - Strong high-signal coding asset with excellent verification posture. Advance to live testing, especially on benchmark `C2`.
