alias df='df -h'
alias du='du -h'

alias less='less -r'                          # raw control characters

alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias ls='ls --color=auto'
#alias ls='ls -hF --color=tty'                # classify files in colour
alias lla='ls -lha'
alias ll='ls -lh'                             # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export LANG=en_US.UTF-8
#export LANG=zh_CN.UTF-8

#export PS1='[\[\e[35;1m\]\u@\[\e[34;1m\]Windows\[\e[32;1m\] \t \[\e[31;1m\]\w\[\e[0m\]]# '
export PS1='[\[\e[32;1m\]\w\[\e[0m\]] \n\[\e[33;1m\][\u] \[\e[31;1m\]>>\[\e[0m\] '

export HISTTIMEFORMAT="`whoami` %F %T "
export HISTFILESIZE=1000000
export HISTSIZE=10000
shopt -s histappend
ulimit -HSc unlimited
ulimit -HSn 65535

