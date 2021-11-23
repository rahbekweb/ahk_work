BlockInputAll(onOff = "on"){
	if(onOff == "off" || onOff == false){
		Hotkey, LButton, MouseNothing, Off
		Hotkey, MButton, MouseNothing, Off
		Hotkey, RButton, MouseNothing, Off
		Hotkey, XButton1, MouseNothing, Off
		Hotkey, XButton2, MouseNothing, Off
		Hotkey, WheelUp, MouseNothing, Off
		Hotkey, WheelDown, MouseNothing, Off
		BlockInput Off
		BlockInput, MouseMoveOff
	}else{
		BlockInput, MouseMove
		BlockInput On
		Hotkey, LButton, MouseNothing, On
		Hotkey, MButton, MouseNothing, On
		Hotkey, RButton, MouseNothing, On
		Hotkey, XButton1, MouseNothing, On
		Hotkey, XButton2, MouseNothing, On
		Hotkey, WheelUp, MouseNothing, On
		Hotkey, WheelDown, MouseNothing, On
	}
}

MouseNothing:
Return