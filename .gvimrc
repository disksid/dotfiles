"gui
" ツールバーを削除
set guioptions-=T
" メニューを削除
set guioptions-=m

" ビープ音すべてを無効にする
set visualbell t_vb=
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

if has('win32')
  set transparency=240
  set guifont=Migu_1M:h10
  set guifontwide=Migu_1M:h10
else
  set guifont=Migu\ 1M\ 10.5
  set guifontwide=Migu\ 1M\ 10.5
endif

colorscheme molokai
