FROM openjdk:24-jdk-slim

# Copy gradle wrapper and build files
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts .
COPY settings.gradle.kts .
COPY src src

# Build
RUN chmod +x ./gradlew
RUN ./gradlew buildFatJar --no-daemon

# Expose the port Ktor runs on (default 8080)
EXPOSE 8080

# Run
CMD ["java", "-jar", "build/libs/cloud-notes-ktor-server.jar"]