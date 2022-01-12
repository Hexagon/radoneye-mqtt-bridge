# radoneye-mqtt-bridge

This project provides a docker image which allows users collect current radon data from FTLab Radon Eye RD200 (Bluetooth only version).

## Hardware Requeriments
- FTLabs RadonEye RD200 
- Bluetooth LE (Low Energy) support on Docker host

## Installation

### Upgrading from a previous version

Before building and running, stop and remove previous version

```docker stop radoneye-monitor```

```docker rm radoneye-monitor```

## Build and run

Run the following commands to build and run.

ote that ```RMB_MQTT_USER``` and ```RMB_MQTT_PASSWORD``` are mandatory.

```docker build . --tag=hexagon/radoneye-mqtt-bridge```

```sudo docker run \
        -d \
        --net=host \
        --restart=always \
        --privileged \
        -e RMB_SERIAL=aa:bb:cc:dd:ee:ff \
        -e RMB_MQTT_HOST=192.168.1.2 \
        -e RMB_MQTT_PORT=1883 \
        -e RMB_MQTT_USER=username \
        -e RMB_MQTT_PASSWORD=password \
        --name="radoneye-mqtt-bridge" \
        hexagon/radoneye-mqtt-bridge```

# Debugging

sudo docker run \
        --net=host \
        --privileged \
        -e RMB_SERIAL=aa:bb:cc:dd:ee:ff \
        -e RMB_MQTT_HOST=192.168.1.2 \
        -e RMB_MQTT_PORT=1883 \
        -e RMB_MQTT_USER=username\
        -e RMB_MQTT_PASSWORD=password \
        --name="test" \
        --it \
        --entrypoint /bin/sh \
        hexagon/radoneye-mqtt-bridge

# Contributions and History

This project is using radon_reader.py from [https://github.com/ceandre/radonreader](https://github.com/ceandre/radonreader), which is licensed by GitHub user ceandre under the GPLv3 license.
