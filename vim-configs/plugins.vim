call plug#begin('~/.vim/plugged')

"Plug 'Shougo/denite.nvim' 

" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter

" Themes and appearance 
"Plug 'joshdick/onedark.vim' " one-dark color scheme 
"Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'

""" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'   
"  Plug 'roxma/vim-hug-neovim-rpc'
" endif

""" Go
Plug 'fatih/vim-go', { 'tag': '*' } " , 'do': ':GoUpdateBinaries' }
"Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

""" Syntax & linting 
" Plug 'w0rp/ale' 

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

""" Rust 
Plug 'rust-lang/rust.vim'

""" tpope
Plug 'tpope/vim-surround'          " Operate on surrounding 

""" navigation and fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Find within files

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"
" Highlight the words being seached on the fly 
Plug 'haya14busa/incsearch.vim'

Plug 'sunaku/vim-shortcut'

""" Appearance and layout
Plug 'vim-airline/vim-airline'
Plug 'itchyny/vim-cursorword' " underline word under cursor

call plug#end()
