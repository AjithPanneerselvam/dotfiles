#!/bin/bash

echo '\nExporting envs'
export $(cat env | xargs)

GO_TAR="go$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz"

brew_installs() {
    echo 'Installing brew package manager'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo '\nInstalling Neovim'
    brew install neovim
    
    echo '\nInstalling node (coc.nvim requires node runtime)'
    brew install node

    echo '\nInstalling zsh'
    brew install zsh

    echo '\nInstalling starship'
    brew install starship

    echo '\nInstalling ripgrep'
    brew install ripgrep
    
    echo '\nInstalling wget'
    brew install wget

    echo '\nInstalling tmux'
    brew install tmux
}

config_vim() {
    echo '\nInstalling vim-plug'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
    echo 'vim-plug installed'

    echo '\nCopying vim configs'
    cp .vimrc ~/.
    cp -R ./vim-configs ~/.
    cp -R .config ~/.
    echo 'Copied vim configs'

    echo '\nInstalling vim plugins using vim-plug'
    vim -es -u ~/vim-configs/plugins.vim -i NONE -c "PlugInstall" -c "qa"
    echo 'vim plugins installed'
}

install_langs() {
    echo '\nInstalling rust'
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    echo '\nDownloading go'
    sudo wget -c https://golang.org/dl/$GO_TAR
    echo '\nUnarchiving go'
    sh -c "sudo tar -C /usr/local -xzf $GO_TAR"
    rm $GO_TAR
}

setup_go() {
    mkdir $GO_PATH 

    echo '\nInstalling go tools (gopls, ...)'
    go get -u golang.org/x/tools/...
}

config_zsh() {
    echo '\nInstalling Oh My ZSH'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

    cp .zshrc ~/.
    echo 'Sourcing .zshrc'
    source ~/.zshrc
}

config_git() {
    # Git and Github setup 
    sh -c "git config --global user.name $GITHUB_USERNAME"
    sh -c "git config --global user.email $GITHUB_EMAIL_ID"

    sh -c "git config --global color.ui true"
    sh -c "git config --global core.editor $GIT_EDITOR" 

    ssh-keygen -t rsa -C $GITHUB_EMAIL_ID

    pbcopy < ~/.ssh/id_rsa.pub
    echo '\nCOPIED THE PUBLIC KEY TO CLIPBOARD' 

    echo 'Now, paste your ssh public key into your github account settings.
        1. Go to your github Account Settings
        2. Click “SSH Keys” on the left.
        3. Click “Add SSH Key” on the right.
        4. Add a label (like “My laptop”) and paste the public key into the big text box.'

    read -p "Press enter once the above steps are performed. "
}

config_tmux() {
    cp .tmux.conf ~/.
}

clean_setup() {
    rm $GO_TAR
}

echo '\nConfiguring Git and Github'
config_git

echo '\nbrew installs'
brew_installs

echo '\nConfiguring vim'
config_vim

echo '\nInstalling languages'
install_langs 

echo '\nGo Setup'
setup_go

echo '\nConfiguring zsh'
config_zsh

echo '\nConfiguring tmux'
config_tmux

echo '\nCleaning setup'
clean_setup
