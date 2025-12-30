# Railway Dashboard Walkthrough

## What You'll See in Railway

When you connect your GitHub repo to Railway, here's what happens:

### 1. **Your Project**
- Railway creates a "Project" (like a workspace)
- Inside the project, you'll have "Services"

### 2. **Services** (These are your components)

**Service #1: Your Web Application** (This is what I called "web service")
- This is the service that runs your Java/Tomcat application
- Railway auto-creates this when you connect your GitHub repo
- It's usually named after your repo (e.g., "stock-trader")
- This is what serves your web application

**Service #2: MySQL Database** (You need to add this)
- This will be your database
- You need to manually add this

## Step-by-Step Visual Guide

### Step 1: Check Your Current Services
1. Go to Railway dashboard: https://railway.app
2. Click on your project
3. You should see at least ONE service already there:
   - This is your web application service (running your Java app)
   - It might be called "stock-trader" or similar

### Step 2: Add MySQL Database
1. In the same project view, click the **"+ New"** button (usually top right)
2. Select **"Database"**
3. Select **"MySQL"**
4. Railway will create a new MySQL service
5. Now you'll have TWO services:
   - Your web app service
   - Your MySQL database service

### Step 3: Link Database to Your Web App
1. Click on your **web app service** (the first one, not MySQL)
2. Go to **"Settings"** tab
3. Scroll down to **"Variables"** section
4. You'll see a button to **"Link MySQL"** or similar
5. Click it and select your MySQL service
6. Railway will automatically add `DATABASE_URL` environment variable

### Step 4: Initialize Database
1. Click on your **MySQL service** (the database one)
2. Go to **"Data"** tab
3. Click **"Open MySQL Console"** or **"Connect"**
4. Run your SQL scripts there

### Step 5: Get Your App URL
1. Go back to your **web app service** (not MySQL)
2. Click **"Settings"** tab
3. Look for **"Generate Domain"** or **"Domains"** section
4. Click to generate a public URL
5. You'll get something like: `https://stock-trader-production.up.railway.app`

## Visual Layout

```
Railway Dashboard
├── Your Project
    ├── Service 1: stock-trader (Web App) ← This is your "web service"
    │   ├── Deployments
    │   ├── Settings
    │   │   ├── Variables (where you link MySQL)
    │   │   └── Domains (where you get your URL)
    │   └── Logs
    │
    └── Service 2: MySQL (Database) ← You add this
        ├── Settings
        └── Data (where you run SQL scripts)
```

## Quick Checklist

- [ ] See your web app service in Railway (auto-created)
- [ ] Add MySQL database service (+ New → Database → MySQL)
- [ ] Link MySQL to web app (web app → Settings → Variables → Link MySQL)
- [ ] Initialize database (MySQL service → Data → Run SQL scripts)
- [ ] Get public URL (web app → Settings → Generate Domain)
- [ ] Test your app at the URL

---

**TL;DR**: The "web service" is just the service that runs your Java application. Railway auto-creates it when you connect your repo. You'll see it in your project dashboard.

