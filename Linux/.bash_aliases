alias ll='eza -alF'
alias la='eza -A'
alias l='eza --classify --icons=always --group-directories-first'
alias battery='upower -i $(upower -e | grep 'BAT')'
alias lp='eza -lh --classify --icons=auto --sort=name --group-directories-first'
alias cplus='g++ -std=gnu++20 -Wall -Wextra -Wshadow -Wconversion'
alias cpl='g++ -std=gnu++17 -Wall -Wextra -Wshadow -Wconversion'
alias cthis='gcc -std=gnu11 -Wall -Wextra -Wshadow -Wconversion'
alias py3='python3'
alias runc='./a.out'
alias cleaner='rm -rf a.out'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade -y'
alias autoremove='sudo apt-get autoremove'
alias full='sudo apt-get update && sudo apt-get upgrade -y && flatpak update -y && brew upgrade && sudo pacstall -Up'
alias add='git add .'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'
alias cleanup='clear && exit'
alias fast='fastfetch'
alias brewdate='brew update'
alias brewup='brew upgrade'
alias nv='nvim'
alias ve='nvim .'
alias neo='neofetch'
alias qb='qutebrowser'
alias back='cd ..'
alias cat='bat'
alias branch='git branch'
alias checkout='git checkout'
alias allbranch='git branch -a'
alias tofu='mupdf'
alias story='history | less'
alias dcu='podman-compose up'
alias dcd='podman-compose down'
alias dup='podman compose up'
alias dow='podman compose down'
alias vp='podman volume prune -f'
alias rebuild='podman compose build --no-cache'
alias stash='git stash'
alias pop='git stash pop'
alias killz='zellij kill-all-sessions'
alias killer='zellij kill-session'
alias deletez='zellij delete-all-sessions -y'
alias deleter='zellij delete-session'
alias lister='zellij list-sessions'
alias attach='zellij attach'
alias ig='kitty +kitten icat'
alias lgit='lazygit'
alias startlib='sudo systemctl start libvirtd'
alias startvirt='sudo systemctl start libvirtd.socket'
alias startadmin='sudo systemctl start libvirtd-admin.socket'
alias startro='sudo systemctl start libvirtd-ro.socket'
alias stoplib='sudo systemctl stop libvirtd'
alias stopvirt='sudo systemctl stop libvirtd.socket'
alias stopadmin='sudo systemctl stop libvirtd-admin.socket'
alias stopro='sudo systemctl stop libvirtd-ro.socket'
alias pika='pikafetch'
alias grimsl='grim -g "$(slurp)"'
alias restore='git restore .'
alias ldock='lazydocker'
alias top='btop'
alias cds='cd .ssh_keys'
alias createzellij='zellij attach --create'
alias docks='podman system prune -a --volumes -f'
alias gl='gitleaks'
alias glg='gitleaks git'
alias tl='tmux ls'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tn='tmux new -s'
alias tr='tmux rename'
