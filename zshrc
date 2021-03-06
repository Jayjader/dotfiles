# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/jayjader/go/bin:$PATH
export GOPATH=/home/jayjader/go
export CLASSPATH=~/java/*:$CLASSPATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# hide `user@hostname` in prompt if logged in as me on local machine
DEFAULT_USER='jayjader'

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
export NVM_LAZY_LOAD=true

plugins=(git common-aliases pip zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# If we're in a terminal emulator (and thus X is running), we can use gpg-agent
case $(tty) in
    /dev/pts/*)
        # Start the gpg-agent if not already running
        if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
            gpg-connect-agent /bye >/dev/null 2>&1
            echo gpg agent started
        fi
        # set ssh to use gpg-agent
        unset SSH_AGENT_PID
        if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
            export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
        fi
        ;;
esac

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Turn wifi interface on/off
alias wifiup='sudo ip link set wlp2s0 up'
alias wifidown='sudo ip link set wlp2s0 down'

# Turn netctl profiles on
alias wifiM='netctl start Manguey'
alias wifiA='netctl start Appartment'

# Restart/stop current profile
alias wifir='netctl restart $(netctl list | grep \* | cut -d " " -f2)'
alias wifis='netctl stop $(netctl list | grep \* | cut -d " " -f2)'

# Display wifi ip address
alias ipwifi='ip address show dev wlp2s0'

# Bluetooth on/off
alias btup='systemctl start bluetooth.service'
alias btdown='systemctl stop bluetooth.service'

# Always color outputs
alias ls='ls --color=auto'
alias grep='grep --color=auto -n'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=auto'

# ls
alias ll='ls -l'
alias la='ls -Al'

# Pacman
alias pacu='pacaur -Syu'
alias pacr='pacaur -R'

# pip
alias pipu='sudo pip install -U $(pip list --format=legacy | cut -d " " -f1)'
# eval "$(pipenv --completion)"

# Colored man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Change jdk version
alias jdk8='archlinux-java set java-8-openjdk'
alias jdk7='archlinux-java set java-7-openjdk'

# Misc
alias N='flashplayer ~/Documents/N/Nv2-Linux.swf &'
alias factorio='padsp ~/Documents/factorio/bin/x64/factorio &'

alias qwer='setxkbmap fr'
alias azer='setxkbmap us'
alias dvor='setxkbmap dvorak'

# OCAML / OPAM
. /home/jayjader/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
alias ocaml='rlwrap ocaml' # add readline-support to ocaml interpreter (allows scrolling up & down in command history)

