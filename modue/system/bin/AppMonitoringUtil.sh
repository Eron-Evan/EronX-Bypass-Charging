#!/system/bin/sh

CHG_SUSPEND="/sys/class/power_supply/battery/input_suspend"
USB_PRESENT="/sys/class/power_supply/usb/present"
GAMELIST="/data/bypass_chg/gamelist.txt"
USB_STATE_FILE="/data/bypass_chg/usb_state"

[ ! -f "$GAMELIST" ] && exit 1

GAMES_REGEX=$(paste -sd '|' "$GAMELIST")
PREV_USB=0

# Restore previous state if available
[ -f "$USB_STATE_FILE" ] && PREV_USB=$(cat "$USB_STATE_FILE" 2>/dev/null)

while true; do
    CUR_USB=$(cat "$USB_PRESENT" 2>/dev/null)
    [ -z "$CUR_USB" ] && CUR_USB=0
    echo "$CUR_USB" > "$USB_STATE_FILE"

    # Check game running
    GAME_RUNNING=0
    for pid in $(dumpsys window | grep "Session Session{" | awk '{print $3}' | cut -d: -f1); do
        [ -r "/proc/$pid/cmdline" ] || continue
        tr '\0' ' ' < "/proc/$pid/cmdline" | grep -qE "$GAMES_REGEX" && {
            GAME_RUNNING=1
            break
        }
    done

    # USB replugged while game running
    if [ "$PREV_USB" = "0" ] && [ "$CUR_USB" = "1" ] && [ "$GAME_RUNNING" = "1" ]; then
        echo 0 > "$CHG_SUSPEND"
        sleep 5
        echo 1 > "$CHG_SUSPEND"
    else
        # Maintain suspend state if game is running
        echo $([ "$GAME_RUNNING" = "1" ] && echo 1 || echo 0) > "$CHG_SUSPEND"
    fi

    PREV_USB="$CUR_USB"
    sleep 0.5
done
