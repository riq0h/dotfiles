# Preztoにぶん投げ
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf.zshの読み込み
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

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
export FZF_TMUX="1"
export FZF_TMUX_OPTS="-p 50%"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window=border-sharp,down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --iglob "!**/.git/*"'
export FZF_DEFAULT_OPTS="--ansi --no-separator --no-scrollbar --reverse --border=none \
--color=bg+:#1c1e26,bg:#1c1e26,spinner:#ee64ac,hl:#e95678 \
--color=fg:#d5d8da,header:#e95678,info:#e95678,pointer:#ee64ac \
--color=marker:#ee64ac,fg+:#d5d8da,prompt:#e95678,hl+:#e95678"
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --iglob "!**.git/*"'
export FZF_CTRL_T_OPTS="--preview 'bat  --color=always --style=plain --line-range :100 {}' --preview-window=border-sharp,down:70%"
export FZF_ALT_C_OPTS="--preview 'exa {} -h -T -F --no-user --no-time --no-filesize --no-permissions --long | head -200' --preview-window=border-sharp,hidden:down:70% --bind '?:toggle-preview'"
export RUNEWIDTH_EASTASIAN=0
bindkey '^[t' fzf-file-widget
bindkey '^[r' fzf-history-widget

fadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf-tmux -p 30% --multi --exit-0 --expect=ctrl-d); do
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

fv() {
  local file
  file=$(
         rg --files --hidden --follow --glob "!**/.git/*" | fzf-tmux -p 50% \
             --preview 'bat  --color=always --style=plain {}' --preview-window=border-sharp,down:70%
     )
  v "$file"
}

# tmux関連
alias tx="tmuximum"
if [ -z $TMUX ]; then
  tmuximum
fi

alias ta='tmux attach'

if [[ -n ${TMUX-} ]];then
    export TERM=tmux-256color
fi

# 履歴関連
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
