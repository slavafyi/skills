---
name: shopify-theme-dev-preview
description: >
  Use this skill when asked to start, open, reuse, or browser-verify a local Shopify
  theme preview with `shopify theme dev`, including checking the current Chrome tab
  after theme file changes. It reuses the watcher for the current theme, starts one
  only when needed, resolves Shopify CLI store or environment configuration, and
  verifies the remote `preview_theme_id` storefront through Chrome DevTools MCP
  attached to the existing Chrome session. Do not use for theme push, publish,
  production deploys, app or Hydrogen previews, or Liquid edits that do not require a
  running browser preview.
---

# Shopify theme development preview

Serve the current Shopify theme and verify the rendered storefront in Chrome.

## Non-negotiables

1. Never verify through `http://127.0.0.1:9292` or another localhost URL. Use
   `https://<store>.myshopify.com/?preview_theme_id=<theme-id>`.
2. Reuse a `shopify theme dev` watcher whose working directory is this theme. Do not
   restart it just to pick up file changes; it already syncs them.
3. Never stop a watcher for another directory without explicit user approval.
4. Never print credentials or read an entire secret file into output. Refer to
   environment variables and TOML environment names, not secret values.
5. Never run `theme push`, `theme publish`, or add `--allow-live` in this workflow.
6. Use Chrome DevTools MCP connected to the user's existing Chrome with
   `--autoConnect`. Do not use a generic browser tool or launch a separate browser
   profile.

## Workflow

### 1. Confirm the theme and inspect watchers

Confirm the working directory has a Shopify theme structure, including
`layout/theme.liquid`. Then inspect both the CLI process and its default port:

```bash
pgrep -fl 'shopify.*theme dev'
lsof -nP -iTCP:9292 -sTCP:LISTEN
```

For each candidate PID, resolve its working directory:

```bash
lsof -a -p <pid> -d cwd -Fn
```

- Same directory: reuse it and continue to step 3.
- Different directory: leave it running. If it occupies port 9292, select a verified
  free port and start this theme with `--port <port>`. Ask only if stopping the other
  watcher is actually necessary.
- No watcher for this directory: continue to step 2.

Do not treat a process name or open port alone as proof that the current theme is
served; the working directory must match.

### 2. Resolve configuration and start the watcher

Pick the command from the project files, in this order:

1. `.env.local` exists: its credentials are loaded automatically. Run:

   ```bash
   shopify theme dev
   ```

2. `shopify.theme.toml` exists: list only its environment headings:

   ```bash
   rg '^\[environments\.[^]]+\]$' shopify.theme.toml
   ```

   - `[environments.default]`: run `shopify theme dev`.
   - One non-default environment: run `shopify theme dev -e <name>`.
   - Multiple non-default environments and no requested target: ask which one to use.

3. Neither file exists: check the selected store with `shopify theme info`. If none is
   selected and the store cannot be inferred safely, ask for the store and run
   `shopify theme dev --store <store>`.

Start the command in a long-running terminal or PTY so its output remains available.
Add `--port <port>` when step 1 found another project on 9292; the browser must still
use the remote preview URL. Wait for the success output before opening the browser. Do
not start a detached process whose logs and PID cannot be recovered.

### 3. Resolve the remote preview URL

Prefer the share URL printed by `shopify theme dev`:

```text
https://<store>.myshopify.com/?preview_theme_id=<theme-id>
```

Ignore the localhost preview URL. If reusing a watcher whose output is unavailable,
run `shopify theme list --role development --json` with the same environment or store
selection. Use the development theme's store domain and ID to construct the URL. If
the result is missing or ambiguous, do not guess; report what is known and ask for the
store or environment.

### 4. Reuse or open the Chrome tab

Use Chrome DevTools MCP with `--autoConnect`; do not substitute another browser tool
or launch a separate Chrome profile.

Reuse a tab on the expected `<store>.myshopify.com` domain only after verifying:

```js
window.Shopify?.theme ?? null
```

If its theme ID does not match, navigate it to the full remote preview URL. Open a new
tab only when no store tab exists. After navigation, verify `window.Shopify.theme.id`
again. The `preview_theme_id` query parameter can disappear after Shopify records the
preview selection, so identity—not the current query string—is the final check.

If the storefront shows a password or login page, preserve the tab and ask the user to
complete access rather than requesting or exposing a password in output.

## Gotchas

- Shopify documents localhost as its hot-reload preview, but this workflow deliberately
  uses the remote share URL because localhost is unreliable for the intended browser
  verification and cannot preview checkout customizations.
- `shopify theme dev` only runs from a valid Shopify theme directory (or with a valid
  `--path`).
- A plain store URL can still show the development theme after the preview cookie is
  set. Always validate `window.Shopify.theme.id` before trusting an existing tab.
- Storefront password protection and Shopify CLI authentication are separate. Never
  pass a storefront password as `--password`; that flag is for Theme Access or Admin
  API credentials.

For current flags and configuration precedence, use Shopify's official
[`theme dev`](https://shopify.dev/docs/api/shopify-cli/theme/theme-dev) and
[theme environments](https://shopify.dev/docs/storefronts/themes/tools/cli/environments)
references.
