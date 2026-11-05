
# SQL Business Analysis and Query Results

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Source Table:** banking_transactions_clean_v2

---

## 1. Executive Summary

This document summarizes 20 business-focused PostgreSQL analysis queries developed for a simulated banking dataset.

The queries cover data quality, customer identification, bank performance, account portfolios, interest rates, loan statuses, currencies, maturity dates, and executive reporting.

The final cleaned dataset contains 24,998 records after removing 502 duplicate rows.

Only previously verified numerical results are presented. Other analyses are documented with their business purpose and SQL reporting methodology.

## 2. Verified Dataset Summary

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

**Currency limitation:** Financial amounts include multiple currencies without foreign-exchange conversion. Combined totals are SQL consistency metrics, not single-currency financial totals.

---

## 3. SQL Query Analysis

### Query 01 — Total Cleaned Records

**Business Question:** How many records remain after duplicate removal?

**Verified Result:** 24,998 records.

### Query 02 — Unique Identified Clients

**Business Question:** How many distinct non-empty client identifiers exist?

**Verified Result:** 11,676 identified clients.

This excludes records without client IDs.

### Query 03 — Transaction Amount Completeness

**Business Question:** How complete is the financial amount data?

| Metric | Result |
|---|---:|
| Total records | 24,998 |
| Valid amounts | 16,663 |
| Missing amounts | 8,335 |

Missing financial values are retained as NULL.

### Query 04 — Overall Financial Data Summary

**Business Question:** What are the aggregate characteristics of recorded transaction amounts?

| Metric | Verified Result |
|---|---:|
| Sum of recorded amounts | 4,170,755,712.00 |
| Average recorded amount | 250,300.41 |

Highest and lowest recorded amounts are also calculated by the SQL query.

Mixed-currency amounts should not be used for direct financial comparisons.

### Query 05 — Average Interest Rate

**Business Question:** What is the average recorded interest rate?

**Verified Result:** 6.99%.

The query also calculates minimum and maximum recorded rates.

### Query 06 — Records and Unique Clients by Bank

**Business Question:** How are banking records and identified clients distributed across banks?

| Bank | Cleaned Records |
|---|---:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,145 |
| Wells Fargo | 4,014 |
| **Total** | **24,998** |

These are record counts, not distinct customer counts.

The SQL query separately calculates distinct identified clients by bank.

### Query 07 — Bank Performance Analysis

**Business Question:** How do recorded transaction amount aggregates differ by bank?

| Bank | Sum of Recorded Amounts |
|---|---:|
| BOFA | 728,377,576.00 |
| CITI | 697,919,368.00 |
| Unknown Bank | 692,871,342.00 |
| CHASE | 692,329,068.00 |
| Wells Fargo | 681,074,161.00 |
| HSBC | 678,184,197.00 |

The results represent unconverted mixed-currency amounts, so comparisons require caution.

### Query 08 — Account Portfolio Distribution

**Business Question:** How are records and identified clients distributed across account types?

The SQL query groups records by account type and calculates both record counts and distinct client counts.

Account classifications include Loan, Current, Investment, and Savings.

### Query 09 — Account Portfolio Financial Analysis

**Business Question:** What transaction amount information is available for each account category?

The SQL query calculates:

- Valid transaction amount counts.
- Sums of recorded amounts.
- Average recorded amounts.

Currency limitations apply to combined financial aggregates.

### Query 10 — Average Interest Rate by Bank

**Business Question:** How do average interest rates vary across banks?

The SQL query calculates the number of non-NULL interest rates and their average for each bank.

The overall verified average interest rate is 6.99%.

### Query 11 — Missing Client IDs by Bank

**Business Question:** Which bank categories have the greatest customer identification gaps?

The SQL query calculates:

- Total records.
- Missing client IDs.
- Percentage of missing identifiers.

This supports customer data-quality monitoring.

### Query 12 — Loan Status Distribution

**Business Question:** How are recorded loan statuses distributed?

The SQL query groups records by loan status and calculates category percentages.

It does not claim to count distinct loan applications.

### Query 13 — Currency Distribution

**Business Question:** Which currencies appear in the banking dataset?

The dataset includes:

- BDT
- EUR
- GBP
- USD
- Unknown currency values

The query calculates record counts for each currency classification.

### Query 14 — Financial Summary by Currency

**Business Question:** What financial amount summaries can be produced separately by currency?

The SQL query calculates valid transaction counts, sums, and averages grouped by currency.

Currency-specific aggregation avoids combining incompatible monetary units.

### Query 15 — Top 10 Recorded Transaction Amounts

**Business Question:** Which records have the largest numeric transaction amounts?

The query retrieves the ten highest recorded numeric amounts with client, bank, and currency details.

These values should not be interpreted as a currency-adjusted ranking.

### Query 16 — Monthly Maturity Distribution

**Business Question:** How are maturity dates distributed across calendar months?

The SQL query groups records by month using DATE_TRUNC.

This represents maturity-date analysis, not account creation trends.

### Query 17 — Average Transaction by Bank and Currency

**Business Question:** How do average recorded amounts vary across bank and currency combinations?

The query calculates non-NULL transaction counts and average amounts for each bank-currency group.

### Query 18 — Average Transaction by Account and Currency

**Business Question:** How do recorded transaction averages vary across account types and currencies?

The query groups records by account category and currency to provide more meaningful financial comparisons.

### Query 19 — Banking Data Quality by Bank

**Business Question:** Which banks have the highest proportion of missing transaction amounts?

The query calculates:

- Total records.
- Missing client identifiers.
- Missing financial amounts.
- Percentage of missing transaction amounts.

This supports targeted data-quality improvements.

### Query 20 — Executive SQL KPI Summary

**Business Question:** What are the main dataset and financial data-quality indicators?

| KPI | Verified Result |
|---|---:|
| Cleaned records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Sum of recorded amounts | 4,170,755,712.00 |
| Average recorded amount | 250,300.41 |
| Average interest rate | 6.99% |

Monetary aggregates are unconverted mixed-currency metrics.

---

## 4. SQL Techniques Demonstrated

The 20 analysis queries demonstrate:

- COUNT and COUNT DISTINCT
- SUM and AVG
- MIN and MAX
- GROUP BY and ORDER BY
- NULL handling
- Conditional aggregation using FILTER
- Window-based percentage calculations
- DATE_TRUNC
- Financial data-quality analysis
- Currency-aware reporting

## 5. Key Business Findings

### Customer Identification

The dataset contains 11,676 distinct identified clients. Missing identifiers limit individual customer-level analysis.

### Bank Classification

Unknown Bank contains 4,240 records, highlighting an opportunity to improve source-data quality.

### Financial Completeness

8,335 final records have missing transaction amounts.

### Currency Reporting

Multiple currencies require separate aggregation or documented FX conversion.

### Analytical Readiness

The cleaned dataset provides a basis for reusable SQL analysis, with its remaining data-quality limitations documented.

## 6. Limitations

- The dataset is simulated.
- Some customer identifiers are missing.
- Financial amount data is incomplete.
- Multiple currencies have not been converted.
- No verified customer risk classification exists in the final table.
- Record counts do not necessarily represent unique customers or loan applications.

## 7. Conclusion

The 20 SQL queries demonstrate PostgreSQL data analysis across 24,998 cleaned banking records.

The project covers financial data quality, customer identification, bank reporting, account analysis, interest rates, maturity analysis, and executive KPIs.

These examples demonstrate SQL development, analytical interpretation, and business reporting skills.

---

**Author:** Faisal Kader

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
