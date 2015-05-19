# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

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

export EDITOR='vim'

export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set the terminal name
export set_title(){
   echo -ne "\033]0;$1\007"
}

alias cc="clang++ -std=c++1y"
