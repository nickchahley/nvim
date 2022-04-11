" Tweaks for nvim-qt on Windows
" Why is this a sep file and not in init.vim like the rest of the GUI hooks?
if has('win32') || has('win64')
	" Disable guitab bar and use the terminal tab bar (eg, AirLine)
	GuiTabline 0
	" Silently call and hopefully silently use fallback font if DNE
	GuiFont! Hack:h10
endif
" hdpi on surface vs external monitor. One day should copy an actual
" function to in/de the font size
nnoremap <C-9> :GuiFont Hack:h10<CR>
nnoremap <C-0> :GuiFont Hack:h12<CR>
