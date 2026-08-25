# nvim-config

Personal Neovim setup (Kickstart-based, TypeScript-ready). Copy this folder to a new machine and run one command.

## Install on a new PC

From this folder:

```bash
./install.sh
```

That command:

1. Installs Neovim 0.12+ and tools (`git`, `ripgrep`, `fd`, `node`)
2. Backs up any existing `~/.config/nvim`
3. Symlinks this folder to `~/.config/nvim`
4. Downloads plugins, language servers, and formatters

Then start Neovim:

```bash
nvim
```

If you clone this repo later:

```bash
git clone <your-repo-url> ~/Developer/nvim-config
~/Developer/nvim-config/install.sh
```

## After install

- Leader is **Space**
- Full map list: [KEYBINDINGS.md](./KEYBINDINGS.md)
- Inside Neovim: `<Space>sk` searches every keymap
- Language servers / formatters: `:Mason`

## What you get

- File tree (`Ctrl-b`), fuzzy find (`Ctrl-p`), live grep (`Space sg`)
- TypeScript / JS LSP, ESLint, Prettier on save
- Multi-cursor (`Space a`, `Ctrl-n`)
- Git hunks, statusline, buffer tabs, autocomplete
