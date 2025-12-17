from gradle:7.6-jdk17-alpine as build
WORKDIR /app
COPY . .
run gradle build --no-daemon

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/notificacao.jar
EXPOSE 8083
CMD ["java", "-jar", "/app/notificacao.jar"]