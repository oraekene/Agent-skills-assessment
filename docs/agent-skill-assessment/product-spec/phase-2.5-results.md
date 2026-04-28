# Phase 2.5 Results

Phase 2.5 makes query understanding deterministic.

## Files

- `phase-2.5-deterministic-query-parser.md`
  - strict query classification, extraction, and ranking rules
- `parsed-query-ledger.schema.json`
  - machine-readable schema for parsed query records
- `phase-2.5-query-parses.round1.json`
  - first deterministic parse examples

## What Changed

Phase 2 only defined the retrieval surface.

Phase 2.5 adds:

- exact query-type precedence
- exact field extraction precedence
- exact basis labels for inferred fields
- exact broad-query and specific-query formulas
- exact tie-break order

## Practical Outcome

The system can now take the same user query and produce:

- the same query type
- the same structured filters
- the same ranking formula
- the same candidate set
- the same ranked order

as long as the underlying ledgers do not change.

## Main Limitation

Phase 2.5 still depends on:

- existing taxonomy registry coverage
- existing tag vocabulary
- existing skill-unit ledgers

It does not yet add:

- automatic registry extension during parsing
- learned semantic retrieval
- benchmark-trace-aware reranking
