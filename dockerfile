FROM openjdk:8-jdk-alpine

ARG VERSION=latest
ARG RAM=4G
ARG PORT=25565

ENV SERVER_VERSION=${VERSION} \
    SERVER_RAM=${RAM} \
    SERVER_PORT=${PORT}

WORKDIR /minecraft-server

RUN apk add --no-cache wget && \
    wget -q https://launcher.mojang.com/v1/objects/$(wget -q -O- https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.versions[] | select(.id == env.SERVER_VERSION) | .url') -O version.json && \
    wget -q $(cat version.json | jq -r '.downloads.server.url') -O server.jar && \
    apk del wget && \
    rm version.json

COPY eula.txt .
COPY server.properties .

VOLUME /minecraft-server

EXPOSE ${SERVER_PORT}

CMD java -Xms${SERVER_RAM} -Xmx${SERVER_RAM} -jar server.jar nogui
