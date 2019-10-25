SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/singelScripts/incALL.ahk

koere = 0

do(){
	global koere
	if(winactive("ahk_exe sublime_text.exe")){
		MsgBox, 4, , Vil du køre scriptet
			IfMsgBox, No
				Return

	}
	if(koere==0){
		koere = 1
		vnr = 0
		prisny = 0
		kostny = 0
		antalberegnet = 0

		WinActivate, ahk_exe EXCEL.EXE
		Sleep 200
		Send {Home}

		Send ^c
		sleep 200
		vnr := Trim(clipboard)
		StringReplace,vnr,vnr,`r`n,,,A
		;sleep 200

		Send {right}{right}{right}^c
		sleep 200
		prisny := Trim(clipboard)
		StringReplace,prisny,prisny,`r`n,,,A
		;sleep 200

		Send {right}{right}^c
		sleep 200
		kostny := Trim(clipboard)
		StringReplace,kostny,kostny,`r`n,,,A
		;sleep 200

		Send {right}{right}{right}{right}
		FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
		FormatTime, Date,, yyyyMMdd
		Send %time%
		Send {right}{delete}
		Send {return}
		Send [next]
		

		WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe
		sleep 500
		if(!checkTitle("Rediger - Lageropg.relseskladde")){
			MsgBox fejl det skal være Lageropgørelseskladde
			koere = 0
			Return
		}


		click 122, 107
		sleep 500
		send d
		tab(1)
		Send RAR_AUTO%Date%
		tab(6)
		Send %vnr%
		sleep 200
		Send ^{ENTER}
		sleep 800


		Send {PgDn}{up}
		Send {HOME}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}
		Send ^c
		sleep 200
		antalberegnet := Trim(clipboard)
		StringReplace,antalberegnet,antalberegnet,`r`n,,,A
		Send {RIGHT}
		
		if(antalberegnet==0){
			Send 1
			tab(4)
			Send %kostny%
		}else{
			Send 0
		}
		tab(1)

		if(antalberegnet<>0){

			MsgBox, 4, , bogfør
				IfMsgBox, No
					Return

			Send {F9}
			sleep 200
			Send j
			sleep 300
			Send {enter}

			sleep 1000

		}



		click 122, 107
		sleep 500
		send d
		tab(1)
		Send RAR_AUTO%Date%
		tab(6)
		Send %vnr%
		sleep 200
		Send ^{ENTER}
		sleep 800


		Send {PgDn}{up}
		Send {HOME}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}
		if(antalberegnet==0){
			Send -1
		}else{
			Send %antalberegnet%
		}
		tab(4)
		Send %kostny%
		tab(1)
		Send {HOME}

		MsgBox, 4, , bogfør
			IfMsgBox, No
				Return

		Send {F9}
		sleep 200
		Send j
		sleep 300
		Send {enter}


		koere = 0
	}
}

$NumpadMult::
	do()
Return