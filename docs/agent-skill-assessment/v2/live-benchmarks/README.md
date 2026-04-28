# Live Benchmarks V2

This folder contains machine-readable live benchmark plans and results.

## Current State

`round-1-manifest.json`

- defines the first real benchmark round for all nine repositories
- assigns one concrete benchmark per repository
- defines exact prompts and required artifacts

`round-1-results.json`

- records the truthful execution state of round 1
- current status is `blocked-before-repo-runs`, and the practical outcome is to skip repo-specific live runs for now

## Why Round 1 Is Blocked

A real Codex CLI runner exists on this machine, but benchmark preflight failed before repository-specific runs could start:

- sandboxed execution could not read/load Codex configuration
- unsandboxed execution still returned Windows `Access is denied` when launching `codex.exe`
- an absolute-path launch attempt was prepared but not executed because approval was rejected

## Important Rule

These files do **not** claim that repo-specific live benchmarks have run.

They only claim:

- the live benchmark plan exists
- the runner preflight was genuinely attempted
- the round is blocked on executable access, so repo-specific live runs are currently skipped
