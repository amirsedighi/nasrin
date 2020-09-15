FROM openjdk:8-jdk-alpine
LABEL maintainer="sedighi@gmail.com"
VOLUME /tmp
ARG JAR_FILE=target/IO-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} micro-io.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/micro-io.jar"]
EXPOSE 8080
