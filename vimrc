" File: .vimrc
" Author: Jake Zimmerman <jake@zimmerman.io>
"
" How I configure Vim :P
"

" Gotta be first
set nocompatible

filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jlanzarotta/bufexplorer'
" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go' 
" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse-=a
set smartindent   " Smart indent
set autoindent    " 打开自动缩进
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

set showmatch
"set cc=80
"set guifont=Monaco:h20
" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"set -g default-terminal "screen-256color"
" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
"let g:airline_detect_paste=1

" Show airline for tabs too
"let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='molokai'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup =0


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
"create undo file
if has('persistent_undo')
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set undofile                " So is persistent undo ...
set undodir=/tmp/vimundo/
endif

"检测文件类型
filetype on
" history存储容量
set history=2000

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>t :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
"let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
let python_highlight_all=1




map <F3> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
noremap <silent> <F3> :NERDTreeFind<cr>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '^\.swp$', '^\.idea$']

"是否高亮显示光标所在行
let NERDTreeHighlightCursorline=1
"设置NERDTree子窗口位置
let NERDTreeWinPos="left"
"设置树窗口宽度
let NERDTreeWinSize=30
"显示隐藏文件
let NERDTreeShowHidden=1
"删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"打开文件后是否关闭NerdTree窗口
let NERDTreeQuitOnOpen=0
"是否默认显示行号
let NERDTreeShowLineNumbers=1"

" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise"

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
"noremap <left> :bp<CR>
"noremap <right> :bn<CR>
map <leader>x :tabclose<cr>

" 修改leader键
"let mapleader = ';'
"let g:mapleader = ';'
set wildmenu
nnoremap QQ :QuitTab<cr>
command! QuitTab call s:QuitTab()
function! s:QuitTab()
  try
    tabclose
  catch /E784/ " Can't close last tab
    qall
  endtry
endfunction

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4|
            \ set shiftwidth=4|
            \ set textwidth=79|
            \ set expandtab|
            \ set autoindent|
            \ set fileformat=unix|
            \ set cc=80 |
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
let g:go_highlight_fields = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
au BufRead,BufNewFile *.go set filetype=go

highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" 快速移动
if isdirectory(expand("~/.vim/bundle/vim-easymotion"))
    " makes EasyMotion work similarly to Vim's smartcase option for global
    " searches
    let g:EasyMotion_smartcase = 1

    " <Leader><Leader>w
    " <Leader><Leader>b
    " <Leader><Leader>s
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    map <Leader>. <Plug>(easymotion-repeat)
    nmap <Leader>s <Plug>(easymotion-s)
endif

"pip2.7  install powerline-status
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set guifont=Inconsolata\ for\ Powerline:h20
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
"set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ for\ Powerline:h16
"set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline_powerline_fonts = 1
