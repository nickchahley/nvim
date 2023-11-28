setlocal number
" R- two common n spaces for indentation: 2 ("hadley and others"), 4
" (bioconductor)
setlocal shiftwidth=2 smarttab expandtab
setlocal tabstop=2 softtabstop=0
" trying some autoindentation shenans
setlocal cinoptions=(0
setlocal cindent
setlocal foldmethod=indent
setlocal fo+=cr

execute "ToggleDiagOff"
