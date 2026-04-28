# Taxonomy Model

V2.1 uses a multi-axis taxonomy.

## Why

A single flat domain list cannot scale well to:

- every industry
- every job role
- every personal need
- every type of agent, skill, workflow, or template

If you try to solve that with domains alone, one of two bad things happens:

- too many domains
- vague mega-domains

V2.1 avoids both by separating value type from context.

## Axes

## 1. Domain

Definition:

- the primary value type the asset produces

Examples:

- orchestration and workflow
- software engineering
- design and UX
- marketing and growth

Domain should answer:

- what kind of problem space does this asset primarily operate in?

## 2. Function Mode

Definition:

- the main action the asset performs within its domain

Examples:

- plan
- implement
- review
- verify
- audit

Function mode should answer:

- what does this asset mainly do?

## 3. Industry Tag

Definition:

- the sector or field the asset is specialized for

Examples:

- healthcare
- finance
- legal
- education
- ecommerce
- software

Industry does not create a new domain by itself.

## 4. Role Tag

Definition:

- the job role, user type, or persona the asset mainly serves

Examples:

- engineer
- designer
- marketer
- founder
- student
- recruiter

Role does not create a new domain by itself.

## 5. Context Scope Tag

Definition:

- the scale, operating environment, or constraint model

Examples:

- personal
- team
- enterprise
- regulated
- consumer
- internal-tooling

Context scope does not create a new domain by itself.

## Classification Rule

When classifying an asset, assign in this order:

1. `domain`
2. `function_mode`
3. `industry_tag`
4. `role_tag`
5. `context_scope_tag`

Only after all five have been tried may the system consider a taxonomy extension.

## Broad-By-Default Rule

The system should prefer:

- existing domain + mode + tags

over:

- creating a new domain or new mode

This keeps the taxonomy reusable.

## Strict-Boundary Rule

The system must not force unrelated assets into the same domain just to stay broad.

A domain only fits if:

- its definition matches the asset's primary value type
- its include rules match
- its exclude rules do not reject the asset

If none fit, the extension protocol may be triggered.
