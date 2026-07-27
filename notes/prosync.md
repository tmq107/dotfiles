# ProSync and Neovim lock workflow

## Purpose

Keep dotfiles repo as source of truth while avoiding stale Neovim plugin lock data flowing back from local machine.

## Commands

### `prosync`

Sync dotfiles from repo to home directory.

Neovim lock behavior:
- copies `~/personal/dotfiles/.config/nvim/nvim-pack-lock.json`
- to `~/.config/nvim/nvim-pack-lock.json`
- one-way only: dotfiles -> real

Use:
```bash
prosync
source ~/.zshrc
```

### `nvimlocksave`

Intentionally save live Neovim lock file back into dotfiles repo.

Copies:
- `~/.config/nvim/nvim-pack-lock.json`
- to `~/personal/dotfiles/.config/nvim/nvim-pack-lock.json`

Use when:
- plugin set changed on purpose
- lock file updated intentionally
- you want repo to capture current real lock state

Use:
```bash
nvimlocksave
```

### `nvimpackclean`

Find stale local plugin directories not present in repo lock file.

Checks local dirs under:
- `~/.local/share/nvim/site/pack/core/opt/`

Default behavior:
- dry run only
- prints stale plugin dirs

Use:
```bash
nvimpackclean
```

Remove stale plugin dirs:
```bash
nvimpackclean --apply
```

## Recommended workflow

### Normal dotfiles sync

```bash
prosync
source ~/.zshrc
```

### After intentional Neovim plugin updates

1. Update Neovim plugin config
2. Let Neovim refresh lock file
3. Save lock back to repo
4. Commit changes

```bash
nvimlocksave
git add .
git commit -m "chore: update nvim lock"
```

### When removed plugins keep coming back

1. Check stale local plugin dirs
2. Remove them if needed
3. Reopen Neovim

```bash
nvimpackclean
nvimpackclean --apply
```

## Why this workflow exists

`vim.pack` can repair or regenerate lock data from local plugin state.
If local stale plugin dirs still exist, Neovim may reintroduce old plugin entries into the live lock file.

To avoid polluting dotfiles repo:
- `prosync` never copies real lock back to repo
- `nvimlocksave` is manual and intentional
- `nvimpackclean` helps remove stale local plugin dirs
