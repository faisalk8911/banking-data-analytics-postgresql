
# Banking Loan Status Analysis Report

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This report describes SQL-based loan-status analysis using a cleaned banking dataset.

The objective is to examine loan-status distributions, demonstrate PostgreSQL reporting techniques, and identify data-quality limitations relevant to lending analysis.

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

## 3. Loan Status Categories

The dataset includes loan-status values such as:

- Approved
- Pending
- Rejected
- Unknown

These categories describe recorded loan statuses rather than verified unique loan applications or distinct customers.

The current SQL analysis groups records by loan_status and calculates their distributions.

## 4. Loan Status Analysis

PostgreSQL supports loan-status analysis using the following query:

```sql
SELECT
    COALESCE(loan_status, 'Unknown') AS loan_status,
    COUNT(*) AS total_records,
    ROUND(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS percentage
FROM banking_transactions_clean_v2
GROUP BY COALESCE(loan_status, 'Unknown')
ORDER BY total_records DESC;
```

This query calculates record counts and percentage shares for each loan-status category.

It does not calculate the number of distinct loan applications because the dataset does not contain a verified loan application identifier.

## 5. Approved Loan Status

Records marked Approved can be grouped and analyzed to understand their distribution within the dataset.

However, an Approved label alone does not establish loan disbursement, profitability, or credit quality.

## 6. Pending Loan Status

Records marked Pending can be monitored to identify their share of the reporting dataset.

Additional application dates, decision dates, and workflow information would be required to measure processing times or operational delays.

## 7. Rejected Loan Status

Records marked Rejected can be counted and compared with other status categories.

The dataset does not establish the reasons for rejection.

Credit policy, income assessment, and application decision information would be needed to investigate rejection causes.

## 8. Unknown Loan Status

Unknown loan-status values create reporting limitations.

These records may require:

- Source-data investigation
- Improved status validation
- Additional application information
- Consistent category definitions

## 9. Data Quality Considerations

The analysis is affected by:

- Missing client identifiers
- Missing transaction amounts
- Unknown or missing loan statuses
- Lack of verified loan application IDs
- Limited application lifecycle information

These limitations should be considered before interpreting the results as actual lending performance.

## 10. SQL Skills Demonstrated

The project demonstrates:

- COUNT and GROUP BY
- Conditional NULL handling
- Percentage calculations
- Window functions
- ORDER BY
- Reusable SQL analysis
- Data-quality reporting

## 11. Recommendations

1. Standardize loan-status values during data entry.
2. Investigate missing or unknown statuses.
3. Introduce unique loan application identifiers.
4. Record application and decision dates.
5. Track loan amounts separately from general transaction values.
6. Add repayment and delinquency information for deeper portfolio analysis.
7. Validate loan-status reporting against source systems.

## 12. Conclusion

The PostgreSQL project demonstrates how SQL can analyze recorded loan statuses within 24,998 cleaned banking records.

The analysis supports category distribution reporting while identifying additional information needed for meaningful lending performance and credit risk assessment.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
