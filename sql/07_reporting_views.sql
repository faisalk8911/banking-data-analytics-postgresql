
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 07_reporting_views.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Create reusable PostgreSQL views for financial analysis.
--
-- Source table: banking_transactions_clean_v2
-- Verified records: 24,998
--
-- Monetary values contain multiple currencies.
-- Summaries must not be interpreted as a single
-- converted currency total.
-- ============================================================


-- ============================================================
-- VIEW 1: BANK PERFORMANCE
-- ============================================================

CREATE OR REPLACE VIEW vw_bank_performance_v2 AS
SELECT
    bank_name,
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients,
    ROUND(SUM(transaction_amount), 2)
        AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount,
    ROUND(AVG(interest_rate), 2)
        AS average_interest_rate
FROM banking_transactions_clean_v2
GROUP BY bank_name;


-- ============================================================
-- VIEW 2: ACCOUNT PORTFOLIO
-- ============================================================

CREATE OR REPLACE VIEW vw_account_portfolio_v2 AS
SELECT
    COALESCE(account_type, 'Unknown') AS account_type,
    COUNT(*) AS total_records,
    COUNT(DISTINCT NULLIF(TRIM(client_id), ''))
        AS unique_clients,
    COUNT(transaction_amount) AS valid_transactions,
    ROUND(SUM(transaction_amount), 2)
        AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount
FROM banking_transactions_clean_v2
GROUP BY COALESCE(account_type, 'Unknown');


-- ============================================================
-- VIEW 3: BANKING DATA QUALITY
-- ============================================================

CREATE OR REPLACE VIEW vw_data_quality_v2 AS
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
    ) AS missing_transaction_amounts,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE transaction_amount IS NULL
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS missing_amount_pct
FROM banking_transactions_clean_v2
GROUP BY COALESCE(
    NULLIF(TRIM(bank_name), ''),
    'Unknown Bank'
);


-- ============================================================
-- VIEW 4: CURRENCY-LEVEL FINANCIAL SUMMARY
-- ============================================================

-- Currency-aware reporting prevents different currencies
-- from being treated as one comparable monetary total.

CREATE OR REPLACE VIEW vw_currency_summary_v2 AS
SELECT
    COALESCE(currency, 'Unknown') AS currency,
    COUNT(*) AS total_records,
    COUNT(transaction_amount) AS valid_transactions,
    ROUND(SUM(transaction_amount), 2)
        AS transaction_amount,
    ROUND(AVG(transaction_amount), 2)
        AS average_transaction_amount
FROM banking_transactions_clean_v2
GROUP BY COALESCE(currency, 'Unknown');


-- ============================================================
-- VERIFY REPORTING VIEWS
-- ============================================================

SELECT *
FROM vw_bank_performance_v2
ORDER BY total_transaction_amount DESC;

SELECT *
FROM vw_account_portfolio_v2
ORDER BY total_transaction_amount DESC;

SELECT *
FROM vw_data_quality_v2
ORDER BY missing_amount_pct DESC;

SELECT *
FROM vw_currency_summary_v2
ORDER BY currency;
