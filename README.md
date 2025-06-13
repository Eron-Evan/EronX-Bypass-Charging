# ⚡ EronX | Bypass Charging

A powerful Magisk/KernelSU module that intelligently bypasses battery charging while gaming, reducing thermal load and improving performance for extended sessions.

## 📦 Features

- 🎮 Auto-bypass charging while selected games are running
- 🔋 Zero battery drain — even below 100%
- ⚡ Direct power from charger without heating the battery
- 🔄 Automatically resumes charging when games are closed
- 🛠️ Fully compatible with Magisk and KernelSU Next
- 💡 Low-power background service for monitoring
- 📄 Customizable game list (gamelist.txt)

## 🧠 How It Works

This module runs a background script (AppMonitoringUtil.sh) which:

- Detects if USB is connected
- Monitors foreground app against your custom gamelist.txt
- Toggles charging by writing to:
  /sys/class/power_supply/battery/input_suspend

## 📁 Included Files

customize.sh  
post-fs-data.sh  
service.sh  
config.sh  
AppMonitoringUtil.sh  
data/bypass_chg/gamelist.txt

## 📌 Usage Instructions

1. Flash the module using Magisk Manager
2. Reboot your device
3. Edit the game list at:
   /data/bypass_chg/gamelist.txt
4. Add game package names (e.g., com.garena.game.codm)
5. Launch any listed game while USB is connected — charging will be bypassed automatically

## 📝 Notes

- Charging control only activates when USB is plugged in
- Fully tested on MIUI-based ROMs with KernelSU Next
- You can use any text editor or root file manager to edit gamelist.txt

## 🙏 Credits

Module by ERON EVAN  
GitHub: https://github.com/Eron-Evan  
Source: https://github.com/Eron-Evan/EronX-Bypass-Charging

📢 Telegram Channel: https://t.me/eronX_projects  
💬 Telegram Group: https://t.me/the_flashing_hideout

## 🔒 License

Licensed under Creative Commons BY-NC 4.0  
https://creativecommons.org/licenses/by-nc/4.0/

⚠️ Personal, non-commercial use only. Please do not redistribute without permission.
