"font
if has("win32")
	set guifont=MS_Gothic:h10
	set viminfo+=nC:/tools/vim/_viminfo
endif

"window size
set lines=80
set columns=270
winpos 0 0

"option
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set nobackup
set noswapfile
set hlsearch
set incsearch

"grep program
if has("win32")
	set grepprg=grep.exe\ -nHIr\ --exclude-dir=.svn
	let $PATH=expand($PATH) . ';C:\Program Files\GnuWin32\bin'
endif

"
filetype plugin on

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
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

"
inoremap () ()<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap <> <><Left>
inoremap {} {}<Left>

"delete tab
nnoremap dt :%s/<tab>/    /g<CR>

"open .vimrc
nnoremap <space>. :tab split $MYVIMRC<CR>


"global
map <C-g> :Gtags -g 
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>zz
map <C-p> :cp<CR>zz

let g:netrw_localcopycmd = ''
