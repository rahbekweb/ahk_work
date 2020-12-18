koere = 0

do(){
	global koere

	if(koere==0){
		koere = 1
		vnr = 0
		pris = 0
		kost = 0
		vrg = 0
		beskrivelse = 0
		lNR = 0031497339836

		WinActivate, ahk_exe EXCEL.EXE
		Sleep 200
		Send {Home}

		Send ^c
		sleep 200
		vnr := Trim(clipboard)
		StringReplace,vnr,vnr,`r`n,,,A
		;sleep 200

		Send {right}{right}{right}{right}^c
		sleep 200
		pris := Trim(clipboard)
		StringReplace,pris,pris,`r`n,,,A
		;sleep 200

		Send {right}{right}^c
		sleep 200
		kost := Trim(clipboard)
		StringReplace,kost,kost,`r`n,,,A
		;sleep 200

		Send {right}{right}{right}{right}^c
		sleep 200
		vrg := Trim(clipboard)
		StringReplace,vrg,vrg,`r`n,,,A
		;sleep 200

		Send {right}{right}^c
		sleep 200
		beskrivelse := Trim(clipboard)
		StringReplace,beskrivelse,beskrivelse,`r`n,,,A
		;sleep 200

		Send {right}
		FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
		Send %time%
		Send {return}
		Send [next]
		
		;koere = 0
		;Return

		WinActivate, ahk_exe Microsoft.Dynamics.Nav.Client.exe
		sleep 300
		click 1392, 228
		
		Send ^n
		sleep 500

		Send %vnr%
		sleep 200
		tab(2)

		Send %beskrivelse%
		sleep 200

		tab(1)
		Send, STK

		tab(24)
		Send %kost%
		sleep 200
		tab(4)
		Send %kost%
		sleep 200

		tab(3)
		Send %pris%
		sleep 200

		tab(1)
		Send HANDELSVAR
		tab(1)
		Send MOMS25
		tab(1)
		Send HANDEL

		tab(3)
		Send %vrg%
		sleep 200

		tab(4)
		Send %lNR%
		sleep 200

		tab(1)
		Send %vnr%
		sleep 200

		tab(1)

		


		

		sleep 500
		Send {esc}

		koere = 0
	}
}

$NumpadSub::
	do()
Return

tab(antal){
	loop, %antal%{
		Send {TAB}
	}
}