" Vimwiki: local/buffer options
syntax enable

setlocal shiftwidth=4
setlocal tabstop=4
setlocal nonumber
setlocal norelativenumber
setlocal fo=
setlocal tw=0
setlocal foldlevel=99 " Folds open by default
setlocal linespace=2 " windows gui req resize window to see command bar
redraw

" <C-Space> does not work in tmux for some reason
nnoremap <leader>t :VimwikiToggleListItem<CR>

" Override vimwiki's default o/O vimwiki#lst#kbd_o(), see ftplugin/vimwiki.vim 487
" Restore the o/O maps to movement
silent! nunmap <silent> <buffer> o
nnoremap o l
silent! nunmap <silent> <buffer> O
nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
" Map h/H to the vimwiki command
nnoremap <silent> <buffer> h :<C-U>call vimwiki#lst#kbd_o()<CR>
nnoremap <silent> <buffer> H :<C-U>call vimwiki#lst#kbd_O()<CR>

" luasnip maps that are here but I have never deliberately used
imap <silent><expr> <F9> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<F9>' 
inoremap <silent> <S-F9> <cmd>lua require'luasnip'.jump(-1)<Cr>

" Try to avoid visualmode clobbering of my navigation
vmap <F13> @<Plug>VimwikiTextObjListSingleV
vmap <F13> @<Plug>VimwikiTextObjColumnInnerV
vmap <F13> @<Plug>VimwikiTextObjTableCellInnerV
vmap <F13> @<Plug>VimwikiTextObjHeaderSubContentV
vmap <F13> @<Plug>VimwikiTextObjHeaderContentV
vmap <F13> @<Plug>VimwikiTextObjHeaderV
vmap <F13> @<Plug>VimwikiTextObjHeaderSubV
vmap <F13> @<Plug>VimwikiTextObjTableCellV
vmap <F13> @<Plug>VimwikiTextObjColumnV
vmap <F13> @<Plug>VimwikiTextObjListChildrenV

nmap <F13> @<Plug>VimwikiTableAlignQ
