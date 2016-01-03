" Switch syntax highlighting on, when the terminal has colors
syntax on


" No backup files
"set nobackup

" No write backup
"set nowritebackup

" No swap file
"set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
"set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set wrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces if we're not editting AppMeasurement files
if($APPM != 1)
  set expandtab
endif

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers
set number

" Highlight trailing whitespace
"set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=250 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
"set encoding=utf-8 " this is default in neovim

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

set pastetoggle=<F2>

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=233
set colorcolumn=80

set scrolloff=7
set magic
set lazyredraw
set nobackup
set nowb
set noswapfile

" this function is lifted from Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

" Map <tab> to Inserttabwarpper()
inoremap <tab> <c-r>=Inserttabwrapper()<cr>

" Shift tab to backwards search
inoremap <s-tab> <c-n>

" Remap 0 to first non-blank character
nnoremap 0 ^

" Remap ^ to first column
nnoremap ^ 0

" Treat long lines as break lines
map k gk
map j gj

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile


" Will insert tab at beginning of line, will use completion if not at beginning
set wildmode=list:longest,list:full

" Stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/dist/*

