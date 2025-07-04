# Dotfiles

Personal configuration files for macOS development environment.

## What's included

- **bashrc** - Shell configuration with aliases and history settings
- **inputrc** - Readline configuration for vi-mode navigation
- **tmux.conf** - Terminal multiplexer configuration with vim-style bindings
- **starship.toml** - Command prompt configuration
- **gitconfig** - Git settings and aliases
- **gitignore** - Global git ignore patterns
- **install.sh** - Setup script

## Installation

```bash
git clone --recursive https://github.com/yilinjuang/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Restart your terminal after installation.

## Requirements

- macOS
- Bash 5.0+
- tmux 3.0+
- Starship prompt
- Git 2.0+

Install dependencies with Homebrew:

```bash
brew install bash tmux starship
```

## Key bindings

### tmux (prefix: Ctrl+a)

- `Ctrl+a s` - Session list
- `Ctrl+a |` - Split horizontally
- `Ctrl+a -` - Split vertically
- `Ctrl+a h/j/k/l` - Navigate panes
- `Ctrl+a Ctrl+s` - Save session
- `Ctrl+a Ctrl+r` - Restore session

### Git aliases

- `git st` - status
- `git co` - checkout
- `git ci` - commit
- `git br` - branch with tracking info
- `git di` - diff with color words
- `git hist` - pretty commit history

## Customization

Edit the configuration files directly in `~/.dotfiles/` to customize settings.
