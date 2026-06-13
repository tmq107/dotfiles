.PHONY: all prosync tmux-plugins

all: prosync tmux-plugins

prosync:
	@./.local/bin/prosync
tmux-plugins:
	@./scripts/tmux-plugins.sh
