" Drafts for prose / latex content
"
" Following http://www.terminally-incoherent.com using-vim-for-writing-prose

" t: tw autowrap; n: recognize numbered lists; a: real-time reformatting
setlocal formatoptions=ant

" enable/disable auto insertion of comment leader after hitting..
setlocal formatoptions-=r " <Enter> in insert mode
setlocal formatoptions-=o " opening a line above/below in normal mode
setlocal formatoptions+=c " autowrap comments using textwidth

setlocal textwidth=80
setlocal wrapmargin=0
setlocal nonumber

" Comments


" Let f/F find characters over multiple lines
" FIXME doesn't allow chaining commands (df.), doesn't work w/ vmap
function! FindChar()
	let c = nr2char( getchar() )
  let match = search('\V' . c)
endfunction

function! FindCharBack()
	let c = nr2char( getchar() )
  let match = search('\V' . c, 'b')
endfunction

nmap f :call FindChar()<CR>
nmap F :call FindCharBack()<CR>
" Visual mode map doesn't work, calls function and exits vmode
"vmap f :call FindChar()<CR>
"vmap F :call FindCharBack()<CR>

" Goyo Custom {{{
" 	g:goyo_width  (def: 80)
" 	g:goyo_height (def: 85%)
" 	g:goyo_liner  (def: 0)
function! s:goyo_enter()
	set scrolloff=999
	Limelight
endfunction

function! s:goyo_leave()
	set scrolloff=5
	Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}
Goyo " Enter goyo mode on file open
