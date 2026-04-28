# Agent Skill Assessment System

This workspace area is a structured system for assessing agent skills, agent files, prompts, orchestration layers, and related runtime assets before adding them to your Codex setup.

For a stricter evidence-coded version optimized for same-domain library comparison, see:

- `v2/README.md`
- `v2.1/README.md`

The system is designed to compare very different things fairly:

- full orchestration systems such as `oh-my-codex`, `superpowers`, and `ralph`
- domain libraries such as `marketingskills`
- specialized design systems such as `taste-skill` and `impeccable`
- voice and writing templates such as `inside-lago-voice-skill`
- lighter agent bundles such as `claude-agents`

## Goals

- compare skills by domain instead of treating all packs as equivalent
- separate static quality from real execution quality
- make comparisons repeatable across repos and over time
- reduce impulsive installs by forcing explicit evidence and tradeoffs
- preserve results so future workspace decisions are easier

## Folder Structure

`domain-taxonomy.md`

- defines domains, asset types, and evaluation lenses

`evaluation-model.md`

- defines the normalized comparison schema
- defines static and live scoring

`static-rubric.md`

- defines the weighted static scoring system

`live-benchmark-protocol.md`

- defines how to run fair live evaluations

`benchmark-packs.md`

- defines benchmark tasks by domain

`candidates.md`

- seed inventory of repos currently under consideration

`templates/repo-intake.md`

- template for repo-level analysis

`templates/asset-scorecard.md`

- template for skill, prompt, AGENTS file, script, or template analysis

`templates/live-run-report.md`

- template for recording one benchmark execution

`worked-examples/`

- filled examples that show the framework in actual use
- start with `worked-examples/full-workflow-simulation-oh-my-codex-superpowers-impeccable.md`

`v2/`

- deterministic evidence-coded comparison system
- optimized for choosing the best library within the same domain

`product-spec/`

- concrete product architecture for turning the assessment framework into a skill-first directory and ranking system

## Recommended Workflow

1. Start at `candidates.md` and add every repo or local pack you are considering.
2. Complete one `repo-intake` for each repository.
3. Catalog the important assets inside each repo using `asset-scorecard`.
4. Score each asset statically before installing anything.
5. Select only the highest-value assets for live benchmark testing.
6. Run live comparisons using `live-benchmark-protocol.md`.
7. Keep final adoption decisions evidence-based:
   - keep
   - adapt
   - fork
   - reject
   - defer

If you want to see the workflow fully instantiated before doing your own first run, open:

- `worked-examples/full-workflow-simulation-oh-my-codex-superpowers-impeccable.md`

## Comparison Philosophy

Do not ask only "is this skill good?"

Ask:

- what domain is it actually for?
- what unit should be compared: repo, skill, agent, prompt, script, or workflow?
- what assumptions does it make about runtime, tools, and user behavior?
- what does it produce?
- how does it fail?
- how expensive is it to maintain in your workspace?

## Suggested Decision Gates

Use these gates before adopting anything globally:

- `Gate 1: Static fit`
  - passes minimum static threshold for its domain
- `Gate 2: Runtime fit`
  - works in Codex or can be adapted with acceptable effort
- `Gate 3: Conflict fit`
  - does not clash badly with existing prompts, AGENTS rules, or tone
- `Gate 4: Operational fit`
  - acceptable setup burden, maintenance burden, and cognitive load
- `Gate 5: Evidence fit`
  - proved itself on at least one benchmark task that matters to you

## Default Thresholds

These are starting points, not laws:

- static score below `60/100`: reject or archive
- static score `60-74`: interesting but weak or incomplete
- static score `75-84`: strong candidate
- static score `85+`: high-priority live test candidate

- live score below `65/100`: do not adopt without major adaptation
- live score `65-79`: useful but needs containment or specialization
- live score `80-89`: strong adopt or fork candidate
- live score `90+`: top-tier for that domain and benchmark

## Important Rule

Keep static and live scores separate.

A beautifully written skill can still perform badly in practice.
A rough-looking skill can still outperform cleaner competitors on real tasks.
