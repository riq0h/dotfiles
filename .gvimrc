 " ウインドウのサイズ
 set lines=30
 set columns=100

 " ビープ音とビジュアルベルを無効化する
 set visualbell t_vb=
 set noerrorbells

 " ウガンダを消す
 set shortmess+=I

 " クリップボード共有
 if has('gui') || has('xterm_clipboard')
   set clipboard=unnamed
 endif
