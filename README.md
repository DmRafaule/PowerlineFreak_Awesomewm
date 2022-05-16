# Fork-AwesomeWM

This is a my custom config for awesome wm. 
📦Sources
 ┣ 📂Bindings
 ┃ ┗ 📜keybindings.lua
 ┣ 📂Decorations
 ┃ ┣ 📜panel_powerline.lua
 ┃ ┣ 📜theme.lua
 ┃ ┗ 📜windowbar.lua
 ┣ 📂Main
 ┃ ┣ 📜errorHandler.lua
 ┃ ┣ 📜rules.lua
 ┃ ┣ 📜signals.lua
 ┃ ┗ 📜user_var.lua
 ┗ 📂Widgets
 ┃ ┣ 📂charge
 ┃ ┃ ┗ 📜battery.lua
 ┃ ┣ 📂keyboard_layout
 ┃ ┃ ┣ 📜init.lua
 ┃ ┃ ┣ 📜kbdcfg.lua
 ┃ ┃ ┗ 📜kl.lua
 ┃ ┣ 📂launcher
 ┃ ┃ ┗ 📜launcherWidget.lua
 ┃ ┣ 📂prompt
 ┃ ┃ ┗ 📜promptWidget.lua
 ┃ ┣ 📂systray
 ┃ ┃ ┗ 📜systrayWidget.lua
 ┃ ┣ 📂taglist
 ┃ ┃ ┗ 📜taglistWidget.lua
 ┃ ┣ 📂tasklist
 ┃ ┃ ┗ 📜tasklistWidget.lua
 ┃ ┣ 📂time
 ┃ ┃ ┗ 📜timeWidget.lua
 ┃ ┣ 📂volume
 ┃ ┃ ┗ 📜main.lua
 ┃ ┗ 📂work_layout
 ┃   ┗ 📜layoutWidget.lua

## Dependencies
In all cases it will be for widgets
### Widgets/charge
* **acpi** package
### Widgets/keyboard_layout
* None
### Widgets/launcher
* None
### Widgets/prompt 
* None
### Widgets/systray
* None *For now it's not flexible. Rework required*
### Widgets/taglist
* None
### Widgets/tasklist
* None
### Widgets/time
* None
### Widgets/volume
* **amixer**, **pacmd** packages
### Widgets/work_layout
* None

For some of widgets I did not create separated file, for now.
All of those widgets can be find in Decorations/panel_powerline
Such as 
### Brightness
* xbacklight
### net_widget
* None
### calender
* None

For now desktop is not supported. But 
