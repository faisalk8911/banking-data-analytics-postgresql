
# End-to-End Banking Data Analytics with PostgreSQL

**SQL Data Cleaning | Data Quality | Financial Reporting | PostgreSQL Views | Query Performance Analysis**

> **Portfolio case study:** A simulated banking dataset transformed into a validated, analysis-ready SQL reporting table. This project focuses on PostgreSQL and SQL; Power BI dashboards are presented separately.

## Project Overview

This project demonstrates how to profile, standardize, validate, and analyze imperfect banking data using PostgreSQL.

Starting with 25,500 source records, the updated workflow preserves the raw input, works in a staging table, converts financial and date fields, removes exact duplicates, and exposes cleaned records for banking and account-level reporting.

**Verified outcome:** 24,998 cleaned rows after removing 502 duplicate rows. The previous README counts (24,997 / 503) have been corrected based on SQL verification against the rebuilt dataset.

## Key Results

| Measure | Verified Result |
|---|---:|
| Raw records | 25,500 |
| Staging records | 25,500 |
| Exact duplicate rows removed | 502 |
| Final cleaned records | **24,998** |
| Distinct non-null client IDs | 11,676 |
| Records with valid transaction amounts | 16,663 |
| Records without transaction amounts | 8,335 |
| Sum of available transaction amounts* | 4,170,755,712.00 |
| Average non-null transaction amount* | 250,300.41 |
| Average non-null interest rate | 6.99% |

**Currency caveat:** Source records include multiple currencies, including USD, BDT, GBP, and EUR. The aggregate and average above were calculated without foreign-exchange conversion. These are useful SQL consistency metrics, not meaningful single-currency bank-wide financial totals. Production reporting should aggregate by currency or apply documented FX rates.

## Business Problem

Financial reporting from raw operational records is often complicated by:

- Missing customer identifiers and transaction amounts
- Inconsistent casing, whitespace, and placeholder values
- Currency symbols embedded in numeric fields
- Interest rates stored as text with irregular separators
- Multiple date formats
- Duplicate rows, distinct from legitimate repeated client transactions

The objective was to retain legitimate transactions while creating an understandable and repeatable data preparation and reporting process.

## Architecture and Workflow

```text
banking_transactions_raw
25,500 original records
           |
           v
banking_transactions_staging
25,500 working records
           |
           v
Data Cleaning and Standardization
- Trim whitespace
- Convert blanks to NULL
- Standardize bank and account labels
- Normalize currency and loan status
           |
           v
Data Type Conversion
- Transaction amounts to NUMERIC
- Interest rates to NUMERIC
- Maturity dates to DATE
           |
           v
Data Validation
- Missing values
- Numeric conversion checks
- Date format checks
           |
           v
Duplicate Detection and Removal
- ROW_NUMBER()
- Remove 502 exact duplicates
- Preserve legitimate repeated client IDs
           |
           v
banking_transactions_clean_v2
24,998 cleaned records
           |
           v
Business SQL Analytics
- Bank performance
- Account portfolio
- Financial data quality
           |
           v
PostgreSQL Reporting Views
vw_bank_performance_v2
           |
           v
EXPLAIN (ANALYZE, BUFFERS)
Query Performance Analysis
           |
           v
Financial Reporting and Insights
```

The original `banking_transactions` table contained 11,677 rows during the rebuild and was not overwritten. It is a legacy table with a different schema and should not be confused with `banking_transactions_clean_v2`.

## Raw Data Quality Assessment

SQL checks on the 25,500-row original dataset returned:

| Data Quality Issue | Records | Approx. Percentage |
|---|---:|---:|
| Missing client IDs | 12,726 | 49.9% |
| Missing transaction amounts | 8,505 | 33.4% |
| Missing bank names | 4,325 | 17.0% |
| Missing maturity dates | 6,380 | 25.0% |

Missing data was identified and preserved where appropriate rather than inventing customer identifiers or financial amounts.

## Data Cleaning and Standardization

The cleaning process included:

- Trimming whitespace and converting blank strings to SQL `NULL`
- Standardizing customer and account names
- Normalizing bank names and assigning `Unknown Bank` for missing values
- Standardizing currency codes and loan statuses
- Converting transaction amounts into `NUMERIC(15,2)`
- Converting interest rates into `NUMERIC(6,2)`
- Converting maturity dates into PostgreSQL `DATE`

Interest-rate text containing embedded spaces was interpreted using a documented assumption that those spaces represented decimal separators.

Three date formats were supported:

- `DD-MM-YYYY`
- `YYYY.MM.DD`
- `MM/DD/YYYY`

## Data Validation Results

| Validation Metric | Result |
|---|---:|
| Original records preserved in staging | 25,500 |
| Valid transaction amounts before deduplication | 16,995 |
| Missing transaction amounts before deduplication | 8,505 |
| Converted interest rates | 12,600 |
| Missing interest rates | 12,900 |
| Unconverted interest rates | 0 |
| Converted maturity dates | 19,120 |
| Missing maturity dates | 6,380 |
| Date representation mismatches | 0 |

These checks helped establish data consistency before final duplicate removal and reporting.

## Duplicate Detection and Removal

Duplicate records can distort transaction totals, customer counts, and financial reporting.

This project uses PostgreSQL window functions to identify duplicate rows while preserving legitimate repeated transactions.

### Verified Results

| Metric | Records |
|---|---:|
| Original records | 25,500 |
| Exact duplicate rows removed | 502 |
| Final cleaned records | 24,998 |

Duplicate identification considered all 12 source business columns after standardization.

Repeated `client_id` values alone were not considered duplicates because a customer may legitimately have multiple accounts or transactions.

## Financial Data Analysis

### Final Banking KPIs

| KPI | Value |
|---|---:|
| Clean records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Sum of recorded transaction amounts* | 4,170,755,712.00 |
| Average recorded transaction amount* | 250,300.41 |
| Average interest rate | 6.99% |

*Transaction amounts include multiple currencies without FX conversion.*

### Bank Performance Analysis

| Bank | Clean Records | Sum of Recorded Amounts* |
|---|---:|---:|
| BOFA | 4,226 | 728,377,576.00 |
| CITI | 4,214 | 697,919,368.00 |
| Unknown Bank | 4,240 | 692,871,342.00 |
| CHASE | 4,145 | 692,329,068.00 |
| Wells Fargo | 4,014 | 681,074,161.00 |
| HSBC | 4,159 | 678,184,197.00 |

*These are unconverted mixed-currency sums, not comparable bank revenue or true single-currency transaction volumes.*

The `Unknown Bank` category identifies an opportunity to improve source data completeness.

### Account Portfolio Analysis

SQL queries analyze financial records across:

- Loan accounts
- Investment accounts
- Current accounts
- Savings accounts

The analysis includes transaction record counts, distinct identified clients, valid transaction amounts, and financial aggregations by account type.

Record counts are not automatically equivalent to unique customer counts.

## Reusable PostgreSQL Reporting Views

A reusable bank performance view was created to simplify financial reporting.

```sql
CREATE OR REPLACE VIEW vw_bank_performance_v2 AS
SELECT
    bank_name,
    COUNT(*) AS total_records,
    COUNT(
        DISTINCT NULLIF(TRIM(client_id), '')
    ) AS unique_clients,
    ROUND(SUM(transaction_amount), 2)
        AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2
GROUP BY bank_name;
```

### Execute the Reporting View

```sql
SELECT *
FROM vw_bank_performance_v2
ORDER BY total_transaction_amount DESC;
```

The view supports repeatable SQL reporting without rewriting aggregation queries.

Monetary aggregations retain the mixed-currency limitation described above.

## SQL Query Performance Analysis

PostgreSQL execution performance was inspected using:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    bank_name,
    COUNT(*) AS total_records,
    ROUND(SUM(transaction_amount), 2)
        AS total_transaction_amount
FROM banking_transactions_clean_v2
WHERE transaction_amount IS NOT NULL
GROUP BY bank_name
ORDER BY total_transaction_amount DESC;
```

### Execution Plan Results

| Metric | Result |
|---|---:|
| Execution time | 8.155 ms |
| Planning time | 0.913 ms |
| Non-null transaction rows examined | 16,663 |
| Rows excluded by filter | 8,335 |
| Shared buffer hits | 384 |

The execution plan included:

- Sequential scanning
- Hash aggregation
- Sorting
- Buffer utilization analysis
- Query planning and execution time measurements

These results demonstrate execution-plan analysis, not a verified performance improvement. Any claim of indexing-related speedup requires controlled before-and-after benchmarking.

## Sample SQL Queries

### Verify the Final Cleaned Dataset

```sql
SELECT
    COUNT(*) AS final_records,
    COUNT(
        DISTINCT NULLIF(TRIM(client_id), '')
    ) AS unique_clients,
    COUNT(transaction_amount) AS non_null_amounts,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS avg_recorded_amount,
    ROUND(AVG(interest_rate), 2)
        AS avg_interest_rate
FROM banking_transactions_clean_v2;
```

### Data Quality Analysis by Bank

```sql
SELECT
    COALESCE(
        NULLIF(TRIM(bank_name), ''),
        'Unknown Bank'
    ) AS bank_name,
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE client_id IS NULL
    ) AS missing_client_ids,
    COUNT(*) FILTER (
        WHERE transaction_amount IS NULL
    ) AS missing_amounts,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE transaction_amount IS NULL
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS missing_amount_pct
FROM banking_transactions_clean_v2
GROUP BY 1
ORDER BY missing_amount_pct DESC;
```

## Repository Structure

```text
banking-data-analytics-postgresql/
|
|-- README.md
|-- LICENSE
|
|-- data/
|   |-- raw/
|   |-- cleaned/
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

### Reproducibility Note

Some existing SQL modules were originally written for the legacy `banking_transactions` schema.

The verified rebuild uses:

- `banking_transactions_raw`
- `banking_transactions_staging`
- `banking_transactions_clean_v2`

The legacy scripts still require synchronization before this repository can be described as fully reproducible from a fresh database.

The CSV-import example also contains a placeholder path that must be replaced or parameterized.

## Technologies and Skills

- PostgreSQL
- SQL
- pgAdmin 4
- Data Cleaning
- Data Validation
- Data Transformation
- Financial Data Analysis
- SQL Reporting
- Common Table Expressions
- Window Functions
- Conditional Aggregation
- Regular Expressions
- PostgreSQL Reporting Views
- Query Execution Plan Analysis
- Git and GitHub

## Portfolio Deliverables

The separate Upwork portfolio includes:

1. Banking Data Analytics Workflow
2. Bank Performance SQL Analysis
3. Financial Risk and Data Quality Analysis
4. Account Portfolio Analysis
5. PostgreSQL Reporting View
6. SQL Query Performance Analysis
7. Executive Financial Analysis Report

These demonstrate the transformation of raw financial records into structured SQL analytics and reusable financial reporting.

## Future Improvements

- Align legacy SQL scripts with the rebuilt database workflow
- Publish a fully reproducible SQL cleaning pipeline
- Add automated data-quality tests
- Add currency-aware financial reporting
- Benchmark indexing and query-performance improvements
- Expand the relational database architecture if required

## License and Attribution

This project uses a simulated banking dataset for educational and portfolio demonstration purposes.

The repository is released under its existing license.

**Author:** Faisal Kader

**GitHub:** https://github.com/faisalk8911/banking-data-analytics-postgresql
