# Keybindings

Leader is **Space**. Search every mapping inside Neovim with `<Space>sk`.

Modes: **n** normal · **i** insert · **v** visual · **x** visual (char/line) · **t** terminal · **o** operator-pending

## Files, save, buffers

| Keys | Mode | Action |
| --- | --- | --- |
| `<C-s>` | n i v | Save file |
| `<Space>w` | n | Save file |
| `<Space>n` | n | New file (prompts for path) |
| `<Space>N` | n | New folder (prompts for path) |
| `]b` / `[b` | n | Next / previous buffer |
| `Shift-l` / `Shift-h` | n | Next / previous buffer |
| `<Space>bd` | n | Close current buffer |
| `<Space>bo` | n | Close other buffers |
| `<Space>1` … `<Space>9` | n | Jump to buffer 1–9 |
| `<Space><Space>` | n | Find open buffers |

## File explorer (neo-tree)

| Keys | Mode | Action |
| --- | --- | --- |
| `<C-b>` | n | Show / hide file tree |
| `<Space>e` | n | Focus tree, or jump back to the editor |
| `\` / `<Space>o` | n | Reveal current file in the tree |

Inside the tree:

| Keys | Action |
| --- | --- |
| `l` / Enter | Open |
| `h` | Collapse folder |
| `a` / `n` | New file |
| `A` / `N` | New folder |
| `d` | Delete |
| `r` | Rename |
| `y` / `x` / `p` | Copy / cut / paste |
| `c` / `m` | Copy / move |
| `H` | Toggle hidden files |
| `R` | Refresh |
| `q` / `\` | Close tree |
| Backspace | Go up a directory |
| `.` | Set folder as root |
| `P` | Preview |

## Search (Telescope)

| Keys | Mode | Action |
| --- | --- | --- |
| `<C-p>` / `<Space>sf` | n | Find files |
| `<Space>sg` | n | Live grep (search text) |
| `<Space>sw` | n v | Search word under cursor |
| `<Space>/` | n | Fuzzy search in current file |
| `<Space>s/` | n | Grep in open files |
| `<Space>s.` | n | Recent files |
| `<Space>sd` | n | Diagnostics |
| `<Space>sc` | n | Commands |
| `<Space>sh` | n | Help |
| `<Space>sk` | n | Keymaps |
| `<Space>ss` | n | Telescope pickers |
| `<Space>sr` | n | Resume last search |
| `<Space>sn` | n | Search Neovim config files |

In Telescope prompts: `<C-j>` / `<C-k>` move the selection.

## LSP / TypeScript / Go

| Keys | Mode | Action |
| --- | --- | --- |
| `gd` / `grd` | n | Go to definition |
| `gD` / `grD` | n | Go to declaration |
| `grr` | n | References |
| `gri` | n | Implementation |
| `grt` | n | Type definition |
| `K` | n | Hover docs |
| `grn` / `<Space>rn` | n | Rename |
| `gra` / `<Space>ca` | n x | Code action |
| `<Space>oi` | n | Organize imports (TypeScript / Go) |
| `<Space>f` | n v | Format buffer |
| `<Space>q` | n | Diagnostics quickfix list |
| `[d` / `]d` | n | Previous / next diagnostic (built-in) |
| `gO` | n | Document symbols |
| `gW` | n | Workspace symbols |
| `<Space>th` | n | Toggle inlay hints |
| Ctrl-click / Cmd-click | n | Go to definition |
| Mouse back / forward | n | Jump back / forward |

## Go

| Keys | Mode | Action |
| --- | --- | --- |
| `<Space>ga` | n | Switch between `foo.go` and `foo_test.go` |
| `<Space>gt` | n | `go test` the current package |
| `<Space>gT` | n | `go test` the nearest Test/Benchmark |
| `<Space>gr` | n | `go run` the current package |

## Windows and terminal

| Keys | Mode | Action |
| --- | --- | --- |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | n | Move between splits |
| Esc | n | Clear search highlight |
| Esc Esc | t | Leave terminal mode |

## Multi-cursor (VS Code style)

| Keys | Mode | Action |
| --- | --- | --- |
| `<Space>a` | n x | Cursor on every match of the word |
| `<C-n>` | n x | Add next same word (like Ctrl/Cmd+D) |
| `<C-S-n>` | n x | Add previous same word |
| Esc | n | Clear extra cursors (while they are active) |
| Left / Right | n x | Cycle extra cursors |

## Shift-select

| Keys | Mode | Action |
| --- | --- | --- |
| Shift-← ↑ ↓ → | n | Start character selection |
| Shift-← ↑ ↓ → | v | Extend selection |

## Git (gitsigns)

| Keys | Mode | Action |
| --- | --- | --- |
| `]c` / `[c` | n | Next / previous hunk |
| `<Space>hs` | n v | Stage hunk |
| `<Space>hr` | n v | Reset hunk |
| `<Space>hS` | n | Stage buffer |
| `<Space>hR` | n | Reset buffer |
| `<Space>hp` | n | Preview hunk |
| `<Space>hi` | n | Preview hunk inline |
| `<Space>hb` | n | Blame line |
| `<Space>hd` | n | Diff against index |
| `<Space>hD` | n | Diff against last commit |
| `<Space>hq` / `<Space>hQ` | n | Hunks in quickfix (file / repo) |
| `<Space>tb` | n | Toggle line blame |
| `<Space>tw` | n | Toggle word diff |
| `ih` | o x | Select hunk as a text object |

## Editing extras

| Keys | Action |
| --- | --- |
| `gc` / `gcc` | Comment (visual / current line) |
| `sa` / `sd` / `sr` | Surround add / delete / replace (mini.surround) |
| Tab | Accept autocomplete (blink.cmp super-tab) |
