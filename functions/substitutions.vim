" run with <selection> call Function()<CR>
" e flag is for silent errors

function! SwapQuote()
	s/"/WasDoubleQuote/ge
	s/'/"/ge
	s/WasDoubleQuote/'/ge
endfunction
" [S]way [Q]uote
nnoremap <leader>sq :call SwapQuote()<cr>
vnoremap <leader>sq :call SwapQuote()<cr>

function! FdmToStart()
	substitute/\v^([^a-zA-Z0-9\s]+)\s*(\w.*)\{\{\{\s*$/\1\{\{\{ \2/e
endfunction
function! FdmToEnd()
	s/\v^([^a-zA-Z0-9 ]+)\s*\{\{\{\s*(\w.*\w)\s*/\1 \2 \{\{\{ /e
endfunction
"[F]oldmarkers to [S]tart/[E]nd
nnoremap <leader>fs :call FdmToStart()<cr>
vnoremap <leader>fs :call FdmToStart()<cr>
nnoremap <leader>fe :call FdmToEnd()<cr>
vnoremap <leader>fe :call FdmToEnd()<cr>
