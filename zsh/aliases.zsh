source ~/code/clockin/shared_functions.zsh

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
alias mm='git fetch origin && git merge origin/main --no-ff'
alias ghd='function _gh_deploy() { current_branch=$(git rev-parse --abbrev-ref HEAD); gh workflow run deploy.yml --ref "$current_branch" -f environment=development-"$1"; }; _gh_deploy'
alias ghdt='function _gh_deploy_t() { current_branch=$(git rev-parse --abbrev-ref HEAD); gh workflow run deploy.yml --ref "$current_branch" -f environment=testing; }; _gh_deploy_t'
alias ghdd='ghd d09'

alias pest='./vendor/bin/pest'

alias tcode="tmux attach -t coding"
alias tdot="tmux attach -t dotfiles"
alias tnote="tmux attach -t notes"
alias tetti="ssh -p 62307 paul@dev.tetraeder.solar"

alias reload='exec zsh -l && echo "reloaded config"'
alias cfgi='bash $HOME/.dotfiles/install.sh && reload'
alias ...='cd ~'
alias al='function _al() { alias | grep "$1"; }; _al'

alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

alias dev='npm run dev'

alias gpdf='docker run -it --add-host=office.clockin.test:host-gateway --rm -p 3000:3000 gotenberg/gotenberg:8.26.0 /bin/bash -c "gotenberg --chromium-ignore-certificate-errors"'
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

# clockin gh merge queue overview
gh-mq() {
  local startDate="${1}T00:00:00Z"
  local endDate="${2}T23:59:59Z"

  gh run list \
    --repo clockinapp/clockin \
    --event merge_group \
    --limit 5000 \
    --json conclusion,createdAt \
  | jq -r '
      map(select(.createdAt >= "'"$startDate"'"
                 and .createdAt <= "'"$endDate"'")) as $runs
      | ($runs | length) as $total
      | ($runs | map(select(.conclusion == "failure")) | length) as $failed
      | "\($total) \($failed)"
    '
}

load-company-dump(){
    aws sts get-caller-identity &> /dev/null
    EXIT_CODE="$?"
    if [ "$EXIT_CODE" != 0 ]; then
        aws sso login
    fi

    export AWS_PROFILE=development-poweruser
    export AWS_ACCESS_KEY_ID=
    export AWS_SECRET_ACCESS_KEY=

    day_string=$(date +%Y-%m-%d)
    dump_name="dump_company_$1_$day_string.sql"
    echo "Loading dump $dump_name"

    if [ "$2" = "--create" ]; then
        gh workflow run transfer-company-dump.yml --ref main -f environment=development-d12 -f company_id="$1"
    fi

    php artisan clockin:load-database-dump-from-s3 clockin-development-transfer "$dump_name"
}
