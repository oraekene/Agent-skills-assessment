# Asset Scorecard Template

## Identity

- Repo: `pbakaus/impeccable`
- Asset: `AGENTS.md`
- Path: `AGENTS.md`
- Asset type: AGENTS file
- Primary domain: meta / skillcraft
- Secondary tags: `build-system`, `distribution`, `provider-transformers`, `maintainer-contract`

## Purpose

- What this asset is supposed to do:
  - describe the repository's single-source-of-truth architecture and provider transformation model
- When it should trigger:
  - when maintaining or extending the repo
- What it should produce:
  - contributor and agent discipline around editing `source/` rather than generated outputs

## Workflow Shape

- Entry conditions:
  - maintenance, extension, or provider build work
- Main steps:
  - define source-first architecture
  - define provider transformation rules
  - define repository structure and build expectations
- Exit conditions:
  - contributor understands where and how to make changes
- Handoffs:
  - build scripts
  - provider transformers
- State written:
  - none direct
- Files generated:
  - none direct

## Runtime Fit

- Intended runtime:
  - maintainers and contributors
- Codex fit:
  - strong as a maintainer guide, not as an end-user runtime asset
- Required tools:
  - Bun build system for full maintainer workflow
- Browser dependency:
  - no
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
  - implicit through source-of-truth architecture
- User approval gates:
  - low

## Strengths

- excellent architecture clarity
- very strong provider-model explanation
- useful for anyone forking or extending the repo

## Weaknesses

- not a direct user-facing skill
- lower value if you only want to consume the packaged skill

## Conflict Notes

- With orchestration assets:
  - none
- With design assets:
  - none
- With tone / writing rules:
  - none

## Static Score

- Instruction Architecture: `14/15`
- Workflow Completeness: `9/12`
- Guardrails And Failure Prevention: `8/12`
- Verification Design: `6/10`
- Artifact Contract Clarity: `9/10`
- Codex Compatibility: `8/10`
- Composability: `7/8`
- Customization Model: `7/8`
- Tooling / Runtime Burden: `3/5`
- Maintainability: `5/5`
- Validation Assets And Examples: `4/5`

- Total: `80/100`

## Decision

- Adopt:
  - no
- Adapt:
  - maybe
- Fork:
  - yes, if you plan to package your own multi-provider skills
- Reference only:
  - yes
- Reject:
  - no

- Reason:
  - High-value architectural reference for skill packaging, but not a primary runtime asset for end users.
