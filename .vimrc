if !has('gui_running')
  set t_Co=256
endif

if has('vim_starting')
  " Be iMproved
  set nocompatible

  if isdirectory($HOME)
    if !isdirectory($HOME . '/.vim')
      call mkdir($HOME . '/.vim', 'p')
    endif

    if !isdirectory($HOME . '/.vim/bundle')
      let git_clone_neobundle = 'git clone https://github.com/Shougo/neobundle.vim.git'
      call mkdir($HOME . '/.vim/bundle', 'p')
      call system(git_clone_neobundle . ' ' . $HOME . '/.vim/bundle/neobundle.vim')
    endif

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
endif

runtime macros/matchit.vim

" ------------------------------------------------------------------------------
" NeoBundle
" ==============================================================================
" Required
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
" ------------------------------------------------------------------------------
if has('win32') && has('kaoriya')
  " KaoriYa
else
  NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \ }}
endif

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'h1mesuke/unite-outline'

if has('lua')
  NeoBundle 'Shougo/neocomplete'
  let g:neocomplete#enable_at_startup = 1

  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endif

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'

" Colorschemes
NeoBundle 'tomasr/molokai'

" ------------------------------------------------------------------------------
call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme molokai
" ------------------------------------------------------------------------------
" Settings
" ==============================================================================
" 構文ハイライトを有効にする
syntax enable
" ビープ音すべてを無効にする
set visualbell t_vb=
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドライン履歴の保存件数
set history=1000
" 無名レジスタに入るデータを、*レジスタにも入れる。
set clipboard+=unnamed
" 描画速度重視
set lazyredraw

" File
" ------------------------------------------------------------------------------
" 未保存時、終了前に保存確認 (no~:無効)
set confirm
" 未保存時でも別のファイルを開くことが出来る (no~:無効)
set hidden
" 外部でファイルに変更がされた場合は読みなおす (no~:無効)
set autoread
" バックアップファイルを作成する (no~:無効)
set nobackup
" ファイル編集中にスワップファイルを作成する (no~:無効)
set noswapfile
" アンドゥファイルを作成する (no~:無効)
set noundofile

" View
" ------------------------------------------------------------------------------
" 行番号を非表示 (no~:無効)
set number
" ルーラーを表示 (no~:無効)
set ruler
" タブや改行を表示 (no~:無効)
set list
" どの文字でタブや改行を表示するか
set listchars=tab:>-,precedes:\|,extends:\|,trail:_,eol:~
" 長い行を折り返して表示 (no~:無効)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示 (no~:無効)
set showcmd
" タイトルを表示 (no~:無効)
set title
" カーソル行の背景色を変える (no~:無効)
set cursorline
" カーソル位置の縦一桁(カラム)の背景色を変える (no~:無効)
set nocursorcolumn

" Move
" ------------------------------------------------------------------------------
" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]
" 上下スクロール時の視界を確保
set scrolloff=8
" 左右スクロール時の視界を確保
set sidescrolloff=16
" 左右スクロールは一文字づつ行う
set sidescroll=1

" Edit
" ------------------------------------------------------------------------------
" タブ展開 (no~:展開しない)
set noexpandtab
" タブ幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" インデント幅
set shiftwidth=4
" 自動的にインデントする (no~:インデントしない)
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する (no~:無効)
set smartindent
" Cプログラムファイルの自動インデントを行う (no~:無効)
set nocindent
" バックスペースでインデントや改行を削除する
set backspace=indent,eol,start
" 括弧入力時に対応する括弧を表示 (no~:無効)
set showmatch
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" Find/Replace
" ------------------------------------------------------------------------------
" 大文字小文字を区別しない (no~:無効)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別する (no~:無効)
set nosmartcase
" 検索文字列をハイライトする (no~:無効)
set hlsearch
" インクリメンタルサーチを行う (no~:無効)
set incsearch
" 最後尾まで検索を終えたら次の検索で先頭に戻る (no~:無効)
set wrapscan
" 置換の時、gオプションをデフォルトで有効にする (no~:無効)
set gdefault

" ------------------------------------------------------------------------------
" Keymaps
" ==============================================================================
nnoremap	<C-c><C-c>	:<C-u>nohlsearch<CR><Esc>
