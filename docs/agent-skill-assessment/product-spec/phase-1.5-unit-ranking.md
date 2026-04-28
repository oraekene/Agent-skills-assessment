# Phase 1.5 Unit Ranking

Phase 1.5 adds the first machine-readable ranking layer on top of Phase 1 normalization.

The goal is:

- assign taxonomy at the `SkillUnit` level
- assign tags at the `SkillUnit`, `Package`, and `Source` levels
- record score families at the `SkillUnit` level
- derive grouped-band ranking outputs

## Phase 1.5 Deliverables

- `TaxonomyAssignment` ledger
- `TagAssignment` ledger
- `ScoreRecord` ledger
- grouped score-band result output

## Scope

Phase 1.5 covers:

- representative and install-relevant units from the current source set
- source tags
- runtime tags
- primary domain and function mode assignment
- initial grouped-band ranking for Codex Desktop use

Phase 1.5 does not yet add:

- exhaustive all-asset scoring
- live benchmark scores
- security scores
- natural-language query execution

## Score Families In Phase 1.5

Record:

- `static-structural`
- `codex-fit`
- `benchmark-readiness`

Use grouped presentation:

- `95-100`
- `80-94`
- `70-79`
- `50-69`
- `20-49`
- `<20`

## Ranking Rule

Primary comparison order:

1. `static-structural`
2. `codex-fit`
3. `benchmark-readiness`
4. lower unknown share

## Output Rule

Results should be explorable by:

- domain
- source tag
- score band

That is the minimum useful unit-level ranking surface for the current project.
