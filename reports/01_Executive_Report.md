
# Executive Report
## End-to-End Banking Data Analytics with PostgreSQL

**Author:** Faisal Kader  
**Database:** banking_analytics  
**Tools:** PostgreSQL, SQL, pgAdmin 4  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This project demonstrates an end-to-end SQL analytics workflow for banking and financial data.

The objective was to transform a raw banking dataset into a structured, deduplicated, and analysis-ready PostgreSQL database.

The project involved data profiling, cleaning, standardization, validation, duplicate detection, SQL business analysis, reporting views, and query performance analysis.

The original dataset contained 25,500 records. After removing 502 exact duplicate rows, the final cleaned dataset contains 24,998 records.

## 2. Verified Project Results

| Metric | Result |
|---|---:|
| Original Records | 25,500 |
| Final Cleaned Records | 24,998 |
| Duplicate Rows Removed | 502 |
| Unique Identified Clients | 11,676 |
| Valid Transaction Amounts | 16,663 |
| Missing Transaction Amounts | 8,335 |
| Sum of Recorded Amounts | 4,170,755,712.00 |
| Average Recorded Amount | 250,300.41 |
| Average Interest Rate | 6.99% |

**Important:** Financial amounts include multiple currencies without foreign-exchange conversion. Combined monetary figures are SQL aggregate metrics, not single-currency financial totals.

## 3. Initial Data Quality Findings

The original banking dataset contained several data-quality issues.

| Issue | Affected Records |
|---|---:|
| Missing Client IDs | 12,726 |
| Missing Transaction Amounts | 8,505 |
| Missing Bank Names | 4,325 |
| Missing Maturity Dates | 6,380 |

These findings demonstrate the importance of data validation before financial analysis.

## 4. Data Cleaning and Transformation

The PostgreSQL cleaning workflow included:

- Standardizing customer and bank information.
- Removing unnecessary whitespace.
- Converting empty text values into SQL NULL.
- Normalizing account types and currency codes.
- Converting transaction amounts into numeric values.
- Converting interest rates into numeric values.
- Converting maturity dates into PostgreSQL DATE values.
- Identifying and removing duplicate records.

The original raw dataset was preserved throughout the cleaning process.

## 5. Banking Performance Analysis

SQL queries were developed to analyze transaction records across banking institutions.

### Bank-Level Results

| Bank | Clean Records |
|---|---:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,145 |
| Wells Fargo | 4,014 |

### Key Finding

The Unknown Bank category contains 4,240 records, highlighting a significant opportunity to improve source-data completeness.

## 6. Account Portfolio Analysis

The project examines banking records across:

- Loan accounts
- Current accounts
- Savings accounts
- Investment accounts

SQL queries evaluate record distributions, unique identified clients, available transaction amounts, and interest rates.

These analyses support banking operations and financial data reporting.

## 7. Data Quality Analysis

A reusable SQL analysis identifies missing customer identifiers and transaction amounts by bank.

The results help identify:

- Incomplete customer information.
- Missing financial values.
- Differences in data completeness across banks.
- Potential reporting limitations.

Missing financial values were preserved instead of being replaced with invented transaction amounts.

## 8. SQL Reporting Views

The project includes reusable PostgreSQL reporting views:

- vw_bank_performance_v2
- vw_account_portfolio_v2
- vw_data_quality_v2
- vw_currency_summary_v2

These views simplify recurring financial reporting.

## 9. PostgreSQL Functions

Five reusable functions were developed for:

- Customer lookup.
- Bank transaction analysis by currency.
- Data quality reporting.
- Account portfolio analysis.
- Executive KPI summaries.

This modular approach makes SQL reporting easier to maintain.

## 10. Query Performance Analysis

PostgreSQL query execution was examined using:

EXPLAIN (ANALYZE, BUFFERS)

One recorded execution plan produced:

| Metric | Result |
|---|---:|
| Execution Time | 8.155 ms |
| Planning Time | 0.913 ms |
| Non-NULL Transaction Rows Examined | 16,663 |
| Rows Excluded by Filter | 8,335 |
| Shared Buffer Hits | 384 |

These results demonstrate SQL execution-plan analysis.

No performance improvement is claimed without controlled before-and-after benchmarking.

## 11. Business Value

This project demonstrates how PostgreSQL can support:

- Financial data cleaning.
- Data quality monitoring.
- Duplicate detection.
- Banking transaction analysis.
- Account portfolio reporting.
- Reusable SQL business reports.
- Financial data validation.
- Executive reporting.

## 12. Conclusion

The project successfully transformed 25,500 simulated banking records into 24,998 deduplicated records.

It demonstrates practical PostgreSQL, SQL development, financial data preparation, reporting, and query performance analysis skills.

The resulting dataset provides a foundation for reusable banking analytics and data-quality reporting.

---

**Author:** Faisal Kader

**GitHub Repository:**  
https://github.com/faisalk8911/banking-data-analytics-postgresql
