# Railway Deployment - Next Steps

## ✅ Step 1: Wait for Build to Complete
- Check Railway dashboard - the build should be running now
- Wait for it to complete (usually 2-5 minutes)
- If it fails, check the logs for errors

## ✅ Step 2: Add MySQL Database
1. In Railway dashboard, click **"+ New"**
2. Select **"Database"** → **"MySQL"**
3. Railway will create a MySQL instance automatically
4. **Important**: Link it to your web service (click on your web service → Settings → Variables → Link MySQL)

## ✅ Step 3: Set Environment Variables
Railway should automatically add `DATABASE_URL` when you link MySQL, but you may need to add:

1. Go to your **web service** → **Settings** → **Variables**
2. Add these if not already present:
   - `DB_URL` = (Railway provides this automatically via DATABASE_URL)
   - `DB_USER` = (from MySQL service)
   - `DB_PASSWORD` = (from MySQL service)
   - `DB_NAME` = `cse305`

**Note**: Your `DatabaseConfig.java` supports both `DATABASE_URL` (single string) and individual `DB_URL`, `DB_USER`, `DB_PASSWORD` variables.

## ✅ Step 4: Initialize Database
You need to run your SQL scripts to create tables and insert data:

### Option A: Via Railway MySQL Console (Easiest)
1. Click on your **MySQL service** in Railway
2. Go to **"Data"** tab
3. Click **"Open MySQL Console"**
4. Copy and paste the contents of:
   - `src/main/resources/sql/BETTERSCRIPT.sql`
   - `src/main/resources/sql/basevalues.sql`
5. Run them one by one

### Option B: Via Railway CLI
```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Link to your project
railway link

# Connect to MySQL
railway connect mysql

# Then run your SQL files
mysql -u root -p < src/main/resources/sql/BETTERSCRIPT.sql
mysql -u root -p < src/main/resources/sql/basevalues.sql
```

### Option C: Via Local MySQL Client
1. Get MySQL connection details from Railway dashboard
2. Connect from your local machine:
```bash
mysql -h [host] -u [user] -p [database]
```
Then run your SQL scripts.

## ✅ Step 5: Get Your Public URL
1. In Railway dashboard, go to your **web service**
2. Click **"Settings"** → **"Generate Domain"**
3. Railway will give you a URL like: `https://your-app-name.up.railway.app`
4. **Save this URL** - you'll use it for your resume!

## ✅ Step 6: Test Your Application
1. Visit your Railway URL
2. Try logging in with demo credentials:
   - **Manager**: `dwarren@cs.sunysb.edu` / `admin789`
   - **Customer Rep**: `dsmith@cs.sunysb.edu` / `rep456`
   - **Customer**: `lewis.p@cs.sunysb.edu` / `password123`

## 🎯 Troubleshooting

### Build Failed?
- Check Railway logs for specific errors
- Make sure Dockerfile is at repo root
- Verify all paths are correct

### Database Connection Failed?
- Check environment variables are set correctly
- Verify MySQL service is running
- Check that database name matches (`cse305`)

### App Won't Start?
- Check Railway logs
- Verify PORT environment variable (should be 8080)
- Make sure WAR file was built successfully

### 404 Errors?
- Make sure you're accessing the root URL
- Check that Tomcat deployed the WAR correctly
- Verify the app is running (check logs)

## 📝 For Your Resume

Once everything is working:

**Live Demo:** `https://your-app-name.up.railway.app`  
**GitHub:** `https://github.com/cdandeniya/stock-trader`

**Example Resume Entry:**
```
Stock Trading System | Full-Stack Java Web Application
• Developed MVC-based trading platform with role-based access control
• Technologies: Java, Servlets, JSP, MySQL, Bootstrap, Maven, Docker
• Deployed on Railway with MySQL database
• Live Demo: [your-railway-url]
• GitHub: github.com/cdandeniya/stock-trader
```

---

**Need help?** Check Railway logs or create an issue in your GitHub repo.

