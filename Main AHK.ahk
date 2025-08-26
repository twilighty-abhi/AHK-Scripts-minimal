; AutoHotkey v2 script to switch virtual desktops using extra mouse buttons
; XButton1 (usually back button) - Switch to previous desktop
; XButton2 (usually forward button) - Switch to next desktop

#SingleInstance Force  ; Replace any existing instance of this script
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory

; --- Caps Lock Control Variables ---
global CapsLockDisabled := true  ; Start with Caps Lock disabled

; --- System Tray Setup ---
A_TrayMenu.Delete()  ; Remove default tray menu items
A_TrayMenu.Add("Enable Caps Lock", ToggleCapsLock)
A_TrayMenu.Add()  ; Separator
A_TrayMenu.Add("Exit", ExitApp)
A_TrayMenu.Default := "Enable Caps Lock"
UpdateTrayIcon()

; Function to toggle Caps Lock state
ToggleCapsLock(*) {
    global CapsLockDisabled
    CapsLockDisabled := !CapsLockDisabled
    if (CapsLockDisabled) {
        A_TrayMenu.Rename("Disable Caps Lock", "Enable Caps Lock")
        TrayTip("Caps Lock Manager", "Caps Lock is now DISABLED", 2)
    } else {
        A_TrayMenu.Rename("Enable Caps Lock", "Disable Caps Lock")
        TrayTip("Caps Lock Manager", "Caps Lock is now ENABLED", 2)
    }
    UpdateTrayIcon()
}

; Function to update tray icon based on state
UpdateTrayIcon() {
    global CapsLockDisabled
    if (CapsLockDisabled) {
        A_IconTip := "Caps Lock Manager - DISABLED"
        ; You can set a custom icon here if you have one
        ; A_IconFile := "disabled_icon.ico"
    } else {
        A_IconTip := "Caps Lock Manager - ENABLED"
        ; You can set a custom icon here if you have one
        ; A_IconFile := "enabled_icon.ico"
    }
}

; Function to exit the application
ExitApp(*) {
    ExitApp()
}

; Show initial notification
TrayTip("Caps Lock Manager", "Caps Lock is disabled. Right-click tray icon to toggle.", 3)

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

; --- Caps Lock Key Remapping ---
; Disable Caps Lock when CapsLockDisabled is true
#HotIf CapsLockDisabled
CapsLock::return  ; Do nothing when Caps Lock is pressed

; Re-enable Caps Lock when CapsLockDisabled is false
#HotIf !CapsLockDisabled
; Caps Lock works normally (no remapping needed)

; --- Context-sensitive hotkeys (when mouse is over the taskbar) ---
#HotIf IsMouseOverTaskbar()

XButton1::Send('^#{Left}')  ; Previous desktop
XButton2::Send('^#{Right}') ; Next desktop
MButton::Send('{Media_Play_Pause}') ; Play/Pause media

; --- General hotkeys (when mouse is NOT over the taskbar) ---
#HotIf ; Turn off context-sensitivity

XButton1::Send('!{Tab}') ; Alt+Tab
XButton2::Send('#{Tab}')  ; Win+Tab

