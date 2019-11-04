REM link the nvim binary to ProgramFiles

SET vimbin="%USERPROFILE%\Neovim\bin\nvim-qt.exe"

if not exist "C:\Program Files\Neovim" (
	md "C:\Program Files\Neovim"
)
if not exist "C:\Program Files\Neovim\nvim-qt.exe" (
	mklink /D "C:\Program Files\Neovim\nvim-qt.exe" %vimbin%
)

