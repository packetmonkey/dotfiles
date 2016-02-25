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

source ~/.zsh/functions/git

# Get our local rbenv version if we have one
function rbenv_local_version() {
  echo "‹$(rbenv version | sed -e "s/ (set.*$//")›"
}

# Do the heavy lifting if make it all pretty
generate_prompt() {
  local current_dir="%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}"
  # local ruby="%{$terminfo[bold]$fg[red]%}$(rbenv_local_version)%{$reset_color%}"
  local git_branch="%{$terminfo[bold]$fg[yellow]%}$(git_prompt_info)%{$reset_color%}"

  if [ $UID -ne 0 ]; then
    local prompt_glyph="%B$%b"
  else
    local prompt_glyph="%{$terminfo[bold]$fg[red]%}#%{$reset_color%}"
  fi
#   PROMPT="╭─${user_host} ${current_dir} ${ruby} ${git_branch}
  PROMPT="${current_dir}${git_branch} ${prompt_glyph} "
}

precmd() { generate_prompt }

export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CLICOLOR=$LSCOLORS
export NODE_PATH="/usr/local/lib/node_modules/"
export PATH="./bin:~/.cargo/bin:$PATH"
export EDITOR="nvim"

# http://www.economyofeffort.com/2013/08/03/zsh-tmux-vim-and-256-color-madness/
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

path=(/usr/local/bin /usr/local/share/npm/bin $path)
export GIT_EDITOR="nvim -c 'startinsert'"

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

alias vim="echo 'use nvim instead.'"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval `boot2docker shellinit 2>/dev/null`

if [[ -e /Users/evan/Documents/Code/Focus/focus/bin/focus ]]; then
  eval "$(/Users/evan/Documents/Code/Focus/focus/bin/focus init -)"
fi;

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

function editconflicts() {
  nvim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}

# added by travis gem
[ -f /Users/evan/.travis/travis.sh ] && source /Users/evan/.travis/travis.sh

 [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
