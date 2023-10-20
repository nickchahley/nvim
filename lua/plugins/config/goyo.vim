function! s:goyo_enter()
	lua require('lualine').hide()
	if exists('$TMUX')
		silent !tmux set status off
	endif
endfunction

function! s:goyo_leave()
	lua	require('lualine').hide({unhide=true})
	if exists('$TMUX')
		silent !tmux set status on
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
