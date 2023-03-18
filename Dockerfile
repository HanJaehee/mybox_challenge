FROM eclipse-temurin:17 AS builder

COPY . .
RUN chmod +x gradlew
RUN ./gradlew bootJar --info --stacktrace


FROM eclipse-temurin:17-jre-alpine
COPY --from=builder build/libs/*.jar app.jar
ENV JAVA_OPS="-Dspring.profiles.active=dev"

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar", "$JAVA_OPS"]