ZSH=~/.oh-my-zsh
ZSH_THEME="gentoo"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
HOST=Mac

plugins=(git z)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

export PATH="/usr/texbin:$HOME/db_oj/script:$PATH"

alias make='make -j4'
alias updatedb='/usr/libexec/locate.updatedb'
alias nl='nl -s " " -w 4'
alias ag='ag -U'
alias gitx='open -a GitX .'

# for homebrew
export HOMEBREW_GITHUB_API_TOKEN="61d5146d7395421c917e37d564b1a56e396fa405"

# for rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# for auto virtual env
function auto_venv() {
    local o=$VIRTUAL_ENV
    local p=$(pwd -P)
    while [ $p != / ]; do
        local n=$p/.env
        [ -d $n ] && break
        p=$(dirname $p)
    done
    [ "$n" != "$o" -a -d "$o" ] && deactivate
    [ "$n" != "$o" -a -d "$n" ] && source "$n/bin/activate"
}
function cd() {
    builtin cd "$@"
    auto_venv
}
auto_venv
