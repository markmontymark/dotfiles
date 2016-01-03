
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
      \ {'Z': '~/.zshrc'}
      \ ]
" }}}

" }}}
