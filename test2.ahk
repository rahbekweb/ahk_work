^+v::
c = %clipboard%
Trim(c)

IF GetKeyState("CapsLock","T") {
	Gui, Add, Text,,Hvordan vil du PASTE
	Gui, Add, Button, x10 y40 w70 h20 , &UPPER
	Gui, Add, Button, x90 y40 w70 h20 , &LOWER
	Gui, Add, Button, x10 y70 w70 h20 , &CAPITALIZ
	Gui, Add, Button, x90 y70 w70 h20 , &INVERT
	Gui, Add, Button, x170 y40 w70 h50 , &STANDARD
	Gui, Show, AutoSize Center, Past muligheder
	GuiControl, +Default, &STANDARD
	Return

	ButtonUPPER:
	Gui, Submit
	Gui Destroy
	StringUpper c, c
	SendRaw, %c%
	Return

	ButtonLOWER:
	Gui, Submit
	Gui Destroy
	StringLower c, c
	SendRaw, %c%
	Return

	ButtonCAPITALIZ:
	Gui, Submit
	Gui Destroy
	StringUpper c, c,T
	SendRaw, %c%
	Return

	ButtonINVERT:
	Gui, Submit
	Gui Destroy
	Lab_Invert_Char_Out:= ""
	Loop % Strlen(c) {
		Lab_Invert_Char:= Substr(c, A_Index, 1)
		if Lab_Invert_Char is upper
			Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) + 32)
		else if Lab_Invert_Char is lower
			Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) - 32)
		else
			Lab_Invert_Char_Out:= Lab_Invert_Char_Out Lab_Invert_Char
	}
	SendRaw %Lab_Invert_Char_Out%
	Return

	ButtonSTANDARD:
	Gui, Submit
	Gui Destroy
	SendRaw, %c%
	Return
}ELSE{
	SendRaw, %c%
}
Return



;*a::
;*e::
;Capital := GetKeyState("Shift","P") Or GetKeyState("CapsLock","T")
;If A_ThisHotkey = *a
;	SendInput,% Capital?"Ā":"ā"
;Else
;	SendInput,% Capital?"Ē":"ē" 
;Return

; Test hotkey:
;!CapsLock::MsgBox % A_ThisHotkey

; Remap CapsLock to LCtrl in a way compatible with IME.
;*CapsLock::
;    MsgBox 1
;    return
;*CapsLock up::
;    MsgBox 2
;    return