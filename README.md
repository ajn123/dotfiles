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



Mac
-----------------------------
## Zoom
  Accessibility > Zoom > Use scroll gesture to zoom: ^ Control

## Vim/NeoVim
    :PlugInstall # Use While in [[Vim]] to install plugins    


    # install YouCompleteMe Plugin, you need vim 7.4+ ;
    cd ~/.vim/bundle/YouCompleteMe;
    brew install CMake;
    python install.py;
    :sp filename #horizontal pane
    :vsp filename #vertical pane
    <C-m> toggle nerd tree
    <C-n> multiple selection
    <C-b> look at open buffers
    <C-u> half page up
    <C-d> half page down
    zz    center page


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
 update # update homebrow and npm packages
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
```
Vim
-------------
```
CTRL-X CTRL-O # ruby completion while in insert
Gist # public gist
Gist -a # anonymous gist
Gist -d # delete a gist
Gist -b # Open the gist on browser after you post or update it.
<LEADER> l  # next tab
<LEADER> h # next tab
<LEADER> T # new tab
<LEADER> bq # delete tab
ctrl-p # open up through files
```

Tmux
------------
```
C-a # Ctrl -a is my prefix key
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
tmux new -s myname #start a session
tmux kill-session -t myname # kill session
```
Vim Snippets
-------------
```
ead - ERB each loop
ff - form_for
ife - if and else ruby statement
cbl - codeblock
tb(\d)x(\d) - create a x by x table in markdown
de - ruby definition
```

# You can add any snippets in the `/config/nvim/my_snippets` 


Emmet Plugin Example
-------------
* Write expression, then Ctrl-y + ,
    
[Examples Here](https://designshack.net/articles/css/7-awesome-emmet-html-time-saving-tips/)

Dash Plugin Example
------------
* [Dash API Documentation](https://raw.githubusercontent.com/rizzatti/dash.vim/master/doc/dash.txt)

Command | Definition 
:-|:-
:Dash <command> | bring dash to fore front




Atom
------------
Link Packages to Atom:
```
 ln -s ~/.atom/packages ~/.dotfiles/atom/packages
```


```
Command + Shift + P = Show New Commands
Command + ,  = Settings

```




## Thanks
* [Thoughtbot](http://thoughtbot.com/ )
* [vim-Plugin](https://github.com/junegunn/vim-plug )
* Rake
* Atom
* [Neovim](https://neovim.io/ )

