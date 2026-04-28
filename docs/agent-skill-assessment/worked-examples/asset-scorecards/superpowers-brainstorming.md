# Asset Scorecard Template

## Identity

- Repo: `obra/superpowers`
- Asset: `brainstorming`
- Path: `skills/brainstorming/SKILL.md`
- Asset type: skill
- Primary domain: orchestration
- Secondary tags: `planning`, `specification`, `design-first`, `review-gated`

## Purpose

- What this asset is supposed to do:
  - force a design and specification phase before implementation
- When it should trigger:
  - before creative or implementation work
- What it should produce:
  - approved design and written spec

## Workflow Shape

- Entry conditions:
  - feature work, modification work, or any creative build task
- Main steps:
  - explore project context
  - optional visual companion
  - one-question-at-a-time clarification
  - propose alternatives
  - present design sections
  - write design doc
  - self-review
  - user review gate
  - transition to planning
- Exit conditions:
  - user-approved spec handed to planning
- Handoffs:
  - `writing-plans`
- State written:
  - minimal implicit state
- Files generated:
  - `docs/superpowers/specs/YYYY-MM-DD--design.md`

## Runtime Fit

- Intended runtime:
  - Superpowers-enabled coding agent, including Codex
- Codex fit:
  - good
- Required tools:
  - standard file access and git
- Browser dependency:
  - optional
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
  - strong
- User approval gates:
  - very strong

## Strengths

- excellent workflow clarity
- strong anti-rush discipline
- explicit artifacts and review gates
- good decomposition logic for oversized requests

## Weaknesses

- can feel heavy for tiny tasks
- mandatory nature may conflict with user expectations in fast iterative work

## Conflict Notes

- With orchestration assets:
  - high overlap with other planning-first systems
- With design assets:
  - low direct conflict
- With tone / writing rules:
  - low

## Static Score

- Instruction Architecture: `14/15`
- Workflow Completeness: `12/12`
- Guardrails And Failure Prevention: `11/12`
- Verification Design: `8/10`
- Artifact Contract Clarity: `9/10`
- Codex Compatibility: `8/10`
- Composability: `6/8`
- Customization Model: `6/8`
- Tooling / Runtime Burden: `4/5`
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
  - High static quality and strong Codex fit. This is a top live-test candidate, though the mandatory spec-first posture should be tested for friction in your actual workflow.
