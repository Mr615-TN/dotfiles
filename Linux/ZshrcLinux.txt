setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Add this line to enable sudo completion
compdef _sudo sudo
# For zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# For zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

source ~/.zsh_aliases 
. "$HOME/.cargo/env"

# --- Set Default Editor ---
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

# Function to get a random Pokemon
pokeget $(shuf -i 1-905 -n 1) --hide-name

eval "$(oh-my-posh init zsh --config ~/.config/initiald.omp.json)"
export PATH="$PATH:/home/tanish/.platformio/penv/bin"
export PATH=~/.npm-global/bin:$PATH
eval "$(zoxide init zsh)"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tanish/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tanish/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tanish/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tanish/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export ANDROID_HOME="/home/tanish/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

