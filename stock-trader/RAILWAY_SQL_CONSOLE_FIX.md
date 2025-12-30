# Running SQL Scripts in Railway - What You're Seeing

## What You're Currently Seeing

You're seeing the **"Connect to MySQL"** dialog which shows:
- Step 1: Create a new variable
- Step 2: Assign value `${{ MySQL.MYSQL_URL }}`
- Step 3: Use in application code

**This is for linking the database to your web app, NOT for running SQL scripts.**

## How to Actually Run SQL Scripts

### Option 1: Use Railway CLI (Easiest)

Since the web console isn't easily accessible, use command line:

#### Step 1: Install Railway CLI
```bash
# macOS
brew install railway

# Or using npm
npm i -g @railway/cli
```

#### Step 2: Login
```bash
railway login
```
- Opens browser to authenticate

#### Step 3: Link to Project
```bash
railway link
```
- Select your project when prompted

#### Step 4: Connect to MySQL
```bash
railway connect mysql
```
- This opens a MySQL command prompt
- You can paste SQL directly here!

#### Step 5: Run Your SQL Scripts

Once connected, you'll see a MySQL prompt like:
```
mysql>
```

Then:

**For BETTERSCRIPT.sql:**
1. Copy entire contents of `src/main/resources/sql/BETTERSCRIPT.sql`
2. Paste into the MySQL prompt
3. Press Enter
4. Wait for completion

**For basevalues.sql:**
1. Copy entire contents of `src/main/resources/sql/basevalues.sql`
2. Paste into MySQL prompt
3. Press Enter

**Verify:**
```sql
SHOW TABLES;
```

You should see your tables listed!

### Option 2: Use External MySQL Client

#### Step 1: Get Connection Details

1. Close the "Connect to MySQL" dialog (click X)
2. Go to MySQL service → **Settings** → **Variables**
3. Note these values:
   - `MYSQL_HOST`
   - `MYSQL_PORT`
   - `MYSQL_DATABASE`
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`

#### Step 2: Use MySQL Workbench

1. Download MySQL Workbench: https://dev.mysql.com/downloads/workbench/
2. Install and open it
3. Click **"+"** to create new connection
4. Enter:
   - **Hostname**: Value from `MYSQL_HOST`
   - **Port**: Value from `MYSQL_PORT`
   - **Username**: Value from `MYSQL_USER`
   - **Password**: Click "Store in Keychain" and enter `MYSQL_PASSWORD`
5. Click **"Test Connection"** → **"OK"**
6. Double-click the connection to connect
7. Click **"File"** → **"Open SQL Script"**
8. Select `BETTERSCRIPT.sql` → Click **"Execute"** (lightning bolt icon)
9. Repeat for `basevalues.sql`

#### Step 3: Or Use TablePlus

1. Download TablePlus: https://tableplus.com/
2. Click **"Create new connection"** → **MySQL**
3. Enter Railway connection details
4. Connect
5. Click **"Query"** tab
6. Paste SQL and run

### Option 3: Look for Query Tab in Railway

Try this:

1. **Close** the "Connect to MySQL" dialog
2. In your MySQL service, look for tabs:
   - **"Query"** tab ← Try this
   - **"Data"** tab ← Or this
   - **"SQL"** tab ← Or this
3. Click one of these tabs
4. You should see a SQL editor

## Quick Summary

**What you're seeing:** Connection instructions (for linking database to app)  
**What you need:** SQL console/editor (for running CREATE TABLE statements)

**Easiest solution:** Use Railway CLI
```bash
railway connect mysql
```
Then paste your SQL scripts directly!

## Step-by-Step: Using Railway CLI

```bash
# 1. Install CLI
npm i -g @railway/cli

# 2. Login
railway login

# 3. Link project
railway link
# Select your project

# 4. Connect to MySQL
railway connect mysql
# This opens MySQL prompt: mysql>

# 5. Paste your SQL (from BETTERSCRIPT.sql)
# Just paste and press Enter

# 6. Verify
SHOW TABLES;

# 7. Paste basevalues.sql
# Paste and press Enter

# 8. Done!
exit
```

---

**The CLI method is usually the easiest!** Try that first.

