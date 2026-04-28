# Phase 4 Benchmark Operations

Phase 4 turns the benchmarking subsystem into a concrete operational model.

## Goal

The goal is to make benchmark definition, execution state, artifact capture, and scoring fully explicit.

The system must be able to answer:

- what benchmark was defined
- what runner type was intended
- whether it was runnable
- what actually executed
- what artifacts were observed
- what metrics were scored
- what was blocked or missing

## Core Truthfulness Rule

The subsystem must never infer a benchmark score from:

- repository reputation
- ranking score
- undocumented assumptions
- missing traces
- partial observations

If the required execution evidence is missing, the benchmark score remains absent.

## Benchmark Object Families

Phase 4 uses four primary record families:

- `BenchmarkDefinition`
- `BenchmarkRun`
- `BenchmarkTrace`
- `BenchmarkResult`

## 1. BenchmarkDefinition

Defines what should be tested.

Required fields:

- `benchmark_id`
- `name`
- `benchmark_type`
- `target_domains`
- `target_modes`
- `task_prompt`
- `required_artifacts`
- `acceptance_checks`
- `runner_type`
- `runner_requirements`
- `scoring_method`
- `truthfulness_requirements`

Optional fields:

- `fixture_refs`
- `seed_inputs`
- `time_limit`
- `notes`

## 2. BenchmarkRun

Represents one attempt to execute a benchmark against one skill unit.

Required fields:

- `run_id`
- `benchmark_id`
- `unit_id`
- `runner_type`
- `run_state`
- `started_at`
- `ended_at`
- `environment_ref`

Allowed `run_state` values:

- `not-started`
- `preflight-failed`
- `blocked`
- `running`
- `completed`
- `failed`
- `cancelled`

## 3. BenchmarkTrace

Captures what happened during the run.

Trace objects may include:

- prompt transcript
- tool invocation log
- terminal output handles
- generated artifact handles
- screenshot handles
- runtime notes
- manual review notes

Trace references must be explicit even when the underlying artifact is stored elsewhere.

## 4. BenchmarkResult

Represents the scored outcome of one run.

Required fields:

- `result_id`
- `run_id`
- `result_state`
- `scored_metrics`
- `missing_requirements`
- `trace_refs`

Allowed `result_state` values:

- `not-defined`
- `defined-not-runnable`
- `runnable-not-run`
- `run-succeeded`
- `run-failed`
- `blocked`
- `stale`

## Runner Types

### `static-only`

Use when:

- the benchmark evaluates only artifact structure
- no live runner is available

Allowed outputs:

- structural checks
- checklist scoring

Not allowed:

- claims about real execution success

### `simulated-invocation`

Use when:

- a realistic prompt simulation is possible
- the actual target runtime is not fully available

Allowed outputs:

- prompt/response trace
- observed artifact outputs

Not allowed:

- pretending the native runtime executed if it did not

### `live-runner`

Use when:

- the real execution environment is available
- the benchmark can observe real outputs

Allowed outputs:

- full benchmark score
- runtime-dependent metrics

### `manual-assisted`

Use when:

- some checks require human judgment
- the rest of the workflow can still be captured systematically

Allowed outputs:

- metric values with reviewer notes
- unresolved metrics left blank

## Benchmark States And Gates

Before any run begins, perform preflight gates:

1. required runtime available
2. required binaries available
3. required secrets/config available
4. required fixture available
5. target skill eligible for the intended benchmark

If any hard gate fails:

- create a `BenchmarkRun`
- set `run_state=preflight-failed` or `blocked`
- create a `BenchmarkResult`
- set `result_state=blocked`
- record the failing gate

## Scoring Model

Each benchmark must define metric-by-metric scoring, not just a final number.

Each metric record must include:

- `metric_id`
- `metric_name`
- `metric_type`
- `score_scale`
- `pass_rule`
- `observability_rule`

Metric types:

- `binary`
- `ordinal`
- `numeric`
- `reviewer-judged`

## Benchmark Result Rules

### When a Result May Have Scores

Scores may only be present if:

- the run occurred
- the necessary traces exist
- the metric observability rule was satisfied

### When a Result Must Have Blank Scores

Scores must remain blank if:

- run was blocked
- trace missing
- artifact missing
- reviewer confirmation missing for a reviewer-judged metric

## Benchmark Templates

Phase 4 should support template families such as:

- `design-audit`
- `tdd-implementation`
- `voice-rewrite`
- `marketing-landing-copy`
- `spec-to-plan`

Templates are starting structures, not scored outcomes.

## User-Authored Benchmarks

User-authored benchmark flow:

1. define task
2. attach fixture or prompt
3. choose runner type
4. define required artifacts
5. define acceptance checks
6. run or store as not-run

## Guided Benchmark Scaffolding

Guided flow inputs:

- user goal
- target domain
- target runtime
- what good looks like

Guided flow outputs:

- suggested benchmark template
- suggested metrics
- suggested runner type
- suggested required artifacts
- suggested blocking conditions

## Trace Storage Rules

Large trace artifacts should be referenced, not embedded inline.

Recommended trace handle types:

- `file`
- `image`
- `log`
- `terminal`
- `web`
- `manual-note`

## Benchmark Comparison Rules

Only compare results directly when:

- same benchmark definition version
- same fixture set
- same runner type
- same scoring rules

If any differ:

- mark comparison as `non-equivalent`

## Phase 4 Success Condition

The subsystem can truthfully represent:

- a benchmark that ran and scored
- a benchmark that was defined but never run
- a benchmark that was blocked before execution
- a benchmark that partially ran but lacked scoreable evidence
