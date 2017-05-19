
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

" Plugin 'ervandew/supertab'

" Plugin 'davidhalter/jedi-vim'
" nmap <leader>g g:jedi#goto_assignments_command<cr>
" nmap <leader>s g:jedi#goto_definitions_command<cr>

Plugin 'bogado/file-line'

Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
nmap <leader>d <Plug>DashSearch<cr>

Plugin 'Yggdroot/indentLine'

Plugin 'michalbachowski/vim-wombat256mod.git'

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = ',,'
let g:ctrlp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp.vim

Plugin 'Valloric/YouCompleteMe'
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
" inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=1
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'

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
"map <F5> :!python %<CR>

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
map <A-]> gt          " 下一个tab
map <A-[> gT          " 上一个tab
map <A-t> :tabnew<CR> " 新tab
map <A-w> :tabclose<CR> " 关闭tab
