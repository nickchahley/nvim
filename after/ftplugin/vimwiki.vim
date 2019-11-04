setlocal shiftwidth=4
setlocal tabstop=4
setlocal nonumber
setlocal nowrap
setlocal fo+=t

" Trying to override vimwiki's default o/O vimwiki#lst#kbd_o(), see
" ftplugin/vimwiki.vim 487
nunmap <buffer> o
nnoremap o l
nunmap <buffer> O
nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
