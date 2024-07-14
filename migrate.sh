ln -sf ~/dotfiles/.vimrc ~/.vimrc

ln -sf ~/dotfiles/.zshrc ~/.zshrc

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

ln -sf ~/dotfiles/.hammerspoon ~/.hammerspoon

mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml

echo "configuration has been migrated successfully."
