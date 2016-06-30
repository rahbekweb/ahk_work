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



^Numpad0::
    FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
    WinActivate, ahk_exe EXCEL.EXE
    Sleep 100
    Send {Home}{RIGHT}
    Send ^c


    ;Run, chrome.exe -incognito https://myaccumolo.com/indhold/Website/Shop/Items/Items.aspx?mainArea=5&menuId=138&siteguid=10649

    WinActivate, ahk_exe chrome.exe

    Sleep 500
    Click 300, 450
    Send ^a^v
    Sleep 200
    Send {Enter}

    Sleep 1000
    click 906, 596
    Sleep 1000

    MsgBox, 4, , Kør nyt navn?
        IfMsgBox, No
            Return
    send ^{Numpad1}
Return

^Numpad1::
    FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
    WinActivate, ahk_exe EXCEL.EXE
    Sleep 100
    Send {Home}{RIGHT}{RIGHT}
    ;Send ^c

    WinActivate, ahk_exe chrome.exe

    Sleep 500
    
    Send ^{HOME}
    Sleep 200
    Click 338, 509
    ;Send ^a^v
    Sleep 500
    Send {tab}
    Send ^a^c
    Sleep 500

    WinActivate, ahk_exe EXCEL.EXE
    sleep 200
    Send {RIGHT}{RIGHT}
    Send ^v
    sleep 200
    Send {RIGHT}
    Send ^c
    sleep 500

    WinActivate, ahk_exe chrome.exe
    Sleep 200
    Send ^v

    ;MsgBox, 4, , Er dette rigtigt
    ;        IfMsgBox, No
    ;            return

    
    
    Sleep 200
    Send {tab}^{END}

    sleep 500
    Click 390, 1072

    Sleep 1000

    MsgBox, 4, , Kør redirect?
        IfMsgBox, No
            Return
    send ^{Numpad2}

Return

^Numpad2::
    FormatTime, Time,, dd-MM-yyyy HH:mm:ss tt
    WinActivate, ahk_exe EXCEL.EXE
    Sleep 100
    Send {Home}{RIGHT}{RIGHT}{RIGHT}{RIGHT}
    Send ^c

    WinActivate, ahk_exe chrome.exe

    Sleep 500

    Send ^{tab}
    sleep 200
    Click 216, 309 
    Send ^a^v

    WinActivate, ahk_exe EXCEL.EXE
    Sleep 100
    Send {RIGHT}
    Send ^c

    WinActivate, ahk_exe chrome.exe
    Sleep 500
    Send {tab}
    Send ^a^v
    Send, {TAB}{TAB}{TAB}404 NY %Time%{TAB}{TAB}
    ;MsgBox, 4, , Er dette rigtigt
    ;    IfMsgBox, No
    ;        Return
    Sleep 200
    Send {ENTER}
    Sleep 2000
    Send {BS}
    Sleep 1200
    Click, 310 310
    Send ^a
    sleep 50
    send {DELETE}
    sleep 200

    Send ^+{tab}

    WinActivate, ahk_exe EXCEL.EXE
    sleep 200
    Send {Home}
    Send %Time%
    Send {enter}
    sleep 200
    Send ^s
    sleep 500

    MsgBox, 4, , Kør Næste Linje
        IfMsgBox, No
            Return
    Send ^{Numpad0}

Return


tab(antal){
    loop, %antal%{
        Send {TAB}
    }
}