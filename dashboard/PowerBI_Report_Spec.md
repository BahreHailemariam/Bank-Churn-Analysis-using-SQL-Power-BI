# 📈 Detailed Power BI Dashboard Specification — Bank Churn Analysis

This dashboard is designed for **banking stakeholders** (analytics teams, CX leaders, product managers) who need **real-time visibility** into churn patterns, high-risk customer groups, and the underlying financial and behavioral drivers.

The report is structured into **six analytical pages:**

## 1️⃣ Churn Overview
### 🎯 Purpose

Provide a high-level snapshot of the bank’s churn performance at a glance—ideal for executives and retention managers.

### 🔑 KPIs (Card Visuals)

- **Overall Churn Rate** (12-month rolling or total)

- **Total Customers vs Churned Customers**

- **Active Customers**

- **Average Tenure**

- **Average Balance (Churned vs Non-Churned)**

### 📉 Visuals
**1. Churn Trend (Line Chart)**

- X-axis: Month/Year

- Y-axis: Churn %

- Shows seasonality and trends

- Drill-down enabled (Year → Quarter → Month)

**2. Churn by Geography (Map or Filled Map)**

- Churn rate by country/state/city

- Highlights geographies with higher attrition

- Region slicer (optional)

**3. Churn by Age Group (Column Chart)**

- Age Bins: 18–30, 31–45, 46–60, 60+

- Overlay churn % vs customer count

- Tooltips with avg credit score per group

**4. Churn by Tenure (Bar or Ribbon Chart)**

- Segments: New (<1 year), Mid (1–3 years), Long-Term (>3 years)

- Reveals loyalty and retention gaps

**5. Churn by Product Count (Stacked Bar)**

- 1 product → highest churn

- 2 products → moderate

- 3–4 products → lowest

- Used for cross-selling strategy planning

### 🧭 Filters / Slicers

- Date range

- Geography

- Customer Segment

- Age Range

- Number of Products

## 2️⃣ Customer Segmentation
### 🎯 Purpose

Understand **customer clusters**, behavioral patterns, and risk categories.

### 📊 Visuals
**1. RFM-Like Segmentation (Scatter Plot / Cluster Chart)**

Even though RFM is common in e-commerce, it adapts well to banking:

- **Recency:** Last active transaction

- **Frequency:** Number of monthly transactions

- **Monetary:** Balance or deposits

Clusters:

- **Champions**

- **Loyal**

- **At-Risk**

- **Hibernating**

- **Low-Value**

**2. Risk Segmentation (Donut Chart)**

- Low Risk

- Medium Risk

- High Risk

- Very High Risk (Churn Likely)

- If machine learning is included:

- Risk probability bands (0–0.25, 0.25–0.5, 0.5–0.75, 0.75–1)

**3. Tenure Segmentation (Column Chart)**

- Tenure buckets

- Shows customer aging profile

- Highlights segments with highest churn

**4. Customer Demographic Distribution (Stacked Chart)**

- Gender x Age

- Geography x Risk Score

- Each segment includes churn overlay

## 3️⃣ Product Performance
### 🎯 Purpose

Analyze banking product adoption, cross-sell opportunities, and churn correlation.

### 📊 Visuals
**1. Product Usage by Churners vs Non-Churners (Clustered Bar)**

- Reveals which products churned customers commonly held

- Example: Low credit card adoption among churners

**2. Product Adoption Funnel**

1.Total Customers

2.Customers with ≥1 Product

3.Customers with Loan

4.Customers with Credit Card

5.Customers with Savings + Investments

Shows drop-offs and cross-sell leakage.

**3. Cross-Sell Score (Heatmap)**

A product affinity matrix:

```nginx
Loan ↔ Credit Card
Mortgage ↔ Savings
Credit Card ↔ Investment

```

Helps identify what to offer next for retention.

**4. Revenue Contribution by Product (Treemap)**

- Helps prioritize retention for high-value products

## 4️⃣ Financial Health
### 🎯 Purpose

Show financial KPIs and determine whether **financial pressure is driving churn**.

### 📊 Visuals
**1. Balance Trend (Line Chart)**

- Tracks customer balances over time

- Compare churned vs retained customers

- Allows “Balance Drop” anomaly detection

**2. Credit Score Distribution (Histogram)**

- Low credit score brackets often correlate with churn

- Highlight high-risk bands (<550, 550–650)

**3. Salary vs Churn Heatmap**

- Salary bands vs churn rate

- Shows financial stress segments

**4. Deposit Activity Trend (Area Chart)**

- Total deposits per month

- Sharp declines often precede churn

- Tooltip shows churn probability average

**5. Product Value Index (KPI)**

Weighted financial health indicator:

```
CreditScore + Balance + ProductsCount + IncomeIndex
```

5️⃣ Churn Drivers & Insights
🎯 Purpose

Identify the root causes and strongest indicators of churn.

📊 Visuals
**1. Churn Contributors (Feature Importance)**

If ML model used, show:

- SHAP values

- Top 10 churn drivers

- Example drivers:

      - Low tenure

      - Low activity

      - Few products

      - Low balance

      - High credit score volatility

      - High geographic churn

**2. Churn vs Non-Churn Comparison (Side-by-Side Bars)**

Compare both groups on:

- Balance

- Credit Score

- Activity

- Product Count

- Age

- Salary

**3. Distribution of Churn-Heavy Features**

- Boxplots / violin charts

- e.g., low balance concentrated among churned customers

**4. Customer Personas (Card Visuals)**

Examples:

- “Young Low-Engagement”

- “Mid-Tenure High-Value”

- “At-Risk Credit Card Only Users”

## 6️⃣ Early Warning System
### 🎯 Purpose

Practical risk detection dashboard for customer retention teams.

### ⚠️ Alerts Shown (Cards / Conditional Formatting)

- Customers with **3+ months no activity**

- Customers with balance drop > 30%

- Customers reducing product count (4 → 2)

- Low-credit-score customers trending downward

- High churn regions (geo-level thresholds)

### 📊 Visuals
**1. Activity Decline Monitor (Line Chart + Flags)**

- Drop in transactions

- Flags customers with significant downward trends

**2. Low-Product Customers (Table)**

Columns:

- Customer ID

- Tenure

- Current products

- Churn probability

- Suggested upsell

**3. High-Risk Customer List (Table)**

Attributes:

- Risk Score

- Balance trend

- Product count

- Last activity date

- Recommended retention action

**4. Geography x Age Risk Matrix**

Shows where the bank should prioritize retention efforts.

## 🧭 Recommended Slicers

- Geography

- Gender

- Credit Score Range

- Tenure

- Product Count

- Date Range

- Risk Level

🎨 Visual Design Recommendations

- Use consistent color scheme:

   - **Red** = churn / risk

   - **Green** = retained / healthy

   - **Blue** = neutral / KPIs

- Add drill-through pages for:

   - Individual customer profile

   - Region-specific churn report

