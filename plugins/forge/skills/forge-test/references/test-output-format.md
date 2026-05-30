# Test output format

Use this format when the main skill output needs more detail. Omit sections that are not relevant to the task.

```md
Test target:
- Behavior:
- Risk:
- Source: user report / spec / plan / review / failing validation / observed code gap

Existing conventions:
- Runner:
- Test locations:
- Naming style:
- Existing related tests:
- CI tier:

Strategy:
- Mode:
- Layer:
- Seam:
- Dependency fidelity:
- TDD used: yes/no, because ...
- Testcontainers used: yes/no, because ...
- Contract testing used: yes/no, because ...
- Property-based testing used: yes/no, because ...
- Specialized testing used: yes/no, because ...

Tests added or changed:
- `path/to/test`: covers ...

Expected failure before fix:
- Observed: yes/no/not applicable
- Command: `...`
- Failure signal:

Validation:
- Passed:
- Failed:
- Not run:

Coverage of intent:
- Acceptance criteria covered:
- Bug/regression protected:
- Edge cases covered:
- Contract/schema compatibility covered:
- Still missing:

CI and budget:
- Suggested tier:
- Runtime/cost concern:
- Coverage/mutation evidence:

Follow-up routes:
- `forge-spec`: ...
- `forge-plan`: ...
- `forge-build`: ...
- `forge-fix`: ...
- `forge-review`: ...
```
