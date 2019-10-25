SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe

Send {WheelUp}

sleep 200

click 47, 236
tab(2)
sleep 200
Send {home}
sleep 100
Send {RIGHT}{RIGHT}{RIGHT}{RIGHT}{DELETE}
tab(1)
Send ^{PgUp}