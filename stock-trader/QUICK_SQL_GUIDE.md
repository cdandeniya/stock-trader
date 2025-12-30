# Quick Guide: Running CREATE TABLE Statements in Railway

You're seeing CREATE TABLE statements in your SQL file. Here's exactly what to do:

## What You're Seeing

Your `BETTERSCRIPT.sql` file contains SQL statements like:
```sql
CREATE TABLE Customers (
    CustomerID BIGINT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    ...
);
```

These need to be **executed** in Railway's MySQL console.

## Step-by-Step: How to Run Them

### Step 1: Copy the ENTIRE File Content

1. Open `src/main/resources/sql/BETTERSCRIPT.sql` in your code editor
2. **Select ALL** (Ctrl+A or Cmd+A)
3. **Copy** (Ctrl+C or Cmd+C)
   - You should have copied everything from the file

### Step 2: Go to Railway MySQL Console

1. Open Railway dashboard
2. Click your **MySQL service**
3. Click **"Data"** tab (or "Connect" or "Query")
4. Click **"Open MySQL Console"** or **"Connect"**
5. You'll see a SQL editor/query box

### Step 3: Paste and Run

1. **Paste** the entire SQL content into the Railway SQL editor
   - Click in the editor box
   - Paste (Ctrl+V or Cmd+V)
   - You should see all the CREATE TABLE statements

2. **Run the SQL:**
   - Look for a **"Run"** button (usually at top or bottom)
   - OR press **Ctrl+Enter** (Windows) or **Cmd+Enter** (Mac)
   - OR click **"Execute"** button

3. **Wait for completion**
   - You'll see messages like "Query OK" or success messages
   - Might take 10-30 seconds

### Step 4: Repeat for basevalues.sql

1. Open `src/main/resources/sql/basevalues.sql`
2. Copy ALL content
3. Paste into Railway SQL editor
4. Run it

## Visual Example

```
Your Local File (BETTERSCRIPT.sql):
┌─────────────────────────────────┐
│ CREATE TABLE Customers (        │ ← Copy ALL of this
│     CustomerID BIGINT...        │
│ );                              │
│ CREATE TABLE Employee (         │
│     EmployeeID BIGINT...        │
│ );                              │
│ ... (more tables)               │
└─────────────────────────────────┘
         ↓ (Copy)
         
Railway MySQL Console:
┌─────────────────────────────────┐
│ [SQL Editor Box]                │ ← Paste here
│ CREATE TABLE Customers (        │
│     CustomerID BIGINT...        │
│ );                              │
│ CREATE TABLE Employee (         │
│     EmployeeID BIGINT...        │
│ );                              │
│ ...                             │
│                                 │
│ [Run Button] ← Click this!      │
└─────────────────────────────────┘
```

## What Railway Console Looks Like

Railway's MySQL console typically has:
- A **large text box** for SQL queries
- A **"Run"** or **"Execute"** button
- Or it might execute automatically when you press Enter

## If You Don't See a Console

**Option 1: Look for "Query" Tab**
- Some Railway interfaces have a "Query" tab instead of "Data"
- Click that and you'll see the SQL editor

**Option 2: Use Railway CLI**
```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Link to project
railway link

# Connect to MySQL
railway connect mysql

# Then paste your SQL and press Enter
```

**Option 3: Get Connection String**
1. MySQL service → Settings → Variables
2. Copy connection details
3. Use MySQL Workbench or similar tool to connect
4. Run SQL there

## Common Mistakes

❌ **Copying just one CREATE TABLE**  
✅ Copy the ENTIRE file content

❌ **Not clicking Run**  
✅ Make sure to click "Run" or press Ctrl+Enter

❌ **Looking at file locally**  
✅ You need to paste it into Railway's console

## Quick Test

After running BETTERSCRIPT.sql, test if it worked:

In Railway SQL console, run:
```sql
SHOW TABLES;
```

You should see a list of tables like:
- Customers
- Employee
- Stock
- Account
- StockOrder
- etc.

If you see the tables, it worked! ✅

---

**Still stuck?** Tell me:
1. Can you see the Railway MySQL console/editor?
2. What does it look like? (screenshot description helps)
3. Are you able to paste SQL into it?

