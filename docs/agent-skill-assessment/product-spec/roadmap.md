# Roadmap

## Phase 0: Current State

Already exists:

- V1 assessment framework
- V2 evidence-coded scoring
- V2.1 extensible taxonomy
- worked simulations
- machine-readable ledgers

Gap:

- not yet a product architecture
- not yet a skill-first directory system

## Phase 1: Internal Core Model

Goal:

- convert the toolkit into a real internal comparison engine

Deliver:

- skill-first entity model
- source/package/unit normalization
- V2.1 taxonomy assignment on unit records
- tag system including source tags
- score-family model
- grouped-band result presentation model

Success:

- compare your current skill libraries at unit level, not only repo level

## Phase 2: Internal Retrieval Engine

Goal:

- support practical discovery inside your own workspace

Deliver:

- browse by domain
- browse by source
- browse by tag
- compare selected skills
- natural-language task matching with structured retrieval

Success:

- user can ask for a task and get a ranked shortlist

## Phase 3: Runtime Skill Discovery And Progressive Loading

Goal:

- add a real runtime behavior layer distinct from directory ranking

Deliver:

- skill-root discovery rules
- precedence and shadow handling
- eligibility gating
- static skill-index budgeting
- progressive loading levels
- runtime inspection and management APIs

Success:

- the system can explain not just which skill is best, but which installed skill would actually load and why

## Phase 4: Benchmark Subsystem

Goal:

- add real benchmark definition and result tracking

Deliver:

- benchmark object model
- benchmark templates
- user-authored benchmark support
- guided benchmark scaffolding
- runner-state tracking

Success:

- benchmarks can be defined and stored truthfully even when a runner is blocked

## Phase 5: Self-Maintaining Ingestion

Goal:

- expand from curated sources to many sources

Deliver:

- source registry
- sync pipeline
- change detection
- auto-ingestion queue
- taxonomy reclassification path

Success:

- the directory can keep itself updated from configured sources

## Phase 6: Public Directory

Goal:

- publish the internal engine as a user-facing directory

Deliver:

- public browse and search
- source pages
- skill pages
- explanation views
- grouped score-band presentation

Success:

- users can browse and compare skills without seeing raw internals by default

## Phase 7: Chrome Extension

Goal:

- bring score visibility to third-party pages

Deliver:

- content-script entity detection
- injected score band
- expand for explanation
- nearby better-alternative suggestions

Success:

- users can see ranked context while browsing skills elsewhere

## Phase 8: Security Review Layer

Goal:

- add a separate security and maliciousness review capability

Deliver:

- security review rubric
- malicious/insecure pattern detection
- security score family
- security explanation display

Success:

- risky skills can be flagged even when they are otherwise high-quality
