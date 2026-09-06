
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Python3 provider (needed by UltiSnips). Points at a dedicated venv that has
" pynvim installed, so Homebrew's externally-managed Python isn't touched.
" Rebuild with: python3 -m venv ~/.venvs/nvim && ~/.venvs/nvim/bin/pip install pynvim
let g:python3_host_prog = expand('~/.venvs/nvim/bin/python3')

source ~/.vimrc


let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" copy and past w/o line numbers
set mouse=a


" custom snippets under the my_snippets file
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" sets yank to system clipboard
set clipboard+=unnamedplus
