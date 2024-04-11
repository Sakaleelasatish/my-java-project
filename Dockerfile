# Use the official Maven image as a parent image
FROM maven:3.8.4-openjdk-8 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean package

# Use a lightweight JDK image as a base image
FROM openjdk:8-jre-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the builder stage to the final image
COPY --from=builder /app/target/my-java-project-1.0-SNAPSHOT.jar .

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "my-java-project-1.0-SNAPSHOT.jar"]
