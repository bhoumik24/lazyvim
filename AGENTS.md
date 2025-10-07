# Repository Guidelines

## Project Structure & Module Organization
`init.lua` bootstraps LazyVim and is the entrypoint for the entire configuration. Core runtime settings live under `lua/config`, split into focused modules (`options.lua`, `keymaps.lua`, `autocmds.lua`, `lazy.lua`) so changes stay isolated. Plugin specifications reside in `lua/plugins`; keep related plugins together inside a single file to preserve coherent load order. Task templates for project automation live in `lua/overseer/template/user`, while the `after` directory holds post-plugin tweaks that depend on upstream definitions. The lockfile `lazy-lock.json` pins plugin versions—update it whenever you bump specs.

## Build, Test, and Development Commands
Use `nvim --headless "+Lazy sync" +qa` after altering plugin specs to install or prune dependencies. Run `nvim --headless "+Lazy check" +qa` to confirm plugin specs still resolve. Format code with `stylua lua --config-path stylua.toml` before submitting changes. During local editing, `:Lazy` and `:Mason` give quick health overviews, and `:OverseerRun` exposes the curated build tasks (e.g., `cpp_build`).

## Coding Style & Naming Conventions
Lua files follow `stylua.toml`: spaces for indentation, width 2, max column 120. Prefer descriptive module names (`clang_lsp.lua`, `file_explorer.lua`) and keep new plugin specs snake_case to match the existing naming scheme. Group helper functions at the top of each file and export them via `return` tables for clarity.

## Testing Guidelines
There is no automated test harness, so rely on headless sanity checks. Run `nvim --headless "+checkhealth" +qa` to surface runtime issues, then open Neovim normally to validate interactive flows (keymaps, commands, Overseer tasks). When touching language tooling, launch a scratch buffer for that language and trigger LSP features (`:LspInfo`, formatting, diagnostics) to ensure adapters load correctly.

## Commit & Pull Request Guidelines
Recent history favors short, imperative summaries (`Lazy loading plugins`, `fixed diagnostic messages`). Follow that tone, keep the first line under 72 characters, and add body details only when explaining rationale or follow-up actions. Pull requests should list impacted areas, note any required manual steps (e.g., run `Lazy sync`), and link tracking issues. Include before/after screenshots when UI-facing tweaks are made so reviewers can assess visual impact quickly.

## Security & Configuration Tips
Do not commit personal API keys; prefer environment variables or local `*.env` files ignored by Git. Before merging, confirm `lazy-lock.json` changes are intentional and correspond to plugin updates. If you experiment with machine-specific settings, wrap them in `if vim.fn.has(...)` guards so other platforms remain unaffected.
