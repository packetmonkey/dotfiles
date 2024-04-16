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

source "$HOME/.config/zsh/plugins/zsh-vim-mode.plugin.zsh"

export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Use bat to highlight man

export PATH="/opt/homebrew/bin:$PATH" # Homebrew
export PATH="$HOME/.cargo/bin:$PATH"  # Rust

alias vi="nvim"
alias vim="nvim"

# Enable auto-switching rubies via .ruby-version
if [[ -x /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]]
then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi

if whence zoxide > /dev/null 2>&1
then
  eval "$(zoxide init zsh)"
fi

if whence starship > /dev/null 2>&1
then
  eval "$(starship init zsh)"
fi

# Enable fzf shell keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if whence yt-dlp > /dev/null 2>&1
then
  alias obsidian-dl="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
fi
