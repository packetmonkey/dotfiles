source $HOME/.config/zsh/plugins/antigen.zsh
antigen bundle Aloxaf/fzf-tab
antigen apply

setopt AUTO_PARAM_SLASH     # tab completing directory appends a slash
setopt HIST_IGNORE_ALL_DUPS # filter duplicates from history
setopt HIST_IGNORE_SPACE    # don't record commands starting with a space
setopt PRINT_EXIT_VALUE     # for non-zero exit status<Paste>
setopt APPEND_HISTORY       # share history across shells on start while
                            # sessions maintain their own history

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=1000000000

autoload -U colors   && colors
autoload -U compinit && compinit

source "$HOME/.config/zsh/plugins/zsh-vim-mode.plugin.zsh"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Style FZF after ccatppuccin mocha
export FZF_DEFAULT_OPTS="                                         \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8       \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc  \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8   \
  --color=selected-bg:#45475a                                     \
  --multi"



export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Use bat to highlight man

export PATH="/opt/homebrew/bin:$PATH" # Homebrew
export PATH="$HOME/.cargo/bin:$PATH"  # Rust

alias ls="eza"
alias ll="ls --long --all --header"
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
