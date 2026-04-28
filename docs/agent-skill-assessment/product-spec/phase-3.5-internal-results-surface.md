# Phase 3.5 Internal Results Surface

Phase 3.5 defines the first real internal presentation surface for skill-level ranking results.

This phase does not change:

- scoring
- taxonomy
- runtime discovery

It changes how the internal engine exposes results to a human operator.

## Goal

The goal is to make ranking outputs usable without forcing the user to inspect raw ledgers.

The surface must support:

- grouped-band overviews
- shortlists
- per-skill detail views
- direct comparison views
- better-alternative suggestions

## Core Rule

The results surface must prioritize:

1. grouped band first
2. concise explanation second
3. exact score and raw details only on expansion

This preserves readability while keeping the system auditable.

## Inputs

The results surface consumes:

- Phase 1.5 unit ranking data
- Phase 2 and 2.5 retrieval outputs
- runtime eligibility hints when available
- benchmark status when available

## Result Surface Types

### 1. Grouped-Band Domain View

Purpose:

- show the best skills for a broad domain

Default content:

- domain name
- score bands
- skills grouped under each band
- one-line explanation per skill

### 2. Task Shortlist View

Purpose:

- answer a specific task query with a ranked shortlist

Default content:

- parsed task summary
- top candidates
- why each candidate matched
- why lower candidates lost

### 3. Skill Detail View

Purpose:

- inspect one skill deeply

Default content:

- score band
- exact score on expand
- score-family breakdown
- taxonomy assignment
- tags
- evidence coverage
- benchmark state
- runtime notes
- better alternatives

### 4. Direct Comparison View

Purpose:

- compare two or more compatible skills side by side

Default content:

- shared comparison slice
- band
- major strengths
- major weaknesses
- missing evidence

### 5. Source Slice View

Purpose:

- inspect a source tag or source library without reverting to repo-first thinking

Default content:

- source tag
- visible skill units
- score-band distribution
- top units

## Output Objects

The surface should produce:

- `BandGroupResult`
- `ShortlistResult`
- `SkillDetailResult`
- `DirectComparisonResult`
- `BetterAlternativeResult`

## Grouped-Band Rules

Use these display bands:

- `95-100` top layer
- `80-94` second layer
- `70-79` third layer
- `50-69` fourth layer
- `20-49` fifth layer
- `<20` low confidence or low quality

### Group Rule

Every visible candidate must belong to exactly one display band.

### Sorting Rule

Within each band, sort by:

1. total ranking score
2. lower unknown share
3. higher static-structural
4. lexical ascending `unit_id`

## Shortlist Rules

### Default Shortlist Length

Return:

- top `3` by default
- top `5` when the result set is crowded

### Shortlist Eligibility Rule

Shortlist entries must satisfy:

- same compatible domain slice
- same compatible mode slice when relevant
- same runtime constraint slice when present

### Shortlist Explanation Rule

Each shortlist entry must show:

- `why matched`
- `why ranked here`
- `what evidence is missing`

## Skill Detail Rules

The detail view is the first place exact scores are shown by default.

### Collapsed State

Show:

- skill name
- score band
- short description
- one-line tradeoff summary

### Expanded State

Show:

- exact total score
- score-family breakdown
- taxonomy assignment
- tag set
- source provenance
- runtime fit notes
- benchmark readiness
- live benchmark state if any
- evidence coverage
- unknown share

## Better Alternatives Logic

This is a first-class object, not a sidebar afterthought.

### Compatibility Rule

A better alternative must:

- be in the same compatible domain slice
- be in the same compatible function-mode slice when relevant
- satisfy the same hard runtime constraints
- satisfy the same required tags

### Better Rule

Alternative `B` is better than viewed skill `A` if:

- `B` has a higher total score

or

- `B` has the same band but lower unknown share and better runtime fit

### Suggestion Limit

Show:

- up to `3` better alternatives

### Suppression Rule

Do not show better alternatives if:

- no compatible candidate outranks the viewed skill
- all compatible outranking candidates differ on a hard constraint

## Result Explanation Rules

Every result surface must answer:

- why this item is here
- why it is above or below nearby candidates
- what evidence is still missing

## Internal Card Model

Each skill card should contain:

- `unit_id`
- `display_name`
- `score_band`
- `short_explanation`
- `domain_labels`
- `mode_labels`
- `source_label`
- `runtime_flags`
- `benchmark_flag`
- `expandable=true`

## Empty-State Rules

If a query returns no candidates:

show:

- which hard filter failed
- whether the issue was domain, mode, runtime, or source constraint
- one relaxation suggestion if deterministically available

Do not fabricate near matches.

## Internal Results Surface Success Condition

The user can:

- browse a domain without opening raw JSON
- ask for a task and get a small ranked shortlist
- open one skill and understand its tradeoffs
- see better alternatives for the same use-case slice
- expand to exact details only when needed
