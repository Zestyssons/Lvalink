#!/bin/bash

# Default port to 2333 if not provided
if [ -z "$PORT" ]; then
  export PORT=2333
fi

# Load environment variables from Render Secret File if exists
if [ -f "/etc/secrets/.env" ]; then
  echo "Loading environment variables from /etc/secrets/.env"
  export $(grep -v '^#' /etc/secrets/.env | xargs)
fi

# Load individual secret files from /etc/secrets/ as environment variables
if [ -d "/etc/secrets" ]; then
  echo "Loading individual secrets from /etc/secrets/..."
  for file in /etc/secrets/*; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      if [ "$filename" != ".env" ]; then
        # Read content, strip newlines/carriage returns, and export
        val=$(cat "$file" | tr -d '\r\n')
        export "$filename"="$val"
        echo "Exported environment variable from secret file: $filename"
      fi
    fi
  done
fi
# Load from local .env if exists (fallback)
if [ -f "/opt/Lavalink/.env" ]; then
  echo "Loading environment variables from local .env"
  export $(grep -v '^#' /opt/Lavalink/.env | xargs)
fi

echo "Configuring Nginx with PORT=${PORT}..."

# Replace ${PORT} placeholder in Nginx config with the actual $PORT env var
sed "s/\${PORT}/${PORT}/g" /opt/Lavalink/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starting Nginx in background..."
service nginx start

echo "Launching Lavalink Server..."
# Execute Lavalink jar in foreground to keep container running
exec java -Dlavalink.resamplingQuality=low -Xmx512M -jar /opt/Lavalink/Lavalink.jar
