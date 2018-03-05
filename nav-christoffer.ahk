#Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script
!z::Suspend

;////////////////////- RET HER -////////////////////


;////////////////////- END - RET HER -////////////////////





;////////////////////- fælles variabler -////////////////////
_running := 0
vnr := 0
m1 := ""
m2 := ""
;////////////////////- END - fælles variabler -////////////////////




;////////////////////- F taster -////////////////////







;////////////////////- SHIFT -////////////////////


;////////////////////- ALT -////////////////////




;$NumpadSub::Step1()
$F2::Step1()
$^F2::Step2()
$^+F2::Step3()
;$^NumpadSub::Step2()



;$ESCAPE::
	;_running = 0
	;Send {Escape}
;Return





;////////////////////- Functioner til genveje -////////////////////
Step1(){
	global vnr,m1,m2
	WinActivate, ahk_exe EXCEL.EXE
	Sleep 200
	send {Home}
	Send ^c
	Sleep 200
	vnr := Clipboard
	if(vnr="`r`n"){
		MsgBox, 4, , Det ser ud til vi er færdige?
			IfMsgBox, Yes
				Return

	}
	StringReplace,vnr,vnr,`r`n,,,A
	Send {Right}{Right}
	Send ^c
	Sleep 200
	m1 := Clipboard
	StringReplace,m1,m1,`r`n,,,A
	Sleep 200
	Send {Right}
	Send ^c
	Sleep 200
	m2 := Clipboard
	Sleep 500
	StringReplace,m2,m2,`r`n,,,A
	;MsgBox varenr [%vnr%]`nm1 [%m1%]`nm2 [%m2%]

	WinActivate, ahk_exe mstsc.exe
	Sleep 500
	Click 845, 145
	Sleep 800
	MsgBox, 4, , Er Varenr %vnr%
		IfMsgBox, No
			Return

	Step2()
}

Step2(){
	global vnr,m1,m2
	tommefelter := false
	findesIforvejen := false
	
	Clipboard := ;
	Send ^{Home}{Right}
	Send ^c
	Sleep 200
	m1_check := Clipboard
	if(m1_check==""){
		tommefelter := true
	}else{
		if(m1==m1_check){
			findesIforvejen := true
		}else{
			if(findesIforvejen){
				findesIforvejen := false
			}
			MsgBox, 4, , Feltet indeholder en tekste der ikke er identisk`n[%m1%]`n[%m1_check%]`n`nSTOP?
				IfMsgBox, Yes
					Return
		}
	}

	Clipboard := ;
	Send {Down}
	Sleep 500
	Send ^c
	Sleep 500
	m2_check := Clipboard
	if(m2_check==""){
		tommefelter := true
	}else{
		if(m2==m2_check){
			findesIforvejen := true
		}else{
			if(findesIforvejen){
				findesIforvejen := false
			}
			MsgBox, 4, , Feltet indeholder en tekste der ikke er identisk`n[%m2%]`n[%m2_check%]`n`nSTOP?
				IfMsgBox, Yes
					Return
		}
	}
	Send ^{Home}
	Sleep 200

	if(tommefelter){
		Step3()
	}else{
		if(!findesIforvejen){
			MsgBox, Felterne er ikke identiske, STOP?`n`nKør manuelt på ctrl+shift+F2	
			Return
		}
	}
	Step4()
}

Step3(){
	global vnr,m1,m2
	Send D{tab}
	Send %m1%
	Send {Enter}
	sleep 200
	Send {Left}
	Send D{tab}
	Send %m2%
	Send {Enter}
	sleep 200
}

Step4(){
	MsgBox, 4, , Ser alt fint ud? JA og kør næste
		IfMsgBox, No
			Return

	Send ^{ENTER}
	Sleep 500
	Send {DOWN}

	WinActivate, ahk_exe EXCEL.EXE
	Sleep 500
	Send {DOWN}
	Step1()
}