if has('vim_starting')
set nocompatible               " Be iMproved

set runtimepath+=$VIM/vim74/bundle/neobundle.vim/
endif

" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

"-----------------
" plugin
"-----------------
" Required:
call neobundle#rc(expand('$VIM/vim74/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"-----------------
" vim-over
"-----------------
NeoBundle 'osyo-manga/vim-over'
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"-----------------
" indentLine
"-----------------
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|' "use |, ? or │

"-----------------
" unite
"-----------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim'
let g:unite_enable_startinsert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 50
nnoremap <silent> <space>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <space>uu :<C-u>Unite file_mru buffer<CR>

"-----------------
" restart
"-----------------
NeoBundle 'tyru/restart.vim'
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

"-----------------
" neocomplete
"-----------------
NeoBundle 'Shougo/neocomplete.vim'

"-----------------
" neocomplete
"-----------------
NeoBundle 'tpope/vim-surround.git'

NeoBundleCheck

filetype plugin on
" 画面表示の設定
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set cmdheight=1    " メッセージ表示欄を1行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
"set list           " 不可視文字を表示
" 不可視文字の表示記号指定
"set listchars=tab:?\ ,eol:?,extends:?,precedes:?

" カーソル移動関連の設定
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
"set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=1 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab

" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=2

" コマンドラインの設定
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=100

" ビープの設定
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"status line
set laststatus=2
set statusline&
set statusline+=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&fileformat}]\[ENC=%{&fileencoding}]\[ROW=%l/%L]\[COLUMN=%c]

"font
"window sizeは個別で設定する

"grep program
if has('win32')
    set grepprg=C:/MinGW/msys/1.0/bin/grep.exe\ -nHIr\ --exclude-dir=.svn
    let $PATH=expand($PATH) . ';C:\Program Files\GnuWin32\bin'
endif

"key map
nnoremap gr :grep <cword> 
"tab add
nnoremap ta :tab split<CR>
nnoremap tn :tab new<CR>
"tab switch
nnoremap ts gt
"tab delete
nnoremap td :tabc<CR>
"
nnoremap tr <C-PageUp>
nnoremap tl <C-PageDown>

"
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

"
inoremap () ()<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap <> <><Left>
inoremap {} {}<Left>

"open .vimrc
nnoremap <space>. :tab split ~/.vim/.vimrc<CR>
nnoremap <space>, :source ~/.vim/.vimrc<CR>

"global
nnoremap <C-g> :Gtags -g 
nnoremap <C-h> :Gtags -f %<CR>
nnoremap <C-j> :GtagsCursor<CR>
nnoremap <C-n> :cn<CR>zz
nnoremap <C-p> :cp<CR>zz

let g:netrw_localcopycmd = ''

