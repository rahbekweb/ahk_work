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
_NAV := "Microsoft.Dynamics.Nav.Client.exe"

;////////////////////- END - fælles variabler -////////////////////



;////////////////////- check imageSearch -////////////////////
_e := ""
_imageSearch := []
_imageSearch["mappe"] := "C:/AHK/imageSearch/"
_imageSearch["navSortering"] := "C:/AHK/imageSearch/navSortering.png"
_imageSearch["navHTsalgsordreplacering"] := "C:/AHK/imageSearch/navHT_webbestilling_salgsordreplacering.png"

for index, element in _imageSearch {
	if !FileExist(element) {
		_e = %_e%`n%element%
	}
}
if(_e != "")
	MsgBox, 0x1030, Alert!, FILER eller MAPPER findes ikke:%_e%


;////////////////////- F taster -////////////////////

F1::return

$F3::
	if f3Nav()
		return

	Send {F3}
return

$F13::
	if HT_find_salgsordre_openFirst()
		return

	Send {F13}
return



;////////////////////- NUMPAD -////////////////////

; Find søgefeltet
$NumpadSub::
	if IsNAV() {
		if salgsordre_search()
			return
		if HT_find_salgsordre_search()
			return
	}

	Send {NumpadSub}
return

; Åben en ordre
$NumpadAdd::
	if IsNAV() {
		if salgsordre_openFirst()
			return
		if HT_find_salgsordre_openFirst()
			return
	}

	Send {NumpadAdd}
return

; Bogfør en ordre
$NumpadDiv::
	if IsNAV() {
		Send {F9}
		return
	}

	Send {NumpadDiv}
return

$Numpad0::Numpad0

; Bogfør og print en ordre
Numpad0 & NumpadDiv::
	if IsNAV() {
		Send +{F9}
		return
	}
	Send {Numpad0}{NumpadDiv}
return

; Åben/find NAV og åben "find salgsordre"
Numpad0 & NumpadMult::
	if openOrFindNAV()
		return

	Send {Numpad0}{NumpadMult}
return
$^NumpadMult::
	if openOrFindNAV()
		return

	Send ^{NumpadMult}
return

$NumpadEnter::
	enterFunctions()
	Send {NumpadEnter}
return


;////////////////////- Ctrl -////////////////////

$^q::QStregkodeRetail()


;opdater bogførings dato og check telefonnr
$^d::
	if IsNAV() {
		salgsordre_rediger_Borgoeringsdato()
		salgsordre_check_Telefonnr()
		return
	}

	Send ^d
return



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
return



$ESCAPE::
	_running = 0
	Send {Escape}
return




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

enterFunctions() {
	if WinActive("Rediger - Søg stregkode")
		Send {TAB}
}

HT_open_find_salgsordre() {
	if WinExist("Rediger - Find webbestillinger") {
		WinActivate, Rediger - Find webbestillinger
		sleep 500
		HT_find_salgsordre_search()
	} else {
		if IsNavTitle() {
			openNavPage("find salgsordre")
			Sleep 300

			loop, 5 {
				if checkTitle("^Rediger - Find webbestillinger") {
					HT_find_salgsordre_search()
					break
				}
				Sleep 250
			}
			return true
		}
	}
	return false
}

HT_find_salgsordre_search() {
	global _imageSearch, _f3felt
	if checkTitle("^Rediger - Find webbestillinger") {
		ControlGetFocus, HvilketFelt
		if(HvilketFelt=_f3felt) {
			Send ^a
			return true
		}

		WinGetPos, X, Y, Width, Height, A
		img := _imageSearch["navHTsalgsordreplacering"]
		ImageSearch, xclick,yclick,X,Y,Width,Height,%img%
		if(xclick<>"") return false

		saveMouse("webbestil")
		xclick := (xclick+50)
		Click %xclick%,%yclick%
		resetMouse("webbestil")
		Send ^a
		return true
	}
	return false
}

HT_find_salgsordre_openFirst() {
	global _f3felt, _running

	if checkTitle("^Rediger - Find webbestillinger") {
		ControlGetFocus, HvilketFelt
		
		if(HvilketFelt=_f3felt) {
			send {ALT}sø
			Sleep 1000
			
			WinGetText, OutputVar, a			
			matchs:=RegExMatch(OutputVar,"Der er ingen bogførte poster med dette bilagsnummer.")
			if(matchs!=0){
				Send {ENTER}
				return true
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
				if _running {
					Sleep 500
					if checkTitle("^Rediger - Salgsordre") {
						salgsordre_rediger_Borgoeringsdato()
						salgsordre_check_Telefonnr()
						Break
					}
				} else {
					Break
				}
			}
			return true
		}
	}
	return false
}

salgsordre_search() {
	if IsNAV() {
		if WinActive("Salgsordrer - Microsoft Dynamics NAV") {
			Click 281,223
			Sleep 200
			Send {F3}
			Sleep 200
			if IsKundeservice() {
				SendMore("{Down}",5)
			} else {
				SendMore("{Down}",2)
			}
			Send {Enter}^a*
			return true
		}
	}
	return false
}

salgsordre_openFirst() {
	global _f3felt, _running

	if IsNAV() {
		if WinActive("Salgsordrer - Microsoft Dynamics NAV") {
			ControlGetFocus, HvilketFelt

			if(HvilketFelt=_f3felt) {
				Send {Enter}
				Sleep 500
				Click 259,265
				Sleep 200
				Send {Enter}

				_running = 1

				Sleep 1500

				loop, 5{
					if _running {
						Sleep 500
						if checkTitle("^Rediger - Salgsordre") {
							salgsordre_rediger_Borgoeringsdato()
							salgsordre_check_Telefonnr()
							Break
						}
					} else {
						Break
					}
				}
				return true
			}
		}
	}
	return false
}

salgsordre_rediger_Borgoeringsdato() {
	global _feltMedOrdrenr, _feltMedDatoAll, _feltMedDatoLess, _feltMedVismere

	if checkTitle("^Rediger - Salgsordre") {

		if less()
			_feltMedDato = %_feltMedDatoLess%
		else
			_feltMedDato = %_feltMedDatoAll%

		ControlFocus, %_feltMedDato%, A ;forsøg at flyt focus til dato felt

		ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

		if(HvilketFelt=_feltMedDato) { ;hvis det er det rigtige felt så gør noget

			ControlGetText, ordrenr, %_feltMedOrdrenr%, A ; hent ordre nr

			if(!RegExMatch(ordrenr, "^W")) {
				MsgBox, 3, , Dette er ikke en WEB ordre, vil du ændre bogføriongsdatoen?
				IfMsgBox, No
					return
				IfMsgBox, Cancel
					return
			}

			ControlFocus, %_feltMedDato%, A ;forsøg at flyt focus til dato felt

			ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

			if(HvilketFelt=_feltMedDato) { ;hvis det er det rigtige felt så gør noget
				Send ^ad{Enter} ;opdater Dato
			}
		} else {
			MsgBox fand ikke Bogføringsfato feltet			
		}
	}
}

salgsordre_check_Telefonnr() {
	global _feltMedOrdreTelefonnrAll, _feltMedOrdreTelefonnrLess
	return
	if less()
		_feltMedOrdreTelefonnr = %_feltMedOrdreTelefonnrLess%;
	else
		_feltMedOrdreTelefonnr = %_feltMedOrdreTelefonnrAll%;

	if checkTitle("^Rediger - Salgsordre") {
		ControlGetText, feltMedTelefonnr, %_feltMedOrdreTelefonnr%, A
		MsgBox feltMedTelefonnr, "%feltMedTelefonnr%" - %feltMedTelefonnr%
		if(!RegExMatch(feltMedTelefonnr, "^[0-9]{8}$")) {
			;MsgBox , 0x1030, Alert!, beskeden
			MsgBox, 3, , Telefonnummeret er ikke dansk, vil du se mere på det?
				IfMsgBox, No
					return
				IfMsgBox, Cancel
					return

			ControlFocus, %_feltMedOrdreTelefonnr%, A ;forsøg at flyt focus til dato felt
		}
	}
}



QStregkodeRetail() {
	if IsNAV() {
		if WinActive("Retail varer - Microsoft Dynamics NAV")
		{
			DoQStregkodeRetail()
			return
		} else {
			if openNavPage("retail varer") {
				sleep 1000
				DoQStregkodeRetail()
				return
			}
		}
	}
	Send ^q
}

DoQStregkodeRetail() {
	loop, 5 {
		if WinActive("Retail varer - Microsoft Dynamics NAV") {
			;tøm f3søgefelt
			f3Nav()
			Sleep 200
			Send ^a{delete}{Enter}
			Sleep 200
			;åben stregkodesøgefelt
			Send {Control Down}{Shift Down}f{Shift Up}{Control Up}
			return
		}
		sleep 500
	}
}


;////////////////////- Function til fælledbrug -////////////////////
IsKundeservice() {
	global myIp, ipadresserKundeservice

	if(inArray(myIp, ipadresserKundeservice)) {
		return true
	}
	return false
}

openOrFindNAV() {
	if IsNAV() {
		if HT_open_find_salgsordre()
			return true
	} else if OpenNAV() {
		if IsNAV() {
			if HT_open_find_salgsordre()
				return true
		}
	}

	return false
}

IsNAV() {
	global _NAV
	if WinActive("ahk_exe" . _NAV)
		return true
	return false
}

OpenNAV() {
	global _NAV
	if !WinExist("ahk_exe" . _NAV) {
		Run, %_NAV%
		Sleep, 1000
	} else if WinExist("ahk_exe" . _NAV) {
		WinActivate
	}
	return true
}

IsNavTitle() {
	 if(IsNAV() && checkTitle("- Microsoft Dynamics NAV")) {
	 	return true
	 }
	 return false
}


inArray(value,stack) {
	for index, element in stack {
		if(element = value) {
			return true
		}
	}
	return false
}

SendMore(hvad, antal) {
	loop, %antal% {
		Send %hvad%
    }
}

checkTitle(reg) {
	WinGetTitle, title, A

	out := RegExMatch(title, reg)
	if(out>0) {
		return true
	}	
	return false
}


f3Nav() {
	global _imageSearch, _f3felt
	if IsNavTitle() {
		WinGetPos, X, Y, Width, Height, A
		img := _imageSearch["navSortering"]
		ImageSearch, xclick,yclick,X,Y,Width,Height,%img%
		if(xclick<>"") return false

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
		return true
	}
	return false
}


less() {
	global _feltMedVismere
	ControlGetText, feltMedVismereVar, %_feltMedVismere%, a
		if(feltMedVismereVar=="Vis flere felter")
			return true
		else
			return false
}

_FindFeld() {
	loop 20{
		ControlGetFocus, HvilketFelt, A
		if(HvilketFelt="WindowsForms10.EDIT.app.0.2aeb54d_r13_ad111") {
			MsgBox %HvilketFelt%
			return
		} else {
			Send {tab}
		}
	}


	ControlGetText, OutputVar, WindowsForms10.EDIT.app.0.2aeb54d_r13_ad11, A
	;ControlGetText, OutputVar, WindowsForms10.EDIT.app.0.2aeb54d_r13_ad111, A
	;MsgBox %OutputVar%
}

;åben Page, Report, view by Ctrl F3 felt
openNavPage(search){
	if IsNAV() {
		if checkTitle("- Microsoft Dynamics NAV") {
			Send ^{F3}
			Sleep 200
			Send ^a
			Sleep 200
			Send %search%
			Sleep 200
			Send {Enter}{Enter}
			Sleep 200
			return true
		}
	}
	return false
}

NumpadIns::
	global _mousePos
	saveMouse("h")
	MouseMove 10,10
	sleep 1000
	resetMouse("h")
return


saveMouse(id) {
	global _mousePos
	MouseGetPos, x,y
	_mousePos[%id%] := []
	_mousePos[%id%]["x"] := x
	_mousePos[%id%]["y"] := y
}

resetMouse(id) {
	global _mousePos
	MouseMove _mousePos[%id%]["x"],_mousePos[%id%]["y"]
	_mousePos.remove([%id%])
}

errorSMS(message) {
	return
	MsgBox, 4, , %A_ComputerName% Send SMS?
		IfMsgBox, No
			return 
	Run, chrome.exe -incognito http://www.smsit.dk/api/sendSms.php?apiKey=mqap85nvctfndtyn&senderId=SPEJDERSPOR&mobile=4527809933&message=%message% - Maskine%A_ComputerName%
	Sleep 200
	Send {ALT DOWN}{TAB}{ALT UP}
	;WinClose, Google
}




;WinGetPos, X, Y, Width, Height, A