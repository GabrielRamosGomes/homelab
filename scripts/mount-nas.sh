#!/bin/bash

set -euo pipefail

ENV_FILE="/home/rapilukz/homelab/scripts/.env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Missing env file: $ENV_FILE"
  exit 1
fi

source "$ENV_FILE"

mountpoint -q /mnt/nas/filebrowser || mount -t cifs "//$NAS_IP/filebrowser" /mnt/nas/filebrowser \
  -o credentials=/etc/samba/nas-credentials,uid=1000,gid=1000,iocharset=utf8,vers=3.0

mountpoint -q /mnt/nas/immich || mount -t cifs "//$NAS_IP/immich" /mnt/nas/immich \
  -o credentials=/etc/samba/nas-credentials,uid=1000,gid=1000,iocharset=utf8,vers=3.0

mountpoint -q /mnt/nas/jellyfin || mount -t cifs "//$NAS_IP/jellyfin" /mnt/nas/jellyfin \
  -o credentials=/etc/samba/nas-credentials,uid=1000,gid=1000,iocharset=utf8,vers=3.1.1,nobrl,cache=strict

echo "NAS shares mounted successfully."