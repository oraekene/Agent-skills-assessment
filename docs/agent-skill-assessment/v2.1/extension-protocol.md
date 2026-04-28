# Extension Protocol

This protocol governs creation of new domains or function modes.

## Principle

The taxonomy is:

- fixed by default
- extensible by rule
- never extended ad hoc

## When Extension Is Allowed

Extension is allowed only when the current registry cannot faithfully classify the asset.

That means:

- not enough to say "this feels different"
- not enough to say "this is a different industry"
- not enough to say "this is for a different job role"

The difference must be:

- a distinct primary value type
  - for a new `domain`
- or a distinct primary action pattern
  - for a new `function_mode`

## Domain Extension Gate

Create a new domain only if all of these are true:

1. the asset scores below `4` on every canonical domain
2. the asset cannot be represented as:
   - existing domain
   - plus function mode
   - plus industry tag
   - plus role tag
   - plus context scope tag
3. the asset's primary value type is materially distinct from all canonical domains
4. there are clear include and exclude boundaries
5. at least one realistic future asset could also belong to this domain

If any of these fail:

- do not create a new domain

## Function Mode Extension Gate

Create a new function mode only if all of these are true:

1. the asset scores below `3` on every canonical function mode
2. the action is not merely a synonym or phrasing variant of an existing mode
3. the action pattern changes how assets are compared in a meaningful way
4. there are clear include and exclude boundaries
5. at least one realistic future asset could also use the mode

If any of these fail:

- do not create a new mode

## Required Record For Every New Domain

Every new domain must be added to the registry with:

- `id`
- `name`
- `definition`
- `include_rules`
- `exclude_rules`
- `boundary_test`
- `example_members`
- `example_non_members`
- `created_in_version`
- `justification`

## Required Record For Every New Mode

Every new mode must be added to the registry with:

- `id`
- `name`
- `definition`
- `include_rules`
- `exclude_rules`
- `boundary_test`
- `example_members`
- `example_non_members`
- `created_in_version`
- `justification`

## Boundary Test Rule

Every new category must pass a boundary test.

A boundary test is a short statement that distinguishes it from its nearest existing alternatives.

Example pattern:

- "Belongs here if primary value is X, not Y, even when it sometimes overlaps with Z."

If you cannot write a clear boundary test:

- do not create the category

## Registry Update Rule

New categories must be added only through:

- a versioned registry update

They must not appear only in one comparison run document.

## Comparison Safety Rule

If a new domain or mode is introduced:

- rerun assignment for the current batch if the new category could affect any repo already scored

This prevents:

- old results being compared against a changed taxonomy without recalculation
