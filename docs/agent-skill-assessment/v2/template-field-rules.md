# Template Field Rules

This file explains exactly how every question or metric in the templates must be answered.

## Repo-Intake Rules

### Identity Fields

- `Repo`, `URL`, `Maintainer / org`, `License`
  - Source: `E`
  - Rule: copy or paraphrase from repo metadata or README
  - If missing: `U`

- `Primary domain`
  - Source: `D`
  - Rule: use the domain assignment rule

- `Secondary domains`
  - Source: `D`
  - Rule: list any additional domains with explicit README or asset evidence

### Strategic Summary

- `One-sentence summary`
  - Source: `D`
  - Rule: compress the repo description plus promoted assets into one sentence

- `Why it matters`
  - Source: `D`
  - Rule: say what capability it adds that is explicit in the repo

- `Best-fit use case`
  - Source: `D`
  - Rule: combine explicit target users, workflow, and runtime assumptions

- `Worst-fit use case`
  - Source: `D`
  - Rule: derive from explicit caveats, exclusions, or burden mismatch

### Structure

- `Main folders`
  - Source: `S`
  - Rule: list the top-level folders that matter to the repo's value

- `Main asset types`
  - Source: `D`
  - Rule: map folders and README claims to asset types

- `Distribution model`
  - Source: `E`
  - Rule: copy explicit install or packaging method

- `Runtime assumptions`
  - Source: `E`
  - Rule: list prerequisites, required tools, or platform assumptions

### Codex Fit

- `Codex-native`
  - Source: `E`
  - Rule: `yes` only if Codex is explicitly named as a supported target

- `Codex-compatible with edits`
  - Source: `D`
  - Rule: `yes` if the repo uses portable skills/markdown patterns that can be adapted without major redesign

- `Major adaptation required`
  - Source: `D`
  - Rule: `yes` if Codex is not explicit or if runtime assumptions clash with this workspace

- `Main friction points`
  - Source: `E` or `D`
  - Rule: use explicit caveats first; otherwise derive only from prerequisites and install shape

### Quality Signals

- `Workflow maturity`
  - Source: `D`
  - Rule: inspect 1-3 representative assets and count explicit triggers, steps, outputs, and handoffs

- `Documentation quality`
  - Source: `D`
  - Rule: use documentation coverage count from the repo baseline formula

- `Validation or test assets`
  - Source: `S` or `E`
  - Rule: list actual validators, test steps, CLI checks, or quality checklists

- `Build or packaging quality`
  - Source: `S` or `E`
  - Rule: based on visible `dist`, build scripts, transformer systems, plugin manifests, or install variants

- `Maintenance confidence`
  - Source: `D`
  - Rule: use only visible repo hygiene evidence; never use popularity as a proxy

### Risks

- `Instruction conflict risk`
  - Source: `D`
  - Rule: use the scope-footprint rule

- `Operational burden`
  - Source: `D`
  - Rule: use the operational burden rule

- `Overlap with other candidates`
  - Source: `D`
  - Rule: compare domain plus workflow role, not just labels

- `Lock-in to non-Codex runtime`
  - Source: `D`
  - Rule: `high` only when the repo's core value depends on a non-Codex runtime that is not portable

## Asset-Scorecard Rules

### Identity And Purpose

- `Asset`, `Path`, `Asset type`
  - Source: `S`

- `Primary domain`, `Secondary tags`
  - Source: `D`
  - Rule: derive from the asset's description and workflow shape

- `What this asset is supposed to do`
  - Source: `E`
  - Rule: paraphrase the description plus first body paragraph

- `When it should trigger`
  - Source: `E`
  - Rule: use explicit "use when" text, examples, or trigger keywords

- `What it should produce`
  - Source: `E` if files/artifacts are named, otherwise `D` from the described workflow
  - If no artifact is stated: `U`

### Workflow Shape

- `Entry conditions`
  - Source: `E`
  - Rule: explicit positive trigger conditions

- `Main steps`
  - Source: `E`
  - Rule: summarize only stated ordered steps or phases

- `Exit conditions`
  - Source: `E` if stated, otherwise `D` from explicit handoff or completion text

- `Handoffs`
  - Source: `E`
  - Rule: list only explicitly named next skills, next commands, or target files

- `State written`
  - Source: `E` or `S`
  - Rule: list only files or state mechanisms explicitly written

- `Files generated`
  - Source: `E`
  - Rule: use exact file paths if named

### Runtime Fit

- `Intended runtime`
  - Source: `E`

- `Codex fit`
  - Source: `D`
  - Rule: combine explicit support, path layout, and environment caveats

- `Required tools`
  - Source: `E`

- `Browser dependency`, `Test dependency`, `External service dependency`
  - Source: `E`
  - Rule: `yes` only when explicitly required or mandatory

### Guardrails

- `Scope control`
  - Source: `D`
  - Rule: based on presence of exclusions, non-goals, or "do not" constraints

- `Verification requirements`
  - Source: `E`

- `Anti-pattern warnings`
  - Source: `E`

- `User approval gates`
  - Source: `E`

### Strengths And Weaknesses

- `Strengths`
  - Source: `D`
  - Rule: list only the categories scoring full or near-full points

- `Weaknesses`
  - Source: `D`
  - Rule: list only the categories with missing evidence or low points

- `Conflict notes`
  - Source: `D`
  - Rule: use scope footprint plus trigger breadth

### Static Score

Each category must use the formula in `deterministic-evidence-model.md`.

No category may be scored by feel.

## Live-Run-Report Rules

### Allowed Status

Live-run fields have only three states:

- `scored`
- `not run`
- `not observable`

### Setup Fields

- `Candidate`, `Asset`, `Benchmark`, `Run tier`, `Date`, `Runtime`
  - Source: actual run metadata only

- `Test repo / fixture`, `Installed files`, `Special configuration`, `Success criteria`
  - Source: actual benchmark setup only

### Prompt / Task

- `Exact benchmark prompt`
  - Source: exact text used in the run

### Execution Notes

These fields must come from logs, transcript, terminal output, or created files:

- `First move`
- `Clarifying behavior`
- `Artifacts created`
- `Verification behavior`
- `Notable assumptions`
- `Notable failures`

If not observable from trace, mark `U`.

### Live Metrics

- `Task Completion / 20`
  - Formula: completed acceptance checks / total acceptance checks * 20

- `Instruction Adherence / 15`
  - Formula: required workflow steps observed / required workflow steps * 15

- `Artifact Quality / 15`
  - Formula: artifact checklist completion / total artifact checklist items * 15

- `Verification Behavior / 15`
  - Formula: required verification actions performed / required verification actions * 15

- `Assumption Control / 10`
  - Start at `10`
  - subtract `2` for each unsupported material assumption
  - floor at `0`

- `Consistency / 10`
  - Only valid after 3 comparable runs
  - Formula: repeated successful outputs / 3 * 10
  - If fewer than 3 runs: `not run`

- `Human Rework Required / 10`
  - Start at `10`
  - subtract `2` for each mandatory post-run correction category:
    - wrong file placement
    - broken formatting
    - missing required artifact
    - failed verification
    - major scope drift

- `Runtime Efficiency / 5`
  - Formula:
    - `5` no wasted loops or duplicate work
    - `3` some inefficiency but acceptable
    - `1` repeated thrashing
    - `0` stalled or abandoned

### Outcome Label

- `clean success`
  - all required artifacts created, acceptance checks passed, no critical correction
- `success with corrections`
  - passed after minor human correction
- `partial success`
  - some required outputs missing or incomplete
- `artifact success but workflow failure`
  - output exists but mandatory process rules were broken
- `failure`
  - did not meet benchmark minimum
