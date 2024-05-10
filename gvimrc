set t_Co=256
colorscheme moria
set background=dark
set anti
highlight ExtraWhitespace guibg=red
highlight LineNr guifg=#404040 guibg=#121212
highlight SignColumn guibg=#121212

" Don't show the toolbar
set guioptions-=T
" Don't show scrollbars
set guioptions-=r
set guioptions-=L
" Always show the sign column
set signcolumn=yes

" Disable audible bell
set vb

if has("gui_macvim")
  set guifont=-monospace-Regular:h11.5
  "set guifont=Monaco:h11.00
  "set guifont=Consolas:h13.00
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  " TODO: Remove this
  " This is a temp workaround for
  " https://github.com/macvim-dev/macvim/issues/1333 until r175 comes out
  "set guioptions-=e
elseif has("gui_gtk2")
  set guifont=Monospace\ 8
endif

