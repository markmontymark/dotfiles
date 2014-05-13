" essential.vim

set nocompatible
filetype plugin on

" filetype plugin indent on
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
" filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set term=xterm-256color
" filetype plugin indent on
syntax on

set smartcase


execute pathogen#infect()

set tabstop=3
set shiftwidth=3
set ruler
set hls
au BufRead,BufNewFile *.json set filetype=javascript

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" from /usr/local/go/misc/vim/readme.txt, for 'go fmt'ing files on save
" autocmd FileType go autocmd BufWritePre <buffer> Fmt

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" tab navigation like firefox

nnoremap <S-tab> gt
nnoremap <S-A-tab> gT
nnoremap <S-Right> gt
nnoremap <S-Left> gT
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

nmap <C-g> :TagbarToggle<CR> 
