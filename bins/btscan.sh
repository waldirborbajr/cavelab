#!/bin/bash

# Start bluetoothctl
bluetoothctl <<EOF
# Turn on Bluetooth if not already on
power on
# Start scanning for devices
scan on
# Wait for the device to be discovered
sleep 10
# Stop scanning
scan off
# To show devices names
# devices
# Pair with the device
# pair <device_mac_address>
# Connect to the device
# connect <device_mac_address>
# Exit bluetoothctl
exit
EOF
