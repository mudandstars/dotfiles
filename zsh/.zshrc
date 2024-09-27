ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# ---PATHS---
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/:$PATH"
export PATH="/Users/paul/Library/Application Support/Herd/bin/":$PATH


# Detect OS
case "$(uname)" in
  "Linux")
		plugins=(
			git 
			fig
			copyfile
			zsh-autosuggestions 
		)
    ;;
  "Darwin")
		plugins=(
			git 
			fig
			copyfile
			zsh-syntax-highlighting 
			zsh-autosuggestions 
		)
    ;;
  *)
    echo "Unknown OS: $(uname)"
    ;;
esac

source $ZSH/oh-my-zsh.sh

case "$(uname)" in
  "Linux")
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
		source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		export PYTHONPATH=:/home/paul/tetraeder.solar/sk_trunk/viewer/spkweb_v06
    ;;
  *)
    ;;
esac
