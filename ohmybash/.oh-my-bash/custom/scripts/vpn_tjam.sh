#!/bin/bash

# TJAM VPN Connection Script
# This script provides functions to connect and manage the TJAM GlobalProtect VPN

# Function to connect to TJAM VPN
vpn-tjam() {
    echo "Connecting to TJAM VPN..."
    # Remove old log file if exists
    rm -f /tmp/vpn-tjam.log
    # Run openconnect in background with nohup
    nohup bash -c "echo -e '2002\ngustavo.augusto\nG@po2002' | sudo -S openconnect --protocol=gp 179.127.124.2 --user=gustavo.augusto --passwd-on-stdin --servercert pin-sha256:HV2QIYiNqFTtT6QRFUpT2wgOoqTXnXSenF7bw35oE9Q=" > /tmp/vpn-tjam.log 2>&1 &
    sleep 3
    echo "VPN connection started in background."
    echo "Check connection with: vpn-tjam-status"
    echo "View logs with: tail -f /tmp/vpn-tjam.log"
    echo "To disconnect, run: vpn-tjam-disconnect"
}

# Function to disconnect from TJAM VPN
vpn-tjam-disconnect() {
    echo "Disconnecting from TJAM VPN..."
    echo "2002" | sudo -S killall openconnect
    echo "VPN disconnected."
}

# Function to check VPN status
vpn-tjam-status() {
    if pgrep -x "openconnect" > /dev/null; then
        echo "VPN is connected."
        echo "Connection details:"
        ip addr show tun0 2>/dev/null || echo "Tunnel interface not found yet."
    else
        echo "VPN is not connected."
    fi
}
