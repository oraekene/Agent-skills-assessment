# Repo Intake Template

## Identity

- Repo: `Yeachan-Heo/oh-my-codex`
- URL: `https://github.com/Yeachan-Heo/oh-my-codex`
- Maintainer / org: Yeachan Heo and collaborators
- Primary domain: orchestration
- Secondary domains: coding workflow, runtime augmentation, multi-agent coordination
- License: MIT

## Strategic Summary

- One-sentence summary:
  - A Codex workflow and runtime layer that adds orchestration skills, scoped `AGENTS.md`, prompts, hooks, state, and optional team runtime around Codex CLI.
- Why it matters:
  - It is one of the clearest attempts to turn Codex from a general coding agent into a structured operating system with repeatable clarification, planning, and execution modes.
- Best-fit use case:
  - shell-first Codex CLI users on macOS/Linux who want a strong orchestration layer and are willing to adopt `.omx/` state and workflow surfaces
- Worst-fit use case:
  - lightweight Windows desktop-app users who want minimal runtime wiring and low operational overhead

## Structure

- Main folders:
  - `skills/`
  - `prompts/`
  - `src/`
  - `templates/`
  - `plugins/oh-my-codex`
  - `.agents/plugins`
- Main asset types:
  - skills
  - prompts
  - AGENTS contract
  - config and hooks
  - CLI runtime
- Distribution model:
  - npm package plus plugin surface
- Runtime assumptions:
  - Codex CLI is the execution engine
  - recommended runtime is macOS/Linux
  - `tmux` is preferred for team mode

## Codex Fit

- Codex-native:
  - yes, conceptually and structurally
- Codex-compatible with edits:
  - yes
- Major adaptation required:
  - no for Codex CLI on macOS/Linux, but `yes` for this specific Windows desktop-app-centered environment if the full runtime is desired
- Main friction points:
  - upstream explicitly warns that native Windows and Codex App are not the default experience
  - runtime value depends on shell, hooks, and CLI surfaces that are less natural in an app-first workflow

## Quality Signals

- Workflow maturity:
  - high
- Documentation quality:
  - high
- Validation or test assets:
  - good visible operational documentation, but real value depends on runtime behavior
- Build or packaging quality:
  - strong
- Maintenance confidence:
  - moderate to high

## Risks

- Instruction conflict risk:
  - high, because the repo uses a strong top-level operating contract and expects to shape the whole session
- Operational burden:
  - high
- Overlap with other candidates:
  - overlaps strongly with `superpowers` and `ralph` at the orchestration layer
- Lock-in to non-Codex runtime:
  - low, but there is lock-in to OMX-specific workflow and state assumptions

## Repo-Level Verdict

- Recommend:
  - `fork`
- Why:
  - The repo is strategically strong, but the full runtime is not a clean fit for a Windows Codex app-first workspace. The best value here is likely selective adoption or adaptation of orchestration patterns, not blind full-runtime installation.

## Follow-Up

- Assets to score next:
  - `AGENTS.md`
  - `skills/deep-interview/SKILL.md`
  - `skills/ralplan/SKILL.md`
- Assets to ignore:
  - lower-priority runtime surfaces until orchestration fit is proven
- Benchmarks to use:
  - `O1`
  - `O3`
