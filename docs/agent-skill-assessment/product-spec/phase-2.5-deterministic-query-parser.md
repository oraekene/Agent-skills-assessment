# Phase 2.5 Deterministic Query Parser

Phase 2.5 makes the retrieval layer field-by-field deterministic.

The goal is:

- convert natural-language requests into a normalized query object
- do that with fixed rules, not ad hoc interpretation
- make every parsed field explainable
- make ranking behavior reproducible

## Phase 2.5 Deliverables

- deterministic query-type classifier
- deterministic field extraction rules
- deterministic ranking formulas
- machine-readable parsed-query ledger
- worked parse examples

## Primary Rule

The parser must always try to classify into an existing structured query shape before using inference.

The order is:

1. detect explicit comparison requests
2. detect explicit source-filter requests
3. detect explicit tag-filter requests
4. detect explicit domain-browse requests
5. otherwise classify as `task-match`

## Query Type Rules

Use the first matching rule.

### `direct-compare`

Assign `query_type=direct-compare` if the query contains one or more of:

- `compare`
- `versus`
- `vs`
- `between`

and either:

- two or more explicit unit names
- two or more explicit source names
- a plural comparison target such as `best tdd skills`

### `source-browse`

Assign `query_type=source-browse` if the query contains one or more of:

- `show only`
- `from`
- `by`
- `source`

and at least one recognized source tag or source name.

### `tag-browse`

Assign `query_type=tag-browse` if the query contains one or more of:

- `show only`
- `only`
- `filter`

and at least one recognized non-source tag, with no stronger `source-browse` match.

### `domain-browse`

Assign `query_type=domain-browse` if the query contains one or more of:

- `best`
- `top`
- `show`
- `find`

and contains a recognized canonical domain phrase, with no stronger rule above.

### `task-match`

Assign `query_type=task-match` when none of the above rules match or when the query contains a specific task objective such as:

- `for writing`
- `for auditing`
- `for improving`
- `for generating`
- `I want`
- `help me`

## Field Extraction Rules

Each field must be extracted using the following precedence:

1. explicit exact phrase
2. explicit alias phrase
3. deterministic lexical inference
4. `unassigned`

If a field cannot be extracted by these rules, leave it empty. Do not guess.

## Field Rules

### `query_text`

- store the raw user request unchanged

### `target_domains`

- assign a domain if the query contains:
  - a canonical domain label from the V2.1 registry
  - a registry alias for that domain
  - a deterministic task-phrase mapping for that domain
- if multiple domains match:
  - keep all matches
  - sort by match strength: exact label > alias > task-phrase mapping

### `target_modes`

- assign a mode if the query contains:
  - a canonical function mode label
  - a registry alias
  - a deterministic verb mapping
- if no mode match exists, leave empty

### `required_tags`

- assign when the query contains hard constraints such as:
  - `only`
  - `must`
  - `require`
  - `needs to`

### `preferred_tags`

- assign when the query contains soft-preference language such as:
  - `prefer`
  - `ideally`
  - `better if`

### `excluded_tags`

- assign when the query contains:
  - `not`
  - `exclude`
  - `without`
  - `except`

### `runtime_constraints`

- assign `codex-desktop` if the query contains:
  - `codex`
  - `codex desktop`
  - `desktop app`
- assign other runtime tags only from recognized registry-backed runtime aliases

### `source_constraints`

- assign only when a source name or source tag is explicitly present
- do not infer source preferences from domain or mode

### `minimum_score_band`

- assign only if the query contains an explicit quality threshold such as:
  - `top layer`
  - `second layer or above`
  - `80+`
  - `at least third layer`

## Deterministic Mapping Rule

Every inferred domain, mode, or tag must record its basis as one of:

- `exact-label`
- `alias-label`
- `task-phrase-map`
- `explicit-source`
- `explicit-runtime`

If none apply, the field must remain empty.

## Candidate Filtering Order

Filter in this exact order:

1. installability
2. source constraints
3. runtime constraints
4. required tags
5. excluded tags
6. target domain compatibility
7. target mode compatibility
8. minimum score band

If a step removes all candidates:

- stop filtering
- return `no-match`
- include the failing filter step in the explanation

## Ranking Formulas

Use one of two formulas.

### Broad Query Formula

Use for:

- `domain-browse`
- `source-browse`
- `tag-browse`

Score:

`0.45 * static_structural + 0.25 * codex_fit + 0.10 * benchmark_readiness + 0.15 * domain_match + 0.05 * mode_match - unknown_share_penalty`

### Specific Query Formula

Use for:

- `task-match`
- `direct-compare`

Score:

`0.30 * static_structural + 0.20 * codex_fit + 0.10 * benchmark_readiness + 0.20 * domain_match + 0.10 * mode_match + 0.10 * task_tag_fit - unknown_share_penalty`

## Component Scales

All component values must use:

- `0`
- `25`
- `50`
- `75`
- `100`

### `domain_match`

- `100` = primary domain match
- `75` = hybrid includes target domain
- `50` = secondary domain only
- `25` = adjacent but not assigned domain
- `0` = no compatible domain

### `mode_match`

- `100` = primary mode match
- `75` = secondary supported mode
- `25` = weak verb similarity only
- `0` = no compatible mode

### `task_tag_fit`

- `100` = all required task tags match
- `75` = most task tags match
- `50` = at least one task tag match
- `0` = no task tag match

### `unknown_share_penalty`

- `0` when unknown share is `<= 0.10`
- `5` when unknown share is `> 0.10 and <= 0.20`
- `10` when unknown share is `> 0.20 and <= 0.35`
- `15` when unknown share is `> 0.35`

## Tie-Break Order

1. higher total ranking score
2. lower unknown share
3. higher `static-structural`
4. higher `codex-fit`
5. higher `benchmark-readiness`
6. lexical ascending `unit_id`

## Parsed Query Ledger Rule

Every parsed query record must contain:

- raw query
- normalized query
- field basis for every non-empty field
- selected ranking formula
- final candidate set
- final ranked set

## Phase 2.5 Success Condition

The system can take a user request such as:

- `best design and UX skills for Codex Desktop`
- `show only taste-skill units`
- `find the best skill for founder-voice launch emails in Codex`

and produce the same structured query object and ranking result every time.
