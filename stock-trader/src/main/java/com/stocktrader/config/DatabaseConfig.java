package com.stocktrader.config;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Centralized database configuration class.
 * Provides a single point of access for database connections.
 * Uses environment variables or defaults for database credentials.
 */
public class DatabaseConfig {
    
    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = ""; // Empty password for local MySQL
    
    private static final String URL = System.getProperty("db.url", 
        System.getenv().getOrDefault("DB_URL", DEFAULT_URL));
    private static final String USER = System.getProperty("db.user", 
        System.getenv().getOrDefault("DB_USER", DEFAULT_USER));
    private static final String PASSWORD = System.getProperty("db.password", 
        System.getenv().getOrDefault("DB_PASSWORD", DEFAULT_PASSWORD));
    
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

