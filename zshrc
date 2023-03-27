setopt AUTO_PARAM_SLASH     # tab completing directory appends a slash
setopt HIST_IGNORE_ALL_DUPS # filter duplicates from history
setopt HIST_IGNORE_SPACE    # don't record commands starting with a space
setopt PRINT_EXIT_VALUE     # for non-zero exit status<Paste>
setopt APPEND_HISTORY       # share history across shells on start while
                            # sessions maintain their own history

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=1000000000

autoload -U colors && colors

export EDITOR="nvim"

export PATH="/opt/homebrew/bin:$PATH" # Homebrew
export PATH="$HOME/.cargo/bin:$PATH"  # Rust

# Enable auto-switching rubies via .ruby-version
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

eval "$(starship init zsh)"
