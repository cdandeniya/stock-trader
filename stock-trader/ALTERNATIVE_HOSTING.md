# Alternative Hosting Options

Railway giving you trouble? Here are easier alternatives:

## 🥇 Option 1: Render.com (Easiest - Recommended)

**Why it's great:**
- Free tier (750 hours/month)
- Very simple setup
- Auto-detects Java/Maven projects
- Built-in MySQL database
- No complex configuration needed

### Quick Setup:

1. **Sign up**: Go to https://render.com (free tier available)

2. **Create Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repo: `cdandeniya/stock-trader`
   - Render will auto-detect it's Java

3. **Configure Build**:
   - **Build Command**: `cd stock-trader && mvn clean package -DskipTests`
   - **Start Command**: `cd stock-trader && java -jar target/stock-trader.war`
   - **Environment**: `Java`

4. **Add MySQL Database**:
   - Click "New +" → "PostgreSQL" (or MySQL if available)
   - Render creates it automatically
   - Copy connection details

5. **Set Environment Variables**:
   - In your web service → Environment
   - Add:
     ```
     DB_URL=jdbc:mysql://[host]:[port]/[database]?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
     DB_USER=[username]
     DB_PASSWORD=[password]
     DB_NAME=[database_name]
     ```

6. **Deploy**: Render auto-deploys on git push!

**Cost**: Free (750 hours/month)

---

## 🥈 Option 2: Fly.io (Great for Docker)

**Why it's great:**
- Free tier available
- Excellent Docker support
- Global edge deployment
- Simple CLI

### Quick Setup:

1. **Install Fly CLI**:
   ```bash
   curl -L https://fly.io/install.sh | sh
   ```

2. **Login**:
   ```bash
   fly auth login
   ```

3. **Create App**:
   ```bash
   cd stock-trader
   fly launch
   ```
   - Follow prompts
   - It will detect your Dockerfile

4. **Add MySQL**:
   ```bash
   fly postgres create --name stock-trader-db
   fly postgres attach --app stock-trader stock-trader-db
   ```

5. **Deploy**:
   ```bash
   fly deploy
   ```

**Cost**: Free tier available

---

## 🥉 Option 3: Google Cloud Run (Serverless)

**Why it's great:**
- Pay only for what you use
- Auto-scaling
- Free tier: 2 million requests/month
- Easy Docker deployment

### Quick Setup:

1. **Install Google Cloud SDK**:
   ```bash
   # macOS
   brew install google-cloud-sdk
   ```

2. **Login**:
   ```bash
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID
   ```

3. **Build and Deploy**:
   ```bash
   cd stock-trader
   gcloud builds submit --tag gcr.io/YOUR_PROJECT/stock-trader
   gcloud run deploy stock-trader \
     --image gcr.io/YOUR_PROJECT/stock-trader \
     --platform managed \
     --region us-central1 \
     --allow-unauthenticated
   ```

4. **Add Cloud SQL (MySQL)**:
   - Create Cloud SQL instance in Google Cloud Console
   - Connect it to your Cloud Run service

**Cost**: Free tier available, then pay-per-use

---

## 🏅 Option 4: DigitalOcean App Platform

**Why it's great:**
- Simple interface
- Good documentation
- Managed databases included
- $5/month for basic plan

### Quick Setup:

1. **Sign up**: https://www.digitalocean.com/products/app-platform

2. **Create App**:
   - Connect GitHub repo
   - Select "Docker" or "Java"
   - Point to `stock-trader/` directory

3. **Add Database**:
   - Add MySQL database component
   - DigitalOcean manages it automatically

4. **Deploy**: Auto-deploys on push

**Cost**: $5/month (but very reliable)

---

## 🎖️ Option 5: AWS Elastic Beanstalk (Free Tier - 12 Months)

**Why it's great:**
- Free for 12 months (then pay-as-you-go)
- Very powerful
- Industry standard
- Good for learning AWS

### Quick Setup:

1. **Install EB CLI**:
   ```bash
   pip install awsebcli
   ```

2. **Initialize**:
   ```bash
   cd stock-trader
   eb init -p java-8 -r us-east-1 stock-trader-app
   ```

3. **Create Environment**:
   ```bash
   eb create stock-trader-env
   ```

4. **Add RDS MySQL**:
   - Create RDS MySQL instance in AWS Console
   - Update environment variables

**Cost**: Free for 12 months, then pay-as-you-go

---

## 🎯 My Recommendation

**For easiest setup**: **Render.com**
- No complex configuration
- Free tier
- Auto-detects everything
- Built-in database

**For Docker/learning**: **Fly.io**
- Great Docker support
- Free tier
- Simple CLI

**For production/resume**: **DigitalOcean App Platform**
- $5/month but very reliable
- Professional hosting
- Good for portfolio

---

## Quick Comparison

| Platform | Free Tier | Ease | Best For |
|----------|-----------|------|----------|
| **Render** | ✅ 750 hrs/month | ⭐⭐⭐⭐⭐ | Easiest setup |
| **Fly.io** | ✅ Yes | ⭐⭐⭐⭐ | Docker apps |
| **Cloud Run** | ✅ 2M requests | ⭐⭐⭐ | Serverless |
| **DigitalOcean** | ❌ $5/month | ⭐⭐⭐⭐ | Production |
| **AWS EB** | ✅ 12 months | ⭐⭐⭐ | Learning AWS |

---

## Which Should You Choose?

**Choose Render.com if:**
- You want the easiest setup
- You want free hosting
- You don't want to deal with complex configs

**Choose Fly.io if:**
- You want Docker-based hosting
- You're comfortable with CLI
- You want global edge deployment

**Choose DigitalOcean if:**
- You want reliable production hosting
- $5/month is okay
- You want managed databases

---

**Want help setting up any of these?** Let me know which one you prefer!

