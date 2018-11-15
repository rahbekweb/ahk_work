;////////////////////- RET HER -////////////////////

ipadresserKundeservice := Array("31","32","33","34")

;////////////////////- END - RET HER -////////////////////


;////////////////////- https://www.nsi-be.com/products/numpad-and-function-keyboard-desktop -////////////////////


;////////////////////- fælles variabler -////////////////////
myIp := StrReplace(A_IPAddress1,"10.45.0.")
_f3felt := "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedOrdrenr	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedDatoAll	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad116"
_feltMedDatoLes	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad111"
_feltMedVismere	:= "WindowsForms10.STATIC.app.0.265601d_r9_ad12"
_feltMedLeveringsnavn	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad145"
_feltMedForsendelsmetode:= "WindowsForms10.EDIT.app.0.265601d_r9_ad162"
_running := 0
_mousePos := []

;////////////////////- END - fælles variabler -////////////////////



;////////////////////- check imageSearch -////////////////////
_e := ""
_imageSearch := []
_imageSearch["mappe"] := "C:/AHK/imageSearch/"
_imageSearch["navSortering"] := "C:/AHK/imageSearch/navSortering.png"

for index, element in _imageSearch
{
	if (! FileExist(element)){
		_e = %_e%`n%element%
	}
}
if(_e<>"")
	MsgBox, 0x1030, Alert!, FILER eller MAPPER findes ikke:%_e%


;////////////////////- F taster -////////////////////

F1::return

$F3::
	if(f3Nav()){
		Return
	}
	Send {F3}
Return



;////////////////////- NUMPAD -////////////////////

$NumpadSub:: salgsordre_search()

$NumpadAdd:: salgsordre_openFirst()

$^NumpadMult:: HT_open_find_salgsordre()


;////////////////////- Ctrl -////////////////////

$^q:: QStregkodeRetail()


;opdater bogførings dato
$^d::
	if(IsNAV){
		salgsordre_rediger_Borgoeringsdato()
		Return
	}

	Send ^d
Return



;^g::
;	if(forsendelstype_droppoint()){
;		Return
;	}
;
;	Return
;		ClipSaved := ClipboardAll ; Save the entire clipboard to a variable of your choice.
;		ControlFocus, WindowsForms10.Window.8.app.0.2aeb54d_r13_ad131, A
;		Send ^a
;		Send {Control Down}{Shift Down}c{Shift Up}{Control Up}
;		ClipWait  ; Wait for the clipboard to contain text.
;		MsgBox Control-C copied the following contents to the clipboard:`n`n%clipboard%
;		Clipboard := ClipSaved   ; Restore the original clipboard. Note the use of Clipboard (not ClipboardAll).
;		ClipSaved =   ; Free the memory in case the clipboard was very large.
;return


;////////////////////- SHIFT -////////////////////


;////////////////////- ALT -////////////////////




;////////////////////- ENTER -////////////////////
$ENTER::
	enterFunctions()
	Send {Enter}
Return

$NumpadEnter::
	enterFunctions()
	Send {NumpadEnter}
Return


$ESCAPE::
	_running = 0
	Send {Escape}
Return




; Kan ikke hente felt søge dropdown info
;+Down::
;	control, ChooseString, JPEG, ComboBox2, A
;	control, ChooseString, Kundenavn, WindowsForms10.Window.8.app.0.2aeb54d_r13_ad118, A
;	control, ChooseString, Kundenavn, WindowsForms10.Window.8.app.0.2aeb54d_r13_ad120, A
;	ControlGetText, OutputVar, WindowsForms10.EDIT.app.0.2aeb54d_r13_ad11, A
;	MsgBox %OutputVar%
;	ControlGetText, OutputVar, WindowsForms10.Window.8.app.0.2aeb54d_r13_ad120, A
;	MsgBox %OutputVar%
;return





;////////////////////- Functioner til genveje -////////////////////

enterFunctions(){
	IfWinActive Rediger - Søg stregkode
	{
		Send {TAB}
	}
}

HT_open_find_salgsordre(){
	if(IsNAV()){
		Send ^{F3}
		Sleep 200
		ControlGetFocus, HvilketFelt
		MsgBox %HvilketFelt%
		Send ^a
		Sleep 200
		Send find salgsordre
		Sleep 200
		Send {Enter}{Enter}
		Sleep 300

		Loop, 5{
			if(checkTitle("^Rediger - Find webbestillinger")){
				Click 173, 205
				break
			}
			Sleep 250
		}
		MouseMove 300,400
	}else{
		Send {NumpadMult}
	}
}

HT_find_salgsordre_openFirst(){
	global _f3felt, _running

	IfWinActive Salgsordrer - Microsoft Dynamics NAV
	{
		ControlGetFocus, HvilketFelt

		if(HvilketFelt=_f3felt){
			Send {Enter}
			Sleep 500
			Click 259,265
			Sleep 200
			Send {Enter}

			_running = 1

			Sleep 1500

			loop, 5{
				if(_running){
					Sleep 500
					if(checkTitle("^Rediger - Salgsordre")){
						salgsordre_rediger_Borgoeringsdato()
						Break
					}
				}else{
					Break
				}
			}
			return
		}
	}
	Send {NumpadAdd}
}

salgsordre_search(){
	IfWinActive Salgsordrer - Microsoft Dynamics NAV
	{
		Click 281,223
		Sleep 200
		Send {F3}
		Sleep 200
		if(IsKundeservice()){
			SendMore("{Down}",5)
		}else{
			SendMore("{Down}",2)
		}
		Send {Enter}^a*
	}else{
		Send {NumpadSub}
	}
}

salgsordre_openFirst(){
	global _f3felt, _running

	IfWinActive Salgsordrer - Microsoft Dynamics NAV
	{
		ControlGetFocus, HvilketFelt

		if(HvilketFelt=_f3felt){
			Send {Enter}
			Sleep 500
			Click 259,265
			Sleep 200
			Send {Enter}

			_running = 1

			Sleep 1500

			loop, 5{
				if(_running){
					Sleep 500
					if(checkTitle("^Rediger - Salgsordre")){
						salgsordre_rediger_Borgoeringsdato()
						Break
					}
				}else{
					Break
				}
			}
			return
		}
	}
	Send {NumpadAdd}
}

salgsordre_rediger_Borgoeringsdato(){
	global _feltMedOrdrenr, _feltMedDatoAll, _feltMedDatoLes, _feltMedVismere

	if(checkTitle("^Rediger - Salgsordre")){

		ControlGetText, feltMedVismereVar, %_feltMedVismere%, a
		if(feltMedVismereVar=="Vis flere felter")
			_feltMedDato = %_feltMedDatoLes%
		else
			_feltMedDato = %_feltMedDatoAll%

		ControlFocus, %_feltMedDato%, A ;forsøg at flyt focus til dato felt

		ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

		if(HvilketFelt=_feltMedDato){ ;hvis det er det rigtige felt så gør noget

			ControlGetText, ordrenr, %_feltMedOrdrenr%, A ; hent ordre nr

			if(!RegExMatch(ordrenr, "^W")){
				MsgBox, 3, , Dette er ikke en WEB ordre, vil du ændre bogføriongsdatoen?
				IfMsgBox, No
					Return
				IfMsgBox, Cancel
					Return
			}

			ControlFocus, %_feltMedDato%, A ;forsøg at flyt focus til dato felt

			ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

			if(HvilketFelt=_feltMedDato){ ;hvis det er det rigtige felt så gør noget

			Send ^ad{Enter} ;opdater Dato
			
			}
		}else{
			MsgBox fand ikke Bogføringsfato feltet			
		}
	}else{
		Send ^d
	}
}



QStregkodeRetail(){
	if(IsNAV())
	{
		IfWinActive Retail varer - Microsoft Dynamics NAV
		{
			DoQStregkodeRetail()
			Return
		}else{
			if(openNavPage("retail varer")){
				DoQStregkodeRetail()
				Return
			}
		}
	}
	Send ^q
}

DoQStregkodeRetail(){
	;tøm søgefelt
	f3Nav()
	Sleep 200
	Send ^a{delete}{Enter}
	Sleep 200
	;åben stregkodesøgefelt
	Send {Control Down}{Shift Down}f{Shift Up}{Control Up}
}

forsendelstype(){
	if(forsendelstype_butikslevering()){
		Return
	}

	if(forsendelstype_droppoint()){
		Return
	}
}

forsendelstype_butikslevering(){
	global _feltMedLeveringsnavn, _feltMedForsendelsmetode
	
	ControlGetText, leveringsnavn, %_feltMedLeveringsnavn%, A ; hent leveringsnavn
	
	if(RegExMatch(leveringsnavn, "^Spejder Sport")){ ;hvis det er en butiks levering
		
		ControlFocus, %_feltMedForsendelsmetode%, A ; set focus i forsendelsmetode

		ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus
		
		ControlGetText, forsendelse, %_feltMedForsendelsmetode%, A ; hent forsendelsmetode
		if(forsendelse="Butik afhentning"){
			Return true
		}

		if(HvilketFelt=_feltMedForsendelsmetode){ ;hvis det er det rigtige felt så gør noget
			Send ^aButik afhentning
			Return true
		}
	}
	Return false
}

forsendelstype_droppoint(){
	global _feltMedForsendelsmetode
	
	ControlGetText, forsendelse, %_feltMedForsendelsmetode%, A ; hent forsendelsmetode
	if(forsendelse="PostDK pakkeboks"){
		Return true
	}
	Return false
}



;////////////////////- Function til fælledbrug -////////////////////
IsKundeservice(){
	global myIp, ipadresserKundeservice

	if(inArray(myIp, ipadresserKundeservice)){
		Return True
	}
	return False
}

IsNAV(){
	if(WinActive("ahk_exe Microsoft.Dynamics.Nav.Client.exe")){
		return true
	}
	return false
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

SendMore(hvad, antal){
	loop, %antal%{
		Send %hvad%
    }
}

checkTitle(reg){
	WinGetTitle, title, A

	out := RegExMatch(title, reg)
	if(out>0){
		return True
	}	
	return False
}


f3Nav(){
	global _imageSearch
	if(IsNAV() && checkTitle("- Microsoft Dynamics NAV")){
		img := _imageSearch["navSortering"]
		ImageSearch, xclick,yclick,0,0,A_ScreenWidth,A_ScreenHeight,%img%
		MouseGetPos, xpos,ypos
		xclick := (xclick+50)
		Click %xclick%,%yclick%
		MouseMove xpos,ypos
		Sleep 200
		Send {F3}
		Return True
	}
	Return False
}


_FindFeld(){
	loop 20{
		ControlGetFocus, HvilketFelt, A
		if(HvilketFelt="WindowsForms10.EDIT.app.0.2aeb54d_r13_ad111"){
			MsgBox %HvilketFelt%
			return
		}else{
			Send {tab}
		}
	}


	ControlGetText, OutputVar, WindowsForms10.EDIT.app.0.2aeb54d_r13_ad11, A
	;ControlGetText, OutputVar, WindowsForms10.EDIT.app.0.2aeb54d_r13_ad111, A
	;MsgBox %OutputVar%
}

;åben Page, Report, view by Ctrl F3 felt
openNavPage(search){
	if(IsNAV()){
		if(checkTitle("- Microsoft Dynamics NAV")){
			Send ^{F3}
			Sleep 200
			Send %search%
			Sleep 200
			Send {Enter}{Enter}
			Sleep 200
			Return True
		}
	}
	Return False
}

Numpad0 & Numpad1::
;MsgBox, You pressed Numpad1 while holding down Numpad0.
saveMouse(1)
return


saveMouse(id){
	global _mousePos
	MouseGetPos, x,y
	_mousePos[%id%] := []
	_mousePos[%id%]["x"] := x
	_mousePos[%id%]["y"] := y
	MsgBox test
}

errorSMS(messege){
	Return
	MsgBox, 4, , %A_ComputerName% Send SMS?
		IfMsgBox, No
			Return 
	Run, chrome.exe -incognito http://www.smsit.dk/api/sendSms.php?apiKey=mqap85nvctfndtyn&senderId=SPEJDERSPOR&mobile=4528595752&message=%messege% - Maskine%A_ComputerName%
	Sleep 200
	Send {ALT DOWN}{TAB}{ALT UP}
	;WinClose, Google
}