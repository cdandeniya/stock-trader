# Deployment Guide for Stock Trading System

This guide covers multiple hosting options for deploying this Java web application to make it publicly accessible for your resume.

## 🚀 Recommended: Railway.app (Easiest & Free Tier)

### Prerequisites
- GitHub account (already have)
- Railway account (sign up at https://railway.app - free tier available)

### Steps:

1. **Prepare for Railway Deployment**
   - Railway can auto-detect Java projects
   - It supports WAR files and can run Tomcat

2. **Create `railway.json` configuration:**
   ```json
   {
     "build": {
       "builder": "NIXPACKS"
     },
     "deploy": {
       "startCommand": "java -jar target/stock-trader.war",
       "restartPolicyType": "ON_FAILURE",
       "restartPolicyMaxRetries": 10
     }
   }
   ```

3. **Create `Procfile` for Railway:**
   ```
   web: java -jar target/stock-trader.war
   ```

4. **Set up MySQL Database on Railway:**
   - Add MySQL service in Railway dashboard
   - Railway will provide connection string automatically

5. **Configure Environment Variables:**
   - `DATABASE_URL` (Railway provides this automatically)
   - `DB_USER` = your MySQL username
   - `DB_PASSWORD` = your MySQL password
   - `DB_NAME` = cse305

6. **Deploy:**
   - Connect Railway to your GitHub repo
   - Railway will auto-deploy on push
   - Get your public URL from Railway dashboard

---

## 🌐 Alternative: Render.com (Free Tier Available)

### Steps:

1. **Sign up at https://render.com**

2. **Create a Web Service:**
   - Connect your GitHub repository
   - Build Command: `mvn clean package`
   - Start Command: `java -jar target/stock-trader.war`

3. **Add MySQL Database:**
   - Create a PostgreSQL or MySQL database service
   - Note the connection details

4. **Set Environment Variables:**
   - `DATABASE_URL`
   - `DB_USER`
   - `DB_PASSWORD`
   - `DB_NAME`

5. **Deploy:**
   - Render will build and deploy automatically
   - Free tier includes 750 hours/month

---

## ☁️ AWS Elastic Beanstalk (Free Tier - 12 Months)

### Steps:

1. **Install AWS CLI and EB CLI:**
   ```bash
   pip install awsebcli
   ```

2. **Initialize Elastic Beanstalk:**
   ```bash
   eb init -p java-8 -r us-east-1 stock-trader-app
   ```

3. **Create application:**
   ```bash
   eb create stock-trader-env
   ```

4. **Configure RDS MySQL:**
   - Create RDS MySQL instance in AWS Console
   - Update DatabaseConfig.java to use RDS endpoint

5. **Deploy:**
   ```bash
   mvn clean package
   eb deploy
   ```

---

## 🐳 Docker Deployment (Works with any platform)

### Create `Dockerfile`:

```dockerfile
FROM tomcat:8.5-jre8

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file
COPY target/stock-trader.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
```

### Create `docker-compose.yml`:

```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "8080:8080"
    environment:
      - DB_HOST=db
      - DB_USER=root
      - DB_PASSWORD=password
      - DB_NAME=cse305
    depends_on:
      - db
  
  db:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=cse305
    volumes:
      - ./src/main/resources/sql:/docker-entrypoint-initdb.d
```

---

## 📝 Pre-Deployment Checklist

### 1. Update Database Configuration
- Use environment variables instead of hardcoded values
- Update `DatabaseConfig.java` to read from environment

### 2. Security Updates
- Remove bypass login credentials
- Use proper password hashing
- Update default credentials

### 3. Build WAR File
```bash
mvn clean package
```
- WAR file will be in `target/stock-trader.war`

### 4. Database Migration
- Ensure SQL scripts are ready
- Test database setup locally first

---

## 🔧 Quick Setup Script

Create `setup.sh`:
```bash
#!/bin/bash
# Build the project
mvn clean package

# Check if WAR file exists
if [ -f "target/stock-trader.war" ]; then
    echo "✓ Build successful!"
    echo "WAR file: target/stock-trader.war"
else
    echo "✗ Build failed!"
    exit 1
fi
```

---

## 🌍 Recommended Free Hosting Comparison

| Platform | Free Tier | Ease of Use | Best For |
|----------|-----------|-------------|----------|
| **Railway** | ✅ Yes | ⭐⭐⭐⭐⭐ | Quick deployment |
| **Render** | ✅ Yes (750 hrs/month) | ⭐⭐⭐⭐ | Simple apps |
| **Fly.io** | ✅ Yes | ⭐⭐⭐⭐ | Global distribution |
| **AWS EB** | ✅ 12 months | ⭐⭐⭐ | Learning AWS |
| **Heroku** | ❌ Paid only | ⭐⭐⭐⭐ | Legacy projects |

---

## 📌 For Your Resume

### What to Include:
- **Live Demo URL**: `https://your-app.railway.app` or similar
- **GitHub Repository**: `https://github.com/cdandeniya/stock-trader`
- **Tech Stack**: Java, Maven, MySQL, Tomcat, JSP, Bootstrap
- **Features**: Role-based access, Stock trading, Real-time updates

### Example Resume Entry:
```
Stock Trading System | Java Web Application
• Developed full-stack trading platform with role-based access control
• Implemented MVC architecture using Java Servlets, JSP, and MySQL
• Deployed on Railway with MySQL database
• Live Demo: [your-url]
• GitHub: github.com/cdandeniya/stock-trader
```

---

## 🆘 Troubleshooting

### Common Issues:

1. **Database Connection Failed**
   - Check environment variables
   - Verify database is accessible from hosting platform
   - Check firewall rules

2. **Port Issues**
   - Most platforms use PORT environment variable
   - Update Tomcat configuration if needed

3. **Build Failures**
   - Check Maven dependencies
   - Verify Java version compatibility

---

## 📚 Additional Resources

- [Railway Documentation](https://docs.railway.app)
- [Render Documentation](https://render.com/docs)
- [AWS Elastic Beanstalk Guide](https://docs.aws.amazon.com/elasticbeanstalk/)

---

**Need help?** Check the platform-specific documentation or create an issue in your GitHub repo.

