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

- **Average Tenure

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
