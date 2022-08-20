source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugins.vim

let g:python_host_prog = '~/.tools/pyenv/shims/python'
let g:python3_host_prog = '~/.tools/pyenv/shims/python3'

" Show or hide the statusbar (laststatus)
" <leader>sl
let g:show_status_line_details = 0
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] &&".
\ " (git diff --cached -- {-1} | delta --plus-color='#004400' --minus-color='#550000' --theme=Nord) || " .
\ "[[ $(git diff -- {-1}) != \"\" ]] && (git diff -- {-1} | delta --plus-color='#004400' --minus-color='#550000' --theme=Nord) || " .
\ g:fzf_preview_command
function! ToggleStatusLine()
  set laststatus=1
  set signcolumn=no
  set statusline=
  set statusline+=%t
  if !g:show_status_line_details
    set laststatus=2
    set signcolumn=yes
    set statusline+=%r\
    set statusline+=%{&readonly?'ro\ ':''}
    set statusline+=%6*%{&modified?'•\ ':''}
    set statusline+=%3*%{WarningStatus()}
    set statusline+=%2*%{ErrorStatus()}
    set statusline+=%=%5*%v:%l\/%L
    let g:show_status_line_details = 1
    return
  endif
  let g:show_status_line_details = 0
endfunction

function! ErrorStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return (l:counts.error + l:counts.style_error) == 0 ? '' : g:ale_sign_error . ' '
endfunction

function! WarningStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return (l:counts.warning + l:counts.style_warning) == 0 ? '' : g:ale_sign_warning . ' '
endfunction

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/highlight.vim
" vim:tw=80:ts=2:sw=2:expandtab
