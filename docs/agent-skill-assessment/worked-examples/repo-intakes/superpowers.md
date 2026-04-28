# Repo Intake Template

## Identity

- Repo: `obra/superpowers`
- URL: `https://github.com/obra/superpowers`
- Maintainer / org: obra / Jesse Vincent and collaborators
- Primary domain: orchestration
- Secondary domains: coding, testing, review workflow, skillcraft
- License: MIT

## Strategic Summary

- One-sentence summary:
  - A full software-development methodology for coding agents built from composable skills that enforce clarification, planning, TDD, review, and completion workflows.
- Why it matters:
  - It is one of the strongest open-source examples of process discipline for agentic engineering work.
- Best-fit use case:
  - users who want a consistent, opinionated engineering workflow with mandatory design, TDD, review, and structured handoffs
- Worst-fit use case:
  - users who want minimal friction, informal workflows, or frequent direct-execution shortcuts

## Structure

- Main folders:
  - `skills/`
  - docs and install surfaces
- Main asset types:
  - skills
  - workflow conventions
  - plugin/install surfaces
- Distribution model:
  - plugin and marketplace delivery across multiple coding-agent platforms
- Runtime assumptions:
  - automatic skill invocation matters
  - planning and TDD are mandatory, not optional

## Codex Fit

- Codex-native:
  - yes, via plugin support
- Codex-compatible with edits:
  - yes
- Major adaptation required:
  - no
- Main friction points:
  - the methodology is intentionally opinionated and may conflict with existing defaults or looser habits

## Quality Signals

- Workflow maturity:
  - very high
- Documentation quality:
  - high
- Validation or test assets:
  - strong process-level validation through the `writing-skills` philosophy and explicit workflows
- Build or packaging quality:
  - high
- Maintenance confidence:
  - high

## Risks

- Instruction conflict risk:
  - medium to high
- Operational burden:
  - medium
- Overlap with other candidates:
  - overlaps heavily with `oh-my-codex` on orchestration and with `mattpocock/skills` on coding craft
- Lock-in to non-Codex runtime:
  - low

## Repo-Level Verdict

- Recommend:
  - `adopt_with_local_edits`
- Why:
  - This is the strongest process candidate among the three for general engineering workflow, but its mandatory nature means it should be tested and possibly narrowed before being allowed to dominate the whole workspace.

## Follow-Up

- Assets to score next:
  - `skills/brainstorming/SKILL.md`
  - `skills/test-driven-development/SKILL.md`
  - `skills/requesting-code-review/SKILL.md`
- Assets to ignore:
  - lower-value install variations that do not change behavior
- Benchmarks to use:
  - `O1`
  - `C2`
  - `C3`
