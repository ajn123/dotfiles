[[AJ]] dotfiles
===================

![image](https://cloud.githubusercontent.com/assets/2382277/5582048/29b76fee-9031-11e4-83a1-e5a8ceb92c75.png)
![image](https://cloud.githubusercontent.com/assets/2382277/5630056/3fed4f3e-9588-11e4-86b3-ec0d9fbc38eb.png)



Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/ajn123/dotfiles.git

For mac:

    cd hooks;
    rake install;

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:


* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/dotfiles-local`

You can safely run `rcup` multiple times to update:

    rcup

You then need to install vim-plug 
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \                                                                                                                                                                                                                    130 ↵
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```



Homebrew Casks (GUI Apps)
-----------------------------

Install all GUI applications via Homebrew Cask:

    bash hooks/cask_Install

This installs: Google Chrome, iTerm2, Sublime Text, The Unarchiver, Alfred, Dash, Rectangle, 1Password, MacTeX, Docker, Notion, TablePlus, Slack, Loop, Microsoft Office, Hack Nerd Font, and Miniconda.

To install individual casks manually:

    brew install --cask <cask-name>

Mac
-----------------------------
## Zoom
  Accessibility > Zoom > Use scroll gesture to zoom: ^ Control

## Vim/NeoVim
    :PlugInstall # install plugins
    :PlugUpdate  # update plugins
    :PlugClean   # remove unused plugins

Vim Plugins
-------------
Leader key is `<Space>`.

### File Navigation
Plugin | Command | Description
:-|:-|:-
**FZF** | `<C-p>` | Fuzzy file finder with devicons and bat preview
**FZF** | `<C-b>` | Browse open buffers
**FZF** | `:Find <query>` | Ripgrep search across project
**NERDTree** | `<C-m>` | Toggle file tree sidebar
**EasyMotion** | `<Leader><Leader>w` | Jump to any word on screen

### Editing
Plugin | Command | Description
:-|:-|:-
**vim-surround** | `cs"'` | Change surrounding `"` to `'`
**vim-surround** | `ds"` | Delete surrounding `"`
**vim-surround** | `ysiw]` | Surround word with `[]`
**vim-multiple-cursors** | `<C-n>` | Select word, repeat for multiple cursors (`<C-s>` to quit)
**Emmet** | `<C-y>,` | Expand Emmet abbreviation (e.g. `div>ul>li*3`)
**tComment** | `gcc` | Toggle comment on current line
**tComment** | `gc` (visual) | Toggle comment on selection
**delimitMate** | auto | Auto-close brackets, quotes, parens

### Snippets (UltiSnips)
Command | Description
:-|:-
`<C-j>` | Expand snippet trigger
`<C-f>` | Jump to next placeholder
`<C-b>` | Jump to previous placeholder

Custom snippets go in `/config/nvim/my_snippets/`.

### Git
Plugin | Command | Description
:-|:-|:-
**vim-fugitive** | `:Git` | Run any git command
**vim-fugitive** | `:Git blame` | Inline blame
**vim-fugitive** | `:Git diff` | View diff in vim
**gist-vim** | `:Gist` | Post public gist
**gist-vim** | `:Gist -a` | Post anonymous gist
**gist-vim** | `:Gist -b` | Open gist in browser after posting

### Completion & Linting
Plugin | Command | Description
:-|:-|:-
**coc.nvim** | auto | LSP-powered autocompletion and diagnostics
**ALE** | auto | Async linting (runs on save only)

### UI & Appearance
Plugin | Description
:-|:-
**gruvbox** | Color scheme
**vim-airline** | Status bar with molokai theme and buffer tabs
**vim-devicons** | File type icons (requires Nerd Font)
**vim-startify** | Start screen with recent files and sessions

### Buffers & Splits
Command | Description
:-|:-
`<Space>T` | New empty buffer
`<Space>l` | Next buffer
`<Space>h` | Previous buffer
`<Space>bq` | Close current buffer
`<Space>bl` | List all buffers
`<C-J/K/L/H>` | Navigate splits (down/up/right/left)
`:sp filename` | Horizontal split
`:vsp filename` | Vertical split

### Other
Plugin | Description
:-|:-
**vim-obsession** | `:Obsession` to save/restore vim sessions
**vimwiki** | `<Leader>ww` to open personal wiki (`~/dotfiles/vimwiki/`)
**Dash** | `:Dash <query>` to search Dash API docs
**vim-rails** | Rails navigation (`:Emodel`, `:Econtroller`, etc.)
**vim-rspec** | RSpec integration

Github
----------------

    git config credential.helper store; Run for passwordless https


Aliases
---------------
```
 ..   # cd ..
 ...  # cd ../..
 .... # cd ../../..
 g # git
 g lg # formatted git log
 gh  # open github repo (only works if remote repo given)
 g hist = lists history of one week
 g type <COMMIT> type of commit
 g dump <COMMIT> list stats
 update # update homebrew and npm packages
 p # cd ~/projects
 j # jobs
 m # migrate
 s # rspec
 rk # rake
 rmd # remove directory
 capd # cap deploy
 reload # reload the shell
 shutdown # shutdown the computer
 hidedesktop # hide all desktop icons for presentations
 showdesktop # opposite of above
 top # show most cpu intensive processes
 ip # find your IP address
 localip
 ips
 tx # tmuxinator
 v  # nvim
```

Tmux
------------
```
C-a # Ctrl-a is the prefix key
M-(arrow_key) # switch panes with Alt
r  # reload tmux.conf
$ # name session
% # split vertically
" # split horizontally
x # kill pane
_ # (SPACE) - toggle between layouts
d - exits tmux
:kill-session # end session
& # kills the window (exits tmux)

tmux ls # list sessions
tmux new -s myname # start a session
tmux kill-session -t myname # kill session
```

## Thanks
* [Thoughtbot](http://thoughtbot.com/)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [Neovim](https://neovim.io/)

