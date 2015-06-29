# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

DISABLE_AUTO_TITLE="true"

export UPDATE_ZSH_DAYS=7

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

plugins=(cabal coffee git git-extras macports vagrant pip python npm osx sudo)

source $ZSH/oh-my-zsh.sh

################################################################################
#                            User configuration                                #
################################################################################

# Macports path
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Haskell path
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Anaconda path
#export PATH="$HOME/anaconda/bin/:$PATH"

# virtualenv-wrapper config
export WORKON_HOME=~/.env
source virtualenvwrapper.sh-2.7

export EDITOR='vim'

export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set the terminal name
export set_title(){
   echo -ne "\033]0;$1\007"
}

# config shorthand
alias config_zsh="vim ~/.zshrc"
alias config_vim="vim ~/.vimrc"
alias config_tmux="vim ~/.tmux.conf"
alias config_macports="sudo vim /opt/local/etc/macports/macports.conf"
alias config_emacs="emacs ~/.emacs"

alias cdtmp="cd /tmp"
alias cdws="cd ~/Workspace"
alias cdlab="cd ~/Workspace/laboratory"
alias cdcourse="cd ~/Documents/Courses"

alias clang-format="clang-format -style=llvm"

