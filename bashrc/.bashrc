# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#export JAVA_HOME=/home/tongust/software/jdk1.8.0_121
#export PATH=$PATH:/home/tongust/software/jdk1.8.0.0_121/bin
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias tp='top -u tongust'
alias les='less -S'
alias le='less -SN'
alias vb='vi ~/.bashrc'
alias vs='source ~/.bashrc'
alias du='du -h --max-depth=1'
alias wl='wc -l'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lll='ll -h'
alias py='python '
alias cpHf2Sf='sh /home/tongust/software/script/cpHost2Serve.sh '
alias cpHd2Sd='sh /home/tongust/software/script/cpHostdir2Servedir.sh '
alias cpSf2Hf='sh /home/tongust/software/script/cpServe2Host.sh '
alias cpSd2Hd='sh /home/tongust/software/script/cpServedir2Hostdir.sh '
alias loginserve='sh /home/tongust/loginseu.sh'
alias sbwt='cd ~/Program/cpp/sbwt/sbwa/'
alias sbwtIndex='cd ~/Program/cpp/sbwt/sbwa-buildIndex/'
alias clc='tput reset'
alias notebook='cd ~/Desktop/notebook/'
alias notecpp='cd ~/Desktop/notebook/cpp/;vi cpp.tex'
alias notevi='cd ~/Desktop/notebook/vim/;vi vim.tex'
alias notelinux='cd ~/Desktop/notebook/linux/;vi linux.tex'
alias notelatex='cd ~/Desktop/notebook/latex/;vi latex.tex'
alias vibash='vi ~/.bashrc'
alias srcbash='source ~/.bashrc'
alias notepython='cd ~/Desktop/notebook/python/;vi python.tex'
alias mltitanic='cd /home/tongust/Desktop/kaggle/titanic/script;jupyter notebook;xdg-open http://localhost:8888/notebooks/Desktop/kaggle/titanic/script/main.ipynb'
alias renetwork='sudo service network-manager restart'
alias program='cd /home/tongust/Desktop/programming'
alias ipythonspark='ipython=1 IPYTHON_OPTS=--\"pylab\" /opt/spark/spark-1.6.0/bin/pyspark'
alias tlpi='cd /home/tongust/Desktop/notebook/books/tlpi'
alias esl='cd /home/tongust/Desktop/notebook/books/esl/'
alias g++11='g++ -std=c++11 -o main'
alias linkexternal='/home/tongust/software/ngrok tcp 22'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#export SCALA_HOME=/usr/local/src/scala/scala-2.10.4
#export PATH=$SCALA_HOME/bin:$PATH
export JAVA_HOME=/opt/jvm/jdk1.8.0_121
export JRE_HOME=${JAVA_HOME}/jre  
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH  
  
export SCALA_HOME=/opt/scala/scala-2.10.6  
export PATH=${SCALA_HOME}/bin:$PATH  
  
export SPARK_HOME=/opt/spark/spark-1.6.0  
  
export PYTHONPATH=/opt/spark/spark-1.6.0/python
# Add CUDA bin & library paths:
export PATH=/usr/local/cuda/bin:/opt/scala/scala-2.10.6/bin:/opt/jvm/jdk1.8.0_121/bin:/opt/jvm/jdk1.8.0_121/jre/bin:/opt/scala/scala-2.10.6/bin:/opt/jvm/jdk1.8.0_121/bin:/opt/jvm/jdk1.8.0_121/jre/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/tongust/software/jdk1.8.0.0_121/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/lib:$LD_LIBRARY_PATH
export PYTHONPATH=~/Downloads/caffe/python/:/opt/spark/spark-1.6.0/python
export LD_LIBRARY_PATH=/home/tongust/lib/archive:/home/tongust/lib/share:$LD_LIBRARY_PATH
#export COMPILER_PATH=/home/tongust/Desktop/notebook/books/tlpi/tlpi-dist/lib:$COMPILER_PATH

#################################
#
# prompt style and ls colors
#
#################################
export PS1="\\[\e[0;32m[\\]\u \t]\w\$ \\[\e[m\\]"
# Colors ls colors
LS_COLORS='di=1;31:fi=32:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=93:*.rpm=90'
export LS_COLORS
#di = directory
#fi = file
#ln = symbolic link
#pi = fifo file
#so = socket file
#bd = block (buffered) special file
#cd = character (unbuffered) special file
#or = symbolic link pointing to a non-existent file (orphan)
#mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
#ex = file which is executable (ie. has 'x' set in permissions).
# color id
# 0   = default colour
# 1   = bold
# 4   = underlined
# 5   = flashing text
# 7   = reverse field
# 31  = red
# 32  = green
# 33  = orange
# 34  = blue
# 35  = purple
# 36  = cyan
# 37  = grey
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = orange background
# 44  = blue background
# 45  = purple background
# 46  = cyan background
# 47  = grey background
# 90  = dark grey
# 91  = light red
# 92  = light green
# 93  = yellow
# 94  = light blue
# 95  = light purple
# 96  = turquoise
# 100 = dark grey background
# 101 = light red background
# 102 = light green background
# 103 = yellow background
# 104 = light blue background
# 105 = light purple background
# 106 = turquoise background
