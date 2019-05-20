source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

setopt auto_cd              # `..` is shortcut for `cd ..` (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt printexitvalue       # for non-zero exit status<Paste>
setopt APPEND_HISTORY       # share history across shells on start while
                            # sessions maintain their own history

zstyle :compinstall filename '/Users/evan.zshrc'

fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(~/.zsh/completions $fpath)
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select=2

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000

autoload -U colors && colors

source ~/.zsh/functions/prompt

precmd() { generate_prompt }

export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CLICOLOR=$LSCOLORS
export NODE_PATH="/usr/local/lib/node_modules/"
export EDITOR="vim"
export GREP_COLOR='1;30;43'
export GREP_OPTIONS='--color=auto'

# http://www.economyofeffort.com/2013/08/03/zsh-tmux-vim-and-256-color-madness/
export TERM=xterm-256color-italic
[ -n "$TMUX" ] && export TERM=screen-256color


export GIT_EDITOR="vi"

rndpw() {
  password=$(head -c 128 /dev/urandom | shasum | cut -d' ' -f1)

  if [[ -t 1 ]]; then
    echo $password
  else
    echo -n $password
  fi
}

alias retag="ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp --exclude=vendor * >> tags"

alias gd="git diff --color | less -R"
alias gc="git commit --verbose"
alias gca="git commit -a --verbose"
alias gwip="git commit -am 'wip'"
alias lsa="ls -a"
alias cls="clear;ls"
alias clsa="clear;ls -a"
alias be="bundle exec"
alias ber="bundle exec rake"
alias ll="ls -lah"
alias fucking="sudo"
alias psg="ps auwx | grep "
alias most-used-commands="cat $HISTFILE | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 30"
alias meetings="vim ~/Dropbox/meetings_notes.md"
alias vi="vim"

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Desired PATH priority
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi   # rbenv
export PATH="/usr/local/share/npm/bin:$PATH"                  # NPM
export PATH="/usr/local/sbin:$PATH"                           # Homebrew
export PATH="~/.cargo/bin:$PATH"                              # Rust / Cargo
export PATH="/Users/evan/Bin:$PATH"                           # ~/Bin
export PATH="./bin:$PATH"                                     # ./bin

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
