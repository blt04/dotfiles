set t_Co=256
colorscheme moria
set background=dark
set anti
highlight ExtraWhitespace guibg=red

" Don't show the toolbar
set guioptions-=T
" Don't show scrollbars
set guioptions-=r
set guioptions-=L

" Disable audible bell
set vb

if has("gui_macvim")
  set guifont=Monaco:h11.00
  "set guifont=Consolas:h13.00
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
elseif has("gui_gtk2")
  set guifont=Monospace\ 8
endif

