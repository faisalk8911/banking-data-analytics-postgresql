
# End-to-End Banking Data Analytics with PostgreSQL

## Project Documentation

**Author:** Faisal Kader  
**Database:** banking_analytics  
**Technology:** PostgreSQL, SQL, pgAdmin 4  
**Project Type:** Banking Data Analytics Portfolio

---

## 1. Project Overview

This project demonstrates an end-to-end SQL banking analytics workflow using PostgreSQL.

The project transforms a simulated banking dataset containing 25,500 records into a structured analytical dataset through data cleaning, validation, financial data conversion, and duplicate removal.

The final cleaned dataset contains 24,998 records.

The project also demonstrates SQL business analysis, reusable reporting views, PostgreSQL functions, indexing, and query performance analysis.

## 2. Business Problem

Raw banking datasets frequently contain missing information, duplicate records, inconsistent categories, and incorrectly formatted financial values.

These issues can affect customer reporting, financial analysis, and management decisions.

The objective was to develop an SQL-based workflow that improves data consistency while preserving legitimate transaction records.

## 3. Project Objectives

- Create a PostgreSQL banking database.
- Import and preserve original banking records.
- Identify missing and inconsistent values.
- Standardize customer, bank, and account information.
- Convert transaction amounts, interest rates, and dates.
- Identify and remove exact duplicate records.
- Develop reusable PostgreSQL reporting views.
- Perform banking and account portfolio analysis.
- Evaluate SQL execution performance.
- Document the analytical workflow.

## 4. Verified Dataset Summary

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Staging records | 25,500 |
| Duplicate rows removed | 502 |
| Final cleaned records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |

## 5. Database Architecture

The updated project uses three primary tables:

| Table | Purpose |
|---|---|
| banking_transactions_raw | Stores original banking data |
| banking_transactions_staging | Supports cleaning and data conversion |
| banking_transactions_clean_v2 | Contains final deduplicated records |

The original raw records are preserved during data preparation.

## 6. Data Cleaning and Transformation

The cleaning process includes:

- Trimming unnecessary whitespace.
- Converting blank values into SQL NULL.
- Standardizing bank names and account types.
- Normalizing currency codes and loan statuses.
- Converting transaction amounts into numeric values.
- Converting interest rates into numeric values.
- Converting maturity dates into PostgreSQL DATE values.

Missing identifiers and financial amounts are preserved rather than replaced with fabricated values.

## 7. Data Validation

SQL checks were developed to evaluate:

- Missing client identifiers.
- Missing transaction amounts.
- Missing interest rates.
- Missing maturity dates.
- Financial data conversion.
- Interest rate ranges.
- Date representation consistency.
- Standardized bank classifications.

All 19,120 non-missing maturity dates were converted, with zero representation mismatches in the completed validation check.

## 8. Duplicate Detection and Removal

Duplicate detection was performed using PostgreSQL ROW_NUMBER() across 12 standardized source business fields.

Repeated client IDs alone were not considered duplicates.

**Verified results:**

- Original records: 25,500
- Duplicate rows removed: 502
- Final records: 24,998

## 9. Financial Analysis

The final dataset supports analysis of:

- Banking transaction activity.
- Bank-level record distribution.
- Account portfolio composition.
- Customer identification completeness.
- Transaction amount completeness.
- Loan status distribution.
- Currency-level financial summaries.
- Account maturity trends.

### Verified Financial KPIs

| KPI | Value |
|---|---:|
| Valid transaction amounts | 16,663 |
| Sum of recorded amounts | 4,170,755,712.00 |
| Average recorded amount | 250,300.41 |
| Average interest rate | 6.99% |

**Important:** Monetary amounts include multiple currencies without foreign-exchange conversion. Combined values should not be interpreted as single-currency financial totals.

## 10. Reusable PostgreSQL Reporting Views

The updated reporting layer includes:

- vw_bank_performance_v2
- vw_account_portfolio_v2
- vw_data_quality_v2
- vw_currency_summary_v2

These views support reusable SQL reporting and reduce repetitive aggregation logic.

## 11. SQL Business Analysis

The project contains 20 business-focused SQL queries covering:

- Executive KPIs
- Bank performance
- Customer identification
- Account portfolio analysis
- Interest rates
- Loan statuses
- Currency distribution
- Maturity analysis
- Financial data quality

The queries use PostgreSQL aggregation, filtering, conditional calculations, and date functions.

## 12. Query Performance Analysis

PostgreSQL query execution was examined using EXPLAIN (ANALYZE, BUFFERS).

The analysis includes:

- Sequential scans
- Index scans
- Hash aggregation
- Sorting
- Query execution time
- Buffer usage

A measured performance improvement is not claimed without comparative benchmarking.

## 13. PostgreSQL Functions

Five reusable reporting functions support:

- Customer details
- Bank transaction summaries by currency
- Data quality reporting
- Account portfolio reporting
- Executive KPI reporting

These functions use the final cleaned database table.

## 14. Project Deliverables

- PostgreSQL database schema
- Raw data import script
- SQL cleaning and transformation script
- Data validation queries
- Duplicate-removal workflow
- 20 business analysis queries
- Reusable reporting views
- Database indexes
- SQL performance analysis
- PostgreSQL functions
- Technical reports and documentation

## 15. Conclusion

The project demonstrates practical SQL data preparation, validation, analytics, and reporting skills.

It successfully transformed 25,500 simulated banking records into 24,998 deduplicated analytical records.

The resulting PostgreSQL database supports financial data analysis, bank performance reporting, customer segmentation, and data-quality monitoring.

---

**Author:** Faisal Kader  
**GitHub:** https://github.com/faisalk8911/banking-data-analytics-postgresql
