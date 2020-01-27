" Converting from messed up vimwiki+markdown syntax to plain vimwiki because
" things like renaming cmds work on it

function! ConvertVimwiki()
	" Headers from # header to = header =
	silent! %s/\(^\t*\)#\(.*\)/\1=\2 =/    " add space between text and first =
	silent! %s/\(^\t*=\+\)#\(.*\)/\1=\2=/  " no space, repeat 4x to catch all levels
	silent! %s/\(^\t*=\+\)#\(.*\)/\1=\2=/ 
	silent! %s/\(^\t*=\+\)#\(.*\)/\1=\2=/ 
	silent! %s/\(^\t*=\+\)#\(.*\)/\1=\2=/ 

	" Links
	silent! %s/\[\(.*\)\](\(.*\))/[[\2|\1]]/
	
	" Change diary links from ../diary/ or diary/ to diary:
	silent! %s/\M..\/diary\/\|diary\//diary:/g
endfunction
