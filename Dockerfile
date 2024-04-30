#use the official Maven image as the base image
FROM maven:3.6.3-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package

# Use AdoptOpenJDK as the base image for the runtime environment
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage to the runtime environment
COPY --from=build /app/target/my-java-project-1.0.0-SNAPSHOT.jar ./app.jar

# Expose the port that the application listens on
EXPOSE 8888

# Command to run the application
CMD ["java", "-jar", "app.jar"]

