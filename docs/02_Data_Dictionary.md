# Data Dictionary
## End-to-End Banking Data Analytics using PostgreSQL

**Version:** 1.0.0

---

# Overview

This document describes every column contained in the **banking_transactions** table.

The purpose of a data dictionary is to provide a clear understanding of the dataset structure, data types, business meaning, and intended usage of each field.

---

# Table Information

| Property | Value |
|----------|-------|
| Table Name | banking_transactions |
| Database | PostgreSQL |
| Total Records | 24,997 |
| Primary Purpose | Banking Transaction Analytics |

---

# Column Definitions

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| client_id | INTEGER | Unique identifier assigned to each customer. Some values may be NULL due to missing source data. |
| client_name | VARCHAR | Name of the customer or organization. |
| bank_name | VARCHAR | Name of the associated bank. |
| account_type | VARCHAR | Type of customer account (Savings, Current, Loan, Investment). |
| currency | VARCHAR | Currency used for the transaction (USD, GBP, EUR, BDT, etc.). |
| transaction_amount | NUMERIC | Monetary value of the transaction. |
| interest_rate | NUMERIC | Interest rate associated with the account or transaction. |
| risk_category | VARCHAR | Customer risk classification (Low, Medium, High, Unknown). |
| loan_status | VARCHAR | Current loan status (Approved, Pending, Rejected, Unknown). |
| maturity_date | DATE | Date when the account or investment reaches maturity. |
| maturity_status | VARCHAR | Indicates whether the account is Active, Expired, or Unknown. |
| email | VARCHAR | Customer email address. |
| email_check | VARCHAR | Indicates whether the email is valid or invalid after validation. |
| phone | VARCHAR | Customer phone number. |
| remarks | TEXT | Additional comments or business notes. |

---

# Business Categories

The dataset contains information from multiple business domains:

- Customer Information
- Banking Information
- Account Information
- Financial Transactions
- Risk Assessment
- Loan Management
- Interest Information
- Contact Information
- Account Maturity

---

# Key Business Fields

The following fields are frequently used for business reporting and analysis:

| Column | Business Use |
|---------|--------------|
| bank_name | Bank performance analysis |
| account_type | Customer segmentation |
| transaction_amount | Financial reporting |
| interest_rate | Interest analysis |
| loan_status | Loan portfolio reporting |
| risk_category | Risk assessment |
| maturity_status | Investment maturity reporting |
| currency | Currency distribution |

---

# Data Quality Notes

During data preparation, several quality improvements were applied:

- Standardized inconsistent categorical values
- Reviewed missing values
- Removed duplicate records
- Validated transaction amounts
- Reviewed interest rates
- Standardized unknown categories

These improvements ensure the dataset is suitable for analytical reporting.

---

# Summary

The **banking_transactions** table serves as the central data source for this project.

It provides a clean, standardized, and analysis-ready dataset that supports business reporting, SQL analytics, customer segmentation, and financial performance analysis.

---

## Author

**Faisal Kader**

SQL Developer • Data Analytics Enthusiast • PostgreSQL • Business Intelligence

Version 1.0.0
