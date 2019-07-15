""" Make vim PEP-8 friendly
" Sane defaults (?)
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal fileformat=unix

" Nicer comment indentation
"set nosmartindent

" Preview folded docstrings in py SimpylFold
let g:SimpylFold_docstring_preview = 1

" Make code look pretty
"let python_highlight_all=1
"syntax on

" Press F5 to save script and execute in a blank screen
nnoremap <silent> <F5> :!clear;python %<CR>

" Try and correct issue where airline dissapears when editing a new python file
" if we were good we'd check first to see that Airline is loaded
" I don't think this is a problem anymore
"autocmd Filetype python AirlineRefresh

