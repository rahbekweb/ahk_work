SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

if(WinExist("Kalender - rar@flightcases.dk - Outlook"))
{
	WinActivate, Kalender - rar@flightcases.dk - Outlook
}else{
	openProgram("outlook.exe /select outlook:calendar")
}