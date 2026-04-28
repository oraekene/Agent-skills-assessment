# Benchmark Packs

Use these benchmark packs to compare assets within the same domain.

## 1. Orchestration Pack

### Benchmark O1: Ambiguous Request To Approved Plan

Task:

- give a broad, underspecified feature request
- evaluate how well the system clarifies scope and produces an execution-ready plan

Look for:

- question quality
- scope control
- non-goals
- tradeoff handling
- artifact quality

### Benchmark O2: Plan To Parallel Execution

Task:

- provide an approved plan with multiple independent slices
- evaluate whether the system decomposes and coordinates well

Look for:

- task slicing
- handoff quality
- completion tracking
- review gates

### Benchmark O3: Verification Before Completion

Task:

- give a nearly-finished implementation with one hidden regression
- evaluate whether the system catches and validates before declaring done

## 2. Coding Pack

### Benchmark C1: Bug Triage

Task:

- provide a failing behavior with incomplete context

Look for:

- root-cause discipline
- codebase grounding
- evidence gathering

### Benchmark C2: TDD Feature Slice

Task:

- implement one modest feature with explicit behavior requirements

Look for:

- test-first discipline
- interface clarity
- minimalism
- absence of speculative code

### Benchmark C3: Code Review Response

Task:

- provide review comments, including one weak or incorrect comment

Look for:

- technical judgment
- non-performative agreement
- verification before change

## 3. Design Pack

### Benchmark D1: New Landing Page

Task:

- ask for a premium landing page for a fictional SaaS

Look for:

- layout originality
- typography
- color restraint
- motion intent
- mobile handling

### Benchmark D2: Existing UI Redesign

Task:

- provide a mediocre existing UI and ask for improvement

Look for:

- audit depth
- specific critique
- targeted improvement
- anti-slop behavior

### Benchmark D3: Design Audit Only

Task:

- request critique without implementation

Look for:

- issue detection
- prioritization
- actionable recommendations

## 4. Marketing Pack

### Benchmark M1: Product Marketing Context Creation

Task:

- provide a repo and sparse product context

Look for:

- useful auto-draft quality
- audience understanding
- positioning clarity

### Benchmark M2: CRO Audit

Task:

- provide a landing page and ask for conversion improvements

Look for:

- funnel reasoning
- prioritization
- experiment logic

### Benchmark M3: Analytics And Experiment Setup

Task:

- ask for tracking and experimentation plan

Look for:

- event model quality
- metric clarity
- testability

## 5. Writing And Voice Pack

### Benchmark W1: Rewrite Into Founder Voice

Task:

- provide generic AI copy and authentic founder samples

Look for:

- preservation of voice
- removal of filler
- believable tone

### Benchmark W2: Channel Adaptation

Task:

- convert one idea into email, LinkedIn, and internal memo formats

Look for:

- audience adaptation
- channel fit
- retained meaning

### Benchmark W3: Drafted Vs Sent Calibration

Task:

- provide AI draft and human-final version
- ask the system to infer rules and improve future output

Look for:

- quality of calibration logic
- specificity of extracted rules

## Benchmark Discipline

For each domain, keep:

- one lightweight benchmark
- one medium benchmark
- one high-rigor benchmark

That gives you quick screening and deep validation without testing everything at maximum cost.
