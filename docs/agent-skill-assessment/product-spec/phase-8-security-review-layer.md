# Phase 8 Security Review Layer

Phase 8 defines a separate security and maliciousness review subsystem for skills, prompts, workflows, and related files.

## Goal

The goal is to detect:

- intentionally malicious behavior
- insecure operational patterns
- deceptive installation or runtime behavior
- dangerous privilege assumptions

without corrupting intrinsic quality scoring.

## Core Rule

Security review is a separate score family and a separate explanation surface.

A skill may be:

- high quality and high risk
- low quality and low risk
- high quality and low risk
- low quality and high risk

The system must preserve those distinctions.

## Security Review Objects

Phase 8 uses these primary objects:

- `SecurityReviewDefinition`
- `SecurityFinding`
- `SecurityReviewRun`
- `SecurityReviewResult`

## Review Scope

Security review may assess:

- `SKILL.md` instructions
- supporting files
- scripts
- installers
- templates
- command bundles
- external fetch/install behaviors

## Security Categories

Each finding must belong to one or more explicit categories.

### 1. Credential And Secret Risk

Examples:

- encourages secret exfiltration
- requests secrets in unsafe contexts
- logs or echoes secrets
- stores secrets insecurely

### 2. Dangerous Command Risk

Examples:

- destructive shell commands without safeguards
- broad deletion or overwrite patterns
- unsafe privilege escalation assumptions
- hidden system modifications

### 3. External Execution Risk

Examples:

- downloads and executes remote code without validation
- pipes remote content into execution
- runs unverified installers

### 4. Data Exfiltration Risk

Examples:

- sends sensitive files or outputs externally without clear disclosure
- instructs collection of credentials or private documents

### 5. Deceptive Behavior Risk

Examples:

- misrepresents what the skill will do
- hides dangerous side effects
- claims safety properties not supported by the files

### 6. Unsafe Automation Risk

Examples:

- bypasses confirmations for destructive actions
- assumes approval for sensitive operations
- performs actions outside expected workspace boundaries

### 7. Permission Boundary Risk

Examples:

- attempts to evade sandbox restrictions
- encourages unsupported privilege use
- ignores runtime/tool permission models

### 8. Supply Chain And Provenance Risk

Examples:

- unclear source provenance
- mutable remote dependencies with no integrity controls
- installers from untrusted locations

## Finding Severity

Each finding must have a severity:

- `info`
- `low`
- `medium`
- `high`
- `critical`

## Finding Confidence

Each finding must also have a confidence level:

- `low`
- `medium`
- `high`

Low-confidence findings should not trigger hard blocks by themselves.

## Security Review States

Each reviewed unit must have one of:

- `not-reviewed`
- `reviewed-no-findings`
- `reviewed-findings-present`
- `blocked-critical`
- `stale-review`

## Review Methods

Supported review methods:

- `static-pattern-review`
- `manual-security-review`
- `installer-review`
- `runtime-behavior-review`

## Static Review Rules

Static review checks may include:

- dangerous command patterns
- remote execution patterns
- secret-handling patterns
- exfiltration language
- sandbox-evasion language
- misleading instruction patterns

Static review may create findings, but must still preserve confidence labels.

## Runtime Security Review Rules

When runtime review is available, it may assess:

- attempted network behavior
- attempted secret access
- attempted filesystem modifications
- attempted privilege escalation

Runtime review findings must reference observed traces.

## Security Evidence Rules

Every finding must include:

- `finding_id`
- `unit_id`
- `category`
- `severity`
- `confidence`
- `evidence_type`
- `evidence_ref`
- `summary`

Evidence types:

- `file-snippet`
- `script-pattern`
- `install-command`
- `runtime-trace`
- `manual-note`

## Security Score Family

Security review should produce:

- `security_state`
- `highest_severity`
- `finding_count`
- `block_recommendation`

Optional later numeric score:

- `SecurityReviewScore`

If used, it must remain separate from intrinsic quality score.

## Warn And Block Thresholds

### Warn Threshold

Warn when:

- one or more `medium` findings exist
- multiple `low` findings cluster in sensitive categories

### Block Threshold

Block when:

- any `critical` high-confidence finding exists
- multiple `high` findings indicate credible harmful behavior

### Review-Required Threshold

Require manual review before public promotion when:

- findings exist with mixed confidence
- runtime behavior could not be observed
- installer behavior is complex or opaque

## Public Surface Rules

Public surfaces should show:

- risk badge
- public-safe warning summary

Public surfaces should not show:

- exploit-style details
- secrets
- sensitive internal evidence

## Runtime Interaction Rules

Runtime systems may consume security results as gating hints.

Examples:

- `critical` may block automatic activation
- `warning` may permit activation with caution

But runtime security gating must still reference the separate security state, not overwrite core quality ranking.

## Directory Ranking Interaction Rule

Security findings do not rewrite intrinsic quality ranking.

Instead:

- the directory may display a warning or block badge
- filtered public views may hide blocked content by default
- operator views may still inspect blocked items for analysis

## Review Freshness Rule

Security reviews become stale when:

- the underlying source snapshot changes materially
- installer or script content changes
- runtime review evidence predates a meaningful update

## Phase 8 Success Condition

The system can:

- record explicit security findings
- separate intrinsic quality from security risk
- warn or block risky skills
- surface security state in public and runtime layers appropriately
- keep security evidence auditable
