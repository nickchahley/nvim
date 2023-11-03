" Capitalize first letter of each word
function! Titlecase()
	s/\v<(.)(\w*)/\u\1\L\2/g
endfunction
" like gu/gU
nnoremap <leader>gT :call Titlecase()<cr>
vnoremap <leader>gT :call Titlecase()<cr>
