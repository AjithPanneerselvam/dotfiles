export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$PATH
export PATH=/Users/ajith/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.cargo/env:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


alias vim=nvim
alias godocs='godoc -http=:8080'
alias rmswap='rm ~/.local/share/nvim/swap/*'
alias cdajith='cd ~/go/src/github.com/AjithPanneerselvam'
alias f='fzf'

# git aliases
alias gcheckout='git checkout $(git branch | fzf)'

eval "$(starship init zsh)"

export PATH="/usr/local/opt/gettext/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Make fzf use ripgrep 
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
