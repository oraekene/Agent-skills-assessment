# Phase 1 Core Model

Phase 1 converts the current toolkit into a real internal comparison engine.

The goal is:

- move from repo-first comparison to skill-unit comparison
- keep source and package context
- produce machine-readable normalized records

## Phase 1 Deliverables

- normalized `Source` records
- normalized `Package` records
- normalized `SkillUnit` records
- `InventoryRecord` for each source
- `ExtractionRecord` for each unit
- first-pass `TaxonomyAssignment` records using V2.1
- source tag support
- grouped score-band output model

## Phase 1 Output Rule

Every source in the current comparison set should be representable as:

`Source -> Package -> SkillUnit[]`

No comparison logic should depend on repository name alone once normalized entities exist.

## Phase 1 Comparison Rule

During Phase 1:

- `SkillUnit` is the primary comparison object
- `Package` is the primary install object
- `Source` is the primary provenance and source-tag object

## Phase 1 Unit Types

Allowed unit types:

- `skill`
- `agent`
- `prompt`
- `workflow-unit`
- `template`
- `agents-contract`
- `validator`
- `command-bundle`

## Phase 1 Scoring Scope

Score at least:

- all representative skill units
- all install-relevant global contracts
- all flagship templates when templates are the source's main value

Do not score:

- generated duplicates by default
- build-only or packaging-only files as primary user-value units

## Phase 1 Rollup Scope

- each `Package` gets a derived install-oriented rollup
- each `Source` gets a derived provenance-oriented rollup
- rollups must be explicitly marked as derived, not primary
