
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" copy and past w/o line numbers
set mouse=a


" custom snippest
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
