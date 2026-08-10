# Rōnin workflow

## Preflight

Run the preflight before editing so an unavailable identity cannot leave a
half-finished task.

1. Inspect `git status --short`, remotes, the current branch, repository
   instructions, and relevant existing pull requests.
2. Require `git`, `gh`, `ssh`, and `ssh-keygen`.
3. Save the current GitHub account when one is active:

   ```bash
   original_gh_user=$(gh api user --jq .login 2>/dev/null || true)
   ```

4. Select and verify the GitHub account:

   ```bash
   gh auth switch --hostname github.com --user ronind
   test "$(gh api user --jq .login)" = ronind
   ```

5. Verify the key exists and is valid without printing key material:

   ```bash
   test -r "$HOME/.ssh/id_ed25519_ronin"
   ssh-keygen -lf "$HOME/.ssh/id_ed25519_ronin" >/dev/null
   ```

6. Authenticate with only that key:

   ```bash
   ssh -T -F /dev/null -o BatchMode=yes -o IdentitiesOnly=yes \
     -i "$HOME/.ssh/id_ed25519_ronin" git@github.com
   ```

   GitHub normally exits non-zero because it provides no shell. Treat the check
   as successful only when the response explicitly greets `ronind`.

7. Resolve the upstream repository and check Rōnin's permission:

   ```bash
   upstream_repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
   gh api "repos/$upstream_repo" --jq '.private, .permissions.push'
   ```

   When direct push is unavailable and the repository is public, reuse or
   create a fork under `ronind` before editing:

   ```bash
   gh repo fork "$upstream_repo" --clone=false
   ```

   Verify that `ronind` can push to the fork. Add a dedicated local remote for
   it instead of replacing the upstream remote. If the repository is private
   or a usable fork cannot be created, stop.

On failure, restore `original_gh_user` when it is non-empty and different, then
stop. Name the failed check and offer setup. Do not fall back to another GitHub
account, unsigned commits, or another SSH key.

A setup offer should be concise: state whether the missing component is the
`gh` login, SSH key, GitHub authentication, or signing identity; offer to set it
up as a separate operation; and explain that login or key registration may
require user interaction. Never request a token, password, private key, or
other secret in chat.

## Decide the delivery boundary

For an implementation task under Rōnin, default to the complete delivery path
when a GitHub remote exists:

1. reuse or create a task branch;
2. edit and validate the requested change;
3. create signed commits;
4. push with the Rōnin key;
5. reuse or create a pull request.

Do less when the user explicitly limits the task. Do not create a second branch
or pull request when a suitable one already exists. If the request is only an
explanation, do not infer repository changes from a bare mention of Ronin.

## Commit

Stage only intended files. Use command-scoped identity and signing settings;
do not write them to global or repository Git config:

```bash
git \
  -c user.name='Rōnin' \
  -c user.email='292589785+ronind@users.noreply.github.com' \
  -c gpg.format=ssh \
  -c user.signingkey="$HOME/.ssh/id_ed25519_ronin" \
  -c commit.gpgsign=true \
  commit -S -m '<message>'
```

Before push, inspect the commit author, committer, changed files, and signature.
Use `git verify-commit` when an allowed-signers configuration is available. A
missing local allowed-signers file does not replace remote verification.

## Push and pull request

Force the intended SSH identity without reading the user's SSH configuration.
Push to the upstream remote when `ronind` has direct access; otherwise push to
its verified fork remote:

```bash
GIT_SSH_COMMAND="ssh -F /dev/null -o IdentitiesOnly=yes \
  -i $HOME/.ssh/id_ed25519_ronin" \
  git push --set-upstream '<delivery-remote>' '<branch>'
```

Use `gh` for GitHub operations. For fork delivery, create the pull request
against `upstream_repo` with a `ronind:<branch>` head. Create pull-request
bodies through `--body-file` and follow repository templates and reviewer
conventions. Never expose secrets or include unrelated local changes.

After push, query the commit in the repository that received it and require
both:

- `.author.login == "ronind"`;
- `.commit.verification.verified == true`.

If either check fails, report it and do not claim successful Rōnin delivery.
Do not rewrite already-pushed history without explicit approval.

## Restore account

After the workflow, restore `original_gh_user` when it was non-empty and differs
from `ronind`:

```bash
gh auth switch --hostname github.com --user "$original_gh_user"
```

Restoring the CLI account does not change the author or signature of completed
Rōnin operations.
