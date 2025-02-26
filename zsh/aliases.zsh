alias vim='nvim'
alias n='nvim'
alias ncfg='cd $HOME/.dotfiles && nvim'
alias ndot='cd $HOME/.dotfiles && nvim'
alias nnote='cd $HOME/Documents/notes && nvim'
alias ncode='cd $HOME/code/clockin && nvim'

alias lg='lazygit'
alias gst='git status'
alias gp='git pull'
alias co='git checkout'
alias ghd='function _gh_deploy() { current_branch=$(git rev-parse --abbrev-ref HEAD); gh workflow run deploy.yml --ref "$current_branch" -f environment=development-"$1"; }; _gh_deploy'
alias ghdt='function _gh_deploy_t() { current_branch=$(git rev-parse --abbrev-ref HEAD); gh workflow run deploy.yml --ref "$current_branch" -f environment=testing; }; _gh_deploy_t'
alias ghdd='ghd d09'

alias tcode="tmux attach -t coding"
alias tdot="tmux attach -t dotfiles"
alias tnote="tmux attach -t notes"
alias tetti="ssh -p 62307 paul@dev.tetraeder.solar"

alias reload='source $HOME/.zshrc && echo "reloaded config"'
alias cfgi='bash $HOME/.dotfiles/install.sh && reload'
alias ...='cd ~'
alias al='function _al() { alias | grep "$1"; }; _al'

alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

alias dev='npm run dev'

alias gpdf='docker run -it --add-host=office.clockin.test:host-gateway --rm -p 3000:3000 gotenberg/gotenberg:8.17.1 /bin/bash -c "gotenberg --chromium-ignore-certificate-errors"'
# php aliases
alias ptest='php artisan test --parallel'
alias c='composer'
alias a='php artisan'
alias mfs='php artisan migrate:fresh --seeder=TestingSeeder'

# clockin
alias phpcs='./vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php -v'
alias duskserve='php artisan serve --env=testing --port 8008'
alias duskdriver='sudo ./vendor/laravel/dusk/bin/chromedriver-mac-arm --port=9515'
alias dusktest='php artisan dusk --env=testing'
alias sl='stripe listen --forward-to https://office.clockin.test/stripe/webhook'

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
