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

 " ウガンダを消す
 set shortmess+=I

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
 set encoding=utf-8
 set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

 " スワップファイルの生成を行わない
 set noswapfile

" 編集中のファイルをリネームする
 command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

 " IMEを勝手に切り替えない
 set iminsert=0
 set imsearch=0

 " dein.vimの設定
 " deinパス設定
 let s:dein_dir = fnamemodify('~/.config/nvim/', ':p') "<-お好きな場所
 let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim' "<-固定

 " dein.vim本体の存在チェックとインストール
 if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
 endif

 " dein.vim本体をランタイムパスに追加
 if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
 endif

 call dein#begin(s:dein_dir)
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('itchyny/lightline.vim')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('bronson/vim-trailing-whitespace')
 call dein#add('rhysd/accelerated-jk')
 call dein#add('cohama/lexima.vim')
 call dein#add('tomasr/molokai')

 " 必須
 call dein#end()
 filetype plugin indent on
 syntax enable

 " プラグインのインストール
 if dein#check_install()
  call dein#install()
 endif

 " ファイル保存時に余分なスペースを削除
 autocmd BufWritePre * :FixWhitespace

 " エディタの分割方向を設定する
 set splitbelow
 set splitright

 " j/kによる移動を高速化
 nmap j <plug>(accelerated_jk_gj)
 nmap k <plug>(accelerated_jk_gk)


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

 " カラースキームの設定
 colorscheme molokai

 " ファイル認識機能を再起動
 filetype indent plugin on
