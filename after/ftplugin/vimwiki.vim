" Vimwiki: local/buffer options

setlocal shiftwidth=4
setlocal tabstop=4
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal fo+=t

" Override vimwiki's default o/O vimwiki#lst#kbd_o(), see ftplugin/vimwiki.vim 487
" Restore the o/O maps to movement
nunmap <buffer> o
nnoremap o l
nunmap <buffer> O
nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
" Map h/H to the vimwiki command
nnoremap <silent> <buffer> h :<C-U>call vimwiki#lst#kbd_o()<CR>
nnoremap <silent> <buffer> H :<C-U>call vimwiki#lst#kbd_O()<CR>
