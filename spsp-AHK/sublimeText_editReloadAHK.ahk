;////////////////////- Timere -////////////////////
#Persistent
SetTimer, CheckPopups, 250
Return

CheckPopups:
	IfWinActive This is an unregistered copy
		ControlClick, Button2  ; retry task
	Return

CheckPopupsReload:
		ControlClick, Button1, A  ; retry task
		SetTimer,CheckPopupsReload,Off
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

;////////////////////- END - ReWrite Text -////////////////////


$^PrintScreen::printScreenDVDvideoSoft()

$^s::
	Send ^s
	reloadAHK()
Return

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


<#w:: googleChromeINK()
^<#w:: ahkWinSpy()


;////////////////////- Functioner -////////////////////

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

googleChromeINK(){
	Run, chrome.exe -incognito http://www.google.com
	SplashText("Google")
}


;/////////////////////- Functioner til fællesbrug -////////////////////

checkTitle(reg){
	WinGetTitle, title, A
	
	out := RegExMatch(title, reg, m)
	if(out>0){
		Return True
	}	
	Return False
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