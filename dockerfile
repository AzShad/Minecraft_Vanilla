FROM openjdk:8-jre-alpine

ARG VERSION=latest
ARG RAM=2G
ARG PORT=25565

ENV JAVA_XMS=${RAM}
ENV JAVA_XMX=${RAM}

EXPOSE ${PORT}

VOLUME /data

WORKDIR /data

RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar \
    && echo "eula=true" > eula.txt

CMD ["java", "-jar", "minecraft_server.${VERSION}.jar", "--port", "${PORT}", "--world-dir", "/data"]