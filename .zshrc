# zsh-git-PROMPT
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{green}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

#zshの色指定
PROMPT="%K{082}%F{001}[%n@%m]%f%k"

# Enable completion function
# -z = zsh
autoload -Uz compinit
# run
compinit -u

# Correct command spelling
setopt correct

setopt auto_pushd

set clipboard+=unnamed

autoload -U promptinit
promptinit

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# phpenv
export PHPENV_HOME="$HOME/.phpenv"
export PATH="$PHPENV_HOME/bin:$PATH"
eval "$(phpenv init -)"

# go
path=(
$(go env GOROOT)/bin
$(go env GOPATH)/bin
$path
)

HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT='%d/%m/%y %T'

# mysql
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# 色を使用出来るようにする
autoload -Uz colors
colors


# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# エイリアス

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

alias reload='exec $SHELL'
alias re=reload

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
alias gclo='git clone'
alias gf='git fetch'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gsts='git stash save'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'

# docker
alias d='docker'

# images
alias di='docker images'

# container
alias dp='docker ps'

# stop
alias ds='docker stop'

# delete
alias dr='docker rmi'

# docker compose up
alias dcu='docker-compose up'

# docker compose
alias dc='docker-compose'

# delete container and network
alias dcd='docker-compose down'

# delete and image
alias dcdr='docker-compose down --rmi all'

# remove exited container
alias dre='docker rm `docker ps -f status=exited -q`'

# remove none image
alias drin='docker rmi $(docker images -f "dangling=true" -q)'

# viキーバイント
bindkey -v

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2 tab
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# less color
alias less='/usr/share/vim/vim80/macros/less.sh'

