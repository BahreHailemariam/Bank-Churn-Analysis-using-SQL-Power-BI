# 🏦 Bank Churn Analysis using SQL & Power BI

Customer retention analytics for banking using SQL-based feature engineering and Power BI dashboards.

## 📌 Project Overview

This project provides an end-to-end analytics solution to understand and reduce **customer churn in the banking sector**.
Using **SQL** for data transformation and **Power BI** for visualization, the project uncovers:

- Customer churn drivers

- High-risk segments

- Behavioral patterns across demographics

- Banking product usage trends

- Customer lifetime value insights

- Predictive churn indicators

This project is suitable for banks, credit unions, fintech firms, and analytics teams building churn-reduction strategies.

## 🎯 Objectives

✔ Build a SQL-driven data model for churn analysis <br />
✔ Perform exploratory analysis of customer attributes & behaviors<br />
✔ Identify root causes of churn and classify customer cohorts<br />
✔ Build interactive dashboards for business users<br />
✔ Provide actionable insights for retention strategy

## 🧱 Project Architecture

```pgsql
Raw Customer Data
      ↓
SQL Cleaning & Transformation
      ↓
Feature Engineering (RFM, risk scoring, tenure, balance bands)
      ↓
Analytics Tables
      ↓
Power BI Dashboard & DAX KPIs

```

## 📂 Folder Structure

```pgsql
Bank_Churn_Analysis/
│
├── data/
│   ├── raw/                    # Original CSVs
│   └── processed/              # Cleaned SQL-exported tables
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_cleaning.sql
│   ├── 03_feature_engineering.sql
│   ├── 04_churn_metrics.sql
│   ├── 05_views_for_powerbi.sql
│
├── dashboard/
│   └── PowerBI_Report_Spec.md
│
├── docs/
│   └── Workflow_Spec.md
│
└── README.md

```

## 🗄️ Data Model

**Key Tables**

| Table            | Description                                          |
| ---------------- | ---------------------------------------------------- |
| **customers**    | Demographics, geography, account creation date       |
| **accounts**     | Account type, credit score, balance, tenure          |
| **transactions** | Monthly or daily monetary activity                   |
| **products**     | Banking products (loan, checking, credit card, etc.) |
| **churn_labels** | Indicates whether a customer exited                  |

### Important Variables

- **Tenure** (months with bank)

- **Balance**

- **Credit Score**

- **Products Count**

- **IsActiveMember**

- **Estimated Salary**

- **Geography and Gender**

## 🧼 1. SQL Data Cleaning

Script: `02_cleaning.sql`

Cleaning tasks include:

- Handling missing values

- Converting text numeric fields to integers

- Standardizing country and gender codes

- Creating a clean customer primary key

- Removing duplicates

- Fixing invalid ages, credit score ranges

Example:

```sql
UPDATE customers
SET Gender = CASE 
                WHEN Gender IN ('M','Male') THEN 'Male'
                WHEN Gender IN ('F','Female') THEN 'Female'
             END;
```

🧠 2. SQL Feature Engineering

Script: `03_feature_engineering.sql`

**Created features:**

- **Churn_Flag**

- **Age_Bucket** (18–30, 30–45, 45–60, 60+)

- **Balance_Bucket**

- **Activity_Flag**

- **Product_Engagement_Score**

- **Risk_Score** (composite metric)

- **Customer_Segment** (Low/Medium/High Value)

Example SQL:

```sql
SELECT
    customer_id,
    CASE
        WHEN tenure < 12 THEN 'New'
        WHEN tenure BETWEEN 12 AND 36 THEN 'Established'
        ELSE 'Long-Term'
    END AS Tenure_Segment,
    CASE
        WHEN balance <= 0 THEN 'No Balance'
        WHEN balance < 50000 THEN 'Low Balance'
        WHEN balance < 100000 THEN 'Mid Balance'
        ELSE 'High Balance'
    END AS Balance_Segment
FROM accounts;

```

## 📊 3. Churn Metrics (SQL)

Script: `04_churn_metrics.sql`

**Key KPIs:**
**Churn Rate**

```sql

SELECT 
  SUM(CASE WHEN churn = 1 THEN 1 END) * 1.0 / COUNT(*) AS churn_rate
FROM churn_labels;

```
**Average Balance of Churned Customers**
```sql

SELECT AVG(balance)
FROM accounts a
JOIN churn_labels c USING(customer_id)
WHERE c.churn = 1;

```

**Churn by Geography**

```sql
SELECT geography, AVG(churn) AS churn_rate
FROM customers
JOIN churn_labels USING(customer_id)
GROUP BY geography;

```

**Retention Metrics**

- Repeat activity

- Cross-sell adoption

- Tenure breakdown

## 📈 4. Power BI Dashboard Overview

### 📄 Pages
### 1️⃣ Churn Overview

- Overall churn %

- Churn trend over time

- Churn by geography

- Churn by age/tenure/product

### 2️⃣ Customer Segmentation

- RFM-like segmentation for banking

- High-risk vs low-risk clusters

- Tenure segments

### 3️⃣ Product Performance

- Usage by churners vs non-churners

- Product adoption funnel

- Cross-sell analysis

### 4️⃣ Financial Health

- Balance trends

- Credit score distribution

- Salary & deposit patterns

### 5️⃣ Churn Drivers & Insights

- Feature importance (if ML included)

- Distributions of churn-heavy features

- Churn vs non-churn comparison

### 6️⃣ Early Warning System

- Accounts with decreasing activity

- Low-product customers

- High-risk geography + age cohorts

- Alerts for targeting retention campaigns

### 📊 Sample DAX Measures

```DAX
Churn Rate =
DIVIDE(
    CALCULATE(COUNTROWS(churn_labels), churn_labels[churn] = 1),
    COUNTROWS(churn_labels)
)

AvgBalance_Churned =
CALCULATE(AVERAGE(accounts[balance]), churn_labels[churn] = 1)

ActiveCustomers =
CALCULATE(
    DISTINCTCOUNT(customers[customer_id]),
    customers[IsActiveMember] = 1
)

```
