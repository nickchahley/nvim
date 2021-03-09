REM Must be run as admin
REM link the nvim binary to ProgramFiles

SET vimbin="%USERPROFILE%\Neovim\bin\nvim-qt.exe"
SET vimbin2="%USERPROFILE%\Neovim\bin\nvim.exe"

if not exist "C:\Program Files\Neovim" (
	md "C:\Program Files\Neovim"
)
if not exist "C:\Program Files\Neovim\nvim-qt.exe" (
	mklink "C:\Program Files\Neovim\nvim-qt.exe" %vimbin%
	mklink "C:\Program Files\Neovim\nvim-qt.exe" %vimbin2%
)

