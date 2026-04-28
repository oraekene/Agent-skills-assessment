# End-To-End Master Simulation

This file shows how the full system works in one realistic use case from start to finish.

It ties together:

- Phase 1 core model
- Phase 2 retrieval
- Phase 2.5 deterministic parsing
- Phase 3 runtime discovery and loading
- Phase 3.5 internal results surface
- Phase 4 benchmarking
- Phase 5 self-maintaining ingestion
- Phase 6 public directory
- Phase 7 extension
- Phase 8 security review

## The Real Use Case

The user wants:

- the best design-oriented skills for Codex Desktop
- specifically for auditing and improving a SaaS dashboard settings page
- with enough confidence to decide what to install
- while also keeping the future directory fresh and trustworthy

The system also tracks outside sources so the recommendation can improve when new skills appear.

## The Three Implementation Tracks Explained

### 1. Build The Real `SkillUnit` Extraction And Ledgers First

What it is:

- the backend normalization engine

What it builds:

- `Source -> Package -> SkillUnit[]`
- extraction ledgers
- taxonomy/tag ledgers
- score ledgers

What it is for:

- turning messy real repos into comparable units
- making every later feature possible

Why it matters:

- without this, the directory has nothing trustworthy to rank
- the public directory, runtime hints, extension, and benchmarks all depend on it

This is the best first implementation if your priority is:

- data correctness
- deterministic comparison
- future-proof architecture

### 2. Build The Actual Public Directory/API First

What it is:

- the user-facing browse/search layer plus the service layer behind it

What it builds:

- public pages
- task search
- skill pages
- source pages
- API payloads for the directory and extension

What it is for:

- making the project usable to real users quickly

Why it matters:

- it turns the framework into a visible product
- it is the layer other surfaces consume

This is the best first implementation if your priority is:

- showing value quickly
- sharing the project publicly
- getting feedback on presentation and search

### 3. Build The Runtime Discovery/Index Prototype First

What it is:

- the actual runtime behavior layer for installed skills

What it builds:

- skill root discovery
- precedence
- gating
- budgeted skill index
- progressive loading

What it is for:

- understanding what Codex would actually see and load in a live workspace

Why it matters:

- it solves a different problem from ranking
- it is the closest layer to actual agent behavior

This is the best first implementation if your priority is:

- real workspace behavior
- activation correctness
- context-efficiency experiments

## Which Track To Choose First

Recommended order:

1. `SkillUnit extraction and ledgers`
2. `public directory/API`
3. `runtime discovery/index prototype`

Reason:

- extraction gives you trustworthy data
- public directory proves the product
- runtime prototype refines real agent behavior after the data model is stable

## Immediate Files To Read For Applied Examples

If you want to immediately see the features in use, these are the highest-value files:

- [phase-5-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-5-worked-simulation.md)
  - ingestion and downstream reruns
- [phase-3-runtime-workflow-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3-runtime-workflow-simulation.md)
  - runtime discovery, gating, budget, activation, loading
- [phase-3.5-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3.5-worked-simulation.md)
  - grouped bands, shortlists, better alternatives
- [phase-4-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-4-worked-simulation.md)
  - succeeded, blocked, and not-run benchmark states
- [phase-6-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-6-worked-simulation.md)
  - public directory pages
- [phase-7-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-7-worked-simulation.md)
  - extension behavior on third-party pages
- [phase-8-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-8-worked-simulation.md)
  - security review outcomes

If you want the machine-readable side of the same story:

- [phase-1.5-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-1.5-ledger.round1.json)
- [phase-2.5-query-parses.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-2.5-query-parses.round1.json)
- [phase-3-runtime-index-example.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3-runtime-index-example.round1.json)
- [phase-3.5-results-surface-example.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3.5-results-surface-example.round1.json)
- [phase-4-benchmark-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-4-benchmark-ledger.round1.json)
- [phase-5-ingestion-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-5-ingestion-ledger.round1.json)
- [phase-6-public-directory-example.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-6-public-directory-example.round1.json)
- [phase-7-extension-example.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-7-extension-example.round1.json)
- [phase-8-security-review.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-8-security-review.round1.json)

## End-To-End Flow

## Step 1: Source Registration

The operator registers sources such as:

- `openai/skills`
- `anthropics/skills`
- `taste-skill`
- `impeccable`
- future directory pages like `OpenClaw`

What is created:

- `SourceRegistryRecord`

Why it matters:

- the system now knows what to track
- sync policies and trust tiers are explicit

## Step 2: Sync And Snapshot

The ingestion system runs a sync job.

What happens:

1. source metadata is fetched
2. inventory is fetched
3. a new source snapshot is stored

What is created:

- `SourceSyncJob`
- `SourceSnapshot`

Why it matters:

- every later claim can point back to a concrete source state

## Step 3: Change Detection

The system compares the new snapshot to the previous one.

Possible outputs:

- no material change
- new package
- new skill unit
- modified score-relevant unit

What is created:

- `ChangeSet`
- `ReprocessingPlan`

Why it matters:

- the system reruns only what is necessary

## Step 4: Inventory And Extraction

The source contents are normalized into:

- `Source`
- `Package`
- `SkillUnit[]`

Example:

- repo contains many files
- extractor identifies one main design skill, one supporting prompt, and one install contract

What is created:

- inventory record
- extraction record
- normalized units

Why it matters:

- comparison no longer depends on repo size or README marketing

## Step 5: Taxonomy And Tagging

Each `SkillUnit` is assigned:

- primary domain
- function mode
- source tags
- runtime tags
- task tags where supported

Example:

- `impeccable`
  - domain: `design-and-ux`
  - modes: `audit`, `improve`
  - runtime tag: `codex-compatible`

Why it matters:

- retrieval and better-alternative logic now have structured meaning

## Step 6: Static Scoring

The system scores each `SkillUnit` on:

- `static-structural`
- `codex-fit`
- `benchmark-readiness`

Why it matters:

- this is the base ranking signal before live benchmark data exists

## Step 7: Security Review

Separately, the system reviews for:

- dangerous commands
- remote execution risk
- secret handling risk
- deceptive behavior

Why it matters:

- a high-quality skill can still be risky
- security must not be hidden inside quality score

What is created:

- security findings
- security result state
- optional block recommendation

## Step 8: Internal Retrieval

The user asks:

`Find the best skill for auditing and improving a SaaS dashboard settings page in Codex.`

The parser:

1. classifies query type
2. extracts domain, mode, tags, runtime constraints
3. records the basis for each extracted field

Why it matters:

- the search is deterministic, not vibe-based

What is created:

- parsed query record
- candidate set
- ranked set

## Step 9: Internal Results Surface

The ranked results are shown internally as:

- grouped bands
- shortlist
- per-skill detail
- better alternatives

Example shortlist:

1. `impeccable`
2. `taste-redesign`
3. `taste-skill`

Why it matters:

- the operator can actually make decisions without reading raw JSON

## Step 10: Install Decision

The operator chooses:

- install `impeccable`
- optionally install `taste-redesign` as a secondary style skill

Why it matters:

- this is the practical output of the whole comparison system

## Step 11: Runtime Discovery And Loading

Now the user is inside Codex Desktop, editing:

- `apps/dashboard/src/pages/Settings.tsx`

The runtime subsystem:

1. discovers local and user skill roots
2. resolves shadowing
3. checks gating
4. builds a budgeted skill index
5. activates matching skills

Example outcome:

- `dashboard-ui-audit`
  - activated due to local path match
- `impeccable`
  - activated as best design-audit helper
- `browser-use:browser`
  - activated as runtime helper

Why it matters:

- this is what the model actually sees and loads at run time

## Step 12: Benchmark Definition

The operator wants deeper confidence.

A benchmark is defined:

- `SaaS Dashboard Design Audit`

It specifies:

- task prompt
- required artifacts
- checks
- runner type

Why it matters:

- ranking can later be grounded in observed performance

## Step 13: Benchmark Execution

Two possible outcomes:

### Success case

- simulated or live benchmark runs
- artifacts and traces exist
- metrics are scored

### Blocked case

- runtime or secrets missing
- run is blocked
- no fake score is created

Why it matters:

- truthfulness is preserved

## Step 14: Public Directory Publication

The same internal results are transformed into public-safe pages:

- domain page
- task results page
- skill page
- source page

The public sees:

- score band
- concise explanation
- freshness
- evidence summary

The public does not see:

- operator-only diagnostics
- raw traces

## Step 15: Chrome Extension Augmentation

A user visits:

- `pbakaus/impeccable` on GitHub

The extension:

1. detects the source with high confidence
2. fetches the central public payload
3. injects a badge
4. shows a popover with score band and alternatives

Why it matters:

- the user gets directory intelligence on third-party pages

## Step 16: Ongoing Refresh

Weeks later, a tracked source updates.

The ingestion system:

1. detects the change
2. refreshes extraction
3. refreshes taxonomy/tags if needed
4. refreshes scores
5. refreshes public and internal results

Why it matters:

- the directory stays current without manual rebuilds

## Step 17: What The User Actually Gets

At the end of the full flow, the user can:

- compare skill libraries fairly
- pick the best install candidate for a task/domain
- understand runtime behavior separately from ranking
- see benchmark truthfulness
- see public directory results
- see extension badges on third-party pages
- avoid risky skills through separate security review

## What Every Major Feature Is For

### `SkillUnit` extraction

Purpose:

- make comparison real and granular

### Taxonomy and tags

Purpose:

- make retrieval structured and reusable

### Static scoring

Purpose:

- provide first-pass quality ranking

### Retrieval and parsing

Purpose:

- convert user needs into deterministic search

### Internal results surface

Purpose:

- help operators decide quickly

### Runtime subsystem

Purpose:

- model what the agent actually loads and uses

### Benchmarking

Purpose:

- validate performance with evidence

### Self-maintaining ingestion

Purpose:

- keep the directory current over time

### Public directory

Purpose:

- expose the system to normal users

### Extension

Purpose:

- bring the ranking context to third-party pages

### Security review

Purpose:

- keep risky skills from being recommended blindly

## Best Single Reading Path For This Master Flow

Read in this order:

1. [phase-5-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-5-worked-simulation.md)
2. [phase-3-runtime-workflow-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3-runtime-workflow-simulation.md)
3. [phase-3.5-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-3.5-worked-simulation.md)
4. [phase-4-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-4-worked-simulation.md)
5. [phase-6-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-6-worked-simulation.md)
6. [phase-7-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-7-worked-simulation.md)
7. [phase-8-worked-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/product-spec/phase-8-worked-simulation.md)
8. this file
