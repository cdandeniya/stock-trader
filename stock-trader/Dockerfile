FROM maven:3.8-openjdk-8 AS build

# Copy pom.xml and download dependencies
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM tomcat:8.5-jre8

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from build stage
COPY --from=build /app/target/stock-trader.war /usr/local/tomcat/webapps/ROOT.war

# Expose port (most platforms use PORT env var)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

