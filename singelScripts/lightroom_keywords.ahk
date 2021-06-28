SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk
;MsgBox %1%

if (WinActive("ahk_exe lightroom.exe")){
	
	if(checkTitle(".*Library.*")){
		BlockInputAll()
		Send ^k
		sleep 500

		SendInput {Raw},%1%
		Send {ENTER}
		Sleep 300
		Send {ESC}
		BlockInputAll(false)
	}else{
		MsgBox Du skal være i Library
	}

}else{
	MsgBox Du skal være i Lightroom
}

;skal stå til sidst
#Include %A_ScriptDir%/incBLOCK.ahk

exit

for n, param in A_Args  ; For each parameter:
{
	MsgBox Parameter number %n% is %param%.
}