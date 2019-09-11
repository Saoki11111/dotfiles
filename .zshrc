# Correct command spelling
setopt correct
setopt auto_pushd

set clipboard+=unnamed

if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/shims:$PATH"

HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT='%d/%m/%y %T'

# color
autoload -Uz colors
colors

# screen japanese file name 
setopt print_eight_bit

# Share history with shells launched simultaneously
setopt share_history

# Do not leave the same command in history
setopt hist_ignore_all_dups

# Command lines start with a space are not leaft in the history
setopt hist_ignore_space

# Remove extra space when saving to history
setopt hist_reduce_blanks

# alias
alias ls='ls -G'
export LSCOLORS=GxfxcxdxFxegedabagacad
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'

# byte or kbyte
alias lh='ls -lh'
alias lk='ls -lk'

# check
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias v='vim'
alias vi='vim'
alias diff='colordiff'

alias -g G='| grep'

alias cdf='cd $(find * -type d | fzf --preview "tree -L 2 {}")' 

alias cdp='popd'

alias reload='source ~/.zshrc'
alias re=reload
alias execs='exec $SHELL -l'
alias es=execs

alias vzsh='vim ~/.zshrc'
alias vvim='vim ~/.vimrc'

# git alias
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gcm='git commit'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gpush='git push'
alias gpull='git pull'
alias gl='git log'
alias gcl='git clone'
alias gf='git fetch'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grm='git rm'
alias gst='git status'
alias gsh='git show'
alias gsts='git stash save'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'

# docker
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias ds='docker stop'
alias dr='docker rmi'
alias dcu='docker-compose up'
alias dc='docker-compose'
alias dcd='docker-compose down'
alias dcdr='docker-compose down --rmi all'
alias dre='docker rm `docker ps -f status=exited -q`'
alias drin='docker rmi $(docker images -f "dangling=true" -q)'

# pokemon
alias po='pokemon'

# vi keybind
bindkey -v

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2 tab
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

autoload -U promptinit; promptinit
prompt pure
