set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to come before the configuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'
" comments your code elegant
Plugin 'scrooloose/nerdcommenter'
" tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
" syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
" fast navigation between .c/.cpp and .h
Plugin 'vim-scripts/a.vim'
" You Complete Me
Plugin 'Valloric/YouCompleteMe'
" vim plugin for ack
Plugin 'mileszs/ack.vim'
" emmet for vim
Plugin 'mattn/emmet-vim'
" Interactive command execution in vim
Plugin 'Shougo/vimproc.vim'
" perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'
" the ultimate snippet solution for Vim
Plugin 'SirVer/ultisnips'
" powerline plugin makes vim's status bar beautiful
Plugin 'bling/vim-airline'
" fast file navigation
Plugin 'kien/ctrlp.vim'
" better Rainbow Parentheses
Plugin 'kien/rainbow_parentheses.vim'
" text filtering and alignment
Plugin 'godlygeek/tabular'
" all trailing whitespace to be highlighted in red
Plugin 'bronson/vim-trailing-whitespace'
" improved C++11/14 STL syntax highlighting
Plugin 'Mizuchi/STL-Syntax'
" additional vim syntax highlighting for C++
Plugin 'octol/vim-cpp-enhanced-highlight'
" improved Haskell syntax highlighting
Plugin 'haskell.vim'
" Rust lang support
"Plugin 'wting/rust.vim'
" Elixir lang support
Plugin 'elixir-lang/vim-elixir'
" CoffeeScript lang support
Plugin 'kchmck/vim-coffee-script'
" Markdown support
Plugin 'tpope/vim-markdown'
" Quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
" a better JSON for vim
Plugin 'elzr/vim-json'
" HTML5 omnicomplete and syntax
Plugin 'othree/html5.vim'
" molokai colorscheme
Plugin 'tomasr/molokai'
" tomorrow colorscheme
Plugin 'chriskempson/vim-tomorrow-theme'
" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'
" jellybeans colorscheme
Plugin 'nanotech/jellybeans.vim'

" all of Plugins must be added before the following line
call vundle#end()           " required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on


" DISPLAY SETTINGS
colorscheme Tomorrow-Night-Bright
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif
" 6 lines above/below cursor when scrolling
set scrolloff=6
" show matching bracket (briefly jump)
set showmatch
" show mode in status bar (insert/replace/...)
set showmode
" show typed command in status bar
set showcmd
" show cursor position in status bar
set ruler
" show line number
set number
" show file in titlebar
set title
" highlights the current line
set cursorline
" the statusline is now always shown
set laststatus=2
" allow cursor beyond last character
set virtualedit=block,onemore
" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
"set textwidth=100
" this makes the color after the textwidth column highlighted
"set colorcolumn=+1


" EDITOR SETTINGS
" case insensitive searching
set ignorecase
" but become case sensitive if you type uppercase characters
set smartcase
" highlight search
set hlsearch
" smart indenting for c-like code
set cindent
" smart tab handling for indenting
set smarttab
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" number of spaces a tab counts for
set tabstop=2
" spaces for autoindents
set shiftwidth=2
set softtabstop=2
" makes indenting a multiple of shiftwidth
set shiftround
" turn a tab into spaces
set expandtab
"   DO NOT beep   "
"""""""""""""""""""
set noerrorbells ""
set vb           ""
set t_vb=        ""
"""""""""""""""""""
" stores undo state even when files are closed (in undodir)
set undofile
" remember more commands and search history
set history=1000
" auto read when a file is changed from the outside
set autoread

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the standard one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

" Save your backups to a less annoying place than the current directory.
set backupdir=~/.vim/backup/
set backup

" Save your swp files to a less annoying place than the current directory.
set directory=~/.vim/swap/

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  set undodir=~/.vim/undo/
  set undofile
endif

" tmux integration
if exists('$TMUX')
  set term=screen-256color
endif
" cursor shape in tmux
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" auto remove all trailing whitespace in all files
autocmd BufWritePre * :%s/\s\+$//e

" indent for python source file
autocmd FileType python setlocal shiftwidth=4 tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" our <leader> will be the space key
let mapleader=" "

" disable arrow keys to force me use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" key bindings for quickly moving between windows
" h left, l right, k up, j down
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

" for faster scrolling
noremap <c-j> 15gj
noremap <c-k> 15gk


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          PLUGINS  CONFIGURATION                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              YouCompleteMe                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_warning_symbol = '⚠'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_confirm_extra_conf = 0
let g:ycm_disable_for_files_larger_than_kb = 5500
nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>def :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dec :YcmCompleter GoToDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                syntastic                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Airline                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                UltiSnips                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" trigger configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<up>"
let g:UltiSnipsJumpBackwardTrigger = "<down>"
" :UltiSnipsEdit will split window vertically
let g:UltiSnipsEditSplit = "vertical"
let g:snips_author = 'Jiang Zhu'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Rainbow Parentheses                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NERD Tree                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if (winnr("$") == 1 && exists("b:NERDTreeType"))
    if b:NERDTreeType == "primary"
      q
    endif
  endif
endfunction

