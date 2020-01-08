#!/usr/bin/env bash

echo "Using OR_PORT=${OR_PORT}, PT_PORT=${PT_PORT}, and EMAIL=${EMAIL}."

cat > /etc/tor/torrc << EOF
RunAsDaemon 0
# We don't need an open SOCKS port.
SocksPort 0
BridgeRelay 1
Log notice file /var/log/tor/log
Log notice stdout
ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy
ExtORPort auto
DataDirectory /var/lib/tor

# Ports and contactinfo pulled from config file
ORPort ${OR_PORT}
ServerTransportListenAddr obfs4 0.0.0.0:${PT_PORT}
ContactInfo ${EMAIL}
Nickname ${NICK}
EOF

echo "Starting tor."
tor -f /etc/tor/torrc
