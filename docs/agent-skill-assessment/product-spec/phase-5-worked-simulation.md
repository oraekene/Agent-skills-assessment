# Phase 5 Worked Simulation

This simulation shows a newly refreshed source flowing through the self-maintaining ingestion system.

## Scenario

Tracked source:

- `src-clawhub-example`

Source type:

- `skills-directory-page`

Sync policy:

- `daily`

Discovery policy:

- `follow-listed-children`

## Step 1: Scheduled Sync Trigger

At the daily interval, the scheduler creates:

- `job-clawhub-001`

Trigger type:

- `scheduled`

## Step 2: Fetch

The fetch stage:

1. reads the registry record
2. resolves the root page
3. fetches directory metadata
4. fetches listed child entries
5. writes a new source snapshot

Outcome:

- previous snapshot:
  - `snap-clawhub-prev`
- current snapshot:
  - `snap-clawhub-cur`

## Step 3: Change Detection

The system compares old and new snapshots.

Detected changes:

- one new package listed
- one new skill unit discovered
- one existing skill unit changed in score-relevant metadata

Not detected as material:

- cosmetic text-only differences in unrelated listing copy

Result:

- `chg-clawhub-001`

Change summary:

- `package-added`
- `unit-added`
- `unit-modified`

## Step 4: Reprocessing Plan

Because the change is material, the system does not skip.

It creates:

- `plan-clawhub-001`

Actions:

1. rerun inventory
2. rerun extraction
3. rerun taxonomy
4. rerun tagging
5. rerun scoring
6. rerun results surface
7. rerun runtime index hints

## Step 5: Inventory And Extraction Refresh

The source is reinventoried.

Outcomes:

- new package appears in normalized records
- one new `SkillUnit` is created
- one existing `SkillUnit` gets an updated extraction record

## Step 6: Taxonomy And Tagging Refresh

The new unit is assigned:

- primary domain
- function mode
- source tags
- runtime tags

If the unit had failed assignment under the current taxonomy:

- the ingestion system would create a `TaxonomyExtensionProposal`

It would not create a new domain directly.

## Step 7: Scoring Refresh

Only affected units are rescored.

Outcomes:

- new unit receives initial score families
- modified unit gets refreshed score records
- unaffected units from unrelated sources keep prior scores

## Step 8: Results Surface Refresh

Because a new unit entered a tracked source slice:

- grouped-band outputs update
- relevant shortlists may change
- better-alternative relationships may change

## Step 9: Runtime Hint Refresh

If the source yields skills that may later be installed or mirrored into runtime contexts:

- runtime hint indexes refresh

This does not mean those skills are installed.

It only keeps discovery and ranking metadata current.

## Step 10: Historical Preservation

The system keeps:

- previous snapshot
- current snapshot
- change set
- reprocessing plan

So later, the user can answer:

- what changed
- when it changed
- what downstream work reran

## Skip Example

If the same sync had found only:

- generated-output changes
- non-material listing reformatting

then the system would:

- write a new snapshot
- write a `non-material-change` change set
- create a `skip` reprocessing plan

No rescoring would occur.

## Failure Example

If fetch had failed:

- job state:
  - `failed`
- previous valid snapshot remains current for downstream use
- no fabricated partial update is published

## Practical Meaning

Phase 5 makes the directory operationally self-maintaining:

- new sources can be tracked
- changed sources can be refreshed
- only necessary downstream work reruns
- history is preserved for auditability
