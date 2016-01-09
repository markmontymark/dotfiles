call plug#begin('~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'
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
if empty(g:envInNvim)
  Plug 'ompugao/vim-airline-datetime'
endif
" }}}

" replaced ctrlp for fzf
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
Plug 'szw/vim-ctrlspace'
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

