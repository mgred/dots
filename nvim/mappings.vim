"
" Mappings
"

let mapleader = ";"

" ESC with jk
imap jk <Esc>

" Save & Quit
map <leader>w :w<CR>
map <leader>aw :wa<CR>
map <leader>q :wq<CR>
map <leader>aq :wqa<CR>
map <leader>x :q!<CR>
map <leader>ax :qa!<CR>
map <leader>W :w !sudo tee %<CR>

" Move between buffers
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

" Move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <silent> <leader>sv :source ~/.config/nvim/init.vim<CR>
map <silent> <leader>n :set number! relativenumber!<CR>
map <silent> <leader>N :set number!<CR>

" Show the current filepath
map <leader>fp :echo @%<CR>

" Toggle file status, position, show change, warning, error
map <silent> <leader>sl :call ToggleStatusLine()<CR>

" Substitute
nnoremap <leader>ss :%s//<left>
nnoremap <Leader>sw :%s/<C-r><C-w>//g<Left><Left>
nnoremap <Leader>sW :%s/\<<C-r><C-w>\>//g<Left><Left>

" Replace (Substitute on one line)
nnoremap <leader>rs :s//<left>
nnoremap <leader>rw :s/<C-r><C-w>//g<Left><Left>
nnoremap <leader>rW :s/\<<C-r><C-w>\>//g<Left><Left>

nmap <silent> <leader>l :<C-u>CocCommand fzf-preview.Buffers<CR>
nmap <silent> <leader>L :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nmap <silent> <leader>j :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nmap <silent> <leader>J :<C-u>CocCommand fzf-preview.ProjectMruFiles<CR>
nmap <silent> <leader>d :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nmap <silent> <leader>g :<C-u>CocCommand fzf-preview.GitStatus<CR>

" FZF
" nmap <leader>j :GitFiles<CR>
" nmap <leader>ff :Files<CR>
" nmap <leader>e :Buffers<CR>

" Make Y behave like other capitals
nnoremap Y y$

" ALE
nmap <silent>gn <Plug>(coc-diagnostic-next)
nmap <silent>gp <Plug>(coc-diagnostic-prev)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gr :CocCommand fzf-preview.CocReferences<CR>
nmap <silent> <leader>fo <Plug>(coc-format)
nmap <silent> <leader>fi :CocCommand eslint.executeAutofix<CR>
" nmap <silent> <leader>af :CocCommand prettier.formatFile<CR>
nmap <silent> <leader>ai :CocCommand tsserver.organizeImports<CR>
nmap <silent> <leader>fC <Plug>(coc-fix-current)
nmap <silent> <leader>fn <Plug>(coc-rename)
nmap <silent> <leader>fc <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>fl <Plug>(coc-codeaction-line)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim:tw=80:ts=2:sw=2:expandtab
