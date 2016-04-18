#Persistent
SetTimer, CheckPopups, 250
return

CheckPopups:
	IfWinActive This is an unregistered copy
		ControlClick, Button2  ; retry task
	Return

CheckPopupsReload:
		ControlClick, Button1, A  ; retry task
		SetTimer,CheckPopupsReload,Off
	Return




;////////////////////- ReWrite Tekst -////////////////////

:*:mb::
	if(checkTitle("\.ahk .*- Sublime")){
		Send MsgBox{SPACE}
	}else{
		Send mb
	}
return

::imb::
	if(checkTitle("\.ahk .*- Sublime")){
		Send MsgBox, 4, , `n
		Send `tIfMsgBox, No`n
		Send `tReturn`n
		Sleep 5
		Send {bs}{bs}
		Send {up}{up}{up}{END}
	}else{
		Send imb{SPACE}
	}
return

:*:%::
	if(checkTitle("\.ahk .*- Sublime")){
		Send `%`%{left}
	}else{
		Send `%
	}
return

::sd::
	if(checkTitle("\.ahk .*- Sublime")){
		Send Send{SPACE}
	}else{
		Send sd{SPACE}
	}
return

:*:rn::
	if(checkTitle("\.ahk .*- Sublime")){
		Send Return
	}else{
		Send rn
	}
return

:*:///::
	kommentarAfsnitStart()
Return

:*://e::
	kommentarAfsnitEnd()
Return

:*:10.::
	if(! WinActive("ahk_exe chrome.exe")){
		Send 1
	} 
	Send 0.45.0.
Return
:*:10,,::
	if(! WinActive("ahk_exe chrome.exe")){
		Send 1
	}
	Send 0.45.0.
Return
:*:192::
	if(! WinActive("ahk_exe chrome.exe")){
		Send 1
	}
	Send 92.168.
Return

	;////////////////////- IpButikker -////////////////////

	::ip1::
		Send 10.45.1.
	Return
	::ip2::
		Send 192.168.107.
	Return
	::ip3::
		Send 192.168.108.
	Return
	::ip4::
		Send 192.168.105.
	Return
	::ip5::
		Send 192.168.109.
	Return
	::ip6::
		Send 192.168.106.
	Return
	::ip8::
		Send 192.168.110.
	Return
	::ip9::
		Send 192.168.103.
	Return
	::ip10::
		Send 192.168.102.
	Return
	::ip11::
		Send 192.168.100.
	Return
	::ip14::
		Send 192.168.111.
	Return
	::ip15::
		Send 192.168.113.
	Return
	::ip16::
		Send 192.168.112.
	Return
	::ip17::
		Send 192.168.114.
	Return
	::ip18::
		Send 192.168.115.
	Return
	::ip19::
		Send 192.168.116.
	Return
	::ip20::
		Send 192.168.117.
	Return
	::ip21::
		Send 192.168.118.
	Return
	::ip22::
		Send 192.168.119.
	Return


;////////////////////- F-taster -////////////////////




;////////////////////- Numpad -////////////////////

NumLock::
	SetNumlockState, on ;set numlock on
	unoSoft_num()
Return

$NumpadSub::
	if(unoSoft_numHas()){
		Return
	}
	Send {NumpadSub}
Return


;////////////////////- Ctrl -////////////////////

$^s::
	Send ^s
	reloadAHK()
return

$^e::
	if(illustrator_exportPdf()){
		return
	}
	Send ^e
Return

^0:: tmc()

^<#t:: teamviewer()

^<#p:: kontrolpanel_printer()

^<#r:: run cmd.exe

^<#d::
	if !(docD := WinExist("Dokumenter")){
		run, %userprofile%\documents
		WinWait, Dokumenter
	}else{
		if (docD = WinExist("A")){
			WinClose, ahk_id %docD%
		}else{
			WinActivate, ahk_id %docD%
		}
	}
;run, %A_MyDocuments%
Return

^<#f::
	if !(picD := WinExist("Billeder")){
		run, %userprofile%\pictures
		WinWait, Billeder
	}else{
		if (picD = WinExist("A")){
			WinClose, ahk_id %picD%
		}else{
			WinActivate, ahk_id %picD%
		}
	}
Return

^<#n:: Run, notepad.exe
^<#c:: Run, calc.exe

$^1:: 
	teamviewer_shiftuser()
	unoSoft_num()
	cmd_ping()
Return

$^2::
	cmd_ipconfig()
Return


;////////////////////- Shift -////////////////////

$+Space::
	if(checkTitle("\.ahk .*- Sublime")){
		Send {{} 
		Send SPACE
	}else{
		Send +{SPACE}
	}
return


;////////////////////- ALT -////////////////////

$!F4::
	teamviewer_close()
	Send !{f4}
Return

!w::
	; hvis total cmd
	;hvis controlFocus LCLListBox2 (venstre liste)
	; ret fetl Window9 med mapper fra array i listet priotet (spring mellem udvalgte mapper)
Return


;////////////////////- Win -////////////////////


<#t:: Run, mstsc.exe

<#v:: vpn()

<#n::
	if(notepadD := WinExist("ahk_exe notepad.exe")){
		WinActivate, ahk_id %notepadD%
	}else{
		Run, notepad.exe
	}
Return

<#c::
	if(calcD := WinExist("Lommeregner")){
		WinActivate, ahk_id %calcD%
	}else{
		Run, calc.exe
	}
Return

<#u:: unoSoft()

<#w:: googleChromeINK()

<#k:: kontrolpanel()

<#o:: outlook()



;////////////////////- Functioner til genveje -////////////////////


cmd_ipconfig(){
	if(WinActive("ahk_exe cmd.exe")){
		send ipconfig{enter}
	}
}
cmd_ping(){
	if(WinActive("ahk_exe cmd.exe")){
		send ping{SPACE}
	}
}

googleChromeINK(){
	Run, chrome.exe -incognito http://www.google.com
}


illustrator_exportPdf(){
	if(WinActive("ahk_exe Illustrator.exe")){
		Send ^!s
		Sleep 1500
		ControlGetText, OutputVar, Edit1, A
		ny:= RegExReplace(OutputVar, " copy.ai$",".pdf")
		WinClose, %ny%
		Send %ny%
		Sleep 500
		tab(1)
		SendMore("{down}",2)
		tab(1)
		sleep 50
		Send {enter}
		Sleep 500

		WinGetText, visuText, a
		re := RegExMatch(visuText, "Do you want to replace it")
		if(re>0){
			Send {enter}
		}
		Sleep 3000
		IfWinExist Save Adobe PDF
		{
			WinActivate Save Adobe PDF
		}
		IfWinActive Save Adobe PDF
		{
			tab(3)
			SendMore("{down}",50)
			tab(5)
			Send {SPACE}
			send {enter}
		}
		Return true
	}else{
		Return false
	}
}


kommentarAfsnitStart(){
	if(checkTitle("\.ahk")){
		Send `;
	}
	if(checkTitle("\.css")){
		Send `/*
	}
	Send ////////////////////-  -////////////////////
	if(checkTitle("\.css")){
		Send *`/
	}
	SendMore("{left}",22)
	if(checkTitle("\.css")){
		SendMore("{left}",2)
	}
}
kommentarAfsnitEnd(){
	if(checkTitle("\.ahk")){
		Send `;
	}
	if(checkTitle("\.css")){
		Send `/*
	}
	Send ////////////////////- END -  -////////////////////
	if(checkTitle("\.css")){
		Send *`/
	}
	SendMore("{left}",22)
	if(checkTitle("\.css")){
		SendMore("{left}",2)
	}
}


kontrolpanel(){
	run, %SystemRoot%\system32\control.exe
}
kontrolpanel_printer(){
	Run, control printers
}

outlook(){
	if(WinExist("ahk_exe outlook.exe"))
	{
		WinActivate, ahk_exe outlook.exe
		Return
	}
	run outlook.exe
}

reloadAHK(){
	if(checkTitle("\.ahk - Sublime")){
		WinGetTitle, title, A

		stig := RegExReplace(title, "\.ahk .*- Sublime.*","")
		stig .= ".ahk"

		fil := RegExReplace(stig, ".*\\","")
		MsgBox, 4, , Vil du reloade %fil%
			IfMsgBox, No
				Return

		SetTimer, CheckPopupsReload, 250

		Run, %stig%
	}
}

teamviewer(){
	IfWinExist TeamViewer
	{
		WinActivate, Computere og kontakter
	}
	Else
	{
		MsgBox, 4, , Åben Teamviewer?
			IfMsgBox, No
				return
		run, C:\Program Files (x86)\TeamViewer\TeamViewer.exe
		Sleep 500

		WinActivate, Computere og kontakter
		Click 20,36
		tab(2)
		Send @Fjernstyr4you@{enter}
	}
}
teamviewer_shiftuser(){
	IfWinActive TeamViewer
	{
		WinActivate, Computere og kontakter ; focus på login menu og gå videre
	}
	IfWinActive Computere og kontakter
	{
		; login eller skift bruger
		Click 20,40 ;click i hjørne
		Sleep 100
		WinGetText, OutputVar, A ; hent synlig tekst
		out := RegExMatch(OutputVar, "E-mail") ; se om der står email noget sted
		if(out=0){ ; hvis der ikke står Email noget sted (vi er logget ind)
			Sleep 100
			Click 20,272 ;log ud
			Sleep 200
			WinGetText, OutputVar, A ;hent synlig tekst for at kunne finde ud af hvilken bruger der var logget ind
			c := StrSplit(OutputVar, "`n") ;slit i linjer
			c:= RegExReplace(c[2], "\r","") ;fjern linjeskift
			Click 20,36
			tab(1) ;hop til email felt
			if(c="rahbekweb"){
				Send webmaster@spejdersport.dk
			}else{
				Send rahbekweb
			}
			tab(1)
		}else{
			tab(2)
		}
		Send @Fjernstyr4you@{enter}
		Return
	}
}
teamviewer_close(){
	IfWinActive Computere og kontakter
	{
		WinActivate, TeamViewer
	}
}

tmc(){
	IfWinExist Total Commander
	{
		WinActivate Total Commander
		Return
	}
	Run, C:\totalcmd\TOTALCMD64.EXE
	Sleep 1000
	WinGetText, OutputVar, a
	;k := RegExReplace(OutputVar, "\n.*\n*","")
	k := SubStr(OutputVar, 1, 1)
	Sleep 200
	if(k=1){
		tab(2)
		Send {Enter}
	}
	if(k=2){
		tab(3)
		Send {Enter}
	}
	if(K=3){
		tab(4)
		Send {Enter}
	}
	Sleep 200
	Send {tab}
}

unoSoft(){
	Run C:\Program Files (x86)\Uno Telefoni\Uno Soft\SoftPhone.exe
}

unoSoft_num(){
	IfWinActive Uno Soft
	{
		if(WinExist("Tastatur") && WinExist("ahk_exe SoftPhone.exe"))
		{
			WinActivate, Tastatur
		}else{
			ControlClick, Button6
		}
	}
	if (WinActive("Tastatur") && WinActive("ahk_exe SoftPhone.exe")){
		Send !{F4}
	}
}
unoSoft_numHas(){
	if (WinActive("Tastatur") && WinActive("ahk_exe SoftPhone.exe")){
		Send +3
		Return true
	}
	Return false
}

vpn(){
	if(ProcessExist("vpnui.exe"))
		sl:=250
	else sl:=1000
	Run C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
	Sleep %sl%
	WinGetText, OutputVar, A ; hent synlig tekst
	out := RegExMatch(OutputVar, "Disconnect") ; se om der står Disconnect noget sted
	if(out=0){ ;hvis der ikke står Disconnect så skal vi ligge ind
		tab(1)
		Send vpn.spejdersport.dk{enter}
	}else{
		loop, 50{
			IfWinActive, Cisco AnyConnect Secure Mobility Client
			break
			Sleep 250
		}
		Send !{F4}
	}
}




;/////////////////////- Functioner til fællesbrug -////////////////////

checkTitle(reg){
	WinGetTitle, title, A
	
	out := RegExMatch(title, reg, m)
	if(out>0){
		return True
	}	
	return False
}

SendMore(hvad,antal){
	loop, %antal%{
    	Send %hvad%
    }
}

tab(antal){
    loop, %antal%{
    	Send {TAB}
    }
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}