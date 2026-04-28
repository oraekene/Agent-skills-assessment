# Phase 1 Workflow

This is the operational workflow for the first real internal comparison engine.

## Step 1: Register Sources

Create one `Source` record per upstream library.

Required:

- source id
- source name
- origin URL
- source tags

## Step 2: Detect Packages

Create one `Package` per installable surface.

Default:

- one source creates one package

Override only when the source clearly exposes multiple installable bundles.

## Step 3: Run Full Inventory

For each source:

- inventory relevant file types
- identify flagship candidates
- identify generated duplicates
- identify source-of-truth files

Write:

- `InventoryRecord`

## Step 4: Extract Skill Units

Apply `extraction-rules.md`.

For each extracted unit:

- assign unit type
- assign installability state
- assign source-of-truth state
- record extraction reason

Write:

- `SkillUnit`
- `ExtractionRecord`

## Step 5: Assign V2.1 Taxonomy

For each `SkillUnit`:

- assign domain
- assign function modes
- assign tags

Write:

- `TaxonomyAssignment`
- `TagAssignment`

## Step 6: Score Units

Primary score target:

- extracted units

Secondary derived scores:

- package rollup
- source rollup

## Step 7: Present Results

Default results view:

- grouped by score band
- browsable by source tag
- browsable by domain
- browsable by task-aligned tag later

## Phase 1 Success Condition

The system can answer:

- what individual skills exist in each source
- which skills are install-relevant
- which skills are the best by domain for Codex Desktop
- which source a skill came from
