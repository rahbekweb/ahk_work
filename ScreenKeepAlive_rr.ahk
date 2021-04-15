movedLast := 0
timenow := 0
Toggle := 0
settimer Mousehold, 10
return


Mousehold:
MouseGetPos, x, y
timenow = %A_YYYY%%A_MM%%A_DD%%A_Hour%%A_Min%%A_Sec%
If ((x<>x2) or (y<>y2))	{
	if !on{
		;SplashTextOn, 200, 100, Stop!, Get Off! 
		;Settimer, TextOff, 200
		;on := true
		movedLast = %timenow%
	}
}else{
	if((movedLast+90) <= timenow){
		SplashTextOn, 200, 100, Stop!, flytter musen nu
		Settimer, TextOff, 1050
		on := true

		MouseGetPos, xpos, ypos
		MouseMove 0,0
		sleep 50
		MouseMove 1000,0, 20
		sleep 50
		MouseMove xpos,ypos
		movedLast = %A_YYYY%%A_MM%%A_DD%%A_Hour%%A_Min%%A_Sec%
	}
}
;SplashTextOn, 200, 100, Stop!, %movedLast% = timenow %timenow%

x2 := x, y2 := y
;MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 0
return


TextOff:
SplashTextoff
on := false
return


#<F1::
Toggle := !Toggle
if !Toggle
	settimer, Mousehold, On
else
	settimer, Mousehold, off
return








;
;A simple solution:
;
;#InstallKeybdHook  ; this MUST be called at the start of your script
;
;AnyKeyPressed() ; returns a 1 if any keyboard key is pressed, else returns 0
;{
;    if( A_TimeIdlePhysical < 25 )
;        return 1
;
;return 0
;}
;Note this function will return 1 if any key is pressed OR being held down, so change your code appropriately.
;
;What happens is; the #InstallKeybdHook will change the behaviour of A_TimeIdlePhysical to only look for keyboard events.