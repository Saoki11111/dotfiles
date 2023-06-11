# dotfiles

$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

$ brew bundle

$ git clone https://github.com/dracula/iterm.git
  - iTerm2 > Preferences > Profiles > Colors Tab
  - Open the Color Presets... drop-down in the bottom right corner
  - Select Import... from the list
  - Select the Dracula.itermcolors file

## iterm2

- check silent bell
- checkout Native full screen

## vim-plug

$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$ vim

- :PlugInstall

## tmux powerline

$ brew install tmux

$ pip install powerline-status

$ vi ~/.tmux.conf

```
# Powerline
run-shell "powerline-daemon -q"
source "/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/tmux/powerline.conf"

```

$ tmux kill-server

$ tmux

### フォント変更(文字化け)

$ git clone https://github.com/powerline/fonts.git --depth=1

$ cd fonts

$ ./install.sh

- iTerm2 「Preferences（環境設定）」
- 「Text（テキスト）」フォントの設定を編集
- 「Change Font（フォントの変更）」ボタンをクリックし、Powerlineフォント（例："Meslo LG S Regular for Powerline"）を選択
