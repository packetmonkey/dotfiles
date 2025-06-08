if status is-interactive
    if test -f /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if not set -q TMUX and type -q TMUX
        exec tmux new-session -A -s default # attach default tmux session
    end

    zoxide init fish | source
    starship init fish | source
    /opt/homebrew/bin/mise activate fish | source

    fish_vi_key_bindings

    # Preserve readline start/end of line in vim mode
    bind -M insert ctrl-a beginning-of-line
    bind -M insert ctrl-e end-of-line

    set -Ux EDITOR nvim
    set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'" # Use bat to highlight man

    alias ls eza
    alias ll "ls --long --all --header"
    alias vi nvim
    alias vim nvim
    alias t todo.sh

    if test -f local.fish
        source local.fish
    end

    set -gx FZF_DEFAULT_OPTS "\
      --highlight-line \
      --info=inline-right \
      --ansi \
      --layout=reverse \
      --border=none \
      --color=bg+:#283457 \
      --color=bg:#16161e \
      --color=border:#27a1b9 \
      --color=fg:#c0caf5 \
      --color=gutter:#16161e \
      --color=header:#ff9e64 \
      --color=hl+:#2ac3de \
      --color=hl:#2ac3de \
      --color=info:#545c7e \
      --color=marker:#ff007c \
      --color=pointer:#ff007c \
      --color=prompt:#2ac3de \
      --color=query:#c0caf5:regular \
      --color=scrollbar:#27a1b9 \
      --color=separator:#ff9e64 \
      --color=spinner:#ff007c"
end
