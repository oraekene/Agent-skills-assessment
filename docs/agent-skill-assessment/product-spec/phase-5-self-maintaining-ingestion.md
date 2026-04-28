# Phase 5 Self-Maintaining Ingestion

Phase 5 defines how the directory keeps itself current as sources change.

## Goal

The goal is to move from:

- manually curated source assessment

to:

- repeatable source registration
- scheduled or event-driven sync
- deterministic change detection
- automatic downstream reprocessing

## Core Rule

Ingestion is responsible for:

- discovering that source state changed
- creating a new source snapshot
- triggering the right downstream work

Ingestion is not responsible for:

- inventing taxonomy ad hoc
- fabricating scores
- collapsing source history

## Ingestion Objects

Phase 5 uses these core objects:

- `SourceRegistryRecord`
- `SourceSyncJob`
- `SourceSnapshot`
- `ChangeSet`
- `ReprocessingPlan`
- `IngestionEvent`

## 1. SourceRegistryRecord

Defines a tracked source.

Required fields:

- `source_id`
- `source_type`
- `origin`
- `enabled`
- `sync_policy`
- `discovery_policy`
- `provenance_tags`

Supported source types:

- `github-repo`
- `github-org-collection`
- `skills-directory-page`
- `well-known-skill-endpoint`
- `curated-bundle`
- `local-import`
- `plugin-marketplace`

## 2. SourceSyncJob

Represents one attempt to sync a source.

Required fields:

- `job_id`
- `source_id`
- `trigger_type`
- `job_state`
- `started_at`
- `ended_at`

Allowed `trigger_type` values:

- `manual`
- `scheduled`
- `webhook`
- `dependency-change`
- `registry-refresh`

Allowed `job_state` values:

- `queued`
- `running`
- `completed`
- `failed`
- `blocked`
- `cancelled`

## 3. SourceSnapshot

Represents one fetched view of a source at a point in time.

Required fields:

- `snapshot_id`
- `source_id`
- `source_version_ref`
- `fetched_at`
- `fetch_state`
- `inventory_ref`

Fetch state values:

- `fetched`
- `partial`
- `failed`
- `blocked`

## 4. ChangeSet

Captures the difference between two snapshots.

Required fields:

- `change_set_id`
- `source_id`
- `previous_snapshot_id`
- `current_snapshot_id`
- `change_summary`

Change categories:

- `source-metadata-changed`
- `package-added`
- `package-removed`
- `unit-added`
- `unit-removed`
- `unit-modified`
- `generated-only-change`
- `non-material-change`

## 5. ReprocessingPlan

Determines which downstream stages must rerun.

Possible actions:

- `skip`
- `rerun-inventory`
- `rerun-extraction`
- `rerun-taxonomy`
- `rerun-tagging`
- `rerun-scoring`
- `rerun-results-surface`
- `rerun-runtime-index-hints`

## Source Registration Rules

### Registration Inputs

Each source registration must specify:

- what kind of source it is
- how it should be fetched
- whether it is trusted
- whether it is writable
- how often it may be synced

### Trust Rule

Every source must have an explicit trust tier:

- `internal-trusted`
- `curated-external`
- `community-external`
- `untrusted-external`

Trust tier does not affect ranking directly.

It affects:

- execution policy
- dangerous-scan defaults
- auto-installability assumptions

## Sync Policies

Each source must declare one sync policy:

- `manual-only`
- `daily`
- `weekly`
- `on-webhook`
- `on-demand-with-cache`

## Discovery Policies

Each source must declare one discovery policy:

- `explicit-only`
- `follow-listed-children`
- `follow-registry-links`
- `scan-well-known-index`

## Fetch Rules

The fetch stage must be deterministic.

For each job:

1. read source registry record
2. resolve fetch target
3. fetch metadata
4. fetch source inventory
5. write a new snapshot or a failed fetch record

If fetch fails:

- job may complete with failure
- previous snapshot remains valid
- no downstream reprocessing occurs unless partial data was usable

## Change Detection Rules

Compare:

- source metadata
- package list
- unit candidate list
- source-of-truth files

Do not treat these as material by default:

- generated output only
- README wording only
- formatting-only file movement with no unit change

### Material Change Rule

A change is material if it affects one or more of:

- visible packages
- extracted skill units
- unit metadata used for triggering
- runtime eligibility metadata
- score-relevant content

## Downstream Reprocessing Rules

### Skip Rule

If the change set is `non-material-change` only:

- keep existing extraction and scores
- write a new snapshot and change record

### Partial Rerun Rule

If only unit metadata changed:

- rerun extraction
- rerun taxonomy/tagging if affected
- rerun scoring if score-relevant fields changed

### Full Rerun Rule

If packages or units were added or removed:

- rerun inventory
- rerun extraction
- rerun taxonomy/tagging
- rerun scoring
- rerun results surfaces

## Queueing Rules

When a sync job completes with a material change:

- enqueue a reprocessing plan
- downstream jobs run in dependency order

Recommended dependency order:

1. inventory
2. extraction
3. taxonomy/tagging
4. scoring
5. retrieval indexes
6. results surfaces
7. runtime hint refresh

## Taxonomy Drift Rule

Ingestion may trigger taxonomy extension review only when:

- newly extracted units repeatedly fail assignment under current registry

Ingestion may not create new domains directly.

It may only create:

- `TaxonomyExtensionProposal`

## Staleness Rules

A source becomes stale when:

- sync policy says it should have refreshed
- last successful snapshot is older than the allowed interval

Staleness must be visible in source outputs.

Staleness does not erase prior rankings.

It reduces freshness confidence.

## Deletion Rules

If a source disappears or is disabled:

- retain historical snapshots
- mark source inactive
- mark derived current results stale

Do not hard-delete historical evidence by default.

## Self-Maintaining Success Condition

The system can:

- register new sources deterministically
- detect meaningful source changes
- rerun only the necessary downstream work
- preserve historical snapshots
- keep public and internal results synchronized with source changes
