;Run, chrome.exe -incognito chrome://settings
Run, chrome.exe -incognito
sleep 1000
if(WinActive("ahk_exe chrome.exe")){
	Send chrome://restart
	MsgBox, 4, , restart chrome???
		IfMsgBox, No
			Return
	Send {ENTER}
}