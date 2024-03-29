"config begin

"==========================================
" Pluges
"==========================================

call plug#begin('~/.vim/plugged')

" Theme
Plug 'rakr/vim-one'

" 状态栏
Plug 'vim-airline/vim-airline'
let g:airline_theme='one'

" 语法检测
Plug 'w0rp/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" 左侧文件列表
Plug 'scrooloose/nerdtree'
" 自动启动 NERDTree
"autocmd vimenter * NERDTree
" 快捷键 Ctrl + T 启动 NERDTree
map <C-t> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 如果剩下的唯一窗口是 NERDTree，关闭 Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 高亮代码尾部的空格
Plug 'bronson/vim-trailing-whitespace'

" 显示缩进竖线
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

call plug#end()
"==========================================
" General
"==========================================

" history存储长度。
set history=1000
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全filetype plugin indent on
" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 取消备份。
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 粘贴时保持格式
set paste
" 点击光标不会换,用于复制
set mouse-=a           " 在所有的模式下面打开鼠标。
set selection=exclusive
set selectmode=mouse,key
" No annoying sound on errors
" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"==========================================
" show and format
"==========================================
" 显示行号
set number
" 取消换行
set nowrap
" 使用相对行号
:set number relativenumber
"" 为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"" 自动切换相对行号和绝对行号
"autocmd WinEnter,FocusGained * :set number norelativenumber
"autocmd WinLeave,FocusLost   * :set number relativenumber

" 括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" 设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=manual
" 在左侧显示折叠的层次
"set foldcolumn=4
set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" 按退格键时可一次删掉 4 个空格
set softtabstop=4

set ai "Auto indent
set si "Smart indent

"==========================================
" status
"==========================================
" 显示当前的行号列号：
set ruler
" 在状态栏显示正在输入的命令
set showcmd

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set so=7
" 突出显示当前行
set cursorline
" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
"set laststatus=2
"==========================================
" Colors and fonts
"==========================================
"开启语法高亮
syntax enable
syntax on

" 设置配色方案
colorscheme one
set background=dark
set termguicolors
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
"set guifont=Monaco:h20          " 字体 && 字号
"==========================================
" File encode
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencoding=utf8
"set enc=2byte-gb18030
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,gb18030,default
" gb18030 最好在 UTF-8 前面，否则其它编码的文件极可能被误识为 UTF-8

" Use Unix as the standard file type
set ffs=unix,dos,mac
" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B
"==========================================
" Others
"==========================================

autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。


" 自动完成
set completeopt=longest,menu
" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
" 自动补全配置
autocmd FileType python set omnifunc=pythoncomplete#Complete
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" A buffer becomes hidden when it is abandoned
"set hid

" For regular expressions turn magic on
set magic
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" pydiction 1.2 python auto complete
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
" defalut g:pydiction_menu_height == 15
let g:pydiction_menu_height = 20

" config end
