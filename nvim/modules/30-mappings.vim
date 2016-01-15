
" Mappings {{
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

"if exists("g:CtrlSpaceLoaded")                  " ctrl-space plugin does its own fancy buffer/tab organization
"  nnoremap <leader>, :CtrlSpaceGoDown<cr>
"  nnoremap <leader>. :CtrlSpaceGoUp<cr>
"else
nnoremap <leader>, :bnext<cr>
nnoremap <leader>. :bprevious<cr>
"endif

nnoremap <leader>e :lnext<cr>
nnoremap <leader>E :lprev<cr>
nnoremap <leader>r maywggovar <esc>pa = require('<esc>pa');<esc>`a
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
  "if empty(g:job1)
  "  echo 'st job1 still empty'
  "else
  "  echo 'st job1 not empty'
  "endif
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
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
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
" }}
