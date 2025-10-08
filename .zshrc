# ============================================
# Universal Settings (Both Linux and macOS)
# ============================================

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

# Completion styles
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
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

# Default editors
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

# Add local bin to PATH if not already present
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# ============================================
# OS-Specific Configuration
# ============================================

if [[ "$OSTYPE" == "darwin"* ]]; then
    # ===== macOS Configuration =====
    
    # Zellij config
    if [[ -z "$ZELLIJ" ]]; then
      :
    fi
    
    # Homebrew paths
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH=$PATH:/usr/local/bin
    
    # Prefer Homebrew LLVM/clang
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
    
    # Homebrew curl
    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    
    # FZF setup
    set rtp+=/opt/homebrew/opt/fzf
    source <(fzf --zsh)
    
    # Syntax highlighting and autosuggestions (Homebrew paths)
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    
    # PlatformIO (adjust path if different on your Mac)
    export PATH="$PATH:$HOME/.platformio/penv/bin"
    # Add AeroSpace to PATH
export PATH="/Applications/AeroSpace.app/Contents/MacOS:$PATH"
    
    # Random Pokemon (using gshuf on macOS)
    pokeget $(gshuf -i 1-905 -n 1) --hide-name
    
    # Conda initialization (macOS path)
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

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # ===== Linux Configuration =====
    
    # Enable sudo completion
    compdef _sudo sudo
    
    # Syntax highlighting and autosuggestions (Linux paths)
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    
    # Cargo environment
    . "$HOME/.cargo/env"
    
    # Random Pokemon (using shuf on Linux)
    pokeget $(shuf -i 1-905 -n 1) --hide-name
    
    # PlatformIO
    export PATH="$PATH:/home/tanish/.platformio/penv/bin"
    
    # NPM global
    export PATH=~/.npm-global/bin:$PATH
    
    # Android SDK
    export ANDROID_HOME="/home/tanish/Android/Sdk"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
    
    # Conda initialization (Linux path)
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
fi

# ============================================
# Universal Initialization (Both OS)
# ============================================

# Oh-my-posh prompt
eval "$(oh-my-posh init zsh --config ~/.config/initiald.omp.json)"

# Zoxide (smart cd)
eval "$(zoxide init zsh)"

# Source aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

export PATH
