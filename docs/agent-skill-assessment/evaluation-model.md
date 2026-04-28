# Evaluation Model

This file defines the normalized schema used to compare assets across repositories.

## Core Principle

Every candidate is scored twice:

- `static_score`: quality of the artifact itself
- `live_score`: quality of actual benchmark execution

These scores must never be merged until both exist.

## Normalized Candidate Schema

Record the following for each asset.

### Identity

- `repo_name`
- `repo_url`
- `asset_name`
- `asset_path`
- `asset_type`
- `primary_domain`
- `secondary_tags`

### Runtime Fit

- `target_runtimes`
- `Codex_compatibility`
- `adaptation_required`
- `required_tools`
- `required_external_services`

### Trigger Design

- `trigger_mode`
  - automatic
  - slash command
  - explicit load
  - ambient context
- `trigger_clarity`
- `false_positive_risk`
- `false_negative_risk`

### Workflow Design

- `entry_conditions`
- `main_steps`
- `exit_conditions`
- `handoff_targets`
- `state_files_written`
- `artifacts_generated`

### Safety And Quality

- `guardrails_present`
- `verification_requirements`
- `anti_patterns_defined`
- `user_approval_gates`
- `scope_control_strength`

### Maintenance And Operations

- `install_complexity`
- `maintenance_complexity`
- `repo_update_frequency`
- `distribution_model`
- `fork_customization_likelihood`

### Strategic Fit

- `best_use_case`
- `worst_use_case`
- `conflict_risks`
- `stack_alignment`
- `workspace_adoption_recommendation`

## Score Families

### A. Static Score

Measures design quality before running anything.

Components are defined in `static-rubric.md`.

### B. Live Score

Measures actual benchmark performance.

Suggested components:

- `task_completion`
- `instruction_adherence`
- `artifact_quality`
- `verification_behavior`
- `assumption_control`
- `consistency_across_runs`
- `human_rework_required`
- `runtime_efficiency`

## Comparison Modes

### Mode 1: Cross-Repo

Use when asking:

- which repo is strongest in a domain?
- which repo is easiest to adopt?
- which repo is most Codex-friendly?

### Mode 2: Cross-Asset

Use when asking:

- which specific skill or agent should be installed?
- which prompt or workflow is strongest within a repo?

### Mode 3: Cross-Workflow

Use when asking:

- which end-to-end system handles planning, execution, and verification best?

## Decision Labels

After scoring, assign one:

- `adopt`
- `adopt_with_local_edits`
- `fork_and_customize`
- `keep_for_reference_only`
- `defer`
- `reject`

## Conflict Analysis

Each asset should also receive a conflict note:

- `low`
  - mostly isolated, unlikely to interfere
- `medium`
  - overlaps with existing prompts, styles, or workflow assumptions
- `high`
  - likely to create instruction collisions or operational confusion

Typical conflict sources:

- contradictory orchestration rules
- incompatible tone rules
- duplicate trigger surfaces
- different assumptions about browser or test tooling
- aggressive global instructions that overshadow other packs

## Static-To-Live Selection Rule

Do not live-test everything.

Prioritize live testing for assets that are:

- high static score
- strategically important
- likely to be used often
- risky enough that static analysis alone is not trustworthy

## Recommended Evaluation Sequence

1. repo-level intake
2. asset-level catalog
3. static scoring
4. shortlist
5. live benchmark runs
6. decision label
7. optional local adaptation plan
