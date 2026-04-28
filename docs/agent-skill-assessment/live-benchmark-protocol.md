# Live Benchmark Protocol

This protocol is for fair real-world comparison.

## Objective

Measure how an asset performs when actually used, not just how polished its instructions look.

## Benchmark Tiers

### Tier 1: Simulated Injection

Method:

- paste or load the skill instructions directly into a controlled Codex session
- run a benchmark prompt against it

Use when:

- you want quick screening
- you do not want to install or reconfigure the workspace yet

Strength:

- fast

Weakness:

- less realistic than native runtime

### Tier 2: Isolated Project Install

Method:

- create an isolated test project or sandbox
- install only the candidate pack or targeted asset
- run the benchmark in a cleaner environment

Use when:

- you want higher confidence
- you need to test prompt interactions and file writes

Strength:

- better signal for real adoption

Weakness:

- slower setup

### Tier 3: Native Upstream Runtime

Method:

- run the asset in its intended ecosystem
- examples:
  - `omx` for `oh-my-codex`
  - `ralph.sh` for `ralph`
  - `npx impeccable detect` for `impeccable`

Use when:

- runtime behavior is central to the value proposition

Strength:

- highest realism

Weakness:

- weakest apples-to-apples comparability

## Fairness Rules

### Rule 1: Same Benchmark Prompt

All candidates in the same domain should receive the same task or the same task family.

### Rule 2: Same Starting Context

Use the same repo fixture, starter files, and success criteria.

### Rule 3: Same Measurement Sheet

Record the same metrics for every run.

### Rule 4: Multiple Runs

Run each candidate at least `3` times for high-variance tasks if practical.

### Rule 5: Separate Output Quality From Runtime Difficulty

A skill may be excellent but expensive to operate. Record both.

## Live Metrics

Suggested score out of `100`:

- `task_completion` — 20
- `instruction_adherence` — 15
- `artifact_quality` — 15
- `verification_behavior` — 15
- `assumption_control` — 10
- `consistency_across_runs` — 10
- `human_rework_required` — 10
- `runtime_efficiency` — 5

## Observational Notes To Capture

- what did it do first?
- what did it assume without permission?
- did it ask useful questions or waste turns?
- did it generate the promised artifacts?
- did it verify or merely claim?
- where did it drift?
- what would have to be edited manually afterward?

## Run Labels

Assign each run one label:

- `clean success`
- `success with corrections`
- `partial success`
- `artifact success but workflow failure`
- `failure`

## Adoption Logic

Even strong live results should still be filtered through:

- maintenance cost
- conflict risk
- domain fit
- how often you would actually use it
