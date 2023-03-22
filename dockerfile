FROM openjdk:8-jre-alpine

ENV SERVER_VERSION=1.17.1
ENV MEMORY=2G
ENV SERVER_PORT=25565

WORKDIR /minecraft

RUN apk add --no-cache curl && \
    curl -O https://cdn.getbukkit.org/spigot/spigot-$SERVER_VERSION.jar && \
    echo "eula=true" > eula.txt

VOLUME /minecraft/world

CMD java -Xmx$MEMORY -jar spigot-$SERVER_VERSION.jar --port $SERVER_PORT nogui

EXPOSE $SERVER_PORT
