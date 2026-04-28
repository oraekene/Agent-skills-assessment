# Deterministic Evidence Model

This is the scoring and evidence engine for V2.

## 1. Evidence Codes

Every answer must have one evidence code.

### `E` Explicit

The source literally says it.

Examples:

- README says "Works with OpenAI Codex"
- skill says "save to `.agents/product-marketing-context.md`"
- prompt says "run tests before committing"

### `S` Structural

The repository structure itself proves it.

Examples:

- presence of `AGENTS.md`
- presence of `dist/codex/.codex/`
- presence of `skills/.../SKILL.md`
- presence of validator scripts

### `D` Deterministic Derivation

The answer is produced by a fixed rule defined in this V2 system.

Examples:

- primary domain chosen by the domain assignment rule
- conflict risk level derived from scope-footprint points
- operational burden derived from install-step and prerequisite counts

### `U` Unknown

The repo does not prove the claim.

Examples:

- no explicit Codex support mentioned
- no representative asset available for the domain
- no live-run trace exists

## 2. Non-Guess Rule

Never infer beyond the rulebook.

Allowed:

- paraphrasing explicit repo claims
- counting files, install methods, commands, workflow steps, prerequisites
- applying the deterministic formulas below

Not allowed:

- assuming quality from popularity
- assuming support because a repo "looks compatible"
- inventing workflow behavior not stated in the asset
- filling live metrics without an execution trace

## 3. Canonical Domain Assignment Rule

This rule is repo-agnostic.

It is not allowed to invent a new domain just because a repo feels unique.

Every repo must be assigned against the same fixed canonical domain list.

## 3A. Canonical Domains

### 1. Orchestration And Workflow

Definition:

- assets whose main value is controlling how work is sequenced, delegated, gated, reviewed, or completed

Include:

- planning systems
- execution loops
- multi-agent routing
- review gates
- workflow state

Exclude:

- domain-specific implementation skills whose workflow exists only to serve coding, design, marketing, or writing output

### 2. Software Engineering

Definition:

- assets whose main value is producing, debugging, testing, reviewing, or improving software and code

Include:

- TDD
- debugging
- refactoring
- architecture
- interface or API design

Exclude:

- top-level workflow systems

### 3. Design And UX

Definition:

- assets whose main value is visual quality, interaction quality, layout, taste, motion, accessibility, or design critique

Include:

- redesign systems
- UI audits
- taste systems
- design commands

Exclude:

- general coding skills that only incidentally touch UI

### 4. Marketing And Growth

Definition:

- assets whose main value is positioning, messaging, conversion, acquisition, retention, growth, launch, pricing, or GTM

Include:

- CRO
- product marketing context
- launch planning
- SEO
- analytics-for-growth

Exclude:

- general writing systems without explicit market or funnel logic

### 5. Writing, Voice, And Content

Definition:

- assets whose main value is authored language quality, editorial output, tone, channel adaptation, or voice calibration

Include:

- content writers
- voice templates
- editorial rewrite systems
- audience adaptation systems

Exclude:

- marketing systems whose primary value is funnel strategy rather than voice itself

### 6. Research, Analysis, And Strategy

Definition:

- assets whose main value is gathering information, synthesizing evidence, comparing options, or producing strategic analysis

Include:

- research agents
- competitive analysis systems
- option comparison workflows

Exclude:

- execution-first systems that only contain a brief planning step

### 7. Operations, Automation, And Infrastructure

Definition:

- assets whose main value is setup, deployment, infra operations, environment management, automation, or operational reliability

Include:

- deployment helpers
- environment bootstrap systems
- CI/CD and ops routines

Exclude:

- coding skills that merely run tests or shell commands as part of development

### 8. Data And Analytics

Definition:

- assets whose main value is event design, measurement, data analysis, metrics interpretation, or analytic workflows

Include:

- analytics setup
- reporting workflows
- metric analysis

Exclude:

- marketing systems where analytics is only one supporting subskill

### 9. Product And Business Strategy

Definition:

- assets whose main value is product scoping, roadmap reasoning, prioritization, pricing logic, or business model thinking

Include:

- PRD systems
- prioritization frameworks
- strategic planning systems

Exclude:

- workflow shells whose main value is orchestration rather than product reasoning

### 10. Meta Skillcraft And Tooling

Definition:

- assets whose main value is creating, packaging, validating, transforming, or distributing other skills

Include:

- skill packaging systems
- provider transformers
- build systems for skill outputs
- validation frameworks for skills

Exclude:

- ordinary end-user skills

## 3B. Canonical Function Modes

Modes are a second axis.

They prevent the system from creating overly narrow domains just to capture role differences.

Allowed modes:

- `plan`
- `implement`
- `review`
- `verify`
- `audit`
- `research`
- `rewrite`
- `orchestrate`
- `template`
- `package`
- `operate`

Each repo can have multiple modes.

## 3C. Domain Scoring Formula

For each repo, score every canonical domain from `0` to `8`.

### Domain Signal 1: Repo Stated Purpose â€” `0-3`

- `3` README or repo description explicitly centers that domain
- `2` README clearly includes it as a major secondary purpose
- `1` weak or occasional mention
- `0` absent

### Domain Signal 2: Flagship Asset Majority â€” `0-2`

- `2` a majority of flagship or default assets target this domain
- `1` at least one flagship asset targets this domain
- `0` none

### Domain Signal 3: Native Outputs â€” `0-2`

- `2` named outputs or artifacts are strongly native to this domain
- `1` outputs partially fit the domain
- `0` no domain-native outputs visible

### Domain Signal 4: Domain-Specific Runtime Or Context â€” `0-1`

- `1` repo requires domain-specific context, tooling, or runtime assumptions
- `0` not visible

## 3D. Primary Domain Decision Rule

1. Score all canonical domains.
2. Sort descending.
3. If top score is less than `4`, assign `primary_domain = unknown`.
4. If top score leads second score by `2+`, assign that top score as `primary_domain`.
5. If top two scores differ by `0-1` and both are at least `5`, assign:
   - `primary_domain = hybrid`
   - `primary_domain_members = [top1, top2]`
6. Any additional domain with score at least `4` becomes `secondary_domain`.

This rule is intentionally broad but strict:

- broad because the canonical domains are reusable across arbitrary repo mixes
- strict because a repo cannot drift into a domain without enough points

## 3E. Batch Arena Creation Rule

After all repos are scored:

1. Create one comparison arena per canonical domain that appears as:
   - a primary domain
   - a hybrid primary member
2. Optionally create a secondary-domain arena only if:
   - at least two repos have that secondary domain
   - or the user explicitly requests it
3. Never create a new arena name ad hoc.

This prevents:

- one custom arena per repo
- collapsing everything into one vague arena

## 3F. Full Inventory Then Representative Scoring Rule

All relevant files are not ignored.

Use a two-pass method:

### Pass 1: Full Inventory

Inventory every relevant file type:

- `SKILL.md`
- `AGENTS.md`
- agent files
- prompt files
- config files
- build or validator files
- templates

Purpose:

- map repo breadth
- identify flagship assets
- detect generated duplicates
- detect packaging-only files
- compute coverage and unknown risk

### Pass 2: Representative Scoring

Score only representative assets unless an escalation rule triggers.

Why:

- scoring every file would overweight large repos
- generated `dist/` outputs would duplicate the same capability
- helper files and packaging files are evidence, but not always primary user value

### Escalate To All-Asset Scoring If Any Of These Are True

- repo has `12` or fewer relevant files
- top-vs-second candidate difference in an arena is `2` points or less
- `unknown_share` is above `25%`
- repo claims broad capability but representative assets do not cover all claimed domains
- user explicitly requests exhaustive asset scoring

## 4. Scope-Footprint Rule

This is used for conflict risk.

Add points:

- `+2` if the repo installs or expects a global `AGENTS.md` or equivalent top-level operating contract
- `+1` if the repo says it should trigger automatically for broad task classes
- `+1` if the asset says it MUST be used before broad classes of work
- `+1` if the repo rewires runtime behavior with plugins, transforms, hooks, or persistent state

Risk:

- `0-1` = low
- `2-3` = medium
- `4-5` = high

## 5. Operational Burden Rule

Count:

- install steps
- external prerequisites
- required context files
- special runtime assumptions

Score:

- `4` = one-step install, no special prerequisites beyond normal agent usage
- `3` = simple install plus one moderate requirement
- `2` = multiple steps or explicit context discipline
- `1` = heavy setup, runtime tooling, or repeated manual context work
- `0` = major setup burden or environment mismatch

## 6. Asset Static Score Formula

This replaces the V1 impression-based category totals.

Total: `100`

### A. Trigger Clarity — `8`

- `2` positive trigger explicitly described
- `2` exclusions or non-use cases explicitly described
- `2` examples, keywords, or invocation hints present
- `2` skill/agent name or command surface clearly defined

### B. Workflow Explicitness — `12`

- `3` ordered steps or phases present
- `3` entry conditions explicit
- `3` exit condition or handoff explicit
- `3` artifact/file output explicit

### C. Verification Explicitness — `10`

- `4` explicit checks, tests, review loop, or audit steps
- `3` completion criteria or checklist present
- `3` browser/manual/runtime validation explicitly mentioned when relevant

### D. Guardrail Strength — `12`

- `4` anti-patterns or forbidden behaviors explicit
- `4` strong prohibition language (`must`, `never`, `do not`) used meaningfully
- `4` stop conditions or approval gates explicit

### E. Context Discipline — `8`

- `4` asset instructs model to inspect codebase/context first
- `4` shared context files or state mechanisms explicit

### F. Codex Fit — `12`

- `4` explicit Codex support or Codex-compatible install path
- `4` standard skills layout or Codex-readable directory structure
- `4` no explicit environment caveat for this workspace

### G. Composability — `8`

- `2` asset is narrow or bounded enough to combine with others
- `2` related skills or handoffs are explicit
- `2` global override footprint is low
- `2` project-local usage is possible

### H. Packaging And Operational Fit — `10`

- `3` install path is straightforward
- `3` prerequisites are light
- `2` update or maintenance path documented
- `2` multi-provider or adapter support explicit

### I. Artifact And Value Clarity — `10`

- `4` files/artifacts/outputs explicit
- `3` boundaries and use case explicit
- `3` examples or output format examples present

### J. Maintenance Evidence — `10`

- `2` license visible
- `4` contributor/build/update/architecture docs visible
- `4` validator, CLI, build system, or reference assets visible

## 7. Repo Baseline Score Formula

Total: `100`

### A. Domain Focus Clarity — `10`

- README clearly states what domain the repo is for

### B. Asset Breadth In Domain — `10`

- multiple relevant assets or commands for the same domain

### C. Documentation Coverage — `15`

Count explicit sections:

- install
- usage
- architecture
- troubleshooting
- contribution or extension

Score = `3` points each, max `15`

### D. Codex Support — `15`

- `5` explicit Codex support
- `5` Codex install path or `.codex` output
- `5` no explicit caveat for this environment

### E. Installation Simplicity — `10`

- use the operational burden rule and convert to `0-10`

### F. Packaging Maturity — `10`

- plugin, dist, build, or multi-provider packaging visible

### G. Workflow Maturity — `10`

- representative assets show explicit workflows, not just vibes

### H. Validation Support — `10`

- tests, validators, detector CLI, quality checklist, or review gates visible

### I. Conflict Risk Inverse — `5`

- low footprint gets more points

### J. Maintenance Architecture — `5`

- source-of-truth model, update path, or contributor guidance visible

## 8. Confidence And Coverage

Every filled artifact should also record:

- `evidence_coverage`
  - percentage of fields answered by `E` or `S`
- `derived_share`
  - percentage of fields answered by `D`
- `unknown_share`
  - percentage of fields answered by `U`

Interpretation:

- low `unknown_share` means the repo exposes enough information to judge fairly
- high `unknown_share` means the comparison result is lower-confidence even if deterministic

## 9. Live-Run Rule

No live-run metric may be scored without:

- benchmark prompt
- runtime configuration
- transcript or observable execution trace
- artifacts produced
- verification output

If any of those are missing:

- score = `not run`
- not `0`
- not estimated
