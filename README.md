# Amazon Sales Analytics - End to End

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)

---

## 📋 Project Overview

End-to-end sales analytics project analyzing 120K+ Amazon orders across 4 months. Performed comprehensive data cleaning, SQL database management, exploratory analysis, and built advanced customer segmentation using RFM analysis. Designed interactive Power BI dashboards with DAX-calculated KPIs, geographic insights, and behavioral analytics to identify $20M in at-risk revenue and deliver actionable retention strategies.

---

## 🗺️ Project Workflow
```
Raw Data → Data Cleaning → SQL Database → EDA → RFM & Churn Analysis → Power BI Dashboard
```

**Steps Overview:**
1.  Data cleaning and preprocessing
2.  Loading data into SQL database
3.  Performing SQL queries and basic analysis
4.  Exploratory Data Analysis (EDA) in Python
5.  RFM segmentation (6 customer clusters)
6.  Churn prediction modeling
7.  Interactive Power BI dashboard with advanced DAX

---

## 📁 Dataset

**Raw File (Before Cleaning):**
- [Amazon Sale Report.csv](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20Sale%20Report.csv.zip)

---

## 🔄 Phase 1: Data Cleaning

**Jupyter Notebook:**
- [Data Cleaning File.ipynb](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Data%20Cleaning%20file.ipynb)

**Steps Covered:**
- Handled missing values (null replacement)
- Removed duplicate records
- Corrected mistyped values in categorical columns
- Fixed data types (datetime, numeric conversions)
- Filtered outliers using statistical methods

**Cleaned Dataset:**
- [Amazon Sales Cleaned File.zip](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20sales%20cleaned%20file.zip)

---

## 🗄️ Phase 2: SQL Database & Analysis

**SQL File:**
- [SQL Queries File](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Sql%20file%201.sql)

**What I Covered:**
- Common Table Expressions (CTEs)
- Month-Year date extraction
- Order cancellation analysis
- Conditional aggregation (CASE + COUNT)
- Revenue aggregation & metrics
- State-wise performance comparison
- Window functions (running totals, ranking)
- Percentile-based classification
- Channel-fulfilment profitability analysis
- Top-N performance ranking

---

## 📊 Phase 3: Exploratory Data Analysis (EDA)

**Files:**
- **Dataset Used:** [Amazon Sales Cleaned File.zip](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20sales%20cleaned%20file.zip)
- **EDA Output CSV:** [Amazon Sales EDA CSV.zip](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20sales%20data%20Eda%20csv%20file.zip)
- **Jupyter Notebook:** [EDA File.ipynb](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/EDA%20file.ipynb)

### 📈 Key Visualizations

#### Sales Trends Over Time by Category
![Sales Over Time](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Sales%20over%20time%20by%20Categories.png)
*Category-wise sales performance showing seasonal patterns and trends*

#### Daily Sales Heatmap
![Daily Sales Heatmap](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Daily%20Sales%20overview%20by%20heatmap.png)
*Heatmap visualization revealing peak sales days and patterns across months*

#### Geographic Churn Distribution
![Churn by State](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Ship%20states%20having%20customers%20by%20churn%20labels.png)
*State-wise customer distribution across churn risk categories*

---

## 💡 Key Insights

### 📊 Sales Performance
- **Peak Month:** Month 4 achieved highest performance with 49K orders generating ₹30.65M in revenue
- **Weekend Effect:** Average spending significantly higher on weekends, indicating shopping behavior patterns
- **Seasonal Demand:** First week of Month 5 showed sales spike driven by Sets and Kurtas during summer season

### 👥 Customer Behavior
- **Repeat Purchase Rate:** Only 6,828 customers (5.7%) placed multiple orders, indicating retention opportunity
- **Average Order Value:** Majority spend ₹250-₹1,000, with growing segment in ₹1,000-₹1,500 range
- **Premium Segment:** Outliers spending ~₹2,000 demonstrate potential for high-value product expansion

### 🎯 RFM Segmentation Findings
1. **VIP Customers (Cluster 2):** Small but highly profitable—require retention focus and exclusive offers
2. **Loyal Mid-Value (Cluster 3):** Consistent repeat buyers—prime candidates for upsell and loyalty programs
3. **Recent Buyers (Clusters 0 & 5):** Large fresh customer base—engage with targeted campaigns to boost frequency
4. **Inactive Customers (Clusters 1 & 4):** Long recency periods—run reactivation campaigns; high-value inactives may return with incentives

### ⚠️ Churn Analysis

#### Geographic Patterns
- **Maharashtra:** Dominates customer count across all segments, largest base in Active and Warning categories
- **Karnataka:** Second-largest contributor with strong Active customer retention
- **Northern States (Delhi, UP):** Show higher Highly Churned and Warning proportions relative to size
- **Smaller States (Rajasthan, MP):** Despite low volumes, show concerning Warning and At Risk ratios

#### Category Performance
- **Highest Churn:** Blouse (29.33%) and Kurta (25.12%)—indicate product/quality issues requiring immediate attention
- **Volume Leader:** Set category has 12,077 churned customers due to high sales volume
- **Best Retention:** Western Dress and Saree (16-17% churn)—demonstrate stronger customer satisfaction
- **Pattern:** Traditional wear shows higher churn; western categories retain customers better

#### Customer Value by Status
- **Active Customers:** Generate highest total revenue (~₹22.17M)
- **Warning Segment:** Highest average monetary value—valuable customers at risk of leaving
- **Highly Churned:** Show lowest average spending, indicating loss of high-value potential

### 🎁 Business Recommendations

#### 1. **Urgent: Address Product Quality in Blouse & Kurta Categories**
- **Evidence:** Blouse shows 29.33% churn rate and Kurta 25.12% churn—significantly higher than Western Dress (16%) and Saree (17%)
- **Action:** Conduct quality audits, gather customer feedback, and improve product standards
- **Expected Impact:** Reducing churn by 10% in these categories could retain ~2,400 customers

#### 2. **Prioritize "Warning" Segment Retention Campaigns**
- **Evidence:** Warning customers have the highest average monetary value but are at risk of churning
- **Action:** Launch targeted offers, personalized communication, and loyalty incentives for this high-value segment
- **Expected Impact:** Retaining even 20% of Warning customers could protect significant revenue given their high spending

#### 3. **Implement Repeat Purchase Program**
- **Evidence:** Only 6,828 customers (5.7%) placed multiple orders, indicating massive untapped potential
- **Action:** Create incentives for second purchases (discounts, loyalty points, free shipping thresholds)
- **Expected Impact:** Increasing repeat rate to 10% could double active customer base

#### 4. **Maharashtra & Karnataka-Specific Retention Strategy**
- **Evidence:** These two states dominate customer count but show high Warning/At Risk volumes
- **Action:** Deploy state-specific campaigns, regional customer service, and localized product offerings
- **Expected Impact:** Reducing churn in top 2 states by 15% could save thousands of customers

---

## 📈 Phase 4: Power BI Dashboard

**Live Dashboard:**
- [View Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZGQ4OTg1MTYtNWI3My00YjhlLWE3OTAtNDJlMjAwZGY5ZTM5IiwidCI6IjA5YTA3MGE3LWMzMzctNGFmNi1iMzZmLTQwMDE1MWY3NGEyYSJ9)


## 🏠 Dashboard – Homepage
![Amazon Sales Dashboard Homepage](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20sales%20dashboard%20homepage.png)

#### Page 1: Executive Overview
- Real-time KPIs with Month-over-Month % tracking (+/- formatted)
- Geographic performance analysis (Top 10 states)
- Monthly sales breakdown (Donut chart)
- Total sale over time
- Weekly sales performance


---

## 📄 Dashboard – Page 2
![Amazon Sales Dashboard Page 2](https://github.com/Himanshu76-DA/Amazon-Sales-Analytics-End-to-End/blob/main/Amazon%20sales%20dashboard%20page%202.png)

#### Page 2: Customer Intelligence
- **RFM Segmentation:** 6 customer clusters based on Recency, Frequency, Monetary value
- **Churn Analysis:** 4-tier risk assessment (Active, At Risk, Warning, Highly Churned)
- Geographic churn patterns by state
- Customer behavioral insights
- Category-wise churn breakdown

---

## 🛠️ Tech Stack

- **Power BI Desktop** - Interactive dashboards & visualizations
- **DAX** - Advanced calculations (MoM%, custom measures)
- **Python** - Data cleaning, EDA, RFM scoring, churn modeling, data manipulation and analysis
- **SQL (MySQL)** - Database management and querying
- **Matplotlib & Seaborn** - Data visualization

---

## 📧 Contact

**Email:** himanshujanghu76@gmail.com

---

⭐ **If you found this project helpful, please give it a star!**

---

**💼 Looking for opportunities in Data Analytics | Open to collaborations**
