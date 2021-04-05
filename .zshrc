# Preztoにぶん投げ
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# 上位階層に移動するコマンド
function up(){ cpath=./; for i in `seq 1 1 $1`; do cpath=$cpath../; done; cd $cpath;}

# デフォルトエディタをVimにする
export EDITOR=nvim
alias sudo='sudo -E '
alias v=nvim
alias vim=nvim

# paruを短縮する
alias poo=paru

# exaをls代わりにする
alias ls=exa

# fzf関連
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'

# 履歴関連
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
