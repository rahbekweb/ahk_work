SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

do(){
	Send 0{DOWN}
	Send, ^c
	sleep 100
	if(clipboard!=0){
		do()
	}
	ExitApp
}

if(checkTitle("Lageropg�relseskladde")){
	MsgBox, 4, , Sikker p� at du vil nulle alle?
		IfMsgBox, No
			Return

	Send 0{DOWN}
	clipsaved:= ClipboardAll
	do()
	Clipboard := clipsaved
}else{
	MsgBox Du skal lige markere det rigtige felt i Lageropg�relseskladden
	ExitApp
}


Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script