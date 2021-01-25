;Run, chrome.exe -incognito chrome://settings
WinActivate, ahk_exe chrome.exe
sleep 500
if(! WinActive("ahk_exe chrome.exe")){
	Run, chrome.exe
	sleep 1000
}
if(WinActive("ahk_exe chrome.exe")){
	send ^t
	sleep 500
	Send chrome://settings/passwords
	Send {ENTER}
}