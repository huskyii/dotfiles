set nocompatible

" Vundle configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'raichoo/haskell-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" UI Config
colorscheme Tomorrow-Night-Eighties
syntax on
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set laststatus=2        " always show status line
set virtualedit=block,onemore

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive when you type uppercase characters

" Folding
"set foldenable          " enable folding
"set foldmethod=indent   " fold based on indent level
nnoremap <space> za

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
set scrolloff=6
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j
noremap <c-j> 15gj
noremap <c-k> 15gk

" DO NOT beep
set noerrorbells
set vb
set t_vb=

set history=500
set autoread
set nobackup
set nowb
set noswapfile
set backspace=indent,eol,start

set clipboard+=unnamedplus,unnamed

autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType Python setlocal shiftwidth=4 tabstop=4

" YouCompleteMe
let g:ycm_warning_symbol = '⚠'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_confirm_extra_conf = 0
let g:ycm_disable_for_files_larger_than_kb = 5500
nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>def :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dec :YcmCompleter GoToDeclaration<CR>

" syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" OCaml Support
" opam install merlin
if executable('ocamlmerlin') && has('python')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
endif
