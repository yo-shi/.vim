if has('vim_starting')
set nocompatible               " Be iMproved
endif

"set runtimepath+=$VIM/vim74/bundle/neobundle.vim/

" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

" NeoBundle は使わない。vim80デフォルトのパッケージマネージャーに移行する
if 0
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
cnoremap uh -vertical -winwidth=70 
nmap <silent> <space>uy :Unite uh history/yank<CR>
nmap <silent> <space>ub :Unite uh buffer<CR>
nmap <silent> <space>uf :UniteWithBufferDir uh -buffer-name=files file<CR>
nmap <silent> <space>ur :Unite uh -buffer-name=register register<CR>
nmap <silent> <space>uu :Unite uh file_mru buffer<CR>

"-----------------
" restart
"-----------------
NeoBundle 'tyru/restart.vim'
let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

"-----------------
" neocomplete
"-----------------
NeoBundle 'Shougo/neocomplete.vim'

"-----------------
" neocomplete
"-----------------
NeoBundle 'tpope/vim-surround.git'

NeoBundleCheck
endif

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
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない(*~)
set noswapfile " ファイル編集中にスワップファイルを作らない(*.swp)
set noundofile " undoファイルを作らない(*.un~)
set viminfo=   " viminfoファイルを作らない

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
" コマンドラインの履歴を100件保存する
set history=100

" ビープの設定
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"status line
set laststatus=2
set statusline&
set statusline+=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&fileformat}]\[ENC=%{&fileencoding}]\[ROW=%l/%L]\[COLUMN=%c]

"key map
nnoremap gr :grep ./* -e <cword>
"tab add
nnoremap ta :tab split<CR>
nmap tn :tab new<CR><space>
"tab switch
nnoremap ts gt
"tab delete
nnoremap td :tabc<CR>
"tab right/left
nnoremap tr <C-PageUp>
nnoremap tl <C-PageDown>

"1行が折り返して表示されているとき、表示上の行移動をjkキーの動作にする
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"インサートモードでもhjklキーで移動する
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

"かっこを入力したらその中にカーソルを移動する
inoremap () ()<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap <> <><Left>
inoremap {} {}<Left>

"挿入モードからノーマルモードへ行くキーマッピング(<C-[>が使いにくいので)
inoremap <C-f> <ESC>

"挿入モードでBackSpaceの代わりに使う
inoremap <C-b> <BS>

"open .vimrc
nnoremap <space>. :tab split ~/.vim/.vimrc<CR>
nnoremap <space>, :source ~/.vim/.vimrc<CR>

"global
nnoremap <C-g> :Gtags -g 
nnoremap <C-h> :Gtags -f %<CR>
nnoremap <C-j> :GtagsCursor<CR>
nnoremap <C-n> :cn<CR>zz
nnoremap <C-p> :cp<CR>zz
nnoremap <space>n :colder<CR>
nnoremap <space>p :cnewer<CR>

let g:netrw_localcopycmd = ''

