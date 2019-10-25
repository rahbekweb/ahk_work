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
			SplashText("Ny Mail")
			Send ^+m
			exitApp
		}
	}
	sleep 500
}
SplashText("FEJLEDE - Ny Mail",3000)