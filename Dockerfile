FROM maven:3.8-openjdk-8 AS build

# Set working directory to stock-trader subdirectory
WORKDIR /app/stock-trader

# Copy pom.xml and download dependencies
COPY stock-trader/pom.xml ./pom.xml
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY stock-trader/src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM tomcat:8.5-jre8

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from build stage
COPY --from=build /app/stock-trader/target/stock-trader.war /usr/local/tomcat/webapps/ROOT.war

# Expose port (Railway uses PORT env var)
EXPOSE 8080

# Set environment variable for port (Railway requirement)
ENV PORT=8080

# Start Tomcat
CMD ["catalina.sh", "run"]

