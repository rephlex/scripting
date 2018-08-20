# deploy anything from a local repository
# Florian 'rephlex' Panzer
# https://rephlex.de || rephlex@rephlex.de
# 
#!/bin/bash
USERNAME="blargh"
HOSTNAME="blargh"
DESTPATH="/var/www/blargh"

echo "deploying at $(date)"
OLDDIR="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "$DIR"
rsync -avPS --stats --partial --progress --delete ./ $USERNAME@$HOSTNAME:$DESTPATH --exclude='deploy.sh' --exclude='.git/'
cd "$OLDDIR"
