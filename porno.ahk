Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script
!x::Suspend
f2::
    WinGetTitle, title, A
    ; MsgBox, "%title%"
    
    ; ifWinActive ahk_class Chrome_WidgetWin_1 {
        Send ^{HOME}
        Sleep 300
        Click, 1243 151
        Sleep 1000
        Click, 511 217
        Send rasmusrahbek@pcnetkom.dk{TAB}.Xvideos4me.{ENTER}
        
    ; }
Return
f3::
    WinGetTitle, title, A
    ; MsgBox, "%title%"
    OutputVar := StrReplace(title, " - XVIDEOS.COM – Google Chrome","")
    ; MsgBox, "%OutputVar%"
    ; IfWinActive ahk_class Chrome_WidgetWin_1 {
        Send ^{HOME}
        Sleep 300
        MouseMove, 788, 740
        MouseGetPos, MouseX, MouseY
        PixelGetColor, color, %MouseX%, %MouseY% RGB
        ;MsgBox, "%color%"
        if(color!="0x000000"){
            MouseMove, 788, 715
            MouseGetPos, MouseX, MouseY
            PixelGetColor, color, %MouseX%, %MouseY% RGB
            ;MsgBox, "%color%"
            if(color!="0x000000"){
                
            }
        }
        
        Click, %MouseX%, %MouseY%
        Sleep 1000
        MouseY := MouseY + 62
        Click, 881 %MouseY%
        WinGetTitle, te, A
        if(te=="Ikke-navngivet – Google Chrome")
        {
            Sleep 1500
            Send {HOME}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}%OutputVar%
            Sleep 1000
            Send {ENTER}
            Sleep 1000
            Send ^{F4}
        }
    ; }
Return
f4::
    WinGetTitle, title, A
    ; MsgBox, "%title%"
    OutputVar := StrReplace(title, " - XVIDEOS.COM – Google Chrome","")
    ; MsgBox, "%OutputVar%"
    ; IfWinActive ahk_class Chrome_WidgetWin_1 {
        MouseGetPos, MouseX, MouseY
        Click
        Sleep 1000
        MouseY := MouseY + 62
        Click, 881 %MouseY%
        WinGetTitle, te, A
        if(te=="Ikke-navngivet – Google Chrome")
        {
            Sleep 1500
            Send {HOME}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}{DELETE}%OutputVar%
            Sleep 1000
            Send {ENTER}
            Sleep 1000
            Send ^{F4}
        }
    ; }
Return
