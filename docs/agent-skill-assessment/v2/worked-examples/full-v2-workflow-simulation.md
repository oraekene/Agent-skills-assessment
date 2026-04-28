# Full V2 Workflow Simulation

This is a complete granular simulation of the full V2 workflow.

It follows the same worked-example style as the first simulation, but it uses the stricter V2 system:

- deterministic evidence-coded answers
- machine-readable evidence ledger
- domain-by-domain comparison arenas
- no guessed live scores
- truthful benchmark preflight and skip behavior

## What This Simulation Is

This document shows:

- the exact role of each V2 step and substep
- the exact user-visible inputs
- the exact observable backend and platform outputs
- the exact artifact outputs written into the workspace
- how each V2 rule is used in practice
- how the workflow reaches domain winners for your Codex setup

## What This Simulation Is Not

This is not hidden chain-of-thought.

The observable system is:

- user requests
- source repositories
- file reads
- deterministic scoring rules
- machine-readable ledgers
- written outputs

That is the level this framework is designed to audit.

## Repositories In Scope

This simulation covers all nine libraries you provided:

- `Yeachan-Heo/oh-my-codex`
- `obra/superpowers`
- `iannuttall/claude-agents`
- `snarktank/ralph`
- `mattpocock/skills`
- `coreyhaines31/marketingskills`
- `getlago/inside-lago-voice-skill`
- `Leonxlnx/taste-skill`
- `pbakaus/impeccable`

## V2 Objectives In Action

The V2 system exists to answer a stricter question than V1:

- "Which library is best in each domain for my Codex setup, using only evidence-backed judgments?"

This simulation applies that objective directly.

### Objective 1: No guessed answers

How it is used:

- every finding is tagged:
  - `E`
  - `S`
  - `D`
  - `U`

Why it matters:

- unsupported claims are not silently treated as facts

### Objective 2: Same-domain comparison

How it is used:

- repos are first assigned to narrower domain arenas
- comparisons happen inside those arenas, not across the entire repo set blindly

Why it matters:

- it lets you choose the best design library against other design libraries, not against unrelated marketing systems

### Objective 3: Deterministic scoring

How it is used:

- `asset-scorecard` style answers map to formula-based categories
- arena winners are derived from fixed `0-4` criteria

Why it matters:

- a score can be rechecked from the evidence

### Objective 4: Machine-readable evidence

How it is used:

- final findings are recorded in JSON
- the same evidence can later be reprocessed, audited, or turned into dashboards

### Objective 5: Truthful live-run status

How it is used:

- the live round only records what actually happened
- it does not manufacture repo benchmark results when the runner failed preflight

## Core V2 Inputs

## Surface A: User Input

Examples from this workflow:

```text
I want a deterministic comparison between multiple skill libraries in the same domain.
I want to pick the best library in each domain for my Codex setup.
Do not guess.
Add a machine-readable evidence ledger.
Run live benchmarks only if they are truly runnable.
```

Role:

- defines strictness level
- defines comparison goal
- defines truthfulness requirements for the live phase

## Surface B: Source Evidence

Examples:

- repo README
- repo root structure
- `SKILL.md`
- `AGENTS.md`
- representative agent or prompt files
- install instructions
- explicit caveats

Role:

- supplies `E` and `S` evidence

## Surface C: V2 Rule Inputs

Files used:

- [deterministic-evidence-model.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/deterministic-evidence-model.md)
- [template-field-rules.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/template-field-rules.md)
- [domain-head-to-head-method.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/domain-head-to-head-method.md)

Role:

- supplies `D` evidence and fixed score logic

## Surface D: Artifact Outputs

Files produced by this workflow:

- [all-libraries-domain-comparison-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/worked-examples/all-libraries-domain-comparison-simulation.md)
- [evidence-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.round1.json)
- [round-1-manifest.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-manifest.json)
- [round-1-results.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-results.json)

Role:

- preserves the full comparison state

## Full Workflow

The V2 workflow has nine steps.

## Step 1: Define The Comparison Goal

User input:

```text
I want a deterministic comparison between multiple skill libraries in the same domain.
I want to pick the best library in each domain for my Codex setup.
```

Observable backend/platform activity:

- selects V2 instead of V1
- loads V2 rule files

Artifact output:

- workflow mode is now:
  - deterministic
  - same-domain
  - evidence-coded

Why this step matters:

- it changes the framework from broad assessment to domain winner selection

## Step 2: Assign Repositories To Domain Arenas

User input:

```text
Compare all listed libraries by domain.
```

Observable backend/platform activity:

- reads repo descriptions and representative assets
- applies the V2 domain-assignment rule

Deterministic output:

- `oh-my-codex` -> workspace orchestration
- `superpowers` -> workspace orchestration + coding craft
- `claude-agents` -> lightweight specialists with writing/design overlap
- `ralph` -> autonomous completion loop
- `mattpocock/skills` -> coding craft
- `marketingskills` -> marketing system
- `inside-lago-voice-skill` -> writing and voice
- `taste-skill` -> frontend design craft
- `impeccable` -> frontend design craft

Why this step matters:

- it prevents invalid comparisons

## Step 3: Choose Representative Assets

User input:

```text
Use representative assets, not random files.
```

Observable backend/platform activity:

- applies the V2 representative-asset rule
- selects `1-2` high-signal assets per repo

Deterministic output:

- `oh-my-codex`
  - `AGENTS.md`
  - `skills/deep-interview/SKILL.md`
- `superpowers`
  - `skills/brainstorming/SKILL.md`
  - `skills/test-driven-development/SKILL.md`
- `claude-agents`
  - `agents/content-writer.md`
- `ralph`
  - `skills/prd/SKILL.md`
- `mattpocock/skills`
  - `tdd/SKILL.md`
- `marketingskills`
  - `skills/product-marketing-context/SKILL.md`
  - `skills/page-cro/SKILL.md`
- `inside-lago-voice-skill`
  - template/README structure
- `taste-skill`
  - `skills/taste-skill/SKILL.md`
  - `skills/redesign-skill/SKILL.md`
- `impeccable`
  - `source/skills/impeccable/SKILL.md`

Why this step matters:

- it keeps scoring tied to the repo's actual flagship value

## Step 4: Fill Deterministic Repo Findings

User input:

```text
Answer repo-level questions without guessing.
```

Observable backend/platform activity:

- fills repo findings using:
  - `E`
  - `S`
  - `D`
  - `U`

Example:

- `superpowers.codex_support = explicit`
  - evidence type: `E`
- `claude-agents.codex_support = not_proven`
  - evidence type: `U`
- `oh-my-codex.conflict_footprint = high`
  - evidence type: `D`

Artifact output:

- repo findings stored in [evidence-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.round1.json)

Why this step matters:

- repo-level findings set the baseline for install decisions

## Step 5: Fill Deterministic Asset Findings

User input:

```text
For each chosen asset, record only what is proven by the file.
```

Observable backend/platform activity:

- extracts:
  - trigger conditions
  - workflow steps
  - file outputs
  - guardrails
  - runtime assumptions

Examples:

- `marketingskills/product-marketing-context`
  - explicit output: `.agents/product-marketing-context.md`
- `taste-skill/taste-skill`
  - explicit tuning dials:
    - `DESIGN_VARIANCE`
    - `MOTION_INTENSITY`
    - `VISUAL_DENSITY`
- `impeccable`
  - explicit context files:
    - `PRODUCT.md`
    - `DESIGN.md`

Artifact output:

- asset findings stored in the JSON ledger

Why this step matters:

- it creates the evidence basis for the static score formulas

## Step 6: Compute Deterministic Static Scores

User input:

```text
Score every asset with fixed formulas only.
```

Observable backend/platform activity:

- applies the V2 asset static score formula
- computes category points
- sums to a total

Example score structure:

- `trigger_clarity`
- `workflow_explicitness`
- `verification_explicitness`
- `guardrail_strength`
- `context_discipline`
- `codex_fit`
- `composability`
- `packaging_operational_fit`
- `artifact_value_clarity`
- `maintenance_evidence`

Example observable output:

- `superpowers/brainstorming = 94`
- `impeccable/impeccable = 93`
- `marketingskills/product-marketing-context = 92`
- `taste-skill/taste-skill = 87`
- `inside-lago-voice-skill/template = 75`

Artifact output:

- category points and totals stored in [evidence-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.round1.json)

Why this step matters:

- it turns asset analysis into auditable numbers

## Step 7: Compute Domain Arena Scores

User input:

```text
Pick the best library within each domain for my Codex setup.
```

Observable backend/platform activity:

- groups repos by arena
- applies the V2 arena score:
  - domain fit
  - Codex setup fit
  - representative asset quality
  - verification and guardrails
  - operational burden
  - depth and differentiation

Deterministic output:

### Workspace Orchestration

- `superpowers = 23`
- `oh-my-codex = 18`
- `ralph = 18`

Winner:

- `superpowers`

### Coding Craft

- `superpowers = 23`
- `mattpocock/skills = 21`
- `ralph = 18`

Winner:

- `superpowers`

### Frontend Design Craft

- `impeccable = 23`
- `taste-skill = 23`

Tie-break:

- `impeccable` wins for your setup

### Marketing System

- `marketingskills = 22`

Winner:

- `marketingskills`

### Writing And Voice

- `inside-lago-voice-skill = 19`
- `marketingskills = 17` for marketing-copy-adjacent writing
- `claude-agents = 11`

Winner for personal voice:

- `inside-lago-voice-skill`

Artifact output:

- arena scores stored in the JSON ledger
- narrative comparison stored in [all-libraries-domain-comparison-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/worked-examples/all-libraries-domain-comparison-simulation.md)

Why this step matters:

- this is the step that actually answers your install-choice question

## Step 8: Create The Machine-Readable Evidence Ledger

User input:

```text
Make it machine-readable.
```

Observable backend/platform activity:

- writes a JSON schema
- writes a first round JSON ledger

Files written:

- [evidence-ledger.schema.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.schema.json)
- [evidence-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.round1.json)

Role of the schema:

- validates structure
- prevents ad hoc ledger drift

Role of the ledger:

- stores evidence-backed repo findings
- stores evidence-backed asset findings
- stores deterministic static scores
- stores deterministic arena decisions

Why this step matters:

- it makes the framework reusable, queriable, and automatable

## Step 9: Attempt The True Live Benchmark Round

User input:

```text
Run the first true live benchmark round for all repos if it is truly runnable. If not, skip.
```

Observable backend/platform activity:

- creates benchmark manifest first
- attempts runner preflight
- records exact failure outputs
- stops before repo-specific runs when runner access fails

Files written:

- [round-1-manifest.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-manifest.json)
- [round-1-results.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-results.json)

### Preflight Attempt 1

Command intent:

- check `codex login status`

Observed output:

```text
Error loading configuration: Access is denied. (os error 5)
```

### Preflight Attempt 2

Command intent:

- run minimal `codex exec` probe

Observed output:

```text
Error: Access is denied. (os error 5)
```

### Preflight Attempt 3

Command intent:

- unsandboxed retry

Observed output:

```text
Program 'codex.exe' failed to run: Access is denied
```

### Preflight Attempt 4

Command intent:

- absolute-path launch

Observed output:

```text
The term 'C:\Users\IFEANYI-ORAE\AppData\Local\OpenAI\Codex\bin\codex.exe' is not recognized as the name of a cmdlet, function, script file, or operable program.
```

Deterministic end state:

- round status: `blocked-before-repo-runs`
- practical decision: `skip repo-specific live runs for now`

Why this step matters:

- it proves the framework does not fake execution evidence

## Exact Role Of Each Major V2 File

## [README.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/README.md)

Role:

- tells you when to use V2
- defines the core no-guess rule
- points to all required V2 components

## [deterministic-evidence-model.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/deterministic-evidence-model.md)

Role:

- defines `E`, `S`, `D`, `U`
- defines score formulas
- defines unknown handling
- defines the no-live-score-without-trace rule

## [template-field-rules.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/template-field-rules.md)

Role:

- tells you how to answer every field in:
  - repo-intake style assessment
  - asset-scorecard style assessment
  - live-run-report style assessment

## [domain-head-to-head-method.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/domain-head-to-head-method.md)

Role:

- converts the system from broad scoring into domain winner selection

## [all-libraries-domain-comparison-simulation.md](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/worked-examples/all-libraries-domain-comparison-simulation.md)

Role:

- records the narrative comparison and install recommendations

## [evidence-ledger.round1.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/evidence-ledger.round1.json)

Role:

- is the machine-readable source of truth for round 1

## [round-1-manifest.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-manifest.json)

Role:

- defines what the live round would run if the runner were available

## [round-1-results.json](C:/Users/IFEANYI-ORAE/OneDrive/Documents/New%20project/docs/agent-skill-assessment/v2/live-benchmarks/round-1-results.json)

Role:

- records what actually happened
- currently records:
  - preflight failures
  - blocked repo statuses
  - skip state

## Final V2 Output Of This Simulation

After the full workflow completes, the truthful outputs are:

- domain arena assignment for all repos
- representative asset selection for all repos
- deterministic repo findings
- deterministic asset findings
- machine-readable evidence ledger
- domain winner decisions
- machine-readable live benchmark manifest
- machine-readable live benchmark results showing a truthful skip

## Final Domain Winners

For your current Codex setup:

- workspace orchestration:
  - `superpowers`
- coding craft:
  - `superpowers`
- frontend design craft:
  - `impeccable`
- marketing system:
  - `marketingskills`
- writing and voice:
  - `inside-lago-voice-skill`

## Final Install Posture

Default or strongest choices:

- `superpowers`
- `impeccable`
- `marketingskills`

Strong secondary or project-scoped:

- `taste-skill`
- `mattpocock/skills`
- `inside-lago-voice-skill`
- `ralph`

Reference or fork-first:

- `oh-my-codex`
- `claude-agents`

## Correct Stopping Point

This simulation stops after:

- deterministic static comparison
- machine-readable evidence logging
- truthful live benchmark preflight

It does not invent repo-specific live scores after a blocked runner.

That is the correct V2 stopping point.
