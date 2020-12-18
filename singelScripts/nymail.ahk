SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%/incALL.ahk

if(openProgram("outlook.exe")==1){
	sleep 300
}


SplashText("Ny Mail")

Send ^+m