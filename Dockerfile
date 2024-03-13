# Use the official Maven image as the base image for building the Maven project
FROM maven:3.8.4-openjdk-17 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file to the container
#COPY pom.xml .

# Download Maven dependencies specified in pom.xml
#RUN mvn dependency:go-offline -B

# Copy the entire project to the container
COPY . .

# Build the Maven project
RUN mvn package

# Use the official Tomcat image as the base image for deployment
FROM tomcat:9.0.56-jdk17-openjdk-slim

# Set the working directory in the container
WORKDIR /usr/local/tomcat/webapps

# Copy the built WAR file from the Maven builder stage to the Tomcat webapps directory
COPY --from=builder /app/webapp/target/*.war .

# Expose the default Tomcat port
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
