call plug#begin('~/.config/nvim/plugged')

"Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-projectionist'
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
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'XadillaX/json-formatter.vim'
Plug 'gregsexton/MatchTag'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim' " html editting short cuts, <c-y>/  <c-y>,
Plug 'walm/jshint.vim'
Plug 'ternjs/tern_for_vim'

" vim plugin plugins
Plug 'moll/vim-node'

" go
Plug 'fatih/vim-go', { 'for': 'go' }

" clj
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people',{'for': 'clojure'}

" multi-lang plugins
"   COMMENTED 2016-10-05   Plug 'Chiel92/vim-autoformat'
Plug 'Olical/vim-enmasse'
Plug 'janko-m/vim-test'

Plug 'bling/vim-airline'
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
"Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/utl.vim'

Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'

" vim+tmux, partially obselete, using nvim as terminal manager
" Plug 'benmills/vimux'
" Plug 'regedarek/ZoomWin'

Plug 'neovim/node-host' " write vim plugins in JS
Plug 'benekastah/neomake'
Plug 'kassio/neoterm'

Plug 'mattn/sonictemplate-vim'
Plug 'mattn/calendar-vim'
Plug 'jceb/vim-orgmode'
Plug 'lambdatoast/elm.vim'

Plug 'vimwiki/vimwiki'
Plug 'Valloric/YouCompleteMe'

Plug 'sbdchd/neoformat'
" vim colorschemes
"Plug 'tomas/molokai'
"Plug 'nanotech/jellybeans.vim'


call plug#end()

