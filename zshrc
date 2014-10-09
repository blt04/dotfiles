# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh

# Don't use the gitfast plugin, because it uses its own git-completion.bash
# and we want to use the system one installed with git.
# But we do like their prompts, so include that here.
source $ZSH/plugins/gitfast/git-prompt.sh
function git_prompt_info() {
  dirty="$(parse_git_dirty)"
  __git_ps1 "${ZSH_THEME_GIT_PROMPT_PREFIX//\%/%%}%s${dirty//\%/%%}${ZSH_THEME_GIT_PROMPT_SUFFIX//\%/%%}"
}

# Allow ignoring the git prompt on certain large git repos.
# Set: git config prompt.hide true
# See https://github.com/robbyrussell/oh-my-zsh/issues/357#issuecomment-1741169
function _gitprompt {
  [ "$(git config prompt.hide)" = "true" ] && return
  echo "$(git_prompt_info)" # or whatever you use to display the git prompt
}

# My theme modifications
GIT_PS1_SHOWUPSTREAM="verbose"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%}"
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
PROMPT='%{$fg[$NCOLOR]%}%B%n${SSH_TTY:+@%m}%b%{$reset_color%}:%{$fg[blue]%}%B%3~%b%{$reset_color%}$(_gitprompt)%(!.#.$) '
unset RPROMPT

# Other customizations
unsetopt correct_all
LESS='--RAW-CONTROL-CHARS --no-init --quit-if-one-screen --ignore-case --line-numbers'

# PageUp
bindkey '^[[5~' history-beginning-search-backward
# PageDown
bindkey '^[[6~' history-beginning-search-forward

if [ -x /usr/bin/ack-grep ]; then
  alias ack='ack-grep'
fi
alias dv='dirs -v'
if ! which md5sum > /dev/null && [ -x /sbin/md5 ]; then alias md5sum='md5 -r'; fi
if ! which sha256sum > /dev/null && [ -x /usr/bin/shasum ]; then alias sha256sum='shasum -a 256'; fi

# Connect forwarded ssh agent in tmux
# See also ~/.ssh/rc
if [[ -n "$TMUX" ]] && [ -e ~/.ssh/ssh_auth_sock ]; then
  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

if [ -f ~/.zshrc-local ]; then
  . ~/.zshrc-local
fi

export EDITOR=`which vim`

# Load user or system RVM if it exists
export rvmsudo_secure_path=1
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]]; then
    source "/usr/local/rvm/scripts/rvm"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
