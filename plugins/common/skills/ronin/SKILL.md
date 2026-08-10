---
name: ronin
description: >
  Use the separate Rōnin GitHub identity when a coding task asks for changes
  not to be made under the user's personal identity, or asks to use an agent,
  assistant, bot, or Rōnin. Also trigger for Ronin, Ron, Rona, ronin, or
  ronind. Treat this as likely intent for signed commits, push,
  and a pull request, while honoring
  explicit limits such as "do not commit". Verify the identity is configured
  before editing; if it is unavailable, stop and offer setup.
---

# ronin

Use the separate `ronind` identity for repository delivery without attributing
work to the user's personal GitHub account.

## Required preflight

Run this before editing files whenever the skill activates:

1. Inspect repository instructions, status, remotes, current branch, and any
   existing task branch or pull request.
2. Verify that `gh`, `git`, `ssh`, and `ssh-keygen` are available.
3. Record the currently active GitHub account so it can be restored later.
4. Verify that `ronind` exists in `gh auth`, switch to it, and confirm
   `gh api user --jq .login` returns `ronind`.
5. Verify that `$HOME/.ssh/id_ed25519_ronin` exists, is readable, is a valid
   SSH key, and can authenticate to GitHub as `ronind` without another
   identity.
6. Verify that `ronind` can push to the destination repository. If direct push
   is unavailable for a public repository, verify or create a `ronind` fork
   before editing and use it for delivery.

If any check fails, stop before editing or performing Git operations. Report
exactly what is missing and offer to configure Rōnin separately. Do not create
keys, log in, upload keys, or change account settings without explicit approval.
Restore the original active GitHub account after a failed preflight.

## Infer delivery scope

- For an implementation task requested under Rōnin, assume the user likely
  expects a task branch, signed commits, push, and a pull request.
- Reuse an appropriate existing branch or pull request instead of creating a
  duplicate.
- Explicit limits always win. For example, "edit only", "do not commit", or
  "do not open a PR" removes those delivery steps without disabling Rōnin for
  the remaining permitted steps.
- Do not run a repository delivery workflow for explanation-only or unrelated
  uses of the word Ronin.
- If the inferred workflow is impossible because there is no suitable GitHub
  remote, direct access, or viable fork, stop at that boundary and report it
  rather than silently using the user's identity.

## Identity rules

Use these values only for the operations in this task:

- GitHub account: `ronind`
- Git name: `Rōnin`
- Git email: `292589785+ronind@users.noreply.github.com`
- SSH signing and push key: `$HOME/.ssh/id_ed25519_ronin`

Never change global Git identity. Never expose tokens, private-key material, or
secrets. Never rewrite existing commits merely to change their author unless
the user explicitly requests it.

Follow `references/workflow.md` for command-scoped commit, push, pull-request,
verification, restoration, and setup-offer procedures.
