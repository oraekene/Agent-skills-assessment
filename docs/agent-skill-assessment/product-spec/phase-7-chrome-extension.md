# Phase 7 Chrome Extension

Phase 7 defines the browser-extension layer for surfacing ranking context on third-party pages.

## Goal

The goal is to let users see score bands and better alternatives wherever skills are mentioned online without forcing them to leave the page.

## Core Rule

The extension must not create its own scoring or ranking system.

It must consume:

- the central directory results
- the central entity-matching rules
- the central public explanation surfaces

The extension is a presentation and lookup layer, not a second ranking engine.

## Primary Use Cases

- user opens a GitHub repo for a skills library
- user opens a skills directory page
- user opens a catalog or marketplace page
- user sees a skill mention in a list or card
- user wants to know:
  - what band this skill is in
  - whether better alternatives exist
  - what domain/use-case slice it fits

## Extension Surfaces

### 1. Inline Badge Injection

Purpose:

- show a compact score-band marker near a recognized entity

Default content:

- band label
- confidence icon
- freshness cue

### 2. Expandable Popover

Purpose:

- provide quick public explanation without leaving the page

Default content:

- matched skill or source name
- score band
- one-line explanation
- source label
- better alternatives

### 3. Open Directory Action

Purpose:

- let the user jump to the full directory page

Default content:

- open skill page
- open source page
- open task/domain page when relevant

## Entity Detection Model

The extension must detect candidate entities on supported pages.

Supported entity types:

- `source`
- `package`
- `skill-unit`
- `skill-mention`

## Detection Inputs

The extension may use:

- page URL
- hostname
- structured page metadata
- visible text
- known selector maps for supported sites

## Detection Rules

### High-Confidence Match

A high-confidence match exists when:

- URL maps directly to a known source
- explicit skill identifier matches a known unit
- supported-site selector exposes an exact entity id

### Medium-Confidence Match

A medium-confidence match exists when:

- visible name matches a known source or skill
- source context is clear
- no conflicting candidate exists

### Low-Confidence Match

A low-confidence match exists when:

- only a fuzzy text match exists
- multiple candidates plausibly match

### Injection Rule

Inject automatically only for:

- high-confidence matches
- medium-confidence matches on explicitly supported pages

Do not inject for low-confidence matches.

## Supported Page Classes

Phase 7 should conceptually support:

- GitHub repository pages
- GitHub README views
- known skills directory pages
- known marketplace/catalog pages

Later support may include:

- social content pages
- blog posts
- general web results

## Matching Output Object

Each detected entity should produce:

- `match_id`
- `entity_type`
- `matched_record_id`
- `match_confidence`
- `page_context`

## Badge Rules

The inline badge should show:

- score band label
- optional freshness dot

Badge states:

- `strong`
- `good`
- `mixed`
- `weak`
- `limited-confidence`
- `no-match`

### Badge Suppression Rules

Do not inject a badge if:

- match confidence is low
- the page element is unstable or ephemeral
- the page already contains an injected badge for the same entity

## Popover Rules

On click or hover, the popover should show:

- entity display name
- public score band
- one-line use-case summary
- evidence badge
- freshness state
- up to `3` better alternatives

### Popover Constraint

The popover must stay within public-safe explanation boundaries.

Do not expose:

- raw score math
- raw unknown-share decimals
- raw trace refs
- operator-only diagnostics

## Better Alternatives In Extension

The extension should reuse public better-alternative logic.

### Suggestion Rule

If viewing a skill page or source page for one candidate:

- show better alternatives from the same compatible slice

### Slice Rule

Alternative suggestions must respect:

- same domain slice
- same function-mode slice when relevant
- same hard runtime constraints when known

## Domain Cue Rules

When possible, the extension should also show:

- primary domain
- one or two core use cases

This helps users interpret the score in context.

## Site Support Strategy

Use site adapters for supported sites.

Each adapter may define:

- hostnames
- selector maps
- entity extraction rules
- injection anchors

Do not rely on fully generic scraping for all supported behavior.

## Extension Data Flow

1. page adapter identifies candidate entity
2. entity matcher resolves central record
3. extension fetches public directory payload
4. badge is injected
5. popover loads on interaction

## Performance Rules

The extension should:

- avoid blocking page load
- debounce rescans on dynamic pages
- cache matched payloads briefly
- avoid repeated lookups for the same entity on the same page

## Safety Rules

The extension must never:

- auto-install skills
- auto-run skill code
- auto-grant permissions
- expose private operator-only notes

The extension is informational only.

## No-Match Behavior

If no high- or medium-confidence match exists:

- do not inject a misleading badge
- optionally show nothing

If the user explicitly opens the extension panel:

- show:
  - `No confident match found`
  - optional action:
    - `Search in directory`

## Public Directory Boundary

The extension may reuse:

- public directory payloads
- public skill pages
- public source pages

The extension may not bypass:

- public/private content boundaries
- operator-only surfaces

## Phase 7 Success Condition

The extension can:

- detect supported skill-related entities on third-party pages
- inject concise public score-band context
- show better alternatives when relevant
- link users back to the directory

without creating a second ranking system
