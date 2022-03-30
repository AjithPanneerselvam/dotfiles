call plug#begin('~/.vim/plugged')

" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter

" Themes and appearance 
Plug 'chuling/ci_dark'

""" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Go
Plug 'fatih/vim-go', { 'tag': '*' } " , 'do': ':GoUpdateBinaries' }

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
