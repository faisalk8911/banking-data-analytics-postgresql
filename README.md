
# End-to-End Banking Data Analytics with PostgreSQL

**SQL Data Cleaning | Data Validation | Financial Analytics | PostgreSQL Reporting | Query Performance Analysis**

An end-to-end SQL portfolio project demonstrating how raw banking data can be cleaned, validated, transformed, and analyzed using PostgreSQL.

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4, GitHub  
**Dataset:** Simulated Banking Records

---

## Project Overview

This project demonstrates a structured banking analytics workflow using PostgreSQL.

Starting with 25,500 raw banking records, the project applies data cleaning, standardization, financial data conversion, validation, and duplicate removal to produce 24,998 analytical records.

It also includes:

- 20 business-focused SQL analysis queries
- Four reusable PostgreSQL reporting views
- Five PostgreSQL reporting functions
- Database indexing strategies
- Ten query performance analysis tests
- Technical documentation and analytical reports

The project focuses on SQL and PostgreSQL. Power BI dashboard projects are presented separately.

## Key Project Results

| Metric | Verified Result |
|---|---:|
| Raw banking records | 25,500 |
| Duplicate rows removed | 502 |
| Final cleaned records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Sum of recorded amounts* | 4,170,755,712.00 |
| Average recorded amount* | 250,300.41 |
| Average interest rate | 6.99% |

*The dataset contains multiple currencies without FX conversion. Combined monetary amounts are SQL aggregate metrics and should not be interpreted as single-currency financial totals.*

## Business Problem

Banking datasets often contain:

- Missing customer identifiers
- Incomplete financial information
- Duplicate records
- Inconsistent bank and account categories
- Incorrectly formatted numeric values
- Different date formats
- Incomplete reporting classifications

These issues can reduce the reliability of business analysis.

The project addresses these challenges through a structured PostgreSQL data preparation and reporting workflow.

## Project Architecture

```text
Raw Banking Dataset
     |
     v
banking_transactions_raw
25,500 records
     |
     v
Data Standardization
Financial and Date Conversion
     |
     v
banking_transactions_staging
25,500 records
     |
     v
Data Validation
Duplicate Detection
ROW_NUMBER()
     |
     v
banking_transactions_clean_v2
24,998 records
     |
     v
20 SQL Business Analysis Queries
     |
     v
4 Reporting Views
5 PostgreSQL Functions
     |
     v
Indexes and Query Execution Analysis
     |
     v
Banking Analytics Reports
```

## Database Structure

The updated workflow uses three tables.

| Table | Purpose |
|---|---|
| banking_transactions_raw | Preserve original imported records |
| banking_transactions_staging | Standardization and data conversion |
| banking_transactions_clean_v2 | Final deduplicated analytical dataset |

The final table includes customer, bank, account, currency, transaction amount, interest rate, maturity date, and loan-status information.

The earlier banking_transactions table is a separate legacy table and is not used by the updated analytical workflow.

## Data Cleaning and Validation

### Initial Data Quality Findings

| Issue | Raw Records Affected |
|---|---:|
| Missing client IDs | 12,726 |
| Missing transaction amounts | 8,505 |
| Missing bank names | 4,325 |
| Missing maturity dates | 6,380 |

### Data Cleaning Activities

- Trimmed unnecessary whitespace.
- Converted blank strings into NULL.
- Standardized bank names and account types.
- Normalized currency codes and loan statuses.
- Converted transaction amounts to NUMERIC(15,2).
- Converted interest rates to NUMERIC(6,2).
- Converted maturity dates into PostgreSQL DATE.
- Preserved missing financial values when source data was unavailable.

Interest-rate conversion used a documented assumption about embedded spaces representing decimal separators.

The date transformation supported DD-MM-YYYY, YYYY.MM.DD, and MM/DD/YYYY formats.

### Duplicate Removal

PostgreSQL ROW_NUMBER() was used to identify duplicates across 12 standardized source business fields.

Repeated client IDs alone were not treated as duplicate transactions.

**Result: 502 duplicate rows removed, leaving 24,998 cleaned records.**

## Banking Performance Analysis

### Record Distribution by Bank

| Bank | Cleaned Records |
|---|---:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,145 |
| Wells Fargo | 4,014 |
| **Total** | **24,998** |

The Unknown Bank category highlights a significant data completeness issue.

These values are record counts, not distinct customer counts.

### Financial Analysis

The SQL queries examine:

- Bank-level transaction amount summaries
- Account portfolio distributions
- Average interest rates
- Loan-status distributions
- Customer identification completeness
- Currency-level transaction summaries
- Maturity-date trends
- Executive financial and data-quality KPIs

Monetary comparisons should be performed within the same currency or after documented FX conversion.

## PostgreSQL Reporting Views

Four reusable SQL views are defined:

| View | Purpose |
|---|---|
| vw_bank_performance_v2 | Bank performance reporting |
| vw_account_portfolio_v2 | Account-type analysis |
| vw_data_quality_v2 | Data completeness monitoring |
| vw_currency_summary_v2 | Currency-specific financial summaries |

Example:

```sql
SELECT *
FROM vw_bank_performance_v2
ORDER BY total_records DESC;
```

## Reusable PostgreSQL Functions

Five SQL functions provide reusable reporting logic:

| Function | Purpose |
|---|---|
| get_customer_details_v2 | Customer record lookup |
| get_bank_transaction_summary_v2 | Bank financial summaries by currency |
| get_data_quality_summary_v2 | Missing-data analysis |
| get_account_summary_v2 | Account portfolio reporting |
| get_executive_summary_v2 | Executive KPI summary |

Example:

```sql
SELECT *
FROM get_executive_summary_v2();
```

## Query Performance Analysis

PostgreSQL query execution plans were examined using:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    bank_name,
    COUNT(*) AS total_records,
    SUM(transaction_amount) AS total_amount
FROM banking_transactions_clean_v2
WHERE transaction_amount IS NOT NULL
GROUP BY bank_name;
```

### Recorded Performance Evidence

| Metric | Recorded Result |
|---|---:|
| Planning time | 0.913 ms |
| Execution time | 8.155 ms |
| Non-NULL amount rows | 16,663 |
| Rows excluded by filter | 8,335 |
| Shared buffer hits | 384 |

This is one recorded execution-plan measurement, not evidence of a verified indexing speedup.

The project also includes eight index definitions and ten performance analysis queries.

## Repository Structure

```text
banking-data-analytics-postgresql/
|
|-- README.md
|
|-- data/
|
|-- sql/
|   |-- 01_database_setup.sql
|   |-- 02_create_table.sql
|   |-- 03_import_data.sql
|   |-- 04_data_cleaning.sql
|   |-- 05_data_validation.sql
|   |-- 06_duplicate_removal.sql
|   |-- 07_reporting_views.sql
|   |-- 08_analysis_queries.sql
|   |-- 09_indexes.sql
|   |-- 10_performance_optimization.sql
|   |-- 11_stored_procedures.sql
|
|-- docs/
|
|-- reports/
|
|-- images/
```

## Running the SQL Project

Use PostgreSQL and pgAdmin 4 or another PostgreSQL SQL client.

Run the scripts in numerical order.

1. Create the database using 01_database_setup.sql.
2. Connect to the banking_analytics database.
3. Run 02_create_table.sql.
4. Update the CSV location in 03_import_data.sql.
5. Import the raw dataset once into an empty raw table.
6. Execute 04_data_cleaning.sql.
7. Review the validation checks in 05_data_validation.sql.
8. Execute 06_duplicate_removal.sql.
9. Create the reporting views using 07_reporting_views.sql.
10. Explore the analysis queries in 08_analysis_queries.sql.
11. Create indexes using 09_indexes.sql.
12. Inspect execution plans using 10_performance_optimization.sql.
13. Create the reporting functions using 11_stored_procedures.sql.

**Reproducibility notes:**

- The CSV import path is a placeholder and must be updated.
- PostgreSQL server-side COPY requires access to the file on the database server; pgAdmin import can be used for local CSV files.
- Do not import the raw CSV twice without checking the existing records.
- The SQL modules have been aligned with the updated three-table architecture, but a complete fresh-database execution test has not yet been documented.
- Reported metrics are based on the previously verified local PostgreSQL dataset.

## Skills Demonstrated

- PostgreSQL database design
- SQL data cleaning
- Data type conversion
- Data validation
- Missing-value analysis
- Duplicate detection with window functions
- Common Table Expressions
- Financial data aggregation
- Conditional aggregation
- Reusable SQL reporting views
- PostgreSQL reporting functions
- Database indexing
- EXPLAIN ANALYZE
- Query execution-plan interpretation
- GitHub documentation

## Project Limitations

- The dataset is simulated.
- Some client identifiers and financial values are missing.
- Financial data contains multiple currencies.
- No FX conversion has been applied.
- The cleaned schema does not contain verified customer risk classifications.
- Record counts are not automatically equivalent to distinct customer counts.
- Index-related performance improvement has not been established through controlled benchmarking.

## Future Enhancements

- Add automated SQL validation tests.
- Test the complete pipeline on a fresh database.
- Implement currency conversion using documented FX rates.
- Introduce additional normalized database tables.
- Benchmark index performance systematically.
- Extend customer and financial reporting with additional validated source data.

## Conclusion

This project demonstrates practical PostgreSQL and SQL skills through an end-to-end banking data analytics workflow.

The workflow transforms 25,500 simulated banking records into 24,998 deduplicated analytical records and supports reusable reporting, financial data-quality analysis, and query performance inspection.

---

**Author:** Faisal Kader

**GitHub:** https://github.com/faisalk8911/banking-data-analytics-postgresql
