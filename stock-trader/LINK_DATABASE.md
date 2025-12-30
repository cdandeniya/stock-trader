# How to Link MySQL Database to Your Web Service in Railway

## Step-by-Step Instructions

### Step 1: Open Your Web Service
1. Go to Railway dashboard: https://railway.app
2. Click on your **project** (the one with your stock-trader app)
3. You'll see your services listed
4. Click on your **web service** (the one that's NOT MySQL - it's probably named "stock-trader" or similar)

### Step 2: Go to Settings
1. Once you're in your web service, look at the top tabs
2. Click on **"Settings"** tab

### Step 3: Find Variables Section
1. Scroll down in the Settings page
2. Look for a section called **"Variables"** or **"Environment Variables"**
3. You should see your current environment variables listed here

### Step 4: Link MySQL Database
**Option A: If you see a "Link Database" button:**
1. Look for a button that says **"Link Database"** or **"Add Database"** or **"Connect Database"**
2. Click it
3. Select your MySQL service from the dropdown
4. Railway will automatically add the `DATABASE_URL` variable

**Option B: If you see "Generate from Service":**
1. Look for **"Generate from Service"** or similar option
2. Click it
3. Select your MySQL service
4. Railway will auto-generate connection variables

**Option C: Manual Linking (if buttons don't appear):**
1. Click on your **MySQL service** first
2. Go to **"Settings"** tab in MySQL service
3. Look for **"Connect"** or **"Connection Info"** section
4. Copy the connection details:
   - Host
   - Port
   - Database name
   - Username
   - Password
5. Go back to your **web service** → **Settings** → **Variables**
6. Click **"+ New Variable"** or **"Add Variable"**
7. Add these variables manually:
   ```
   DATABASE_URL = mysql://user:password@host:port/database
   ```
   OR add individually:
   ```
   DB_URL = jdbc:mysql://host:port/database?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
   DB_USER = [username]
   DB_PASSWORD = [password]
   DB_NAME = cse305
   ```

### Step 5: Verify Variables Are Added
After linking, you should see these variables in your web service:
- `DATABASE_URL` (if Railway auto-added it)
- OR `DB_URL`, `DB_USER`, `DB_PASSWORD` (if you added manually)

### Step 6: Redeploy (if needed)
1. Railway usually auto-redeploys when you add variables
2. If not, go to **"Deployments"** tab
3. Click **"Redeploy"** or wait for automatic redeploy

## Visual Guide

```
Railway Dashboard
│
├── Your Project
    │
    ├── Web Service (stock-trader)
    │   ├── Deployments ← Check build status here
    │   ├── Settings ← GO HERE
    │   │   ├── General
    │   │   ├── Variables ← CLICK THIS SECTION
    │   │   │   ├── [Link Database button] ← CLICK THIS
    │   │   │   └── [Select MySQL service]
    │   │   └── Domains
    │   └── Logs
    │
    └── MySQL Service
        ├── Settings
        │   └── Connect (connection info here)
        └── Data (run SQL scripts here)
```

## Alternative: Quick Link Method

Some Railway interfaces have a simpler way:

1. In your **project view** (where you see all services)
2. Hover over your **web service**
3. Look for a **"Link"** or **"Connect"** icon/button
4. Click it and select your MySQL service
5. Done!

## Troubleshooting

**Can't find "Link Database" button?**
- Make sure you've created the MySQL service first
- Try refreshing the page
- Check that you're in the Settings → Variables section

**Variables not showing up?**
- Wait a few seconds - Railway might need to sync
- Refresh the page
- Check that you selected the correct MySQL service

**Still having issues?**
- You can always add variables manually (Option C above)
- Get connection details from MySQL service → Settings → Connect

## What Happens After Linking?

Once linked:
1. Railway automatically adds `DATABASE_URL` environment variable
2. Your app can now connect to the database
3. Your `DatabaseConfig.java` will read these variables automatically
4. The app should be able to connect to MySQL

---

**Next Step**: After linking, initialize your database by running SQL scripts in the MySQL service's "Data" tab.

