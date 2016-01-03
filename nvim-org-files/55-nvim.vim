
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
