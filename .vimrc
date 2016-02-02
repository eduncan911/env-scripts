execute pathogen#infect()
syntax on
filetype plugin indent on

let g:neocomplete#enable_at_startup = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1

" fixing 256 colors in tmux
" set term=screen-256color
set t_Co=256                        " force vim to use 256 colors

" fixing Background Color Erase when term is set to non-xterm
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
else
  " switch to fallback mode when there xterm-256color isn't detected
  " (e.g. gnome's Drop Down Shell extension)
  let g:solarized_termcolors=256
endif

" solarized theme
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>

