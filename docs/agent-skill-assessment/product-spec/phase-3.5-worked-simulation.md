# Phase 3.5 Worked Simulation

This file simulates the first internal results surface using existing unit rankings and query results.

## Scenario A: Domain Browse

User asks:

`Show me the best design and UX skills for Codex.`

### Input Records Used

- Phase 1.5 unit ranking ledger
- Phase 2 query result examples
- Phase 2.5 parser outputs

### Surface Output

Band `80-94`

- `impeccable`
  - strongest current design audit and improvement candidate

Band `70-79`

- `taste-redesign`
  - strong redesign-specific taste guidance
- `taste-skill`
  - broader anti-generic design pressure

### Why This Surface Matters

The user sees the answer in one glance:

- top layer
- second layer
- concise tradeoffs

without opening raw ledgers.

## Scenario B: Task Shortlist

User asks:

`Find the best skill for auditing and improving a SaaS dashboard UI.`

### Shortlist Output

1. `impeccable`
   - best structural and design-craft fit
2. `taste-redesign`
   - strongest secondary redesign candidate
3. `taste-skill`
   - broad design-taste fallback

### Explanation Pattern

For each item:

- why matched
- why ranked here
- what evidence is missing

## Scenario C: Skill Detail View

User opens `taste-redesign`.

### Collapsed View

- score band: `70-79`
- summary:
  - focused redesign skill with strong visual taste pressure

### Expanded View

- taxonomy:
  - primary domain: `design-and-ux`
- benchmark state:
  - `not-run`
- unknown share:
  - `0.18`
- runtime note:
  - Codex-compatible as a user-installed skill unit

## Scenario D: Better Alternatives

User is viewing `taste-redesign`.

The system checks the compatible slice:

- domain: `design-and-ux`
- mode: `redesign/improve`
- runtime: `codex`

It finds one better alternative:

- `impeccable`
  - higher overall score
  - stronger structural rigor
  - better design-audit fit

### Suppression Example

If the user views `impeccable`, the system does not show `taste-redesign` as a better alternative because no compatible candidate outranks it in the same slice.

## Scenario E: No-Match Surface

User asks:

`Show only Figma-only skills that can run fully in this environment right now.`

Assume:

- `figma-to-ui` is blocked because `figma-cli` and `FIGMA_TOKEN` are missing

### Surface Output

- no matching skills
- failing hard filter:
  - runtime eligibility
- explanation:
  - `figma-to-ui` exists but is blocked by missing binary and missing secret
- deterministic relaxation suggestion:
  - remove the `run fully right now` constraint

## Why Phase 3.5 Is Separate

Phase 3 answers:

- what would load at runtime

Phase 3.5 answers:

- how those ranked or retrieved results should be presented to an internal user

That separation keeps:

- runtime behavior
- ranking
- presentation

cleanly decoupled.
