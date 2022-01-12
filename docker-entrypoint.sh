#!/bin/sh
touch /tmp/radoneye.log
echo "Starting radoneye-mqtt-bridge"
crond -b -l 2 && tail -f /tmp/radoneye.log
