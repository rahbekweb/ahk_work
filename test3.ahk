MsgBox %1%

if (WinActive("ahk_exe lightroom.exe")){
	
	Send ^k
	sleep 500

	SendInput {Raw}%1%
	Send {ENTER}

}

exit

for n, param in A_Args  ; For each parameter:
{
	MsgBox Parameter number %n% is %param%.
}