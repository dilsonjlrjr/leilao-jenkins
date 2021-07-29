FROM maven:3.8.1-openjdk-8-slim

WORKDIR /app
COPY . /app

RUN mvn -B -DskipTests clean package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=0 /app/target/application.jar .

EXPOSE 8080

CMD [ "java", "-jar", "/app/application.jar" ]