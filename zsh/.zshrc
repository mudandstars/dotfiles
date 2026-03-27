# ZSH Configuration
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# ---PATHS---
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/:$PATH"
export PATH="/Users/paul/Library/Application Support/Herd/bin/":$PATH

plugins=(
	git 
	aws
	copyfile
	zsh-syntax-highlighting 
	zsh-autosuggestions 
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# aws autocomplete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

# ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
  fi

# brew
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH=/usr/local/bin/:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/opt/lua5.1/bin:$PATH"

export PATH="/opt/homebrew/opt/mariadb@10.11/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/crowdin@4/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

export HERD_PHP_85_INI_SCAN_DIR="/Users/paul/Library/Application Support/Herd/config/php/85/"
export STARSHIP_CONFIG=~/.dotfiles/starship.toml
