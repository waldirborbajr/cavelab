#!/bin/bash

# Start bluetoothctl
bluetoothctl <<EOF
power on
# Scan if not found
# Show devices
devices
# Pair with the device (if already paired no need)
pair 64:68:76:43:2F:FE
# Connect with it
connect 64:68:76:43:2F:FE
# Exit
exit
EOF
