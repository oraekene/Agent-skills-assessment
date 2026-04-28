# Phase 8 Worked Simulation

This simulation shows how security review stays separate from intrinsic quality.

## Scenario A: High Quality, Low Risk

Unit:

- `unit-impeccable-main`

Review method:

- `static-pattern-review`

Observed result:

- no security findings

Security output:

- `reviewed-no-findings`

Interpretation:

- strong intrinsic quality
- no current security warning

## Scenario B: Potentially Useful, But Risky Installer

Unit:

- `unit-example-risky-installer`

Observed patterns:

- remote code piped directly into execution
- destructive operation guidance without clear safeguards

Security findings:

1. external execution risk
   - severity:
     - `high`
2. unsafe automation risk
   - severity:
     - `medium`

Security output:

- `reviewed-findings-present`
- `block_recommendation=true`

Interpretation:

- even if the skill were otherwise useful, it should be blocked or heavily warned

## Scenario C: Public Surface

Public page for the risky unit shows:

- risk badge
- short warning summary

It does not show:

- dangerous command details
- operator-only notes

## Scenario D: Runtime Interaction

If the risky unit is installed locally:

- runtime may consume the security result
- automatic activation may be blocked

This happens without changing the intrinsic ranking model itself.

## Why Phase 8 Matters

Without Phase 8, the system might recommend something strong-but-dangerous as if quality were the only thing that matters.

With Phase 8:

- quality remains measurable
- risk remains measurable
- the user can see both dimensions separately
