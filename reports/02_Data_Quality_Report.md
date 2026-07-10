# Data Quality Report
## End-to-End Banking Data Analytics using PostgreSQL

**Project Version:** 1.0.0

---

# Executive Summary

High-quality data is the foundation of reliable analytics. This report documents the data quality assessment, cleaning activities, validation rules, and improvements applied to the banking dataset before performing business analysis.

The objective was to ensure that the dataset is accurate, consistent, complete, and suitable for decision-making.

---

# Dataset Summary

| Metric | Value |
|---------|-------:|
| Original Records | 25,500 |
| Final Records | 24,997 |
| Duplicate Records Removed | 503 |
| Unique Clients | 11,676 |

---

# Data Quality Dimensions

The following quality dimensions were evaluated:

- Completeness
- Accuracy
- Consistency
- Validity
- Uniqueness
- Integrity

---

# Data Quality Issues Identified

The initial assessment identified several issues within the raw dataset.

| Issue | Status |
|--------|--------|
| Missing Values | Identified |
| Duplicate Records | Identified |
| Inconsistent Categories | Identified |
| Invalid Email Values | Identified |
| Missing Client IDs | Identified |
| Missing Phone Numbers | Identified |
| Unknown Banking Values | Identified |

---

# Data Cleaning Activities

## Missing Values

Missing values were reviewed across all columns.

Actions taken:

- Retained NULL values where source information was unavailable.
- Standardized unknown categorical values using **"Unknown"** where appropriate.
- Preserved missing business information to avoid introducing incorrect data.

---

## Duplicate Detection

Duplicate records were identified using PostgreSQL window functions.

Each duplicate group was reviewed before removing redundant records.

### Results

| Metric | Value |
|---------|-------:|
| Duplicate Records Removed | 503 |
| Remaining Records | 24,997 |

---

## Category Standardization

The following fields were standardized:

- Bank Name
- Account Type
- Currency
- Risk Category
- Loan Status
- Maturity Status
- Interest Classification

This ensures consistent reporting and aggregation.

---

## Email Validation

Customer email addresses were reviewed.

Invalid or missing email values were flagged using the **email_check** column for reporting purposes.

---

## Phone Number Review

Phone numbers were inspected for missing values and formatting consistency.

Where valid information was unavailable, values were retained as NULL to preserve data integrity.

---

# Validation Checks

Validation queries confirmed:

- Duplicate records successfully removed.
- No unexpected NULL values in key reporting fields.
- Standardized category names.
- Valid transaction amounts.
- Consistent interest rate values.
- Reliable reporting dimensions.

---

# Data Quality Improvements

| Area | Improvement |
|------|-------------|
| Duplicate Records | Removed |
| Category Consistency | Standardized |
| Email Validation | Completed |
| Missing Value Handling | Improved |
| Reporting Accuracy | Increased |
| Query Reliability | Improved |

---

# Business Impact

Improved data quality provides:

- Accurate KPI calculations
- Reliable customer reporting
- Better financial analysis
- Consistent business intelligence
- Improved decision-making
- Increased confidence in reporting

---

# Recommendations

To maintain high-quality data in future datasets:

- Validate data during import.
- Apply standard naming conventions.
- Enforce unique identifiers where possible.
- Perform regular duplicate checks.
- Validate email and phone formats automatically.
- Monitor data quality through scheduled audits.

---

# Conclusion

The banking dataset was successfully transformed into a clean, consistent, and analysis-ready database.

The improvements made during the data quality process ensure that all subsequent SQL analysis, reporting views, and executive reports are based on reliable and trustworthy data.

---

## Author

**Faisal Kader**

SQL Developer • Data Analytics Enthusiast • PostgreSQL • Business Intelligence

Version 1.0.0
