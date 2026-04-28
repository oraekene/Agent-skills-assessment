# Full Domain Comparison Simulation

This is the V2 deterministic simulation across all listed libraries:

- `Yeachan-Heo/oh-my-codex`
- `obra/superpowers`
- `iannuttall/claude-agents`
- `snarktank/ralph`
- `mattpocock/skills`
- `coreyhaines31/marketingskills`
- `getlago/inside-lago-voice-skill`
- `Leonxlnx/taste-skill`
- `pbakaus/impeccable`

## First Correction

The earlier V1 scorecards were not hallucinated, but they were not deterministic enough.

What changed in V2:

- no metric is now scored by feel
- every categorical answer must be `E`, `S`, `D`, or `U`
- every comparison is done inside a narrower `domain + mode` arena
- live-run reports cannot be scored without actual run traces

## Simulation Inputs

### User Inputs

```text
I want a deterministic comparison between multiple skill libraries in the same domain.
I want to pick the best library in each domain for my Codex setup.
Do not guess.
```

### Backend / Platform Inputs

- repository READMEs
- repository file structures
- representative skill, prompt, or agent files
- explicit install instructions
- explicit runtime caveats

### Scoring Inputs

- V2 evidence model
- V2 field rules
- V2 domain head-to-head method

## Stage 1: Assign Each Repo To A Domain Arena

| Repo | Primary arena | Why |
| --- | --- | --- |
| `oh-my-codex` | workspace orchestration | README centers Codex workflow layer, canonical flow, `.omx/` state |
| `superpowers` | workspace orchestration + coding craft | README and skills center workflow discipline, planning, TDD |
| `claude-agents` | lightweight specialists | README lists multiple specialist agents, but little process depth |
| `ralph` | autonomous completion loop | README centers repeated fresh-context loop to finish PRD items |
| `mattpocock/skills` | coding craft + planning | README centers modular engineering skills |
| `marketingskills` | marketing system | README centers marketing tasks and shared context |
| `inside-lago-voice-skill` | writing and voice | README centers voice calibration template |
| `taste-skill` | frontend design craft | README centers premium frontend output and anti-slop design |
| `impeccable` | frontend design craft | README centers design vocabulary, commands, anti-patterns |

## Stage 2: Choose Representative Assets

| Repo | Representative assets | Selection rule |
| --- | --- | --- |
| `oh-my-codex` | `AGENTS.md`, `skills/deep-interview/SKILL.md` | global operating contract + canonical clarification skill |
| `superpowers` | `skills/brainstorming/SKILL.md`, `skills/test-driven-development/SKILL.md` | default design-first flow + flagship coding discipline |
| `claude-agents` | `README.md`, `agents/content-writer.md` | repo-level evidence is strong, asset-level evidence available for writing |
| `ralph` | `README.md`, `prompt.md`, `skills/prd/SKILL.md` | loop runtime + PRD gateway |
| `mattpocock/skills` | `tdd/SKILL.md`, `grill-me/SKILL.md`, `design-an-interface/SKILL.md` | strongest coding/planning/design-facing assets |
| `marketingskills` | `skills/product-marketing-context/SKILL.md`, `skills/page-cro/SKILL.md` | foundation skill + concrete downstream skill |
| `inside-lago-voice-skill` | `README.md` | repo is a published template; template categories are described in README |
| `taste-skill` | `skills/taste-skill/SKILL.md`, `skills/redesign-skill/SKILL.md` | default all-rounder + redesign path |
| `impeccable` | `source/skills/impeccable/SKILL.md`, `AGENTS.md` | flagship skill + provider architecture contract |

## Stage 3: Repo Baseline Findings

This stage answers the `repo-intake` questions deterministically.

### `oh-my-codex`

- `Codex-native`: `yes (E)`
- `Environment caveat`: `explicit Windows/Codex App warning (E)`
- `Distribution model`: `npm package + plugin + setup runtime (E)`
- `Conflict footprint`: `high (D)` because it ships a top-level operating contract and runtime hooks
- Repo label:
  - `fork-first`

### `superpowers`

- `Codex support`: `explicit (E)`
- `Install path`: `explicit Codex install doc via .codex/INSTALL.md (E)`
- `Methodology breadth`: `high (E/S)`
- `Conflict footprint`: `medium-high (D)` because skills are strongly opinionated and broad
- Repo label:
  - `default-install candidate`

### `claude-agents`

- `Codex support`: `not proven (U)`
- `Runtime`: `Claude Code agents (E)`
- `Asset breadth`: `multiple specialist agents (E)`
- `Workflow depth`: `low-to-medium based on available evidence (D)`
- Repo label:
  - `reference-only` unless adapted

### `ralph`

- `Codex support`: `not explicit as Codex, explicit Claude Code support (E)`
- `Core value`: `fresh-context autonomous loop (E)`
- `Conflict footprint`: `medium (D)`
- `Operational burden`: `moderate-high (D)` because it expects PRD pipeline, loop script, git, jq
- Repo label:
  - `project-scoped`

### `mattpocock/skills`

- `Codex support`: `portable via skills CLI, not Codex-first but compatible (D)`
- `Core value`: `high-quality modular engineering skills (E)`
- `Conflict footprint`: `low-medium (D)` because assets are narrow and composable
- Repo label:
  - `default-install candidate`

### `marketingskills`

- `Codex support`: `explicit (E)`
- `Core value`: `shared marketing context plus broad downstream library (E)`
- `Conflict footprint`: `low-medium (D)`
- Repo label:
  - `default-install candidate`

### `inside-lago-voice-skill`

- `Codex support`: `can be dropped into prompt/skill context, but no Codex-specific install path proved (E/D)`
- `Core value`: `voice calibration template, not plug-and-play domain runtime (E)`
- Repo label:
  - `project-scoped`

### `taste-skill`

- `Codex support`: `explicit via README and portable CLI install (E)`
- `Core value`: `high-agency premium frontend taste system (E)`
- `Conflict footprint`: `medium (D)` because its style rules are strong but project-local use is easy
- Repo label:
  - `default-install candidate`

### `impeccable`

- `Codex support`: `explicit with dist/codex output (E/S)`
- `Core value`: `flagship design skill + 18 commands + detector + provider build system (E/S)`
- `Conflict footprint`: `medium (D)`
- Repo label:
  - `default-install candidate`

## Stage 4: Domain Arena Comparison

## Arena A: Workspace Orchestration

Candidates:

- `oh-my-codex`
- `superpowers`
- `ralph`
- `mattpocock/skills` partial

| Candidate | Domain fit | Codex fit | Asset quality | Guardrails | Burden | Depth | Total / 24 | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `superpowers` | 4 | 4 | 4 | 4 | 3 | 4 | `23` | strongest default workspace orchestration candidate |
| `oh-my-codex` | 4 | 2 | 3 | 4 | 1 | 4 | `18` | strong ideas, but runtime mismatch for this setup |
| `ralph` | 3 | 2 | 3 | 4 | 2 | 4 | `18` | excellent loop, but not a general top-level workspace layer |
| `mattpocock/skills` | 2 | 3 | 3 | 3 | 4 | 3 | `18` | strong supporting skills, not a full operating layer |

Winner:

- `superpowers`

Why:

- explicit Codex path
- strong workflow discipline
- lower environment friction than `oh-my-codex`
- more suitable as the main workspace operating layer than `ralph`

Install label:

- `default-install`

## Arena B: Coding Craft

Candidates:

- `superpowers`
- `mattpocock/skills`
- `ralph` partial
- `oh-my-codex` partial

| Candidate | Domain fit | Codex fit | Asset quality | Guardrails | Burden | Depth | Total / 24 | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `superpowers` | 4 | 4 | 4 | 4 | 3 | 4 | `23` | strongest process-heavy coding library |
| `mattpocock/skills` | 4 | 3 | 3 | 3 | 4 | 4 | `21` | strongest modular coding library |
| `ralph` | 3 | 2 | 3 | 4 | 2 | 4 | `18` | best autonomous coding loop, not best daily craft layer |
| `oh-my-codex` | 2 | 2 | 3 | 4 | 1 | 3 | `15` | orchestration-heavy, coding craft is secondary |

Winner:

- `superpowers` for strict default engineering workflow

Close second:

- `mattpocock/skills` for modular, lower-friction install

Install guidance:

- if you want one main coding system, choose `superpowers`
- if you want selective composable skills with less global discipline, choose `mattpocock/skills`

## Arena C: Frontend Design Craft

Candidates:

- `impeccable`
- `taste-skill`
- `mattpocock/skills` partial
- `claude-agents` partial

| Candidate | Domain fit | Codex fit | Asset quality | Guardrails | Burden | Depth | Total / 24 | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `impeccable` | 4 | 4 | 4 | 4 | 3 | 4 | `23` | best default design system for Codex |
| `taste-skill` | 4 | 4 | 4 | 3 | 4 | 4 | `23` | best aggressive visual taste challenger |
| `mattpocock/skills` | 2 | 3 | 2 | 2 | 4 | 2 | `15` | useful for software interface design exploration, not visual polish system |
| `claude-agents` | 1 | 0 | 0 | 1 | 3 | 1 | `6` | insufficient Codex and asset evidence |

Tie-break winner:

- `impeccable`

Why it beats `taste-skill` in your setup:

- explicit Codex packaging
- stronger context discipline
- stronger command surface for repeated design work
- lower risk of purely aesthetic oversteer

Secondary recommendation:

- `taste-skill` as a project-scoped or task-scoped companion for bolder visual output

## Arena D: Marketing System

Candidates:

- `marketingskills`

| Candidate | Domain fit | Codex fit | Asset quality | Guardrails | Burden | Depth | Total / 24 | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `marketingskills` | 4 | 4 | 4 | 3 | 3 | 4 | `22` | clear default winner |

Winner:

- `marketingskills`

Why:

- explicit Codex compatibility
- strong shared-context architecture
- wide coverage across CRO, copy, SEO, analytics, GTM, and growth

Install label:

- `default-install`

## Arena E: Writing And Voice

Candidates:

- `inside-lago-voice-skill`
- `claude-agents` partial via `content-writer`
- `marketingskills` partial for marketing copy

| Candidate | Domain fit | Codex fit | Asset quality | Guardrails | Burden | Depth | Total / 24 | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `inside-lago-voice-skill` | 4 | 2 | 3 | 3 | 3 | 4 | `19` | best personal voice calibration template |
| `claude-agents` | 2 | 0 | 2 | 2 | 3 | 2 | `11` | general content helper, not voice system |
| `marketingskills` | 2 | 4 | 3 | 2 | 3 | 3 | `17` | strong for marketing copy, not personal voice cloning |

Winner for personal voice:

- `inside-lago-voice-skill`

Winner for marketing copy workflows:

- `marketingskills`

## Stage 5: What To Install In Your Codex Setup

### Default Global / Core Install Winners

- workspace orchestration: `superpowers`
- frontend design craft: `impeccable`
- marketing system: `marketingskills`

### Strong Secondary / Project-Scoped Installs

- bold visual direction: `taste-skill`
- modular coding craft: `mattpocock/skills`
- personal voice calibration: `inside-lago-voice-skill`
- autonomous long-running implementation loop: `ralph`

### Reference / Fork-First

- `oh-my-codex`
  - strongest reference for Codex-specific orchestration ideas
  - not the cleanest default install for this Windows Codex app-centered setup

- `claude-agents`
  - useful specialist examples
  - not enough Codex-specific evidence to prioritize over stronger alternatives

## Stage 6: How The Template Questions Were Determined

### Repo-Intake

Every answer came from one of:

- explicit README or repo metadata
- structural file/folder evidence
- deterministic V2 derivation rules

No repo-intake answer should be "expert intuition only."

### Asset-Scorecard

Every static metric came from:

- trigger text
- ordered workflow steps
- outputs/files
- checks/review gates
- anti-patterns/prohibitions
- runtime/install evidence

### Live-Run-Report

No actual live-run-report scores were produced in this simulation.

Reason:

- no benchmark traces were run
- V2 forbids estimated live scores

## Final Recommendation

If you want the cleanest high-signal starting stack for this Codex workspace:

1. `superpowers`
2. `impeccable`
3. `marketingskills`

Then selectively add:

4. `taste-skill`
5. `mattpocock/skills`
6. `inside-lago-voice-skill`

Keep as specialized or fork-first references:

7. `ralph`
8. `oh-my-codex`
9. `claude-agents`

## Source Basis

Primary source basis for this simulation included the official GitHub repositories and representative repo files for all nine libraries.
