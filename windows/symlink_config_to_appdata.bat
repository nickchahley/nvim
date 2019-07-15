REM This is where nvim seems to expect init.vim, but it sucks to actually keep
REM the files in AppData
mklink /D "%LOCALAPPDATA%\nvim" "%USERPROFILE%\Neovim\nvim"
