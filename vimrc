call pathogen#infect()
hi Normal guibg=black guifg=lightgray
set ruler
syntax on
set hlsearch
set incsearch
set background=dark
filetype on
filetype indent on
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set viminfo='20,\"50
set history=50
set nocompatible
set bs=2
set mouse=a
set ignorecase
set smartcase
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
