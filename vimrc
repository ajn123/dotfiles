" possible, as it has side effects.

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"automaticlly reload .vimrc when saved
au BufWritePost .vimrc so ~/.vimrc 

"" Map escape 
:imap ;; <Esc>
" Leader
let mapleader = " "

set runtimepath+=~/.vim/bundle/vim-snipmate/after
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set number
set ignorecase    " case INsensitive searching
set smartcase     " If an uppercase letter is searched, only uppercase version is found

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" To split a pan in vim do :vsp <filename>, to vertically split vim
" Easier split navigations, see
" http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default:
set splitbelow
set splitright

" compiler plugin
autocmd FileType ruby compiler ruby


" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.


" " To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" " Move to the next buffer
nmap <leader>l :bnext<CR>

" " Move to the previous buffer
nmap <leader>h :bprevious<CR>

" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

"  Show all open buffers and their status
nmap <leader>bl :ls<CR>



" Automatic text wrapping
set tw=80 " text-with to 80 chars
set formatoptions+=t " automatically wrap around white space

" Spell Check
set spell spelllang=en_us

set nopaste

