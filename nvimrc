
" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Wraps paths to make them relative to this directory.
" function! Dot(path)
"   return '~/.config/nvim/' . a:path
" endfunction
"
" " Load all configuration modules.
" for file in split(glob(Dot('modules/*.vim')), '\n')
"   execute 'source' file
" endfor

" Plugin Manager: vim-plug
" github.com/junegunn/vim-plug
"
if has('win32') || has ('win64')
  let $VIMHOME = $HOME . "/AppData/Local/nvim"
else
  let $VIMHOME = $HOME . "/.config/nvim"
endif
echom $VIMHOME

"  plugin manager {{{
"
" First time run, gets/installs vim-plug and tries to PlugInstall
if empty(glob($VIMHOME . '/autoload/plug.vim'))
  if has('win32') || has ('win64')
    silent !curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  else
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
endif

" }}}
"  pre plugin loading config {{{
" Vars to set before loading plugins

let g:mapleader = " "
let g:ctrlspace_use_tabline = 1
let g:airline_exclude_preview = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:rainbow_active = 1

let g:envInNvim=$IN_NVIM
if ! empty(g:envInNvim)
  let $IN_NVIM = $IN_NVIM + 1
else
  let $IN_NVIM = 1
endif

" }}}
" load plugins {{{

call plug#begin($VIMHOME . '/plugged')

"Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
"Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-sandwich'

" project organization
Plug 'mhinz/vim-startify'
Plug 'szw/vim-ctrlspace'

"Plug 'scrooloose/syntastic' -- Neomake is handling this now with help from
"jshint

" js / css / html
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'XadillaX/json-formatter.vim'
Plug 'gregsexton/MatchTag'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim' " html editting short cuts, <c-y>/  <c-y>,
Plug 'walm/jshint.vim'
"Plug 'ternjs/tern_for_vim'

" vim plugin plugins
Plug 'moll/vim-node'

" go
Plug 'fatih/vim-go', { 'for': 'go' }

" clj
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
"Plug 'guns/vim-sexp', {'for': 'clojure'}
"Plug 'tpope/vim-sexp-mappings-for-regular-people',{'for': 'clojure'}

" multi-lang plugins
Plug 'Chiel92/vim-autoformat'
Plug 'Olical/vim-enmasse'
Plug 'janko-m/vim-test'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" nvim within nvim (broken) {{{
" only load datetime for outer nvim, not nvims run from nvim
if empty(g:envInNvim)
  Plug 'ompugao/vim-airline-datetime'
endif
" }}}

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

" searching
" replaced ctrlp with fzf
"Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'

Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'

" vim+tmux, partially obselete, using nvim as terminal manager
" Plug 'benmills/vimux'
" Plug 'regedarek/ZoomWin'

Plug 'neovim/node-host' " write vim plugins in JS
Plug 'benekastah/neomake'
Plug 'kassio/neoterm'

" vim colorschemes
"Plug 'tomas/molokai'
"Plug 'nanotech/jellybeans.vim'


call plug#end()

" }}}
" fns  {{{

function! ColumnAdder(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use gv command.
    silent execute "normal! gvy"
  elseif a:type == 'line'
    silent execute "normal! '[V']y"
  else
    silent execute "normal! `[v`]y"
  endif

  let nums = split(@@)
  let c = 0
  for i in nums
    if strridx(i,'.') >= 0
      let c += str2float(i)
    else
      let c += str2nr(i)
    endif
  endfor
  echo c

  let &selection = sel_save
  let @@ = reg_save
  silent execute "normal! gv"
endfunction
vnoremap <leader>P :<C-U>call ColumnAdder(visualmode(), 1)<CR>


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
"
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

" Kwbd {{{
"
" This is mapped to <leader>d
" It deletes the buffer from the buffer list without screwing up your splits
" or exiting if only 1 buffer is open prior to calling Kwbd
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

" }}}
" sets {{{

" Switch syntax highlighting on, when the terminal has colors
syntax on

set history=100    " Command history
set ruler          " Always show cursor
set showcmd        " Show incomplete commands
"set incsearch     " Incremental searching (search as you type)

set hlsearch       " Highlight search matches
set smartcase      " Ignore case in search

set ignorecase     " Make sure any searches dont need the \c escape character

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden
set wrap           " Turn word wrap on/off
set backspace=indent,eol,start " Allow backspace to delete end of line, indent and start of line characters

" Convert tabs to spaces if we're not editting AppMeasurement files
if($APPM != 1)  " AppMeasurement prefers tabs over spaces
  set expandtab
endif

set tabstop=2    " Set tab size in spaces (this is for manual indenting)
set shiftwidth=2 " The number of spaces inserted for a tab (used for auto indenting)
set number       " Turn on line numbers

"set list listchars=tab:\ \ ,trail:·   " Highlight trailing whitespace

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=250 ttimeoutlen=100
set laststatus=2      " Always show status bar
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)     " Set the status line to something useful
set guioptions-=T " Hide the toolbar

"set encoding=utf-8 " this is default in neovim  UTF encoding

set autoread    " Autoload files that have changed outside of vim

" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed " Use system clipboard
set shortmess+=I  " Don't show intro
set splitbelow " Better splits, new windows appear below
set splitright " and to the right
set cursorline " Highlight the current line
set visualbell " Ensure Vim doesn't beep at you every time you make a mistype
set wildmenu   " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set lazyredraw " redraw only when we need to (i.e. don't redraw when executing a macro)
set showmatch " highlight a matching [{()}] when cursor is placed on start/end character
let g:netrw_liststyle=3 " Set built-in file system explorer to use layout similar to the NERDTree plugin
set pastetoggle=<F2>

"autocmd BufWinEnter * highlight ColorColumn ctermbg=233   " Always highlight column 80 so it's easier to see where cutoff appears on longer screens
"set colorcolumn=80

set scrolloff=7
set magic
set nobackup
set nowritebackup
set noswapfile

" Keep undo history across sessions, by storing in file.
silent !mkdir $VIMHOME/backups > /dev/null 2>&1
set undodir=$VIMHOME/backups
set undofile


" Will insert tab at beginning of line, will use completion if not at beginning
set wildmode=list:longest,list:full

" Stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/dist/*,*/release/*
" end sets }}}
" plugin runtime config {{{

" Startify {{{

" All nvims

let g:startify_list_order = [
      \ [ 'Bookmarks' ] , 'bookmarks' ,
      \ [ 'Sessions'  ] , 'sessions' ,
      \ [ 'Files'     ] , 'files',
      \ [ 'Dirs'      ] , 'dir'
      \ ]

" Outer nvim aka terminal manager

if empty(g:envInNvim)
  let g:startify_bookmarks = [
      \ {'a': 'term://zsh'},
      \ {'c': 'term://zsh'},
      \ {'w': 'term://zsh'},
      \ {'n': $VIMHOME.'/init.vim'},
      \ {'z': '~/.zshrc'}
      \ ]
else

" Inner nvims
  let g:startify_bookmarks = [
      \ {'z': '~/github/markmontymark/zw/package.json'}
      \ ]
endif

" }}}
" Ack/Ag {{{
let g:ackprg  = 'ag --nogroup --nocolor --column'
let g:grepprg = 'ag --nogroup --nocolor --column'
" }}}
" Airline {{{

let g:airline_powerline_fonts = 0
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
let g:airline_symbols.whitespace = 'Ξ'

" remove branch from section_b
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'
" clear out fileencoding/format from section_y
let g:airline_section_y = ''
"let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3c'
"let g:airline_section_z = '%3p%% %4l %3c'
let g:airline#extensions#hunks#non_zero_only = 1

" }}}
" CtrlP (commented out, see FZF below) {{{
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
"let g:ctrlp_use_caching = 0
"if executable('ag')
"  set grepprg=ag\ --nogroup\ --nocolor
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"  let g:ctrlp_prompt_mappings = {
"        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
"        \ }
"endif

" }}}
" FZF {{{
nnoremap <c-p> :Files<cr>
" }}}
" easymotion {{{
map <Leader> <Plug>(easymotion-prefix)
" Gif config
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
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
" TODO wrap this with has('win32') || has('win64') because had problems with
" /dev/null in win?
autocmd! BufWritePost * Neomake

" }}}
" CtrlSpace {{{

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceUseUnicode = 0

if exists("g:CtrlSpaceLoaded")                  " ctrl-space plugin does its own fancy buffer/tab organization
  set showtabline=0
endif

hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
"hi CtrlSpaceSearch guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
" }}}

" }}}
" maps {{{

" Notes about recursion in mappings
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
" to map something in just INSERT mode use :imap or :inoremap
" to map something in just TERMINAL mode use :tmap or :tnoremap

" I forget very often that I have this mapping and still type a : all the time :/
nnoremap ; :

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
iabbrev adn and
iabbrev tehn then
iabbrev waht what
iabbrev woh who
iabbrev amddef "use strict";<cr>/*global define*/

iabbrev ccopy Copyright Me, All Rights Reserved.

iabbrev cxl console.log(
iabbrev mxp 'use strict';<CR><CR>module.exports =
"iabbrev fnctor /*jshint validthis:true*/<CR>if(this.constructor !== ){<CR>return new ();<CR>}<CR>
iabbrev rxq <esc>maywggovar <esc>pa = require('<esc>pa');<esc>`a
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

"if exists("g:CtrlSpaceLoaded")                  " ctrl-space plugin does its own fancy buffer/tab organization
"  nnoremap <leader>, :CtrlSpaceGoDown<cr>
"  nnoremap <leader>. :CtrlSpaceGoUp<cr>
"else
nnoremap <leader>, :bnext<cr>
nnoremap <leader>. :bprevious<cr>
"endif

nnoremap <leader>e :lnext<cr>
nnoremap <leader>E :lprev<cr>
nnoremap <leader>f ywjofor(var i=0;i<<esc>pa.length;i++){<cr><tab><esc>pxa = <esc>pa[i];<cr>}<cr>
nnoremap <leader>b :cnext<cr>
nnoremap <leader>n :cprevious<cr>

vnoremap <leader>% :!~/bin/url-encode-decode<cr>

" Cycle through Next / previous project, aka cycle through nested terminal buffers
if empty(g:envInNvim)
  tnoremap <leader>p, <c-\><c-n>:bnext<cr>
  tnoremap <leader>p. <c-\><c-n>:bprevious<cr>
  tnoremap <leader>pl <c-\><c-n>:ls<cr>
  tnoremap <leader>pn <c-\><c-n>:b<space>

  nnoremap <leader>pl :ls<cr>
  nnoremap <leader>p, :bnext<cr>
  nnoremap <leader>p. :bprevious<cr>
  tnoremap <leader>pn <c-\><c-n>:b<space>
else
  tnoremap <leader>p, <c-\><c-n>:bnext<cr>
  tnoremap <leader>p. <c-\><c-n>:bprevious<cr>
  tnoremap <leader>pl <c-\><c-n>:ls<cr>
  tnoremap <leader>pn <c-\><c-n>:b<space>

  nnoremap <leader>p, <c-\><c-n>:bnext<cr>
  nnoremap <leader>p. <c-\><c-n>:bprevious<cr>
  nnoremap <leader>pn <c-\><c-n>:b<space>
  nnoremap <leader>pl :ls<cr>
endif

"nnoremap <leader>f :call QuickfixToggle()<cr>
nnoremap <silent> <leader>z :ZoomToggle<CR>
nnoremap <silent> <leader>d :Kwbd<cr>

"function s:JobHandler(job_id, data, event)
"  if a:event == 'stdout'
"    let str = self.shell.' stdout: '.join(a:data)
"  elseif a:event == 'stderr'
"    let str = self.shell.' stderr: '.join(a:data)
"  else
"    let str = self.shell.' exited'
"  endif
"  call append(line('$'), str)
"endfunction
"
"let s:callbacks = {
"    \ 'on_stdout': function('s:JobHandler'),
"    \ 'on_stderr': function('s:JobHandler'),
"    \ 'on_exit':   function('s:JobHandler')
"    \ }

let g:job1 = 0
function! s:MyTermStart()
  vsplit
  enew
  let g:job1 = termopen('zsh')
  setlocal nobuflisted
  execute '1wincmd w'
endfunction

function! s:MyTermCall(cmd)
  if empty(g:job1)
    call s:MyTermStart()
  endif
  call jobsend(g:job1,[a:cmd ,""])
endfunction

function! s:MyTermStop()
  call jobstop(g:job1)
endfunction

command! MyTermStart   call s:MyTermStart()
command! MyTermStop    call s:MyTermStop()

command! MyTermNpmRunM    call s:MyTermCall('npm run m')
command! MyTermNpmRunTest call s:MyTermCall('npm test')

" Build project in vssplit to right of editting window
nnoremap <leader>m :MyTermNpmRunM<cr>
nnoremap <leader>mt :MyTermNpmRunTest<cr>


" Outer nvim tasks
" switch to project
"  - in a next/prev motion
"  - by name
" outer nvims
if empty(g:envInNvim)
  "echo 'using these maps'
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
" inner nvims
else
  " if $IN_NVIM == 2
  "   echo 'in-nvim is 2 (' . $IN_NVIM . ')'
  " elseif $IN_NVIM == 1
  "   echo 'in-nvim is 1 (' . $IN_NVIM . ')'
  " endif
  " echo 'using those maps'
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-h> <c-w>h
  nnoremap <C-j> <c-w>j
  nnoremap <C-k> <c-w>k
  nnoremap <C-l> <c-w>l
endif




inoremap jk <esc>
inoremap <esc> <nop>

cnoremap Bd bd
cnoremap BD bd

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" }}}
" AutoCommands {{{

" Disable paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

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
function! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
function! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}

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

" Macros {{{

" zw formatter
" let @w='^dt xjdt)j.j.jj.kddkkkr-Vjj~wwdw~w.^jw~jjjjj'
" let @e=''']V'']:s/\%d8212//ggv:s/San Diego Police//gjk'
"
let @e=''']V'']:s/San Diego Police//gjk'
let @w='jddjjI- jkwlv$~Vjj:s/\(BLOCK\|@\)//wwwwwwwwwvw~k$^wwlve~wlve~jkjji<br>jk'

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

" colors {{{
"if empty(g:envInNvim)
  "colorscheme jellybeans
colorscheme molokai
highlight Normal ctermbg=black
highlight Search cterm=NONE ctermfg=grey ctermbg=blue
highlight Visual cterm=None ctermfg=255 ctermbg=68
highlight SignColumn ctermbg=black
"else
"  colorscheme molokai
"  highlight Normal ctermbg=black
"  highlight Search cterm=NONE ctermfg=grey ctermbg=blue
"  highlight Visual cterm=None ctermfg=255 ctermbg=68
"  highlight SignColumn ctermbg=black
"endif
" }}}


filetype plugin indent on
