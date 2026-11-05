
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 04_data_cleaning.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Standardize banking data and convert financial fields.
--
-- Input: banking_transactions_raw (25,500 records)
-- Output: banking_transactions_staging
--
-- IMPORTANT:
-- Run after 02_create_table.sql and 03_import_data.sql.
-- The raw table remains unchanged.
-- ============================================================

BEGIN;

-- ============================================================
-- STEP 1: POPULATE STAGING TABLE
-- ============================================================

-- Replace staging contents with a fresh copy of the raw data.
-- This makes the cleaning workflow repeatable.

TRUNCATE TABLE banking_transactions_staging;

INSERT INTO banking_transactions_staging (
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
    transaction_amount,
    interest_rate,
    maturity_date,
    email,
    phone,
    loan_status,
    remarks
FROM banking_transactions_raw;


-- ============================================================
-- STEP 2: TRIM TEXT AND STANDARDIZE MISSING VALUES
-- ============================================================

UPDATE banking_transactions_staging
SET
    client_id = NULLIF(TRIM(client_id), ''),
    client_name = NULLIF(TRIM(client_name), ''),
    bank_name = NULLIF(TRIM(bank_name), ''),
    account_type = NULLIF(TRIM(account_type), ''),
    currency = NULLIF(TRIM(currency), ''),
    transaction_amount = NULLIF(TRIM(transaction_amount), ''),
    interest_rate = NULLIF(TRIM(interest_rate), ''),
    maturity_date = NULLIF(TRIM(maturity_date), ''),
    email = NULLIF(TRIM(email), ''),
    phone = NULLIF(TRIM(phone), ''),
    loan_status = NULLIF(TRIM(loan_status), ''),
    remarks = NULLIF(TRIM(remarks), '');


-- ============================================================
-- STEP 3: STANDARDIZE BUSINESS FIELDS
-- ============================================================

UPDATE banking_transactions_staging
SET
    client_name = INITCAP(client_name),

    bank_name = CASE
        WHEN bank_name IS NULL THEN 'Unknown Bank'
        WHEN UPPER(bank_name) = 'WELLS FARGO'
            THEN 'Wells Fargo'
        ELSE UPPER(bank_name)
    END,

    account_type = INITCAP(account_type),
    currency = UPPER(currency),
    loan_status = INITCAP(loan_status);


-- ============================================================
-- STEP 4: CONVERT TRANSACTION AMOUNTS
-- ============================================================

UPDATE banking_transactions_staging
SET transaction_amount_clean =
    NULLIF(
        REGEXP_REPLACE(
            transaction_amount,
            '[$,[:space:]]',
            '',
            'g'
        ),
        ''
    )::NUMERIC(15,2);


-- ============================================================
-- STEP 5: CONVERT INTEREST RATES
-- ============================================================

UPDATE banking_transactions_staging
SET interest_rate_clean =
    CASE
        WHEN interest_rate IS NULL THEN NULL

        WHEN REPLACE(
            REPLACE(interest_rate, CHR(160), ' '),
            CHR(8239), ' '
        ) ~ '^[0-9]+(\.[0-9]{1,2})?$'
        THEN REPLACE(
            REPLACE(interest_rate, CHR(160), ' '),
            CHR(8239), ' '
        )::NUMERIC(6,2)

        WHEN REPLACE(
            REPLACE(interest_rate, CHR(160), ' '),
            CHR(8239), ' '
        ) ~ '^[0-9]+ +[0-9]{1,2}$'
        THEN REGEXP_REPLACE(
            REPLACE(
                REPLACE(interest_rate, CHR(160), ' '),
                CHR(8239), ' '
            ),
            ' +', '.', 'g'
        )::NUMERIC(6,2)

        ELSE NULL
    END;


-- ============================================================
-- STEP 6: CONVERT MATURITY DATES
-- ============================================================

UPDATE banking_transactions_staging
SET maturity_date_clean =
    CASE
        WHEN maturity_date IS NULL THEN NULL

        WHEN maturity_date ~
            '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
        THEN TO_DATE(maturity_date, 'DD-MM-YYYY')

        WHEN maturity_date ~
            '^[0-9]{4}\.[0-9]{2}\.[0-9]{2}$'
        THEN TO_DATE(maturity_date, 'YYYY.MM.DD')

        WHEN maturity_date ~
            '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
        THEN TO_DATE(maturity_date, 'MM/DD/YYYY')

        ELSE NULL
    END;


-- ============================================================
-- STEP 7: VERIFY STAGING RECORDS
-- ============================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(transaction_amount_clean)
        AS valid_transaction_amounts,
    COUNT(interest_rate_clean)
        AS valid_interest_rates,
    COUNT(maturity_date_clean)
        AS converted_maturity_dates
FROM banking_transactions_staging;

COMMIT;

-- Expected results:
-- Total records: 25,500
-- Valid transaction amounts: 16,995
-- Valid interest rates: 12,600
-- Converted maturity dates: 19,120

-- Duplicate removal is handled separately
-- in 06_duplicate_removal.sql.
