FROM openjdk:8-jdk-alpine
LABEL maintainer="sedighi@gmail.com"
VOLUME /tmp
ARG JAR_FILE=target/hello-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} hello.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/hello.jar"]
EXPOSE 8080
