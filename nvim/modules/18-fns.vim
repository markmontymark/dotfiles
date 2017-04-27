
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



" :set tabline=%!MyTabLine()
let twds = ['one', 'two']
function! MyTabLabel(n)
    return get(g:twds, a:n - 1, '[no name]')
endfunction
"function MyTabLabel(n)
"  let buflist = tabpagebuflist(a:n)
"  let winnr = tabpagewinnr(a:n)
"  return bufname(buflist[winnr - 1])
"endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction
set tabline=%!MyTabLine()

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
"
"

"function! SwitchToNextBuffer(incr)
"  let help_buffer = (&filetype == 'help')
"  let current = bufnr("%")
"  let last = bufnr("$")
"  let new = current + a:incr
"  while 1
"    if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
"      execute ":buffer ".new
"      break
"    else
"      let new = new + a:incr
"      if new < 1
"        let new = last
"      elseif new > last
"        let new = 1
"      endif
"      if new == current
"        break
"      endif
"    endif
"  endwhile
"endfunction
"nnoremap <silent> <leader>, :call SwitchToNextBuffer(1)<CR>
"nnoremap <silent> <leader>. :call SwitchToNextBuffer(-1)<CR>
