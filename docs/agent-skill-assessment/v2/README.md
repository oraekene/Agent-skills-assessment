# Agent Skill Assessment V2

Version 2 changes the system from "expert judgment with evidence" to "deterministic evidence-coded assessment."

Use V2 when your main goal is:

- comparing multiple libraries inside the same domain
- minimizing guessed answers
- making every score traceable to explicit repo evidence
- separating "not supported" from "not proven"

## What Changed

V1 was useful for strategy and initial structure, but it still left too much room for analyst interpretation.

V2 adds:

- evidence codes for every answer
- deterministic scoring formulas
- a field-by-field rulebook for `repo-intake`, `asset-scorecard`, and `live-run-report`
- a same-domain head-to-head comparison method
- explicit `unknown` states instead of guessed answers
- environment-fit scoring for your actual Codex setup

## Core Rule

No field may be filled without one of these evidence types:

- `E` = explicit textual evidence from source material
- `S` = structural evidence from file/folder/install layout
- `D` = deterministic derivation from a published rule in this V2 system
- `U` = unknown because the repo does not prove it

If a field cannot be backed by `E`, `S`, or `D`, it must be `U`.

## Files

`deterministic-evidence-model.md`

- evidence codes
- deterministic scoring rules
- confidence and coverage rules

`template-field-rules.md`

- exact answer rules for every field in:
  - repo-intake
  - asset-scorecard
  - live-run-report

`domain-head-to-head-method.md`

- how to compare multiple libraries in the same domain fairly
- how to choose representative assets
- how to pick a winner for your Codex setup
- includes the rule: full inventory of all relevant files first, representative scoring by default, exhaustive scoring only when escalation rules trigger

`worked-examples/all-libraries-domain-comparison-simulation.md`

- full simulation across all listed libraries
- domain-by-domain winners and install recommendations

`worked-examples/full-v2-workflow-simulation.md`

- end-to-end granular walkthrough of the entire V2 workflow
- mirrors the original worked-example style, but with deterministic evidence coding and machine-readable outputs

`evidence-ledger.schema.json`

- JSON schema for machine-readable evidence ledgers

`evidence-ledger.round1.json`

- first machine-readable evidence ledger for the current repository set

`live-benchmarks/`

- machine-readable benchmark manifests and result ledgers
- current round status is blocked before repo-specific runs because the Codex CLI runner could not be launched from this thread

## Important Correction

The earlier V1 static scores were evidence-informed but not deterministic enough for strict auditability.

In V2:

- previous V1 scores should be treated as provisional
- live-run scores do not exist unless actual benchmark traces exist
- unanswered questions remain `unknown`, not "best guess"
