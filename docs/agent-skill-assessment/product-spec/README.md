# Agent Skill Directory Product Spec

This folder turns the planning work into a concrete product architecture for the skill-assessment tool.

The product is designed `internal-first`, but with a data model and subsystem layout that can grow into:

- a public skills directory
- a self-maintaining ingestion system
- a natural-language "find the best skill for my task" engine
- a benchmark service
- a later Chrome extension and security-review layer

## Product Principles

- `skill-first`
  - the main scored unit is an individual skill, agent, prompt, workflow unit, or template
- `evidence-first`
  - no popularity metrics are used in scoring or ranking
- `taxonomy-first`
  - domain and function-mode assignment use the V2.1 registry
- `explainable ranking`
  - results must be defensible and decomposable
- `truthful benchmarking`
  - missing or blocked benchmark runs remain missing or blocked

## Files

`architecture.md`

- overall system structure
- subsystem boundaries
- phased build order

`data-model.md`

- canonical entities
- rollups
- scoring layers
- result presentation model

`phase-1-core-model.md`

- concrete Phase 1 deliverables and comparison rules

`extraction-rules.md`

- deterministic rules for converting repos into normalized skill units

`phase-1-workflow.md`

- operational workflow for the first real internal comparison engine

`phase-1.5-unit-ranking.md`

- unit-level taxonomy, tag, score, and grouped-band ranking layer

`phase-1.5-results.md`

- summary of the first skill-unit ranking outputs

`retrieval-and-ranking.md`

- domain browse
- source browse
- natural-language task matching
- ranking pipeline

`benchmarking-subsystem.md`

- benchmark objects
- runner model
- user-authored and guided benchmarks
- result lifecycle

`roadmap.md`

- phased delivery plan from current toolkit to future directory

`core-entities.schema.json`

- machine-readable schema for the core entity model

`inventory-extraction-ledger.schema.json`

- machine-readable schema for Phase 1 normalized inventory and extraction output

`phase-1-ledger.round1.json`

- first normalized source/package/skill-unit ledger for the current repo set

`unit-ranking-ledger.schema.json`

- schema for Phase 1.5 taxonomy/tag/score/grouped-result output

`phase-1.5-ledger.round1.json`

- first unit-level taxonomy, tag, and grouped ranking ledger

## Recommended Reading Order

1. `architecture.md`
2. `data-model.md`
3. `phase-1-core-model.md`
4. `extraction-rules.md`
5. `phase-1-workflow.md`
6. `phase-1.5-unit-ranking.md`
7. `phase-1.5-results.md`
8. `retrieval-and-ranking.md`
9. `benchmarking-subsystem.md`
10. `roadmap.md`
