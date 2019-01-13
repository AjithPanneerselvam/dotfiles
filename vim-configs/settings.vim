set hidden " required by CtrlSpace
if isdirectory('/dev/shm')
	set directory=/dev/shm " in-memory swap files (more risky but nothing sticks around)
endif

filetype plugin indent on    " required
set t_Co=256 " Ignored by nvim

set cursorline
set whichwrap+=<,>,h,l,[,] " right-arrow goes to next line
set autochdir " change dir to current file's dir
set autowrite " useful for :bufdo
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8

set wildmenu                       
set wildmode=list:longest,full 

set tabstop=4     " a tab is four spaces
set softtabstop=4   " number of spaces in tab when editing
set expandtab     " tabs are spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

set mouse=nicr
set mousemodel=extend

if exists('g:gui_oni')
    filetype off                  " required
    set noswapfile
endif

if !has('nvim')
	set term=xterm-256color
endif

" Enable deoplete on startup
if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

"vim-airline settings 
let g:airline_detect_paste=1

"ale settings
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_linters = {'go': ['gobuild', 'go vet', 'golint', 'gofmt'], "python": ['flake8', 'pylint']}
let b:ale_fixers = ['autopep8']
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 2
"let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

" Remap ,m to make and open error window if there are any errors. If there
" weren't any errors, the current window is maximized.
map <silent> ,m :mak<CR><CR>:cw<CR>:call MaximizeIfNotQuickfix()<CR>

" Maximizes the current window if it is not the quickfix window.
function MaximizeIfNotQuickfix()
  if (getbufvar(winbufnr(winnr()), "&buftype") != "quickfix")
    wincmd _
  endif
endfunction

if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

set termencoding=utf-8
set guifont=GoMono\ Nerd\ Font\ Book:h18

if !has('nvim')
	" old completion stuff
	let g:ycm_complete_in_strings = 1
	let g:ycm_allow_changing_updatetime = 1000
	let g:ycm_auto_trigger = 1
	let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
	let g:completor_auto_trigger = 1
	let g:completor_min_chars = 2	
	
	inoremap _expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
	let g:completor_auto_trigger = 0
        let g:completor_gocode_binary = "$HOME/go/bin/gocode"
endif

set number
set hlsearch
set incsearch
set title
set clipboard+=unnamedplus

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir -p ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

set backspace=indent,eol,start

" restore cursor _except_ for commit messages
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

let g:place_single_character_mode = 0
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


let g:airline_theme='onedark'
let g:WMGraphviz_output = "svg"
let g:WMGraphviz_viewer = "google-chrome"

""" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

if !exists('g:gui_oni') && !exists('g:GuiLoaded')
    " Start NERDTree when no files specified
    autocmd StdinReadPre * let s:std_in=1
endif

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir='mysnippets'
"let g:UltiSnipsSnippetDirectories=['~/.vimsnippets']

" ctrlp
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if !exists('g:gui_oni')
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif       
let g:over_enable_cmd_window = 1 " vim-over
let g:over_enable_auto_nohlsearch = 1

" let g:used_javascript_libs = 'angularjs,angularui'
let g:argwrap_tail_comma = 1

" Language server
nnoremap <silent> ls :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" NERDTree
nnoremap <silent> nt :NERDTree <CR>

"    \ 'go': ['go-langserver'],
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'yaml': ['yaml-language-server'],
    \ 'go': ['go-langserver'],
    \ }

""" vim-checkbox plugin
let g:checkbox_states = [' ', 'X']
let vim_markdown_preview_github=1
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview
autocmd CompleteDone * silent! pclose!
inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if (pumvisible())
        return deoplete#close_popup()
    else
        return "\<CR>"
    endif
endfunction
