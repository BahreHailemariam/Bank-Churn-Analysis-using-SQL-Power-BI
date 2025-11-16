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
