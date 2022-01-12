
FROM alpine:3.7

# Install dependencies
RUN apk update
RUN apk add python2 py2-pip build-base glib glib-dev linux-headers

# Install cron job
COPY crontabs/root /etc/crontabs/root

# Give execution rights on the cron job
RUN chmod 0644 /etc/crontabs/root

# Copy radoneye script
RUN mkdir /radoneye-mqtt-bridge
COPY src/* /radoneye-mqtt-bridge/
COPY script/* /radoneye-mqtt-bridge/

# Give execution rights on the launcher script
RUN chmod 0644 /radoneye-mqtt-bridge/radoneye-mqtt-bridge.sh

# Copy entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

# Install python dependencies
RUN pip2 install --upgrade pip
RUN pip2 install bluepy 
RUN pip2 install paho-mqtt

# Cleanup
RUN apk del build-base glib-dev

# Go!
ENTRYPOINT ["/docker-entrypoint.sh"]
