
# Banking Performance Analysis Report

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This report analyzes bank-level record distribution, transaction amount summaries, and interest rates using PostgreSQL.

The objective is to demonstrate SQL-based banking performance reporting while identifying data-quality limitations that affect financial comparisons.

The final cleaned dataset contains 24,998 records and 11,676 unique identified clients.

## 2. Dataset Overview

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Final cleaned records | 24,998 |
| Duplicate rows removed | 502 |
| Unique identified clients | 11,676 |
| Bank categories | 6 |

The six categories include five named banks and one Unknown Bank category.

## 3. Bank-Level Record Distribution

| Bank | Cleaned Records |
|---|---:|
| Unknown Bank | 4,240 |
| BOFA | 4,226 |
| CITI | 4,214 |
| HSBC | 4,159 |
| CHASE | 4,145 |
| Wells Fargo | 4,014 |
| **Total** | **24,998** |

### Business Insight

The distribution of banking records is relatively balanced across the six categories.

Unknown Bank represents approximately 17% of the cleaned records, highlighting a significant data-quality concern.

These values represent record counts rather than distinct customer counts.

## 4. Recorded Transaction Amounts by Bank

| Bank | Sum of Recorded Amounts |
|---|---:|
| BOFA | 728,377,576.00 |
| CITI | 697,919,368.00 |
| Unknown Bank | 692,871,342.00 |
| CHASE | 692,329,068.00 |
| Wells Fargo | 681,074,161.00 |
| HSBC | 678,184,197.00 |

### Interpretation

BOFA has the highest unconverted sum of recorded transaction amounts in this dataset.

However, the source contains multiple currencies, including USD, BDT, EUR, and GBP.

Therefore, these bank-level sums must not be interpreted as comparable single-currency transaction volumes.

A reliable financial comparison would require either currency-specific analysis or consistent foreign-exchange conversion.

## 5. Average Interest Rate by Bank

The existing SQL analysis includes average interest rates grouped by bank.

The overall verified average interest rate is 6.99%.

The bank-level reporting view calculates averages using available non-NULL interest-rate values.

These averages describe the sample records and do not establish actual market interest rates or financial product pricing.

## 6. Data Quality Considerations

The analysis identified several reporting limitations:

- Missing client identifiers.
- Missing transaction amounts.
- Unknown bank classifications.
- Mixed transaction currencies.
- Missing interest rates.
- Incomplete maturity information.

Missing values are preserved rather than replaced with fabricated financial data.

## 7. Reusable PostgreSQL Reporting Views

The project includes:

- vw_bank_performance_v2
- vw_account_portfolio_v2
- vw_data_quality_v2
- vw_currency_summary_v2

These views support bank-level reporting, account analysis, data-quality monitoring, and currency-specific summaries.

## 8. SQL Techniques Demonstrated

The bank performance analysis uses:

- COUNT
- COUNT DISTINCT
- SUM
- AVG
- GROUP BY
- ORDER BY
- Conditional aggregation
- NULL handling
- CREATE OR REPLACE VIEW

## 9. Business Recommendations

1. Investigate records assigned to Unknown Bank.
2. Improve customer identifier completeness.
3. Report monetary values separately by currency.
4. Monitor missing transaction amounts.
5. Validate bank classifications during data import.
6. Compare financial performance only when consistent currency and reporting definitions are available.

## 10. Business Value

This project demonstrates practical SQL reporting skills relevant to:

- Financial data analysis.
- Banking operations.
- Customer data-quality assessment.
- Account portfolio reporting.
- Transaction data monitoring.
- Executive SQL reporting.

## 11. Conclusion

The PostgreSQL analysis demonstrates bank-level reporting across 24,998 cleaned banking records.

The results provide insights into record distribution, recorded transaction amounts, interest rates, and data-quality limitations.

The project showcases SQL aggregation, financial data interpretation, and reusable reporting techniques.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
