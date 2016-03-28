#Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script
!z::Suspend
f3::
    Click, 47 294
    Sleep 500
    Click, 75 323
    Sleep 500
    Click, 238 350
    Sleep 2000
    Click, 574 236
    Sleep 500
    Click, 945 255
    Sleep 500
    Send ^a
    Send 12:00
    Loop,7{
        Send {TAB}{SPACE}
    }
    Sleep 1000
    
    Click, 574 236
    Sleep 500
    Click, 945 255
    Sleep 500
    Send ^a
    Send 17:00
    Loop,7{
        Send {TAB}{SPACE}
    }
    Sleep 500
    Click 1146 444
    Sleep 2000
    
    
    Click, 47 294
    Sleep 500
    Click, 75 350 
    Sleep 500
    Click, 236 374
    Sleep 2000
    Click, 574 236
    Sleep 500
    Click, 945 255
    Sleep 500
    Send ^a
    Send 17:00
    Loop,7{
        Send {TAB}{SPACE}
    }
    Sleep 500
    Click 1146 444
    Sleep 2000
    
    Click 1572 137
    Send {DOWN}{ENTER}
Return


; ret kontakter
f6::
    myArray := [235,265,295,325,355,385,415,445,475,505,535,570,600,630,660,690,720,750,780]
    
    
    for each, value in myArray {
        Send {TAB}{TAB}^{END}
        Sleep 500
        Click, 542 %value%
        Sleep 1000
        Click, 721 207
        Sleep 500
        Click, 682 247
        Sleep 500
        Send {Backspace}{Backspace}
        Sleep 500
        Send 10
        Sleep 500
        Send {Backspace}{Backspace}
        Send 00
        Sleep 500
        Send {Backspace}{Backspace}
        Sleep 500
        Send 17
        Sleep 500
        Send {Backspace}{Backspace}
        Send 00
        Sleep 1000
        Click 757 269
        Sleep 500
        Click 887 296
        Sleep 500
        Click 789 301
        Sleep 500
        Click 785 322
        Sleep 500
        Click 967 471
        Sleep 500
        Click 974 262
        Sleep 500
        Click 1100 97
        Sleep 2000
    }
    
    Send ^{HOME}
    Sleep 1000
    Click 1485, 128
    Send {DOWN}{ENTER}

Return


; Skjul felter der ikke skal bruges
f2::
    ;myArray := [235,265,295,325,355,385,415,445,475,505,535,570,600,630,660,690,720,750,780]
    
    
    ;for each, value in myArray {
        Send ^{HOME}
        Click 1572 212  ;klik på ret
        Sleep 1000
        ; ////// forsendelses linjer //////
        Click 561 570   ;klik på "forsendelses linjer"
        Sleep 500
        Click 784 267   ;klik på opmærkning
        Send {TAB}{TAB}{SPACE} ;spring til vægt 
        tabSpace(11)    ;fjern de næste 11
        tab(10)         ;spring over de næste 10
        tabSpace(1)     ;fjern DG linjer
        
        ; ////// besked //////
        click 581 710
        Sleep 500
        click 998 228
        click 805 264
        
        ; ////// efterkrav //////
        click 488 758
        Sleep 500
        click 728 226
        tabSpace(2)
        
        ; ////// efterkrav //////
        click 488 815
        Sleep 500
        click 728 226
        tabSpace(1)
        
        ; ////// save //////
        sleep 500
        click 1171 133
        sleep 500
        Click 730 264
        Click 752 443
        sleep 2000
        
        
    ;}
    
    Send ^{HOME}
    Sleep 1000
    Click 1485, 128
    Send {DOWN}{ENTER}

Return


; functioner
tabSpace(antal){
    loop, %antal%{
            Send {TAB}{SPACE}
    }
}
tab(antal){
    loop, %antal%{
            Send {TAB}
    }
}


;reload
#t:: ; press control+r to reload
Msgbox, Do you really want to reload this script?
Reload
return