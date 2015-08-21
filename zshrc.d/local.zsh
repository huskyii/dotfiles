# Macports path
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Haskell path
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Anaconda path
#export PATH="$HOME/anaconda/bin/:$PATH"

# virtualenv-wrapper config
export WORKON_HOME=~/.env
source virtualenvwrapper.sh-2.7

# OPAM configuration
. ~/.opam/opam-init/init.zsh

# turn on extended regular expression support
alias sed="sed -E"

