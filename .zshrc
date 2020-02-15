# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/ajith/.oh-my-zsh"

export PATH=/usr/local/bin:$PATH
export PATH=/Users/ajith/go/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export RABBITMQ=/usr/local/Cellar/rabbitmq/3.7.14/sbin/
export PATH=$PATH:$RABBITMQ


# Powerline
powerline-daemon -q
. /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# ZSH_THEME="spaceship"

alias vim=nvim
# updated devenv to thud image
# alias dockagentstart = 'docker start cefbb92b6123 | docker attach cefbb92b6123'
alias sshec2='sudo ssh -i ~/credentials/keys/QubeStoreNV.pem ec2-user@ssh.appliance.staging.qubewire.com'
alias scpagent='sudo scp -i ~/credentials/keys/QubeStoreNV.pem qwa-agent ec2-user@ssh.appliance.staging.qubewire.com:/tmp/ajith/'
alias godocs='godoc -http=:8080'
alias rmswap='rm ~/.local/share/nvim/swap/*'
alias go-bindata='~/go/src/github.com/jteeuwen/go-bindata/go-bindata'
alias cdajith='cd ~/go/src/github.com/AjithPanneerselvam'
#
# git aliases
alias gcheckout='git checkout $(git branch | fzf)'

bindkey -v

plugins=(
  git
)

# source $ZSH/oh-my-zsh.sh

# Uncomment the following spaceship config to enable SPACESHIP prompt 
eval "$(starship init zsh)"
# autoload -U promptinit; promptinit
# prompt spaceship

source /Users/ajith/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(zsh-autosuggestions)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="/usr/local/opt/gettext/bin:$PATH"


# Dir colors - https://github.com/arcticicestudio/nord-dircolors 
# Not working yet - Have to make this work 
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Make fzf use ripgrep 
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
alias f='fzf'

