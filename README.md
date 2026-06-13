# Dotfiles

My personal dotfiles that control all tools used from my side.

## Usage

```
make            # Run both prosync and tmux-plugins (default target)
make prosync    # Sync dotfiles from repo to live locations:
                #   - Shell config: .zshrc, .aliases, .funrc, .p10k.zsh, .envrc
                #   - .config/ (all apps configs)
                #   - .local/bin/ and .local/share/
                #   - Pi agent skills (copied to Kiro if installed)
make tmux-plugins # Clone TPM (if missing) and install tmux plugins
```

Run `source ~/.zshrc` after `make prosync` to reload shell.
