# Setup new Machine

## Install software
```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # install brew 
    brew install zsh 
    brew install alacritty 
    brew install nvim
    brew install tmux
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install oh-my-zsh
```

## Install configs
```bash
    git clone git@github.com:mudandstars/dotfiles.git .dotfiles 
    bash .dotfiles/install.sh
```

## Install zsh plugins
```bash 
    brew install zsh-syntax-highlighting 
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
