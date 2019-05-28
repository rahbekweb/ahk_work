;////////////////////- variabler -////////////////////
_mousePos := []

;////////////////////- Timere -////////////////////

#Persistent
SetTimer, autosaveSketchup, 60000
Return

autosaveSketchup:
	if (WinActive("ahk_exe SketchUp.exe")){
		Send ^s
	}
	Return


;////////////////////- functioner -////////////////////
saveMouse(id){
	global _mousePos
	MouseGetPos, x,y
	_mousePos[%id%] := []
	_mousePos[%id%]["x"] := x
	_mousePos[%id%]["y"] := y
}

resetMouse(id){
	global _mousePos
	MouseMove _mousePos[%id%]["x"],_mousePos[%id%]["y"]
	_mousePos.remove([%id%])
}


;////////////////////- shift -////////////////////
$+v::
	if (WinActive("ahk_exe SketchUp.exe")){
		saveMouse("select")
		Click 25,145
		resetMouse("select")
	}
	Send V
	Return