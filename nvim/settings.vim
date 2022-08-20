filetype plugin on
syntax on

set hidden

set termguicolors

" UTF-8 Encoding
set encoding=utf-8
set fileencoding=utf-8

" Don't wrap lines
set nowrap

set updatetime=100

" Disable intro message
set shortmess=I

" Don't create swap files
set noswapfile

" Don't show current mode
set noshowmode

" Don't show status bar
set laststatus=1

" Don't show file location
set noruler

" Don't show last command
set noshowcmd

set cmdheight=1

" Don't show the sign column
set signcolumn=no

" Disable the preview window
set completeopt-=preview

" Hide tilde for empty lines
set fillchars=eob:\
set fillchars+=vert:│

" Configure the statusline
set statusline=
"set statusline+=%5*
set statusline+=%t

" vim:tw=80:ts=2:sw=2:expandtab
