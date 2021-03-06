# This is your .bashrc
# All aliases, functions, settings, and other sortcuts can be defined here
# Contribute to this .bashrc at https://github.com/nrobinson2000/bashrc
# Copyright (GPL) Nathan D Robinson 2017

# Exports
export GPG_TTY=$(tty)
export GOPATH=$HOME/go/
export PS1="\[$(tput setaf 1)\]\[$(tput bold)\]\t\[$(tput sgr0)\] \[$(tput setaf 6)\]\[$(tput bold)\]\u\[$(tput sgr0)\]\[$(tput setaf 5)\]\[$(tput bold)\]@\[$(tput setaf 7)\]\[$(tput bold)\]\h:\[$(tput sgr0)\]\[$(tput setaf 4)\]\[$(tput bold)\]\w $ \[$(tput sgr0)\]"
export EDITOR="vim"
export PARTICLE_DEVELOP=1

# Set terminal title
export PS1="\[\e]0;\w\a\]$PS1"

# Colored Echos

blue_echo()
{
  echo "$(tput setaf 6)$(tput bold)$1$(tput sgr0)"
}

green_echo()
{
  echo "$(tput setaf 2)$(tput bold)$1$(tput sgr0)"
}

red_echo()
{
  echo "$(tput setaf 1)$(tput bold)$1$(tput sgr0)"
}

# ls
alias la="ls -A"
alias lh="ls -lah"
alias l="ls"
alias ll="ls -la"


# Handy Shortcuts
alias bash="$SHELL"
alias grep="grep --color=auto"
alias ..="cd .."
alias c="clear"
alias cls="c && ls"
alias n="nano"
alias ca='cat'
alias home='cd && clear && ls'

# Tools
alias p='particle'
alias py='python'
alias yt="youtube-dl -x  --audio-format='mp3'"

alias sf='screenfetch'
alias nf="echo && neofetch"

#Mac OS Only
if [ "$(uname -s)" == "Darwin" ];
then
  alias ls="ls -G"
  alias htop='sudo htop'
  alias atom='open -a Atom'
  alias chrome='open -a Google\ Chrome'
  alias new="open -a 'Terminal' ."
  alias ip='ipconfig getifaddr en0'
fi

# Serial Shortcuts
function get-modem()
{
  if [ "$(uname -s)" == "Darwin" ];
  then
    modem="$(ls -1 /dev/cu.* | grep -vi bluetooth | tail -1)"
  else
    modem="$(ls -1 /dev/* | grep "ttyACM" | tail -1)"
  fi
}

function console() {
  get-modem
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    screen "$modem" "$baud"
  else
    echo "No USB modem device found in /dev"
  fi
}

# Git Shortcuts
alias pull="git pull"
alias check="git checkout"

function update()
{
  cd "$(pwd)"
  git add -A
  #git commit -S -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")" # Replace the line below with this one for GPG signed commits
  git commit -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")"
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

function pull-all()
{
  CWD="$PWD"

  for OUTPUT in $(ls -1 "$CWD")
  do
    if [ -d "$CWD/$OUTPUT/.git" ]; # Only do git pull if it is a repository
    then
      cd "$CWD/$OUTPUT"
      blue_echo "Pulling $OUTPUT..."
      git pull
      echo
    fi
  done
  cd "$CWD"
}

# Miscelaneous Shortcuts
function locate() # Find the location of a file in a specified folder (locate ~ text.txt)
{
  find "$1" -name "$2" -print
}

function mkcd()
{
mkdir -p "$1" && cd "$1"
}

alias run="npm start"
alias setup="npm install"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

alias skip-ci="update '[skip ci]'"

[ -f "$HOME/github/particle-cli-completion/particle-cli.completion" ] && source "$HOME/github/particle-cli-completion/particle-cli.completion"
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# Add your own stuff below...
