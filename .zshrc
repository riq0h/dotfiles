# Preztoにぶん投げ
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf.zshの読み込み
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ロケール
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# 上位階層に移動するコマンド
alias a="cd ../"
alias aa="cd ../../"
alias aaa="cd ../../../"

# デフォルトエディタをVimにする
export EDITOR=nvim
alias v=nvim
alias vim=nvim

# paruを短縮する
alias poo=paru

# gitの短縮
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gr="git rebase"
alias gl="git log"

# ezaをls代わりにする
alias ls="eza --icons --color=never -a"
alias lsl="eza --icons --color=never -la"
alias lsa="eza --icons --color=never -T -a"

# batをcatの代わりにする
alias cat="bat --color=always --style=plain"

# clearを短縮する
alias cls=clear

# 天気情報
alias wttr="() { curl -H 'Accept-Language: ${LANG%_ja}' wttr.in/'${1:-Tokyo}' }"

# BAT関連
export BAT_THEME="ansi"

# Zoxide関連
eval "$(zoxide init zsh)"
zle -N zi
bindkey "^z" zi
alias zv="zi && nvim"

# Tailscale関連
alias tlsc="sudo tailscale up --exit-node=mystech --exit-node-allow-lan-access --ssh"
alias tlscd="sudo tailscale down"

# fzf関連
export FZF_TMUX="1"
export FZF_TMUX_OPTS="-p 50%"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window=border-sharp,down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND="rg --files --hidden 2> /dev/null --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS="--ansi --height 40% --no-separator --no-scrollbar --reverse --border=none \
  --color=bg+:#272e33,bg:#272e33,spinner:#a7c080,hl:#a7c080 \
--color=fg:#d3c6aa,header:#a7c080,info:#a7c080,pointer:#a7c080 \
--color=marker:#a7c080,fg+:#d3c6aa,prompt:#e67e80,hl+:#a7c080"
export FZF_CTRL_T_COMMAND="rg --files --hidden 2> /dev/null --follow --glob '!.git/*'"
export FZF_CTRL_T_OPTS="--preview 'bat  --color=always --style=plain --line-range :100 {}' --preview-window=border-sharp,right:60%"
export FZF_ALT_C_COMMAND="fd -t d --hidden"
export FZF_ALT_C_OPTS="--preview 'eza {} -h -T -F --no-user --no-time --no-filesize --no-permissions --long | head -200' --preview-window=border-sharp,hidden:right:60% --bind '?:toggle-preview'"
export RUNEWIDTH_EASTASIAN=0
bindkey "^[t" fzf-file-widget
bindkey "^[r" fzf-history-widget
bindkey -r "^T"
bindkey -r "^R"

fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fv() {
  IFS=$'\n' files=($(fzf --height 50% --preview 'bat  --color=always --style=plain {}' --preview-window=border-sharp,right:60% --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  zsh
}

fadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf --height 30% --multi --exit-0 --expect=ctrl-d); do
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

fman() {
    man -k . | fzf --height 50% -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' --preview-window=border-sharp,right:60% --bind '?:toggle-preview' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

# mise
eval "$(mise activate zsh)"

# 履歴関連
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
