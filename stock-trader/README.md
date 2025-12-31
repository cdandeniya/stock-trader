# NovaTrade

A modern, full-stack stock trading platform built with Java, featuring comprehensive role-based access control, real-time trading capabilities, and intuitive user management. NovaTrade provides a complete solution for managing stock trading operations, customer relationships, and business analytics.

## 🌟 Overview

NovaTrade is a professional-grade web application that simulates a real-world stock trading system. It enables three distinct user roles—customers, customer representatives, and managers—each with tailored functionality to support their specific needs. Built using Java Servlets, JSP, and MySQL, NovaTrade demonstrates enterprise-level architecture patterns including MVC design, DAO data access, and secure session management.

## ✨ Key Features

### 🎭 Role-Based Access Control
- **Customers**: Execute trades, manage portfolios, track stock prices, and view transaction history
- **Customer Representatives**: Process customer orders, manage customer accounts, and assist with trading operations
- **Managers**: Oversee employees, generate sales reports, manage stock prices, and analyze business performance

### 📈 Trading Capabilities
- **Multiple Order Types**: Market orders, trailing stop orders, and hidden stop orders
- **Real-Time Stock Management**: Live price updates and stock information
- **Portfolio Tracking**: Comprehensive view of holdings, performance, and transaction history
- **Order Processing**: Efficient order execution and status tracking

### 🏢 Business Management
- **Employee Management**: Add, edit, and manage employee records with role assignments
- **Customer Management**: Complete customer lifecycle management with account tracking
- **Sales Analytics**: Detailed reporting and revenue analysis for business insights
- **Stock Administration**: Manage stock listings, prices, and trading status

### 🎨 User Experience
- **Modern UI**: Clean, responsive interface built with Bootstrap and custom CSS
- **Intuitive Navigation**: Role-specific dashboards and streamlined workflows
- **Real-Time Updates**: Dynamic content updates without page refreshes
- **Mobile-Friendly**: Responsive design that works across devices

## 🏗️ Architecture

NovaTrade follows a well-structured MVC (Model-View-Controller) architecture:

```
NovaTrade/
├── src/main/java/com/stocktrader/
│   ├── controller/     # HTTP request handlers (Servlets)
│   ├── service/        # Business logic layer
│   ├── repository/     # Data access layer (DAOs)
│   ├── model/          # Domain objects and entities
│   ├── config/         # Configuration (Database, etc.)
│   └── util/           # Utility classes
├── src/main/webapp/
│   ├── WEB-INF/views/  # JSP views organized by role
│   ├── static/         # CSS, JavaScript, assets
│   └── *.jsp           # Public pages
└── src/main/resources/sql/  # Database scripts
```

### Technology Stack
- **Backend**: Java 8, Java Servlets, JSP
- **Database**: MySQL 5.7+
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 4, jQuery
- **Build Tool**: Maven 3.6+
- **Application Server**: Apache Tomcat 8.5+
- **Deployment**: Docker, Railway.app

## 🚀 Quick Start

### Prerequisites
- Java 8 or higher
- Maven 3.6+
- MySQL 5.7+ or MySQL 8.0+
- Apache Tomcat 8.5+ (or use Maven Tomcat plugin)

### Local Development Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/cdandeniya/stock-trader.git
   cd stock-trader/stock-trader
   ```

2. **Set Up Database**
   ```bash
   mysql -u root -p < src/main/resources/sql/BETTERSCRIPT.sql
   mysql -u root -p < src/main/resources/sql/basevalues.sql
   ```

3. **Configure Database Connection**
   
   Update `src/main/java/com/stocktrader/config/DatabaseConfig.java` with your database credentials:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/cse305";
   private static final String USER = "your_username";
   private static final String PASSWORD = "your_password";
   ```

4. **Build the Project**
   ```bash
   mvn clean install
   ```

5. **Deploy to Tomcat**
   ```bash
   mvn tomcat7:deploy
   ```
   
   Or manually copy the WAR file from `target/stock-trader.war` to your Tomcat `webapps/` directory.

6. **Access the Application**
   ```
   http://localhost:8080/stock-trader/
   ```

## 🔑 Demo Credentials

### Test Account (Works with any role)
- **Email**: `test@test.com`
- **Password**: `admin`

### Manager Account
- **Email**: `dwarren@cs.sunysb.edu`
- **Password**: `admin789`
- **Capabilities**: Employee management, sales reports, stock price management

### Customer Representative Account
- **Email**: `dsmith@cs.sunysb.edu`
- **Password**: `rep456`
- **Capabilities**: Customer management, order processing

### Customer Account
- **Email**: `lewis.p@cs.sunysb.edu`
- **Password**: `password123`
- **Capabilities**: Stock trading, portfolio management

## 📊 Database Schema

### Core Entities
- **Customers**: Customer profiles, ratings, and account information
- **Employee**: Staff records with roles, compensation, and employment details
- **Stock**: Stock symbols, prices, and trading status
- **Account**: Customer account mappings and relationships
- **StockOrder**: Trading orders, transactions, and execution details
- **Location**: Geographic data for customers and employees

## 🔒 Security Features

- **Session-Based Authentication**: Secure user sessions with timeout protection
- **Role-Based Access Control**: Strict permission enforcement at the controller level
- **Input Validation**: Server-side validation for all user inputs
- **SQL Injection Prevention**: Parameterized queries and prepared statements
- **Password Security**: Secure password handling (with hashing support)

## 🚀 Deployment

### Railway.app Deployment (Recommended)

NovaTrade includes Docker configuration for easy deployment on Railway.app:

1. **Connect Repository**: Link your GitHub repository to Railway
2. **Add MySQL Service**: Create a MySQL database service
3. **Set Environment Variables**: Configure database connection variables
4. **Deploy**: Railway automatically builds and deploys using the included Dockerfile

See `DEPLOYMENT.md` for detailed deployment instructions.

### Production Checklist
- [ ] Update database credentials in `DatabaseConfig.java`
- [ ] Configure environment variables for production database
- [ ] Set up proper logging and monitoring
- [ ] Enable HTTPS/SSL certificates
- [ ] Configure database backups
- [ ] Review and update security settings

## 🛠️ Development

### Adding New Features

1. **Model**: Create domain objects in `model/`
2. **Repository**: Implement data access methods in `repository/`
3. **Service**: Add business logic in `service/`
4. **Controller**: Create servlet controllers in `controller/`
5. **View**: Add JSP pages in appropriate `views/` directory
6. **Configuration**: Update `web.xml` with servlet mappings

### Code Style Guidelines
- Follow Java naming conventions (camelCase for variables, PascalCase for classes)
- Use meaningful variable and method names
- Add JavaDoc comments for public methods
- Handle exceptions appropriately with try-catch blocks
- Keep methods focused and single-purpose

## 📝 Project Structure

- **Controllers**: Handle HTTP requests, validate input, coordinate with services
- **Services**: Contain business logic, validation rules, and orchestrate operations
- **Repositories**: Data access layer using DAO pattern, handle all database operations
- **Models**: Domain objects representing business entities (Customer, Employee, Stock, etc.)
- **Views**: JSP pages organized by user role for presentation layer
- **Config**: Centralized configuration including database connection management

## 🎯 Use Cases

- **Educational**: Learn full-stack Java web development with MVC architecture
- **Portfolio**: Showcase enterprise-level application development skills
- **Demo**: Demonstrate role-based systems and complex business logic
- **Foundation**: Base for building more advanced trading platforms

## 📄 License

This project was developed for educational purposes as part of CSE305 coursework. Feel free to use it as a learning resource or starting point for your own projects.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to fork the repository and submit pull requests.

## 📧 Contact

For questions or feedback, please open an issue on GitHub or contact the repository maintainer.

---

**Built with ❤️ using Java, Servlets, JSP, MySQL, and Bootstrap**
