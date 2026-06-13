# Keyboard Cheatsheet

## Neovim

> **Leader key: `Space`**

### Modes
| Key | Mode |
|-----|------|
| `i` | Insert mode |
| `Esc` | Normal mode |
| `v` | Visual mode |
| `V` | Visual line mode |
| `:` | Command mode |

### Navigation
| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Next word |
| `b` | Previous word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | First line |
| `G` | Last line |
| `Space+Up` | Go to first line (custom) |
| `Space+Down` | Go to last line (custom) |
| `Ctrl+d` | Page down |
| `Ctrl+u` | Page up |
| `{` | Previous paragraph |
| `}` | Next paragraph |

### Edit
| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | New line below |
| `O` | New line above |
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste below |
| `P` | Paste above |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last change |
| `cw` | Change word |
| `ciw` | Change inner word |
| `caw` | Change around word |
| `s` | Delete char & insert |
| `S` | Delete line & insert |
| `r` | Replace one character |
| `R` | Replace mode |

### Visual Mode
| Key | Action |
|-----|--------|
| `d` | Delete selection |
| `y` | Copy selection |
| `p` | Paste |
| `>` | Indent |
| `<` | De-indent |
| `Tab` | Indent selection (custom) |
| `Shift+Tab` | Unindent selection (custom) |
| `~` | Toggle case |
| `u` | Lowercase |
| `U` | Uppercase |

### Navigation (Insert Mode, Custom)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Left` | Insert | Go to beginning of line |
| `Ctrl+Right` | Insert | Go to end of line |

### Clipboard (Custom)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+c` | Normal, Visual | Copy to clipboard |
| `Ctrl+v` | Normal | Paste from clipboard |
| `Ctrl+v` | Insert | Paste from clipboard (safe paste mode) |
| `Ctrl+v` | Command | Paste from clipboard |

### History (Custom)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+z` | Normal | Undo |
| `Ctrl+z` | Insert | Undo and resume insert |
| `Ctrl+y` | Normal | Redo |
| `Ctrl+y` | Insert | Redo and resume insert |

### Selection (Custom)
| Key | Action |
|-----|--------|
| `Ctrl+a` | Select all |

### Save & Quit (Custom)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+q` | Normal | Quit |
| `:w` | Command | Save |
| `:q` | Command | Quit |
| `:wq` | Command | Save & quit |
| `:q!` | Command | Force quit (discard changes) |
| `:x` | Command | Save & quit |
| `:qa` | Command | Quit all |

### Diagnostics (Custom)
| Key | Mode | Action |
|-----|------|--------|
| `]d` | Normal | Next diagnostic |
| `[d` | Normal | Previous diagnostic |
| `Space+e` | Normal | Show error detail |
| `Space+q` | Normal | Diagnostics to loclist |

### Search
| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `#` | Search word under cursor (backward) |
| `:noh` | Clear search highlight |

### Windows & Tabs
| Key | Action |
|-----|--------|
| `:sp` | Split horizontal |
| `:vsp` | Split vertical |
| `Ctrl+w+h` | Move to left window |
| `Ctrl+w+l` | Move to right window |
| `Ctrl+w+j` | Move to below window |
| `Ctrl+w+k` | Move to above window |
| `Ctrl+ww` | Switch windows |
| `:tabnew` | New tab |
| `gt` | Next tab |
| `gT` | Previous tab |
| `:tabclose` | Close tab |

### Folding
| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open one level |
| `zm` | Close one level |

> Treesitter-based folding for `.lua`, `.md` etc. Regex-based for `.go` and `.py` (folds on `func`/`def`/`class` lines).

---

## fzf-lua (Neovim Plugin)
| Key | Action |
|-----|--------|
| `Ctrl+p` | Find files |
| `Ctrl+l` | Live grep (search in files) |
| `Ctrl+f` | Fuzzy find in current file (blines) |
| `Esc` | Close fzf-lua |

---

## Bufferline (Neovim Plugin)
| Key | Action |
|-----|--------|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `Space+x` | Close current buffer |

---

## Find & Replace (Neovim)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Find and replace in current file (prompts search -> replace, confirms each) |
| `Ctrl+Shift+h` | Normal | Find and replace with scope picker and preview |
| `Space+h` | Normal | Find and replace with scope picker and preview |

### Scope picker
| Scope | Meaning |
|-------|---------|
| `Current folder` | Active file folder, recursive |
| `Whole workspace` | Repo root / current working dir, recursive |
| `Open buffers` | All loaded, listed buffers |
| `Custom folder` | Prompt for folder path, recursive |

---

## Markview (Neovim Plugin)
| Key | Action |
|-----|--------|
| `Space+m` | Toggle Markview splitview preview |

---

## mini.diff (Neovim Git Diff)

> Signs: `▎` added/changed, `▁` deleted.

| Key | Mode | Action |
|-----|------|--------|
| `Space+d` | Normal | Toggle diff overlay |
| `Space+da` | Normal | Apply hunks (operator — select motion/range) |
| `Space+dr` | Normal | Reset hunks (operator — select motion/range) |
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `]H` | Normal | Last hunk |
| `[H` | Normal | First hunk |
| `gh` | Normal/Visual | Apply hunks in region (operator) |
| `gH` | Normal/Visual | Reset hunks in region (operator) |
| `gh` | Operator | Hunk range text object |

> Note: `Space+d` and `Space+da`/`Space+dr` share a prefix — Neovim resolves via `timeoutlen`. Type faster or increase `timeoutlen` if `Space+da`/`Space+dr` mis-fire.

---

## Neo-tree (Neovim File Explorer)
| Key | Action |
|-----|--------|
| `Ctrl+n` | Open file explorer (reveal left) |
| `Space+n` | Change directory (input prompt) |
| `Esc` (in Neo-tree) | Close Neo-tree window |
| `Enter` / `o` | Open file/directory |
| `a` | Add file/directory |
| `d` | Delete file/directory |
| `r` | Rename |
| `y` | Copy |
| `x` | Cut |
| `p` | Paste |
| `c` | Copy file name |
| `m` | Move file |
| `i` | Toggle hidden files |
| `R` | Refresh |
| `?` | Help |

---

## Autocompletion — blink.cmp (Neovim Plugin)

> Uses **enter** preset keybindings.

| Key | Action |
|-----|--------|
| `Enter` | Accept completion |
| `Ctrl+n` / `Down` | Next item |
| `Ctrl+p` / `Up` | Previous item |
| `Ctrl+e` | Cancel completion |

---

## toggleterm (Neovim Plugin)

> Direction: float. Terminal persists across hide/show cycles.

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+\` | Normal | Toggle float terminal open/close |
| `Ctrl+\` | Terminal | Close terminal |
| `Esc` | Terminal | Exit terminal insert mode (back to normal) |

---
## Tmux

### Prefix
| Key | Action |
|-----|--------|
| `Ctrl+Space` | Prefix (custom) |

### Plugins
| Plugin | Description |
|--------|-------------|
| `tmux-yank` | Clipboard yank support |
| `tmux-menus` | Context menus (Prefix + `\`) |

### Sessions
| Key | Action |
|-----|--------|
| `Prefix + d` | Detach from session |
| `Prefix + $` | Rename session |
| `Prefix + s` | List/switch sessions |
| `Prefix + (` | Previous session |
| `Prefix + )` | Next session |

> Attach from terminal: `tmux attach` or `tmux attach -t <name>`
> New named session: `tmux new -s <name>`
> List sessions: `tmux ls`
> Kill session: `tmux kill-session -t <name>`

### Windows & Panes
| Key | Action |
|-----|--------|
| `v` | Split vertical |
| `h` | Split horizontal |
| `c` | New window |
| `Prefix + ,` | Rename window |
| `Prefix + &` | Close window |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + w` | List windows |
| `Prefix + x` | Close pane |
| `r` | Reload config |

### Navigation
| Key | Action |
|-----|--------|
| `Ctrl+Left` | Navigate to left pane |
| `Ctrl+Right` | Navigate to right pane |
| `Ctrl+Up` | Navigate to upper pane |
| `Ctrl+Down` | Navigate to lower pane |

---

## Wezterm

### Copy/Paste
| Key | Action |
|-----|--------|
| `Ctrl+Shift+C` | Copy to clipboard |
| `Ctrl+Shift+V` | Paste from clipboard |
| Right click | Paste from clipboard |
| Left click + drag | Select & copy |

---

## Pi (Coding Agent TUI)

| Key | Action |
|-----|--------|
| `Ctrl+j` | Insert new line |
| `Shift+Enter` | Insert new line |
| `Enter` | Submit input |
| `Escape` | Cancel / abort |
| `Ctrl+q` | Clear editor |
| `Ctrl+d` | Exit (when editor empty) |
| `Ctrl+l` | Open model selector |
| `Ctrl+p` | Cycle to next model |
| `Ctrl+t` | Toggle thinking blocks |
| `Shift+Tab` | Cycle thinking level |
| `Ctrl+o` | Collapse/expand tool output |
| `Ctrl+g` | Open in external editor |
| `Ctrl+v` | Paste image from clipboard |

---

## K9s

> Note: K9s uses interactive navigation. Run `k9s` then use arrow keys, `Enter` to select, `Esc` to go back.

### Aliases
| Alias | Resource |
|-------|----------|
| `dep` | Deployments |
| `sec` | Secrets |
| `jo` | Jobs |
| `cr` | ClusterRoles |
| `crb` | ClusterRoleBindings |
| `ro` | Roles |
| `rb` | RoleBindings |
| `np` | NetworkPolicies |
