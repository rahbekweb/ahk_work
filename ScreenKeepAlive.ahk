;////////////////////- Timere -////////////////////

#Persistent
SetTimer, KeepAlive, 30000
return

KeepAlive:
		SplashText("Keep Screen Alive")
		MouseGetPos, xpos, ypos
		MouseMove 0,0
		sleep 50
		MouseMove 1000,0, 20
		sleep 50
		MouseMove xpos,ypos
	Return

SplashText(message){
	SplashTextOn, , , %message%
	Sleep, 1000
	SplashTextOff
}