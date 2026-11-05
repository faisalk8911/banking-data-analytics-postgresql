
# PostgreSQL Query Performance Analysis Report

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Tools:** PostgreSQL, SQL, pgAdmin 4

---

## 1. Executive Summary

This report documents PostgreSQL query performance analysis techniques used in the Banking Data Analytics project.

The objective is to examine query execution plans, understand database processing behavior, and evaluate indexing strategies for financial reporting.

The project uses EXPLAIN (ANALYZE, BUFFERS) to inspect execution times, scan operations, aggregation, and buffer utilization.

Although indexing strategies have been developed, performance improvements have not yet been established through controlled before-and-after benchmarking.

## 2. Project Overview

| Metric | Result |
|---|---:|
| Final cleaned records | 24,998 |
| SQL modules | 11 |
| Business analysis queries | 20 |
| Reporting views | 4 |
| PostgreSQL reporting functions | 5 |
| Performance analysis queries | 10 |

## 3. Database Indexing Strategy

The project includes index definitions for the final cleaned table, banking_transactions_clean_v2.

| Indexed Column | Purpose |
|---|---|
| client_id | Customer lookup |
| bank_name | Bank filtering |
| account_type | Account analysis |
| currency | Currency filtering |
| loan_status | Loan status filtering |
| transaction_amount | Financial amount sorting |
| maturity_date | Date range filtering |
| bank_name, currency | Combined bank and currency filtering |

Indexes may improve selected queries depending on query selectivity, table size, and PostgreSQL planner estimates.

They also introduce storage and write-maintenance overhead.

## 4. PostgreSQL Performance Analysis

The project uses:

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

This command provides information about:

- Query execution methods
- Actual execution time
- Planning time
- Rows processed
- Rows filtered
- Shared buffer usage
- Aggregation operations

## 5. Recorded Query Execution Results

A previously recorded bank aggregation execution plan produced:

| Performance Metric | Recorded Result |
|---|---:|
| Planning time | 0.913 ms |
| Execution time | 8.155 ms |
| Non-NULL transaction rows processed | 16,663 |
| Rows removed by filter | 8,335 |
| Shared buffer hits | 384 |

These figures represent one recorded execution-plan measurement, not a multi-run benchmark.

The values may change depending on hardware, database configuration, caching, and query execution conditions.

## 6. Query Performance Tests

The project includes ten performance analysis queries covering:

1. Customer lookup.
2. Bank filtering.
3. Bank and currency filtering.
4. Maturity date filtering.
5. Approved loan status filtering.
6. Top recorded transaction amounts.
7. Bank-level aggregation.
8. Average interest rate by bank.
9. Monthly maturity analysis.
10. Executive KPI aggregation.

These tests examine different query patterns commonly used in financial analytics.

## 7. Index Usage Considerations

PostgreSQL may select different execution methods, including:

- Sequential Scan
- Index Scan
- Bitmap Index Scan
- HashAggregate
- GroupAggregate
- Sort

An index is not necessarily used for every query.

Sequential scans can be efficient when a query processes a large proportion of a relatively small table.

## 8. Reusable Reporting Views

Four reporting views support SQL analytics:

- vw_bank_performance_v2
- vw_account_portfolio_v2
- vw_data_quality_v2
- vw_currency_summary_v2

Standard PostgreSQL views simplify reusable reporting logic.

They do not automatically store query results or guarantee faster execution.

## 9. PostgreSQL Functions

Five reusable reporting functions support:

- Customer details
- Bank financial summaries by currency
- Data quality reporting
- Account portfolio analysis
- Executive KPI reporting

Functions help organize reusable SQL calculations and reporting logic.

## 10. Performance Benchmarking Limitations

The existing execution-plan results demonstrate performance inspection but do not establish a verified speed improvement.

A controlled optimization assessment should:

1. Record baseline query performance.
2. Apply an index or SQL optimization.
3. Repeat the same query under comparable conditions.
4. Compare execution times and buffer usage.
5. Evaluate the effect of caching and query planner behavior.

Repeated measurements are preferable to relying on a single execution.

## 11. Recommended Future Enhancements

Potential enhancements include:

- Controlled indexing benchmarks
- Query performance monitoring
- Statistics maintenance
- Selective use of materialized views
- Automated regression testing
- Index usage monitoring
- Review of unnecessary indexes

These improvements should be evaluated based on measured performance and workload requirements.

## 12. Business Value

The project demonstrates practical skills in:

- PostgreSQL query execution analysis
- Index design
- SQL performance inspection
- Financial reporting queries
- Database statistics interpretation
- Reusable SQL development
- Technical documentation

## 13. Conclusion

The PostgreSQL Banking Analytics project demonstrates database performance analysis using a verified dataset of 24,998 cleaned records.

Indexing strategies, execution-plan inspection, and reusable reporting techniques provide a foundation for future performance optimization.

Measured speed improvements should only be reported after comparative benchmarking.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
