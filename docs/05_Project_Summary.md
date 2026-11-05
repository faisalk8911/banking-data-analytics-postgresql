
# Banking Data Analytics — Project Summary

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4, GitHub  
**Project Type:** Financial Data Cleaning and SQL Analytics

---

## Executive Summary

Developed an end-to-end PostgreSQL banking analytics solution using a simulated financial dataset.

The project involved data profiling, cleaning, validation, duplicate detection, financial data transformation, and SQL-based business reporting.

Starting with 25,500 raw banking records, the workflow identified and removed 502 duplicate rows, producing 24,998 cleaned records.

The project also includes 20 business-focused SQL queries, reusable PostgreSQL reporting views, SQL functions, indexing, and query execution analysis.

## Verified Project Results

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Final cleaned records | 24,998 |
| Duplicate rows removed | 502 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Sum of recorded amounts | 4,170,755,712.00 |
| Average recorded amount | 250,300.41 |
| Average interest rate | 6.99% |

**Financial reporting note:** Monetary aggregates include multiple currencies without FX conversion. They are not single-currency financial totals.

## SQL Data Cleaning

The project demonstrates:

- Missing-value detection and handling
- Text standardization
- Bank and account classification consistency
- Financial amount conversion
- Interest rate conversion
- Maturity date conversion and validation
- Duplicate detection using ROW_NUMBER()
- Preservation of legitimate repeated client IDs

## Banking Data Analysis

The SQL analysis covers:

- Bank performance
- Account portfolio composition
- Customer identification
- Transaction amount completeness
- Loan status distribution
- Currency-level reporting
- Maturity trends
- Executive KPI summaries

## Reusable PostgreSQL Reporting

Four reporting views were developed:

1. vw_bank_performance_v2
2. vw_account_portfolio_v2
3. vw_data_quality_v2
4. vw_currency_summary_v2

Five PostgreSQL reporting functions provide reusable access to customer details, bank transaction summaries, data quality, account portfolios, and executive KPIs.

## Query Performance Analysis

PostgreSQL execution plans were examined using:

EXPLAIN (ANALYZE, BUFFERS)

The analysis included query execution times, scan methods, aggregation operations, sorting, and buffer usage.

Indexing strategies were documented, but no measured performance improvement is claimed without comparative benchmarking.

## Business Value

The project demonstrates how SQL can help organizations:

- Identify financial data-quality problems
- Reduce duplicate reporting records
- Improve consistency in financial datasets
- Produce reusable business reports
- Analyze account and transaction activity
- Support data-driven business decisions

## Project Deliverables

- PostgreSQL database structure
- SQL data-import workflow
- Cleaning and validation scripts
- Deduplicated reporting dataset
- 20 SQL analysis queries
- Four reporting views
- Five PostgreSQL functions
- Index definitions
- Query performance analysis
- Technical documentation
- Upwork portfolio screenshots

## Conclusion

This project demonstrates practical SQL, PostgreSQL, data cleaning, validation, and financial analytics capabilities.

The verified workflow transforms 25,500 simulated banking records into 24,998 cleaned analytical records suitable for SQL reporting and data-quality monitoring.

---

**Author:** Faisal Kader

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
