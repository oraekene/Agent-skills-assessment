# Agent Skill Assessment V2.1

V2.1 keeps the V2 evidence model, but upgrades taxonomy assignment into a fixed-by-default, deterministically extensible system.

Use V2.1 when you need a taxonomy that:

- is broad and reusable by default
- is not tailored to one repo batch
- can handle any industry, job role, or personal-use context
- can add new domains or function modes when truly necessary
- never invents categories ad hoc during a comparison run

## Core Idea

V2.1 uses a multi-axis model:

- `domain`
  - what primary value type the asset produces
- `function_mode`
  - what main action the asset performs
- `industry`
  - what sector or field it is designed for
- `role`
  - which job role or user persona it serves
- `context_scope`
  - whether it is personal, team, enterprise, regulated, consumer, and so on

The first two axes are taxonomy-controlled.
The last three axes are tags, not new domains.

This prevents:

- domain explosion from every niche industry
- false grouping of fundamentally different capabilities
- ad hoc one-off categories

## Files

`taxonomy-model.md`

- explains the multi-axis model
- explains the difference between domains, modes, and tags

`assignment-rules.md`

- deterministic rules for assigning domains, modes, industry tags, role tags, and scope tags

`extension-protocol.md`

- deterministic rules for creating a new domain or function mode only when necessary

`taxonomy-registry.schema.json`

- schema for the machine-readable taxonomy registry

`taxonomy-registry.json`

- current canonical domains, modes, and allowed extension metadata

## Relationship To V2

V2.1 does not replace the evidence model.

You should still use:

- `../v2/deterministic-evidence-model.md`
- `../v2/template-field-rules.md`

V2.1 replaces only the taxonomy layer with a more general and extensible version.

## Practical Default

Use the canonical registry first.

Only trigger taxonomy extension when the extension protocol says the current registry genuinely cannot represent the asset using:

- existing domain
- existing function mode
- industry tag
- role tag
- context scope tag
