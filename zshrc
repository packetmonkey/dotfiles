source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt auto_cd

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
export EDITOR="nvim"
export GREP_COLOR='1;30;43'
export GREP_OPTIONS='--color=auto'

# http://www.economyofeffort.com/2013/08/03/zsh-tmux-vim-and-256-color-madness/
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color


export GIT_EDITOR="nvim"

rndpw() {
  password=$(head -c 128 /dev/urandom | shasum | cut -d' ' -f1)

  if [[ -t 1 ]]; then
    echo $password
  else
    echo -n $password
  fi
}

alias retag="ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp --exclude=vendor * && coffeetags -R -f - >> tags"

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

alias vup="vagrant up"
alias vssh="vagrant ssh"
alias vhalt="vagrant halt"

alias vim="nvim"

# eval `boot2docker shellinit 2>/dev/null`

if [[ -e /Users/evan/Documents/Code/Focus/focus/bin/focus ]]; then
  eval "$(/Users/evan/Documents/Code/Focus/focus/bin/focus init -)"
fi;

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

function editconflicts() {
  nvim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}

[ -f /Users/evan/.travis/travis.sh ] && source /Users/evan/.travis/travis.sh
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Desired PATH priority
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi   # rbenv
export PATH="/usr/local/share/npm/bin:$PATH"                  # NPM
export PATH="/usr/local/sbin:$PATH"                           # Homebrew
export PATH="~/.cargo/bin:$PATH"                              # Rust / Cargo
export PATH="/Users/evan/Bin:$PATH"                           # ~/Bin
export PATH="./bin:$PATH"                                     # ./bin

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home"
