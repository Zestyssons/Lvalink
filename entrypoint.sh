#!/bin/bash

# Default port to 2333 if not provided
if [ -z "$PORT" ]; then
  export PORT=2333
fi

echo "Configuring Nginx with PORT=${PORT}..."

# Replace ${PORT} placeholder in Nginx config with the actual $PORT env var
sed "s/\${PORT}/${PORT}/g" /opt/Lavalink/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starting Nginx in background..."
service nginx start

echo "Launching Lavalink Server..."
# Execute Lavalink jar in foreground to keep container running
exec java -Dlavalink.resamplingQuality=low -Xmx512M -jar /opt/Lavalink/Lavalink.jar
