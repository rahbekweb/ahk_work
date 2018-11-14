f3::
MouseGetPos,,, OutputVarWin, OutputVarCtl
ControlGetText, TextVar2 , %OutputVarCtl%, ahk_id %OutputVarWin%
Msgbox, The window says, "%TextVar2%"
return

Home::
WinGetText, OutputVar, a
msgbox, %OutputVar%
return