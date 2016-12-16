
if has('unix')
	let s:uname = system('uname -s')
	" remove last non-ascii
	let s:uname = s:uname[:len(s:uname)-2]
endif
let APPLE= s:uname == "Darwin"

let mapleader = ","
let g:mapleader = ","

"---------------------
" Vundle Plugin
"---------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Tagbar'
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 20

Plugin 'a.vim'

Plugin 'thinca/vim-ref'
Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
nmap <silent> <F2> :NERDTreeTabsToggle<CR>
Plugin 'FencView.vim'
let g:fencview_autodetect=1

Plugin 'ervandew/supertab'

Plugin 'davidhalter/jedi-vim'
nmap <leader>g g:jedi#goto_assignments_command<cr>
nmap <leader>s g:jedi#goto_definitions_command<cr>

Plugin 'bogado/file-line'

Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
nmap <leader>d <Plug>DashSearch<cr>

Plugin 'Yggdroot/indentLine'

Plugin 'michalbachowski/vim-wombat256mod.git'

call vundle#end()          

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap ff <ESC>
map <C-k> <C-w><Up>            " ctrl-k 切换到上边窗口
map <C-j> <C-w><Down>          " ctrl-j 切换到下边窗口
map <C-l> <C-w><Right>         " ctrl-l 切换到右边窗口
map <C-h> <C-w><Left>          " ctrl-h 切换到左边窗口
inoremap {<CR> {<CR>}<ESC>O
map <F5> :!python %<CR>

syntax on
filetype plugin indent on 
set tags=tags;
set sw=4
set ts=4
set softtabstop=4
set expandtab
set nu
set smartindent
set autoread
set autowrite
set autochdir
set wildmenu
set magic
set laststatus=2
set cindent
set smarttab
set hlsearch
set incsearch
"set showmatch
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set backupdir=~/Work/VimBackUp

set statusline=%F%(\ %m%r%h%w%)\ [%{&ff}]\ [%Y]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}%=[0x%B]\ [%l,%(%c%V%)]\ [%P]

au BufNewFile,BufRead *.py,*.pyw,*.pyc setf python
au BufNewFile,BufRead *.mako set ft=mako
au BufNewFile,BufRead *.tex set ft=tex

"vimrc 自动生效
autocmd! bufwritepost .vimrc source ~/.vimrc 

"自动切换输入法
set noimdisable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme wombat256mod
if (APPLE)
    set guifont=Monaco:h13
else
    set guifont=Monospace\ 11
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unity js setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:extfname = expand("%:e")
if s:extfname ==?"js"
       set dictionary+=~/.vim/unity/Dict/UnityCS.txt
    set complete +=k
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => For gui setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=T
set guioptions-=m
