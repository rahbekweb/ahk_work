;////////////////////- RET HER -////////////////////

ipadresserKundeservice := Array("31","32","33","34")

;////////////////////- END - RET HER -////////////////////


;////////////////////- https://www.nsi-be.com/products/numpad-and-function-keyboard-desktop -////////////////////


;////////////////////- fælles variabler -////////////////////
myIp := StrReplace(A_IPAddress1,"10.45.0.")
_f3felt := "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedOrdrenr	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedDatoAll	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad118"
_feltMedDatoLess	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad111"
_feltMedVismere	:= "WindowsForms10.STATIC.app.0.265601d_r9_ad12"
_feltMedLeveringsnavn	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad145"
_feltMedForsendelsmetode:= "WindowsForms10.EDIT.app.0.265601d_r9_ad162"
_feltMedOrdreTelefonnrAll:= "WindowsForms10.EDIT.app.0.265601d_r9_ad112"
_feltMedOrdreTelefonnrLess:= "WindowsForms10.EDIT.app.0.265601d_r9_ad18"
_running := 0
_mousePos := []

;////////////////////- END - fælles variabler -////////////////////



;////////////////////- check imageSearch -////////////////////
_e := ""
_imageSearch := []
_imageSearch["mappe"] := "C:/AHK/imageSearch/"
_imageSearch["navSortering"] := "C:/AHK/imageSearch/navSortering.png"
_imageSearch["navHTsalgsordreplacering"] := "C:/AHK/imageSearch/navHT_webbestilling_salgsordreplacering.png"

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

$F13::
	if(HT_find_salgsordre_openFirst())
		Return
	Send {F13}
Return



;////////////////////- NUMPAD -////////////////////

$NumpadSub::
	if(salgsordre_search())
		Return
	if(HT_find_salgsordre_search())
		Return

	Send {NumpadSub}
Return

$NumpadAdd::
	if(salgsordre_openFirst())
		Return
	if(HT_find_salgsordre_openFirst())
		Return

	Send {NumpadAdd}
Return

$^NumpadMult::
	if(IsNAV()){
		if(HT_open_find_salgsordre()){
			Return
		}
	}
	Send ^{NumpadMult}
Return


$NumpadEnter::
	enterFunctions()
	Send {NumpadEnter}
Return


;////////////////////- Ctrl -////////////////////

$^q:: QStregkodeRetail()


;opdater bogførings dato og check telefonnr
$^d::
	if(IsNAV()){
		salgsordre_rediger_Borgoeringsdato()
		salgsordre_check_Telefonnr()
		Return
	}

	Send ^d
Return



;^g::
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
	IfWinExist Rediger - Find webbestillinger
	{
		WinActivate, Rediger - Find webbestillinger
		sleep 500
		HT_find_salgsordre_search()
	}else{
		if(IsNavTitle()){
			openNavPage("find salgsordre")
			Sleep 300

			Loop, 5{
				if(checkTitle("^Rediger - Find webbestillinger")){
					HT_find_salgsordre_search()
					break
				}
				Sleep 250
			}
			Return True
		}
	}
	Return False
}

HT_find_salgsordre_search(){
	global _imageSearch, _f3felt
	if(checkTitle("^Rediger - Find webbestillinger")){
		ControlGetFocus, HvilketFelt
		if(HvilketFelt=_f3felt){
			Send ^a
			Return True
		}

		WinGetPos, X, Y, Width, Height, A
		img := _imageSearch["navHTsalgsordreplacering"]
		ImageSearch, xclick,yclick,X,Y,Width,Height,%img%
		if(xclick<>"") Return False

		saveMouse("webbestil")
		xclick := (xclick+50)
		Click %xclick%,%yclick%
		resetMouse("webbestil")
		Send ^a
		Return True
	}
	Return False
}

HT_find_salgsordre_openFirst(){
	global _f3felt, _running

	if(checkTitle("^Rediger - Find webbestillinger")){
		ControlGetFocus, HvilketFelt
		
		if(HvilketFelt=_f3felt){
			send {ALT}sø
			Sleep 1000
			
			WinGetText, OutputVar, a			
			matchs:=RegExMatch(OutputVar,"Der er ingen bogførte poster med dette bilagsnummer.")
			if(matchs!=0){
				Send {ENTER}
				Return True
			}

			saveMouse("htOpenFirst")
			Click 30,300
			resetMouse("htOpenFirst")
			Sleep 200
			Send ^{HOME}
			sleep 200
			
			; Her skal den line lave Image Seach

			HT_find_salgsordre_search()
			send {ALT}ss

			_running = 1

			Sleep 1500

			loop, 5{
				if(_running){
					Sleep 500
					if(checkTitle("^Rediger - Salgsordre")){
						salgsordre_rediger_Borgoeringsdato()
						salgsordre_check_Telefonnr()
						Break
					}
				}else{
					Break
				}
			}
			Return True
		}
	}
	Return False
}

salgsordre_search(){
	if(IsNAV()){
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
			Return True
		}
	}
	Return False
}

salgsordre_openFirst(){
	global _f3felt, _running

	if(IsNAV())
	{
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
							salgsordre_check_Telefonnr()
							Break
						}
					}else{
						Break
					}
				}
				Return True
			}
		}
	}
	Return False
}

salgsordre_rediger_Borgoeringsdato(){
	global _feltMedOrdrenr, _feltMedDatoAll, _feltMedDatoLess, _feltMedVismere

	if(checkTitle("^Rediger - Salgsordre")){

		if(less())
			_feltMedDato = %_feltMedDatoLess%
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
	}
}

salgsordre_check_Telefonnr(){
	global _feltMedOrdreTelefonnrAll, _feltMedOrdreTelefonnrLess
	Return
	if(less()){
		_feltMedOrdreTelefonnr = %_feltMedOrdreTelefonnrLess%;
	}else{
		_feltMedOrdreTelefonnr = %_feltMedOrdreTelefonnrAll%;
	}

	if(checkTitle("^Rediger - Salgsordre")){
		ControlGetText, feltMedTelefonnr, %_feltMedOrdreTelefonnr%, A
		MsgBox feltMedTelefonnr, "%feltMedTelefonnr%" - %feltMedTelefonnr%
		if(!RegExMatch(feltMedTelefonnr, "^[0-9]{8}$")){
			;MsgBox , 0x1030, Alert!, beskeden
			MsgBox, 3, , Telefonnummeret er ikke dansk, vil du se mere på det?
				IfMsgBox, No
					Return
				IfMsgBox, Cancel
					Return

			ControlFocus, %_feltMedOrdreTelefonnr%, A ;forsøg at flyt focus til dato felt
		}
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
				sleep 1000
				DoQStregkodeRetail()
				Return
			}
		}
	}
	Send ^q
}

DoQStregkodeRetail(){
	Loop, 5{
		IfWinActive Retail varer - Microsoft Dynamics NAV
		{
			;tøm f3søgefelt
			f3Nav()
			Sleep 200
			Send ^a{delete}{Enter}
			Sleep 200
			;åben stregkodesøgefelt
			Send {Control Down}{Shift Down}f{Shift Up}{Control Up}
			Return
		}
		sleep 500
	}
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

IsNavTitle(){
	 if(IsNAV() && checkTitle("- Microsoft Dynamics NAV")){
	 	Return True
	 }
	 Return False
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
	global _imageSearch, _f3felt
	if(IsNavTitle()){
		WinGetPos, X, Y, Width, Height, A
		img := _imageSearch["navSortering"]
		ImageSearch, xclick,yclick,X,Y,Width,Height,%img%
		if(xclick<>"") Return False

		saveMouse("f3Nav")
		xclick := (xclick+50)
		Click %xclick%,%yclick%
		resetMouse("f3Nav")
		Sleep 200
		Send {F3}
		Sleep 500
		;ControlGetFocus, HvilketFelt, A
		;if(HvilketFelt<>_f3felt){
		;	f3Nav()
		;}
		Return True
	}
	Return False
}


less(){
	global _feltMedVismere
	ControlGetText, feltMedVismereVar, %_feltMedVismere%, a
		if(feltMedVismereVar=="Vis flere felter")
			Return True
		else
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
			Send ^a
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

NumpadIns::
global _mousePos
	saveMouse("h")
	MouseMove 10,10
	sleep 1000
	resetMouse("h")
return


saveMouse(id){
	global _mousePos
	MouseGetPos, x,y
	_mousePos[%id%] := []
	_mousePos[%id%]["x"] := x
	_mousePos[%id%]["y"] := y
}

resetMouse(id){
	global _mousePos
	MouseMove _mousePos[%id%]["x"],_mousePos[%id%]["y"]
	_mousePos.remove([%id%])
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




;WinGetPos, X, Y, Width, Height, A