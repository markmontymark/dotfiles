let g:mapleader = ","

"NeoBundle Scripts {{{
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/vimproc.vim'
"NeoBundle 'Shougo/vimshell.vim'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'fatih/vim-go'
NeoBundle 'groenewege/vim-less'
"NeoBundlelugin 'marijnh/tern_for_vim'
"NeoBundle"ugin 'vim-scripts/jsbeautify'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'rking/ag.vim'
"NeoBundlelugi""""n 'mileszs/ack.vim'
NeoBundle 'XadillaX/json-formatter.vim'
"NeoBundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'bling/vim-airline'
"NeoBundlelugin 'altercation/vim-colors-solarized'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'godlygeek/tabular.git'
"NeoBundle 'vim-scripts/snipMate'
" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
"NeoBundle 'idanarye/vim-vebugger'
NeoBundle 'ervandew/supertab'
NeoBundle 'moll/vim-node'
NeoBundle 'rdio/jsfmt'
NeoBundle 'mephux/vim-jsfmt'

NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'guns/vim-sexp'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'gregsexton/gitv'
NeoBundle 'janko-m/vim-test.git'
NeoBundle 'benmills/vimux'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"}}}

" Vundle {{{
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-tbone'
"Plugin 'tpope/vim-fugitive'
"Plugin 'scrooloose/syntastic'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'elzr/vim-json'
"Plugin 'pangloss/vim-javascript'
"Plugin 'fatih/vim-go'
"Plugin 'groenewege/vim-less'
""""""Plugin 'marijnh/tern_for_vim'
""Pl""""ugin 'vim-scripts/jsbeautify'
"Plugin 'guns/vim-clojure-static'
"Plugin 'rking/ag.vim'
""""""Plugi""""n 'mileszs/ack.vim'
"Plugin 'XadillaX/json-formatter.vim'
"Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'bling/vim-airline'
""""""Plugin 'altercation/vim-colors-solarized'
"Plugin 'kien/ctrlp.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/nerdtree'
""""""Plugin 'bling/vim-bufferline'
""""""Plugin 'edkolev/tmuxline.vim'
" All of your Plugins
" must be added before
" the following line
"""""call vundle#end()
" required
" }}}

" Settings {{{
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

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers
set number

" Highlight tailing whitespace
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
set encoding=utf-8

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
"autocmd BufWinEnter * highlight ColorColumn ctermbg=233
"set colorcolumn=80
" }}}

" Plugins {{{
"execute pathogen#infect()
"filetype plugin indent on " required by Pathogen Plugin Manager

" Theme
set background=light
colorscheme molokai

" CtrlP
"map <leader>o <C-p>
"map <leader>y :CtrlPBuffer<cr>
"let g:ctrlp_show_hidden=1
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_max_height=30
"let g:ctrlp_open_new_file = 'r'
"let g:ctrlp_open_multiple_files = '1ijr'
"
"" CtrlP -> override <C-o> to provide options for how to open files
""let g:ctrlp_arg_map = 1
"
"" CtrlP -> files matched are ignored when expanding wildcards
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
"
"" CtrlP -> use Ag for searching instead of VimScript
"" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"" CtrlP -> directories to ignore when fuzzy finding
"let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'
"
" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:grepprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
let g:airline_powerline_fonts = 1
 let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '^V' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '^S' : 'S',
  \ }

let g:airline_left_sep='▶'
let g:airline_left_alt_sep='▶'
let g:airline_right_sep='◀'
let g:airline_right_alt_sep='◀'
"let g:airline_symbols.linenr = '␊'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  endif
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" remove branch from section_b
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'
" clear out fileencoding/format from section_y
let g:airline_section_y = ''
"let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3c'
let g:airline_section_z = '%3p%% %4l %3c'
let g:airline#extensions#hunks#non_zero_only = 1

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" NORMAL mode Ctrl+y then , <C-y,>

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" Searching the file system
"map <leader>' :NERDTreeToggle<cr>

" Tabularize
"map <Leader>e :Tabularize /=<cr>
"map <Leader>c :Tabularize /:<cr>
"map <Leader>es :Tabularize /=\zs<cr>
"map <Leader>cs :Tabularize /:\zs<cr>


" Camel Case Motion (for dealing with programming code)
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"sunmap w
"sunmap b
"sunmap e
" }}}

" Mappings {{{
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

nnoremap ; :

iabbrev adn and
iabbrev tehn then
iabbrev waht what
iabbrev woh who
iabbrev amddef "use strict";<cr>/*global define*/

iabbrev ccopy Copyright 2014 Me, All Rights Reserved.

iabbrev meee "use strict";<CR><CR>module.exports = ;<CR><CR>
iabbrev fnctor /*jshint validthis:true*/<CR>if(this.constructor !== ){<CR>return new ();<CR>}<CR>
iabbrev forlist for(var i=0,len=.length; i < len; i++){
iabbrev varreq var  = require('');
iabbrev ifnoargs if(arguments.length === 0){<CR>
iabbrev fxn function
iabbrev starthtml <!DOCTYPE html><cr><html><cr><head><cr><meta charset="utf8"/><cr><title>title</title><cr></head><cr><body><cr><cr></body><cr></html>

" Clear search buffer
:nnoremap § :nohlsearch<cr>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" File System Explorer (in horizontal split)
map <leader>. :Sexplore<cr>

" Buffers (runs the delete buffer command on all open buffers)
"map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|

" Make splitting Vim windows easier
"map <leader>; <C-W>s
"map <leader>` <C-W>v

" visually select, then url encode or decode.
vnoremap <leader>% :!~/bin/url-encode-decode<cr>
vnoremap <leader>6 :!base64<cr>

" Running Tests...
" See also <https://gist.github.com/8114940>

" Run currently open RSpec test file
"map <Leader>rf :w<cr>:!rspec % --format nested<cr>

" Run current RSpec test
" RSpec is clever enough to work out the test to run if the cursor is on any line within the test
"map <Leader>rl :w<cr>:exe "!rspec %" . ":" . line(".")<cr>

" Run all RSpec tests
"map <Leader>rt :w<cr>:!rspec --format nested<cr>

" Run currently open cucumber feature file
"map <Leader>cf :w<cr>:!cucumber %<cr>

" Run current cucumber scenario
"map <Leader>cl :w<cr>:exe "!cucumber %" . ":" . line(".")<cr>

" Run all cucumber feature files
"map <Leader>ct :w<cr>:!cucumber<cr>

" Tmux style window selection
"map <Leader>ws :ChooseWin<cr>

" opening h/v splits
"nnoremap <leader>| :vne<cr>
"nnoremap <leader>- :new<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
"highlight TechWordsToAvoid ctermbg=red ctermfg=white
"match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
"autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
"autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
"autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
"autocmd BufWinLeave * call clearmatches()

" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}

" colors {{{
hi Normal ctermbg=black
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi Visual cterm=None ctermfg=255 ctermbg=68
hi SignColumn ctermbg=black
" }}}

" my mappings {{{
nnoremap <leader>f :call QuickfixToggle()<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>x :x<cr>

nnoremap <leader>l :ls<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>b :bnext<cr>
nnoremap <leader>B :bprevious<cr>
nnoremap <leader>c yyp
nnoremap <leader>e :lnext<cr>
nnoremap <leader>E :lprev<cr>
nnoremap <leader>r maywggovar <esc>pa = require('<esc>pa');<esc>`a
nnoremap <leader>, :cnext<cr>
nnoremap <leader>. :cprevious<cr>

vnoremap <leader>% :!~/bin/url-encode-decode<cr>

" move around splits
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

inoremap jk <esc>
inoremap <esc> <nop>

" }}}

" https://gist.github.com/cridenour/74e7635275331d5afa6b {{{
 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3

 " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 function! s:my_cr_function()
     return neocomplete#smart_close_popup() . "\<CR>"
 endfunction
 "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 " <TAB>: completion.
 "0inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 "0inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 "0inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 "0inoremap <expr><C-y>  neocomplete#close_popup()
 "0inoremap <expr><C-e>  neocomplete#cancel_popup()

 " }}}

set scrolloff=7

set magic
set lazyredraw
set nobackup
set nowb
set noswapfile

" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

"nnoremap <Leader><Leader> :e .<CR><C-W>h<C-W>s :Tlist<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h

"og
"nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h
"nnoremap <Leader><Leader> <c-w>25v:e .<CR><c-w>h<c-w>r<C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>l

" start from http://stackoverflow.com/a/5636941/766921
" Toggle Vexplore with <leader><leader>
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      25Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <leader><leader> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" end from http://stackoverflow.com/a/5636941/766921

"
"let g:netrw_altv = &spr
" let g:netrw_winsize = 80
" Netrw Style Listing
"let g:netrw_liststyle = 3

" fns {{{
"TODO
" add #names for autoloading
" this function is lifted from Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com

let g:quickfix_is_open = 0

function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction



function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction
"nnoremap <leader>z :call FoldColumnToggle()<cr>
"
" this function is lifted from Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  echo shellescape(@@)
  sleep 1
  silent execute "grep! -R " . shellescape(@@)
  redraw!
  copen
  let @@ = saved_unnamed_register
endfunction

"" Tab completion
function! Inserttabwrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

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

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Disable paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Turn backup off
set noswapfile
set nobackup
set nowritebackup

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

" from http://vim.wikia.com/wiki/HTML_entities
" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range Htmldecode call HtmlEntities(<line1>, <line2>, 0)
command! -range Htmlencode call HtmlEntities(<line1>, <line2>, 1)
"noremap <silent> <leader>h :Entities 0<CR>
"noremap <silent> \H :Entities 1<CR>

"}}}
