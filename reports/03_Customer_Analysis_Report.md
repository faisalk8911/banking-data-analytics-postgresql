
# Banking Customer Analysis Report

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This report examines customer-related banking records using PostgreSQL.

The analysis focuses on customer identification, bank distribution, account portfolios, transaction information, and data completeness.

The final cleaned dataset contains 24,998 records and 11,676 unique identified clients.

## 2. Verified Dataset Summary

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Final cleaned records | 24,998 |
| Duplicate rows removed | 502 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |

Unique identified clients are counted using distinct non-empty client IDs.

Records with missing client IDs are excluded from this distinct-client count.

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

Bank-level record volumes are relatively balanced.

The Unknown Bank category contains 4,240 records, representing a significant data completeness concern.

These figures represent banking records, not distinct customers at each bank.

## 4. Customer Identification

The dataset contains 11,676 distinct identified clients.

However, many source records have missing client identifiers.

This creates limitations when attempting to:

- Measure individual customer activity.
- Identify multiple accounts belonging to one person.
- Analyze customer-level transaction behavior.
- Track relationships across different banks.

### Recommendation

Improve client ID completeness before using the dataset for detailed customer-level segmentation.

## 5. Account Portfolio Analysis

The dataset includes the following account categories:

- Loan
- Current
- Investment
- Savings

PostgreSQL queries are used to examine:

- Number of records by account type.
- Number of distinct identified clients.
- Available transaction amounts.
- Average recorded transaction amounts.

These measures help demonstrate account portfolio reporting.

## 6. Currency Distribution

The dataset includes:

- BDT
- EUR
- GBP
- USD
- Unknown currency values

Currency-aware reporting is essential.

Transaction amounts from different currencies should not be interpreted as directly comparable monetary totals without foreign-exchange conversion.

## 7. Loan Status Analysis

Loan status information supports SQL reporting across categories such as:

- Approved
- Pending
- Rejected
- Unknown

These categories are useful for analyzing record distributions and identifying missing loan status information.

The dataset does not establish individual customer creditworthiness or actual lending decisions.

## 8. Transaction Data Analysis

| Metric | Verified Result |
|---|---:|
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Sum of recorded amounts | 4,170,755,712.00 |
| Average recorded amount | 250,300.41 |

These amounts include multiple currencies.

The combined figures represent raw SQL aggregates, not converted single-currency financial totals.

## 9. Customer Data Quality

Key data-quality concerns include:

- Missing client identifiers.
- Missing financial amounts.
- Unknown bank classifications.
- Missing account information.
- Incomplete contact details.

These limitations should be considered when interpreting customer analytics.

## 10. SQL Techniques Demonstrated

The analysis uses:

- COUNT and COUNT DISTINCT
- GROUP BY
- ORDER BY
- SUM and AVG
- Conditional aggregation
- NULL handling
- Reusable PostgreSQL reporting views

## 11. Business Recommendations

1. Improve the completeness of customer identifiers.
2. Investigate records with unknown bank names.
3. Monitor transaction amount completeness.
4. Maintain consistent account classifications.
5. Report monetary figures separately by currency.
6. Use distinct customer counts rather than record counts for customer-level metrics.

## 12. Conclusion

The project demonstrates customer-related SQL analytics using a cleaned PostgreSQL dataset.

The analysis identifies 11,676 unique clients within 24,998 banking records while highlighting data completeness limitations.

The resulting SQL workflow supports customer reporting, account portfolio analysis, and financial data-quality monitoring.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
