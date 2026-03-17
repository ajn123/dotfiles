# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with [rcm](https://github.com/thoughtbot/rcm) (thoughtbot's dotfile management tool). Files in this repo are symlinked to `$HOME` as dotfiles via `rcup`.

## Key Commands

- **Install dotfiles:** `env RCRC=$HOME/dotfiles/rcrc rcup` (creates symlinks to home directory)
- **Update symlinks:** `rcup` (safe to run multiple times)
- **Full setup from scratch:** `cd hooks; rake install` (installs oh-my-zsh, Homebrew, rcm, vim plugins, brew packages, cask apps)
- **Install Vim plugins:** `:PlugInstall` from within Vim/Neovim

## Architecture

- **rcrc** — rcm configuration: excludes `README.md`, `LICENSE`, `startup.sh`, `Brewfile`, `Caskfile`, `Rakefile`; copies (not symlinks) `oh-my-zsh/*` and `config/*`
- **zshrc** — Primary shell config. Uses oh-my-zsh with `bira` theme. Sources `~/.{path,exports,aliases,functions,extra}` and supports local overrides via `~/.zshrc.local`. Vi-mode keybindings enabled.
- **bashrc** — Minimal, mostly unused (zsh is primary shell)
- **aliases** — Shell aliases sourced by zshrc. Supports local overrides via `~/.aliases.local`
- **functions** — Shell functions (`mkd`, `gh` for opening GitHub repo in browser)
- **gitconfig** — Git aliases, color settings, URL shorthands (`gh:` → `git@github.com:`, `gst:` → gist). Merge tool is `emerge`.
- **gitignore** — Global gitignore referenced by gitconfig
- **hooks/** — Bootstrap automation:
  - `Rakefile` — Main installer (oh-my-zsh, Homebrew, rcm, vim plugins, Python/pynvim)
  - `brew_Install` — Homebrew formulae (neovim, postgres, tmux, z, bat, etc.)
  - `cask_Install` — macOS GUI apps via Homebrew Cask
- **config/** — Contains `nvim/` and `tmuxinator/` configs (copied to home, not symlinked)
- **vimrc / vimrc.bundles** — Vim configuration and plugin list (vim-plug)
- **tmux.conf** — Tmux config (prefix: `C-a`)
- **inputrc** — Readline config
- **vimwiki/** — Personal wiki/notes in Vimwiki format

## Conventions

- Default editor is `nvim` (set in zshrc)
- Zsh plugins: git, bundler, rake, vi-mode, history-substring-search, web-search, zsh-syntax-highlighting (must be last)
- Local overrides go in `~/.zshrc.local` and `~/.aliases.local` — never edit those files in this repo
- The `rcrc` EXCLUDES list must be updated when adding non-dotfile files to the repo
