@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if not %errorLevel% == 0 (
        echo.
        echo FEJL: Højreklik på scriptet og klik "kør som administrator"
        echo.
        echo Bruger:  Admin 
        echo Kode:    SP2015
        echo.
        echo.
        echo Tryk Enter for at lukke dette vindue
        
        pause >nul
    )
echo.
echo.
echo Begynder nu
echo.
net stop spooler
del %systemroot%\System32\spool\printers\* /Q /F /S
net start spooler
echo.
echo Færdig