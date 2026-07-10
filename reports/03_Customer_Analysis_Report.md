# Customer Analysis Report
## End-to-End Banking Data Analytics using PostgreSQL

**Project Version:** 1.0.0

---

# Executive Summary

This report analyzes customer-related information contained within the banking dataset. The objective is to understand customer distribution, account ownership, transaction behavior, banking relationships, and financial activity.

Customer analysis helps financial institutions improve customer segmentation, identify high-value clients, and support data-driven business decisions.

---

# Dataset Summary

| Metric | Value |
|---------|-------:|
| Total Records | 24,997 |
| Unique Customers | 11,676 |
| Duplicate Records Removed | 503 |

---

# Customer Distribution

The cleaned dataset contains **11,676 unique customers**, representing individuals with various account types, banking relationships, and financial activities.

The customer base provides sufficient diversity for business reporting and customer segmentation.

---

# Customer Distribution by Bank

| Bank | Customers |
|------|----------:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,144 |
| Wells Fargo | 4,014 |

### Business Insight

Customer distribution is relatively balanced across participating banks, reducing dependency on a single institution.

---

# Customer Distribution by Account Type

| Account Type | Customers |
|--------------|----------:|
| Loan | 6,357 |
| Current | 6,217 |
| Investment | 6,213 |
| Savings | 6,210 |

### Business Insight

Loan accounts represent the largest customer segment, indicating strong demand for lending products.

---

# Customer Distribution by Currency

| Currency | Customers |
|----------|----------:|
| Unknown | 5,023 |
| BDT | 5,014 |
| EUR | 5,004 |
| GBP | 5,000 |
| USD | 4,956 |

### Business Insight

The dataset supports multi-currency banking operations with a balanced distribution across major currencies.

---

# Customer Risk Profile

| Risk Category | Customers |
|---------------|----------:|
| Unknown | 8,334 |
| High | 6,689 |
| Medium | 6,623 |
| Low | 3,351 |

### Business Insight

A significant portion of customers fall into the **Unknown** risk category, highlighting opportunities for enhanced risk classification and improved customer profiling.

---

# Customer Loan Status

| Loan Status | Customers |
|-------------|----------:|
| Rejected | 6,300 |
| Pending | 6,256 |
| Approved | 6,224 |
| Unknown | 6,217 |

### Business Insight

Loan outcomes are relatively balanced, providing useful data for evaluating lending performance and customer credit trends.

---

# Transaction Analysis

| KPI | Value |
|------|------:|
| Total Transaction Amount | 4,170,755,712.00 |
| Average Transaction | 250,300.41 |
| Highest Transaction | 499,972.00 |
| Lowest Transaction | 1,049.00 |

### Business Insight

The dataset reflects a wide range of customer transaction values, supporting analyses of both everyday banking activity and high-value financial transactions.

---

# Customer Contact Information

Customer records include:

- Email Address
- Email Validation Status
- Phone Number

These fields support customer communication, marketing initiatives, and data quality assessments.

---

# Key Findings

- 11,676 unique customers were analyzed.
- Customer distribution is balanced across banks.
- Loan accounts are the most common account type.
- Banking operations support multiple currencies.
- Customer transaction activity exceeds 4.17 billion in value.
- Risk and loan status fields enable compliance and portfolio analysis.

---

# Recommendations

Based on the analysis:

- Improve customer risk classification to reduce Unknown values.
- Enhance customer segmentation using transaction behavior.
- Monitor high-value customers for relationship management.
- Expand reporting by customer demographics where available.
- Continue validating customer contact information to improve communication effectiveness.

---

# Conclusion

The customer analysis demonstrates that the banking dataset provides a strong foundation for customer reporting, financial analysis, and strategic decision-making.

The insights generated support customer segmentation, lending analysis, and operational reporting while showcasing practical SQL analytical capabilities.

---

## Author

**Faisal Kader**

SQL Developer • Data Analytics Enthusiast • PostgreSQL • Business Intelligence

Version 1.0.0
