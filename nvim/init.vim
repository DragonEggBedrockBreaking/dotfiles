"Indentation options
set autoindent "inherited indentation
set expandtab "tabs to spaces
set shiftwidth=4 "tabs are 4 spaces when shifting
set smarttab "use tabstop for tabbing
set tabstop=4 "indent with 4 spaces

"Search options
set ignorecase "ignore case
set smartcase "unless there is a capital letter

"Performance options
set lazyredraw "don't update screen during macro and script execution

"Text rendering
set encoding=utf-8 "use utf-8
syntax enable "enable syntax highlighting
set wrap "enable line wrapping
set linebreak "avoid wrapping a line in the middle of a word

"User interface
set ruler "show cursor permission
set number "line numbers
set noerrorbells "disable beep on errors
set title "set window title to filename
set background=dark " use better colours for dark theme

"Backups
set nobackup "no backups as I have git
set nowb "ignores it if it fails to write buffer
set noswapfile "remove swap files

"Plugins
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-fugitive' "git inside vim
    Plug 'preservim/nerdtree' "file management in vim
    Plug 'vim-syntastic/syntastic' "syntax checker inside vim
call plug#end()

"Dealing with syntastic
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_python_checkers = ['flake8']
