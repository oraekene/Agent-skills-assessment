# Retrieval And Ranking

## Goal

Users should be able to find:

- the best skill for a broad domain
- the best skill for a specific task
- the best skill from a specific source

The system should answer those questions without relying on popularity.

## Retrieval Modes

## 1. Domain Browse

Examples:

- best `design-and-ux` skills
- best `marketing-and-growth` skills

Inputs:

- domain
- optional mode
- optional runtime constraint
- optional source filter

## 2. Source Browse

Examples:

- show only `OpenClaw` skills
- show only `Voltagent` skills

Inputs:

- source tag or source id
- optional domain filter
- optional score band filter

## 3. Tag Browse

Examples:

- show only `Codex-compatible` skills
- show only `regulated` skills

Inputs:

- one or more tag filters

## 4. Direct Comparison

Examples:

- compare these three design skills
- compare two TDD skills

Inputs:

- selected unit ids
- optional comparison context

## 5. Natural-Language Task Match

Examples:

- "I want a skill for writing launch emails in a founder voice"
- "Find the best skill for improving a SaaS dashboard UI in Codex"

Inputs:

- query text
- optional environment constraints

## Query Pipeline

The first version should use `structured retrieval first`.

## Stage 1: Intent Parsing

Infer:

- task objective
- target artifact type
- likely domain
- likely function modes
- likely tags
- runtime constraints

## Stage 2: Structured Mapping

Map parsed intent to:

- canonical domains
- function modes
- tag filters
- score-family requirements

## Stage 3: Candidate Retrieval

Retrieve candidates by:

- domain match
- mode match
- runtime fit
- source filter
- installability filter

## Stage 4: Weighted Ranking

Rank using:

- `StaticStructuralScore`
- `CodexFitScore`
- domain fit
- mode fit
- task-tag fit
- install friction
- evidence coverage
- unknown share penalty
- benchmark readiness

Do not use:

- popularity signals

## Stage 5: Explanation Generation

For each result, generate:

- why it matched
- why it outranked nearby alternatives
- what evidence is missing

## Ranking Behavior

## Broad Domain Ranking

Use when the user is browsing generally.

Priority:

- intrinsic quality
- environment fit
- broad domain match

## Exact-Need Ranking

Use when the user gives a specific task.

Priority:

- domain fit
- mode fit
- task-tag fit
- runtime fit
- intrinsic quality

## Tie-Break Order

1. higher total ranking score
2. lower unknown share
3. lower install/runtime burden
4. better benchmark availability state

## Result Presentation

Default results:

- grouped by score band
- short explanation per skill
- exact score hidden until expanded

Expanded result:

- exact score
- score-family breakdown
- evidence coverage
- taxonomy assignment
- install/runtime notes
- better alternatives nearby

## Better Alternatives Logic

When a user views a skill, the system should be able to suggest better alternatives for the same use-case slice.

Constraint:

- alternatives must come from the same compatible domain/mode/task slice

This supports the future Chrome extension.
