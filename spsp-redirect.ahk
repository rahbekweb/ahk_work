koere = 0

f3::
    FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
    if(koere==0){
	koere = 1
    Send ^c
    Send, {ALT DOWN}{TAB}{ALT UP}
    Sleep 250
    Send ^a^v
    Send, {ALT DOWN}{TAB}{ALT UP}
    Sleep 250
    Send, {Right}
    Send, ^c
    Send, {ALT DOWN}{TAB}{ALT UP}
    Sleep 250   
    Send, {TAB}
    Sleep 250
    Send ^a^v
    Send, {TAB}{TAB}{TAB}404 %Time%{TAB}{TAB}{ENTER}
    Sleep 1500
    Send {BS}
    Sleep 1800
    Click, 310 310
    Send ^a
    Send  {ALT DOWN}{TAB}{ALT UP}
    Sleep 500
    Send {LEFT}{LEFT}
    Send %Time%
    Send {DOWN}{RIGHT}
	koere = 0
    }
Return
