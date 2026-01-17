# Multi-stage build for production-ready Spring Boot application

# Stage 1: Build
FROM gradle:8.5-jdk21 AS build
WORKDIR /app

# Copy Gradle files
COPY build.gradle settings.gradle gradle.properties ./
COPY gradle/ ./gradle/

# Copy source code
COPY src/ ./src/

# Build the application
RUN gradle clean build -x test --no-daemon

# Stage 2: Runtime
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Create non-root user
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copy JAR from build stage
COPY --from=build --chown=spring:spring /app/build/libs/*.jar app.jar

# Expose port
EXPOSE 8080

# Health check (optional - remove if actuator is not available)
# HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
#   CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
