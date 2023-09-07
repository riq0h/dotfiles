# Preztoにぶん投げ
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# 上位階層に移動するコマンド
alias a='cd ../'
alias aa='cd ../../'
alias aaa='cd ../../../'

# デフォルトエディタをVimにする
export EDITOR=nvim
alias sudo='sudo -E '
alias v=nvim
alias vim=nvim

# paruを短縮する
alias poo=paru

# ezaをls代わりにする
alias ls='eza --icons -a'
alias lsa='eza --icons -T -a'

# batをcatの代わりにする
alias cat=bat

# clearを短縮する
alias cls=clear

# 天気情報
alias wttr='() { curl -H "Accept-Language: ${LANG%_ja}" wttr.in/"${1:-Saitama}" }'

# BAT関連
export BAT_THEME="TwoDark"

# Zoxide関連
eval "$(zoxide init zsh)"
zle -N zi
bindkey '^z' zi

# Tailscale関連
alias tlsc='sudo tailscale up --exit-node-allow-lan-access --exit-node=mystech'
alias tlscd='sudo tailscale down'

# fzf関連
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --border=none'

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!**/.git/*"'
export FZF_CTRL_T_OPTS="
    --preview 'bat  --color=always --style=header,grid {}'
    --preview-window=right:60%"

fadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf-tmux --multi --exit-0 --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    n=$[$(wc -l <<< "$out") - 1]
    addfiles=(`echo $(tail "-$n" <<< "$out")`)
    [[ -z "$addfiles" ]] && continue
    if [ "$q" = ctrl-d ]; then
      git diff --color=always $addfiles | less -R
    else
      git add $addfiles
    fi
  done
}

rga-fzf() {
RG_PREFIX="rga --files-with-matches"
local file
file="$(
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
        fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
            --phony -q "$1" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window="70%:wrap"
)" &&
echo "opening $file" &&
xdg-open "$file"
}

# tmux関連
alias tx="tmuximum"
if [ -z $TMUX ]; then
  tmuximum
fi

# 履歴関連
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
