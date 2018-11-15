;////////////////////- Timere -////////////////////

#Persistent
SetTimer, CheckPopups, 250
SetTimer, CheckPopupsTeamViewer, 500
return

CheckPopups:
	IfWinActive This is an unregistered copy
		ControlClick, Button2  ; retry task
	Return

CheckPopupsReload:
		;if(WinActive("ahk_exe AutoHotkey.exe")){
			WinGetText, OutputVar, a
			if(RegExMatch(OutputVar,"Error")){
				Return
			}
			
			ControlClick, Button1, A  ; retry task
			SetTimer,CheckPopupsReload,Off
		;}
	Return

CheckPopupsTeamViewer:
		ImageSearch, fX,fY,0,0,A_ScreenWidth,A_ScreenHeight,%A_MyDocuments%/AHK/imageSearch/teamViewerKampange.png 
		if(fX<>""){
			MouseGetPos, xpos, ypos
			;SplashTextOn, , , %fX%-%fY%
			fX := (fX+55)
			fY := (fY+55)
			Click %fX%,%fY%
			MouseMove xpos,ypos
			Sleep 200
		}
		;SetTimer,CheckPopupsTeamViewer,Off
	Return







;////////////////////- ReWrite Text -////////////////////

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

::jq::
	Send query{SPACE}
return

:*:10.::
	Send 10.45.0.
Return
:*:192::
	Send 192.168.
Return

:*:ssp::
	Send spejdersport
Return
::adm::
	Send administrator
Return

	;////////////////////- IpButikker -////////////////////

	::ipb::
		Send 10.45.1
	Return
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
		Send 10.45.109
	Return
	::ip11::
		Send 192.168.100.
	Return
	::ip12::
		Send 10.45.112.
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
		Send 10.45.122.
	Return
	::ip23::
		Send 10.45.123.
	Return


	;////////////////////- butikker -////////////////////

	:*:b1b::
		Send 01 KBH - Nørre Firmagsgade
	Return

	:*:b2b::
		Send 02 Lyngby
	Return

	:*:b3b::
		Send 03 Odense
	Return

	:*:b4b::
		Send 04 Aarhus
	Return

	:*:b5b::
		Send 05 Aalborg
	Return

	:*:b6b::
		Send 06 Taastrup City2
	Return

	:*:b7b::
		Send 07 Webshoppen
	Return

	:*:b8b::
		Send 08 Kolding
	Return

	:*:b9b::
		Send 09 Næstved
	Return

	:*:b10b::
		Send 10 Roskilde Festival
	Return

	:*:b11b::
		Send 11 Herning
	Return

	:*:b12b::
		Send 12 FRB - Frederiksborggade
	Return

	:*:b14b::
		Send 14 Hillerød
	Return

	:*:b15b::
		Send 15 Roskilde
	Return

	:*:b16b::
		Send 16 Rødovre
	Return

	:*:b17b::
		Send 17 Vejle
	Return

	:*:b18b::
		Send 18 Østerport
	Return

	:*:b19b::
		Send 19 Esbjerg
	Return

	:*:b20b::
		Send 20 Amager
	Return

	:*:b21b::
		Send 21 Rosengaardscenteret
	Return

	:*:b22b::
		Send 22 Horsens
	Return

	:*:b23b::
		Send 23 Viborg
	Return

	:*:blist::
		Send 01 KBH - Nørre Firmagsgade`r
		Send 02 Lyngby`r
		Send 03 Odense`r
		Send 04 Aarhus`r
		Send 05 Aalborg`r
		Send 06 Taastrup City2`r
		Send 07 Webshoppen`r
		Send 08 Kolding`r
		Send 09 Næstved`r
		Send 10 Roskilde Festival`r
		Send 11 Herning`r
		Send 12 FRB - Frederiksborggade`r
		Send 14 Hillerød`r
		Send 15 Roskilde`r
		Send 16 Rødovre`r
		Send 17 Vejle`r
		Send 18 Østerport`r
		Send 19 Esbjerg`r
		Send 20 Amager`r
		Send 21 Rosengaardscenteret`r
		Send 22 Horsens`r
		Send 23 Viborg`r
	Return


;////////////////////- Gruppenavne -////////////////////

	:*:g1g::
	:*:1bg::
		Send 1. Birkerød
	Return

	:*:g2g::
	:*:1lg::
		Send 1. Lillerød
	Return

	:*:g3g::
	:*:2bg::
		Send 2. Birkerød
	Return

	:*:g4g::
	:*:big::
		Send Birkegruppen
	Return

	:*:g5g::
	:*:bfg::
		Send Blackfoot
	Return

	:*:g6g::
	:*:bsg::
		Send Brødeskov
	Return

	:*:g7g::
	:*:cng::
		Send Claus Nar
	Return

	:*:g8g::
	:*:pag::
		Send Palnatoke
	Return

	:*:g9g::
	:*:plg::
		Send Peter Lassen
	Return

	:*:g10g::
	:*:smg::
		Send Skjoldmøerne
	Return

	:*:g11g::
	:*:svg::
		Send Stavnsholt Vikingerne
	Return

	:*:g0g::
	:*:rdg::
		Send Ravnsholt Division
	Return

	:*:glist::
		Send 1. Birkerød`r
		Send 1. Lillerød`r
		Send 2. Birkerød`r
		Send Birkegruppen`r 
		Send Blackfoot`r
		Send Brødeskov`r
		Send Claus Nar`r
		Send Palnatoke`r
		Send Peter Lassen`r
		Send Skjoldmøerne`r
		Send Stavnsholt Vikingerne`r
		Send Ravnsholt Division
	Return


;////////////////////- F-taster -////////////////////

$F1::
	if(web_save()){
		MsgBox done
		Return
	}
	Send {F1}
Return




;////////////////////- Numpad -////////////////////

NumLock::
	SetNumlockState, on ;set numlock on
Return


;////////////////////- Ctrl -////////////////////

$^s::
	Send ^s
	reloadAHK()
	tmc_searche()
Return

$^+v::
	pasteWhitOutFormating()
Return

$^e::
	if(illustrator_exportPdf()){
		Return
	}
	Send ^e
Return

$^+r::
	;// sørg for ikke at resette billederne i lightroom
	if (WinActive("ahk_exe lightroom.exe")){
		Send ^+e
		Return
	;// END - sørg for ikke at resette billederne i lightroom
	}else{
		Send ^+r
	}
Return

^+0:: tmc()

^<#t:: teamviewer()

^<#p:: kontrolpanel_printer()

^<#r:: run cmd.exe


^<#s:: openProgram("C:\Users\rr\AppData\Local\SourceTree\SourceTree.exe")

^<#l:: lightroom()
^<#b:: lightroom()

^<#n::
	Run, notepad.exe
	SplashText("Ny Notepad")
Return
^<#c:: Run, calc.exe

^<#w:: ahkWinSpy()

$^1:: 
	teamviewer_shiftuser()
	cmd_ping()
Return

$^2::
	cmd_ipconfig()
Return

$^PrintScreen::printScreenDVDvideoSoft()



;////////////////////- Shift -////////////////////

$+Space::
	if(checkTitle("\.ahk .*- Sublime")){
		Send {{} 
		Send SPACE
	}else{
		Send +{SPACE}
	}
return

+<#d::
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
	SplashText("Folder Dokumenter")
Return

+<#f::
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
	SplashText("Folder Billeder")
Return

+^<#b::openProgram("Photoshop.exe")


;////////////////////- ALT -////////////////////

$!F4::
	if(teamviewer_close()){
		return
	}
	Send !{f4}
Return

!w::
	; hvis total cmd
	;hvis controlFocus LCLListBox2 (venstre liste)
	; ret fetl Window9 med mapper fra array i listet priotet (spring mellem udvalgte mapper)
Return


;////////////////////- Win -////////////////////


<#b:: adobebridge()

<#c::
	if(calcD := WinExist("Lommeregner")){
		WinActivate, ahk_id %calcD%
	}else{
		Run, calc.exe
	}
Return

<#k:: kontrolpanel()

<#n::
	if(notepadD := WinExist("ahk_exe notepad.exe")){
		WinActivate, ahk_id %notepadD%
	}else{
		Run, notepad.exe
	}
Return

<#o:: outlook()

<#u:: ipNordic()

<#s:: Run, "C:\Program Files (x86)\Sublime Text 3\sublime_text.exe"

<#t:: Run, mstsc.exe

<#v:: vpn()

<#w:: googleChromeINK()



;////////////////////- Functioner til genveje -////////////////////


adobebridge(){
	openProgram("Bridge.exe")
	Sleep 5000
	WinActivate, ahk_exe Bridge.exe
}

ahkWinSpy(){
	path := "C:\Program Files\AutoHotkey\AU3_Spy.exe"
	if(WinExist("ahk_exe "+ path))
	{
		WinActivate, ahk_exe %path%
		Return
	}else{
		Run, %path%
		WinWait, Active Window Info
		WinGetPos, wX, wY, wWidth, wHeight
		xpos := (A_ScreenWidth-wWidth)
		ypos := (A_ScreenHeight-wHeight-33)
		WinMove, xpos, ypos ; Move the window found by WinWait to the upper-left corner of the screen.
	}
}

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
	SplashText("Google")
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

lightroom(){
	openProgram("C:\Program Files\Adobe\Adobe Lightroom Classic CC\Lightroom.exe")
}

outlook(){
	openProgram("outlook.exe")
}

pasteWhitOutFormating(){
	c = %clipboard%
	Trim(c)
	Send, %c%
}

printScreenDVDvideoSoft(){
	path := "C:\Program Files (x86)\DVDVideoSoft\Free Screen Video Recorder\FreeScreenVideoRecorder.exe"
	openProgram(path,false)
	WinWait, ahk_exe %path%
	if(WinActive("ahk_exe "+ path)){
		MouseGetPos, xpos, ypos
		Click 72,52
		MouseMove xpos,ypos
	}
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
	openProgram("C:\Program Files (x86)\TeamViewer\TeamViewer.exe")
}
teamviewer_shiftuser(){
	if(WinActive("ahk_exe TeamViewer.exe")){
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

				Click 45, 200
				if(c="rahbekweb"){
					Send ^a
					Send webmaster@spejdersport.dk
				}else{
					Send ^a
					Send rahbekweb
				}
			}

			WinActivate, Computere og kontakter
			IfWinActive Computere og kontakter
			{
				ControlFocus , Edit2, Computere og kontakter
				Send ^a
				Send @Fjernstyr4you@{enter}
			}

			Return
		}
	}
}
teamviewer_close(){
	if(WinActive("ahk_exe TeamViewer.exe"))
	{
		WinActivate, TeamViewer
		Sleep 200
		click 46,46
		click 46,155
		return true
	}
	return false
}

tmc(){
	path := "C:\totalcmd\TOTALCMD64.EXE"
	if(openProgram(path, false)==0){
		Return
	}

	sleep 1000
	WinActivate, ahk_exe %path%
	
	ImageSearch, fX,fY,0,0,A_ScreenWidth,A_ScreenHeight,%A_MyDocuments%/AHK/imageSearch/totalCmdOpen.png
	if(fX<>""){
		WinActivate, ahk_exe %path%

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
}

tmc_searche(){
	IfWinActive Total Commander
	{
		Send ^a
	}
}

ipNordic(){
	if(WinExist("ahk_exe Communicator.exe"))
	{
		WinActivate, ahk_exe Communicator.exe
		Return
	}
	Run C:\Users\rr\Desktop\ipnordic Communicator.appref-ms
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

		MsgBox, 4, , Disconnect VPN?
			IfMsgBox, No
			{
				WinActivate, Cisco AnyConnect Secure Mobility Client
				WinClose, Cisco AnyConnect Secure Mobility Client
				Return
			}

		ControlClick, Disconnect, Cisco AnyConnect Secure Mobility Client
		Sleep 250
		WinClose, Cisco AnyConnect Secure Mobility Client
	}
}

web_save(){
	MsgBox, 4, , hvad vil du
		IfMsgBox, No
			Return
	Return true
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

inArray(value,stack){
	for index, element in stack
	{
		if(element = value){
			return True
		}
	}
	return False
}

openProgram(Path,SplashPrint=true){
	RegExMatch(Path, "[A-Za-z0-9-_]*\.[a-z]*",FoundPath)
	if(WinExist("ahk_exe "+ Path))
	{
		WinActivate, ahk_exe %Path%
		Return 0
	}
	Run, %Path%
	if SplashPrint {
		SplashText(FoundPath)
	}
	Return 1
}

processExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

SendMore(hvad,antal){
	loop, %antal%{
		Send %hvad%
	}
}

SplashText(message){
	SplashTextOn, , , Open %message%
	Sleep, 1000
	SplashTextOff
}


tab(antal){
	loop, %antal%{
		Send {TAB}
	}
}
