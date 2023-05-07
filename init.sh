#!/bin/sh

export PORT=${PORT:-80}
export UUID=${UUID:-1eb6e917-774b-4a84-aff6-b058577c60a5}
export URI=${URI:-/$UUID/vless}

out='{ "type": "direct" }'
if [ -n "${WARP_KEY}" ]; then
  out='{
      "type": "wireguard",
      "server": "engage.cloudflareclient.com",
      "server_port": 2408,
      "local_address": [
        "172.16.0.2/32",
        "2606:4700:110:8fca:9ffe:5a2b:7703:326c/128"
      ],
      "private_key": "'${WARP_KEY}'",
      "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo="
    }'
fi

echo '{
  "inbounds": [
    {
      "type": "vless",
      "listen": "::",
      "listen_port": '${PORT}',
      "users": [{
          "uuid": "'${UUID}'"
      }],
      "transport": {
        "type": "ws",
        "path": "'${URI}'"
      }
    }
  ],
  "outbounds": [
    '$out'
  ]
}' > config.json

./sb run