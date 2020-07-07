"For Vundle 
"
set nocompatible
"set rtp+=~/.vim/Bundle/vundle/

"To get Vundle plugin
"git clone https://github.com/gmarik/vundle.git ~/.vim/Bundle/vundle
"
source ~/config/vundle.vim

"--------From this line the vimrc begin------------------------
filetype on	
filetype plugin indent on
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936

if has("win32")
    set guifont=Consolas:h11:cANSI
	set guifontwide=Consolas:h11
endif


set t_Co=256
let g:dracula_italic = 0
highlight Normal ctermbg=None
colorscheme dracula
set showmode
set mouse=a
set nocursorcolumn
set nu
set showmatch
set shiftwidth=4  
set tabstop=4       
set expandtab
set softtabstop=4
set ignorecase 
set hlsearch 
set fdm=indent
filetype indent on
let mapleader=","
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_quiet_messages={"level":"warnings",}
"======For autosave=====
"let g:auto_save = 0 " Enable AutoSave 
"let g:auto_save_in_insert_mode = 0

" jedi options
"let g:jedi#auto_initialization = 1
""let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
""let g:jedi#popup_on_dot = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"
"let g:jedi#show_call_signatures_delay = 0
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
"let g:jedi#enable_speed_debugging=0
"For Minibufer
"let g:miniBufExplAutoStart = 1
"let g:miniBufExplBuffersNeeded = 1

"For neocomplete
let g:neocomplete#enable_at_startup = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType c set foldnestmax=1 | set fdl=0
autocmd FileType java set fdn=2 | set foldlevel=1
autocmd FileType html set fdn=99 | set foldlevel=99
autocmd FileType cpp  set fdn=2 | set foldlevel=1
autocmd FileType python set foldnestmax=4 | set fdl=0| set fdm=indent
autocmd Filetype python nmap <F5> :call Format_JSON_XML()<CR>
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")  && b:NERDTreeType == "primary") | q | endif
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml.ansible foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile Vagrantfile set ft=ruby


let NERDTreeIgnore=['.d$[[dir]]', '.pyc$[[file]]']
"autocmd FileType c,python Tlist    
"autocmd BufWritePost *.py call Flake8()
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif)
set foldcolumn=1
set winaltkeys=no
"If you don't need NerdTree, uncomment below line
"let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>

"ctags -R --c++-kinds=+lpx --fields=+iaS --extra=+q --language-force=c++
set tag=../tags,./tags
set cot=menu,longest
let g:acp_enableAtStartup = 0
" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:deoplete#enable_at_startup = 1


"python highlight syntax
" highlight python and self function
"autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
"autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
"hi def link pythonFunction Function
let g:python_highlight_all = 1
let g:vim_jsx_pretty_colorful_config = 1

" supertab config
let g:SuperTabDefaultCompletionType = "<c-n>"
" retain the visual selection after having pressed > or < 
vnoremap > >gv
vnoremap < <gv

"highlight current line and column
hi CursorLine   cterm=bold term=bold guibg=Grey40
hi CursorColumn cterm=bold term=bold guibg=Grey40
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"for NERD Commenter
nmap // <leader>c<space>
vmap // <leader>cs

" for buftabline
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" indentline setting
let g:indentLine_char = '⦙'


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

function! Format_JSON_XML()
    echom &filetype
    if &filetype == "xml"
        exec ":%!xmllint --format -"
    endif
    if &filetype == "json"
        exec ":%!python -m json.tool"
    endif 
endfunction

" For vim-airline
set guifont=Inconsolata\ for\ Powerline:h14
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" For spelunker
let g:enable_spelunker_vim = 0

"For powerline integrate 
"set laststatus=2 " Always display the statusline in all windows
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
syntax on
