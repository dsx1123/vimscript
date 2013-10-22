"For Vundle 
"Need to install python-pip to install Flake8

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

"To get Vundle plugin
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'Mark'
Bundle 'IndentAnything'
Bundle 'taglist.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi-vim'
Bundle 'FuzzyFinder'
Bundle 'nginx.vim'
Bundle 'peaksea'


"Frome this line the vimrc begin
syntax on
filetype on	
filetype plugin indent on
"set enc=chinese
""set fenc=chinese
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936

if has("win32")
    set guifont=Consolas:h11:cANSI
	set guifontwide=Consolas:h11
endif

set t_Co=256
set background=dark
color peaksea
set showmode
set mouse=a
set nocursorcolumn
set nu
set showmatch
set shiftwidth=4  
set tabstop=4       
set expandtab
set softtabstop=4
set autoindent
set ignorecase 
set hlsearch 
set fdm=indent
let mapleader=","
let g:syntastic_python_checkers=['flake8']
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
autocmd FileType c set foldnestmax=1 | set fdl=0
autocmd FileType java set fdn=2 | set foldlevel=1
autocmd FileType cpp  set fdn=2 | set foldlevel=1
autocmd FileType python set foldnestmax=99 | set fdl=99
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType c,cpp,java Tlist    
"autocmd BufWritePost *.py call Flake8()
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif)
set foldcolumn=1
set winaltkeys=no
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_WinWidth=40
"configure autocomplete 

"ctags -R --c++-kinds=+lpx --fields=+iaS --extra=+q --language-force=c++
set tag=../tags,./tags
set cot=menu,longest
let g:neocomplcache_enable_at_startup = 1
let g:NeoComplCache_SmartCase = 1
let g:neocomplcache_min_syntax_length = 3
let g:SuperTabRetainCompletionType=2
let g:NeoComplCache_DisableAutoComplete=1
"let g:SuperTabDefaultCompletionType="<C-X><C-N>"
imap <C-k>  <Plug>(neocomplcache_snippets_expand)
smap <C-k>  <Plug>(neocomplcache_snippets_expand)
"<CR>: close popup and save indent
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
map <C-n> :NERDTreeToggle<CR>
highlight FoldColumn ctermbg=bg ctermfg=green guibg=bg guifg=green
highlight Folded ctermbg=bg ctermfg=green guibg=bg guifg=green

if has("gui_running")
    function! TabPos_ActivateBuffer(num)
        let s:count = a:num 
            exe "tabfirst"
            exe "tabnext" s:count  
    endfunction

    function! TabPos_Initialize()
        for i in range(1, 9) 
            exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
        endfor
        exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
    endfunction

    autocmd VimEnter * call TabPos_Initialize()
endif
