" Vars to set before loading plugins

let g:mapleader = " "
let g:ctrlspace_use_tabline = 1
let g:airline_exclude_preview = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:rainbow_active = 1

" sonictemplate {{{
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/modules/templates/'
" }}}

let g:envInNvim=$IN_NVIM
if ! empty(g:envInNvim)
  let $IN_NVIM = $IN_NVIM + 1
else
  let $IN_NVIM = 1
endif
