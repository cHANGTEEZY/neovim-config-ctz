<p align="center">
  <img src="./assets/neovim-mark.png" alt="Neovim" width="140" />
</p>

<p align="center">
  My daily driver Kickstart-based, TypeScript-ready, and a little VS Code muscle memory on purpose.
</p>

<p align="center">
  <a href="https://neovim.io"><img src="https://img.shields.io/badge/Neovim-0.12+-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim 0.12+" /></a>
  <a href="https://www.lua.org"><img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" alt="Lua" /></a>
  <a href="https://www.typescriptlang.org"><img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript" /></a>
  <a href="./LICENSE.md"><img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="MIT License" /></a>
</p>

<p align="center">
  <img src="https://skillicons.dev/icons?i=neovim,lua,ts,js,react,nodejs,html,css,git,apple,linux,bash,vscode" alt="Neovim, Lua, TypeScript, JavaScript, React, Node.js, HTML, CSS, Git, macOS, Linux, Bash, VS Code" />
</p>

---

Hey, I'm **Sushank** ([cHANGTEEZY](https://github.com/cHANGTEEZY)). This is the Neovim config I actually use — forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), then bent toward TypeScript / React work without giving up the keys I already had in my fingers.

Copy the folder to a new machine, run one script, and you're in.

## Why this exists

I wanted a setup that feels like a real editor on day one: file tree, fuzzy find, LSP, format on save, multi-cursor. Kickstart gave me a config I can still read top to bottom. I added the TypeScript bits, VS Code-ish bindings (`Ctrl-p`, `Ctrl-b`, `Ctrl-s`, `Ctrl-n`), and a one-shot installer so a fresh Mac or Linux box is ready in minutes.

**Tokyonight Night**, JetBrains Mono Nerd Font, Neovim **0.12+** (`vim.pack` for plugins).

## What you get

|                |                                                                                                                       |
| -------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Explorer**   | File tree with `Ctrl-b` ([neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim))                                  |
| **Search**     | Fuzzy files with `Ctrl-p`, live grep with `<Space>sg` ([Telescope](https://github.com/nvim-telescope/telescope.nvim)) |
| **TypeScript** | `ts_ls` + ESLint LSP, Prettier on save, JSX auto-close tags                                                           |
| **Editing**    | Multi-cursor (`<Space>a`, `Ctrl-n`), Shift+arrows to select, autopairs                                                |
| **Git**        | Hunks in the gutter, statusline, buffer tabs                                                                          |
| **Complete**   | blink.cmp + LuaSnip, which-key when you hesitate                                                                      |

Language servers and formatters land through [Mason](https://github.com/mason-org/mason.nvim): TypeScript, ESLint, JSON, HTML, CSS, Lua, Prettier.

## Install on a new PC

From this folder:

```bash
./install.sh
```

That command:

1. Installs Neovim **0.12+** and tools (`git`, `ripgrep`, `fd`, `node`)
2. Backs up any existing `~/.config/nvim`
3. Symlinks this folder to `~/.config/nvim`
4. Downloads plugins, language servers, and formatters

Then start Neovim:

```bash
nvim
```

If you clone the repo:

```bash
git clone https://github.com/cHANGTEEZY/neovim-config-ctz.git ~/Developer/nvim-config
~/Developer/nvim-config/install.sh
```

Works on **macOS** (Homebrew) and **Linux** (apt, dnf, or pacman).

## After install

- Leader is **Space**
- Full map list: [KEYBINDINGS.md](./KEYBINDINGS.md)
- Inside Neovim: `<Space>sk` searches every keymap
- Language servers / formatters: `:Mason`

### Everyday keys

| Keys                  | What it does                    |
| --------------------- | ------------------------------- |
| `Ctrl-s`              | Save                            |
| `Ctrl-p`              | Find files                      |
| `Ctrl-b`              | Toggle file tree                |
| `<Space>sg`           | Search text in the project      |
| `gd`                  | Go to definition                |
| `<Space>a` / `Ctrl-n` | Multi-cursor (all / next match) |

## License

This config is released under the [MIT License](./LICENSE.md). Kickstart.nvim is MIT as well — thanks to the Kickstart authors for the starting point.
