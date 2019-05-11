let g:mapleader = ' '

" sets {{{

set nocompatible

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden
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

" Turn word wrap off
set wrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces if we're not editting AppMeasurement files
" if($APPM != 1)
"   set expandtab
" endif

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
"set cursorline

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
"autocmd BufWinEnter * highlight ColorColumn ctermbg=233
"set colorcolumn=80

set scrolloff=7
set magic
set lazyredraw
set nobackup
set nowb
set noswapfile

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
" }}}

" view binary files via xxd {{{
augroup Binary
   au!
   au BufReadPre  *.bin let &bin=1
   au BufReadPost *.bin if &bin | %!xxd
   au BufReadPost *.bin set ft=xxd | endif
   au BufWritePre *.bin if &bin | %!xxd -r
   au BufWritePre *.bin endif
   au BufWritePost *.bin if &bin | %!xxd
   au BufWritePost *.bin set nomod | endif
augroup END
" }}}

" plugins {{{

" start plugin manager vim-plug, TODO deprecate in favor of vim's built-in plugin manager? {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}


call plug#begin('~/.vim/pack')

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' " for showing per-line git state in left gutter
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
Plug 'godlygeek/tabular' " Tabularize
"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'othree/yajs'
call plug#end()
" }}}

" plugin configs {{{

" Syntastic ( deprecated by w0rp/ale)
" from https://medium.com/@hpux/vim-and-eslint-16fa08cc580f
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'eslint'
" }}}

" mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

" this function is lifted from Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com
"nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
"vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

" Shift tab to backwards search
inoremap <s-tab> <c-n>

" Remap 0 to first non-blank character
nnoremap 0 ^

" Remap ^ to first column
nnoremap ^ 0

" Treat long lines as break lines
map k gk
map j gj

nnoremap ; :

iabbrev adn and
iabbrev tehn then
iabbrev teh the
iabbrev waht what
iabbrev woh who

iabbrev cxl console.log(
iabbrev mxp 'use strict';<CR><CR>module.exports =
iabbrev fxn function (){<CR><CR>}<Up><Up><Right><Right><Right><Right><Right><Right><Right>
iabbrev hxl <!DOCTYPE html><cr><html><cr><head><cr><meta charset="utf8"/><cr><title>title</title><cr></head><cr><body><cr><cr></body><cr></html>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" visually select, then url encode or decode.
vnoremap <leader>% :!~/bin/url-encode-decode<cr>
vnoremap <leader>5 :!base64<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>l :ls<cr>
nnoremap <leader>, :bnext<cr>
nnoremap <leader>. :bprevious<cr>
nnoremap <leader>e :lnext<cr>
nnoremap <leader>E :lprev<cr>
nnoremap <leader>b :cnext<cr>
nnoremap <leader>n :cprevious<cr>

inoremap <A-Left> :tabnext<cr>
inoremap <A-Right> :tabprevious<cr>
nnoremap <A-Left> :tabnext<cr>
nnoremap <A-Right> :tabprevious<cr>

tnoremap <A-Left> <c-\><c-n>:tabnext<cr>
tnoremap <A-Right> <c-\><c-n>:tabprevious<cr>

" code snippets
nnoremap <leader>r maywggovar <esc>pa = require('<esc>pa');<esc>`a
nnoremap <leader>f yiwjOfor(var i=0,<esc>paI;i<<esc>pa.length;i++){<cr><tab><esc>paI = <esc>pa[i];<cr>}<cr>


nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

tnoremap <C-h> <c-w>h
tnoremap <C-j> <c-w>j
tnoremap <C-k> <c-w>k
tnoremap <C-l> <c-w>l

inoremap jk <esc>
inoremap <esc> <nop>

cnoremap Bd bd
cnoremap BD bd

" from junegunn/fzf.vim, better ctrlp plugin
nnoremap <C-p> :Files<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" }}}

" macros {{{
""let @w='jddjjI- jkwlv$~Vjj:s/\(BLOCK\|@\)//wwwwwwwwwvw~k$^wwlve~wlve~jkjji<br>jk'
let @w='^dt xjdt)j.j.jj.kddkkkr-Vjj~wwdw~w.^jw~jjjjj'
" }}}

" filetypes {{{
" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.sbt set filetype=scala
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
" }}}

" themes and colors {{{
colorscheme jellybeans
let g:airline_theme='base16'
highlight Normal ctermbg=black
highlight Search cterm=NONE ctermfg=grey ctermbg=blue
highlight Visual cterm=None ctermfg=255 ctermbg=68 guifg=white guibg=SeaGreen
highlight SignColumn ctermbg=black
" }}}

" fix gf for javascript/typescript {{{
autocmd FileType javascript setlocal suffixesadd+=.js,.json,.ts,.tsx
autocmd FileType javascript setlocal path+=.,node_modules

""
"" function! LoadMainNodeModule(fname)
""     let nodeModules = "./node_modules/"
""     let packageJsonPath = nodeModules . a:fname . "/package.json"
""
""     if filereadable(packageJsonPath)
""         return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
""     else
""         return nodeModules . a:fname
""     endif
"" endfunction

"autocmd FileType javascript setlocal includeexpr=LoadMainNodeModule(v:fname)
" }}}

" folds {{{
" TODO not sure if i like this ...
autocmd BufEnter * setlocal foldmethod=syntax
autocmd BufEnter * setlocal foldlevel=4

" ...but i do like this for now, 
" open markdown files folded at level 2 
function MarkdownLevel()
	let h = matchstr(getline(v:lnum), '^#\+')
	if empty(h)
		return "="
	else
		return ">" . len(h)
	endif
endfunction
autocmd BufEnter *.md setlocal foldexpr=MarkdownLevel()
autocmd BufEnter *.md setlocal foldmethod=expr
autocmd BufEnter *.md setlocal foldlevel=2

autocmd BufEnter .vimrc setlocal foldmethod=marker
autocmd BufEnter .vimrc setlocal foldlevel=0
" }}}

