# Runtime Skill Discovery And Progressive Loading

This subsystem is the runtime counterpart to Phase 2 retrieval.

Phase 2 answers:

- what skill is best for this task
- what should the user install
- what should rank highest in the directory

This subsystem answers:

- what installed skills are visible right now
- which of them are eligible right now
- which skill metadata enters context first
- when full skill instructions should load
- when supporting files should load
- how runtime artifacts should be exposed without bloating context

## Core Architectural Rule

`Directory ranking` and `runtime skill loading` must remain separate subsystems.

They can inform each other, but they solve different problems.

Directory ranking decides:

- recommendation
- comparison
- installation choice

Runtime loading decides:

- discovery
- eligibility
- context budget
- activation
- persistence

## Design Goals

The subsystem must combine the strongest ideas from:

- Codex
- Claude
- Cursor
- OpenClaw
- Hermes

## Borrowed Design Principles

### From Codex

- hard initial skill-index budget
- full `SKILL.md` loads only when selected
- repository scanning from current working directory to repository root
- symlink-safe skill discovery
- plugins as distribution units
- explicit separation between local authoring and installed distribution

### From Claude

- progressive disclosure across metadata, body, and supporting files
- nested discovery in subdirectories
- live change detection
- path-based activation
- invocation control
- pre-approved tool policies
- subagent-bound skill execution
- compaction-aware skill persistence

### From Cursor

- dynamic context discovery using files
- search-driven retrieval of skill details
- file-backed access to long artifacts
- search-driven loading of tool outputs, history, and runtime traces
- minimal static prompt surface with on-demand deep reads

### From OpenClaw

- deterministic eligibility gating
- environment, binary, config, and secret checks
- explicit precedence rules
- allowlists
- extra read-only directories
- install-time dangerous-code scanning
- deterministic token-cost accounting

### From Hermes

- explicit runtime discovery APIs
- `skills_list`
- `skill_view`
- `skill_view(path)`
- `skill_manage`
- external read-only directories
- secure deferred setup for missing secrets
- multi-source hub integration
- self-maintaining procedural memory

## Runtime Model

The runtime subsystem works in seven stages:

1. skill root discovery
2. inventory and precedence resolution
3. eligibility gating
4. initial metadata index construction
5. activation decision
6. progressive loading
7. session persistence and compaction recovery

## 1. Skill Root Discovery

The runtime must scan these categories:

- bundled runtime skills
- system or admin-managed skills
- user skills
- external read-only directories
- plugin-delivered skills
- repository-local skill directories
- nested repository-local skill directories

### Repository Discovery Rule

For repository skills, scan from:

- current working directory
- every parent directory up to repository root

The runtime must support nested package-local skill roots, not just one root.

### Symlink Rule

Discovery must be symlink-safe.

Rules:

- follow symlinks only when the resolved target stays inside an allowed root
- record both lexical path and resolved real path
- reject or quarantine skill roots that escape approved boundaries

### External Directory Rule

External directories are allowed as read-only discovery roots.

Rules:

- scan them for discovery
- never write there by default
- local writable roots override external read-only roots on name conflict
- missing external roots are skipped without fatal errors

## 2. Inventory And Precedence Resolution

After discovery, construct a runtime-visible skill inventory.

Each visible skill record must contain:

- `skill_id`
- `name`
- `source_type`
- `lexical_path`
- `resolved_path`
- `scope`
- `precedence_rank`
- `plugin_id` if plugin-delivered
- `description`
- `when_to_use` if present
- `path_filters`
- `invocation_policy`
- `allowed_tools`
- `runtime_requirements`
- `supporting_files_index`

### Precedence Rule

Precedence must be deterministic.

Default order:

1. nested repository-local skill closest to active file
2. repository-local skill at current working directory
3. repository-local skill in parent directories up to repo root
4. user-local writable skills
5. admin or managed skills
6. bundled runtime skills
7. plugin-delivered skills
8. external read-only directories

If the same `name` exists in multiple places:

- select the highest-precedence visible copy for implicit activation
- preserve lower-precedence copies in the inventory as shadowed records
- expose shadow state in runtime APIs

## 3. Eligibility Gating

Before a skill can be activated, it must pass deterministic gating.

### Gating Fields

- operating system compatibility
- binary availability
- environment variable requirements
- config key requirements
- secret setup state
- path filter compatibility
- allowlist compatibility
- dangerous-code scan state

### Gating States

- `eligible`
- `eligible-with-warning`
- `blocked-missing-bin`
- `blocked-missing-env`
- `blocked-missing-config`
- `blocked-path-filter`
- `blocked-allowlist`
- `blocked-dangerous-scan`
- `blocked-invalid-structure`

### Secret Handling Rule

Missing secrets must not hide a skill from discovery.

Instead:

- list the skill in the runtime index
- mark it `setup-required`
- prompt for secret setup only when the skill is actually being activated in a secure local surface
- never ask for secrets in remote or unsafe surfaces

### Dangerous-Code Scan Rule

Any skill that includes executable installer or runtime content must have a scan state:

- `not-scanned`
- `clean`
- `warning`
- `critical`

Default activation rules:

- `critical` blocks activation
- `warning` permits activation with warning
- `not-scanned` permits discovery but not trusted automatic activation in strict mode

## 4. Initial Metadata Index Construction

This is the always-available skill surface for the model.

The runtime must inject only:

- `name`
- `description`
- `skill path or identifier`
- minimal invocation policy
- minimal gating state if relevant

It must not inject:

- full `SKILL.md` body
- full supporting files
- full scripts

### Hard Budget Rule

The runtime must build the initial skill index under a hard size budget.

Default budget:

- use a percentage of total context window when known
- otherwise use a fixed character cap

### Truncation Order

When over budget:

1. shorten descriptions
2. omit optional metadata
3. omit lower-priority eligible skills
4. never omit explicitly pinned or manually invoked skills

### Token-Cost Accounting Rule

The runtime must compute and store:

- total static index characters
- per-skill static contribution
- truncation state
- omitted skill count

This makes runtime context usage auditable.

## 5. Activation Decision

A skill can activate through:

- explicit invocation
- implicit task match
- path-triggered auto-eligibility
- subagent-bound workflow invocation

### Invocation Policies

Each skill must declare one of:

- `user-and-model`
- `user-only`
- `model-only`
- `subagent-only`

### Path Filter Rule

If a skill has path filters:

- it is eligible for automatic activation only when the active file set matches
- it can still remain manually invocable if policy allows

### Activation Decision Inputs

- user request
- active files
- current workspace path
- runtime gating state
- static metadata index
- directory ranking hints if available

### Ranking Hint Rule

Directory scores may influence runtime activation priority, but they must not override:

- ineligibility
- path mismatch
- explicit user invocation
- explicit local precedence

## 6. Progressive Loading

Progressive loading occurs in levels.

### Level 0: Metadata Index

Always available within the static budget.

Contains:

- name
- description
- path
- minimal policy flags

### Level 1: Full `SKILL.md`

Load when:

- explicitly invoked
- selected by the model
- selected for subagent execution

### Level 2: Supporting Files

Load supporting files only when needed.

Examples:

- references
- examples
- templates
- assets metadata
- specific helper docs

Supporting files must be indexed, not preloaded.

### Level 3: Executable And Large Runtime Artifacts

These should be exposed as searchable or runnable artifacts, not injected raw:

- scripts
- long terminal outputs
- long tool outputs
- chat history files
- benchmark traces
- MCP tool descriptions

## 7. Dynamic Context Discovery

The runtime must treat many artifacts as searchable files.

### File-Backed Artifact Types

- skill metadata index
- skill body files
- supporting reference files
- tool output files
- terminal transcript files
- chat history files
- MCP tool description files
- benchmark and validation trace files

### General Rule

Prefer:

- `small static handles`

over:

- `large static prompt injection`

The model should search and open what it needs.

### Runtime Artifact Rules

#### Tool Outputs

- long outputs should be written to files
- only a minimal handle and tail summary enters context
- deeper reads happen on demand

#### Chat History

- summaries may drop detail
- history file references allow recovery after compaction

#### MCP Tool Descriptions

- only lightweight MCP index enters static context
- tool detail files are loaded on demand

#### Terminal Sessions

- terminal transcripts should be addressable as files
- the model can grep or tail them instead of receiving full logs inline

## 8. Subagent-Bound Skills

Some skills should run in isolated execution contexts.

Rules:

- skills may declare subagent execution preference
- runtime passes full skill body to the subagent only after activation
- parent session receives summarized results
- subagent-only skills do not appear as normal user-invocable commands unless configured

## 9. Live Change Detection

The runtime must watch known skill roots.

Events:

- add
- modify
- remove
- move

Effects:

- refresh metadata index
- refresh precedence map
- refresh gating state
- refresh supporting-file index

If a new top-level watched root did not exist at session start:

- mark as `restart-may-be-required`

## 10. Compaction-Aware Persistence

Activated skills must persist across long sessions.

Rules:

- retain the most recent activation record per skill
- re-attach skill state after summarization within a bounded budget
- preserve handles to chat history and external artifact files
- drop older, less relevant activated skills before dropping the most recent explicit skill

## 11. Explicit Runtime APIs

The subsystem must expose deterministic APIs.

### `skills_list()`

Returns:

- visible skills
- effective precedence
- eligibility state
- minimal metadata

### `skill_view(name)`

Returns:

- full rendered `SKILL.md`
- metadata
- gating state
- supporting-file index

### `skill_view(name, path)`

Returns:

- one supporting file or artifact by path

### `skill_manage(action, ...)`

Allowed actions:

- `create`
- `patch`
- `edit`
- `delete`
- `write_file`
- `remove_file`

Write rules:

- default write target is a local writable skills root
- external directories remain read-only
- every mutation is logged

## 12. Plugin And Hub Distribution

Skills are the authoring format.

Plugins are the installable distribution format.

Hub integrations may include:

- source-specific registries
- direct GitHub installs
- URL-based skill endpoints
- well-known skill indexes

Runtime discovery must record provenance for all installed skills.

## 13. Relationship To Directory Ranking

The runtime subsystem may consume ranking outputs as hints:

- install recommendations
- tie-break hints
- quality warnings

But runtime activation is not the same as directory ranking.

Runtime must optimize for:

- correctness
- locality
- eligibility
- context efficiency
- safety

## Success Condition

The system can:

- discover skills from multiple roots deterministically
- enforce precedence deterministically
- gate skills based on environment deterministically
- keep the static skill surface under a hard budget
- load full instructions only when selected
- load supporting files only when needed
- expose tool outputs and histories as searchable artifacts
- survive long sessions through compaction-aware recovery
- support explicit runtime inspection and management APIs
