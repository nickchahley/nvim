REM This doesn't work and I'm not sure why
REM Also needs to be run as admin?
REM For when things are broken
REM This is where nvim seems to expect init.vim, but it sucks to actually keep
REM the files in AppData
deltree /y "%LOCALAPPDATA%\nvim" 
deltree /y "%LOCALAPPDATA%\nvim-data" 

REM While we're at it ensure that dirs for backup, undo, and swap exists
SET dir=%USERPROFILE%\Neovim\vim-backundoswap
deltree %dir%\backupfiles
deltree %dir%\undofiles
deltree %dir%\swapfiles
