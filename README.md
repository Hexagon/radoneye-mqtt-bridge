# radoneye-mqtt-bridge

This project provides a docker image which allows users collect current radon data from FTLab Radon Eye RD200 (Bluetooth only version), and forward it to a MQTT broker.

If you don't want to use Docker, see [https://github.com/ceandre/radonreader](https://github.com/ceandre/radonreader) (which this project is based on) for instructions of how to run this manually using Python.

## Hardware Requeriments
- FTLabs RadonEye RD200 
- Bluetooth LE (Low Energy) support on Docker host

## Installation

### Installing from Docker Hub

Install from Docker hub using the following command, make sure to change RMB_SERIAL and RMB_MQTT_HOST/PORT/USER/PASSWORD to your own settings.

Please note that RMB_MQTT_USER and RMB_MQTT_PASSWORD is mandatory, pass anything if you do not have authentication enabled on your MQTT server.

```
docker run \
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
        hexagon/radoneye-mqtt-bridge
```

### Manual/Local installation

```docker build . --tag=local-radoneye-mqtt-bridge```

Then use the command from the installation section, but replace ```hexagon/radoneye-mqtt-bridge``` with ```local-radoneye-mqtt-bridge```.

### Upgrading from a previous version

Before building and running, stop and remove previous version

```docker stop radoneye-mqtt-bridge```

```docker rm radoneye-mqtt-bridge```

# Contributions and History

This project is using radon_reader.py from [https://github.com/ceandre/radonreader](https://github.com/ceandre/radonreader), which is licensed by GitHub user ceandre under the GPLv3 license.