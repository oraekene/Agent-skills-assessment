# Domain Taxonomy

This taxonomy exists so we do not compare unrelated assets using the same expectations.

## Primary Domains

### 1. Orchestration

Assets that coordinate how work happens rather than solving a narrow task directly.

Typical examples:

- session workflows
- planning loops
- multi-agent systems
- completion loops
- branch and worktree flows
- review gates

Key question:

- does this improve the whole operating model of the agent?

### 2. Coding

Assets focused on engineering output and code change quality.

Typical examples:

- TDD skills
- debugging skills
- refactoring skills
- issue triage skills
- architecture review skills

Key question:

- does this improve code correctness, maintainability, or delivery quality?

### 3. Design

Assets focused on interface quality, visual taste, motion, responsiveness, and UX polish.

Typical examples:

- frontend-design skills
- redesign skills
- anti-slop design systems
- audit and polish commands

Key question:

- does this improve interface quality in visible and repeatable ways?

### 4. Marketing

Assets focused on positioning, conversion, acquisition, retention, growth, and measurement.

Typical examples:

- CRO skills
- copywriting skills
- SEO skills
- analytics setup skills
- launch and pricing skills

Key question:

- does this improve business-facing messaging, funnels, or experimentation?

### 5. Writing And Voice

Assets focused on content structure, tone, audience adaptation, and personal or brand voice.

Typical examples:

- voice templates
- content-writer agents
- editorial rewrite systems
- founder-writing calibration skills

Key question:

- does this preserve or improve voice without flattening it into generic AI language?

### 6. Meta / Skillcraft

Assets that teach how to create, validate, test, or package other skills.

Typical examples:

- skill-writing guides
- validation scripts
- build systems for multi-provider output
- packaging standards

Key question:

- does this help us build, adapt, test, and maintain our own skill ecosystem?

## Secondary Tags

Use as many as needed:

- `planning`
- `execution`
- `review`
- `verification`
- `research`
- `browser-dependent`
- `test-dependent`
- `stateful`
- `multi-agent`
- `voice-calibrated`
- `anti-pattern-heavy`
- `template-driven`
- `Codex-native`
- `Claude-first`
- `adapter-required`

## Asset Types

### Skill

A `SKILL.md` or equivalent domain instruction asset.

### Agent

A persona or role file intended to be selected or invoked as a sub-agent or specialized helper.

### Prompt

A command-like or explicit prompt surface.

### AGENTS File

A persistent workspace or repo instruction file such as `AGENTS.md`.

### Config

Runtime configuration such as `.codex/config.toml` or compatible files.

### Script / CLI

Executable logic that extends behavior beyond pure instructions.

### Template

A structure intended to be filled in, such as PRD templates or writing voice templates.

### Reference Pack

Support files imported by a main skill, such as design references or test guidelines.

## Comparison Units

Always decide which unit you are scoring.

### Repo-Level

Use when judging:

- maturity
- architecture
- maintenance quality
- provider support
- install burden

### Asset-Level

Use when judging:

- one skill
- one agent
- one prompt
- one script
- one template

### Workflow-Level

Use when judging:

- the full path from user request to output
- cross-file coordination
- how multiple assets chain together

## Domain-Specific Expectations

### Orchestration

Expect:

- clear phases
- explicit gates
- handoff logic
- state handling
- failure recovery

### Coding

Expect:

- behavior-first verification
- scope control
- codebase grounding
- test strategy
- anti-hallucination guidance

### Design

Expect:

- anti-generic taste controls
- responsive guidance
- motion discipline
- accessibility guardrails
- strong anti-pattern language

### Marketing

Expect:

- audience clarity
- business context grounding
- funnel or conversion logic
- measurement orientation
- reusable context artifacts

### Writing And Voice

Expect:

- strong examples
- audience/channel adaptation
- anti-filler controls
- preservation of authentic voice
- revision and calibration loop
