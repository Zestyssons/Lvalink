FROM eclipse-temurin:17-jre-focal

# Install wget and nginx
RUN apt-get update && apt-get install -y wget nginx && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/Lavalink

# Download the latest Lavalink.jar during build
RUN wget https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar

# Copy configuration, templates and landing page
COPY application.yml application.yml
COPY nginx.conf.template nginx.conf.template
COPY index.html index.html
COPY background.jpg background.jpg
COPY entrypoint.sh entrypoint.sh

# Give entrypoint execute permissions
RUN chmod +x entrypoint.sh

# Use entrypoint to start both nginx and java
ENTRYPOINT ["/opt/Lavalink/entrypoint.sh"]
