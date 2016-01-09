" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.config/nvim/' . a:path
endfunction

" Load all configuration modules.
for file in split(glob(Dot('modules/*.vim')), '\n')
  execute 'source' file
endfor

" recreate modules below with :r !ls -d ~/.config/nvim/modules/*
" then Ctrl-V select and replace absolute path with $HOME
"$HOME/.config/nvim/modules/00-plugin-manager.vim
"$HOME/.config/nvim/modules/05-pre-plugin-load.vim
"$HOME/.config/nvim/modules/10-plugins.vim
"$HOME/.config/nvim/modules/18-fns.vim
"$HOME/.config/nvim/modules/20-sets.vim
"$HOME/.config/nvim/modules/25-plugin-conf.vim
"$HOME/.config/nvim/modules/30-mappings.vim
"$HOME/.config/nvim/modules/35-autocommands.vim
"$HOME/.config/nvim/modules/40-vim-wikia-kwbd-smarter-buffer-del.vim
"$HOME/.config/nvim/modules/40-vim-wikia-quickfixtoggle.vim
"$HOME/.config/nvim/modules/40-vim-wikia-search-n-replace.vim
"$HOME/.config/nvim/modules/40-vim-wikia-zoom-restore-window.vim
"$HOME/.config/nvim/modules/45-command-mappings.vim
"$HOME/.config/nvim/modules/50-macros.vim
"$HOME/.config/nvim/modules/55-nvim.vim
"$HOME/.config/nvim/modules/60-colors.vim


filetype plugin indent on
