# Static Rubric

This rubric scores the artifact itself before any live execution.

Total score: `100`

## 1. Instruction Architecture — 15

Questions:

- Is the asset internally well-structured?
- Is the sequence of work clear?
- Are the instructions easy for an agent to follow consistently?

Scoring guide:

- `0-5`: vague, messy, contradictory
- `6-10`: understandable but uneven
- `11-15`: crisp, coherent, strongly scaffolded

## 2. Workflow Completeness — 12

Questions:

- Does it define entry, middle, and exit?
- Does it cover handoff, closure, or follow-through?

Scoring guide:

- `0-4`: fragment only
- `5-8`: useful but incomplete
- `9-12`: full loop or intentionally bounded workflow

## 3. Guardrails And Failure Prevention — 12

Questions:

- Does it reduce common failure modes?
- Does it warn against anti-patterns?
- Does it constrain hallucination or overreach?

## 4. Verification Design — 10

Questions:

- Does it define how success is checked?
- Does it require tests, review, browser checks, or factual validation?

## 5. Artifact Contract Clarity — 10

Questions:

- Does it clearly say what should be produced?
- Are output paths, formats, or deliverables explicit?

## 6. Codex Compatibility — 10

Questions:

- Does it work in Codex without major surgery?
- If not, is adaptation straightforward?

Scoring guide:

- `0-3`: strongly tied to another runtime
- `4-7`: portable with some editing
- `8-10`: Codex-ready or near-native

## 7. Composability — 8

Questions:

- Can it coexist with other skills?
- Does it hand off cleanly?
- Is it narrow enough to compose when needed?

## 8. Customization Model — 8

Questions:

- Is it adaptable to project context?
- Does it support calibration, parameters, or local overrides?

## 9. Tooling / Runtime Burden — 5

Questions:

- Does it demand heavy setup?
- Does it require niche tools or brittle dependencies?

Scoring guide:

- `0-1`: heavy burden
- `2-3`: moderate burden
- `4-5`: low burden or justified overhead

## 10. Maintainability — 5

Questions:

- Is the asset easy to update?
- Is the repo structure sane?
- Are source and generated files clearly separated?

## 11. Validation Assets And Examples — 5

Questions:

- Are there examples, test cases, sample outputs, validators, or strong README evidence?

## Domain-Specific Bonus Lens

Do not change the score total. Use this as a commentary layer.

### Orchestration

Check:

- phase gating
- state persistence
- handoff clarity
- decomposition discipline

### Coding

Check:

- codebase grounding
- behavior-first thinking
- scope containment
- test realism

### Design

Check:

- anti-slop specificity
- responsiveness
- motion discipline
- accessibility awareness

### Marketing

Check:

- audience grounding
- reusable business context
- measurement logic
- channel awareness

### Writing And Voice

Check:

- anti-filler strength
- voice authenticity
- audience switching
- revision loop

## Scoring Bands

- `0-39`: weak
- `40-59`: partially useful but unreliable
- `60-74`: promising with notable issues
- `75-84`: strong
- `85-100`: excellent static candidate
