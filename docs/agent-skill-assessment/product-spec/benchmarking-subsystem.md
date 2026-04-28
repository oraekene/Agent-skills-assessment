# Benchmarking Subsystem

## Purpose

Benchmarking is a separate subsystem.

It exists to:

- define reusable benchmark cases
- allow user-authored benchmarks
- allow guided benchmark creation
- store benchmark traces and results
- compare units under controlled conditions

## Why Separate

Benchmarking is not just another score field.

It has its own:

- object model
- lifecycle
- execution constraints
- truthfulness requirements

## Benchmark Types

## 1. Platform Benchmarks

Maintained by the system.

Use cases:

- standard design audit benchmark
- standard TDD benchmark
- standard voice rewrite benchmark

## 2. User-Authored Benchmarks

Created directly by the user.

Use cases:

- project-specific benchmark
- custom fixture and custom scoring

## 3. Guided Benchmarks

The system scaffolds a benchmark from a user goal.

Use cases:

- user describes the task they care about
- system generates the benchmark structure and required checks

## Benchmark Object

Each benchmark should contain:

- benchmark id
- benchmark name
- target domains
- target modes
- benchmark type
- prompt or task
- required artifacts
- acceptance checks
- fixture references
- runner requirements
- observability requirements

## Runner Model

Supported runner states:

- `static-only`
- `simulated-invocation`
- `live-runner`
- `manual-assisted`

First serious implementation should support all four conceptually, even if only some are executable initially.

## Result States

Allowed states:

- `not-defined`
- `defined-not-runnable`
- `runnable-not-run`
- `run-succeeded`
- `run-failed`
- `blocked`
- `stale`

These states must remain explicit. The system may not turn a blocked run into a guessed score.

## Scoring Rules

Benchmark results should produce:

- benchmark status
- benchmark metrics
- benchmark notes
- trace references

Live benchmark scores should only exist if:

- runner existed
- execution trace existed
- required artifacts were observable
- scoring checks were executable or manually confirmed

## User-Built Benchmarks

The design must support:

- custom prompts
- custom acceptance criteria
- custom fixtures
- custom runner selection
- custom artifact expectations

The system should also support:

- benchmark templates by domain
- benchmark cloning
- benchmark versioning

## Guided Benchmark Flow

User gives:

- target task
- target runtime
- what “good” looks like

System scaffolds:

- proposed benchmark type
- proposed task prompt
- proposed artifacts
- proposed checks
- recommended runner type

## Subsystem Outputs

- benchmark catalog
- benchmark manifests
- benchmark traces
- benchmark result ledgers
- rerunnable benchmark histories

## Non-Goals For First Build

- guaranteed live execution for all runtimes
- automatic perfect scoring of open-ended creative tasks
- fully autonomous benchmark fleet management
