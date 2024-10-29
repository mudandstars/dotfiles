# Setup new Machine

## Install software
```bash
    # install brew via their website: https://brew.sh/
    brew install zsh 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install oh-my-zsh
    brew install alacritty 
    brew install nvim
    brew install tmux
    brew install eza
    brew install ripgrep
    brew install lazygit
    brew install font-fira-code-nerd-font
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
```

## Install configs
```bash
    git clone https://github.com/mudandstars/dotfiles.git .dotfiles 
    bash .dotfiles/install.sh
```

## Install zsh plugins
```bash 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
