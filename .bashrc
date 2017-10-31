# --------------------------------------------------------------
# General Setting
# --------------------------------------------------------------

# bashの履歴件数
HISTSIZE=50000

# historyコマンドの実行日時書式
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# --------------------------------------------------------------
# Command Alias
# --------------------------------------------------------------

alias dc='docker-compose'
alias t='tmux'
alias ll='ls -la'
#alias vim='/usr/local/Cellar/vim/7.4.161/bin/vim'
alias be='bundle exec'

# --------------------------------------------------------------
# Console
# --------------------------------------------------------------

export PATH=/usr/local/bin:/usr/local/bin/bin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git Branch Display Setting
# Require bash completion
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# --------------------------------------------------------------
# Programming Languages
# --------------------------------------------------------------

# rbenv & phpenv
#export PATH=$HOME/.rbenv/bin:$PATH
#eval "$(rbenv init -)"

# go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# peco
export HISTCONTROL="ignoredups"
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD

    if type osascript > /dev/null 2>&1 ; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    # echo $CMD >&2
    # eval $CMD
  else
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}
bind '"\C-r":"peco-history\n"'

# npm
NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias g='cd $(ghq root)/$(ghq list | peco)'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ref: http://phpbrew.github.io/phpbrew/
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
