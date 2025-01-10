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

alias ls="eza"
alias vi="nvim"
alias vim="nvim"

if whence zoxide > /dev/null 2>&1
then
  eval "$(zoxide init zsh)"
fi

if whence starship > /dev/null 2>&1
then
  eval "$(starship init zsh)"
fi

# Enable fzf shell keybindings
if [ -f ~/.fzf.zsh ]
then
  source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS="
    --color=fg:#908caa,bg:#191724,hl:#ebbcba
    --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
    --color=border:#403d52,header:#31748f,gutter:#191724
    --color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
fi

# Must go last in .zshrc
# https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
