#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

_NAV := "notepad.exe"

Numpad0 & NumpadMult::
$^NumpadMult::
	if IsNAV() {
		if HT_open_find_salgsordre()
			return
	} else if OpenNAV() {
		if IsNAV() {
			if HT_open_find_salgsordre()
				return
		}
	}

	Send ^{NumpadMult}
return

Numpad0 & NumpadDiv::
	if WinExist("ahk_exe" . _NAV)
		WinActivate
return



HT_open_find_salgsordre() {
	MsgBox, Finished
}

IsNAV() {
	global _NAV
	if WinActive("ahk_exe" . _NAV)
		return true
	return false
}

OpenNAV() {
	global _NAV
	if !WinExist("ahk_exe" . _NAV) {
		Run, %_NAV%
		Sleep, 1000
	} else if WinExist("ahk_exe" . _NAV) {
		WinActivate
	}
	return true
}