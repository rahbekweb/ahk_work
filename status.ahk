!z::Suspend

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