REM This is where nvim seems to expect init.vim, but it sucks to actually keep
REM the files in AppData
mklink /D "%LOCALAPPDATA%\nvim" "%USERPROFILE%\Neovim\nvim"

REM While we're at it ensure that dirs for backup, undo, and swap exists
SET dir=%USERPROFILE%\Neovim\vim-backundoswap
if not exist %dir%\backupfiles (
	md %dir%\backupfiles
)
if not exist %dir%\undofiles (
	md %dir%\undofiles
)
if not exist %dir%\swapfiles (
	md %dir%\swapfiles
)
