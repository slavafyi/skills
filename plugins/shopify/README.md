# Shopify

Skills for day-to-day Shopify development with coding agents.

## Skills

- `shopify-theme-dev-preview` — serve a local theme with `shopify theme dev` and
  verify changes in Chrome via the `preview_theme_id` URL (never localhost).
  Reuses a watcher for the current theme, picks configuration from `.env.local` or
  `shopify.theme.toml`, and verifies the existing Chrome session through Chrome
  DevTools MCP configured with `--autoConnect`.
