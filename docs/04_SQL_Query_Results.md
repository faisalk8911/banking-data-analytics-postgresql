# SQL Query Results
## End-to-End Banking Data Analytics using PostgreSQL

**Version:** 1.0.0

---

# Overview

This document summarizes the business analysis performed using SQL queries on the cleaned banking dataset.

The objective of these queries is to transform raw transactional data into actionable business insights that support reporting and decision-making.

---

# Dataset Summary

| Metric | Value |
|---------|-------:|
| Total Records | 24,997 |
| Unique Clients | 11,676 |
| Total Transaction Amount | 4,170,755,712.00 |
| Average Transaction | 250,300.41 |

---

# Query 1 — Total Records

### Business Question

How many records exist after data cleaning?

### Result

**24,997 records**

### Business Insight

The cleaned dataset contains 24,997 valid records available for analysis.

---

# Query 2 — Unique Customers

### Business Question

How many unique customers are in the dataset?

### Result

**11,676 customers**

### Business Insight

The customer base consists of 11,676 unique clients, enabling customer-level reporting and segmentation.

---

# Query 3 — Total Transaction Amount

### Business Question

What is the total transaction value?

### Result

**4,170,755,712.00**

### Business Insight

The dataset represents over **4.17 billion** in banking transactions.

---

# Query 4 — Average Transaction Amount

### Business Question

What is the average transaction value?

### Result

**250,300.41**

### Business Insight

Average transaction size helps understand customer transaction behavior.

---

# Query 5 — Highest & Lowest Transaction

### Results

Highest Transaction:

**499,972.00**

Lowest Transaction:

**1,049.00**

### Business Insight

These values define the transaction range and help identify unusually large or small transactions.

---

# Query 6 — Customer Distribution by Bank

### Results

| Bank | Customers |
|------|----------:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,144 |
| Wells Fargo | 4,014 |

### Business Insight

Customer distribution is relatively balanced across major banks.

---

# Query 7 — Transaction Amount by Bank

### Results

| Bank | Total Transaction |
|------|------------------:|
| BOFA | 728,377,576.00 |
| CITI | 697,919,368.00 |
| Unknown Bank | 692,871,342.00 |
| CHASE | 692,329,068.00 |
| Wells Fargo | 681,074,161.00 |
| HSBC | 678,184,197.00 |

### Business Insight

BOFA generated the highest transaction volume.

---

# Query 8 — Customer Distribution by Account Type

### Results

| Account Type | Customers |
|--------------|----------:|
| Loan | 6,357 |
| Current | 6,217 |
| Investment | 6,213 |
| Savings | 6,210 |

### Business Insight

Loan accounts represent the largest customer segment.

---

# Query 9 — Transaction Amount by Account Type

### Results

| Account Type | Total Transaction |
|--------------|------------------:|
| Loan | 1,053,743,923.00 |
| Investment | 1,051,150,974.00 |
| Current | 1,035,398,895.00 |
| Savings | 1,030,461,920.00 |

### Business Insight

Transaction values are evenly distributed across account types.

---

# Query 10 — Average Interest Rate by Bank

### Results

| Bank | Average Interest Rate |
|------|----------------------:|
| BOFA | 7.08% |
| Wells Fargo | 6.99% |
| CITI | 6.98% |
| CHASE | 6.98% |
| Unknown Bank | 6.97% |
| HSBC | 6.95% |

### Business Insight

Interest rates are consistent across banks, with BOFA having the highest average.

---

# Query 11 — Customer Risk Distribution

### Results

| Risk Category | Customers |
|--------------|----------:|
| Unknown | 8,334 |
| High | 6,689 |
| Medium | 6,623 |
| Low | 3,351 |

### Business Insight

A significant number of customers fall into the Unknown risk category, indicating an opportunity for improved data quality.

---

# Query 12 — Loan Status Distribution

### Results

| Loan Status | Customers |
|-------------|----------:|
| Rejected | 6,300 |
| Pending | 6,256 |
| Approved | 6,224 |
| Unknown | 6,217 |

### Business Insight

Loan approvals, rejections, and pending applications are evenly distributed.

---

# Query 13 — Currency Distribution

### Results

| Currency | Accounts |
|----------|---------:|
| Unknown | 5,023 |
| BDT | 5,014 |
| EUR | 5,004 |
| GBP | 5,000 |
| USD | 4,956 |

### Business Insight

The dataset supports multi-currency analysis with a balanced currency distribution.

---

# Query 14 — Account Maturity Status

### Results

| Status | Accounts |
|--------|---------:|
| Expired | 18,746 |
| Unknown | 6,251 |

### Business Insight

Most accounts are classified as expired, making maturity reporting an important analytical area.

---

# Query 15 — Top Transaction Records

### Business Question

Which customers have the highest transaction values?

### Business Insight

The highest-value transactions help identify premium customers and large financial activities.

---

# Query 16 — Monthly Account Creation Trend

### Business Insight

Monthly trends provide visibility into account growth patterns and seasonal fluctuations across 2024–2026.

---

# Query 17 — Average Transaction by Bank

### Business Insight

Average transaction values help compare customer spending behavior between banks.

---

# Query 18 — Average Transaction by Account Type

### Business Insight

Current accounts show the highest average transaction amount, followed closely by Savings accounts.

---

# Query 19 — High-Risk Customers by Bank

### Business Insight

Monitoring high-risk customers by bank supports compliance, fraud monitoring, and risk management initiatives.

---

# Query 20 — Executive KPI Summary

### Results

| KPI | Value |
|------|------:|
| Total Records | 24,997 |
| Unique Clients | 11,676 |
| Total Transaction | 4,170,755,712.00 |
| Average Transaction | 250,300.41 |
| Highest Transaction | 499,972.00 |
| Lowest Transaction | 1,049.00 |
| Average Interest Rate | 6.99% |

### Business Insight

The executive summary provides a high-level overview of the banking dataset and serves as a quick reference for management reporting.

---

# Conclusion

The 20 SQL queries transform raw banking data into meaningful business insights covering customer behavior, transaction performance, account analysis, loan reporting, risk assessment, currency distribution, and executive KPIs.

Together, these analyses demonstrate practical SQL skills for solving real-world business problems and supporting data-driven decision-making.

---

## Author

**Faisal Kader**

SQL Developer • Data Analytics Enthusiast • PostgreSQL • Business Intelligence

Version 1.0.0
