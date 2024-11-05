# Setup new Machine

## Install software

```bash
    # install brew via their website: https://brew.sh/

    # Install zsh with tooling
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Install terminal setup
    brew install alacritty
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    brew install font-fira-code-nerd-font

    # Install dev tooling
    brew install eza
    brew install ripgrep
    brew install lazygit
    brew install node
    npm install -g blade-formatter

    # Setup Lazyvim
    brew install nvim
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
```

## Install configs

```bash
    git clone https://github.com/mudandstars/dotfiles.git .dotfiles
    bash .dotfiles/install.sh
```
