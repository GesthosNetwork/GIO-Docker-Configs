#!/bin/bash

if [ -f .bootstrap.lock ]; then
  echo 'Error: Installation already finished, dont start this container' >&2
  exit 1
fi

sed -i $'s/\r$//' ".env"
source .env

for server in dbgate dispatch gameserver gateserver muipserver multiserver nodeserver oaserver pathfindingserver; do
  sed "s/%OUTER_IP%/$OUTER_IP/g" server/$server/conf/$server.xml.tmpl > server/$server/conf/$server.xml
  sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" server/$server/conf/$server.xml
done

sed -i "s/%MUIP_SIGN_KEY%/$MUIP_SIGN_KEY/g" server/muipserver/conf/muipserver.xml
