
# Banking Analytics Data Dictionary

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Database System:** PostgreSQL

---

## 1. Overview

This document describes the database tables, column definitions, data types, and business meanings used in the Banking Data Analytics project.

The workflow uses three tables:

1. banking_transactions_raw
2. banking_transactions_staging
3. banking_transactions_clean_v2

The original dataset contains 25,500 records.

The final cleaned dataset contains 24,998 records after removing 502 exact duplicate rows.

## 2. Database Architecture

| Table | Purpose | Records |
|---|---|---:|
| banking_transactions_raw | Original imported data | 25,500 |
| banking_transactions_staging | Standardization and conversion | 25,500 |
| banking_transactions_clean_v2 | Deduplicated analytical records | 24,998 |

The raw and staging tables preserve the source fields as text.

The staging table also includes additional columns for converted financial and date values.

The final table stores cleaned financial and date fields using appropriate PostgreSQL data types.

## 3. Raw Table Structure

Table: banking_transactions_raw

| Column | PostgreSQL Type | Description |
|---|---|---|
| client_id | TEXT | Source customer identifier |
| client_name | TEXT | Customer name |
| bank_name | TEXT | Associated bank |
| account_type | TEXT | Account classification |
| currency | TEXT | Transaction currency |
| transaction_amount | TEXT | Original transaction amount |
| interest_rate | TEXT | Original interest-rate value |
| maturity_date | TEXT | Original maturity date |
| email | TEXT | Customer email address |
| phone | TEXT | Customer phone number |
| loan_status | TEXT | Recorded loan status |
| remarks | TEXT | Additional source notes |

All original fields are stored as TEXT to preserve the source representation during import.

## 4. Staging Table Structure

Table: banking_transactions_staging

The staging table contains all 12 raw columns plus three converted fields.

| Additional Column | PostgreSQL Type | Purpose |
|---|---|---|
| transaction_amount_clean | NUMERIC(15,2) | Converted transaction amount |
| interest_rate_clean | NUMERIC(6,2) | Converted interest rate |
| maturity_date_clean | DATE | Converted maturity date |

The staging table supports:

- Whitespace removal
- NULL handling
- Category standardization
- Financial value conversion
- Date conversion
- Data validation
- Duplicate detection

## 5. Final Analytical Table

Table: banking_transactions_clean_v2

| Column | PostgreSQL Type | Business Meaning |
|---|---|---|
| client_id | TEXT | Customer identifier |
| client_name | TEXT | Customer name |
| bank_name | TEXT | Standardized bank name |
| account_type | TEXT | Standardized account category |
| currency | TEXT | Currency classification |
| transaction_amount | NUMERIC(15,2) | Converted recorded amount |
| interest_rate | NUMERIC(6,2) | Converted interest rate |
| maturity_date | DATE | Converted maturity date |
| email | TEXT | Customer email address |
| phone | TEXT | Customer phone number |
| loan_status | TEXT | Standardized loan status |
| remarks | TEXT | Additional notes |

The final table contains 24,998 analytical records.

## 6. Important Data Definitions

### Client ID

Client identifiers are stored as TEXT because they originate from text-based source data.

A client ID may appear in multiple records.

Therefore, client_id is not a unique primary key in the current schema.

### Transaction Amount

Transaction amounts are stored using NUMERIC(15,2).

The dataset includes multiple currencies.

Monetary values must be grouped by currency or converted using documented foreign-exchange rates before meaningful financial comparisons.

### Interest Rate

Interest rates are stored using NUMERIC(6,2).

The transformation interprets certain embedded spacing characters as decimal separators based on the documented source-format assumption.

### Maturity Date

Maturity dates are converted into PostgreSQL DATE values.

Supported source formats include:

- DD-MM-YYYY
- YYYY.MM.DD
- MM/DD/YYYY

### Bank Name

Bank names are standardized.

Missing source bank names may be represented as Unknown Bank.

### Loan Status

Loan status contains recorded classifications such as Approved, Pending, Rejected, and Unknown.

These classifications do not independently establish creditworthiness or loan disbursement.

## 7. Verified Data Quality Metrics

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Duplicate rows removed | 502 |
| Final records | 24,998 |
| Unique identified clients | 11,676 |
| Valid final transaction amounts | 16,663 |
| Missing final transaction amounts | 8,335 |
| Average interest rate | 6.99% |

## 8. Reporting Views

The project contains four reporting view definitions.

| View | Purpose |
|---|---|
| vw_bank_performance_v2 | Bank-level reporting |
| vw_account_portfolio_v2 | Account-type analysis |
| vw_data_quality_v2 | Data completeness monitoring |
| vw_currency_summary_v2 | Currency-level financial reporting |

## 9. Fields Not Present in the Final Table

The current banking_transactions_clean_v2 schema does not contain:

- risk_category
- maturity_status
- interest_classification
- email_check
- id_missing

These fields may have existed in earlier project versions but are not included in the verified final schema.

They should not be referenced in SQL queries against banking_transactions_clean_v2.

## 10. Data Quality Considerations

Important limitations include:

- Missing customer identifiers
- Missing transaction amounts
- Unknown bank classifications
- Multiple currencies without FX conversion
- No verified customer risk classification
- No unique transaction identifier
- No verified loan application identifier

These limitations should be considered when interpreting analytical results.

## 11. Conclusion

This data dictionary documents the actual PostgreSQL schemas used in the updated Banking Data Analytics project.

The three-table architecture supports raw data preservation, controlled transformation, validation, duplicate removal, and reusable SQL reporting.

---

**Author:** Faisal Kader

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
