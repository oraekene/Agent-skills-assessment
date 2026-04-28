# Phase 2 Results

Phase 2 adds the first internal discovery surface on top of the Phase 1.5 ranking data.

## Files

- `phase-2-internal-retrieval.md`
  - retrieval model and rules
- `query-result-ledger.schema.json`
  - machine-readable query/result schema
- `phase-2-query-examples.round1.json`
  - first machine-readable query/result examples

## What Is Now Available

The product can now model:

- domain browse
- source browse
- direct comparison
- task-oriented ranking

## Example Supported Queries

- best design and UX skills for Codex Desktop
- show only taste-skill units
- find the best skill for founder-voice launch emails in Codex
- find the best skill for auditing and improving a SaaS dashboard UI
- compare the best TDD skills

## Current Practical Outcome

The system now has enough structure to power:

- internal shortlist generation
- source-tag filtering
- grouped-band domain results
- first-pass task-specific recommendations

## Main Limitation

Phase 2 still uses:

- predefined query shapes
- existing unit taxonomy
- existing score families

It does not yet implement:

- dynamic natural-language parser execution
- benchmark-aware reranking from live traces
- full UI or public directory interactions
