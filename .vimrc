set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
" alternatively, pass a path where Vundle should install plugins "
"call vundle#begin('~/some/path/here') " 
"
"let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ZenCoding.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Vimjas/vim-python-pep8-indent' 
Plugin 'Shougo/deoplete.nvim' 
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-fugitive'

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-vdebug/vdebug'
Plugin 'gabrielelana/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'

"React/JS plugin
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'skywind3000/asyncrun.vim'
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
"
"
"If you have vim >=8.0 or Neovim >= 0.1.5
"if (has("termguicolors"))
 "set termguicolors
"endif

"  Theme
set number 
set nowrap
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
    :read !python /home/jezreel/.vim/bundle/xml-aligner/xml-aligner.py %
    normal(ggdd)
    call setpos('.', cursor)
    call winrestview(l:winview)
endfunction
set term=screen-256color
set colorcolumn=100,120
highlight ColorColumn ctermbg=8

"Add highligted column"
" highlight ColorColumn ctermbg=7
" set colorcolumn=80,120
:inoremap kj <ESC>
set laststatus=2
set statusline=%.t       "tail of the filename
set statusline+=%=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file formatl
let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
autocmd FileType html setlocal shiftwidth=2 tabstop=2

function ToggleTab()
    if &tabstop == 4
        set tabstop=2
        set shiftwidth=2
    else
        set tabstop=4
        set shiftwidth=4
    endif
endfunction

"Autoclose preview after completion 
let g:ycm_autoclose_preview_window_after_completion = 1

"Set Snippet Directory for neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " For conceal markers.
 if has('conceal')
   set conceallevel=2 concealcursor=niv
   endif

let g:deoplete#enable_at_startup = 1
let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
let g:pymode_python = 'python3'

let g:ycm_goto_buffer_command = 'new-tab'
set updatetime=100


 

if (has("nvim"))
   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 endif
 "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
 "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
 " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
 if (has("termguicolors"))
   "set termguicolors
 endif

 "colorscheme srcery
 colorscheme onedark
 let g:onedark_termcolors=256
 let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ }

 
" Shortcuts
let mapleader=" " 
map <leader>a :call XMLAlign()<CR>
map <leader>t ::NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" Use to pastetoggle automatically
map  <leader>p :set paste<CR>
map  <leader>np :set nopaste<CR>

map <leader>e :edit<CR>

"Toggle between 2 space or 4 space tab
map <leader>w :call ToggleTab()<CR>
map <leader>gt :rightbelow vertical YcmCompleter GoTo<CR>

map <leader>n :noh<CR>

"gitgutter command
map <leader>gd :GitGutterToggle<CR>
map <leader>gs :GitGutterSignsToggle<CR>
map <leader>gh :GitGutterLineHighlightsToggle<CR>
map <leader>rv :so $MYVIMRC <CR>
map <leader>pl :PymodeLintAuto <CR>

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
