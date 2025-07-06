# PicoCalcVibes 🎯

<p align="center">
  <img src="https://github.com/IamUSER/PicoCalcVibes/blob/main/PCVibes.png?raw=true">
<br>

> **Vibe coded PicoCalc apps that are free to use and remix**

A collection of creative, useful, and fun applications for the PicoCalc running PicoMite BASIC. All apps are designed to showcase the capabilities of the 320x320 pixel display and are completely free to use, modify, and share.

## 🚀 Featured Apps

### Screen Testing & Display
- **`Screen Tests/256.bas`** - Comprehensive 256-color screen test with real-time RGB/HEX/HSV values and complementary contrast
- **`Screen Tests/gradient.bas`** - Evolving fullscreen gradient display with mathematical color transitions

### Utilities & Tools
- **`Tools/calc.bas`** - CLI Calculator with basic arithmetic operations (+, -, *, /), optimized for 320x320 display

### Coming Soon
- Games & Entertainment
- Art & Visualization
- Educational Apps

## 🎮 Hardware Requirements

- **PicoCalc** with PicoMite firmware
- **Display**: 320x320 pixel color screen
- **Controls**: Arrow keys, ESC, and standard keyboard input

## 📱 Quick Start

### Step 1: Download the App
1. **Browse** the repository and find a `.bas` file you want to try
2. **Click** on the file to view its contents
3. **Click** the "Raw" button to view the plain text version
4. **Right-click** and "Save As" to download the file to your computer
   - Or copy the raw text and paste it into a new `.bas` file

### Step 2: Transfer to SD Card
1. **Remove** the micro SD card from your PicoCalc
2. **Insert** the SD card into your computer (using a card reader/adapter)
3. **Copy** the downloaded `.bas` file to the root directory of the SD card
   - You can also organize files in folders if preferred
4. **Safely eject** the SD card from your computer
5. **Insert** the SD card back into your PicoCalc

### Step 3: Load and Run in PicoMite
1. **Power on** your PicoCalc
2. **Wait** for the PicoMite BASIC prompt (`>`) to appear
3. **Type** `FILES` and press Enter to see available files
4. **Load** your app by typing: `LOAD "filename.bas"`
   - Replace `filename.bas` with the actual name of your downloaded file
   - Example: `LOAD "filename.bas"`
5. **Run** the app by typing: `RUN`
6. **Enjoy** your app! Press ESC to exit most apps

### Step 4: Modify and Experiment
- **Edit** code by typing `EDIT` after loading a program
- **Save** changes with `SAVE "filename.bas"`
- **List** the program code with `LIST`
- **Create** new programs from scratch using `NEW`

### Pro Tips 💡
- **Organize**: Create folders on your SD card like `/games/`, `/tools/`, etc.
- **Backup**: Keep copies of your modified programs
- **Autorun**: Rename a file to `autorun.bas` to run automatically on startup
- **Quick Load**: Use `LOAD "*"` to load the most recently saved program

## 🎨 App Categories

### 🖥️ Screen & Display Testing
Perfect your PicoCalc display with comprehensive testing tools.

### 🎲 Games & Entertainment
Fun and engaging applications to enjoy on your PicoCalc.

### 🔧 Utilities & Tools
Practical applications for everyday use.

### 🎭 Art & Visualization
Creative and visual applications that showcase the display capabilities.

### 📚 Educational
Learning tools and educational demonstrations.

## 🛠️ Development Guidelines

### Code Style
- Clear, commented code
- Descriptive variable names
- Modular functions where possible
- PicoMite BASIC compatibility

### App Standards
- **Resolution**: Optimized for 320x320 displays
- **Controls**: Intuitive keyboard/arrow key navigation
- **Exit**: Always include ESC key exit option
- **Documentation**: Include header with description and controls

### File Naming
- Use descriptive names (e.g., `color-test.bas`, `snake-game.bas`)
- Use lowercase with hyphens for multi-word names
- Include `.bas` extension for BASIC files

## 🤝 Contributing

We welcome contributions! Here's how to get involved:

### Adding New Apps
1. **Fork** this repository
2. **Create** your app following our guidelines
3. **Test** thoroughly on PicoCalc hardware
4. **Document** with clear comments and usage instructions
5. **Submit** a pull request

### Improving Existing Apps
- Bug fixes are always welcome
- Performance optimizations
- Feature enhancements
- Better documentation

### Reporting Issues
- Use GitHub Issues for bug reports
- Include PicoCalc firmware version
- Describe expected vs actual behavior
- Include relevant code snippets

## 📋 App Template

```basic
' App Name - Brief Description
' Detailed description of what the app does
'
' Controls:
' - Key descriptions here
' - ESC: Exit
'
' Created by [Your Name]
' [Date]

' Constants and setup
CONST SCREEN_WIDTH = 320
CONST SCREEN_HEIGHT = 320

' Your app code here
' Remember to include ESC exit handling

' Clean exit
CLS RGB(0, 0, 0)
END
```

## 🌟 Showcase

Share your creations! Tag us with `#PicoCalcVibes` when you:
- Create new apps
- Remix existing ones
- Show off your PicoCalc setup
- Share cool screenshots

## 📄 License

### Free & Open Source
All apps in this repository are released under the **MIT License** - feel free to:
- ✅ Use for personal projects
- ✅ Use for commercial projects  
- ✅ Modify and remix
- ✅ Redistribute
- ✅ Share with others

### Attribution
While not required, we appreciate attribution when you remix or share these apps!

## 🔗 Links & Resources

- **PicoMite Documentation**: [Official PicoMite Manual](https://geoffg.net/picomite.html)
- **PicoCalc Hardware**: [PicoCalc Information](https://example.com) <!-- Update with actual link -->
- **Community Forum**: [Discussion & Support](https://example.com) <!-- Update with actual link -->

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/username/PicoCalcVibes?style=social)
![GitHub forks](https://img.shields.io/github/forks/username/PicoCalcVibes?style=social)
![GitHub issues](https://img.shields.io/github/issues/username/PicoCalcVibes)
![GitHub license](https://img.shields.io/github/license/username/PicoCalcVibes)

## 🙏 Acknowledgments

- **PicoMite Community** - For the amazing firmware and support
- **Contributors** - Everyone who creates and shares apps
- **PicoCalc Developers** - For building such a cool device
- **You** - For being part of the PicoCalcVibes community!

---

**Made with ❤️ for the PicoCalc community**

*Have an idea for an app? Found a bug? Want to contribute? Open an issue or start a discussion!*
