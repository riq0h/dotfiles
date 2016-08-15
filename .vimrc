 " Vi互換モードをオフ（Vimの拡張機能を有効）
 set nocompatible
 
 " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
 filetype indent plugin on
 
 " 色づけをオン
 syntax on

 " Space+ドットで.vimrcを開く
 nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden
 
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
 
 " オートインデント、改行、インサートモード開始直後にバックスペースキーで
 " 削除できるようにする。
 set backspace=indent,eol,start
 
 " オートインデント
 set autoindent smartindent
 
 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline
 
 " 左右のスクロールバーを非表示にする
 set guioptions-=r
 set guioptions-=R
 set guioptions-=l
 set guioptions-=L

 " ツールバーを非表示にする
 set guioptions-=T

 " メニューバーを非表示にする
 set guioptions-=m

 " ステータスラインを表示する
 set laststatus=2

 "フォント
 set guifont=Ricty:h14
 
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
 " かどうか確認を求める
 set confirm
 
 " 全モードでマウスを有効化
 set mouse=a
 
 " コマンドラインの高さを2行に
 set cmdheight=2
 
 " 行番号を表示
 set number
 
 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=200
 
 " <F11>キーで'paste'と'nopaste'を切り替える
 set pastetoggle=<F11>
 
 " タブ文字の代わりにスペース2個を使う場合の設定。
 " この場合、'tabstop'はデフォルトの8から変えない。
 set shiftwidth=2
 set softtabstop=2
 set expandtab

 " Yの動作をDやCと同じにする
 map Y y$

 " <C-L>で検索後の強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>

 " バックアップファイルの生成を行わない
 set nobackup

 " エンコード設定
 set fileencoding=japan
 set fileencodings=utf-8,iso-2022-jpm,euc-jp,ucs-2le,ucs-2,cp932

 " スワップファイルの生成を行わない
 set noswapfile

 " 編集中のファイルをリネームする
 command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

 " neocompleteの常時有効化
 let g:neocomplete#enable_at_startup = 1

 " 日本語用設定
 if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
 endif
 if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
 endif

 " IMEを勝手に切り替えない
 set iminsert=0
 set imsearch=0

 " Neobundleの設定
 let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

 " カラースキームの設定
 colorscheme molokai

 " lightlineの設定
 let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

 function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
 endfunction

 function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
 endfunction

 function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
 endfunction

 function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
 endfunction

 function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
 endfunction

 function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
 endfunction

 function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
 endfunction

 function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
 endfunction

 " 従来のモード表示をOFFにする
 set noshowmode
 
 " ファイル認識機能を再起動
 filetype indent plugin on
