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

`phase-2-internal-retrieval.md`

- query model and retrieval rules for the first internal discovery engine

`phase-2-results.md`

- summary of the first internal retrieval outputs

`phase-2.5-deterministic-query-parser.md`

- strict query classification and field extraction rules

`phase-2.5-results.md`

- summary of deterministic query parsing outputs

`runtime-skill-discovery-and-progressive-loading.md`

- runtime discovery, gating, activation, and progressive loading subsystem

`runtime-skill-discovery-results.md`

- summary of the runtime subsystem and what it changes

`phase-3-runtime-workflow-simulation.md`

- complete worked simulation of runtime discovery and progressive loading

`phase-3-results.md`

- summary of Phase 3 runtime simulation outputs

`phase-3.5-internal-results-surface.md`

- internal grouped-band, shortlist, detail, and better-alternative result rules

`phase-3.5-results.md`

- summary of Phase 3.5 result-surface outputs

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

`phase-4-benchmark-operations.md`

- concrete benchmark definition, run, trace, and result rules

`phase-4-results.md`

- summary of Phase 4 benchmark outputs

`phase-5-self-maintaining-ingestion.md`

- concrete source registry, sync, change-detection, and reprocessing rules

`phase-5-results.md`

- summary of Phase 5 ingestion outputs

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

`query-result-ledger.schema.json`

- schema for machine-readable query/result output

`phase-2-query-examples.round1.json`

- first internal retrieval examples and ranked results

`parsed-query-ledger.schema.json`

- schema for machine-readable parsed query records

`phase-2.5-query-parses.round1.json`

- first deterministic parsed-query examples

`runtime-skill-index.schema.json`

- schema for machine-readable runtime-visible skill indexes

`runtime-skill-api.schema.json`

- schema for runtime discovery and management APIs

`phase-3-runtime-index-example.round1.json`

- first machine-readable example runtime skill index

`phase-3-runtime-api-examples.round1.json`

- first machine-readable example runtime API responses

`internal-results-surface.schema.json`

- schema for internal result-surface objects

`phase-3.5-results-surface-example.round1.json`

- first machine-readable example results surface

`benchmark-ledger.schema.json`

- schema for benchmark ledgers

`phase-4-benchmark-ledger.round1.json`

- first machine-readable benchmark ledger

`source-registry.schema.json`

- schema for tracked source registry records

`ingestion-ledger.schema.json`

- schema for ingestion jobs, snapshots, and change sets

`phase-5-source-registry.round1.json`

- first machine-readable source registry example

`phase-5-ingestion-ledger.round1.json`

- first machine-readable ingestion ledger example

## Recommended Reading Order

1. `architecture.md`
2. `data-model.md`
3. `phase-1-core-model.md`
4. `extraction-rules.md`
5. `phase-1-workflow.md`
6. `phase-1.5-unit-ranking.md`
7. `phase-1.5-results.md`
8. `phase-2-internal-retrieval.md`
9. `phase-2-results.md`
10. `phase-2.5-deterministic-query-parser.md`
11. `phase-2.5-results.md`
12. `runtime-skill-discovery-and-progressive-loading.md`
13. `runtime-skill-discovery-results.md`
14. `phase-3-runtime-workflow-simulation.md`
15. `phase-3-results.md`
16. `phase-3.5-internal-results-surface.md`
17. `phase-3.5-results.md`
18. `retrieval-and-ranking.md`
19. `benchmarking-subsystem.md`
20. `phase-4-benchmark-operations.md`
21. `phase-4-results.md`
22. `phase-5-self-maintaining-ingestion.md`
23. `phase-5-results.md`
24. `roadmap.md`
