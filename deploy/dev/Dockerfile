FROM eclipse-temurin:17-alpine

CMD ./gradlew build

ARG JAR_FILE_PATH=build/libs/*.jar
COPY ${JAR_FILE_PATH} app.jar
ENV JAVA_OPS="-Dspring.profiles.active=dev"
CMD java -jar app.jar $JAVA_OPS