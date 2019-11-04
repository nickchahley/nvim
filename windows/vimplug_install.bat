REM Install vim-plug if DNE. Since WSL needs to be installed from the MS store,
REM this is done thru cmd.exe instead of curl from within nvim like on nix
REM I'm trying to have Neovim installed to %USERPROFILE%\Neovim and then
REM symlink that to %LOCALAPPDATA%\nvim since that's where the exe seems to
REM expect init.vim to be. Plugins will go to Neovim/share/plugged

SET installdir=%USERPROFILE%\Neovim\nvim\autoload
SET installfile=%installdir%\plug.vim
if not exist %installfile% (
    if not exist %installdir% (
        md %installdir%
    )
    bitsadmin /create VIMPLUG
    bitsadmin /transfer VIMPLUG https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim %installfile%
    bitsadmin /complete VIMPLUG
)
