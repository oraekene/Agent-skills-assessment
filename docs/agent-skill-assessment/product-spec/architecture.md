# Architecture

## Product Summary

The product is a `skill assessment and discovery platform` that helps users find the best skill units for:

- broad domains
- specific tasks
- specific runtimes such as Codex Desktop

The system must support both:

- current use:
  - compare the skills libraries you already have and pick the best ones to install
- future use:
  - ingest many skill collections automatically and maintain a ranked directory

## Core Architectural Decision

The primary object is a `SkillUnit`, not a repository.

Repositories are containers and evidence sources.

The system architecture should therefore be organized around six persistent layers:

1. `source ingestion`
2. `skill-unit extraction and normalization`
3. `taxonomy and tagging`
4. `scoring and ranking`
5. `runtime discovery and progressive loading`
6. `presentation and consumption`

## Subsystems

## 1. Source Ingestion

Purpose:

- register and sync upstream sources

Supported source types:

- GitHub repo
- GitHub org or collection
- skills directory page
- curated bundle
- local imported pack

Responsibilities:

- fetch source metadata
- detect changes
- snapshot source state
- track provenance

Outputs:

- `Source`
- `Package`
- raw inventory snapshot

## 2. Inventory And Extraction

Purpose:

- convert raw source contents into normalized skill units

Responsibilities:

- full inventory of relevant files
- identify source-of-truth vs generated files
- identify flagship assets
- extract installable or usable units
- detect duplicates and packaging-only files

Outputs:

- `SkillUnit`
- `InventoryRecord`
- `ExtractionRecord`

## 3. Taxonomy And Tagging

Purpose:

- assign broad reusable classification without ad hoc drift

Responsibilities:

- domain assignment using V2.1 registry
- function-mode assignment using V2.1 registry
- assign source, industry, role, scope, and runtime tags
- invoke extension protocol only when necessary

Outputs:

- `TaxonomyAssignment`
- `TagAssignment`
- optional `TaxonomyExtensionProposal`

## 4. Scoring

Purpose:

- evaluate intrinsic quality and install/usefulness without popularity

Score families in first serious version:

- `StaticStructuralScore`
- `CodexFitScore`
- `BenchmarkReadinessScore`

Later score families:

- `LiveBenchmarkScore`
- `SecurityReviewScore`

Responsibilities:

- deterministic static scoring
- environment fit scoring
- source/package/unit rollups
- score band assignment

Outputs:

- `ScoreRecord`
- `RollupScoreRecord`

## 5. Retrieval And Ranking

Purpose:

- return the best candidates for browsing and task-specific queries

Retrieval modes:

- browse by domain
- browse by source
- browse by tag
- compare selected units
- natural-language task query

Responsibilities:

- parse user query into structured intent
- filter by taxonomy and constraints
- rank candidates
- generate explanation payloads

Outputs:

- `ComparisonResult`
- `TaskMatchResult`

## 6. Benchmarking Subsystem

Purpose:

- define, run, store, and compare benchmark results

This is a separate subsystem because it has:

- its own object model
- its own runner model
- its own lifecycle

Outputs:

- `BenchmarkDefinition`
- `BenchmarkResult`

## 7. Runtime Skill Discovery And Progressive Loading

Purpose:

- make installed skills behave correctly at runtime

Responsibilities:

- discover skill roots from local, nested, plugin, and external directories
- resolve precedence and shadowing
- gate skills by environment and safety state
- build a hard-budget metadata index
- activate skills explicitly or implicitly
- progressively load `SKILL.md` and supporting files
- expose file-backed runtime artifacts
- preserve activated skills across compaction

Outputs:

- `RuntimeSkillIndex`
- `RuntimeActivationRecord`
- `RuntimeSkillArtifactHandle`

## 8. Presentation Layer

Purpose:

- present scores without overwhelming the user

Default presentation behavior:

- show grouped score bands first
- hide precise numeric score unless expanded
- always show explanation and evidence availability

Consumers:

- internal workspace docs and JSON
- later web directory
- later Chrome extension

## Rollup Rules

## Unit Level

The primary ranked object.

## Package Level

Derived from its constituent units plus package install/runtime signals.

## Source Level

Derived from its packages and units plus source-level metadata.

Restrictions:

- large sources must not win because they contain many files
- generated duplicates do not count as separate user-value units

## Storage Strategy

The first build should store canonical records in machine-readable JSON or database-ready shapes that can later move into a real datastore without redesign.

Recommended persistence model:

- append-only evidence and result records
- versioned taxonomy registry
- versioned scoring results
- rerunnable extraction and ranking

## Non-Goals For First Build

- popularity-aware ranking
- full autonomous internet-scale crawling
- full security review engine
- browser extension implementation
- guaranteed live benchmark execution for every runtime
