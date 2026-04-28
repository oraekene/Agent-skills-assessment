# Assignment Rules

This file defines deterministic assignment rules for V2.1.

## Step 1: Full Inventory First

Before assignment:

- inventory all relevant files
- identify flagship assets
- separate generated duplicates from source-of-truth files

You may not assign taxonomy based only on one convenient file if the repo exposes a broader structure.

## Step 2: Score Canonical Domains

Use the canonical domains from `taxonomy-registry.json`.

For each domain, score `0-8`:

### A. Repo Stated Purpose — `0-3`

- `3` repo README or description explicitly centers this domain
- `2` repo clearly includes this domain as a major secondary purpose
- `1` only weak or occasional mention
- `0` absent

### B. Flagship Asset Majority — `0-2`

- `2` a majority of flagship assets target this domain
- `1` at least one flagship asset targets this domain
- `0` none

### C. Native Outputs — `0-2`

- `2` named outputs or artifacts are strongly native to this domain
- `1` outputs partially fit the domain
- `0` no domain-native outputs visible

### D. Domain-Specific Runtime Or Context — `0-1`

- `1` the repo requires domain-specific context, tooling, or runtime assumptions
- `0` not visible

## Step 3: Decide Primary Domain

1. Score all canonical domains.
2. Sort descending.
3. If top score is below `4`, set `primary_domain = unknown`.
4. If top score leads second score by `2+`, set that domain as `primary_domain`.
5. If top two scores differ by `0-1` and both are at least `5`, set:
   - `primary_domain = hybrid`
   - `primary_domain_members = [top1, top2]`
6. Any additional domain with score at least `4` becomes `secondary_domain`.
7. If no domain fits and extension conditions are met, invoke the extension protocol.

## Step 4: Score Function Modes

Use the canonical modes from `taxonomy-registry.json`.

For each mode, score `0-5`:

### A. Explicit Action Language — `0-2`

- `2` the asset or repo explicitly uses action language that matches the mode
- `1` partial match
- `0` absent

### B. Workflow Centering — `0-2`

- `2` the mode is central to the workflow
- `1` the mode is present but secondary
- `0` not visible

### C. Output Match — `0-1`

- `1` the outputs match the mode
- `0` not visible

## Step 5: Decide Function Modes

- assign any mode scoring `3+`
- if no mode scores `3+`, set `function_mode = unknown`
- if no canonical mode fits and extension conditions are met, invoke the extension protocol

## Step 6: Assign Tags

Assign tags only from explicit evidence or deterministic derivation from explicit evidence.

### Industry Tag

Assign if:

- the repo explicitly targets an industry
- examples, outputs, or context files clearly indicate one

### Role Tag

Assign if:

- the repo explicitly names a user role or persona
- the asset is clearly built for one role

### Context Scope Tag

Assign if:

- the repo explicitly signals operating scope or constraint context

Examples:

- personal
- team
- enterprise
- regulated
- internal
- consumer

## Step 7: Extension Gate

You may not create a new domain or mode unless all of these are true:

1. no canonical option adequately fits
2. the asset cannot be captured using canonical domain + canonical mode + tags
3. the mismatch is about primary value type or primary action, not just industry or audience
4. the extension protocol is executed and recorded

## Step 8: Batch Arena Creation

After assignment:

1. create one arena for each canonical or approved-extended domain appearing as:
   - a primary domain
   - a hybrid primary member
2. create a secondary-domain arena only if:
   - at least two repos share it
   - or the user explicitly asks for it
3. never create an arena from role or industry tags alone
