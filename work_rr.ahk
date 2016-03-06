#Persistent
SetTimer, CheckPopups, 250
return

CheckPopups:
	IfWinActive This is an unregistered copy
		ControlClick, Button2  ; retry task
	Return

CheckPopupsReload:
		Send {Enter}
		;ControlClick, Button1  ; retry task
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


;////////////////////- F-taster -////////////////////


;////////////////////- Ctrl -////////////////////

$^s::
	Send ^s
	reloadAHK()
return

^0:: tmc()

^<#t:: teamviewer()

^<#p:: kontrolpanel_printer()

^<#r:: run cmd.exe

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

<#n:: Run, notepad.exe

<#c:: Run, calc.exe

<#u:: unoSoft()

<#w:: googleChromeINK()

<#k:: kontrolpanel()

<#p::
	RunAs, Administrator, SPVPN2010
	Run, services.msc
	RunAs
Return

;////////////////////- Functioner til genveje -////////////////////


cmd_ipconfig(){
	IfWinActive C:\Windows\system32\cmd.exe
	{
		send ipconfig{enter}
	}
}
cmd_ping(){
	IfWinActive C:\Windows\system32\cmd.exe
	{
		send ping{SPACE}
	}
}

googleChromeINK(){
	Run, chrome.exe -incognito http://www.google.com
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
		WinActivate, TeamViewer
	}
	Else
	{
		MsgBox, 4, , �ben Teamviewer?
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
		WinActivate, Computere og kontakter ; focus p� login menu og g� videre
	}
	IfWinActive Computere og kontakter
	{
		; login eller skift bruger
		Click 20,36 ;click i hj�rne
		Sleep 100
		WinGetText, OutputVar, A ; hent synlig tekst
		out := RegExMatch(OutputVar, "E-mail") ; se om der st�r email noget sted
		if(out=0){ ; hvis der ikke st�r Email noget sted (vi er logget ind)
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
	Sleep 500
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
		ControlClick, Button6
	}
}

vpn(){
	if(ProcessExist("vpnui.exe"))
		sl:=250
	else sl:=1000
	Run C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
	Sleep %sl%
	WinGetText, OutputVar, A ; hent synlig tekst
	out := RegExMatch(OutputVar, "Disconnect") ; se om der st�r Disconnect noget sted
	if(out=0){ ;hvis der ikke st�r Disconnect s� skal vi ligge ind
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




;/////////////////////- Functioner til f�llesbrug -////////////////////

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