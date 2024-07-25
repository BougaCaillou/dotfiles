# Various aliases
alias lks="links"
alias kx="kubectx"
alias majd="gcd && gl && gco -"
alias chrome="open $1 -a \"Google Chrome\""
alias py="python3"
alias b="bastion"
alias vi="nvim"
alias v="vi ."
alias cheh="python3 -m webbrowser https://www.youtube.com/watch\?v\=9M2Ce50Hle8"
alias su="python3 -m webbrowser https://www.youtube.com/shorts/FiPDKHLdCyE"
alias hf="helmfile"
alias hfd="helmfile diff"
alias hfa="helmfile apply"
alias cl="curlie"
alias make="gmake"
alias ls='eza -lh --git --icons --no-user'
alias lst='eza -lh --git --icons --no-user --tree'
alias lsat='eza -lh --git --icons --no-user --tree --all'
alias ez='exec zsh'

# Aliases to manage project (mostly make commands)
alias mc="make clean"
alias mi="make install"
alias mp="make prepare"
alias ml="make link"
alias mb="make build"
alias mbl="make build-local"
alias mbt="make build-test"
alias mr="make run"
alias mrl="make run-local"
alias mrt="make run-test"
alias mblmr="make build-local && make run"
alias mdv="make dev"
alias mw="make watch"
alias mpsh="make publish"
alias mpsht="make publish-test"
alias mtr="meteor"

# conventional commits reminder
alias cc="echo \"feat: A new feature
fix: A bug fix
docs: Documentation only changes
style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
refactor: A code change that neither fixes a bug nor adds a feature
perf: A code change that improves performance
test: Adding missing tests or correcting existing tests
chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
ci: Changes to our CI configuration files and scripts
build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)\""

# Zoxide
eval "$(zoxide init zsh)"

# FZF
alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"

# McFly
eval "$(mcfly init zsh)"

