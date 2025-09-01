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
- **Hotkey**: `Alt + W`
- **Function**: Opens WhatsApp desktop app
- **Features**:
  - Activates existing WhatsApp window if running
  - Launches from shortcut if not running
  - Fallback to WhatsApp Web if needed

## 📋 Commands Reference

| Hotkey | Function | Description |
|---------|----------|-------------|
| `Caps Lock` | Monitor Switch | Move cursor to next monitor center |
| `Ctrl + Shift + S` | Text Search | Search highlighted text on Google |
| `Alt + W` | WhatsApp | Open/activate WhatsApp app |
| `XButton1` (Taskbar) | Previous Desktop | Switch to previous virtual desktop |
| `XButton2` (Taskbar) | Next Desktop | Switch to next virtual desktop |
| `MButton` (Taskbar) | Media Control | Play/Pause media |
| `XButton1` (Elsewhere) | Window Switch | Alt+Tab between windows |
| `XButton2` (Elsewhere) | Task View | Win+Tab (Task View) |

## 🎯 Use Cases

### **Productivity Workflow**
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

### **Requirements**
- Windows 10/11
- AutoHotkey v2 installed
- WhatsApp shortcut in script directory (for WhatsApp feature)

### **Setup**
1. Place `Main AHK.ahk` in your desired directory
2. Ensure `WhatsApp - Shortcut.lnk` is in the same directory
3. Double-click the script to run
4. Right-click tray icon to access options

### **Running**
- **Start**: Double-click `Main AHK.ahk`
- **Stop**: Right-click tray icon → Exit
- **Auto-start**: Add script to Windows startup folder

## 📁 File Structure
```
Scripts/
├── Main AHK.ahk          # Main AutoHotkey script
├── WhatsApp - Shortcut.lnk # WhatsApp shortcut (required)
└── README.md              # This documentation
```

## 🐛 Troubleshooting

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
1. Check this README for common solutions
2. Verify all requirements are met
3. Test with minimal script modifications

---

**Version**: 1.0  
**Last Updated**: Current  
**AutoHotkey Version**: v2  
**Compatibility**: Windows 10/11
