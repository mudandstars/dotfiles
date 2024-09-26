alias vim='nvim'
alias n='nvim'
alias ncfg='nvim $HOME/.dotfiles'

alias lg='lazygit'
alias gst='git status'

alias reload='source $HOME/.zshrc && echo "reloaded config"'
alias cfgi='bash $HOME/.dotfiles/install.sh && reload'

alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# php aliases
alias pest='vendor/bin/pest'
alias c='composer'
alias a='php artisan'
alias mfs='php artisan migrate:fresh --seed'
alias pint='vendor/bin/pint'
alias dev='npm run dev'

# IMAGE FUNCTIONS
heictojpg() {
    sips -s format jpeg "$1" --out "$2"
}

heicstojpgs() {
    for file in *.HEIC; do
        heictojpg $file ${file%.HEIC}.jpg
	rm $file
    done
}
