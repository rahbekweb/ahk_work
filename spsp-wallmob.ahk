gY := 366
gi := 1
f4::
    Click, 80 293
    Send {ENTER}
    Sleep 2000
    Click, 80 366
    Sleep 2000
    Click, 1575 267
    Send ^{END}
    Sleep 500
    Click, 1275 740
    Sleep 500
    Click, 876 268
    Sleep 1000
    ;MsgBox, "%gi%  %gY%"
    ;if(gi<=4){
    ;    gY := gY+50
    ;    gi := gi+1
    ;}else{
        gY := 366
        gi := 1
    ;}
    ;MsgBox, "%gi%  %gY%"
Return

f2::
    ;MsgBox, "%gi%  %gY%"
    Click, 80 %gY%
    Sleep 1000
    Click, 1575 267
    Send ^{END}
    Sleep 1000
    Click, 1185 740
    Sleep 500
    Click, 876 268
    Sleep 1000
    ;if(gi<=4){
    ;    gY := gY+50
    ;    gi := gi+1
    ;}else{
        gY := 366
        gi := 1
    ;}
Return
