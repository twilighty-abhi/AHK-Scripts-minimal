# AutoHotkey Productivity Script

A comprehensive AutoHotkey v2 script that enhances Windows productivity with monitor switching, virtual desktop management, text search, and quick app launching.

## 🚀 Features

### 1. **Caps Lock Management**
- **Default State**: Caps Lock is disabled by default
- **Toggle**: Right-click tray icon to enable/disable Caps Lock functionality
- **Visual Feedback**: Tray notifications and tooltips show current state

### 2. **Monitor Switching (When Caps Lock Disabled)**
- **Hotkey**: Press `Caps Lock` key
- **Function**: Moves cursor to the center of the next monitor
- **Behavior**: Cycles through all available monitors
- **Single Monitor**: Centers cursor on current monitor if only one exists

### 3. **Virtual Desktop Management**
- **Context-Sensitive**: Different behavior when mouse is over taskbar vs. elsewhere

#### **Over Taskbar:**
- **XButton1** (Mouse Back Button): Switch to previous virtual desktop
- **XButton2** (Mouse Forward Button): Switch to next virtual desktop
- **Middle Mouse Button**: Play/Pause media
- **Scroll Wheel Up**: Increase system volume
- **Scroll Wheel Down**: Decrease system volume

#### **Elsewhere:**
- **XButton1** (Mouse Back Button): Alt+Tab (switch between windows)
- **XButton2** (Mouse Forward Button): Win+Tab (Task View)

### 4. **Text Search**
- **Hotkey**: `Ctrl + Shift + S`
- **Function**: Searches highlighted text on Google
- **Features**: 
  - Clipboard protection (saves/restores your clipboard)
  - Works from any application
  - Opens search in default browser
  - Handles special characters properly

### 5. **Quick App Launcher**
Multiple productivity apps can be opened/toggled with a single keystroke:

#### **WhatsApp**
- **Hotkey**: `Alt + W`
- **Function**: Opens/toggles WhatsApp desktop app

#### **Notion**
- **Hotkey**: `Alt + N`
- **Function**: Opens/toggles Notion desktop app

#### **TickTick**
- **Hotkey**: `Alt + T`
- **Function**: Opens/toggles TickTick task manager

#### **Microsoft Edge**
- **Hotkey**: `Alt + X`
- **Function**: Opens/activates Microsoft Edge browser

#### **Firefox**
- **Hotkey**: `Alt + C`
- **Function**: Opens/activates Firefox browser

#### **Google Keep**
- **Hotkey**: `Alt + K`
- **Function**: Opens Google Keep with a new note in Edge

**Features**:
  - Toggles window (minimize if active, activate if running, launch if not)
  - Launches from shortcuts in script directory
  - Fallback to web versions when needed

## 📋 Commands Reference

| Hotkey | Function | Description |
|---------|----------|-------------|
| `Caps Lock` | Monitor Switchtoggle WhatsApp app |
| `Alt + N` | Notion | Open/toggle Notion app |
| `Alt + T` | TickTick | Open/toggle TickTick app |
| `Alt + X` | Edge Browser | Open/toggle Microsoft Edge |
| `Alt + C` | Firefox Browser | Open/toggle Firefox |
| `Alt + K` | Google Keep | Open new note in Google Keep |
| `XButton1` (Taskbar) | Previous Desktop | Switch to previous virtual desktop |
| `XButton2` (Taskbar) | Next Desktop | Switch to next virtual desktop |
| `MButton` (Taskbar) | Media Control | Play/Pause media |
| `Wheel Up` (Taskbar) | Volume Up | Increase system volume |
| `Wheel Down` (Taskbar) | Volume Down | Decrease system volumeevious virtual desktop |
| `XButton2` (Taskbar) | Next Desktop | Switch to next virtual desktop |
| `MButton` (Taskbar) | Media Control | Play/Pause media |
| `XButton1` (Elsewhere) | Window Switch | Alt+Tab between windows |
| `XButton2` (Elsewhere) | Task View | Win+Tab (Task View) |
App Launcher**: Instantly access productivity apps (WhatsApp, Notion, TickTick) with Alt hotkeys
5. **Browser Management**: Toggle between Edge and Firefox with Alt+X and Alt+C
6. **Quick Notes**: Capture ideas instantly with Alt+K (Google Keep)
## 🎯 Use Cases

### Volume Control**: Adjust volume with scroll wheel over taskbar
- ****Productivity Workflow**
1. **Multi-Monitor Setup**: Use Caps Lock to quickly switch between monitors
2. **Virtual Desktops**: Navigate between work and personal spaces efficiently
3. **Quick Research**: Highlight text and search instantly with Ctrl+Shift+S
4. **Communication**: Access WhatsApp quickly with Alt+W

### **Gaming & Entertainment**
- **Monitor Switching**: Quick access to different gaming monitors
- **Media Control**: Control music/video from taskbar area
- **Window Management**: Fast Alt+Tab for game switching

### **Development & Coding**
- **Multi-Monitor**: Switch between code editor and documentation
- **Quick Search**: Search error messages or code snippets instantly
- **Desktop Organization**: Separate coding and reference desktops

### **Office Work**
- **Document Switching**: Navigate between multiple applications
- **Research**: Quick web searches from any document
- **Communication**: Fast access to messaging apps

## ⚙️ Configuration

### **Tray Menu Options**
- **Enable/Disable Caps Lock**: Toggle Caps Lock functionality
- **Exit**: Close the script

### **Default Settings**
- Caps Lock starts disabled
- Monitor switching enabled by default
- All hotkeys active immediately

## 🔧 Installation & Usage

##Optional: App shortcuts in script directory (WhatsApp, Notion, TickTick) for enhanced functionality
- Windows 10/11
- AutoHotkey v2 installed
- WhatsApp shortcut in script directory (for WhatsApp feature)
(Optional) Add shortcuts for apps you want to launch:
   - `WhatsApp - Shortcut.lnk`
   - `Notion - Shortcut.lnk`
   - `TickTick.lnk`
### **Setup**
1. Place `Main AHK.ahk` in your desired directory
2. Ensure `WhatsApp - Shortcut.lnk` is in the same directory
3. Double-click the script to run
4. Right-click tray icon to access options

### **Running**
- **Start**: Double-click `Main AHK.ahk`
- **Stop**: Right-click tray icon → Exit
- **Auto-start**: Add script to Windows startup folder
      # Main AutoHotkey script
├── WhatsApp - Shortcut.lnk     # WhatsApp shortcut (optional)
├── Notion - Shortcut.lnk       # Notion shortcut (optional)
├── TickTick.lnk                # TickTick shortcut (optional)
└── README.md     
Scripts/
├── Main AHK.ahk          # Main AutoHotkey script
├── WhatsApp - Shortcut.lnk # WhatsApp shortcut (required)
└── README.md              # This documentation
```
Apps not opening**: Verify shortcut files exist in script directory (or script will use web fallback)
- **Hotkeys not responding**: Check if other software is blocking hotkeys
- **Volume control not working**: Ensure mouse is over taskbar when scrolling

### **Common Issues**
- **Caps Lock not working**: Check if script is running (tray icon visible)
- **Monitor switching issues**: Ensure multiple monitors are detected
- **WhatsApp not opening**: Verify shortcut file exists in script directory
- **Hotkeys not responding**: Check if other software is blocking hotkeys

### **Reset Options**
- Restart the script
- Check Windows hotkey conflicts
- Verify AutoHotkey v2 is installed

## 🔄 Updates & Maintenance

### **Adding New Features**
- Edit `Main AHK.ahk` with new hotkeys
- Test thoroughly before deployment
- Update this README with new commands

### **Customization**
- Modify hotkey combinations as needed
- Add new application shortcuts
- Adjust monitor switching behavior

## 📞 Support

For issues or feature requests:
1. Check this2.0  
**Last Updated**: January 19, 2026s are met
3. Test with minimal script modifications

---

**Version**: 1.0  
**Last Updated**: Current  
**AutoHotkey Version**: v2  
**Compatibility**: Windows 10/11
