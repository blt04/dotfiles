" Enable plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Look and Feel
set nocompatible
syntax on
set ruler
set background=dark
set viminfo='20,\"50
set mouse=a
set showcmd
filetype on
filetype indent on
filetype plugin indent on

" Whitespace
set expandtab
set tabstop=2
set shiftwidth=2
set history=50
set bs=2

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Other
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
command -bar -nargs=1 OpenURL :!sensible-browser <args>


" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use ESC or Control+C to leave the Command-T plugin
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTSelectPrevMap=['<Up>', '<C-p>', '<C-k>', '<Esc>OA']
let g:CommandTSelectNextMap=['<Down>', '<C-n>', '<C-j>', '<Esc>OB']
