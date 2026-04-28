# Phase 4 Worked Simulation

This file simulates three benchmark situations:

- a successful simulated benchmark
- a blocked live benchmark
- a guided benchmark definition that is saved but not run

## Scenario A: Successful Simulated Benchmark

Target unit:

- `unit-impeccable-main`

Benchmark:

- `bm-design-audit-saas-dashboard-v1`

Runner type:

- `simulated-invocation`

### Preflight

Checks:

- benchmark definition exists
- required prompt exists
- required artifact expectations defined
- runner type supported

Result:

- preflight passes

### Run

Observed outputs:

- `audit-summary.md`
- `improvement-plan.md`
- transcript log

### Result

State:

- `run-succeeded`

Scores present:

- yes

Reason:

- trace exists
- required artifacts exist
- metrics are observable

## Scenario B: Blocked Live Benchmark

Target unit:

- `unit-figma-to-ui`

Benchmark:

- `bm-figma-to-ui-live-v1`

Runner type:

- `live-runner`

### Preflight

Checks:

- `figma-cli` available
- `FIGMA_TOKEN` available

Result:

- `figma-cli` missing
- `FIGMA_TOKEN` missing

### Run State

- `preflight-failed`

### Result State

- `blocked`

### Score Behavior

Scores:

- none

Why:

- no truthful live execution happened
- no artifact evidence was observed

This is the key truthfulness rule in action.

## Scenario C: Guided Benchmark Saved But Not Run

User goal:

- `Find the best skill for founder-voice launch emails.`

System scaffolds:

- benchmark type:
  - `guided`
- suggested runner:
  - `simulated-invocation`
- required artifacts:
  - `launch-email-draft.md`
- candidate metrics:
  - voice consistency
  - launch clarity
  - CTA specificity

### Saved State

Definition exists:

- yes

Run exists:

- no

Result state:

- `runnable-not-run`

### Why This Matters

The system can preserve useful benchmark planning work without pretending the benchmark already happened.

## Comparison Rules Demonstrated

The successful design-audit result and blocked figma result are not directly comparable as benchmark outcomes because:

- different benchmark definitions
- different runner types
- different observability conditions

So the system may compare their `status`, but not rank them by benchmark score as if they were equivalent.

## Practical Meaning

Phase 4 makes benchmark truthfulness explicit:

- success is recorded only when observed
- blocked runs stay blocked
- saved definitions stay useful even before execution
