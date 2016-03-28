koere = 0

f3::
    FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
    if(koere==0){
	koere = 1
    Send ^c
    Send, {ALT DOWN}{TAB}{ALT UP}
    Send ^a^v
    Send, {ALT DOWN}{TAB}{ALT UP}
    Sleep 500
    Send, {Right}
    Send, ^c
    Send, {ALT DOWN}{TAB}{ALT UP}
    Send, {TAB}
    Send ^a^v
    Sleep 500
    Send, {TAB}{TAB}{TAB}404 %Time%{TAB}{TAB}{ENTER}
    Sleep 1000
    Send {BS}
    Sleep 1000
    Click, 300 300
    Send ^a
    Send  {ALT DOWN}{TAB}{ALT UP}
    Send {LEFT}{LEFT}
    Send %Time%
    Send {DOWN}{RIGHT}
	koere = 0
    }
Return
