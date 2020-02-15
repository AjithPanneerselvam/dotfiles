set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.vimrc.experiment")) " try
  source ~/.vimrc.experiment
elseif filereadable(expand("~/vim-configs/plugins.vim")) " Usual
  source ~/vim-configs/plugins.vim
  source ~/vim-configs/appearance.vim 
  "source ~/vim-configs/syntax.vim
  source ~/vim-configs/settings.vim
  " source ~/vim-configs/functions.vim
  source ~/vim-configs/mappings.vim
  source ~/vim-configs/go.vim
endif


if filereadable(expand("~/.vimrc.local")) 
    " Local overrides ...
  source ~/.vimrc.local
endif 
