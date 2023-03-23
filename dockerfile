FROM openjdk:8-jre-alpine

ARG MINECRAFT_VERSION=1.17.1
ARG MEMORY_SIZE=4G
ARG SERVER_PORT=25565

ENV MINECRAFT_VERSION=${MINECRAFT_VERSION}
ENV MEMORY_SIZE=${MEMORY_SIZE}
ENV SERVER_PORT=${SERVER_PORT}

WORKDIR /minecraft-server

RUN apk add --no-cache wget && \
    wget -q https://launcher.mojang.com/v1/objects/${MINECRAFT_VERSION}/server.jar && \
    echo "eula=true" > eula.txt

EXPOSE ${SERVER_PORT}

CMD java -Xmx${MEMORY_SIZE} -Xms${MEMORY_SIZE} -jar server.jar --port ${SERVER_PORT}

VOLUME ["/minecraft-server"]