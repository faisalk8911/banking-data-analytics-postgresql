
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 05_data_validation.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Validate banking records after data cleaning.
--
-- Input: banking_transactions_staging
-- Expected records: 25,500
--
-- All queries are read-only.
-- ============================================================


-- ============================================================
-- STEP 1: VERIFY STAGING RECORD COUNT
-- ============================================================

SELECT
    COUNT(*) AS total_records
FROM banking_transactions_staging;

-- Expected: 25,500


-- ============================================================
-- STEP 2: CHECK MISSING VALUES
-- ============================================================

SELECT
    COUNT(*) AS total_records,

    COUNT(*) FILTER (
        WHERE client_id IS NULL
    ) AS missing_client_ids,

    COUNT(*) FILTER (
        WHERE transaction_amount_clean IS NULL
    ) AS missing_transaction_amounts,

    COUNT(*) FILTER (
        WHERE interest_rate_clean IS NULL
    ) AS missing_interest_rates,

    COUNT(*) FILTER (
        WHERE maturity_date_clean IS NULL
    ) AS missing_maturity_dates

FROM banking_transactions_staging;


-- ============================================================
-- STEP 3: VALIDATE FINANCIAL DATA CONVERSION
-- ============================================================

SELECT
    COUNT(transaction_amount_clean)
        AS valid_transaction_amounts,

    COUNT(*) FILTER (
        WHERE transaction_amount IS NOT NULL
          AND transaction_amount_clean IS NULL
    ) AS unconverted_transaction_amounts,

    COUNT(interest_rate_clean)
        AS valid_interest_rates,

    COUNT(*) FILTER (
        WHERE interest_rate IS NOT NULL
          AND interest_rate_clean IS NULL
    ) AS unconverted_interest_rates

FROM banking_transactions_staging;


-- ============================================================
-- STEP 4: VALIDATE INTEREST RATE RANGE
-- ============================================================

SELECT
    MIN(interest_rate_clean) AS minimum_interest_rate,
    MAX(interest_rate_clean) AS maximum_interest_rate,
    ROUND(AVG(interest_rate_clean), 2)
        AS average_interest_rate
FROM banking_transactions_staging;

-- Observed range: 1.50 to 12.50


-- ============================================================
-- STEP 5: VALIDATE MATURITY DATE CONVERSION
-- ============================================================

SELECT
    COUNT(maturity_date_clean) AS converted_dates,

    COUNT(*) FILTER (
        WHERE maturity_date IS NOT NULL
          AND maturity_date_clean IS NULL
    ) AS unconverted_dates,

    MIN(maturity_date_clean) AS earliest_date,
    MAX(maturity_date_clean) AS latest_date

FROM banking_transactions_staging;


-- ============================================================
-- STEP 6: CHECK DATE REPRESENTATION CONSISTENCY
-- ============================================================

SELECT
    COUNT(*) AS total_dates_checked,

    COUNT(*) FILTER (
        WHERE maturity_date IS DISTINCT FROM
            CASE
                WHEN maturity_date ~
                    '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
                THEN TO_CHAR(
                    maturity_date_clean,
                    'DD-MM-YYYY'
                )

                WHEN maturity_date ~
                    '^[0-9]{4}\.[0-9]{2}\.[0-9]{2}$'
                THEN TO_CHAR(
                    maturity_date_clean,
                    'YYYY.MM.DD'
                )

                WHEN maturity_date ~
                    '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
                THEN TO_CHAR(
                    maturity_date_clean,
                    'MM/DD/YYYY'
                )

                ELSE NULL
            END
    ) AS mismatched_dates

FROM banking_transactions_staging
WHERE maturity_date IS NOT NULL;

-- Previously verified:
-- 19,120 dates checked
-- 0 mismatched dates


-- ============================================================
-- STEP 7: VERIFY STANDARDIZED BANK NAMES
-- ============================================================

SELECT
    bank_name,
    COUNT(*) AS total_records
FROM banking_transactions_staging
GROUP BY bank_name
ORDER BY total_records DESC;


-- ============================================================
-- STEP 8: DATA QUALITY SUMMARY
-- ============================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT client_id)
        AS unique_identified_clients,

    COUNT(transaction_amount_clean)
        AS valid_transaction_amounts,

    ROUND(SUM(transaction_amount_clean), 2)
        AS total_recorded_amount,

    ROUND(AVG(transaction_amount_clean), 2)
        AS average_recorded_amount,

    ROUND(AVG(interest_rate_clean), 2)
        AS average_interest_rate

FROM banking_transactions_staging;

-- Note:
-- Transaction amounts cover multiple currencies.
-- Do not treat the summed amount as a single-currency total.
--
-- Final duplicate removal and reporting are handled
-- by subsequent SQL scripts.
