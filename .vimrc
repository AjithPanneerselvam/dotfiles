call plug#begin()
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

execute pathogen#infect()

 set autowrite
 set number
 set hlsearch
 hi Search ctermbg=Black
 hi Search ctermfg=White
 hi MatchParen cterm=none ctermbg=Gray ctermfg=White
 
 let mapleader = ","
 let g:go_fmt_command = "goimports"
 let g:go_metalinter_autosave = 1
 let g:go_metalinter_deadline = "5s"
 let g:go_auto_sameids = 1
 let g:go_decls_includes = "func,type"
 let g:neocomplcache_enable_at_startup = 1
  
 let g:NERDTreeIndicatorMapCustom = {
     \ "Modified"  : "✹",
     \ "Staged"    : "✚",
     \ "Untracked" : "✭",
     \ "Renamed"   : "➜",
     \ "Unmerged"  : "═",
     \ "Deleted"   : "✖",
     \ "Dirty"     : "✗",
     \ "Clean"     : "✔︎",
     \ 'Ignored'   : '☒',
     \ "Unknown"   : "?"
     \ }
 
 map <cn> :cnext<CR> map <cm> :cprevious<CR> nnoremap <leader>a :cclose<CR>
 autocmd FileType go nmap <leader>r  <Plug>(go-run)
 autocmd FileType go nmap <leader>t  <Plug>(go-test)
 autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
 autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
 autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
 autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
 autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
 autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
 autocmd FileType go nmap <Leader>i <Plug>(go-info)
 autocmd FileType go nmap <Leader>i <Plug>(go-info)
 
 let g:go_list_type = "quickfix"
 
 " run :GoBuild or :GoTestCompile based on the go file
 function! s:build_go_files()
   let l:file = expand('%')
   if l:file =~# '^\f\+_test\.go$'
     call go#test#Test(0, 1)
   elseif l:file =~# '^\f\+\.go$'
     call go#cmd#Build(0)
   endif
 endfunction
 
 autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
