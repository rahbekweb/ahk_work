;/////////////////////- Functioner til fællesbrug -////////////////////

checkTitle(reg){
	WinGetTitle, title, A
	
	out := RegExMatch(title, reg, m)
	if(out>0){
		return True
	}	
	return False
}

inArray(value,stack){
	for index, element in stack
	{
		if(element = value){
			return True
		}
	}
	return False
}

openProgram(Path,SplashPrint=true){
	RegExMatch(Path, "[A-Za-z0-9-_]*\.[a-z]*",FoundPath)
	if(WinExist("ahk_exe "+ Path))
	{
		WinActivate, ahk_exe %Path%
		Return 0
	}
	Run, %Path%
	if SplashPrint {
		SplashText(FoundPath)
	}
	Return 1
}

processExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

SendMore(hvad,antal){
	loop, %antal%{
		Send %hvad%
	}
}

SplashText(message){
	SplashTextOn, , , Open %message%
	Sleep, 1000
	SplashTextOff
}


tab(antal){
	loop, %antal%{
		Send {TAB}
	}
}