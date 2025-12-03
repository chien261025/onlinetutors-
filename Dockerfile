FROM eclipse-temurin:21-jdk

ARG FILE_JAR=target/onlinetutors-0.0.1-SNAPSHOT.jar

COPY  ${FILE_JAR} onlinetutors.jar
COPY uploads /app/uploads
LABEL authors="Minh Chien"

ENTRYPOINT ["java", "-jar", "onlinetutors.jar"]

EXPOSE 8080