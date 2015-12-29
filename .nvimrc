if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let g:mapleader = ","

" for writing node.js-based vim plugins
" let &runtimepath.=',~/.nvim/rplugin/node'

" nvim within nvim (broken) {{{
" for nvim within nvim, aka nvim-replacing-tmux-windows, not working yet
" because <c-\><c-n> always captured by outermost nvim instead of current
" vsplitted nvim terminal
"let envInNvim=$IN_NVIM
"let g:jellybeans_background_color = "000000"
"if empty(envInNvim)
"  colorscheme jellybeans
"  let $IN_NVIM=1
"else
"endif
" }}}


" vim-plug {{{

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-sandwich'
"Plug 'scrooloose/syntastic' -- Neomake is handling this now
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'groenewege/vim-less'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'rking/ag.vim'
Plug 'XadillaX/json-formatter.vim'
Plug 'bling/vim-airline'
" nvim within nvim (broken) {{{
" only load datetime for outer nvim, not nvims run from nvim
"if empty(envInNvim)
"  Plug 'ompugao/vim-airline-datetime'
"endif
" }}}
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/taglist.vim'
Plug 'godlygeek/tabular'
Plug 'moll/vim-node'
Plug 'rdio/jsfmt'
Plug 'mephux/vim-jsfmt'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people',{'for': 'clojure'}
Plug 'gregsexton/MatchTag'
Plug 'gregsexton/gitv'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'regedarek/ZoomWin'
Plug 'editorconfig/editorconfig-vim'
Plug 'Olical/vim-enmasse'
Plug 'walm/jshint.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tomas/molokai'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-startify'
"Plug 'szw/vim-ctrlspace'
Plug 'neovim/node-host'
"Plug 'nanotech/jellybeans.vim'
Plug 'kassio/neoterm'

" nvim within nvim (broken) {{{
" Inner / Outer Nvim and theme
"set background=light
"if empty($IN_NVIM)
"  colorscheme jellybeans
"  let $IN_NVIM=1
"else
"  colorscheme molokai
"endif
" }}}


call plug#end()

" }}}

filetype plugin indent on

colorscheme molokai

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
"autocmd BufWinEnter * highlight ColorColumn ctermbg=233
"set colorcolumn=80
" }}}

" Plugins {{{


" Ack/Ag {{{
let g:ackprg  = 'ag --nogroup --nocolor --column'
let g:grepprg = 'ag --nogroup --nocolor --column'
" }}}
" Airline {{{

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
"let g:airline_section_z = '%3p%% %4l %3c'
let g:airline#extensions#hunks#non_zero_only = 1

" }}}
" CtrlP {{{
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
"
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" }}}
" Git gutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn
" }}}
" github {{{
" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" }}}
" pangloss/vim-javascript {{{
" General conceal settings. Will keep things concealed
" even when your cursor is on top of them.
set conceallevel=1
set concealcursor=nvic

" vim-javascript conceal settings.
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"
" }}}
" Tabularize {{{
"map <Leader>e :Tabularize /=<cr>
"map <Leader>c :Tabularize /:<cr>
"map <Leader>es :Tabularize /=\zs<cr>
"map <Leader>cs :Tabularize /:\zs<cr>
" }}}
" benekastah/neomake {{{
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake

" }}}
" Camel Case Motion {{{
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"sunmap w
"sunmap b
"sunmap e
" }}}


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

iabbrev ccopy Copyright Me, All Rights Reserved.

iabbrev cxl console.log(
iabbrev mxp 'use strict';<CR><CR>module.exports =
iabbrev fnctor /*jshint validthis:true*/<CR>if(this.constructor !== ){<CR>return new ();<CR>}<CR>
iabbrev fxn function (){<CR><CR>}<Up><Up><Right><Right><Right><Right><Right><Right><Right>
iabbrev hxl <!DOCTYPE html><cr><html><cr><head><cr><meta charset="utf8"/><cr><title>title</title><cr></head><cr><body><cr><cr></body><cr></html>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" visually select, then url encode or decode.
vnoremap <leader>% :!~/bin/url-encode-decode<cr>
vnoremap <leader>5 :!base64<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

function! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction
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

" vim.wikia stuff {{{


" search and replace in all open buffers
" from " http://vim.wikia.com/wiki/Search_and_replace_in_multiple_buffers
"
"  :bufdo %s/pattern/replace/ge | update
"
" Explanation
" bufdo     Apply the following commands to all buffers.
" %         Search and replace all lines in the buffer.
" s         Do substitution
" pattern   Search pattern.
" replace   Replacement text.
" g         Change all occurrences in each line (global).
" e         No error if the pattern is not found.
" |         Separator between commands.
" update    Save (write file only if changes were made).[

" QuickfixToggle {{{
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
" }}}

" Zoom / Restore window {{{
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command!  ZoomToggle call s:ZoomToggle()
" }}}

" Kwbd {{{
" delete the buffer; keep windows; create a scratch buffer if no buffers left
" SOURCE http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window
function! s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction
command! Kwbd call s:Kwbd(1)
" }}}

" }}}

" my mappings {{{
"nnoremap <leader>f :call QuickfixToggle()<cr>
nnoremap <silent> <leader>z :ZoomToggle<CR>
nnoremap <silent> <leader>d :Kwbd<cr>

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>l :ls<cr>
nnoremap <leader>, :bnext<cr>
nnoremap <leader>. :bprevious<cr>
nnoremap <leader>e :lnext<cr>
nnoremap <leader>E :lprev<cr>
nnoremap <leader>r maywggovar <esc>pa = require('<esc>pa');<esc>`a
nnoremap <leader>f ywjofor(var i=0;i<<esc>pa.length;i++){<cr><tab><esc>pxa = <esc>pa[i];<cr>}<cr>
nnoremap <leader>b :cnext<cr>
nnoremap <leader>n :cprevious<cr>

vnoremap <leader>% :!~/bin/url-encode-decode<cr>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


inoremap jk <esc>
inoremap <esc> <nop>

cnoremap Bd bd
cnoremap BD bd

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" }}}

" more Settings {{{
"
set scrolloff=7
set magic
set lazyredraw
set nobackup
set nowb
set noswapfile

" }}}

" fns {{{

"TODO
" add #names for autoloading

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
set wildignore+=*/dist/*

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
command! -range Htmldecode call HtmlEntities(<line2>, <line2>, 0)
command! -range Htmlencode call HtmlEntities(<line1>, <line2>, 1)



""  http://stackoverflow.com/questions/22206332/vim-ag-search-and-replace-globally-and-within-a-directory

" My Usage
" :Ag search
" :Qfdo s/search/replace/
"
" .vim/plugin/qfdo.vim
" Run a command on each line in the Quickfix buffer.
" Qfdo! uses the location list instead.
" Author: Christian Brabandt
" Author: Douglas
" See: http://vim.1045645.n5.nabble.com/execute-command-in-vim-grep-results-td3236900.html
" See: http://efiquest.org/2009-02-19/32/
" Usage:
"     :Qfdo s#this#that#
"     :Qfdo! s#this#that#
"     :Qfdofile %s#this#that#
"     :Qfdofile! %s#this#that#

" Christian Brabandt runs the command on each *file*
" I have mapped Qfdo to line-by-line below
function! QFDo(bang, command)
   let qflist={}
   if a:bang
      let tlist=map(getloclist(0), 'get(v:val, ''bufnr'')')
   else
      let tlist=map(getqflist(), 'get(v:val, ''bufnr'')')
   endif
   if empty(tlist)
      echomsg "Empty Quickfixlist. Aborting"
      return
   endif
   for nr in tlist
      let item=fnameescape(bufname(nr))
      if !get(qflist, item,0)
            let qflist[item]=1
      endif
   endfor
   execute 'argl ' .join(keys(qflist))
   execute 'argdo ' . a:command
endfunction

" Run the command on each *line* in the Quickfix buffer (or location list)
" My own crack at it, based on Pavel Shevaev on efiquest
function! QFDo_each_line(bang, command)
   try
      if a:bang
         silent lrewind
      else
         silent crewind
      endif
      while 1
         echo bufname("%") line(".")
         execute a:command
         if a:bang
            silent lnext
         else
            silent cnext
         endif
      endwhile
   catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/
   endtry
endfunction

command! -nargs=1 -bang Qfdo :call QFDo_each_line(<bang>0,<q-args>)
command! -nargs=1 -bang Qfdofile :call QFDo(<bang>0,<q-args>)


" terminal
set switchbuf+=useopen
function! TermEnter()
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, "term://") > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
        break
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches >= 1)
    execute ":sbuffer ". firstmatchingbufnr
    startinsert
  else
    execute ":terminal"
  endif
endfunction
"map <F12> :call TermEnter()<CR>

"}}}

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Macros {{{
" zw formatter
let @w='^dt xjdt)j.j.jj.kddkkkr-Vjj~wwdw~w.^jw~jjjjj'
" }}}

" CtrlSpace commented out {{{

"if executable("ag")
"  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
"endif

"set showtabline=0

"hi link CtrlSpaceNormal   PMenu
"hi link CtrlSpaceSelected PMenuSel
"hi link CtrlSpaceSearch   Search
"hi link CtrlSpaceStatus   StatusLine
""hi CtrlSpaceSearch guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
" }}}

" Startify {{{
let g:startify_list_order = [
      \ [ 'Bookmarks' ] , 'bookmarks' ,
      \ [ 'Sessions'  ] , 'sessions' ,
      \ [ 'Files'     ] , 'files',
      \ [ 'Dirs'      ] , 'dir'
      \ ]

let g:startify_bookmarks = [
      \ {'n': '~/.nvimrc'},
      \ {'v': '~/.vimrc'},
      \ {'z': '~/github/markmontymark/zw/package.json'},
      \ {'Z': '~/.zshrc'}
      \ ]
" }}}

" Nvim terminal {{{

" Workspace Setup
" function! DefaultWorkspace()
"     vsp term://zsh
"     file Copier
"     sp term://zsh
"     file Builder
"     wincmd k
"     "resize 4
"     wincmd h
"     "vertical resize 130
" endfunction
" command! -register DefaultWorkspace call DefaultWorkspace()

" when entering terminal buffer, automatically enter insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" }}}

" misc commented out stuff {{{
" https://www.reddit.com/r/neovim/comments/3447p3/i_was_inspired_to_check_out_neovim_after_hearing/
" au WinEnter * vertical resize 104

" move around splits
" below <C-h> required (in OSX) to fix terminfo with this in .zshrc
""     ## FIX <C-h> mapping in neovim for Terminal app in OS x
""     ## from https://github.com/neovim/neovim/issues/2048, tarruda commented on Mar 10
""     infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
""     tic $TERM.ti
" }}}

