# Phase 7 Worked Simulation

This simulation shows the extension running on third-party pages.

## Scenario A: GitHub Repo Page

User visits:

- a GitHub repository page for `pbakaus/impeccable`

### Detection

The GitHub adapter reads:

- hostname
- repository owner/name

Match result:

- high-confidence source match

### Injection

The extension injects:

- a `strong` badge

### Popover

On interaction, the user sees:

- `impeccable`
- band:
  - `80-94`
- short explanation:
  - strong public candidate for structured design audits

## Scenario B: Skills Directory Card

User visits:

- a supported directory page listing `taste-redesign`

### Detection

The directory adapter reads:

- known card selector
- visible unit label

Match result:

- high-confidence skill-unit match

### Injection

The extension injects:

- a `good` badge

### Popover

The popover shows:

- `taste-redesign`
- score band:
  - `70-79`
- one better alternative:
  - `impeccable`
  - reason:
    - better fit for design audits

## Scenario C: Ambiguous Blog Post Mention

User visits:

- a blog post that casually mentions `taste`

### Detection

Visible text alone is ambiguous.

Match result:

- low confidence

### Injection Rule

The extension does not inject a badge.

If the user opens the extension manually:

- show:
  - `No confident match found`
  - `Search in directory`

## Scenario D: No Public-Safe Details

Assume a skill has internal operator notes that explain a concern.

The extension:

- may show public evidence/freshness summary
- may not expose operator-only notes

This preserves the public/private boundary.

## Why Phase 7 Matters

Phase 6 lets users browse the directory itself.

Phase 7 lets users take that same ranking context into:

- GitHub
- marketplaces
- third-party skill pages

without fragmenting the scoring logic.
