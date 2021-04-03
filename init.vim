 " Vi互換モードをオフ（Vimの拡張機能を有効）
 set nocompatible

 " undoを生成しない
 set noundofile

 " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
 filetype indent plugin on

 " 色づけをオン
 syntax on

 " Space+ドットで.vimrcを開く
 nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden

 " カーソル
 set guicursor=

 " コマンドライン補完を便利に
 set wildmenu

 " タイプ途中のコマンドを画面最下行に表示
 set showcmd

 " Vimの外部で変更されたことが判明したとき、自動的に読み直す
 set autoread

 " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
 set hlsearch

 " 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
 " 混在しているときは区別する
 set ignorecase
 set smartcase

 " オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする
 set backspace=indent,eol,start

 " インデント
 set autoindent smartindent
 set expandtab
 set tabstop=2
 set softtabstop=2
 set shiftwidth=2
 au FileType go setlocal sw=4 ts=4 noet
 set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

 " タブ削除
 nnoremap bd :bd<CR>

 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline

 " ウガンダを消す
 set shortmess+=I

 " ステータスラインを表示する
 set laststatus=2

 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
 set confirm

 " 全モードでマウスを有効化
 set mouse=a

 " コマンドラインの高さを2行に
 set cmdheight=2

 " 行番号を表示
 set number

 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=50

 " Yの動作をDやCと同じにする
 map Y y$

 " クリップボード保持
 set clipboard+=unnamedplus

 " <C-L>で検索後の強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>

 " バックアップファイルの生成を行わない
 set nobackup

 " エンコード設定
 set encoding=utf-8
 set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,sjis

 " スワップファイルの生成を行わない
 set noswapfile

 " 編集中のファイルをリネームする
 command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

 " IMEを勝手に切り替えない
 set iminsert=0
 set imsearch=0

 " ウインドウ分割関連
 nnoremap sk <C-w>j
 nnoremap sl <C-w>l
 nnoremap sh <C-w>h
 nnoremap ss :<C-u>sp<CR><C-w>j
 nnoremap sv :<C-u>vs<CR><C-w>l

 " dein.vim 関連 {{{
 " インストールディレクトリの指定 {{{
 let s:dein_dir = expand('~/.config/nvim/.cache/dein')
 let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 " }}}

 "  deinがインストールされているか確認 {{{
 if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
 " }}}

 " deinの読み込み開始 {{{
 if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .tomlファイルの場所
  let s:rc_dir = expand('~/.config/nvim/')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " .tomlファイルを読み込む
  call dein#load_toml(s:toml, {'lazy': 0})

  " 終了
  call dein#end()
  call dein#save_state()
endif
" }}}

 " プラグインが不足していればインストールする {{{
 if dein#check_install()
  call dein#install()
endif
 " }}}

 " .tomlファイルに記述されていないプラグインを削除する {{{
 let s:removed_plugins = dein#check_clean()
  if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
 " }}}

  " 発色
 set termguicolors

 " カラースキームの設定
 colorscheme horizon

 " 従来のモード表示をOFFにする
 set noshowmode

 " ファイル認識機能を再起動
 filetype indent plugin on
