
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 09_indexes.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Create indexes for common banking data queries.
--
-- Source: banking_transactions_clean_v2
-- Verified records: 24,998
--
-- NOTE:
-- Indexes can improve selected queries, but they also
-- require storage and increase write overhead.
-- Performance improvements must be benchmarked.
-- ============================================================


-- ============================================================
-- STEP 1: CUSTOMER LOOKUP INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_client_id
ON banking_transactions_clean_v2 (client_id);


-- ============================================================
-- STEP 2: BANK LOOKUP INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_bank_name
ON banking_transactions_clean_v2 (bank_name);


-- ============================================================
-- STEP 3: ACCOUNT TYPE INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_account_type
ON banking_transactions_clean_v2 (account_type);


-- ============================================================
-- STEP 4: CURRENCY INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_currency
ON banking_transactions_clean_v2 (currency);


-- ============================================================
-- STEP 5: LOAN STATUS INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_loan_status
ON banking_transactions_clean_v2 (loan_status);


-- ============================================================
-- STEP 6: TRANSACTION AMOUNT INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_transaction_amount
ON banking_transactions_clean_v2
(transaction_amount DESC);


-- ============================================================
-- STEP 7: MATURITY DATE INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_maturity_date
ON banking_transactions_clean_v2 (maturity_date);


-- ============================================================
-- STEP 8: BANK AND CURRENCY COMPOSITE INDEX
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_clean_v2_bank_currency
ON banking_transactions_clean_v2
(bank_name, currency);


-- ============================================================
-- STEP 9: UPDATE QUERY PLANNER STATISTICS
-- ============================================================

ANALYZE banking_transactions_clean_v2;


-- ============================================================
-- STEP 10: VERIFY CREATED INDEXES
-- ============================================================

SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename = 'banking_transactions_clean_v2'
ORDER BY indexname;


-- ============================================================
-- STEP 11: INSPECT A QUERY EXECUTION PLAN
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    client_name,
    bank_name,
    transaction_amount
FROM banking_transactions_clean_v2
WHERE client_id = '70435';


-- ============================================================
-- STEP 12: INSPECT TOP TRANSACTION QUERY
-- ============================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    client_id,
    bank_name,
    currency,
    transaction_amount
FROM banking_transactions_clean_v2
WHERE transaction_amount IS NOT NULL
ORDER BY transaction_amount DESC
LIMIT 10;


-- ============================================================
-- IMPORTANT NOTES
-- ============================================================

-- PostgreSQL may choose sequential scans instead of
-- index scans, especially for small tables or queries
-- returning a large percentage of rows.
--
-- EXPLAIN ANALYZE shows actual execution behavior.
-- Index creation alone does not demonstrate speedup.
--
-- Compare execution plans and timings before and after
-- indexing to establish any performance improvement.
-- ============================================================
