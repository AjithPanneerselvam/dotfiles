call plug#begin('~/.vim/plugged')

Plug 'Shougo/denite.nvim' " I think this is a dependency for something. Can't remember but leaving it near the top

" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter

" Themes and appearance 
Plug 'joshdick/onedark.vim' " one-dark color scheme 

""" Completion
Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc' 

""" Go
Plug 'fatih/vim-go', { 'tag': '*' } " , 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

""" Syntax & linting 
Plug 'w0rp/ale' 

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
Plug 'pelodelfuego/vim-swoop' " replace across files typa thing
Plug 'sunaku/vim-shortcut' "searchable key mappings
Plug 'haya14busa/incsearch.vim'

""" Appearance and layout
Plug 'vim-airline/vim-airline'
Plug 'itchyny/vim-cursorword' " underline word under cursor

if has('nvim')
	Plug 'jodosha/vim-godebug'

	"gonvim
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'dzhou121/gonvim-fuzzy' 
endif

""" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
