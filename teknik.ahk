;////////////////////- ReWrite Tekst -////////////////////
:*:10.::
	Send 10.45.0.
Return
:*:10,,::
	Send 10.45.0.
Return
:*:192::
	Send 192.168.
Return

	;////////////////////- IpButikker -////////////////////

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
		Send 192.168.103.
	Return
	::ip10::
		Send 192.168.102.
	Return
	::ip11::
		Send 192.168.100.
	Return
	::ip12::
		Send 192.168.102.
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
		Send 192.168.119.
	Return


;////////////////////- Shift -////////////////////
+BS::
 ;KeyWait, Shift
  Send, {Del}
Return

;////////////////////- Ctrl -////////////////////
^<#n:: Run, notepad.exe
^<#r:: run cmd.exe

;////////////////////- Left Win -////////////////////

<#k:: kontrolpanel()

<#n::
	if(notepadD := WinExist("ahk_exe notepad.exe")){
		WinActivate, ahk_id %notepadD%
	}else{
		Run, notepad.exe
	}
Return

<#o:: outlook()

<#t:: Run, mstsc.exe

<#u:: unoSoft()

<#v:: vpn()

<#w:: googleChromeINK()


;////////////////////- Left Win -////////////////////

RWin::return

;////////////////////- functioner -////////////////////

googleChromeINK(){
	Run, chrome.exe -incognito http://www.google.com
}

kontrolpanel(){
	run, %SystemRoot%\system32\control.exe
}
kontrolpanel_printer(){
	Run, control printers
}

outlook(){
	if(WinExist("ahk_exe outlook.exe"))
	{
		WinActivate, ahk_exe outlook.exe
		Return
	}
	run outlook.exe
}

unoSoft(){
	Run C:\Program Files (x86)\Uno Telefoni\Uno Soft\SoftPhone.exe
}

unoSoft_num(){
	IfWinActive Uno Soft
	{
		if(WinExist("Tastatur") && WinExist("ahk_exe SoftPhone.exe"))
		{
			WinActivate, Tastatur
		}else{
			ControlClick, Button6
		}
	}
	if (WinActive("Tastatur") && WinActive("ahk_exe SoftPhone.exe")){
		Send !{F4}
	}
}
unoSoft_numHas(){
	if (WinActive("Tastatur") && WinActive("ahk_exe SoftPhone.exe")){
		Send +3
		Return true
	}
	Return false
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


;/////////////////////- Functioner til fællesbrug -////////////////////

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

tab(antal){
    loop, %antal%{
    	Send {TAB}
    }
}