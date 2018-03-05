koere = 0

do(){
	global koere

	if(koere==0){
	koere = 1
	Send ^c
	Sleep 250
	Send, {ALT DOWN}{TAB}{ALT UP}
	Sleep 250
	Send  {F3}
	Sleep 250
	Send ^a^v
	Send {ENTER}
	Sleep 500

	MsgBox, 4, , Run
		IfMsgBox, No
		{
		}
		Else
		{
			click 423,372
			Sleep 500
			Send {Enter}
			Sleep 1500
			Click 541,560
			Sleep 1000
			Send ^{ENTER}
			Sleep 500	
		}
	Send, {ALT DOWN}{TAB}{ALT UP}
	Sleep 500
	Send, {DOWN}
	koere = 0
	do()
	}
}


f12::

	do()
Return

tab(antal){
	loop, %antal%{
		Send {TAB}
	}
}


