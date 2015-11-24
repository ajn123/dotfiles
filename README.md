AJ dotfiles
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

Mac
-----------------------------
##Zoom
  Accessibility > Zoom > Use scroll gesture to zoom: ^ Control

##Vim
    :PluginInstall # Use While in Vim to install plugins    


    # install YouCompleteMe Plugin, you need vim 7.4+ ;
    cd ~/.vim/bundle/YouCompleteMe;
    brew install CMake;
    python install.py;



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
 update # update homebrow and npm packages
 p # cd ~/projects
 j # jobs
 m # migrate
 s # rspec
 rk # rake
 capd # cap deploy
 reload # reload the shell
 shutdown # shutdown the computer
 hidedesktop # hide all desktop icons for presentations
 showdesktop # opposite of above
 top # show most cpu intensive processes
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


##Thanks
* [Thoughtbot](http://thoughtbot.com/)
* Vundle
* Rake
