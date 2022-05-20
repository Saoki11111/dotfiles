# Correct command spelling
setopt correct
setopt auto_pushd

set clipboard+=unnamed

eval "$(anyenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"

HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT='%d/%m/%y %T'

autoload -Uz compinit
compinit -i

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
alias mkdir='mkdir -p'

alias v='vim'
alias vi='vim'
alias diff='colordiff'

alias sed='gsed'

alias t='tmux'

alias -g G='| grep'

alias cdf='cd $(find * -type d | fzf --preview "tree -L 2 {}")'

alias cdp='popd'

alias cdpr='cd `git rev-parse --show-toplevel`'

alias reload='source ~/dotfiles/.zshrc'
alias re=reload
alias reloadtmux='tmux source ~/dotfiles/.tmux.conf'
alias ret=reloadtmux
alias execs='exec $SHELL -l'
alias es=execs

alias vzsh='vim ~/dotfiles/.zshrc'
alias vvim='vim ~/dotfiles/.vimrc'
alias vtmx='vim ~/dotfiles/.tmux.conf'

alias o='open'
alias oc='open -a 'Google\ Chrome''

# TODO
# alias ssh='~/bin/ssh-change-bg'

alias dh='du -h'
alias g='git'

# docker
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias ds='docker stop'
alias dr='docker rmi'
alias dcu='docker-compose up'
alias dce='docker-compose exec'
alias dc='docker-compose'
alias dcd='docker-compose down'
alias dcr='docker-compose run'
alias dcdr='docker-compose down --rmi all'
alias dre='docker rm `docker ps -f status=exited -q`'
alias drin='docker rmi $(docker images -f "dangling=true" -q)'

# emacs keybind
bindkey -e

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export LANG=en_US.UTF-8
export LANG=ja_JP.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2 tab
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# mycli dsn
alias mcys='mycli --dsn ysp_cms_development_dsn'

# md
alias 1c='ccat ~/workspace/tel.md'

# ~/.ssh/config
alias csh='ruby ~/workspace/ruby/ruby-work/ssh.rb'
alias cho='ruby ~/workspace/ruby/ruby-work/hosts.rb'

# command color
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vcs_info
# vcs_info をロードする
autoload -Uz vcs_info

# プロンプトを表示するたびに変数を展開
setopt prompt_subst

# true 作業ブランチの状態に応じて表示を変える
zstyle ':vcs_info:git:*' check-for-changes true

# commmit していない場合の表示
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"

# add していない場合の表示
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"

# デフォルトの状態の表示
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"

# コンフリクトの状態
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# complete case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# vcs_info を呼び出す
precmd () { vcs_info }

PROMPT='
%F{045}%~ ${vcs_info_msg_0_}'"
%F{177}[local(%*%)]%f%k%{${reset_color}%}$ "

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share//zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

autoload -Uz add-zsh-hook

function rename_tmux_window() {
   if [ $TERM = "screen" ]; then
       local current_path=`pwd | sed -e s/\ /_/g`
       local current_dir=`basename $current_path`
       tmux rename-window $current_dir
   fi
}

add-zsh-hook precmd rename_tmux_window

export PATH="/usr/local/sbin:$PATH"

export GIT_PAGER="LESSCHARSET=utf-8 less"

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history


fpath=(/usr/local/share/zsh-completions $fpath)

function undot(){
    /usr/bin/zip --delete $@ "*__MACOSX*" "*.DS_Store"
}
