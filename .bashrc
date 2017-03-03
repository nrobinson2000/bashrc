#EXPORTS
export GPG_TTY=$(tty)
export GOPATH=$HOME/go/
export PS1="\[$(tput setaf 1)\]\[$(tput bold)\]\t\[$(tput sgr0)\] \[$(tput setaf 6)\]\[$(tput bold)\]\u\[$(tput sgr0)\]\[$(tput setaf 5)\]\[$(tput bold)\]@\[$(tput setaf 7)\]\[$(tput bold)\]\h:\[$(tput sgr0)\]\[$(tput setaf 4)\]\[$(tput bold)\]\w $ \[$(tput sgr0)\]"
export EDITOR="nano"

#LS
alias ls="ls -G"
alias la="ls -laG"
alias lh="ls -laGh"
alias l="ls"

#MISC
alias ..="cd .."
alias c="clear"
alias cls="c && ls"
alias n="nano"
alias ca='cat'
alias p='particle'
alias py='python'
alias htop='sudo htop'
alias sf='screenfetch'
alias neofetch="echo && neofetch"
alias ip='ipconfig getifaddr en0'
alias home='cd && clear && ls'
alias atom='open -a Atom'
alias chrome='open -a Google\ Chrome'
alias grep="grep --color=auto"

function console {
  modem=`ls -1 /dev/cu.* | grep -vi bluetooth | tail -1`
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    screen "$modem" "$baud"
  else
    echo "No USB modem device found in /dev"
  fi
}

export PARTICLE_DEVELOP=1

alias new="open -a 'Terminal' ."
alias yt="youtube-dl -x  --audio-format='mp3'"
alias p="particle"

alias get-modem="$(ls -1 /dev/cu.* | grep -vi bluetooth | tail -1)"


function locate
{
  cd $PWD
  find "$1" -name "$2" -print
}

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
