" XML/HTML jumping b/t <tags>
runtime macros/matchit.vim
augroup XML
	autocmd!
	autocmd FileType xml let g:xml_syntax_folding=1
	autocmd FileType xml setlocal foldmethod=syntax
	autocmd FileType xml :syntax on
	autocmd FileType xml :%foldopen!
augroup END
"
