
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 08_analysis_queries.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- 20 business-focused PostgreSQL analysis queries.
--
-- Source: banking_transactions_clean_v2
-- Verified records: 24,998
--
-- IMPORTANT:
-- Transaction amounts include USD, BDT, EUR, GBP,
-- and missing currency values.
-- Cross-currency sums are not converted monetary totals.
-- ============================================================


-- QUERY 01: Total Cleaned Records
SELECT COUNT(*) AS total_records
FROM banking_transactions_clean_v2;


-- QUERY 02: Unique Identified Clients
SELECT
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients
FROM banking_transactions_clean_v2;


-- QUERY 03: Transaction Amount Completeness
SELECT
    COUNT(*) AS total_records,
    COUNT(transaction_amount) AS valid_amounts,
    COUNT(*) FILTER (
        WHERE transaction_amount IS NULL
    ) AS missing_amounts
FROM banking_transactions_clean_v2;


-- QUERY 04: Overall Financial Data Summary
-- Raw mixed-currency aggregations for data validation.
SELECT
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_recorded_amount,
    MAX(transaction_amount) AS highest_amount,
    MIN(transaction_amount) AS lowest_amount
FROM banking_transactions_clean_v2;


-- QUERY 05: Average Interest Rate
SELECT
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate,
    MIN(interest_rate) AS minimum_rate,
    MAX(interest_rate) AS maximum_rate
FROM banking_transactions_clean_v2;


-- QUERY 06: Records and Unique Clients by Bank
SELECT
    bank_name,
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients
FROM banking_transactions_clean_v2
GROUP BY bank_name
ORDER BY total_records DESC;


-- QUERY 07: Bank Performance Analysis
-- Mixed-currency amount sums are not directly comparable.
SELECT
    bank_name,
    COUNT(*) AS total_records,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_recorded_amount
FROM banking_transactions_clean_v2
GROUP BY bank_name
ORDER BY sum_of_recorded_amounts DESC;


-- QUERY 08: Account Portfolio Distribution
SELECT
    COALESCE(account_type, 'Unknown') AS account_type,
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients
FROM banking_transactions_clean_v2
GROUP BY COALESCE(account_type, 'Unknown')
ORDER BY total_records DESC;


-- QUERY 09: Account Portfolio Financial Analysis
SELECT
    COALESCE(account_type, 'Unknown') AS account_type,
    COUNT(transaction_amount) AS valid_amounts,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_recorded_amount
FROM banking_transactions_clean_v2
GROUP BY COALESCE(account_type, 'Unknown')
ORDER BY sum_of_recorded_amounts DESC;


-- QUERY 10: Average Interest Rate by Bank
SELECT
    bank_name,
    COUNT(interest_rate) AS valid_rates,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2
GROUP BY bank_name
ORDER BY average_interest_rate DESC;


-- QUERY 11: Missing Client IDs by Bank
SELECT
    bank_name,
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE client_id IS NULL
    ) AS missing_client_ids,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE client_id IS NULL
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS missing_id_pct
FROM banking_transactions_clean_v2
GROUP BY bank_name
ORDER BY missing_id_pct DESC;


-- QUERY 12: Loan Status Distribution
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


-- QUERY 13: Currency Distribution
SELECT
    COALESCE(currency, 'Unknown') AS currency,
    COUNT(*) AS total_records
FROM banking_transactions_clean_v2
GROUP BY COALESCE(currency, 'Unknown')
ORDER BY total_records DESC;


-- QUERY 14: Financial Summary by Currency
SELECT
    COALESCE(currency, 'Unknown') AS currency,
    COUNT(transaction_amount) AS valid_amounts,
    ROUND(SUM(transaction_amount), 2)
        AS total_amount,
    ROUND(AVG(transaction_amount), 2)
        AS average_amount
FROM banking_transactions_clean_v2
GROUP BY COALESCE(currency, 'Unknown')
ORDER BY currency;


-- QUERY 15: Top 10 Recorded Transaction Amounts
-- Comparisons are meaningful within the same currency.
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


-- QUERY 16: Monthly Maturity Distribution
SELECT
    DATE_TRUNC('month', maturity_date)::DATE
        AS maturity_month,
    COUNT(*) AS total_records
FROM banking_transactions_clean_v2
WHERE maturity_date IS NOT NULL
GROUP BY DATE_TRUNC('month', maturity_date)
ORDER BY maturity_month;


-- QUERY 17: Average Transaction by Bank and Currency
SELECT
    bank_name,
    COALESCE(currency, 'Unknown') AS currency,
    COUNT(transaction_amount) AS valid_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount
FROM banking_transactions_clean_v2
GROUP BY bank_name, COALESCE(currency, 'Unknown')
ORDER BY bank_name, currency;


-- QUERY 18: Average Transaction by Account and Currency
SELECT
    COALESCE(account_type, 'Unknown') AS account_type,
    COALESCE(currency, 'Unknown') AS currency,
    COUNT(transaction_amount) AS valid_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount
FROM banking_transactions_clean_v2
GROUP BY
    COALESCE(account_type, 'Unknown'),
    COALESCE(currency, 'Unknown')
ORDER BY account_type, currency;


-- QUERY 19: Banking Data Quality by Bank
SELECT
    bank_name,
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE client_id IS NULL
    ) AS missing_client_ids,
    COUNT(*) FILTER (
        WHERE transaction_amount IS NULL
    ) AS missing_transaction_amounts,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE transaction_amount IS NULL
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS missing_amount_pct
FROM banking_transactions_clean_v2
GROUP BY bank_name
ORDER BY missing_amount_pct DESC;


-- QUERY 20: Executive SQL KPI Summary
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients,
    COUNT(transaction_amount) AS valid_amounts,
    COUNT(*) FILTER (
        WHERE transaction_amount IS NULL
    ) AS missing_amounts,
    ROUND(SUM(transaction_amount), 2)
        AS sum_of_recorded_amounts,
    ROUND(AVG(transaction_amount), 2)
        AS average_recorded_amount,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2;


-- ============================================================
-- EXPECTED VERIFIED OVERALL RESULTS
-- ============================================================
-- Clean records: 24,998
-- Unique identified clients: 11,676
-- Valid transaction amounts: 16,663
-- Missing transaction amounts: 8,335
-- Sum of recorded amounts: 4,170,755,712.00
-- Average recorded amount: 250,300.41
-- Average interest rate: 6.99%
--
-- No FX conversion has been performed.
-- ============================================================
