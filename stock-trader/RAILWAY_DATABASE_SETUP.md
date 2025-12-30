# How to Initialize Database in Railway - Step by Step

## Step-by-Step Guide to Run SQL Scripts

### Step 1: Open Your MySQL Service

1. Go to Railway dashboard: https://railway.app
2. Click on your **project**
3. You'll see your services listed
4. Click on your **MySQL service** (not the web app service)
   - It should be named something like "MySQL" or "Postgres" or similar

### Step 2: Open the Data Tab

1. Once you're in your MySQL service, look at the tabs at the top
2. Click on **"Data"** tab
   - You might also see it as **"Connect"** or **"Query"** tab
3. You should see options to connect to your database

### Step 3: Open MySQL Console

You'll see one of these options:

**Option A: "Open MySQL Console" button**
- Click the button that says **"Open MySQL Console"** or **"Connect"**
- A new window/tab will open with MySQL console

**Option B: "Query" tab**
- Click on **"Query"** tab
- You'll see a SQL editor/console

**Option C: "Connect" button**
- Click **"Connect"** 
- Copy the connection command if shown
- Or use the built-in SQL editor

### Step 4: Run BETTERSCRIPT.sql

1. **Get the SQL content:**
   - Open `src/main/resources/sql/BETTERSCRIPT.sql` from your project
   - Copy ALL the contents (Ctrl+A, then Ctrl+C / Cmd+A, then Cmd+C)

2. **Paste into Railway console:**
   - Click in the SQL editor/console in Railway
   - Paste the SQL content (Ctrl+V / Cmd+V)

3. **Run the script:**
   - Click **"Run"** button (usually at top or bottom of editor)
   - OR press **Ctrl+Enter** (Windows/Linux) or **Cmd+Enter** (Mac)
   - Wait for it to complete (might take 10-30 seconds)

4. **Check for success:**
   - You should see "Query OK" or success messages
   - If you see errors, check what they say

### Step 5: Run basevalues.sql

1. **Get the SQL content:**
   - Open `src/main/resources/sql/basevalues.sql` from your project
   - Copy ALL the contents

2. **Paste into Railway console:**
   - Clear the previous query (or use a new query window)
   - Paste the basevalues.sql content

3. **Run the script:**
   - Click **"Run"** or press **Ctrl+Enter** / **Cmd+Enter**
   - Wait for completion

4. **Verify data was inserted:**
   - Run this query to check:
     ```sql
     SHOW TABLES;
     ```
   - You should see tables like: `customers`, `employee`, `stock`, `account`, `stockorder`

### Step 6: Verify Database Setup

Run these queries to verify everything worked:

```sql
-- Check tables exist
SHOW TABLES;

-- Check customers table has data
SELECT COUNT(*) FROM customers;

-- Check employees table has data
SELECT COUNT(*) FROM employee;

-- Check stocks table has data
SELECT COUNT(*) FROM stock;
```

You should see counts > 0 for each table.

## Alternative Method: Using Railway CLI

If the web console doesn't work, use Railway CLI:

### Step 1: Install Railway CLI

```bash
# macOS
brew install railway

# Or using npm
npm i -g @railway/cli
```

### Step 2: Login

```bash
railway login
```

### Step 3: Link to Your Project

```bash
railway link
```
- Select your project when prompted

### Step 4: Connect to MySQL

```bash
railway connect mysql
```

This opens a MySQL connection. Then:

```bash
# Run SQL files
mysql -u root -p < src/main/resources/sql/BETTERSCRIPT.sql
mysql -u root -p < src/main/resources/sql/basevalues.sql
```

**OR** if you're already in MySQL prompt:

```sql
source src/main/resources/sql/BETTERSCRIPT.sql;
source src/main/resources/sql/basevalues.sql;
```

## Alternative Method: Using External MySQL Client

### Step 1: Get Connection Details

1. Go to MySQL service → Settings → Variables
2. Note these values:
   - `MYSQL_HOST`
   - `MYSQL_PORT`
   - `MYSQL_DATABASE`
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`

### Step 2: Connect with MySQL Client

From your local machine:

```bash
mysql -h [MYSQL_HOST] -P [MYSQL_PORT] -u [MYSQL_USER] -p[MYSQL_PASSWORD] [MYSQL_DATABASE]
```

Then run:

```sql
source /path/to/BETTERSCRIPT.sql;
source /path/to/basevalues.sql;
```

**OR** use a GUI tool like:
- MySQL Workbench
- TablePlus
- DBeaver
- phpMyAdmin

Connect using the credentials from Railway.

## Troubleshooting

### "Table already exists" Error

If you see this error:
```
ERROR 1050: Table 'customers' already exists
```

**Solution:**
- Drop existing tables first:
  ```sql
  DROP DATABASE IF EXISTS cse305;
  CREATE DATABASE cse305;
  USE cse305;
  ```
- Then run BETTERSCRIPT.sql again

### "Access denied" Error

**Solution:**
- Check you're using correct username/password
- Verify database name is correct
- Make sure you're connected to the right MySQL instance

### "Database doesn't exist" Error

**Solution:**
- Create database first:
  ```sql
  CREATE DATABASE IF NOT EXISTS cse305;
  USE cse305;
  ```
- Then run BETTERSCRIPT.sql

### Can't Find "Data" Tab

**Solution:**
- Look for "Connect", "Query", or "Console" tab instead
- Some Railway interfaces use different names
- Check MySQL service settings for connection info

### SQL Script Too Large

**Solution:**
- Run SQL statements in smaller chunks
- Copy/paste sections of the file
- Or use Railway CLI method

## Quick Checklist

- [ ] MySQL service is running
- [ ] Opened Data/Query/Connect tab
- [ ] Opened MySQL console/editor
- [ ] Copied BETTERSCRIPT.sql content
- [ ] Pasted and ran BETTERSCRIPT.sql
- [ ] Saw success messages
- [ ] Copied basevalues.sql content
- [ ] Pasted and ran basevalues.sql
- [ ] Verified tables exist (SHOW TABLES;)
- [ ] Verified data exists (SELECT COUNT(*);)

## What Should Happen

After running both scripts:

1. **BETTERSCRIPT.sql** creates:
   - Database structure (tables)
   - Relationships (foreign keys)
   - Indexes

2. **basevalues.sql** inserts:
   - Sample customers
   - Sample employees
   - Sample stocks
   - Sample accounts
   - Sample orders

3. **Your app can now:**
   - Connect to database
   - Query data
   - Login with demo credentials
   - Display stocks, customers, etc.

---

**Need help?** Check Railway logs or share the error message you're seeing!

