" Vimwiki: local/buffer options
syntax enable

setlocal shiftwidth=4
setlocal tabstop=4
setlocal nonumber
setlocal norelativenumber
setlocal fo=
set tw=0
setlocal foldlevel=99 " Folds open by default
setlocal linespace=2 " windows gui req resize window to see command bar
redraw

" Override vimwiki's default o/O vimwiki#lst#kbd_o(), see ftplugin/vimwiki.vim 487
" Restore the o/O maps to movement
silent! nunmap <silent> <buffer> o
nnoremap o l
silent! nunmap <silent> <buffer> O
nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
" Map h/H to the vimwiki command
nnoremap <silent> <buffer> h :<C-U>call vimwiki#lst#kbd_o()<CR>
nnoremap <silent> <buffer> H :<C-U>call vimwiki#lst#kbd_O()<CR>

" Disable my werid line number toggle autogroup
" This will do so for all buffers, but fuck it
" autocmd! numbertoggle

" Snips compatability. Use F9 to expand b/c tab is taken now.
"ultisnips
vmap <F9> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
imap <F9> <C-R>=UltiSnips#ExpandSnippet()<CR>


imap <silent><expr> <F9> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<F9>' 
inoremap <silent> <S-F9> <cmd>lua require'luasnip'.jump(-1)<Cr>
"
