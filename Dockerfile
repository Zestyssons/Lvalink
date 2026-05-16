FROM eclipse-temurin:17-jre-focal

# Install wget to download Lavalink
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/Lavalink

# Download the latest Lavalink.jar during build
RUN wget https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar

COPY application.yml application.yml

# Create a non-root user for security
RUN groupadd -g 1000 lavalink && \
    useradd -r -u 1000 -g lavalink lavalink && \
    chown -R lavalink:lavalink /opt/Lavalink

USER lavalink

# Use the PORT environment variable provided by Render
EXPOSE 2333

CMD ["java", "-Dlavalink.resamplingQuality=low", "-Xmx512M", "-jar", "Lavalink.jar"]
