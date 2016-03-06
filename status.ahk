^Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script
!x::Suspend

ENTER::
    WinGetTitle, title, A
    if(InStr(title, " - Notesblok")){
        Send, ,1
        Send {ENTER}
        Send ^s
    }else{
        Send {ENTER}
    }
Return