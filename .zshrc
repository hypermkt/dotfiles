# -------------------------------------------------------------------
# Homebrew の設定
# -------------------------------------------------------------------
# Apple Silicon (M1/M2/M3) Mac の場合、brewコマンドを使えるようにパスを通す
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -------------------------------------------------------------------
# エイリアス (ショートカット)
# -------------------------------------------------------------------
alias dc='docker compose'
alias be='bundle exec'
alias ll='ls -laG' # -G: macOSのlsで色分けを表示
alias vim='nvim'   # vim と打っても neovim を起動
alias vi='nvim'    # vi と打っても neovim を起動
# ghqで管理しているリポジトリにfzfで絞り込んで移動
alias g='cd $(ghq list -p | fzf --reverse --prompt="Repositories > ")'

# -------------------------------------------------------------------
# 言語・環境ツールの設定
# -------------------------------------------------------------------
# rbenv (Rubyのバージョン管理) の初期化
if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# 言語設定 (日本語UTF-8)
export LANG="ja_JP.UTF-8"

# -------------------------------------------------------------------
# Git プロンプト表示
# -------------------------------------------------------------------
# カレントディレクトリがGit管理下なら、ブランチ名などを表示するスクリプトを読み込む
if [ -f ~/.zsh/git-prompt.sh ]; then
  source ~/.zsh/git-prompt.sh
fi

# プロンプト内のGit表示オプション
GIT_PS1_SHOWDIRTYSTATE=true      # 変更がある場合に記号を表示
GIT_PS1_SHOWUNTRACKEDFILES=true # 未追跡ファイルがある場合に記号を表示
GIT_PS1_SHOWSTASHSTATE=true     # スタッシュがある場合に記号を表示
GIT_PS1_SHOWUPSTREAM=auto       # 上流ブランチとの差分を表示

# プロンプトの見た目設定
# %F{color} は色指定、%nはユーザ名、%mはホスト名、%~はカレントディレクトリ
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# -------------------------------------------------------------------
# 補完設定
# -------------------------------------------------------------------
# コマンドのタブ補完を有効にする
autoload -Uz compinit && compinit

# -------------------------------------------------------------------
# 履歴設定 (History)
# -------------------------------------------------------------------
export HISTFILE=$HOME/.zsh_history # 履歴を保存するファイル
export HISTSIZE=100000             # メモリ上に保持する履歴数
export SAVEHIST=100000             # ファイルに保存する履歴数

setopt hist_expire_dups_first # 履歴が一杯になったら重複したものから消す
setopt hist_ignore_all_dups   # 重複するコマンドは古い方を削除
setopt hist_ignore_dups       # 直前と同じコマンドは履歴に残さない
setopt hist_save_no_dups      # ファイル保存時に重複を排除
setopt share_history          # 複数の端末間で履歴を共有する

# -------------------------------------------------------------------
# fzf を使った履歴検索 (Ctrl+r)
# -------------------------------------------------------------------
function select-history() {
  # 過去の履歴を逆順で表示し、fzfで絞り込んで選択
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER} # カーソルを選択した行の末尾に移動
}
zle -N select-history
bindkey '^r' select-history # Ctrl+r に割り当て
