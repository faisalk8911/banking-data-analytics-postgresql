-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 06_duplicate_removal.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script identifies and removes duplicate records from the
-- banking dataset while preserving one unique record.
--
-- Business Rule:
-- A duplicate record is defined as records having identical
-- business values across key columns.
-- =============================================================



-- =============================================================
-- STEP 1 : Detect Duplicate Records
-- =============================================================

SELECT

    client_id,
    bank_name,
    account_type,
    transaction_amount,
    interest_rate,
    maturity_date,
    email,
    phone,
    loan_status,
    remarks,

    COUNT(*) AS duplicate_count

FROM banking_transactions

GROUP BY

    client_id,
    bank_name,
    account_type,
    transaction_amount,
    interest_rate,
    maturity_date,
    email,
    phone,
    loan_status,
    remarks

HAVING COUNT(*) > 1

ORDER BY duplicate_count DESC;



-- =============================================================
-- STEP 2 : Preview Duplicate Records
-- =============================================================

WITH duplicate_records AS (

SELECT
    *,
    ROW_NUMBER() OVER (

        PARTITION BY

            client_id,
            bank_name,
            account_type,
            transaction_amount,
            interest_rate,
            maturity_date,
            email,
            phone,
            loan_status,
            remarks

        ORDER BY client_id

    ) AS row_num

FROM banking_transactions

)

SELECT *

FROM duplicate_records

WHERE row_num > 1;



-- =============================================================
-- STEP 3 : Remove Duplicate Records
-- =============================================================
--
-- NOTE:
-- Execute only after reviewing duplicate records.
-- This query keeps the first occurrence of each record.
--
-- Uncomment before execution.
-- =============================================================

/*

WITH duplicate_records AS (

SELECT
    ctid,

    ROW_NUMBER() OVER (

        PARTITION BY

            client_id,
            bank_name,
            account_type,
            transaction_amount,
            interest_rate,
            maturity_date,
            email,
            phone,
            loan_status,
            remarks

        ORDER BY ctid

    ) AS row_num

FROM banking_transactions

)

DELETE FROM banking_transactions

WHERE ctid IN (

SELECT ctid

FROM duplicate_records

WHERE row_num > 1

);

*/



-- =============================================================
-- STEP 4 : Verify Duplicate Removal
-- =============================================================

SELECT

    COUNT(*) AS total_records_after_cleaning

FROM banking_transactions;
