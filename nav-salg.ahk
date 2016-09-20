;////////////////////- RET HER -////////////////////

ipadresserKundeservice := Array("110","111","112")

;////////////////////- END - RET HER -////////////////////





;////////////////////- fælles variabler -////////////////////
myIp := StrReplace(A_IPAddress1,"10.45.0.")
_f3felt := "WindowsForms10.EDIT.app.0.245fb7_r13_ad11"
_feltMedOrdrenr	:= "WindowsForms10.EDIT.app.0.2aeb54d_r13_ad11"
_feltMedDato	:= "WindowsForms10.EDIT.app.0.2aeb54d_r13_ad111"
_feltMedLeveringsnavn	:= "WindowsForms10.EDIT.app.0.2aeb54d_r13_ad145"
_feltMedForsendelsmetode:= "WindowsForms10.EDIT.app.0.2aeb54d_r13_ad162"

;////////////////////- END - fælles variabler -////////////////////




;////////////////////- F taster -////////////////////

F1::return



;////////////////////- NUMPAD -////////////////////

$NumpadSub:: salgsordre_seach()

$NumpadAdd:: salgsordre_openFirst()


;////////////////////- Ctrl -////////////////////

$^q:: QStregkodeRetail()


;opdater bogførings dato
$^d::
	global _feltMedOrdrenr
	salgsordre_rediger_Borgoeringsdato()

	forsendelstype()

	ControlFocus, _feltMedOrdrenr, A
Return



^g::
	if(forsendelstype_droppoint()){
		Return
	}

	Return
		ClipSaved := ClipboardAll ; Save the entire clipboard to a variable of your choice.
		ControlFocus, WindowsForms10.Window.8.app.0.2aeb54d_r13_ad131, A
		Send ^a
		Send {Control Down}{Shift Down}c{Shift Up}{Control Up}
		ClipWait  ; Wait for the clipboard to contain text.
		MsgBox Control-C copied the following contents to the clipboard:`n`n%clipboard%
		Clipboard := ClipSaved   ; Restore the original clipboard. Note the use of Clipboard (not ClipboardAll).
		ClipSaved =   ; Free the memory in case the clipboard was very large.
return


^e::
	errorSMS("test")
return


;////////////////////- SHIFT -////////////////////


;////////////////////- ALT -////////////////////













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
	global _f3felt 
	IfWinActive Salgsordrer - Microsoft Dynamics NAV
	{
		ControlGetFocus, HvilketFelt
		
		if(HvilketFelt=_f3felt){
			Send {Enter}
			Sleep 500
			Click 259,259
			Send {Enter}
			return
		}
	}
	Send {NumpadAdd}
}

salgsordre_rediger_Borgoeringsdato(){
	global _feltMedOrdrenr, _feltMedDato

	if(checkTitle("^Rediger - Salgsordre")){
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

			Send ^ad{Enter} ;opdater Dato
		}else{
			errorSMS("fand ikke Bogføringsfato feltet i salgsordrer #1")
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
	MsgBox, 4, , %A_ComputerName% Send SMS?
		IfMsgBox, No
			Return 
	Run, chrome.exe -incognito http://www.smsit.dk/api/sendSms.php?apiKey=mqap85nvctfndtyn&senderId=SPEJDERSPOR&mobile=4528595752&message=%messege% - Maskine%A_ComputerName%
	Sleep 200
	Send {ALT DOWN}{TAB}{ALT UP}
	;WinClose, Google
}