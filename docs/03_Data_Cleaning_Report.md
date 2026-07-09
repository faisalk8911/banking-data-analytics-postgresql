# Data Cleaning Report
## End-to-End Banking Data Analytics using PostgreSQL

**Version:** 1.0.0

---

# 1. Purpose

The purpose of this document is to describe the data cleaning process applied to the raw banking dataset before performing analysis.

High-quality data is essential for accurate reporting, business intelligence, and decision-making. This report documents the cleaning steps used to improve the consistency, reliability, and usability of the dataset.

---

# 2. Initial Dataset Summary

| Metric | Value |
|---------|-------:|
| Original Records | 25,500 |
| Final Records | 24,997 |
| Duplicate Records Removed | 503 |
| Unique Clients | 11,676 |

---

# 3. Data Quality Issues Identified

During the initial review, the following issues were identified:

- Missing values
- Duplicate records
- Inconsistent categorical values
- Unknown bank names
- Missing client IDs
- Invalid email addresses
- Missing phone numbers
- Inconsistent text formatting

These issues were addressed before business analysis.

---

# 4. Cleaning Activities

## 4.1 Missing Values

Missing values were reviewed across all columns.

Actions included:

- Preserving NULL client IDs where source data was unavailable.
- Standardizing missing categorical values using **"Unknown"** where appropriate.
- Keeping missing business data unchanged when it represented genuine unknown information.

---

## 4.2 Standardization

Categorical fields were standardized to ensure consistent reporting.

Examples include:

- Bank names
- Account types
- Loan status
- Risk categories
- Maturity status
- Currency values

This prevents duplicate categories caused by inconsistent spelling or formatting.

---

## 4.3 Email Validation

Customer email addresses were reviewed.

Invalid or missing email values were identified and flagged for reporting purposes rather than removed.

---

## 4.4 Phone Number Review

Phone numbers were reviewed for missing values and formatting consistency.

Missing values were retained where no valid replacement existed.

---

## 4.5 Duplicate Detection

Duplicate records were identified using PostgreSQL window functions.

The duplicate detection process compared records with matching business attributes while preserving one valid record from each duplicate group.

---

## 4.6 Duplicate Removal

After verification:

| Metric | Value |
|---------|-------:|
| Duplicate Records Removed | 503 |
| Final Dataset | 24,997 |

The cleaned dataset now contains unique analytical records suitable for reporting.

---

# 5. Validation After Cleaning

After completing the cleaning process, validation checks confirmed:

- No unnecessary duplicate records remain.
- Categorical values are standardized.
- Transaction amounts remain unchanged.
- Interest rates remain consistent.
- Loan status values are valid.
- Risk categories are standardized.
- Currency values are consistent.

---

# 6. Benefits of Data Cleaning

The cleaning process improved:

- Data consistency
- Reporting accuracy
- Customer segmentation
- Financial analysis
- Risk reporting
- Query reliability
- Business intelligence

---

# 7. Impact on Business Reporting

A clean dataset enables:

- Accurate KPI calculations
- Reliable customer counts
- Correct transaction summaries
- Better risk assessment
- Consistent executive reporting

Without proper cleaning, business reports may contain misleading or duplicated information.

---

# 8. Conclusion

The data cleaning process transformed the raw banking dataset into a reliable, standardized, and analysis-ready database.

The cleaned dataset forms the foundation for all subsequent SQL analysis, reporting views, performance optimization, and business insights presented in this project.

---

## Author

**Faisal Kader**

SQL Developer • Data Analytics Enthusiast • PostgreSQL • Business Intelligence

Version 1.0.0
