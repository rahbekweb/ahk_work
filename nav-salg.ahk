;////////////////////- RET HER -////////////////////

ipadresserKundeservice := Array("31","32","33","34")

;////////////////////- END - RET HER -////////////////////





;////////////////////- f�lles variabler -////////////////////
myIp := StrReplace(A_IPAddress1,"10.45.0.")
_f3felt := "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedOrdrenr	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad11"
_feltMedDatoAll	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad116"
_feltMedDatoLes	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad111"
_feltMedVismere	:= "WindowsForms10.STATIC.app.0.265601d_r9_ad12"
_feltMedLeveringsnavn	:= "WindowsForms10.EDIT.app.0.265601d_r9_ad145"
_feltMedForsendelsmetode:= "WindowsForms10.EDIT.app.0.265601d_r9_ad162"
_running := 0

;////////////////////- END - f�lles variabler -////////////////////




;////////////////////- F taster -////////////////////

F1::return



;////////////////////- NUMPAD -////////////////////

$NumpadSub:: salgsordre_seach()

$NumpadAdd::salgsordre_openFirst()


;////////////////////- Ctrl -////////////////////

$^q:: QStregkodeRetail()


;opdater bogf�rings dato
$^d::
	salgsordre_rediger_Borgoeringsdato()

	forsendelstype()
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


;^e::
;	errorSMS("test")
;return


;////////////////////- SHIFT -////////////////////


;////////////////////- ALT -////////////////////




;////////////////////- ENTER -////////////////////
$ENTER::
	IfWinActive Rediger - S�g stregkode
	{
		Send {TAB}
	}else{

	}
	Send {Enter}
Return


$ESCAPE::
	_running = 0
	Send {Escape}
Return




; Kan ikke hente felt s�ge dropdown info
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

salgsordre_seach(){
	IfWinActive Salgsordrer - Microsoft Dynamics NAV
    {
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

		ControlFocus, %_feltMedDato%, A ;fors�g at flyt focus til dato felt

		ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

		if(HvilketFelt=_feltMedDato){ ;hvis det er det rigtige felt s� g�r noget

			ControlGetText, ordrenr, %_feltMedOrdrenr%, A ; hent ordre nr

			if(!RegExMatch(ordrenr, "^W")){
				MsgBox, 3, , Dette er ikke en WEB ordre, vil du �ndre bogf�riongsdatoen?
				IfMsgBox, No
					Return
				IfMsgBox, Cancel
					Return
			}

			ControlFocus, %_feltMedDato%, A ;fors�g at flyt focus til dato felt

			ControlGetFocus, HvilketFelt, A ;hent hvilket felt der er i focus

			if(HvilketFelt=_feltMedDato){ ;hvis det er det rigtige felt s� g�r noget

			Send ^ad{Enter} ;opdater Dato
			
			}
		}else{
			MsgBox fand ikke Bogf�ringsfato feltet			
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
			return
		}else{
			Send ^{F3}
			Sleep 200
			Send retail varer
			Sleep 200
			Send {Enter}{Enter}
			Sleep 200
			DoQStregkodeRetail()
		}
	}else{
		Send ^q
	}
}

DoQStregkodeRetail(){
	Send {F3}
	Sleep 200
	Send ^a{delete}{Enter}
	Sleep 200
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

		if(HvilketFelt=_feltMedForsendelsmetode){ ;hvis det er det rigtige felt s� g�r noget
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



;////////////////////- Function til f�lledbrug -////////////////////
IsKundeservice(){
	global myIp, ipadresserKundeservice

	if(inArray(myIp, ipadresserKundeservice)){
		Return True
	}
	return False
}

IsNAV(){
	if(checkTitle("Microsoft.*NAV")){
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