	" Highlight current line and allow toggling
	" Function b/c xml files don't respect our color changes?
	function! ToggleCursorLine()
		hi CursorLineNr guifg=#FF5C57 guibg=NONE ctermbg=NONE
		hi CursorLine guibg=NONE ctermbg=NONE
		set cursorline! " toggle highlight current line
	endfunction
