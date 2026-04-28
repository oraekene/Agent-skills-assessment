# Phase 8 Results

Phase 8 defines the security review layer.

## Files

- `phase-8-security-review-layer.md`
  - rules for categories, findings, thresholds, and separation from intrinsic quality
- `security-review-ledger.schema.json`
  - machine-readable schema for security review runs, findings, and results
- `phase-8-security-review.round1.json`
  - first machine-readable security review example
- `phase-8-worked-simulation.md`
  - worked examples of low-risk and risky skill outcomes

## What Is Now Available

The product can now represent:

- security review runs
- explicit findings
- severity and confidence
- block recommendations
- public-safe security surfacing

## Practical Outcome

The system can now distinguish:

- intrinsic quality

from:

- security risk

which is critical for trustworthy recommendations.

## Main Limitation

Phase 8 is still a specification and example layer.

It does not yet implement:

- automated static detectors
- runtime security monitors
- analyst workflow tooling
- remediation tracking
