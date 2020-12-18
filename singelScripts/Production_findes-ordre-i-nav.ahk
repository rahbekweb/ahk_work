SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

do(){
	Send, ^c
	sleep 100
	WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe
	sleep 200
	if(WinActive("ahk_exe Microsoft.Dynamics.Nav.Client.exe")){
		do_2()
	}else{
		Loop, 10
		{
			openProgram("Microsoft.Dynamics.Nav.Client.exe", false)

			if(WinActive("ahk_exe Microsoft.Dynamics.Nav.Client.exe")){

				do_2()
			}
			sleep 500
		}
	}
}

do_2(){
	if(WinActive("ahk_exe Microsoft.Dynamics.Nav.Client.exe")){
		sleep 200
		if(checkTitle("Salgsordrer - Microsoft Dynamics NAV")){
			do_3()
		}else{
			Send ^{F3}
			sleep 200
			Send ^a
			sleep 200
			Send salgsordre
			sleep 500
			Send ^{ENTER}
			sleep 1500
			do_3()
		}
	}
}

do_3(){
	if(checkTitle("Salgsordrer - Microsoft Dynamics NAV")){
		sleep 200
		click 1402, 207
		sleep 500
		Send {F3}
		sleep 200
		Send ^a
		sleep 200
		Send %clipboard%
		Send {ENTER}
		sleep 1000
		Send !{tab}
		sleep 200
		Send {down}
	}
}

if(WinActive("ahk_exe chrome.exe")){
	if(checkTitle("Production Kontakt kunder - Google Sheets – Google Chrome")){
		clipsaved:= ClipboardAll
		do()
		Clipboard := clipsaved
		Send ^c
	}else{
		MsgBox du skal være i det rigtige regneark
	}
}else{
	MsgBox du skal være i chrombrowseren
}

ExitApp

Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script