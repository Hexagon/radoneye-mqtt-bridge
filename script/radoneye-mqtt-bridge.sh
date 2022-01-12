#!/bin/sh

python2 /radoneye-mqtt-bridge/radon_reader.py -b -a $RMB_SERIAL -m -ms $RMB_MQTT_HOST -mp $RMB_MQTT_PORT -ma -mu $RMB_MQTT_USER -mw $RMB_MQTT_PASSWORD >> /tmp/radoneye.log 2>&1
