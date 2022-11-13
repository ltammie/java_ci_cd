FROM eclipse-temurin:11.0.17_8-jdk-alpine
MAINTAINER ltammie
COPY sb.app/target/sb.app-1.0-SNAPSHOT.jar sb.app-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/sb.app-1.0-SNAPSHOT.jar"]