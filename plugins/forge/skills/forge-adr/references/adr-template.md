# ADR template

Use this template for `docs/adr/<number>-<slug>.md`.

```md
# ADR-NNNN: <title>

Date: YYYY-MM-DD
Status: proposed | accepted | superseded | deprecated

## Context

<What problem or pressure caused this decision?>

## Decision

<The chosen direction. Be concrete.>

## Alternatives considered

### <Alternative A>

- Pros:
- Cons:

### <Alternative B>

- Pros:
- Cons:

## Consequences

### Positive

- ...

### Negative

- ...

### Neutral / operational

- ...

## How to apply this

- ...

## Revisit when

- ...

## Links

- Spec: `docs/specs/...`
- Plan: `docs/plans/...`
- Status: `docs/status.md`
```

## Numbering

Use the next numeric prefix found in `docs/adr/`.

Examples:

```text
0001-use-postgres.md
0002-keep-server-state-in-query-cache.md
0003-supersede-auth-token-storage.md
```

If existing ADRs are unnumbered, preserve the local convention unless the user asks to normalize it.
