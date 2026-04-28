# Extraction Rules

This file defines how raw repo contents become normalized `SkillUnit` records.

## Core Rule

Extraction is deterministic.

The same source snapshot should produce the same normalized unit set unless:

- extraction rules changed
- taxonomy registry changed
- source contents changed

## Extraction Passes

## Pass 1: Inventory

Inventory all relevant files:

- `SKILL.md`
- `AGENTS.md`
- agent files
- prompt files
- templates
- validator files
- command definition files
- build and transform files

Also detect:

- generated duplicates
- source-of-truth files
- install surfaces
- repo-level containers

## Pass 2: Package Detection

Create a `Package` when one of these is true:

- repo exposes one installable distribution surface
- repo exposes multiple clearly separate installable bundles
- repo uses source and generated outputs that map to separate consumer runtimes

Default rule:

- one repo = one package

Unless explicit evidence proves multiple packages.

## Pass 3: SkillUnit Detection

Create one `SkillUnit` when a file or tightly coupled group of files is:

- directly usable by an end user or runtime
- a primary comparison object
- a distinct capability boundary

### Create one unit per:

- `SKILL.md`
- top-level agent file with distinct behavior
- prompt file that represents a distinct workflow or capability
- reusable template whose main value is the template itself
- `AGENTS.md` when it materially shapes runtime behavior as a distinct install/use unit
- validator or command bundle when the validator/command system is itself user-visible and comparable

### Do not create a primary unit for:

- generated output duplicates of the same source unit
- helper files that only support another unit
- build files that are not user-facing capabilities
- docs that merely describe a unit already extracted

## Unit Boundary Rules

## One File -> One Unit

Use when:

- the file is self-contained
- the capability boundary is obvious

Examples:

- `skills/tdd/SKILL.md`
- `agents/content-writer.md`

## Many Files -> One Unit

Use when:

- one capability is split across a small tightly coupled set
- users would treat it as one install/use object

Examples:

- command bundle plus shared command manifest
- template plus tightly coupled rubric file

## One File -> Many Units

Use only when:

- one file explicitly contains multiple distinct user-facing units
- each unit is separately selectable or comparable

If unclear, do not split.

## Global Contract Extraction

Extract `AGENTS.md` as a `SkillUnit` only if:

- it materially changes runtime behavior
- it could be chosen, installed, adapted, or compared on its own merits

Otherwise:

- treat it as evidence attached to other units

## Generated Duplicate Rules

Mark a unit as `is_generated_duplicate = true` if:

- the file is a transformed distribution copy of another source-of-truth unit
- the capability is materially the same

Generated duplicates should:

- remain in inventory
- remain in provenance
- not become separate primary comparison objects by default

## Source-Of-Truth Rules

Mark `source_of_truth = true` if:

- the file is where maintainers are intended to edit the capability
- other variants are generated from it

If unclear:

- prefer explicit maintainer documentation
- otherwise mark `source_of_truth = unknown`

## Extraction Reasons

Every `ExtractionRecord` should include one of:

- `direct-user-unit`
- `global-runtime-contract`
- `template-primary-value`
- `validator-primary-value`
- `command-bundle-primary-value`
- `generated-duplicate`
- `supporting-file-only`

## Phase 1 Default For Current Repo Set

For the current libraries:

- extract representative `SKILL.md` files as `skill`
- extract distinct agent files as `agent`
- extract template-first assets as `template`
- extract top-level `AGENTS.md` only where it materially shapes behavior
