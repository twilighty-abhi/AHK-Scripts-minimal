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

; Function to move cursor to next monitor
MoveCursorToNextMonitor() {
    ; Get current mouse position
    MouseGetPos(&CurrentX, &CurrentY)
    
    ; Get monitor count using a more reliable method
    MonitorCount := SysGet(80)  ; SM_CMONITORS
    
    if (MonitorCount <= 1) {
        ; Single monitor - move to center of current monitor
        MonitorGet(1, &Left, &Top, &Right, &Bottom)
        CenterX := Left + ((Right - Left) // 2)
        CenterY := Top + ((Bottom - Top) // 2)
        MouseMove(CenterX, CenterY, 0)
        return
    }
    
    ; Find which monitor the cursor is currently on
    CurrentMonitor := 1  ; Default to first monitor
    
    ; Check each monitor to find current one
    Loop MonitorCount {
        MonitorGet(A_Index, &Left, &Top, &Right, &Bottom)
        ; Check if cursor is within this monitor's bounds
        if (CurrentX >= Left && CurrentX < Right && CurrentY >= Top && CurrentY < Bottom) {
            CurrentMonitor := A_Index
            break
        }
    }
    
    ; Calculate next monitor (cycle through all monitors)
    NextMonitor := (CurrentMonitor >= MonitorCount) ? 1 : CurrentMonitor + 1
    
    ; Get the exact bounds of the target monitor
    MonitorGet(NextMonitor, &TargetLeft, &TargetTop, &TargetRight, &TargetBottom)
    
    ; Calculate the absolute center of the target monitor
    CenterX := TargetLeft + ((TargetRight - TargetLeft) // 2)
    CenterY := TargetTop + ((TargetBottom - TargetTop) // 2)
    
    ; Move cursor instantly to the exact center
    MouseMove(CenterX, CenterY, 0)
}

; Function to search highlighted text
SearchHighlightedText() {
    ; Store current clipboard content
    OldClipboard := ClipboardAll()
    
    ; Clear clipboard
    A_Clipboard := ""
    
    ; Copy selected text
    Send("^c")
    
    ; Wait for clipboard to contain text (with timeout)
    if (!ClipWait(0.5)) {
        ; No text was selected, restore clipboard and exit
        A_Clipboard := OldClipboard
        return
    }
    
    ; Get the selected text
    SelectedText := A_Clipboard
    
    ; Restore original clipboard
    A_Clipboard := OldClipboard
    
    ; Clean up the text for URL encoding
    SelectedText := Trim(SelectedText)
    
    ; If text is empty or too long, don't search
    if (SelectedText = "" || StrLen(SelectedText) > 500) {
        return
    }
    
    ; URL encode the search text
    SearchQuery := UrlEncode(SelectedText)
    
    ; Create Google search URL
    SearchURL := "https://www.google.com/search?q=" . SearchQuery
    
    ; Open the search in default browser
    Run(SearchURL)
}

; Function to URL encode text
UrlEncode(str) {
    encoded := ""
    Loop Parse, str {
        char := A_LoopField
        ; Keep alphanumeric characters and some safe characters
        if (char ~= "[A-Za-z0-9\-_.~]") {
            encoded .= char
        } else {
            ; Convert to hex encoding
            encoded .= "%" . Format("{:02X}", Ord(char))
        }
    }
    return encoded
}

; Function to open WhatsApp
OpenWhatsApp() {
    ; Check if WhatsApp window is active
    if (WinActive("ahk_exe WhatsApp.exe")) {
        WinMinimize()
        return
    }
    
    ; Try to find and activate existing WhatsApp window
    if (WinExist("ahk_exe WhatsApp.exe")) {
        WinRestore()
        WinActivate()
        return
    }
    
    ; If WhatsApp is not running, try to launch it
    ; Use the specific shortcut path
    ShortcutPath := A_ScriptDir . "\WhatsApp - Shortcut.lnk"
    
    if (FileExist(ShortcutPath)) {
        Run(ShortcutPath)
        return
    }
    
    ; If shortcut not found, try to open WhatsApp Web as fallback
    Run("https://web.whatsapp.com")
}

; Function to open Notion
OpenNotion() {
    ; Check if Notion window is active
    if (WinActive("ahk_exe Notion.exe")) {
        WinMinimize()
        return
    }
    
    ; Try to find and activate existing Notion window
    if (WinExist("ahk_exe Notion.exe")) {
        WinRestore()
        WinActivate()
        return
    }
    
    ; If Notion is not running, try to launch it
    ; Use the specific shortcut path
    ShortcutPath := A_ScriptDir . "\Notion - Shortcut.lnk"
    
    if (FileExist(ShortcutPath)) {
        Run(ShortcutPath)
        return
    }
    
    ; If shortcut not found, try to open Notion Web as fallback
    Run("https://www.notion.so")
}

; Function to open TickTick
OpenTickTick() {
    ; Check if TickTick window is active
    if (WinActive("ahk_exe TickTick.exe")) {
        WinMinimize()
        return
    }
    
    ; Try to find and activate existing TickTick window
    if (WinExist("ahk_exe TickTick.exe")) {
        WinRestore()
        WinActivate()
        return
    }
    
    ; If TickTick is not running, try to launch it
    ; Use the specific shortcut path
    ShortcutPath := "C:\Users\abhir\OneDrive\Documents\Scripts\TickTick.lnk"
    
    if (FileExist(ShortcutPath)) {
        Run(ShortcutPath)
        return
    }
    
    ; If shortcut not found, try to open TickTick Web as fallback
    Run("https://ticktick.com")
}

; Function to open Edge
OpenEdge() {
    ; Check if Edge window is active
    if (WinActive("ahk_exe msedge.exe")) {
        WinMinimize()
        return
    }
    
    ; Try to find and activate existing Edge window
    if (WinExist("ahk_exe msedge.exe")) {
        WinRestore()
        WinActivate()
        return
    }
    
    ; If Edge is not running, launch it
    Run("msedge.exe")
}

; Function to open Firefox
OpenFirefox() {
    ; Check if Firefox window is active
    if (WinActive("ahk_exe firefox.exe")) {
        WinMinimize()
        return
    }
    
    ; Try to find and activate existing Firefox window
    if (WinExist("ahk_exe firefox.exe")) {
        WinRestore()
        WinActivate()
        return
    }
    
    ; If Firefox is not running, launch it
    Run("firefox.exe")
}

; Function to open Google Keep in Edge (new note)
OpenGoogleKeep() {
    ; Open Google Keep with new note in Edge
    Run("msedge.exe https://keep.google.com/u/0/#NOTE/new")
}

; Show initial notification
TrayTip("Caps Lock Manager", "Caps Lock is disabled. Right-click tray icon to toggle. Press Caps Lock to switch monitors.", 4)

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
;------------------------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------------------------
; --- Caps Lock Key Remapping ---
; When Caps Lock is disabled, use it to move cursor between monitors
#HotIf CapsLockDisabled
CapsLock::MoveCursorToNextMonitor()  ; Move cursor to next monitor when Caps Lock is pressed

; Re-enable Caps Lock when CapsLockDisabled is false
#HotIf !CapsLockDisabled
; Caps Lock works normally (no remapping needed)

; --- Context-sensitive hotkeys (when mouse is over the taskbar) ---
#HotIf IsMouseOverTaskbar()

XButton1::Send('^#{Left}')  ; Previous desktop
XButton2::Send('^#{Right}') ; Next desktop
MButton::Send('{Media_Play_Pause}') ; Play/Pause media
WheelUp::Send('{Volume_Up}')  ; Increase volume with system UI
WheelDown::Send('{Volume_Down}')  ; Decrease volume with system UI

; --- General hotkeys (when mouse is NOT over the taskbar) ---
#HotIf ; Turn off context-sensitivity

XButton1::Send('!{Tab}') ; Alt+Tab
XButton2::Send('#{Tab}')  ; Win+Tab

; --- Search Highlighted Text ---
^+s::SearchHighlightedText()  ; Ctrl+Shift+S to search selected text

; --- Quick App Launcher ---
!w::OpenWhatsApp()  ; Alt+W to open WhatsApp
!n::OpenNotion()    ; Alt+N to open Notion
!t::OpenTickTick()  ; Alt+T to open TickTick
!x::OpenEdge()      ; Alt+X to open Edge
!c::OpenFirefox()   ; Alt+C to open Firefox
!k::OpenGoogleKeep()  ; Alt+K to open Google Keep (new note in Edge)

