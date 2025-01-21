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
	fig
	copyfile
	zsh-syntax-highlighting 
	zsh-autosuggestions 
)

source $ZSH/oh-my-zsh.sh

# PHP Setup
export PATH="/opt/homebrew/opt/mariadb@10.5/bin:$PATH"
export HERD_PHP_83_INI_SCAN_DIR="/Users/paul/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_82_INI_SCAN_DIR="/Users/paul/Library/Application Support/Herd/config/php/82/"
export PATH=/usr/local/bin/:$PATH

# aws autocomplete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

# brew settings
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# nice prompt
FIRST_PROMPT=1
LAST_COMMAND=""

precmd() {
  # Skip adding a newline for the first prompt or after the clear command
  if [ "$FIRST_PROMPT" -eq 0 ] && [ "$LAST_COMMAND" != "clear" ]; then
    echo ""
  fi
  FIRST_PROMPT=0
}

preexec() {
  # Capture the last executed command
  LAST_COMMAND=$1
}

PROMPT=$'%F{cyan}%B%~%b%f $(git_prompt_info)\n%F{green}%B->%b%f ' 
