REM link the nvim binary to ProgramFiles

SET vimbin="%USERPROFILE%\Neovim\bin"

if not exist "C:\Program Files\Neovim" (
	md "C:\Program Files\Neovim"
)
if not exist "C:\Program Files\Neovim\bin" (
	mklink /D "C:\Program Files\Neovim\bin" %vimbin%
)

