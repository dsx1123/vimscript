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
Bundle 'fholgado/minibufexpl.vim'
Bundle 'IndentAnything'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'FuzzyFinder'
Bundle 'nginx.vim'
Bundle 'peaksea'
Bundle 'vim-scripts/applescript.vim'
"Bundle 'vim-scripts/vim-auto-save'


"--------From this line the vimrc begin------------------------
syntax on
filetype on	
filetype plugin indent on
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936

if has("win32")
    set guifont=Consolas:h11:cANSI
	set guifontwide=Consolas:h11
endif

if has("gui_macvim")
    map <D-1> :tabfirst<Cr>
    map <D-2> :tabfirst<Cr>gt
    map <D-3> :tabfirst<Cr>3gt
    map <D-4> :tabfirst<Cr>4gt
    map <D-5> :tabfirst<Cr>5gt
    set guifont=Consolas:h12
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
"======For autosave=====
let g:auto_save = 0 " Enable AutoSave 
let g:auto_save_in_insert_mode = 0

"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 1
"For Minibufer
let g:miniBufExplAutoStart = 1


autocmd FileType python setlocal completeopt-=preview
autocmd FileType c set foldnestmax=1 | set fdl=0
autocmd FileType java set fdn=2 | set foldlevel=1
autocmd FileType html set fdn=99 | set foldlevel=99
autocmd FileType cpp  set fdn=2 | set foldlevel=1
autocmd FileType python set foldnestmax=2 | set fdl=0| set fdm=indent
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")  && b:NERDTreeType == "primary") | q | endif


let NERDTreeIgnore=['.d$[[dir]]', '.pyc$[[file]]']
"autocmd FileType c,python Tlist    
"autocmd BufWritePost *.py call Flake8()
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif)
set foldcolumn=1
set winaltkeys=no
"If you don't need NerdTree, uncomment below line
"let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>

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
" format xml and json
function! s:format_file(fileType)
    if a:fileType == "xml"
        autocmd %!xmllint --format -
    if a:fileType == "python"
        autocmd %!python -m json.tool
endfunction


command! -nargs=1 Format call s:format_file(<f-args>)

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

"highlight current line and column
hi CursorLine   cterm=bold term=bold guibg=Grey40
hi CursorColumn cterm=bold term=bold guibg=Grey40
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

map <C-n> :NERDTreeToggle<CR>
highlight FoldColumn ctermbg=bg ctermfg=green guibg=bg guifg=green
highlight Folded ctermbg=bg ctermfg=green guibg=bg guifg=green
highligh VertSplit ctermbg=bg ctermfg=white guibg=bg guifg=white

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
"For powerline integrate 

set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
 
" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256
  
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

