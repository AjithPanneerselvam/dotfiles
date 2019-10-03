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
set rtp+=~/.fzf   " fzf
set termencoding=utf-8
set guifont=GoMono\ Nerd\ Font\ Book:h18
set number
set hlsearch
set incsearch
set title
set clipboard+=unnamedplus
set completeopt+=noinsert
set completeopt-=preview
set backspace=indent,eol,start
set colorcolumn=80
set encoding=UTF-8 

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "chrome"

"ale configs  
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_linters = {'go': ['gobuild', 'go vet', 'golint', 'gofmt'], "python": ['flake8', 'pylint']}
let b:ale_fixers = ['autopep8']
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 2
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
"let g:ale_keep_list_window_open = 1
let g:airline_detect_paste=1 "vim-airline settings 

let vimDir = '$HOME/.vim' " Put plugins and dictionaries in this dir (also on Windows)
let &runtimepath.=','.vimDir
let g:airline_theme='onedark'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir='mysnippets'
"let g:UltiSnipsSnippetDirectories=['~/.vimsnippets']

let g:over_enable_cmd_window = 1 " vim-over
let g:over_enable_auto_nohlsearch = 1
let g:argwrap_tail_comma = 1
let g:LanguageClient_serverCommands = {
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'yaml': ['yaml-language-server'],
    \ 'go': ['go-langserver'],
    \ }

let g:checkbox_states = [' ', 'X'] " vim-checkbox plugin
let g:deoplete#enable_at_startup = 1

" close quickfix automatically while exiting the file 
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
                \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
                \   bd|
                \   q | endif

" restore cursor _except_ for commit messages
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

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

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir -p ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

if !exists('g:gui_oni') && !exists('g:GuiLoaded')
    autocmd StdinReadPre * let s:std_in=1  " Start NERDTree when no files specified
endif

if !exists('g:gui_oni')
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif 

