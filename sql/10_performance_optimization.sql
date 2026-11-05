
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 10_performance_optimization.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Evaluate PostgreSQL query execution performance.
--
-- Source table: banking_transactions_clean_v2
-- Verified records: 24,998
--
-- Techniques:
-- EXPLAIN ANALYZE
-- Buffer utilization analysis
-- Index and sequential scan inspection
-- Aggregation and sorting analysis
--
-- IMPORTANT:
-- These tests inspect performance. They do not prove
-- optimization unless benchmark comparisons are made.
-- ============================================================


-- ============================================================
-- TEST 1: CUSTOMER LOOKUP
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    client_name,
    bank_name,
    account_type
FROM banking_transactions_clean_v2
WHERE client_id = '70435';


-- ============================================================
-- TEST 2: BANK NAME FILTER
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM banking_transactions_clean_v2
WHERE bank_name = 'HSBC';


-- ============================================================
-- TEST 3: BANK AND CURRENCY FILTER
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    bank_name,
    currency,
    transaction_amount
FROM banking_transactions_clean_v2
WHERE bank_name = 'CHASE'
  AND currency = 'USD';


-- ============================================================
-- TEST 4: MATURITY DATE RANGE
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    bank_name,
    maturity_date
FROM banking_transactions_clean_v2
WHERE maturity_date >= DATE '2025-01-01'
  AND maturity_date < DATE '2026-01-01';


-- ============================================================
-- TEST 5: APPROVED LOANS
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    bank_name,
    loan_status,
    transaction_amount
FROM banking_transactions_clean_v2
WHERE loan_status = 'Approved';


-- ============================================================
-- TEST 6: TOP 10 TRANSACTION AMOUNTS
-- ============================================================

-- Includes currency to prevent misleading
-- single-currency interpretations.

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    client_name,
    bank_name,
    currency,
    transaction_amount
FROM banking_transactions_clean_v2
WHERE transaction_amount IS NOT NULL
ORDER BY transaction_amount DESC
LIMIT 10;


-- ============================================================
-- TEST 7: BANK PERFORMANCE AGGREGATION
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    bank_name,
    COUNT(*) AS total_records,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts
FROM banking_transactions_clean_v2
WHERE transaction_amount IS NOT NULL
GROUP BY bank_name
ORDER BY sum_of_recorded_amounts DESC;


-- ============================================================
-- TEST 8: AVERAGE INTEREST RATE BY BANK
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    bank_name,
    COUNT(interest_rate) AS valid_rates,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2
GROUP BY bank_name;


-- ============================================================
-- TEST 9: MONTHLY MATURITY ANALYSIS
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    DATE_TRUNC('month', maturity_date)::DATE
        AS maturity_month,
    COUNT(*) AS total_records
FROM banking_transactions_clean_v2
WHERE maturity_date IS NOT NULL
GROUP BY DATE_TRUNC('month', maturity_date)
ORDER BY maturity_month;


-- ============================================================
-- TEST 10: EXECUTIVE KPI AGGREGATION
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients,
    COUNT(transaction_amount) AS valid_amounts,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_recorded_amount,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2;


-- ============================================================
-- NOTES
-- ============================================================

-- PostgreSQL may choose:
-- Sequential Scan
-- Index Scan
-- Bitmap Index Scan
-- HashAggregate
-- GroupAggregate
-- Sort
--
-- The execution plan depends on available indexes,
-- database statistics, query selectivity and table size.
--
-- EXPLAIN (ANALYZE, BUFFERS) reports actual execution
-- timings and buffer activity.
--
-- To establish a verified speed improvement:
-- 1. Run repeated baseline measurements.
-- 2. Apply an appropriate index or query change.
-- 3. Repeat measurements under comparable conditions.
-- 4. Compare execution time and buffer usage.
--
-- Do not claim faster performance solely because
-- an index was created.
--
-- Financial amounts contain multiple currencies.
-- Cross-currency sums are not converted monetary totals.
-- ============================================================
