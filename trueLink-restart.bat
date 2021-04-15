@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if not %errorLevel% == 0 (
        echo.
        echo FEJL: Hoejreklik paa scriptet og klik "koer som administrator"
        echo.
        echo Tryk Enter for at lukke dette vindue
        
        pause >nul
    )
echo.
echo.
echo Begynder nu
echo.
net stop TrueLink
net start TrueLink
echo.
echo SLUT