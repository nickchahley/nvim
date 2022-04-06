" Fix Movement Mappings For Colemak Layout

" restore movement keys
noremap <buffer> i gk
noremap <buffer> o l
noremap <buffer> I @='5gk'<CR>
noremap <buffer> O @='5l'<CR>

" assign replacement binds to functions which were on move keys
nnoremap <buffer> <silent> <Leader>i :call netrw#Call('NetrwListStyle', 1)<CR>
nnoremap <buffer> <silent> <Leader>o :call netrw#Call('NetrwSplit', 3)<CR>
nnoremap <buffer> <silent> <Leader>I :call netrw#Call('NetrwBannerCtrl', 1)<CR>
nnoremap <buffer> <silent> <Leader>O :call netrw#Call('NetrwObtain', 1)<CR>

