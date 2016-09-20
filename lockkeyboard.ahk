QUIT_HOTKEY=^+!q
TOGGLE_ALL=<#esc
TOGGLE_M=+<#esc
TOGGLE_K=^<#esc
TOGGLE_OFF=^+!<#esc
; ______________________________________________________________________________
;
#Persistent
#singleinstance ignore
#NoEnv ; Avoids checking empty variables to see if they are environment variables
Menu,Tray,Icon,shell32.dll,48    ; systray icon is a padlock
; install the quit hotkey
Hotkey,%QUIT_HOTKEY%,ExitSub
Hotkey,%TOGGLE_ALL%,ToggleALL
Hotkey,%TOGGLE_M%,ToggleM
Hotkey,%TOGGLE_K%,ToggleK
Hotkey,%TOGGLE_OFF%,ToggleOFF
return
; ______________________________________________________________________________
;
ExitSub:
ExitApp ; The only way for an OnExit script to terminate itself is to use ExitApp in the OnExit subroutine

ToggleALL:
   LockALL := (LockALL  == "On" ? "Off" : "On")
   ToolTip LockAll %LockALL%
   SetTimer, RemoveToolTip, 1000
   BlockKeyboardInputs(LockALL)
   BlockMouseClicks(LockALL)
   if(LockALL == "On")
      BlockInput MouseMove
   Else
      BlockInput,MouseMoveOff
      lockM := "off"
      LockK := "off"
Return

ToggleM:
   LockM := (LockM == "On" ? "Off" : "On")
   ToolTip LockMouse %LockM%
   SetTimer, RemoveToolTip, 1000
   BlockKeyboardInputs("off")
   BlockMouseClicks(LockM)
   if(LockM == "On"){
      BlockInput MouseMove
      LockK := "off"
      LockALL := "off"
   }
   Else
      BlockInput,MouseMoveOff
Return

ToggleK:
   LockK := (LockK == "On" ? "Off" : "On")
   ToolTip LockKeyboard %LockK%
   SetTimer, RemoveToolTip, 1000
   BlockKeyboardInputs(LockK)
   BlockMouseClicks("off")
   BlockInput,MouseMoveOff
   if(LockK == "On")
      LockM := "off"
      LockALL := "off"
Return

ToggleOFF:
   ToolTip Off
   SetTimer, RemoveToolTip, 1000
   BlockKeyboardInputs("off")
   BlockMouseClicks("off")
   BlockInput,MouseMoveOff
   LockALL := "off"
   LockM := "off"
   LockK := "off"
Return

; ******************************************************************************
; Function:
;    BlockKeyboardInputs(state="On") disables all keyboard key presses,
;   but Control, Shift, Alt (thus a hotkey based on these keys can be used to unblock the keyboard)
;
; Param
;   state [in]: On or Off
;
BlockKeyboardInputs(state = "On")
{
   static keys
   
   ; har slået ESC fra
   keys=Space,Enter,Tab,BackSpace,Del,Ins,Home,End,PgDn,PgUp,Up,Down,Left,Right,CtrlBreak,ScrollLock,PrintScreen,CapsLock,Pause,AppsKey,LWin,LWin,NumLock,Numpad0,Numpad1,Numpad2,Numpad3,Numpad4,Numpad5,Numpad6,Numpad7,Numpad8,Numpad9,NumpadDot,NumpadDiv,NumpadMult,NumpadAdd,NumpadSub,NumpadEnter,NumpadIns,NumpadEnd,NumpadDown,NumpadPgDn,NumpadLeft,NumpadClear,NumpadRight,NumpadHome,NumpadUp,NumpadPgUp,NumpadDel,Media_Next,Media_Play_Pause,Media_Prev,Media_Stop,Volume_Down,Volume_Up,Volume_Mute,Browser_Back,Browser_Favorites,Browser_Home,Browser_Refresh,Browser_Search,Browser_Stop,Launch_App1,Launch_App2,Launch_Mail,Launch_Media,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,æ,ø,å,²,&,é,",',(,-,è,_,ç,à,),=,$,£,ù,*,~,#,{,[,|,``,\,^,@,],},;,:,!,?,.,/,§,<,>,vkBC
   
   Loop,Parse,keys, `,
      Hotkey, *%A_LoopField%, KeyboardDummyLabel, %state% UseErrorLevel
   Return

   ; hotkeys need a label, so give them one that do nothing
   
   KeyboardDummyLabel:
   
   Return
}

; ******************************************************************************
; Function:
;    BlockMouseClicks(state="On") disables all mouse clicks
;
; Param
;   state [in]: On or Off
;
BlockMouseClicks(state = "On")
{
   static keys="RButton,LButton,MButton,WheelUp,WheelDown"
   Loop,Parse,keys, `,
      Hotkey, *%A_LoopField%, MouseDummyLabel, %state% UseErrorLevel
   Return
   ; hotkeys need a label, so give them one that do nothing
   
   MouseDummyLabel:
   
   Return
}

RemoveToolTip:
   SetTimer, RemoveToolTip, Off
   ToolTip
return