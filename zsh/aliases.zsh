alias vim='nvim'
alias n='nvim'
alias ncfg='nvim $HOME/.dotfiles'

alias lg='lazygit'
alias gst='git status'
alias gp='git pull'
alias co='git checkout'
alias ghd='function _gh_deploy() { current_branch=$(git rev-parse --abbrev-ref HEAD); gh workflow run deploy.yml --ref "$current_branch" -f environment=development-"$1"; }; _gh_deploy'
alias ghdd='ghd d09'

alias tcode="tmux attach -t coding"
alias tdot="tmux attach -t dotfiles"
alias tnote="tmux attach -t notes"

alias reload='source $HOME/.zshrc && echo "reloaded config"'
alias cfgi='bash $HOME/.dotfiles/install.sh && reload'
alias ...='cd ~'
alias cl='clear'

alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

alias dev='npm run dev'

# php aliases
alias ptest='php artisan test --parallel'
alias c='composer'
alias a='php artisan'
alias mfs='php artisan migrate:fresh --seed'

# clockin
alias phpcs='./vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php -v'
alias duskserve='php artisan serve --env=testing --port 8008'
alias duskdriver='sudo ./vendor/laravel/dusk/bin/chromedriver-mac-arm --port=9515'
alias dusktest='php artisan dusk --env=testing'

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
