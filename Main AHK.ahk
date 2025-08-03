; AutoHotkey v2 script to switch virtual desktops using extra mouse buttons
; XButton1 (usually back button) - Switch to previous desktop
; XButton2 (usually forward button) - Switch to next desktop

#SingleInstance Force  ; Replace any existing instance of this script
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory

; Function to check if mouse is over taskbar
IsMouseOverTaskbar() {
    ; Get the window under the mouse cursor
    MouseGetPos(,, &WindowUnderMouse)
    
    ; Get the class name of the window under mouse
    try {
        WindowClass := WinGetClass(WindowUnderMouse)
        
        ; Check if it's the taskbar or system tray
        ; Shell_TrayWnd = Main taskbar
        ; Shell_SecondaryTrayWnd = Secondary taskbar on multi-monitor setups
        if (WindowClass = "Shell_TrayWnd" || WindowClass = "Shell_SecondaryTrayWnd") {
            return true
        }
    }
    
    return false
}

XButton1:: {
    if (IsMouseOverTaskbar()) {
        Send('^#{Left}')
    }
}

XButton2:: {
    if (IsMouseOverTaskbar()) {
        Send('^#{Right}')
    }
}
