"編集後リロードする
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
augroup END

"status line
set laststatus=2
set statusline&
set statusline+=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&fileformat}]\[ENC=%{&fileencoding}]\[ROW=%l/%L]\[COLUMN=%c]

"font
if has('win32')
	set guifont=MS_Gothic:h10
	set viminfo+=nC:/tools/vim/_viminfo
endif

"window size
"set lines=34
"set columns=130
winpos 0 0
if has("gui_running")
  set lines=100 columns=150
  "set lines=999 columns=999
endif 
"option
set number
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
if has('win32')
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

"open .vimrc
"nnoremap <space>. :tab split $MYVIMRC<CR>
nnoremap <space>. :tab split ~/.vim/.vimrc<CR>
nnoremap <space>, :source ~/.vim/.vimrc<CR>


"global
map <C-g> :Gtags -g 
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>zz
map <C-p> :cp<CR>zz

let g:netrw_localcopycmd = ''
