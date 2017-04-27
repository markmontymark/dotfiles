" How to record and save into macro {{{
"
" qa (to start a recording and save it in the 'a' register)
" ...do commands
" q  (to stop recording)
" :e ~/.config/nvim/modules/50-macros.vim (open this file)
" "ap  (paste contents of register a into buffer)
" }}}

" Macros
" zw formatter
" 2015-to-mid2016
"let @w='^dt xjdt)j.j.jj.kddkkkr-Vjj~wwdw~w.^jw~jjjji<br>jk'
" mid 2016- sept 2016
let @w='jddjjI- jkwlv$~Vjj:s/\(BLOCK\|@\)//wwwwwwwwwvw~k$^wwlve~wlve~jkjji<br>jk'
" sept 2016- ...
" let @w='jddjjI- jkwlv$~Vjj:s/\(BLOCK\|@\)//wwwwwwwwwvw~k$^wwlve~wlve~jkjji<br>jk'


" Sample of what zw formatter formats {{{
"
" (Type) Theft/Larceny
" (Address) 3900  BLOCK OREGON STREET
" (Details) PETTY THEFT / THEFT OF PERSONAL PROPERTY / SHOPLIFT
" (Reported On) 4/20/2016 4:30:00 AM
"
" (Map it) http://www.crimemapping.com/Map.aspx?x=-13039420.54763200&y=3862113.65521305&iid=10277657&db=4/20/2016&de=4/20/2016
"
"
" zw formatter explained
" '^dt ' -- go to beginning of line and strip till first whitespace
" x      -- delete that whitespace character
" jdt)   -- move down a line, delete until ) char
" j.j.   -- move down a line, repeat delete twice
" j      -- skip over empty line
" j.     -- move down a line, repeat delete
" kdd    -- go back up and remove that empty line
" kkk  -- column-visual select first char, then also select up 3 lines
" r-     -- replace ) char with -
" Vjj~   -- line-visual select two lines and lower case
" wwdw~  -- go to street address line and uppercase first word
" w.^jw~jjjji<br>jk'
" }}}
