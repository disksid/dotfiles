SET DOTFILES_PATH=%~dp0
CD %DOTFILES_PATH%

FOR %%F IN (.*) DO (
  DEL %USERPROFILE%\%%F
  MKLINK %USERPROFILE%\%%F %DOTFILES_PATH%%%F
)
PAUSE
