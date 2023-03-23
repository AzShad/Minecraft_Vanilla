FROM openjdk:8-jre-alpine

ARG VERSION=1.17.1
ARG RAM=4G
ARG PORT=25565

ENV VERSION=${VERSION} \
    RAM=${RAM} \
    PORT=${PORT}

WORKDIR /minecraft

RUN wget https://launcher.mojang.com/v1/objects/${VERSION}/server.jar -O minecraft_server.jar \
    && echo "eula=true" > eula.txt

EXPOSE ${PORT}

CMD java -Xmx${RAM} -jar minecraft_server.jar nogui

VOLUME [ "/minecraft" ]