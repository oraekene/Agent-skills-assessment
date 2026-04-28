# Phase 6 Public Directory

Phase 6 defines the first public-facing directory surface.

## Goal

The goal is to expose the system to public users in a way that is:

- simple to browse
- honest about evidence
- useful without reading raw internals
- compatible with future extension surfaces

## Core Rule

The public directory must be simpler than the internal operator surface.

Public users should see:

- grouped bands
- clear labels
- short explanations
- confidence and freshness cues

Public users should not be forced to see:

- raw ledger internals
- low-level trace refs
- verbose operator-only diagnostics

## Public Surface Types

### 1. Home Discovery Surface

Purpose:

- orient a user quickly

Default content:

- featured domains
- featured task prompts
- top skill bands
- recently updated sources

### 2. Domain Browse Page

Purpose:

- show the best public candidates for one domain

Default content:

- domain title and definition
- grouped score bands
- public skill cards
- filters

### 3. Task Search Results Page

Purpose:

- answer natural-language need with public-safe ranked results

Default content:

- interpreted task summary
- top candidates
- why they fit
- expand for more detail

### 4. Skill Detail Page

Purpose:

- explain one skill in a human-friendly way

Default content:

- public summary
- band
- source
- compatible domains and use cases
- better alternatives
- freshness and evidence indicators

### 5. Source Page

Purpose:

- let users browse one source tag or source collection

Default content:

- source identity
- source description
- top public skills from that source
- score-band distribution
- source freshness state

## Public Card Rules

Each public card should contain:

- `display_name`
- `score_band`
- `one_line_summary`
- `domain_labels`
- `source_label`
- `freshness_state`
- `evidence_badge`
- `expandable`

## Public Score Presentation Rules

### Default Rule

Show:

- score band

Do not show exact numeric score by default.

### Expanded Rule

On expansion, show:

- score-family summary
- evidence coverage summary
- benchmark state summary
- freshness state

### Public Band Labels

Use user-friendly labels:

- `95-100` top layer
- `80-94` strong
- `70-79` good
- `50-69` mixed
- `20-49` weak
- `<20` limited confidence

## Public Explanation Rules

Every public result should answer:

- what this skill is good for
- why it appears here
- what level of confidence the directory has

Use shorter language than internal surfaces.

## Public Evidence Rules

Public pages must expose evidence without overwhelming users.

Show:

- evidence coverage summary
- benchmark status summary
- freshness summary

Hide by default:

- raw traces
- operator notes
- low-level ingestion job records

## Public Freshness Rules

Every public source or skill page should include one freshness state:

- `fresh`
- `recently-updated`
- `stale`
- `historical`

Freshness derives from Phase 5 source snapshots.

## Public Task Search Rules

Task search should use:

- Phase 2.5 parser
- public-safe shortlist rendering

Task search results must show:

- interpreted query
- candidate cards
- optional relaxation suggestion when no results exist

## Public Better Alternatives Rules

Better alternatives remain important in public surfaces.

### Public Suggestion Rule

When a user is viewing one skill:

- show up to `3` better compatible alternatives

### Public Justification Rule

Use short justification such as:

- better fit for design audits
- stronger evidence coverage
- more suitable for Codex-style workflows

## Public Filtering Rules

Public filters should include:

- domain
- source
- score band
- runtime compatibility
- benchmark state
- freshness

## Public No-Match Rules

If a public query returns no results:

show:

- no-match message
- failed constraint category
- one deterministic relaxation suggestion if available

Do not fabricate approximate matches.

## Public vs Internal Surface Boundary

Public surfaces optimize for:

- comprehension
- discoverability
- confidence cues

Internal surfaces optimize for:

- operator diagnostics
- score auditing
- detailed reasoning

The public directory may link to deeper internal detail only for authorized operator roles, not by default.

## Public Directory Success Condition

The public directory lets a user:

- browse domains
- search by task
- inspect one skill
- inspect one source
- see better alternatives
- understand confidence and freshness

without needing access to raw internal ledgers
