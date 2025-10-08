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

#Zellij config
if [[ -z "$ZELLIJ" ]]; then
  :
fi 
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR='nvim'
set rtp+=/opt/homebrew/opt/fzf
eval "$(oh-my-posh init zsh --config ~/.config/initiald.omp.json)"
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

pokeget $(gshuf -i 1-905 -n 1) --hide-name

# Prefer Homebrew LLVM/clang
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/optimusprime/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/optimusprime/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/optimusprime/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/optimusprime/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval "$(zoxide init zsh)"
