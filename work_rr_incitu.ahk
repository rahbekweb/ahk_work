;////////////////////- Timere -////////////////////

#Persistent
SetTimer, CheckPopups, 250
;SetTimer, CheckPopupsTeamViewer, 500
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

;CheckPopupsTeamViewer:
;		ImageSearch, fX,fY,0,0,A_ScreenWidth,A_ScreenHeight,%A_MyDocuments%/AHK/imageSearch/teamViewerKampange.png 
;		if(fX<>""){
;			MouseGetPos, xpos, ypos
;			;SplashTextOn, , , %fX%-%fY%
;			fX := (fX+55)
;			fY := (fY+55)
;			Click %fX%,%fY%
;			MouseMove xpos,ypos
;			Sleep 200
;		}
		;SetTimer,CheckPopupsTeamViewer,Off
;	Return





;////////////////////- ReWrite Text -////////////////////

:*:fcvr::
	send 13467900
Return

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

:*:rfn::
	if(checkTitle("\.ahk .*- Sublime")){
		Send Return False
	}else{
		Send rfn
	}
return

:*:rtn::
	if(checkTitle("\.ahk .*- Sublime")){
		Send Return True
	}else{
		Send rtn
	}
return

:*:///::
	kommentarAfsnitStart()
Return

:*://e::
	kommentarAfsnitEnd()
Return

:*://f::
	kommentarFunction()
Return
:*://c::
	kommentarClass()
Return

::jq::
	Send query{SPACE}
return

	;////////////////////- time -////////////////////
	::tnr::
		SendInput %A_YYYY%%A_MM%%A_DD%.%A_Hour%%A_Min% |{SPACE}
	return

	::td::
		Send %A_YYYY%%A_MM%%A_DD%
	Return

	::tdt::
		Send %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%
	Return

	::tdf::
		Send %A_YYYY%-%A_MM%-%A_DD%-%A_Hour%%A_Min%_
	Return
	;////////////////////- END - time -////////////////////

:*:10.::
	Send 10.1.20.
Return
:*:192::
	Send 192.168.
Return

::ssp::
	Send spejdersport
Return
::iu::
	Send Incitu{SPACE}
Return
:*:iuk::
	Send incitu.dk
Return
::rr::
	Send Rasmus Rahbek{SPACE}
Return
::rs::
	Send Rasmus{SPACE}
Return
::r@::
	Send rara@incitu.dk
Return
::adm::
	Send administrator
Return

::tw::
	Send Teamviewer{SPACE}
Return

::twk::
	Send www.incitu.dk/help.exe
Return

::fj::
	Send Flemming{SPACE}
Return

	;////////////////////- IpButikker -////////////////////

	::ipb::
		Send 10.45.1
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

	::g1::
	::1bg::
		Send 1. Birkerød
	Return

	::g2::
	::1lg::
		Send 1. Lillerød
	Return

	::g3::
	::2bg::
		Send 2. Birkerød
	Return

	::g4::
	::bgg::
		Send Birkegruppen
	Return

	::g5::
	::bfg::
		Send Blackfoot
	Return

	::g6::
	::bsg::
		Send Brødeskov
	Return

	::g7::
	::cng::
		Send Claus Nar
	Return

	::g8::
	::pag::
		Send Palnatoke
	Return

	::g9::
	::plg::
		Send Peter Lassen
	Return

	::g10::
	::smg::
		Send Skjoldmøerne
	Return

	::g11::
	::svg::
		Send Stavnsholt Vikingerne
	Return

	::g0::
	::rdg::
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

$^Left::
	ptgui_leftfoto()
	send ^{Left}
Return
$^Right::
	ptgui_rightfoto()
	send ^{right}
Return

$^PrintScreen::printScreenDVDvideoSoft()

^+0:: tmc()

$^1:: 
	teamviewer_shiftuser()
	cmd_ping()
Return

$^2::
	cmd_ipconfig()
Return

^<#b:: lightroom()

^<#c:: Run, calc.exe

$^e::
	if(illustrator_exportPdf()){
		Return
	}
	if(PDFtoIMG()){
		Return
	}
	Send ^e
Return

^<#l:: lightroom()

^<#n::
	Run, notepad.exe
	WinActivate, notepad
	SplashText("Ny Notepad")
Return

^<#o::msteams()

^<#p:: kontrolpanel_printer()

^<#r:: run cmd.exe

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

$^s::
	Send ^s
	reloadAHK()
	tmc_searche()
Return

^<#s::
	path = C:\Users\%A_UserName%\AppData\Local\SourceTree\SourceTree.exe
	openProgram(path)
Return

^<#t:: teamviewer()

$^+v::
	pasteWhitOutFormating()
Return

^<#w:: ahkWinSpy()


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

+<#t::googleTranslateINK()


;////////////////////- ALT -////////////////////


;////////////////////- Win -////////////////////


<#b:: adobebridge()

<#c::
	if(calcD := WinExist("Lommeregner")){
		WinActivate, ahk_id %calcD%
	}else{
		Run, calc.exe
	}
Return

<#g::
<#k:: kontrolpanel()

<#n::
	if(notepadD := WinExist("ahk_exe notepad.exe")){
		WinActivate, ahk_id %notepadD%
	}else{
		Run, notepad.exe
	}
Return

<#o:: outlook()

<#u:: 3cx()

<#s:: Run, "C:\Program Files\Sublime Text 3\sublime_text.exe"

<#t:: Run, mstsc.exe

<#v:: vpn()

<#w:: googleChromeINK()



;////////////////////- MUS -////////////////////

;Lbutton::
 ;   while (GetKeyState("Lbutton", "P")) {
 ;       Send, F
 ;   }
;return


;////////////////////- Functioner til genveje -////////////////////


360fly_view(){
	ImageSearch, fX,fY,0,0,A_ScreenWidth,A_ScreenHeight,%A_MyDocuments%/AHK/imageSearch/teamViewerKampange.png 
	
}


adobebridge(){
	if(WinExist("ahk_exe Bridge.exe"))
	{
		WinActivate, ahk_exe Bridge.exe
		Return
	}

	MsgBox, 4, , Åben Bridge?
		IfMsgBox, No
			Return

	openProgram("Bridge.exe")
	Sleep 5000
	WinActivate, ahk_exe Bridge.exe
}

ahkWinSpy(){
	path := "C:\Program Files\AutoHotkey\WindowSpy.ahk"
	;if(WinExist("ahk_exe "+ path))
	;{
	;	WinActivate, ahk_exe %path%
	;	Return
	;}else{
		Run, %path%
		WinWait, Window Spy
		WinGetPos, wX, wY, wWidth, wHeight
		xpos := (A_ScreenWidth-wWidth)
		ypos := (A_ScreenHeight-wHeight-33)
		WinMove, xpos, ypos ; Move the window found by WinWait to the upper-left corner of the screen.
	;}
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
	Run, chrome.exe -incognito https://www.google.com
	SplashText("Google")
}

googleTranslateINK(){
	Run, chrome.exe -incognito https://translate.google.com/
	SplashText("Translate")
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
kommentarFunction(){
	Send 	/** {ENTER}
	Send 	* {ENTER}
	Send 	* hvad gør functionen{ENTER}
	Send 	* {ENTER}
	Send 	* @param string $value  timestamp{ENTER}
	Send 	* @return boolean{ENTER}
	Send 	*/{ENTER}
}
kommentarClass(){
	
}


kontrolpanel(){
	run, %SystemRoot%\system32\control.exe
}
kontrolpanel_printer(){
	Run, control printers
}

lightroom(){
	openProgram("C:\Program Files\Adobe\Adobe Lightroom Classic\Lightroom.exe")
}

msteams(){
	if(WinActive("ahk_exe Teams.exe")){
		MsgBox, 4, , Luk Teams?
			IfMsgBox, No
				Return
		WinClose, ahk_exe Teams.exe

	}else{
		if(WinExist("ahk_exe Teams.exe"))
		{
			WinActivate, ahk_exe Teams.exe
			Return 0
		}
		Run, C:\Users\%A_UserName%\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
		SplashText("Teams")
	}
}

outlook(){
	openProgram("outlook.exe")
}

pasteWhitOutFormating(){
	c = %clipboard%
	Trim(c)
	Send, %c%
}

PDFtoIMG(){
	if(WinActive("ahk_exe Acrobat.exe")){
		MsgBox, 4, , Eksport som JPG
			IfMsgBox, No
				Return True

		Send !ftij
		;Sleep 1000
		Send {ENTER}
		Return True
	}
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

ptgui_leftfoto(){
	if(WinActive("ahk_exe PTGui.exe")){
		MouseGetPos, xpos, ypos
		Click 289,66
		MouseMove xpos,ypos
	}
}

ptgui_rightfoto(){
	if(WinActive("ahk_exe PTGui.exe")){
		MouseGetPos, xpos, ypos
		Click 313,68
		MouseMove xpos,ypos
	}
}

reloadAHK(){
	if(checkTitle("\.ahk .*- Sublime")){
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

3cx(){
	if(WinExist("ahk_exe 3CXWin8Phone.exe"))
	{
		MsgBox t
		WinActivate, ahk_exe 3CXWin8Phone.exe
		Return
	}
	Run "C:\ProgramData\3CXPhone for Windows\PhoneApp\3CXWin8Phone.exe"
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
