" search and replace in all open buffers
" from " http://vim.wikia.com/wiki/Search_and_replace_in_multiple_buffers
"
"  :bufdo %s/pattern/replace/ge | update
"
" Explanation
" bufdo     Apply the following commands to all buffers.
" %         Search and replace all lines in the buffer.
" s         Do substitution
" pattern   Search pattern.
" replace   Replacement text.
" g         Change all occurrences in each line (global).
" e         No error if the pattern is not found.
" |         Separator between commands.
" update    Save (write file only if changes were made).[
