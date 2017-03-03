# Exports
export GPG_TTY=$(tty)
export GOPATH=$HOME/go/
export PS1="\[$(tput setaf 1)\]\[$(tput bold)\]\t\[$(tput sgr0)\] \[$(tput setaf 6)\]\[$(tput bold)\]\u\[$(tput sgr0)\]\[$(tput setaf 5)\]\[$(tput bold)\]@\[$(tput setaf 7)\]\[$(tput bold)\]\h:\[$(tput sgr0)\]\[$(tput setaf 4)\]\[$(tput bold)\]\w $ \[$(tput sgr0)\]"
export EDITOR="nano"
export PARTICLE_DEVELOP=1

# Colored Echos

blue_echo()
{
  echo "$(tput setaf 6)$(tput bold)$MESSAGE$(tput sgr0)"
}

green_echo()
{
  echo "$(tput setaf 2)$(tput bold)$MESSAGE$(tput sgr0)"
}

red_echo()
{
  echo "$(tput setaf 1)$(tput bold)$MESSAGE$(tput sgr0)"
}

# ls
alias la="ls -la"
alias lh="ls -lah"
alias l="ls"

# Handy Shortcuts
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
if [ "!(uname -s)" == "Darwin" ];
then
  alias ls="ls -G"
  alias htop='sudo htop'
  alias atom='open -a Atom'
  alias chrome='open -a Google\ Chrome'
  alias new="open -a 'Terminal' ."
  alias ip='ipconfig getifaddr en0'
fi

# Serial Shortcuts
alias get-modem="$(ls -1 /dev/cu.* | grep -vi bluetooth | tail -1)"

function console {
  modem=`ls -1 /dev/cu.* | grep -vi bluetooth | tail -1`
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    screen "$modem" "$baud"
  else
    echo "No USB modem device found in /dev"
  fi
}

# Git Shortcuts
alias pull="git pull"

function update()
{
  cd "$(pwd)"
  git add -A
  #git commit -S -m "$1 at $(date +"%H:%M") of $(date +"%d-%m-%Y")" # Uncomment for GPG signed commits
  git commit -m "$1 at $(date +"%H:%M") of $(date +"%d-%m-%Y")"  # Comment for GPG signed commits
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
      MESSAGE="Pulling $OUTPUT..." ; blue_echo
      git pull
      echo
    fi
  done
  cd "$CWD"
}

# Misc Shortcuts
function locate() # Find the location of a file in a specified folder (locate ~ text.txt)
{
  find "$1" -name "$2" -print
}

# Add your own stuff below
