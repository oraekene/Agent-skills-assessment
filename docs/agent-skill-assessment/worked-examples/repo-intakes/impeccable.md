# Repo Intake Template

## Identity

- Repo: `pbakaus/impeccable`
- URL: `https://github.com/pbakaus/impeccable`
- Maintainer / org: Paul Bakaus
- Primary domain: design
- Secondary domains: design systems, UI review, anti-pattern detection, multi-provider packaging
- License: Apache 2.0

## Strategic Summary

- One-sentence summary:
  - A design-language and command system for frontend work that pairs a large flagship skill with many targeted commands, anti-pattern rules, and multi-provider distribution.
- Why it matters:
  - It is unusually mature both as a design-intelligence system and as a packaging architecture for multiple agent runtimes.
- Best-fit use case:
  - teams that care about frontend quality, design vocabulary, and repeatable design audits or refinements
- Worst-fit use case:
  - backend-only projects or teams unwilling to maintain design context files such as `PRODUCT.md` and `DESIGN.md`

## Structure

- Main folders:
  - `source/`
  - `dist/`
  - `scripts/`
  - `api/`
  - `public/`
  - `server/`
- Main asset types:
  - flagship design skill
  - design commands
  - reference packs
  - build and transformer system
  - detector CLI
- Distribution model:
  - source-of-truth plus generated multi-provider outputs
- Runtime assumptions:
  - frontend design is important enough to justify strong context gathering and command specialization

## Codex Fit

- Codex-native:
  - yes, explicitly supported
- Codex-compatible with edits:
  - yes
- Major adaptation required:
  - no
- Main friction points:
  - users must maintain context files and accept stronger design steering

## Quality Signals

- Workflow maturity:
  - high
- Documentation quality:
  - high
- Validation or test assets:
  - strong evidence via command surfaces, anti-pattern detector, and provider-aware build system
- Build or packaging quality:
  - very high
- Maintenance confidence:
  - high

## Risks

- Instruction conflict risk:
  - medium
- Operational burden:
  - medium
- Overlap with other candidates:
  - overlaps with `taste-skill` on design steering
- Lock-in to non-Codex runtime:
  - low

## Repo-Level Verdict

- Recommend:
  - `adopt_with_local_edits`
- Why:
  - This repo has strong Codex fit and design value, but should be installed with boundaries so it influences UI work without bleeding into non-design tasks.

## Follow-Up

- Assets to score next:
  - `source/skills/impeccable/SKILL.md`
  - `AGENTS.md`
  - CLI detector surface
- Assets to ignore:
  - provider outputs that are generated duplicates
- Benchmarks to use:
  - `D1`
  - `D2`
  - `D3`
