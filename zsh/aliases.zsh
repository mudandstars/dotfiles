alias vim='nvim'
alias n='nvim'
alias config='/usr/bin/git --git-dir=/Users/sochiera/.dotfiles/ --work-tree=/Users/sochiera'

# php aliases
alias pest='vendor/bin/pest'
alias c='composer'
alias a='php artisan'
alias mfs='php artisan migrate:fresh --seed'
alias pint='vendor/bin/pint'

# js aliases
alias dev='npm run dev'

alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

heictojpg() {
    sips -s format jpeg "$1" --out "$2"
}

heicstojpgs() {
    for file in *.HEIC; do
        heictojpg $file ${file%.HEIC}.jpg
	rm $file
    done
}
