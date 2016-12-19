export GPG_TTY=$(tty)

# export PS1="\e[1;36m\u@\h \W\$ \e[m"
export GOPATH=/Users/nrobinson/go/
export PS1="\[$(tput setaf 6)\]\[$(tput bold)\]\u\[$(tput sgr0)\]\[$(tput setaf 5)\]\[$(tput bold)\]@\[$(tput setaf 7)\]\[$(tput bold)\]\h:\[$(tput sgr0)\]\[$(tput setaf 4)\]\[$(tput bold)\]\w $ \[$(tput sgr0)\]"
export EDITOR="nano"
export SLACK_TOKEN='xoxp-11357575927-11361594817-23218270899-e32b2902c8'

alias bash='/usr/local/Cellar/bash/4.4.5/bin/bash'
alias spark="particle"
alias ls="ls -G"
alias la="ls -laG"
alias lh="ls -laGh"
alias l="ls"

alias update="~/auto-git.sh"
alias pull="git pull"
alias ..="cd .."
alias c="clear"
alias cls="c && ls"
alias n="nano"
alias ca='cat'
alias p='particle'
alias py='python'
alias htop='sudo htop'
alias sf='screenfetch'
alias ip='ipconfig getifaddr en0'
alias home='cd && clear && ls'
alias atom='open -a Atom'
alias chrome='open -a Google\ Chrome'
alias photon-update='sudo npm update -g particle-cli && particle update'

alias mint="ssh mint-desktop.local"

alias slack="node ~/terminal-slack/main.js"
alias grep="grep --color=auto"
alias weather="curl http://wttr.in/london"
alias miner="ssh pi@10.0.1.253"

alias elup="~/elup.sh"

function console {
  modem=`ls -1 /dev/cu.* | grep -vi bluetooth | tail -1`
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    screen "$modem" "$baud"
  else
    echo "No USB modem device found in /dev"
  fi
}

alias wemo="curl -X POST https://maker.ifttt.com/trigger/wemo/with/key/i3rKE17tzk8GHiiGNLv8i0NFmq4CBxJ06rc9ugHyADV"

export PARTICLE_DEVELOP=1

alias new="open -a 'Terminal' ."
alias yt="youtube-dl -x  --audio-format='mp3'"
alias p="particle"
