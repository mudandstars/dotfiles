#!/bin/sh 

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo $DOTFILES
echo $HOME 

rm -rf $HOME/.oh-my-zsh/custom/aliases.zsh
ln -s $DOTFILES/zsh/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh

rm -rf $HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

CONFIG_DIRS=("nvim" "zellij" "alacritty" "kitty")
for config in "${CONFIG_DIRS[@]}"; do
    echo "removing $HOME/.config/$config.."
    echo "linking to $DOTFILES/$config.."
    rm -rf "$HOME/.config/$config"
    ln -s "$DOTFILES/$config" "$HOME/.config/$config"
done

echo 'successfully installed...'

