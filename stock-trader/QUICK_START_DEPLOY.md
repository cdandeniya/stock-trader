# 🚀 Quick Start: Deploy to Railway (Recommended for Resume)

## Step-by-Step Guide (15 minutes)

### 1. Sign Up for Railway
- Go to https://railway.app
- Sign up with GitHub (free tier available)
- You get $5 free credit monthly

### 2. Create New Project
1. Click "New Project"
2. Select "Deploy from GitHub repo"
3. Choose your `cdandeniya/stock-trader` repository
4. Railway will auto-detect it's a Java project

### 3. Add MySQL Database
1. In Railway dashboard, click "+ New"
2. Select "Database" → "MySQL"
3. Railway will create a MySQL instance automatically
4. Note the connection details (or Railway will auto-link them)

### 4. Set Environment Variables
In your Railway service settings, add these environment variables:

**Option A: Individual Variables (Easier)**
```
DB_URL=jdbc:mysql://[host]:[port]/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
DB_USER=[username from Railway]
DB_PASSWORD=[password from Railway]
```

**Option B: Single DATABASE_URL (Railway provides this automatically)**
- Railway automatically provides `DATABASE_URL` if you link the database
- Format: `mysql://user:password@host:port/database`
- Our code will parse this automatically!

### 5. Initialize Database
You need to run your SQL scripts. Two options:

**Option A: Via Railway MySQL Console**
1. Click on your MySQL service
2. Go to "Data" tab
3. Use the MySQL console to run:
   ```sql
   -- Copy contents of src/main/resources/sql/BETTERSCRIPT.sql
   -- Copy contents of src/main/resources/sql/basevalues.sql
   ```

**Option B: Via Railway CLI**
```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Connect to MySQL
railway connect mysql
# Then run your SQL files
```

### 6. Deploy
- Railway will automatically build and deploy when you push to GitHub
- Or click "Deploy" button in Railway dashboard
- Wait for build to complete (2-5 minutes)

### 7. Get Your Public URL
- Railway provides a public URL automatically
- Format: `https://your-app-name.up.railway.app`
- You can add a custom domain later if needed

### 8. Test Your App
- Visit your Railway URL
- Try logging in with demo credentials
- Everything should work!

---

## 🎯 For Your Resume

**Live Demo:** `https://your-app-name.up.railway.app`  
**GitHub:** `https://github.com/cdandeniya/stock-trader`

**Resume Entry Example:**
```
NovaTrade | Full-Stack Java Web Application
• Developed MVC-based trading platform with role-based access control
• Technologies: Java, Servlets, JSP, MySQL, Bootstrap, Maven
• Deployed on Railway with MySQL database
• Live Demo: [your-railway-url]
• GitHub: github.com/cdandeniya/stock-trader
```

---

## 🔧 Troubleshooting

### Build Fails
- Check Railway logs for errors
- Ensure `pom.xml` is correct
- Verify Java version compatibility

### Database Connection Fails
- Check environment variables are set correctly
- Verify MySQL service is running
- Check firewall/network settings in Railway

### App Won't Start
- Check Tomcat logs in Railway
- Verify port configuration (Railway uses PORT env var)
- Ensure WAR file was built correctly

---

## 💡 Pro Tips

1. **Custom Domain**: Add your own domain in Railway settings
2. **Monitoring**: Railway provides basic metrics
3. **Logs**: View real-time logs in Railway dashboard
4. **Auto-Deploy**: Every GitHub push auto-deploys (enable in settings)

---

## 📚 Alternative: Render.com

If Railway doesn't work, try Render:

1. Sign up at https://render.com
2. Create "Web Service" → Connect GitHub
3. Build: `mvn clean package`
4. Start: `java -jar target/stock-trader.war`
5. Add MySQL database service
6. Set environment variables
7. Deploy!

Render gives 750 free hours/month.

---

**Need Help?** Check Railway docs: https://docs.railway.app

