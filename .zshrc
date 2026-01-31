# alias
alias dc='docker compose'
alias be='bundle exec'
alias ll='ls -la'
alias g='cd $(ghq list -p | peco)'
alias vim='nvim'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
#fpath=(~/.zsh $fpath)
autoload -Uz compinit
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# refs: https://mogulla3.tech/articles/2021-09-06-search-command-history-with-incremental-search/
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000        # メモリ上の履歴リストに保存されるイベントの最大数
export SAVEHIST=100000        # 履歴ファイルに保存されるイベントの最大数

setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups   # 履歴が重複した場合に古い履歴を削除する
setopt hist_ignore_dups       # 前回のイベントと重複する場合、履歴に保存しない
setopt hist_save_no_dups      # 履歴ファイルに書き出す際、新しいコマンドと重複する古いコマンドは切り捨てる
setopt share_history          # 全てのセッションで履歴を共有する

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

zle -N select-history       # ZLEのウィジェットとして関数を登録
bindkey '^r' select-history # `Ctrl+r` で登録したselect-historyウィジェットを呼び出す

export LANG="ja_JP.UTF-8"
