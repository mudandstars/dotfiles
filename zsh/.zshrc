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
	fig
	copyfile
	zsh-syntax-highlighting 
	zsh-autosuggestions 
)

source $ZSH/oh-my-zsh.sh

