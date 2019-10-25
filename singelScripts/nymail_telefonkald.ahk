SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

if(openProgram("outlook.exe")==1){
	sleep 1000
}

Loop, 10
{
	openProgram("outlook.exe",false)

	if(WinActive("ahk_exe outlook.exe")){

		if(!checkTitle("bner - Outlook")){
			SplashText("Ny Telefon Mail")
			Send ^+m
			break
		}
	}
	sleep 500
}

Loop, 10
{
	SplashText("VENT")

	WinActivate, Ikke-navngivet - Meddelelse (HTML)

	if(WinActive("Ikke-navngivet - Meddelelse (HTML)")){
		Send !e
		Send r
		Send s
		Send {down}{enter}
		sleep 500
		tab(2)
		Send Ring til
		Send +{tab}+{tab}
		exitApp
	}
}
SplashText("FEJLEDE - Ny Telefon Mail",3000)