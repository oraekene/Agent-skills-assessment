# Domain Head-To-Head Method

This method answers:

- which library is strongest within the same domain?

It is fully repo-agnostic.

It does not define domains from the current repo batch.
It uses the fixed canonical domains defined in `deterministic-evidence-model.md`.

## Why A Head-To-Head Layer Exists

Simple repo scoring is not enough for install decisions.

You also need a method that:

- groups comparable libraries together
- keeps categories broad enough to be reusable
- keeps boundaries strict enough to avoid category collapse

## Core Principle

Use:

- `canonical domain`
- plus `function mode`

Do not create ad hoc domains from the current repo set.

Examples:

- `oh-my-codex`
  - domain: `orchestration-and-workflow`
  - mode: `orchestrate`, `plan`

- `impeccable`
  - domain: `design-and-ux`
  - mode: `audit`, `review`, `implement`

- `marketingskills`
  - domain: `marketing-and-growth`
  - mode: `research`, `audit`, `rewrite`

This gives nuance without exploding the number of domains.

## Workflow

## Step 1: Full Inventory

Inventory all relevant files first.

Relevant file types:

- `SKILL.md`
- `AGENTS.md`
- agent files
- prompt files
- config files
- templates
- validator files
- build or transform files

Use the inventory to determine:

- repo breadth
- dominant domain signals
- flagship assets
- presence of generated duplicates
- whether exhaustive scoring is required

## Step 2: Domain Scoring

For each repo:

1. score every canonical domain using the fixed domain scoring formula
2. assign:
   - `primary_domain`
   - optional `hybrid_primary`
   - optional `secondary_domains`
3. assign one or more `function_modes`

## Step 3: Arena Creation

Create one arena for each canonical domain that appears as:

- a primary domain
- a hybrid primary member

Create a secondary-domain arena only when:

- at least two repos share that secondary domain
- or the user explicitly asks for it

This rule keeps arenas broad and reusable.

## Step 4: Representative Asset Selection

Do not immediately score every file.

Choose representative assets using this order:

1. default or flagship asset promoted by the README
2. canonical workflow asset
3. strongest asset most directly aligned to the arena
4. top-level `AGENTS.md` if it materially shapes runtime behavior

## Step 5: Decide Whether To Escalate To All-Asset Scoring

Escalate if:

- repo has `12` or fewer relevant files
- arena ranking is close
- representative coverage is weak
- unknown share is high
- user explicitly requests exhaustive scoring

If none of those are true, representative scoring is the default.

## Why Not Score Every File By Default

Because "all files" is not automatically more accurate.

Problems:

- large repos would be rewarded just for size
- generated outputs would be double-counted
- helper files would drown user-facing assets
- token and review cost would increase sharply without proportional signal

Better approach:

- full inventory of all relevant files
- deterministic representative scoring
- escalation to all-asset scoring only when the rules say it is needed

## Arena Score

Each arena uses the same `24` point score.

### 1. Domain Fit â€” `0-4`

- `4` primary domain match
- `3` hybrid primary member
- `2` strong secondary domain
- `1` weak secondary presence
- `0` otherwise

### 2. Codex Setup Fit â€” `0-4`

- `4` explicit Codex support with workable install path for the environment
- `3` portable and low-friction but not Codex-first
- `2` portable with caveats or adaptation
- `1` weakly portable
- `0` not proven

### 3. Representative Asset Quality â€” `0-4`

- `4` top representative asset score `85+`
- `3` top representative asset score `75-84`
- `2` top representative asset score `60-74`
- `1` top representative asset score `40-59`
- `0` below `40` or unavailable

### 4. Verification And Guardrails â€” `0-4`

- `4` strong explicit checks plus strong anti-patterns or approval gates
- `3` one strong and one moderate
- `2` one strong or two moderate
- `1` weak but present
- `0` missing

### 5. Operational Burden â€” `0-4`

- `4` low burden
- `3` moderate-low
- `2` moderate
- `1` high
- `0` very high or environment mismatch

### 6. Depth And Differentiation â€” `0-4`

- `4` deep and clearly specialized within the arena
- `3` strong and differentiated
- `2` useful but moderate depth
- `1` thin or generic
- `0` not demonstrated

## Winner Rule

Inside each arena:

1. rank by arena score
2. break ties by lower operational burden
3. if still tied, prefer lower conflict footprint
4. if still tied, prefer lower unknown share

## Install Recommendation Labels

- `default-install`
  - best broad choice for this domain in the target setup
- `project-scoped`
  - strong, but should be used only where relevant
- `reference-only`
  - useful ideas, not a runtime install priority
- `fork-first`
  - valuable, but should be adapted before install

## Environment Bias

Environment bias is allowed only at the final ranking stage.

It must not change the canonical domain system itself.

Example environment factors:

- Codex support
- Windows compatibility
- desktop app friendliness
- sandbox assumptions
- install friction

This keeps the taxonomy generic while still making the final recommendation practical.
