# Phase 2 Internal Retrieval

Phase 2 turns the normalized and ranked `SkillUnit` set into a usable internal discovery engine.

The goal is:

- let a user browse by domain
- browse by source
- browse by tag
- compare selected units
- ask task-oriented natural-language questions

## Phase 2 Deliverables

- query model
- query parsing rules
- candidate filtering rules
- weighted ranking rules
- result explanation rules
- machine-readable query/result ledger

## Supported Query Types

- `domain-browse`
- `source-browse`
- `tag-browse`
- `direct-compare`
- `task-match`

## Primary Retrieval Rule

The engine is `structured retrieval first`.

That means:

1. parse user intent
2. map to domain, mode, tags, and constraints
3. retrieve compatible candidates
4. rank candidates
5. explain the ranking

It does not rerun the entire scoring rubric at query time.

## Query Intent Fields

A parsed query may contain:

- `query_type`
- `query_text`
- `target_domains`
- `target_modes`
- `required_tags`
- `preferred_tags`
- `excluded_tags`
- `runtime_constraints`
- `source_constraints`
- `minimum_score_band`

## Candidate Retrieval Rule

Candidate retrieval should filter in this order:

1. installation relevance
2. source constraints
3. runtime constraints
4. target domain compatibility
5. function mode compatibility
6. required tags
7. excluded tags

## Ranking Rule

Use weighted ranking, not binary match only.

Base ranking factors:

- `static-structural`
- `codex-fit`
- `benchmark-readiness`
- domain match strength
- mode match strength
- task-tag fit
- lower unknown share

## Explanation Rule

Every result should explain:

- why it matched
- why it ranked above alternatives
- what evidence is missing

## Phase 2 Success Condition

The system can answer:

- “show only X source”
- “best design skills for Codex”
- “best founder-voice writing skill”
- “compare these two units”
