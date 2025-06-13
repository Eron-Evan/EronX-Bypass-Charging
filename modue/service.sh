#!/system/bin/sh

MODPATH=${0%/*}
LOGFILE="$MODPATH/log.txt"
GAMELIST="/data/bypass_chg/gamelist.txt"

log() {
    printf '[%s] %s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$1" >> "$LOGFILE"
}

log "service.sh started"

# Wait for boot to complete
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    log "Waiting for system boot..."
    sleep 5
done

log "Boot completed"

# Check if gamelist exists before starting monitoring
if [ ! -f "$GAMELIST" ]; then
    log "No gamelist found at $GAMELIST — skipping monitoring"
    exit 0
fi

log "Gamelist found. Launching AppMonitoringUtil.sh"

# Main monitoring loop
while true; do
    /system/bin/AppMonitoringUtil.sh
    STATUS=$?

    if [ "$STATUS" -eq 0 ]; then
        log "AppMonitoringUtil.sh exited normally — stopping loop"
        break
    else
        log "AppMonitoringUtil.sh crashed (exit code $STATUS) — restarting in 5s"
        sleep 5
    fi
done
