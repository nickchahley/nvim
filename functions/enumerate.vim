" https://stackoverflow.com/questions/32052756/enumerate-existing-text-in-vim-make-numbered-list-out-of-existing-text
function! Enumerate()
	" TODO:
	" Preserve whitespace
	" Remove itemized characters at start of text (-, *, or +)
	" Per-indentation level itemization
	
	" Add enumeration at the start of each of the selected lines, preceeds
	" whitespace. Here the `g/` at the front is the same as :s/a/b/g, I think
	" <C-U>let i=1 \| '<,'>g/^/s//\=i.'. '/ \| let i=i+1 \| nohl

	" Enumerate only selected lines. Does not work properly
	" Result is (if two lines):
	" 	1. 1. line
	" 	2. 2. line
	let i=1 | '<,'>g/^/s//\=i.'. '/ | let i=i+1 

	" Enumerate ALL lines. This one works properly
	" let i=1 | g/^/s//\=i.'. '/ | let i=i+1 

	" remove any '-'
	" normal gv
	" <C-U> '<,'>s/^\(\w\)[-*]/\1/<CR>
	
endfunction

vnoremap <silent> <Leader>n :call Enumerate()<CR>
