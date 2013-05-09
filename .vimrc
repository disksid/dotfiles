" Be iMproved
set nocompatible

if has('gui_running') && has('win32')
  set encoding=utf-8
endif

if has('vim_starting')
  if !isdirectory($HOME . '/.vim')
    call mkdir($HOME . '/.vim', 'p')
  endif
  if !isdirectory($HOME . '/.vim/bundle')
    call mkdir($HOME . '/.vim/bundle', 'p')
    call system('git clone git://github.com/Shougo/neobundle.vim ' . $HOME . '/.vim/bundle/neobundle.vim')
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
  call neobundle#rc(expand($HOME . '/.vim/bundle'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" --------------------------------------------------------------------------
" NeoBundle
" --------------------------------------------------------------------------
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }

" 再帰的にファイルを列挙し、絞り込んで開く <C-p>
NeoBundle 'kien/ctrlp.vim'
" ファイルエクスプローラ
NeoBundle 'scrooloose/nerdtree'
" 保存時にシンタックスチェックを自動で行う
NeoBundle 'scrooloose/syntastic'

" Color Schemes
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'

" Required!
filetype plugin indent on
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" --------------------------------------------------------------------------
" 設定
" --------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized
" ビープ音すべてを無効にする
set visualbell t_vb=
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

"---------------------------------------------------------------------------
" 検索/置換の挙動に関する設定:
" --------------------------------------------------------------------------
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索文字列をハイライトする
set hlsearch
" インクリメンタルサーチを行う
set incsearch
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan
" 置換の時 g オプションをデフォルトで有効にする
set gdefault

"---------------------------------------------------------------------------
" 編集に関する設定:
" --------------------------------------------------------------------------
" タブの画面上での幅
set tabstop=2
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 自動インデント幅
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2 
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" カーソルに関する設定:
" --------------------------------------------------------------------------
" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]
" 上下8行の視界を確保
set scrolloff=8
" 左右スクロール時の視界を確保
set sidescrolloff=16
" 左右スクロールは一文字づつ行う
set sidescroll=1

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
" --------------------------------------------------------------------------
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,precedes:<,extends:>,trail:_,eol:\|
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" カーソル行の背景色を変える
set cursorline
" カーソル位置の縦一桁(カラム)の背景色を変える
set cursorcolumn
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
" --------------------------------------------------------------------------
" 保存されていないファイルがあるときは終了前に保存確認
set confirm
" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden
" 外部でファイルに変更がされた場合は読みなおす
set autoread
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" ファイル編集中にスワップファイルを作らない
set noswapfile

