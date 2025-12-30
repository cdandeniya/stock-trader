# Complete Railway Deployment Guide

Step-by-step guide to deploy your Java app on Railway.

## Prerequisites

- GitHub account (you have this)
- Railway account (sign up at https://railway.app - free tier available)
- Your code pushed to GitHub

## Step 1: Sign Up for Railway

1. Go to https://railway.app
2. Click **"Start a New Project"** or **"Login"**
3. Sign up with GitHub (easiest way)
4. Authorize Railway to access your GitHub

## Step 2: Create New Project

1. In Railway dashboard, click **"New Project"**
2. Select **"Deploy from GitHub repo"**
3. Find and select your repository: `cdandeniya/stock-trader`
4. Railway will start detecting your project

## Step 3: Configure Root Directory (IMPORTANT!)

Since your project is in `stock-trader/` subdirectory:

1. Click on your **service** (the one Railway just created)
2. Go to **"Settings"** tab
3. Scroll to **"Root Directory"** section
4. Set it to: `stock-trader`
5. Click **"Save"**

**OR** Railway might auto-detect the Dockerfile. If build fails, set root directory.

## Step 4: Verify Build Configuration

Railway should detect your Dockerfile automatically. Check:

1. Go to your service → **"Settings"** → **"Build & Deploy"**
2. **Builder** should be: `Dockerfile`
3. **Dockerfile Path** should be: `Dockerfile` (or `./Dockerfile`)
4. If not set correctly, update it

## Step 5: Add MySQL Database

1. In your Railway project dashboard, click **"+ New"** button
2. Select **"Database"**
3. Select **"MySQL"**
4. Railway will create a MySQL service automatically
5. Wait for it to provision (1-2 minutes)

## Step 6: Link Database to Web Service

### Method 1: Automatic Linking (if available)

1. Click on your **web service** (not MySQL)
2. Go to **"Settings"** → **"Variables"**
3. Look for **"Link Database"** or **"Generate from Service"** button
4. Click it and select your MySQL service
5. Railway will add `DATABASE_URL` automatically

### Method 2: Manual Linking (if no button)

1. Click on your **MySQL service**
2. Go to **"Settings"** → **"Variables"** tab
3. You'll see connection variables like:
   - `MYSQL_HOST`
   - `MYSQL_PORT`
   - `MYSQL_DATABASE`
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`

4. Copy these values

5. Go to your **web service** → **"Settings"** → **"Variables"**

6. Click **"+ New Variable"** and add:

   **Variable 1:**
   - Name: `DB_URL`
   - Value: `jdbc:mysql://[MYSQL_HOST]:[MYSQL_PORT]/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true`
   - Replace `[MYSQL_HOST]` and `[MYSQL_PORT]` with actual values
   - Example: `jdbc:mysql://containers-us-west-123.railway.app:3306/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true`

   **Variable 2:**
   - Name: `DB_USER`
   - Value: Value from `MYSQL_USER`

   **Variable 3:**
   - Name: `DB_PASSWORD`
   - Value: Value from `MYSQL_PASSWORD`

   **Variable 4:**
   - Name: `DB_NAME`
   - Value: `cse305`

7. Click **"Add"** for each variable

## Step 7: Initialize Database

1. Click on your **MySQL service**
2. Go to **"Data"** tab
3. Click **"Connect"** or **"Open MySQL Console"**
4. You'll see a MySQL console/editor

5. Copy the contents of `src/main/resources/sql/BETTERSCRIPT.sql`
   - Paste into the console
   - Run it (click "Run" or press Ctrl+Enter)

6. Copy the contents of `src/main/resources/sql/basevalues.sql`
   - Paste into the console
   - Run it

7. Verify tables were created:
   ```sql
   SHOW TABLES;
   ```
   You should see: `customers`, `employee`, `stock`, `account`, `stockorder`, etc.

## Step 8: Get Your Public URL

1. Go to your **web service** (not MySQL)
2. Click **"Settings"** tab
3. Scroll to **"Domains"** section
4. Click **"Generate Domain"**
5. Railway will create a URL like: `https://stock-trader-production.up.railway.app`
6. **Save this URL** - you'll use it for your resume!

## Step 9: Deploy and Test

1. Railway should auto-deploy when you:
   - Push to GitHub
   - Add environment variables
   - Make configuration changes

2. Check deployment status:
   - Go to **"Deployments"** tab
   - Watch the build logs
   - Wait for "Deploy Succeeded"

3. Test your app:
   - Visit your Railway URL
   - Try logging in:
     - Manager: `dwarren@cs.sunysb.edu` / `admin789`
     - Customer Rep: `dsmith@cs.sunysb.edu` / `rep456`
     - Customer: `lewis.p@cs.sunysb.edu` / `password123`

## Troubleshooting

### Build Fails

**Error: "pom.xml not found"**
- Set Root Directory to `stock-trader` in service settings
- Verify Dockerfile is at repo root

**Error: "Dockerfile not found"**
- Check Dockerfile exists at repo root
- Verify Dockerfile path in settings

**Error: "Build failed"**
- Check build logs in Railway dashboard
- Look for specific error messages
- Verify Maven can build locally: `mvn clean package`

### Database Connection Fails

**Error: "Connection refused"**
- Verify environment variables are set correctly
- Check MySQL service is running
- Verify host/port are correct

**Error: "Access denied"**
- Check username/password are correct
- Verify database name is `cse305`

### App Won't Start

**Error: "Port already in use"**
- Railway uses PORT environment variable automatically
- Your Dockerfile should expose port 8080
- Railway will map it automatically

**404 Errors**
- Check that WAR file was built correctly
- Verify Tomcat deployed the app
- Check Railway logs for errors

### App Goes to Sleep

**Free tier limitation:**
- Railway free tier apps may sleep after inactivity
- First request after sleep takes longer (cold start)
- Consider upgrading to paid plan for always-on

## Railway Dashboard Overview

```
Railway Dashboard
│
├── Your Project
    │
    ├── Service 1: stock-trader (Web App)
    │   ├── Deployments ← Check build status
    │   ├── Metrics ← Monitor performance
    │   ├── Logs ← View application logs
    │   ├── Settings
    │   │   ├── General
    │   │   ├── Build & Deploy ← Configure build
    │   │   ├── Variables ← Environment variables
    │   │   ├── Domains ← Get public URL
    │   │   └── Root Directory ← Set to stock-trader
    │   └── Connect ← Connect via CLI
    │
    └── Service 2: MySQL (Database)
        ├── Data ← Run SQL scripts here
        ├── Settings
        │   ├── Variables ← Connection info
        │   └── Connect ← Connection details
        └── Metrics ← Database metrics
```

## Quick Checklist

- [ ] Signed up for Railway
- [ ] Created project from GitHub repo
- [ ] Set Root Directory to `stock-trader`
- [ ] Added MySQL database service
- [ ] Linked database (added environment variables)
- [ ] Initialized database (ran SQL scripts)
- [ ] Generated public domain
- [ ] Tested app login
- [ ] Saved URL for resume

## Pro Tips

1. **Monitor Logs**: Check logs regularly to catch issues early
2. **Environment Variables**: Keep database credentials secure
3. **Auto-Deploy**: Railway auto-deploys on git push (enable in settings)
4. **Custom Domain**: Add your own domain in Settings → Domains
5. **Backup**: Railway provides database backups on paid plans

## Cost

- **Free Tier**: 
  - $5 free credit/month
  - Apps may sleep after inactivity
  - Good for testing/portfolio

- **Pro Plan**: $20/month
  - Always-on apps
  - More resources
  - Better for production

---

**Need help?** Check Railway logs or create an issue in your GitHub repo. Railway has good documentation at https://docs.railway.app

