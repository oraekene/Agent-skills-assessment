# Data Model

## Primary Entity Rule

The primary entity is `SkillUnit`.

A `SkillUnit` may be:

- skill
- agent
- prompt
- workflow unit
- template
- AGENTS contract
- validator
- command bundle

## Entity Graph

`Source -> Package -> SkillUnit`

Supporting records:

- `InventoryRecord`
- `ExtractionRecord`
- `TaxonomyAssignment`
- `TagAssignment`
- `ScoreRecord`
- `BenchmarkDefinition`
- `BenchmarkResult`
- `ComparisonResult`

## Core Entities

## Source

Represents an upstream origin.

Fields:

- `source_id`
- `source_name`
- `source_type`
- `origin_url`
- `source_tags`
- `default_runtime_claims`
- `sync_state`
- `last_seen_at`

## Package

Represents an installable or grouped distribution surface within a source.

Fields:

- `package_id`
- `source_id`
- `package_name`
- `install_surface`
- `runtime_support`
- `package_tags`
- `package_status`

## SkillUnit

The main scored and ranked object.

Fields:

- `unit_id`
- `package_id`
- `unit_type`
- `display_name`
- `path`
- `source_of_truth`
- `is_generated_duplicate`
- `installability_state`
- `description`
- `provenance_refs`

## InventoryRecord

Represents a full file inventory pass.

Fields:

- `inventory_id`
- `source_id`
- `relevant_file_count`
- `relevant_file_types`
- `flagship_candidates`
- `generated_duplicate_groups`
- `inventory_timestamp`

## ExtractionRecord

Represents how a file or asset became a normalized unit.

Fields:

- `extraction_id`
- `unit_id`
- `input_paths`
- `extraction_reason`
- `unit_boundary_notes`

## TaxonomyAssignment

Fields:

- `assignment_id`
- `unit_id`
- `taxonomy_version`
- `primary_domain`
- `hybrid_primary_members`
- `secondary_domains`
- `function_modes`
- `industry_tags`
- `role_tags`
- `context_scope_tags`
- `assignment_evidence_refs`

## TagAssignment

Fields:

- `tag_assignment_id`
- `subject_type`
- `subject_id`
- `tag_family`
- `tag_id`
- `tag_label`
- `assignment_evidence_type`
- `assignment_basis`

Required tag families in first version:

- `source`
- `runtime`
- `industry`
- `role`
- `context_scope`
- `task`
- `risk`
- `quality`

## ScoreRecord

Fields:

- `score_id`
- `subject_type`
- `subject_id`
- `score_family`
- `score_value`
- `score_band`
- `rubric_version`
- `evidence_coverage`
- `unknown_share`
- `derived_share`
- `score_components`

## BenchmarkDefinition

Fields:

- `benchmark_id`
- `benchmark_name`
- `target_domains`
- `target_modes`
- `benchmark_type`
- `prompt_or_task`
- `required_artifacts`
- `acceptance_checks`
- `fixture_refs`
- `runner_requirements`
- `observability_requirements`

## BenchmarkResult

Fields:

- `benchmark_result_id`
- `benchmark_id`
- `unit_id`
- `runner_type`
- `status`
- `trace_refs`
- `artifact_refs`
- `result_metrics`
- `observed_failures`
- `result_timestamp`

Allowed statuses:

- `not-defined`
- `defined-not-runnable`
- `runnable-not-run`
- `run-succeeded`
- `run-failed`
- `blocked`
- `stale`

## ComparisonResult

Fields:

- `comparison_id`
- `query_type`
- `query_text`
- `filters`
- `candidate_ids`
- `ranking_order`
- `grouped_band_output`
- `explanation_payload`

## Rollup Rules

## Package Rollup

Derived from:

- constituent unit scores
- package install surface quality
- package runtime support

Must not:

- count generated duplicates as separate top-value units

## Source Rollup

Derived from:

- package scores
- source-level evidence and maintenance signals
- distribution of score bands across units

Must not:

- reward sheer size without corresponding unit quality

## Score Bands

Presentation bands:

- `95-100`
- `80-94`
- `70-79`
- `50-69`
- `20-49`
- `<20`

Default UI rule:

- show band first
- show exact number only on expansion

## Popularity Exclusion Rule

The data model should not include ranking inputs such as:

- GitHub stars
- Twitter likes
- Reddit upvotes

If community commentary is added later, it should exist as evidence objects, not ranking primitives.
