""" Markdown Settings
""" Note: cursorline off by default, which is fine, \C to toggle

setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal wrapmargin=0
set nonumber

"" Config of vim-markdown runtime files (see tpope/vim-markdown)
"let g:markdown_folding=1
"let g:markdown_fenced_languages = ['html', 'python', 'bash']
"silent! :%foldopen!

"" Highlight trailing spaces
" Using match groups already in colorscheme : 1, 2, 3+
syntax match Todo  "\s$"
syntax match Visual "\s\{2}$"
syntax match Error  "\s\{3,}$"

" Using new match group def : 2
"highlight MarkdownTrailingSpaces ctermbg=green guibg=green
"syntax match MarkdownTrailingSpaces "\s\{2}$"

