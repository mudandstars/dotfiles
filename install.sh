#!/bin/sh 

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

rm -rf $HOME/.oh-my-zsh/custom/aliases.zsh
ln -s $DOTFILES/zsh/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh

rm -rf $HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

CONFIG_DIRS=("nvim" "zellij" "alacritty" "kitty")
for config in "${CONFIG_DIRS[@]}"; do
    rm -rf "$HOME/.config/$config"
    ln -s "$DOTFILES/$config" "$HOME/.config/$config"
done

echo "Successfully Installed $DOTFILES"

