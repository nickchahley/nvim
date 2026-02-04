""" Make vim PEP-8 friendly
" Sane defaults (?)
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=100
setlocal smarttab
setlocal expandtab
setlocal fileformat=unix

" Nicer comment indentation
"set nosmartindent

" Preview folded docstrings in py SimpylFold
" let g:SimpylFold_docstring_preview = 1

set foldmethod=indent
" TODO: would be great if this worked
" Use treesitter folding (any nvim-treesitter-pyfold)
" set foldmethod=expr
" set foldexpr=nvim_treesitter#fold_expr()

inoremap <buffer> >> <Esc>:normal! a-><CR>a

" Exec python. Show output in split
function! Termpy()
  exec winheight(0)/4."split" | terminal python3 %
endfunction
map <leader>P :call Termpy() <CR>
" Exec python on current file. Output shows but not in a buffer.
map <leader>p :w<CR>:!python3 %<CR>
