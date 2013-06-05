"for Bundle 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'Mark'
Bundle 'IndentAnything'
Bundle 'taglist.vim'
Bundle 'neocomplcache'
Bundle 'FuzzyFinder'
Bundle 'peaksea'
Bundle 'c.vim'
filetype plugin on


"Frome this line the vimrc begin
syntax on
set t_Co=256
set background=dark
color peaksea
set number
set showmode
set mouse=a
set nocursorcolumn
set nu
set showmatch
set tabstop=4       
set softtabstop=4
set shiftwidth=4  
set autoindent
set ignorecase 
set hlsearch 
set fdm=syntax
let mapleader=","
autocmd FileType c set foldnestmax=1 | set fdl=0
autocmd FileType java set fdn=2 | set foldlevel=1
autocmd FileType cpp  set fdn=2 | set foldlevel=1
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif)
set foldcolumn=1
set winaltkeys=no

autocmd FileType c,cpp,java Tlist    
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_WinWidth=45
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