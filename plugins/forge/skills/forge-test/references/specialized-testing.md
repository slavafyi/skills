# Specialized testing

Use specialized testing when the project surface needs evidence that ordinary unit/integration tests do not provide. Keep this reference optional; do not add specialized tools unless the project already uses them or the risk justifies it.

## Frontend and UI

Consider:

- component tests for component behavior through user-facing interactions;
- browser E2E tests for critical flows;
- visual regression for stable layout or design-system contracts;
- accessibility tests for keyboard, ARIA, contrast, labels, focus management, and common WCAG checks;
- cross-browser/device checks when the bug depends on runtime differences.

Avoid visual snapshots that capture broad unstable pages, timestamps, random data, animations, remote images, or user-generated content without masking/stabilization.

## Snapshot and golden testing

Use snapshots or golden files when they protect a stable external contract or large structured output.

Prefer:

- small, focused snapshots;
- inline or colocated snapshots when the ecosystem supports them and they improve reviewability;
- stable serialization;
- named fixtures;
- clear explanation when snapshots change.

Avoid:

- broad snapshots of implementation details;
- snapshots as a substitute for assertions;
- regenerating snapshots without explaining the behavior change;
- noisy visual snapshots without deterministic fonts, viewport, data, animations, and environment.

## API schema compatibility

For OpenAPI, GraphQL, gRPC, protobuf, JSON Schema, Avro, or event schemas, consider:

- schema validation for requests/responses/events;
- backward-compatibility checks;
- generated client/server compatibility tests;
- consumer-driven contracts;
- schema-driven fuzz/property tests when supported;
- examples that lock important error and edge-case semantics.

Schema compatibility does not replace behavior tests when business semantics matter.

## LLM, prompt, and agent behavior

For LLM or agentic code, ordinary deterministic assertions may be insufficient. Consider:

- eval datasets with representative and adversarial cases;
- golden conversations or scenario traces;
- prompt/model regression tests;
- tool-call correctness checks;
- structured-output validation;
- safety/refusal/policy scenarios when relevant;
- cost and latency budgets;
- non-determinism controls such as fixed model versions, seeds when supported, stable fixtures, and tolerance bands.

Do not assert exact natural-language output unless exact text is the product contract. Prefer structured outputs, rubrics, classifiers, or property-like expectations when possible.

## Security tests

For security-sensitive changes, consider:

- authorization and access-control matrix tests;
- injection, escaping, path traversal, SSRF, deserialization, template, and command execution cases;
- secrets handling;
- dependency and supply-chain checks;
- negative-path tests for blocked behavior.

Route to `forge-review` or a security-specific workflow when the change affects auth, payments, personal data, secrets, or infrastructure boundaries.
