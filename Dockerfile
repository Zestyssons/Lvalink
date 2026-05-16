FROM eclipse-temurin:17-jre-focal

# Create a non-root user
RUN groupadd -g 1000 lavalink && \
    useradd -r -u 1000 -g lavalink lavalink

WORKDIR /opt/Lavalink

# Download the latest Lavalink.jar
# We use a specific version for stability, or download latest.
# As of now, v4.0.8 is a stable release.
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar Lavalink.jar

COPY application.yml application.yml

RUN chown -R lavalink:lavalink /opt/Lavalink

USER lavalink

EXPOSE 2333

CMD ["java", "-Dlavalink.resamplingQuality=low", "-Xmx512M", "-jar", "Lavalink.jar"]
