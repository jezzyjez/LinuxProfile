set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'vin-gnome'

Plugin 'easymotion/vim-easymotion'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number 
set nowrap
set runtimepath+=/home/user/cbarcelona/vimfiles/,/home/user/cbarcelona/vimfiles/after/
filetype plugin on
colorscheme desert
set tabstop=4
set expandtab
set incsearch
set hlsearch
set wildmenu
set encoding=utf-8

function XMLAlign()
    let cursor = getpos('.')
    let l:winview = winsaveview()
    :w
    normal(ggVGd)
    :read !python ~/.vim/bundles/xml-aligner.py %
    normal(ggdd)
    call setpos('.', cursor)
    call winrestview(l:winview)
endfunction
let mapleader=" " 
map <leader>a :call XMLAlign()<CR>
map <leader>t ::NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

set term=screen-256color

"Add highligted column"
" highlight ColorColumn ctermbg=7
" set colorcolumn=80,120
:inoremap kj <ESC>
" Use to pastetoggle automatically
