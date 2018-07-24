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
Plugin 'ZenCoding.vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
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
colorscheme desert
set tabstop=4
set shiftwidth=4
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
map <leader>w :call ToggleTab()<CR>
set term=screen-256color
set colorcolumn=80,100
highlight ColorColumn ctermbg=8

"Add highligted column"
" highlight ColorColumn ctermbg=7
" set colorcolumn=80,120
:inoremap kj <ESC>
" Use to pastetoggle automatically
set laststatus=2
set statusline=%.t       "tail of the filename
set statusline+=%=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file formatl
let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
autocmd FileType html setlocal shiftwidth=2 tabstop=2

set rtp+=~/.fzf

function ToggleTab()
    if &tabstop == 4
        set tabstop=2
        set shiftwidth=2
    else
        set tabstop=4
        set shiftwidth=4
    endif
endfunction
