; AutoHotkey v2 script to switch virtual desktops using extra mouse buttons
; XButton1 (usually back button) - Switch to previous desktop
; XButton2 (usually forward button) - Switch to next desktop

#SingleInstance Force  ; Replace any existing instance of this script
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory

; Function to check if mouse is over taskbar
IsMouseOverTaskbar() {
    ; Get mouse position
    MouseGetPos(&MouseX, &MouseY)
    
    ; Get screen dimensions
    ScreenHeight := A_ScreenHeight
    ScreenWidth := A_ScreenWidth
    
    ; Check if mouse is in taskbar area (bottom 48 pixels by default)
    ; You can adjust this value if your taskbar is taller/shorter
    TaskbarHeight := 48
    
    ; Check if mouse is in taskbar area at bottom of screen
    if (MouseY >= (ScreenHeight - TaskbarHeight) && MouseY <= ScreenHeight) {
        return true
    }
    
    ; Check for taskbar on other edges (top, left, right)
    ; Top edge (first 48 pixels)
    if (MouseY >= 0 && MouseY <= TaskbarHeight) {
        return true
    }
    
    ; Left edge (first 48 pixels)
    if (MouseX >= 0 && MouseX <= TaskbarHeight) {
        return true
    }
    
    ; Right edge (last 48 pixels)
    if (MouseX >= (ScreenWidth - TaskbarHeight) && MouseX <= ScreenWidth) {
        return true
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
