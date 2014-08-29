SET DOTFILES_PATH=%~dp0
CD %DOTFILES_PATH%
del %USERPROFILE%\.vimrc
mklink %USERPROFILE%\.vimrc %DOTFILES_PATH%.vimrc
del %USERPROFILE%\.gvimrc
mklink %USERPROFILE%\.gvimrc %DOTFILES_PATH%.gvimrc
pause
