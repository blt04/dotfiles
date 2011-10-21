set t_Co=256
colorscheme default
set background=dark
hi Normal guibg=black guifg=lightgray

" Don't show the toolbar
set guioptions-=T
" Don't show scrollbars
set guioptions-=r
set guioptions-=L

if has("gui_macvim")
  set guifont=Monaco:h10.00
elseif has("gui_gtk2")
  set guifont=Monospace\ 8
endif

