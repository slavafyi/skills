# Review output

List findings from highest to lowest severity:

```md
1. [High] `path/to/file.ts:42` — Short finding title
   - Impact: ...
   - Fix: ...
```

Severity:

- `High`: likely bug, security issue, data loss, broken requirement, unsafe
  migration, or failed required validation.
- `Medium`: meaningful missing case, weak proof, reliability problem, or likely
  future defect.
- `Low`: non-blocking maintainability issue with a concrete cost.

After findings, briefly state validation performed and overall readiness. If no
material issue was found, say so directly:

```md
No material findings in the inspected changes.

Validation:
- Passed: `...`
- Not run: `...` because ...
```

Do not add empty severity sections or a long restatement of the diff.
