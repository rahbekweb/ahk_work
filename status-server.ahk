^Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script
!x::Suspend

F1::

return

$ENTER::
	IfWinActive Rediger - S�g stregkode
	{
		Send {TAB}
	}
	Send {Enter}
	Sleep 1000
	Send, ^d
Return


$F2::
    WinGetTitle, title, A

    if(InStr(title, "Lageropg�relseskladde")){
        Click, 797 167
	MouseMove 797, 100
        Sleep 100
        Send, ^a
    }else{
        Send {F2}
    }
Return

$F3::
    WinGetTitle, title, A

    Send {f3}

    if(InStr(title, "Lageropg�relseskladde")){
        Sleep 100
        Send, ^a
    }
Return

<#TAB::
	CoordMode, Mouse, Screen
	MouseMove 1039, 20
Return

$^q:: QStregkodeRetail()

$^d:: DoPlaceringsindhold()


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

DoPlaceringsindhold(){
	if(IsNAV())
	{
		IfWinActive Retail varer - Microsoft Dynamics NAV
		{
			sleep 100
			Send {alt}
			sleep 100
			send s
			sleep 100
			send n
		}
	}
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
