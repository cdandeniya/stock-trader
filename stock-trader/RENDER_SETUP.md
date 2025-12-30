# Deploy to Render.com - Step by Step Guide

Render.com is probably the easiest alternative to Railway. Here's how to set it up:

## Step 1: Sign Up
1. Go to https://render.com
2. Sign up with GitHub (free tier available)
3. You get 750 free hours/month

## Step 2: Create Web Service
1. Click **"New +"** button (top right)
2. Select **"Web Service"**
3. Connect your GitHub repository: `cdandeniya/stock-trader`
4. Render will detect it's a Java project

## Step 3: Configure Build Settings

In the web service configuration:

**Name**: `stock-trader` (or whatever you want)

**Environment**: Select **"Java"**

**Build Command**:
```bash
cd stock-trader && mvn clean package -DskipTests
```

**Start Command**:
```bash
cd stock-trader && java -jar target/stock-trader.war
```

**OR** if you want to use Tomcat:
```bash
cd stock-trader && java -jar target/stock-trader.war --server.port=$PORT
```

**Instance Type**: Free (or Starter for $7/month)

## Step 4: Add PostgreSQL Database (Render's default)

1. Click **"New +"** → **"PostgreSQL"**
2. Name it: `stock-trader-db`
3. Plan: Free (or Starter)
4. Render creates it automatically

**Note**: Render uses PostgreSQL by default, but you can also use MySQL if available. If you use PostgreSQL, you'll need to update your connection string.

## Step 5: Set Environment Variables

In your web service → **Environment** section:

**Option A: If Render auto-links database:**
- Render will add `DATABASE_URL` automatically
- You might need to add:
  ```
  DB_URL=[from DATABASE_URL, convert to JDBC format]
  DB_USER=[from DATABASE_URL]
  DB_PASSWORD=[from DATABASE_URL]
  ```

**Option B: Manual variables:**
Add these variables:
```
DB_URL=jdbc:postgresql://[host]:[port]/[database]?sslmode=require
DB_USER=[username]
DB_PASSWORD=[password]
DB_NAME=[database_name]
```

**For PostgreSQL**, you'll need to update your `DatabaseConfig.java` to support PostgreSQL, OR use MySQL if Render offers it.

## Step 6: Initialize Database

1. Go to your PostgreSQL service
2. Click **"Connect"** or **"Info"** tab
3. Copy connection string
4. Use Render's built-in SQL editor or connect via psql
5. Run your SQL scripts (you might need to convert from MySQL to PostgreSQL)

## Step 7: Deploy

1. Click **"Create Web Service"**
2. Render will build and deploy automatically
3. Wait 5-10 minutes for first build
4. Get your URL: `https://stock-trader.onrender.com`

## Alternative: Use MySQL on Render

If Render offers MySQL:
1. Create MySQL database instead of PostgreSQL
2. Use MySQL connection string:
   ```
   DB_URL=jdbc:mysql://[host]:[port]/[database]?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
   ```
3. Run your existing SQL scripts (no conversion needed!)

## Troubleshooting

**Build fails?**
- Check that build command includes `cd stock-trader`
- Verify Maven can find pom.xml
- Check Render logs for specific errors

**Database connection fails?**
- Verify environment variables are set
- Check that database is running
- Make sure connection string format is correct

**App won't start?**
- Check Render logs
- Verify PORT environment variable (Render uses PORT automatically)
- Make sure WAR file was built successfully

## Cost

- **Free tier**: 750 hours/month
- **Starter**: $7/month (more reliable, no sleep)
- Your app might "sleep" on free tier after inactivity (wakes up on first request)

---

**Render is usually easier than Railway!** Give it a try.

