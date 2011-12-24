# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

    PLATFORM=`uname`

    # don't put duplicate lines in the history. See bash(1) for more options
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    if [ "$TERM" == "xterm" ]; then
        export TERM=xterm-256color
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        screen-*color|xterm-*color) color_prompt=yes;;
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

    # Add __git_ps1 function if it doesn't exist
    if ! type __git_ps1 2>&1 &>/dev/null; then
        if [ -e "$HOME/.dotfiles/git-ps1.bash" ]; then
            source "$HOME/.dotfiles/git-ps1.bash"
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        if type __git_ps1 2>&1 &>/dev/null; then
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
        else
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        fi
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    screen*)
        PS1="\[\033k\u@\h:\w\033\134\]$PS1"
        ;;
    *)
        ;;
    esac

    # Disable CTRL+S terminal flow control
    stty stop undef

    # enable color support of ls and also add handy aliases
    if [ "$PLATFORM" == "Darwin" ]; then
      export CLICOLOR=1
      export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    fi
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    # some more ls aliases
    alias ll='ls -lF'
    alias la='ls -lAF'
    alias l='ls -CF'
    if [ -x /usr/bin/ack-grep ]; then
        alias ack='ack-grep'
    fi
    if [ ! `which md5sum` ]  && [ -x /sbin/md5 ]; then
        alias md5sum='md5 -r'
    fi

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
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    export DEBFULLNAME='Brandon Turner'
    export DEBEMAIL='bturner@bltweb.net'
    export EDITOR=`which vim`
    export GIT_PS1_SHOWUPSTREAM="verbose"

    # Load user or system RVM if it exists
    if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
        source "$HOME/.rvm/scripts/rvm"
    elif [[ -s "/usr/local/rvm/scripts/rvm" ]]; then
        source "/usr/local/rvm/scripts/rvm"
    fi
fi
