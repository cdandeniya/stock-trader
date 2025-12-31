# NovaTrade

A comprehensive Java web application for managing stock trading operations with role-based access control.

## 🎯 Features

### Role-Based Access Control
- **Managers**: Employee management, sales reports, stock price management
- **Customer Representatives**: Customer management, order processing
- **Customers**: Stock trading, portfolio management

### Core Functionality
- Stock order management (Market, Trailing Stop, Hidden Stop)
- Real-time stock price updates
- Customer and employee management
- Sales reporting and analytics
- Portfolio tracking

## 🚀 Quick Start

### Prerequisites
- Java 8+
- Maven 3.6+
- MySQL 5.7+
- Tomcat 8.5+

### Setup
1. **Database Setup**
   ```bash
   mysql -u root -p < src/main/resources/sql/BETTERSCRIPT.sql
   mysql -u root -p < src/main/resources/sql/basevalues.sql
   ```

2. **Build Project**
   ```bash
   mvn clean install
   ```

3. **Deploy to Tomcat**
   ```bash
   mvn tomcat7:deploy
   ```

4. **Access Application**
   ```
   http://localhost:8080/stock-trader/
   ```

## 🔧 Configuration

### Database Configuration
Update `src/main/java/com/stocktrader/config/DatabaseConfig.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/cse305";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
```

### Default Login Credentials
- **Manager**: `dwarren@cs.sunysb.edu` / `admin789`
- **Customer Rep**: `dsmith@cs.sunysb.edu` / `rep456`
- **Customer**: `lewis.p@cs.sunysb.edu` / `password123`

## 📁 Key Components

### Controllers (`controller/`)
Handle HTTP requests and responses, route to appropriate services.

### Services (`service/`)
Contain business logic, validation, and orchestrate data operations.

### Repository (`repository/`)
Data access layer, handle database operations through DAOs.

### Models (`model/`)
Domain objects representing business entities.

### DTOs (`dto/`)
Data Transfer Objects for API communication.

### Utilities (`util/`)
Helper classes for common operations.

## 🛠️ Development

### Adding New Features
1. Create model in `model/`
2. Add repository methods in `repository/`
3. Implement business logic in `service/`
4. Create controller in `controller/`
5. Add JSP views in appropriate `views/` directory

### Code Style
- Follow Java naming conventions
- Use meaningful variable and method names
- Add comments for complex logic
- Handle exceptions appropriately

## 📊 Database Schema

### Core Tables
- `Customers`: Customer information and ratings
- `Employee`: Employee data with roles
- `Stock`: Stock information and prices
- `Account`: Customer account mappings
- `StockOrder`: Trading orders and transactions

## 🔒 Security

- Session-based authentication
- Role-based access control
- Input validation and sanitization
- SQL injection prevention

## 🚀 Deployment

### Production Checklist
- [ ] Update database credentials
- [ ] Configure logging
- [ ] Set up monitoring
- [ ] Enable HTTPS
- [ ] Configure backup strategy

## 📝 License

This project is for educational purposes as part of CSE305 coursework.

