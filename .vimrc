set nocompatible              " be iMproved, required
filetype on

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

" Set swap file directory
set directory=$HOME/.vim/swapfiles//

" Maintain undo History between sessions
set undofile
set undodir=$HOME/.vim/undodir//

call vundle#begin() 
" alternatively, pass a path where Vundle should install plugins "
"call vundle#begin('~/some/path/here') " 
"
"let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'chrisbra/csv.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'

"FuzzyFinder
Plugin 'junegunn/fzf.vim'
"Plugin '/home/jezreel/.fzf/bin/fzf'

"Syntax Highlighter/Indention
Plugin 'gabrielelana/vim-markdown'
Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter' 
"Theme/Ui
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'flazz/vim-colorschemes'

"Python Plugins
Plugin 'Vimjas/vim-python-pep8-indent' 
Plugin 'python-mode/python-mode', { 'branch': 'develop' }
Plugin 'vim-python/python-syntax'
Plugin 'vim-vdebug/vdebug'

"React/JS plugin
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'skywind3000/asyncrun.vim'

"Ruby Plugin
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'

"Other Plugin
Plugin 'vim-scripts/taglist.vim'

"PHP

Plugin 'joonty/vim-phpqa'
Plugin 'KabbAmine/vCoolor.vim'


"
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

""""""""""""""""""""""""YCM"""""""""""""""""""""
"Autoclose preview after completion 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-tab'
set updatetime=100
let g:ycm_extra_conf_globlist = ['~/test-projects/*', '~/projects/*']
let g:ycm_confirm_extra_conf=1
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
""""""""""""""""""""""""YCM"""""""""""""""""""""


"""""""""""Pymode""""""""""""""""""""
let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
let g:pymode_python = 'python3'
let g:python_highlight_all = 1
let g:pymode_lint_unmodified = 1
"""""""""""Pymode"""""""""""""""""""""


colorscheme onedark
let g:onedark_termcolors=256
let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ }

""""""""""""""""""""""""""Ale""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \}
let g:ale_linters_explicit = 1
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"""""""""""""""""""""""""Ale"""""""""""""""""""""""""""""""""""""""""""""""

"https://github.com/sheerun/vim-polyglot/issues/303
let g:graphql_javascript_tags = []

" PHP 
let g:phpqa_codesniffer_args = "--standard=Zend"

"""""""""""""""""""""""""Ale"""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""vim_markdown""""""""""""""""""""""""""""""""
let vim_markdown_preview_github=1
let Tlist_GainFocus_On_ToggleOpen=1
"""""""""""""""""""""""""vim_markdown""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""Mappings""""""""""""""""""""""""""""""""""'
let mapleader=" " 
map <leader>a :Ag<CR>
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
map <leader>jl :AsyncRun -post=checktime eslint --fix %<CR>
map <leader>at :ALEToggle<CR>
map <leader>ss :execute 'python3 import sys; print(sys.path)'<CR>
map <leader>jf :execute '%!python -m json.tool' <CR>

map <leader>f :FZF <CR>
nnoremap <silent>ct :TlistToggle<CR>
nmap <silent> <leader>og :exec '!google-chrome % &'<CR>


"""""""""""""""""""""Mappings""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""Others"""""""""""""""""""""
let g:vcoolor_map='<C-p>'
