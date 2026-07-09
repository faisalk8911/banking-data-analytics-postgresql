-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 05_data_validation.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script validates the quality of the cleaned banking
-- dataset by checking completeness, accuracy, consistency,
-- and business rules.
-- =============================================================



-- =============================================================
-- VALIDATION 1 : Total Records
-- =============================================================

SELECT
    COUNT(*) AS total_records
FROM banking_transactions;



-- =============================================================
-- VALIDATION 2 : Missing Client IDs
-- =============================================================

SELECT
    COUNT(*) AS missing_client_ids
FROM banking_transactions
WHERE client_id IS NULL;



-- =============================================================
-- VALIDATION 3 : Missing Client Names
-- =============================================================

SELECT
    COUNT(*) AS missing_client_names
FROM banking_transactions
WHERE client_name = 'Unknown Client';



-- =============================================================
-- VALIDATION 4 : Missing Transaction Amount
-- =============================================================

SELECT
    COUNT(*) AS missing_transaction_amount
FROM banking_transactions
WHERE transaction_amount IS NULL;



-- =============================================================
-- VALIDATION 5 : Missing Interest Rate
-- =============================================================

SELECT
    COUNT(*) AS missing_interest_rate
FROM banking_transactions
WHERE interest_rate IS NULL;



-- =============================================================
-- VALIDATION 6 : Missing Maturity Date
-- =============================================================

SELECT
    COUNT(*) AS missing_maturity_date
FROM banking_transactions
WHERE maturity_date IS NULL;



-- =============================================================
-- VALIDATION 7 : Unknown Currency
-- =============================================================

SELECT
    COUNT(*) AS unknown_currency
FROM banking_transactions
WHERE currency='Unknown';



-- =============================================================
-- VALIDATION 8 : Unknown Bank
-- =============================================================

SELECT
    COUNT(*) AS unknown_bank
FROM banking_transactions
WHERE bank_name='Unknown Bank';



-- =============================================================
-- VALIDATION 9 : Unknown Phone
-- =============================================================

SELECT
    COUNT(*) AS unknown_phone
FROM banking_transactions
WHERE phone='Unknown';



-- =============================================================
-- VALIDATION 10 : Invalid Email
-- =============================================================

SELECT
    COUNT(*) AS invalid_email
FROM banking_transactions
WHERE email='Invalid Email';



-- =============================================================
-- VALIDATION 11 : Unknown Loan Status
-- =============================================================

SELECT
    COUNT(*) AS unknown_status
FROM banking_transactions
WHERE loan_status='Unknown';



-- =============================================================
-- VALIDATION 12 : Final Dataset Summary
-- =============================================================

SELECT

    COUNT(*) AS total_records,

    COUNT(client_id) AS available_client_ids,

    COUNT(transaction_amount) AS available_transactions,

    COUNT(interest_rate) AS available_interest_rates,

    COUNT(maturity_date) AS available_maturity_dates

FROM banking_transactions;
