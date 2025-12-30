package com.stocktrader.config;

import java.net.URI;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Centralized database configuration class.
 * Provides a single point of access for database connections.
 * Uses environment variables or defaults for database credentials.
 * Supports both individual DB_URL/DB_USER/DB_PASSWORD and DATABASE_URL format.
 */
public class DatabaseConfig {
    
    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = ""; // Empty password for local MySQL
    
    // Parse DATABASE_URL if provided (format: mysql://user:password@host:port/database)
    private static String[] parseDatabaseUrl() {
        String databaseUrl = System.getenv("DATABASE_URL");
        if (databaseUrl != null && !databaseUrl.isEmpty()) {
            try {
                URI uri = new URI(databaseUrl.replace("mysql://", "http://"));
                String userInfo = uri.getUserInfo();
                String host = uri.getHost();
                int port = uri.getPort() > 0 ? uri.getPort() : 3306;
                String path = uri.getPath().startsWith("/") ? uri.getPath().substring(1) : uri.getPath();
                
                String user = userInfo != null && userInfo.contains(":") ? userInfo.split(":")[0] : userInfo;
                String password = userInfo != null && userInfo.contains(":") ? userInfo.split(":")[1] : "";
                
                String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", 
                    host, port, path);
                
                return new String[]{url, user != null ? user : DEFAULT_USER, password};
            } catch (Exception e) {
                System.err.println("Warning: Could not parse DATABASE_URL, using individual env vars: " + e.getMessage());
            }
        }
        return null;
    }
    
    private static final String[] parsedDb = parseDatabaseUrl();
    private static final String URL = parsedDb != null ? parsedDb[0] : 
        (System.getProperty("db.url", System.getenv().getOrDefault("DB_URL", DEFAULT_URL)));
    private static final String USER = parsedDb != null ? parsedDb[1] : 
        (System.getProperty("db.user", System.getenv().getOrDefault("DB_USER", DEFAULT_USER)));
    private static final String PASSWORD = parsedDb != null ? parsedDb[2] : 
        (System.getProperty("db.password", System.getenv().getOrDefault("DB_PASSWORD", DEFAULT_PASSWORD)));
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found. Please ensure mysql-connector-java is in the classpath.", e);
        }
    }
    
    /**
     * Gets a database connection using the configured credentials.
     * 
     * @return A Connection object
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        return java.sql.DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    /**
     * Gets the database URL.
     * 
     * @return The database URL
     */
    public static String getUrl() {
        return URL;
    }
    
    /**
     * Gets the database user.
     * 
     * @return The database user
     */
    public static String getUser() {
        return USER;
    }
    
    /**
     * Gets the database password.
     * 
     * @return The database password (empty string for security)
     */
    public static String getPassword() {
        return PASSWORD;
    }
    
    /**
     * Tests the database connection.
     * 
     * @return true if connection is successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            return false;
        }
    }
}

