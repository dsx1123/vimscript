set nocompatible
set rtp+=~/.vim/Bundle/vundle/

call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'Mark'
Plugin 'fatih/vim-go'
Plugin 'kamykn/spelunker.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
    Plugin 'deoplete-plugins/deoplete-jedi'
endif
Plugin 'nathanalderson/yang.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nginx.vim'
Plugin 'dracula/vim'
Plugin 'romainl/Apprentice'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'vim-python/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'
