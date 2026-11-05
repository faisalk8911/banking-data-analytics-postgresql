
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 06_duplicate_removal.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Identify exact duplicate records and create a cleaned
-- reporting table while preserving legitimate transactions.
--
-- Input:  banking_transactions_staging
-- Output: banking_transactions_clean_v2
--
-- Verified results:
-- Original records: 25,500
-- Duplicates removed: 502
-- Final clean records: 24,998
-- ============================================================


-- ============================================================
-- STEP 1: IDENTIFY EXACT DUPLICATE RECORDS
-- ============================================================

WITH duplicate_groups AS (
    SELECT
        client_id,
        client_name,
        bank_name,
        account_type,
        currency,
        transaction_amount,
        interest_rate,
        maturity_date,
        email,
        phone,
        loan_status,
        remarks,
        COUNT(*) AS occurrences
    FROM banking_transactions_staging
    GROUP BY
        client_id,
        client_name,
        bank_name,
        account_type,
        currency,
        transaction_amount,
        interest_rate,
        maturity_date,
        email,
        phone,
        loan_status,
        remarks
    HAVING COUNT(*) > 1
)
SELECT
    COUNT(*) AS duplicate_groups,
    COALESCE(SUM(occurrences - 1), 0)
        AS duplicate_rows
FROM duplicate_groups;


-- ============================================================
-- STEP 2: PREVIEW DUPLICATE RECORDS
-- ============================================================

WITH ranked_records AS (
    SELECT
        client_id,
        client_name,
        bank_name,
        account_type,
        currency,
        transaction_amount,
        ROW_NUMBER() OVER (
            PARTITION BY
                client_id,
                client_name,
                bank_name,
                account_type,
                currency,
                transaction_amount,
                interest_rate,
                maturity_date,
                email,
                phone,
                loan_status,
                remarks
            ORDER BY ctid
        ) AS duplicate_rank
    FROM banking_transactions_staging
)
SELECT *
FROM ranked_records
WHERE duplicate_rank > 1
LIMIT 20;


-- ============================================================
-- STEP 3: CREATE THE FINAL CLEANED DATASET
-- ============================================================

-- Preserve all raw records and the staging table.
-- Rebuild only the final reporting table.

BEGIN;

TRUNCATE TABLE banking_transactions_clean_v2;

WITH ranked_records AS (
    SELECT
        s.*,
        ROW_NUMBER() OVER (
            PARTITION BY
                client_id,
                client_name,
                bank_name,
                account_type,
                currency,
                transaction_amount,
                interest_rate,
                maturity_date,
                email,
                phone,
                loan_status,
                remarks
            ORDER BY ctid
        ) AS duplicate_rank
    FROM banking_transactions_staging s
)
INSERT INTO banking_transactions_clean_v2 (
    client_id,
    client_name,
    bank_name,
    account_type,
    currency,
    transaction_amount,
    interest_rate,
    maturity_date,
    email,
    phone,
    loan_status,
    remarks
)
SELECT
    client_id,
    client_name,
    bank_name,
    account_type,
    currency,
    transaction_amount_clean,
    interest_rate_clean,
    maturity_date_clean,
    email,
    phone,
    loan_status,
    remarks
FROM ranked_records
WHERE duplicate_rank = 1;


-- ============================================================
-- STEP 4: VERIFY FINAL RECORD COUNTS
-- ============================================================

SELECT
    (SELECT COUNT(*)
     FROM banking_transactions_raw)
        AS original_records,

    (SELECT COUNT(*)
     FROM banking_transactions_staging)
        AS staging_records,

    (SELECT COUNT(*)
     FROM banking_transactions_clean_v2)
        AS final_clean_records,

    (SELECT COUNT(*)
     FROM banking_transactions_staging)
    -
    (SELECT COUNT(*)
     FROM banking_transactions_clean_v2)
        AS duplicates_removed;

COMMIT;


-- ============================================================
-- EXPECTED RESULTS
-- ============================================================

-- Original records: 25,500
-- Staging records: 25,500
-- Final clean records: 24,998
-- Duplicates removed: 502
--
-- Duplicate identification uses all 12 standardized
-- source business columns.
--
-- Repeated client IDs alone are not treated as duplicates.
-- Missing client IDs are preserved.
--
-- Monetary amounts represent multiple currencies and
-- must not be interpreted as a single-currency total.
-- ============================================================
