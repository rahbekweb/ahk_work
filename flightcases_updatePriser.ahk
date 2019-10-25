SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/singelScripts/incALL.ahk

koere = 0

do(){
	global koere

	if(koere==0){
		koere = 1
		vnr = 0
		prisny = 0
		kostny = 0

		WinActivate, ahk_exe EXCEL.EXE
		Sleep 200
		Send {Home}

		Send ^c
		sleep 200
		vnr := Trim(clipboard)
		;sleep 200

		Send {right}{right}{right}^c
		sleep 200
		prisny := Trim(clipboard)
		;sleep 200

		Send {right}{right}^c
		sleep 200
		kostny := Trim(clipboard)
		;sleep 200

		Send {right}{right}{right}{right}
		FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
		Send %time%
		Send {return}
		Send [next]
		

		WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe
		sleep 300
		click 1392, 228
		Send {F3}
		sleep 500
		Send %vnr%

		Send ^+e

		sleep 1500

		if(!checkTitle("Rediger - Varekort")){
			MsgBox fejl
			koere = 0
			Return
		}

		tab(27)

		sleep 100
		Send %kostny%
		tab(1)


		sleep 100
		Send %kostny%

		tab(1)

		sleep 100
		Send %prisny%

		sleep 200
		Send {F5}
		sleep 200
		Send {esc}

		koere = 0
	}
}

$NumpadSub::
	do()
Return