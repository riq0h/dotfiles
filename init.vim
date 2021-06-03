 " ヘルプ日本語化
 set helplang=ja,en

 " undoを生成しない
 set noundofile

 "  Leaderキーの再定義
 let mapleader = "\<Space>"

 " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
 filetype indent plugin on

 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden

 " カーソル
 set guicursor=

 " カーソルライン
 set cursorline

 " コマンドライン補完を便利に
 set wildmenu

 " タイプ途中のコマンドを画面最下行に表示
 set showcmd

 " Vimの外部で変更されたことが判明したとき、自動的に読み直す
 set autoread

 " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
 set hlsearch

 " 検索時に大文字・小文字を区別しない。検索後に大文字小文字が混在しているときは区別する
 set ignorecase
 set smartcase

 " オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする
 set backspace=indent,eol,start

 " 編集魔法速攻召喚
 nnoremap ew :<C-u>w<CR>
 nnoremap eW :<C-w>wq<CR>
 nnoremap eq :<C-u>quit<CR>
 nnoremap eQ :<C-u>quit!<CR>
 nnoremap ec :<C-u>close<CR>
 nnoremap eC :<C-u>close!<CR>
 nnoremap eo :<C-u>only<CR>
 nnoremap <C-s> :<C-u>%s///cg<Left><Left><Left><Left>

 " インデント
 set autoindent
 set tabstop=8
 set softtabstop=4
 set shiftwidth=4
 set noexpandtab
 set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

 " 常に新しいタブで開く
 function OpenFilesToTabs()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
       execute 'b # | tabnew | blast | bp'
     endif
 endfunction
 autocmd BufNewFile,BufRead * :call OpenFilesToTabs()

 " タブ関連
 nnoremap td :bd<CR>
 nnoremap tt :<C-u>tabnew<CR>
 nnoremap t1 :<C-u>tabnext1<CR>
 nnoremap t2 :<C-u>tabnext2<CR>
 nnoremap t3 :<C-u>tabnext3<CR>
 nnoremap t4 :<C-u>tabnext4<CR>
 nnoremap t5 :<C-u>tabnext5<CR>
 nnoremap t6 :<C-u>tabnext6<CR>
 nnoremap t7 :<C-u>tabnext7<CR>
 nnoremap t8 :<C-u>tabnext8<CR>
 nnoremap t9 :<C-u>tabnext9<CR>

 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline

 " ウガンダ君さようなら（寄付はした）
 set shortmess+=I

 " ミドルクリック抹殺
 map <MiddleMouse>   <Nop>
 map <2-MiddleMouse> <Nop>
 map <3-MiddleMouse> <Nop>
 map <4-MiddleMouse> <Nop>
 imap <MiddleMouse>   <Nop>
 imap <2-MiddleMouse> <Nop>
 imap <3-MiddleMouse> <Nop>
 imap <4-MiddleMouse> <Nop>

 " 表示行移動優先
 nnoremap k gk
 nnoremap <Up> gk
 inoremap <Up> <C-o>gk
 nnoremap j gj
 nnoremap <Down> gj
 inoremap <Down> <C-o>gj

 " 挿入モード時の移動
 inoremap <C-a> <C-o>^
 inoremap <C-e> <C-o>$
 inoremap <C-f> <C-o>w
 inoremap <C-b> <C-o>b
 inoremap <C-d> <C-o>x
 inoremap <C-h> <C-o>h
 inoremap <C-j> <C-o>gj
 inoremap <C-k> <C-o>gk
 inoremap <C-l> <C-o>l

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
 set notimeout ttimeout ttimeoutlen=10

 " Yの動作をDやCと同じにする
 map Y y$

 " クリップボード保持
 set clipboard+=unnamedplus

 " <C-X>で検索後の強調表示を解除する
 nnoremap <C-X> :nohl<CR><C-X>

 " バックアップファイルの生成を行わない
 set nobackup

 " エンコード設定
 set encoding=utf-8
 set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,sjis

 " スワップファイルの生成を行わない
 set noswapfile

 " 編集中のファイルをリネームする
 command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

 " ウインドウ分割
 nnoremap ss :<C-u>sp<CR><C-w>j
 nnoremap sv :<C-u>vs<CR><C-w>l

 " ウインドウリサイズ
 nnoremap <S-Left>  <C-w><<CR>
 nnoremap <S-Right> <C-w>><CR>
 nnoremap <S-Up>    <C-w>-<CR>
 nnoremap <S-Down>  <C-w>+<CR>

 " ウインドウ間の移動
 nnoremap sh <C-w>h
 nnoremap sj <C-w>j
 nnoremap sk <C-w>k
 nnoremap sl <C-w>l
 nnoremap sH <C-w>H
 nnoremap sJ <C-w>J
 nnoremap sK <C-w>K
 nnoremap sL <C-w>L

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

 " 標準プラグインの無効化
 let g:loaded_gzip              = 1
 let g:loaded_tar               = 1
 let g:loaded_tarPlugin         = 1
 let g:loaded_zip               = 1
 let g:loaded_zipPlugin         = 1
 let g:loaded_rrhelper          = 1
 let g:loaded_2html_plugin      = 1
 let g:loaded_vimball           = 1
 let g:loaded_vimballPlugin     = 1
 let g:loaded_getscript         = 1
 let g:loaded_getscriptPlugin   = 1
 let g:loaded_netrw             = 1
 let g:loaded_netrwPlugin       = 1
 let g:loaded_netrwSettings     = 1
 let g:loaded_netrwFileHandlers = 1

 " 発色
 set termguicolors

 " カラースキームの設定
 colorscheme horizon

 " 従来のモード表示をOFFにする
 set noshowmode

 " ファイル認識機能を再起動
 filetype indent plugin on

 " ハイライト
 syntax on
