
-- Load local functions (bite sized plugins)
vim.cmd([[source $FUNCTIONS/ToggleStatusline.vim]])

-- Hilighting
vim.cmd([[hi MatchParen gui=NONE cterm=NONE guibg=NONE  guifg=YELLOW ctermfg=YELLOW]])
vim.cmd([[ 
		"Highlight current line and allow toggling
		function! ToggleCursorLine()
			hi CursorLineNr guifg=#FF5C57 guibg=NONE ctermbg=NONE
			hi CursorLine guibg=NONE ctermbg=NONE
			set cursorline! " toggle highlight current line
		endfunction
		nnoremap <Leader>C :call ToggleCursorLine()<CR>
		call ToggleCursorLine()
]])
-- Return to previous line when reopeing a file
vim.cmd([[
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ 	execute 'normal! g`"zvzz' |
			\ endif
	augroup END
]])
