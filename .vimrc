"For Vundle 
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

"To get Vundle plugin
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'Mark'
Bundle 'IndentAnything'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'fholgado/minibufexpl'
Bundle 'FuzzyFinder'
Bundle 'nginx.vim'
Bundle 'peaksea'


""""Frome this piont the vimrc begin
syntax on
filetype on	
filetype plugin indent on
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
let g:syntastic_python_checkers=['pylint']
let g:syntastic_quiet_messages={"level":"warnings",}
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType c set foldnestmax=1 | set fdl=0
autocmd FileType java set fdn=2 | set foldlevel=1
autocmd FileType cpp  set fdn=2 | set foldlevel=1
autocmd FileType python set foldnestmax=2 | set fdl=0| set fdm=indent
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeIgnore=['.d$[[dir]]', '.pyc$[[file]]']
"autocmd FileType c,python Tlist    
"autocmd BufWritePost *.py call Flake8()
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif)
set foldcolumn=1
set winaltkeys=no
"If you don't need NerdTree, uncomment below line
"let g:tagbar_left = 1

"ctags -R --c++-kinds=+lpx --fields=+iaS --extra=+q --language-force=c++
set tag=../tags,./tags
set cot=menu,longest
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_enable_auto_select = 1
" Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
" Close popup by <Space>.

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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
