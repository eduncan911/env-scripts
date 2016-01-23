" initially seeded from: http://www.terminally-incoherent.com/blog/2012/03/26/how-to-configure-vim/
"

" break compatibility with vi
set nocompatible

" buffers can exist in background
set hidden

"enable inline spellcheck
"set spell
"set spelllang=en

" enable line numbers
set nu

" show line and column markers
"set cursorline
"set cursorcolumn

" enable soft word wrap
set formatoptions=l
set lbr

" move by screen lines, not by real lines - great for creative writing
nnoremap j gj
nnoremap k gk
 
" also in visual mode
vnoremap j gj
vnoremap k gk

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
 
set autoindent
" copy previous indent on enter 
set copyindent
set smartindent

" toggle paste mode (to paste properly indented text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
 
set incsearch		" incremental search
set hlsearch		" highlights searches

" pressing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

set noswapfile
set nobackup
set nowb

" use jj to quickly escape to normal mode while typing 
inoremap jj <ESC>

" press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :

" Statusline (c) Winterdom
" http://winterdom.com/2007/06/vimstatusline
 
set ls=2 " Always show status line
if has('statusline')
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=buff:#%n line:%l/%L col:%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=buff:#%n line:%l/%L col%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif
