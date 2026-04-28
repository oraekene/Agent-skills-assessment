# Runtime Skill Discovery Results

This subsystem is now defined as a sibling to Phase 2 retrieval.

## Files

- `runtime-skill-discovery-and-progressive-loading.md`
  - full runtime subsystem for discovery, gating, loading, and persistence
- `runtime-skill-index.schema.json`
  - machine-readable shape for visible runtime skill indexes
- `runtime-skill-api.schema.json`
  - machine-readable shape for discovery and management APIs

## What Changed

The product no longer treats Phase 2 as the whole discovery architecture.

It now has two distinct discovery surfaces:

- `directory retrieval and ranking`
  - what should rank highest
  - what should be installed
  - what best matches a requested task
- `runtime skill discovery and progressive loading`
  - what is visible right now
  - what is eligible right now
  - what enters context right now
  - what gets loaded only on demand

## Major Additions

The new runtime subsystem adds:

- cwd-to-repo-root scanning
- nested local skill discovery
- symlink-safe scanning
- deterministic precedence
- deterministic eligibility gating
- hard initial skill-index budgeting
- progressive loading by level
- file-backed dynamic context discovery
- compaction-aware reattachment
- explicit runtime APIs
- external read-only skill roots
- secure deferred setup for secrets
- plugin and hub-aware provenance

## Practical Outcome

The architecture is now much closer to the actual runtime behavior patterns used by leading coding agents.

Phase 2 remains the right subsystem for:

- comparison
- ranking
- shortlist generation

The new runtime subsystem becomes the right subsystem for:

- activation
- context efficiency
- tool/runtime gating
- session-safe loading
