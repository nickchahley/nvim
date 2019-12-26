" Tweaks for nvim-qt on Windows
if has('win32') || has('win64')
	" Disable guitab bar and use the terminal tab bar (eg, AirLine)
	GuiTabline 0
	" Silently call and hopefully silently use fallback font if DNE
	GuiFont Hack:h10
endif

