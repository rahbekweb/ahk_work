<#v:: vpn()

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

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

tab(antal){
    loop, %antal%{
    	Send {TAB}
    }
}