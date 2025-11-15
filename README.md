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

```sql
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
