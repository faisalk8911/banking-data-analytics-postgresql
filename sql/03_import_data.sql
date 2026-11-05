
-- ============================================================
-- Banking Data Analytics Project
-- File: 03_import_data.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Import original banking CSV data into the raw table.
-- Expected records: 25,500
--
-- IMPORTANT:
-- Replace the example CSV path before execution.
-- COPY reads from the PostgreSQL server's filesystem.
-- ============================================================

-- STEP 1: Import raw banking data
-- Run this once on an empty raw table.
-- Do not rerun without checking for existing records.

COPY banking_transactions_raw (
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
FROM '/path/to/banking_data_raw.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    ENCODING 'UTF8'
);

-- STEP 2: Verify imported records

SELECT
    COUNT(*) AS total_raw_records
FROM banking_transactions_raw;

-- Expected result: 25,500 records

-- STEP 3: Preview imported data

SELECT *
FROM banking_transactions_raw
LIMIT 10;

-- For a local CSV in pgAdmin, use Import/Export Data
-- if the PostgreSQL server cannot access the file.
