let s:hidden_statusline = 0
function! ToggleStatusline()
	if s:hidden_statusline == 0
		let s:hidden_statusline = 1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
		" set cmdheight=1
	else
		let s:hidden_statusline = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction

nnoremap <leader>h :call ToggleStatusline()<CR>
