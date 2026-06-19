#!/bin/bash

set -euo pipefail

ENV_FILE="/home/rapilukz/homelab/scripts/.env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Missing env file: $ENV_FILE"
  exit 1
fi

source "$ENV_FILE"

mountpoint -q /mnt/nas/filebrowser || mount -t nfs 192.168.1.102:/volume1/filebrowser /mnt/nas/filebrowser \
  -o rw,nfsvers=3,proto=tcp,_netdev,noatime,hard,timeo=600,retrans=2

mountpoint -q /mnt/nas/immich || mount -t nfs 192.168.1.102:/volume1/immich /mnt/nas/immich \
  -o rw,nfsvers=3,proto=tcp,_netdev,noatime,hard,timeo=600,retrans=2

mountpoint -q /mnt/nas/jellyfin || mount -t nfs 192.168.1.102:/volume1/jellyfin /mnt/nas/jellyfin \
  -o rw,nfsvers=3,proto=tcp,_netdev,noatime,hard,timeo=600,retrans=2

echo "NAS shares mounted successfully."