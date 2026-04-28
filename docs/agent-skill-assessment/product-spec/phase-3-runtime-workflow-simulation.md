# Phase 3 Runtime Workflow Simulation

This file is a complete worked simulation of the runtime subsystem.

It shows:

- discovered skill roots
- precedence resolution
- eligibility gating
- hard-budget metadata indexing
- activation decisions
- progressive loading
- file-backed artifact retrieval
- compaction-aware recovery

The purpose is to show exactly how runtime behavior differs from directory ranking.

## Scenario

Assume the user launches Codex Desktop from:

`C:\Users\IFEANYI-ORAE\OneDrive\Documents\New project\apps\dashboard`

Assume the active file is:

`C:\Users\IFEANYI-ORAE\OneDrive\Documents\New project\apps\dashboard\src\pages\Settings.tsx`

Assume the user asks:

`Audit and improve this SaaS dashboard settings page.`

## Runtime Inputs

### Local Roots

1. nested repo-local:
   - `C:\Users\IFEANYI-ORAE\OneDrive\Documents\New project\apps\dashboard\.agents\skills`
2. repo root:
   - `C:\Users\IFEANYI-ORAE\OneDrive\Documents\New project\.agents\skills`
3. user-local:
   - `C:\Users\IFEANYI-ORAE\.codex\skills`
4. external read-only:
   - `C:\Users\IFEANYI-ORAE\shared-skills`
5. plugin-delivered:
   - bundled plugin skill roots already mounted by runtime

### Runtime Environment

- OS: `windows`
- available binaries:
  - `git`
  - `node`
  - `npm`
  - `rg`
- missing binaries:
  - `figma-cli`
- config keys present:
  - `browser.enabled=true`
  - `playwright.enabled=true`
- config keys missing:
  - `figma.token`
- env vars present:
  - `OPENAI_API_KEY`
- env vars missing:
  - `FIGMA_TOKEN`
- strict dangerous-scan mode:
  - `true`
- context-window-known:
  - `false`
- static skill-index character budget:
  - `8000`

## Step 1: Skill Root Discovery

The runtime scans in this order:

1. active nested repo-local root
2. parent repo-local roots up to repository root
3. user-local writable root
4. plugin-delivered roots
5. external read-only roots

### Discovery Outcome

- root `rt-root-1`
  - scope: `repo-nested`
  - path: `apps/dashboard/.agents/skills`
- root `rt-root-2`
  - scope: `repo-root`
  - path: `.agents/skills`
- root `rt-root-3`
  - scope: `user`
  - path: `~/.codex/skills`
- root `rt-root-4`
  - scope: `plugin`
  - path: `plugin://browser-use/.../skills/browser`
- root `rt-root-5`
  - scope: `external-read-only`
  - path: `C:\Users\IFEANYI-ORAE\shared-skills`

### Symlink Check

Assume:

- one symlink in `rt-root-5` points outside the allowed shared root

Result:

- that skill is quarantined
- it does not enter the visible runtime inventory

## Step 2: Visible Skill Inventory

Assume discovery finds these skills:

1. `dashboard-ui-audit`
   - root: `rt-root-1`
2. `frontend-standards`
   - root: `rt-root-2`
3. `impeccable`
   - root: `rt-root-3`
4. `taste-redesign`
   - root: `rt-root-3`
5. `figma-to-ui`
   - root: `rt-root-3`
6. `browser-use:browser`
   - root: `rt-root-4`
7. `dashboard-ui-audit`
   - root: `rt-root-5`

### Shadow Resolution

`dashboard-ui-audit` exists in both `rt-root-1` and `rt-root-5`.

Deterministic outcome:

- visible active copy:
  - `rt-root-1`
- shadowed copy preserved:
  - `rt-root-5`

Reason:

- nested repo-local root outranks external read-only root

## Step 3: Eligibility Gating

Each skill is evaluated against deterministic gating fields.

### Gating Table

1. `dashboard-ui-audit`
   - OS: pass
   - bins: none required
   - env vars: none required
   - config keys: none required
   - path filter: `apps/dashboard/**`
   - active file match: pass
   - dangerous scan: `clean`
   - result: `eligible`

2. `frontend-standards`
   - OS: pass
   - bins: none required
   - env vars: none required
   - config keys: none required
   - path filter: `*.tsx`
   - active file match: pass
   - dangerous scan: `clean`
   - result: `eligible`

3. `impeccable`
   - OS: pass
   - bins: `node`
   - `node`: present
   - env vars: none required
   - config keys: none required
   - dangerous scan: `warning`
   - result: `eligible-with-warning`

4. `taste-redesign`
   - OS: pass
   - bins: none required
   - env vars: none required
   - config keys: none required
   - dangerous scan: `clean`
   - result: `eligible`

5. `figma-to-ui`
   - OS: pass
   - bins: `figma-cli`
   - `figma-cli`: missing
   - env vars: `FIGMA_TOKEN`
   - `FIGMA_TOKEN`: missing
   - config keys: `figma.token`
   - `figma.token`: missing
   - dangerous scan: `clean`
   - result: `blocked-missing-bin`

6. `browser-use:browser`
   - OS: pass
   - bins: none required
   - config key: `browser.enabled=true`
   - present: yes
   - dangerous scan: `clean`
   - result: `eligible`

7. shadowed external `dashboard-ui-audit`
   - not eligible for activation because it is shadowed
   - result: `shadowed`

## Step 4: Initial Metadata Index

Only runtime-visible, non-shadowed skills are candidates for static inclusion.

Candidate set:

- `dashboard-ui-audit`
- `frontend-standards`
- `impeccable`
- `taste-redesign`
- `figma-to-ui`
- `browser-use:browser`

### Raw Static Entries

Each entry includes only:

- name
- description
- path or id
- invocation policy
- relevant gating notice

Assume raw per-skill character costs:

- `dashboard-ui-audit`: `620`
- `frontend-standards`: `850`
- `impeccable`: `1320`
- `taste-redesign`: `1180`
- `figma-to-ui`: `980`
- `browser-use:browser`: `1640`

Assume total:

- `6590`

Budget:

- `8000`

Outcome:

- no omission required
- no description shortening required

### Strict Alternative

If 20 more installed skills existed and total cost reached `10920`:

truncation would occur in this order:

1. shorten long descriptions
2. remove optional gating detail from eligible skills
3. omit low-priority blocked skills such as `figma-to-ui`
4. keep explicitly pinned or manually invoked skills

## Step 5: Activation Decision

User request:

`Audit and improve this SaaS dashboard settings page.`

Active file:

- `Settings.tsx`

Compatible runtime candidates after gating:

- `dashboard-ui-audit`
- `frontend-standards`
- `impeccable`
- `taste-redesign`
- `browser-use:browser`

Blocked candidate:

- `figma-to-ui`

### Activation Logic

1. explicit invocation present:
   - `no`
2. path-filtered local match:
   - `dashboard-ui-audit` strongly matches
3. domain fit:
   - `impeccable`, `taste-redesign`
4. runtime helper:
   - `browser-use:browser`

### Final Activation Set

Primary activated skill:

- `dashboard-ui-audit`

Secondary activated skills:

- `impeccable`
- `browser-use:browser`

Not activated:

- `frontend-standards`
  - relevant but lower priority than design-audit-specific skills
- `taste-redesign`
  - relevant but outranked by `impeccable`
- `figma-to-ui`
  - blocked

## Step 6: Progressive Loading

### Level 0 Already In Context

The runtime already exposed metadata index entries for all visible candidates.

### Level 1 Loads

On activation, load full `SKILL.md` for:

- `dashboard-ui-audit`
- `impeccable`
- `browser-use:browser`

### Level 2 Supporting-File Loads

Assume `dashboard-ui-audit/SKILL.md` references:

- `references/dashboard-checklist.md`
- `examples/good-audit.md`

Assume `impeccable/SKILL.md` references:

- `references/principles.md`
- `examples/common-fixes.md`

The model loads:

- `dashboard-checklist.md`
  - because the user asked for an audit
- `principles.md`
  - because `impeccable` requires design evaluation criteria

The model does not load:

- `good-audit.md`
- `common-fixes.md`

Reason:

- they are indexed but not yet needed

### Level 3 Artifact Access

The model uses:

- browser plugin runtime
- local tool outputs
- terminal transcript handles

These are exposed as file-backed artifacts, not pasted inline.

## Step 7: File-Backed Artifact Retrieval

Assume the agent runs a browser inspection and captures a long DOM and accessibility report.

Runtime behavior:

- full report written to:
  - `.runtime-artifacts/browser/audit-001.txt`
- only a short handle enters context:
  - `browser audit saved to audit-001.txt`

If the model needs more detail:

- it opens or greps the file

Assume the agent also runs a long shell command:

- output written to:
  - `.runtime-artifacts/terminal/session-014.log`

Again:

- tail summary enters context
- full log remains file-backed

## Step 8: `skills_list()` Example

Example runtime output:

```json
{
  "visible_skills": [
    {
      "name": "dashboard-ui-audit",
      "precedence": "repo-nested",
      "eligibility_state": "eligible"
    },
    {
      "name": "frontend-standards",
      "precedence": "repo-root",
      "eligibility_state": "eligible"
    },
    {
      "name": "impeccable",
      "precedence": "user",
      "eligibility_state": "eligible-with-warning"
    },
    {
      "name": "taste-redesign",
      "precedence": "user",
      "eligibility_state": "eligible"
    },
    {
      "name": "figma-to-ui",
      "precedence": "user",
      "eligibility_state": "blocked-missing-bin"
    }
  ]
}
```

## Step 9: `skill_view(name)` Example

User or model asks to inspect `dashboard-ui-audit`.

Returned:

- rendered `SKILL.md`
- gating state
- path filter
- supporting file index

## Step 10: Compaction-Aware Recovery

Assume the session becomes long and is summarized.

The runtime must preserve:

- latest activation of `dashboard-ui-audit`
- latest activation of `impeccable`
- handles to:
  - `audit-001.txt`
  - `session-014.log`

It may drop:

- non-activated candidate details
- older lower-priority skill activations

### Recovery Outcome

After compaction:

- static metadata index is rebuilt
- most recent activated skills are reattached within budget
- artifact file handles remain available
- the model can reopen the audit file if the summary omitted detail

## Why This Matters

This simulation shows why Phase 3 is not the same as Phase 2.

Phase 2 would answer:

- which design skills rank highest for the task

Phase 3 answers:

- which installed skills are actually visible
- which are blocked
- which one wins on local precedence
- what enters context under budget
- what files are loaded only on demand
- what survives compaction

## Phase 3 Success Check

This worked simulation satisfies the Phase 3 success condition because it shows:

- deterministic root discovery
- deterministic shadowing
- deterministic gating
- deterministic static budget handling
- deterministic activation
- deterministic progressive loading
- deterministic runtime artifact access
- deterministic compaction recovery
