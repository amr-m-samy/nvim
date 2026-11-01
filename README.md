# Amr's Neovim config

NvChad v2.5 setup for Python, Odoo, web development and C/C++, tested on Neovim 0.11 and 0.12.

## Install

```bash
git clone https://github.com/amr-m-samy/nvim ~/.config/nvim
nvim                # plugins install on first start
:MasonInstallAll    # language servers, formatters, debugpy
```

System tools:

| Tool | Why | Install (AlmaLinux / Fedora) |
| --- | --- | --- |
| `fd` | Virtualenv picker (`<leader>pv`) | `sudo dnf install fd-find` |
| `ripgrep` | Telescope live grep | `sudo dnf install ripgrep` |
| `make` | CopilotChat tokenizer build | `sudo dnf install make` |
| Node.js | Copilot, pyright, prettier | `sudo dnf install nodejs` |
| Claude Code | `<leader>a…` keys | `npm install -g @anthropic-ai/claude-code`, then run `claude` once to sign in |

For Odoo XML formatting with prettier, run `npm install --save-dev @prettier/plugin-xml` in the project.
Without it, XML is formatted by the lemminx language server.

## Python and Odoo

- **pyright** gives completion, types and go-to-definition. Odoo source and addons are added
  automatically from `/opt/odoo19`, `/opt/odoo18` and `~/.local/share/Odoo/addons/*` when those folders exist.
- **Ruff** formats (black-compatible, 79 columns), sorts imports and lints. It replaces black, isort and flake8.
- Format on save is on. Turn it off with `:FormatToggle` (all buffers) or `:FormatToggle!` (this buffer),
  for example before saving files in Odoo core.
- Debugging uses debugpy. `F5` shows the launch list, including **Launch Odoo (choose config)**, which asks
  for the `.conf` file and uses the project's `venv` / `.venv`.

## Key mappings

Leader is `Space`. NvChad's defaults still apply (`<leader>ch` shows them all).

| Keys | Action |
| --- | --- |
| `jj` | Leave insert mode |
| `<leader>fg` | Live grep with arguments |
| `<leader>fm` | Format file |
| `<leader>tf` | Toggle format on save |
| `<leader>pv` | Select Python virtualenv |
| `<leader>ta` / `<C-g>` (insert) | Toggle Arabic mode |
| `<leader>wm` | Start multi-cursor |
| `<M-.>` / `<M-,>` | Next / previous tab |
| `J` / `K` (visual) | Move selected lines down / up |
| **Debugger** | |
| `F5` / `F3` / `F4` | Continue / stop / restart |
| `F6` / `F7` / `F8` | Step into / over / out |
| `<leader>db` / `<leader>dB` | Breakpoint / conditional breakpoint |
| `<leader>du` | Toggle debugger UI |
| `<leader>dm` / `<leader>dc` | Debug test method / class |
| `<leader>ds` (visual) | Debug selection |
| **Copilot** (insert mode) | |
| `<C-l>` / `<M-w>` / `<M-l>` | Accept suggestion / word / line |
| `<M-]>` / `<M-[>` / `<C-]>` | Next / previous / dismiss |
| `F2` | Copilot panel |
| `<leader>cc` `ce` `cf` `co` `ct` `cs` | Copilot Chat: open, explain, fix, optimize, tests, stop |
| **Claude Code** | |
| `<leader>ac` / `<leader>af` | Toggle / focus Claude |
| `<leader>ar` / `<leader>aC` | Resume / continue a session |
| `<leader>ab` | Add current file to Claude's context |
| `<leader>as` | Send selection (visual) or file from tree |
| `<leader>aa` / `<leader>ad` | Accept / reject Claude's proposed diff |
