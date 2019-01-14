" Leader
let mapleader=";"
let maplocalleader=","

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%'}

""" fzf key mappings
nnoremap <silent> ff :Files <CR> 
nnoremap <silent> fg :GFiles <CR>
nnoremap <silent> fgs :GFiles? <CR> 
nnoremap <silent> fl :Lines <CR>
nnoremap <silent> fm :Marks <CR> 
nnoremap <silent> flp :Locate \ <CR>
nnoremap <silent> fag :Ag <CR>
nnoremap <silent> fgc :Commits <CR> 
nnoremap <silent> fcm :Commands <CR> 
nnoremap <silent> fmp :Maps <CR> 

""" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

""" NERDTree
nnoremap <silent> nt :NERDTree <CR>

""" Language server
nnoremap <silent> ls :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

" Remap ,m to make and open error window if there are any errors. If there weren't any errors, the current window is maximized.
map <silent> ,m :mak<CR><CR>:cw<CR>:call MaximizeIfNotQuickfix()<CR>

autocmd CompleteDone * silent! pclose!
inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if (pumvisible())
        return deoplete#close_popup()
    else
        return "\<CR>"
    endif
endfunction
