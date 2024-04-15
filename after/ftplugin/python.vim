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

" Use treesitter folding (any nvim-treesitter-pyfold)
set foldmethod=expr
set foldexpr=nvim_treesitter#fold_expr()


inoremap <buffer> >> <Esc>:normal! a-><CR>a
