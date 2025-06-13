#!/system/bin/sh

MODPATH=${0%/*}
ZIPFILE=${ZIPFILE:-"/dev/null"}

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=true

STATUS_MSG=""

ui_print() {
  echo "$1"
}

print_modname() {
  ui_print "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
  ui_print "  ░▒▓ ⚡️ | Bypass Charging App Monitoring ▓▒░  "
  ui_print "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
  ui_print ""
  ui_print "  By: @eron_evan"
  ui_print "  🎮 Disables charging while specified games run"
  ui_print "  📋 Game list editable after install:"
  ui_print "     /data/bypass_chg/gamelist.txt"
  ui_print "  🔋 Charging bypass active only during gameplay"
  ui_print "  🛠️ Flash and forget — no extra setup needed!"
  ui_print ""
}

print_modname

on_install() {
  STATUS_MSG="- Extracting module files"
  ui_print "$STATUS_MSG"
  extract "$ZIPFILE" 'module.prop' "$MODPATH"
  extract "$ZIPFILE" 'post-fs-data.sh' "$MODPATH"
  extract "$ZIPFILE" 'service.sh' "$MODPATH"
  extract "$ZIPFILE" 'gamelist.txt' '/data/bypass_chg/'
}

on_install

# Set permissions
STATUS_MSG="- Setting permissions"
ui_print "$STATUS_MSG"
chmod 0755 "$MODPATH/service.sh"
[ -f "$MODPATH/post-fs-data.sh" ] && chmod 0755 "$MODPATH/post-fs-data.sh"
chmod 0644 /data/bypass_chg/gamelist.txt

# Final message
STATUS_MSG="- Installation complete"
ui_print "$STATUS_MSG"
STATUS_MSG="- Bypass charging active when games run"
ui_print "$STATUS_MSG"