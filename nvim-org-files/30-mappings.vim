
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
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>l :ls<cr>
if exists("g:CtrlSpaceLoaded")                  " ctrl-space plugin does its own fancy buffer/tab organization
  nnoremap <leader>, :CtrlSpaceGoDown<cr>
  nnoremap <leader>. :CtrlSpaceGoUp<cr>
else
  nnoremap <leader>, :bnext<cr>
  nnoremap <leader>. :bprevious<cr>
endif
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
