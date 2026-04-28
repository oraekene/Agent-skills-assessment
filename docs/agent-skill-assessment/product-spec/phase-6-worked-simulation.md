# Phase 6 Worked Simulation

This simulation shows how internal results become public directory pages.

## Scenario A: Public Domain Page

User visits:

- `Design and UX`

### Internal Inputs

- grouped-band internal results
- freshness from source snapshots
- evidence summaries from score records and benchmark status

### Public Output

Top visible bands:

- `strong`
  - `impeccable`
- `good`
  - `taste-redesign`

The page shows:

- concise summaries
- source labels
- freshness badges
- evidence badges

It does not show:

- raw score math
- unknown-share decimals
- low-level trace refs

## Scenario B: Public Task Search

User searches:

- `best skill for improving a SaaS dashboard UI`

### Internal Inputs

- Phase 2.5 parsed query
- shortlist logic
- better-alternative logic

### Public Output

The page shows:

- interpreted task summary
- top results
- short fit explanations

It does not expose:

- operator-only ranking diagnostics

## Scenario C: Public Skill Page

User opens:

- `impeccable`

### Public Output

Visible by default:

- public summary
- domain labels
- source label
- score band
- freshness
- evidence badge

On expansion:

- benchmark status summary
- higher-level score-family summary

## Scenario D: Public Source Page

User opens:

- `clawhub`

### Public Output

The page shows:

- source identity
- freshness state
- top skills from that source
- score-band distribution

This supports the user goal:

- view only one source's skills while still benefiting from our ranking system

## Scenario E: Public No-Match

User filters:

- runtime compatibility: `Figma live required`

Assume no public skill currently satisfies that filter.

The directory shows:

- no results
- failed constraint:
  - runtime compatibility
- deterministic relaxation suggestion:
  - remove live runtime requirement

## Why Phase 6 Matters

Phase 3.5 solved:

- internal operator-facing presentation

Phase 6 solves:

- public user-facing presentation

That distinction matters because the public layer must be:

- simpler
- safer
- less verbose
- less operationally dense
