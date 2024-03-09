FROM maven:3.8.6-eclipse-temurin-11-alpine AS maven
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN mvn package -DskipTests
WORKDIR /workspace/app/target
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
