#!/system/bin/sh

MODDIR=${0%/*}
DATA_DIR="/data/bypass_chg"
GAMELIST="$DATA_DIR/gamelist.txt"
LOGFILE="$MODDIR/post-fs-data.log"

log() {
    printf '[%s] %s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$1" >> "$LOGFILE"
}

log "post-fs-data.sh started"

mkdir -p "$DATA_DIR"
log "Ensured directory exists: $DATA_DIR"

if [ ! -f "$GAMELIST" ]; then
    cp -f "$MODDIR/data/bypass_chg/gamelist.txt" "$GAMELIST"
    log "Copied gamelist.txt to $GAMELIST"
else
    log "Gamelist.txt already exists, skipping copy"
fi

chmod 0644 "$GAMELIST"
log "Set permissions 0644 on $GAMELIST"

log "post-fs-data.sh completed"
