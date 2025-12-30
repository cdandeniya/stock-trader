# Manual Database Setup in Railway (No Link Button)

Since Railway doesn't have a "Link MySQL" button, we'll add the variables manually.

## Step 1: Get MySQL Connection Details

1. Click on your **MySQL service** in Railway
2. Go to **"Settings"** tab
3. Look for **"Connect"** or **"Connection Info"** section
4. You'll see something like:
   ```
   Host: mysql.railway.internal (or similar)
   Port: 3306
   Database: railway
   User: root
   Password: [some password]
   ```

**OR** check the **"Variables"** tab in MySQL service - Railway might have auto-generated variables like:
- `MYSQL_HOST`
- `MYSQL_PORT`
- `MYSQL_DATABASE`
- `MYSQL_USER`
- `MYSQL_PASSWORD`

## Step 2: Add Variables to Your Web Service

1. Go to your **web service** (the Java app, not MySQL)
2. Click **"Settings"** tab
3. Scroll to **"Variables"** section
4. Click **"+ New Variable"** or **"Add Variable"** button

## Step 3: Add These Variables One by One

Add these variables (replace with your actual MySQL values):

### Option A: Using Individual Variables (Recommended)

**Variable 1:**
- **Name**: `DB_URL`
- **Value**: `jdbc:mysql://[HOST]:[PORT]/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true`
  - Replace `[HOST]` with your MySQL host
  - Replace `[PORT]` with your MySQL port (usually 3306)
  - Example: `jdbc:mysql://mysql.railway.internal:3306/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true`

**Variable 2:**
- **Name**: `DB_USER`
- **Value**: Your MySQL username (usually `root`)

**Variable 3:**
- **Name**: `DB_PASSWORD`
- **Value**: Your MySQL password (from MySQL service settings)

**Variable 4:**
- **Name**: `DB_NAME`
- **Value**: `cse305`

### Option B: Using DATABASE_URL (Single Variable)

If Railway provides a `DATABASE_URL` in MySQL service variables, you can use that:

**Variable:**
- **Name**: `DATABASE_URL`
- **Value**: Copy from MySQL service variables (format: `mysql://user:password@host:port/database`)
- Example: `mysql://root:password123@mysql.railway.internal:3306/railway`

**Note**: If using `DATABASE_URL`, make sure the database name is `cse305`. You might need to modify it:
- Original: `mysql://root:pass@host:3306/railway`
- Modified: `mysql://root:pass@host:3306/cse305`

## Step 4: Verify Variables

After adding, you should see:
- `DB_URL` (or `DATABASE_URL`)
- `DB_USER`
- `DB_PASSWORD`
- `DB_NAME` (if using individual variables)

## Step 5: Redeploy

1. Railway should auto-redeploy when you add variables
2. If not, go to **"Deployments"** tab
3. Click **"Redeploy"** or wait for automatic deployment
4. Check logs to see if database connection works

## Example: What Your Variables Should Look Like

```
DB_URL = jdbc:mysql://containers-us-west-xxx.railway.app:3306/cse305?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
DB_USER = root
DB_PASSWORD = your_actual_password_here
DB_NAME = cse305
```

## Troubleshooting

**Can't find MySQL connection details?**
- Check MySQL service → Settings → Variables
- Look for variables starting with `MYSQL_` or `DATABASE_`
- Railway might auto-generate them

**Connection still fails?**
- Make sure you're using the correct host (might be `mysql.railway.internal` or a public URL)
- Verify port is 3306
- Check that database name is `cse305` (you'll create this when running SQL scripts)
- Check Railway logs for specific error messages

**Database name issue?**
- Railway might create a database named `railway` by default
- You can either:
  1. Use `railway` as DB_NAME and modify your SQL scripts
  2. Or create `cse305` database in MySQL console first

---

**Next**: After setting variables, initialize your database by running SQL scripts in MySQL service → Data tab.

