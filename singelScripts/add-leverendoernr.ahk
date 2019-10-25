SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

if(lNR==""){
	MsgBox Mangler Leverandørnr (lNR)
	ExitApp
}

WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe

Send {WheelUp}

sleep 200

click 47, 236
Send ^a^c
sleep 200

vnr := Trim(clipboard)

tab(44)
Send %lNR%
tab(1)
Send %vnr%
tab(1)
Send ^{PgDn}
