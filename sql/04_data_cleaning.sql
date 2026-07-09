-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 04_data_cleaning.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script demonstrates the complete data cleaning and
-- standardization process applied to the raw banking dataset
-- before performing business analysis.
--
-- Raw Records      : 25,500
-- Clean Records    : 24,997
-- Duplicates Removed : 503
--
-- NOTE:
-- The following queries illustrate the cleaning logic used
-- during the ETL process. They can be adapted as UPDATE
-- statements when transforming production data.
-- =============================================================



-- =============================================================
-- STEP 1 : Detect Missing Client IDs
-- Objective:
-- Identify records where the Client ID is missing.
-- =============================================================

SELECT
    client_id,

    CASE
        WHEN client_id IS NULL THEN 'Yes'
        ELSE 'No'
    END AS id_missing

FROM banking_transactions;



-- =============================================================
-- STEP 2 : Standardize Client Names
--
-- Rules
-- • Remove leading/trailing spaces
-- • Convert to Proper Case
-- • Replace NULL with 'Unknown Client'
-- =============================================================

SELECT

    client_name AS original_name,

    CASE

        WHEN client_name IS NULL
            THEN 'Unknown Client'

        ELSE INITCAP(TRIM(client_name))

    END AS cleaned_name

FROM banking_transactions;



-- =============================================================
-- STEP 3 : Standardize Bank Names
--
-- Rules
-- • Remove extra spaces
-- • Preserve official bank naming
-- • Replace NULL with 'Unknown Bank'
-- =============================================================

SELECT

    bank_name AS original_bank,

    CASE

        WHEN bank_name IS NULL
            THEN 'Unknown Bank'

        WHEN UPPER(TRIM(bank_name))='BOFA'
            THEN 'BOFA'

        WHEN UPPER(TRIM(bank_name))='HSBC'
            THEN 'HSBC'

        WHEN UPPER(TRIM(bank_name))='CITI'
            THEN 'CITI'

        WHEN UPPER(TRIM(bank_name))='CHASE'
            THEN 'CHASE'

        WHEN UPPER(TRIM(bank_name))='WELLS FARGO'
            THEN 'Wells Fargo'

    END AS cleaned_bank

FROM banking_transactions;



-- =============================================================
-- STEP 4 : Standardize Account Types
--
-- Rules
-- • Remove extra spaces
-- • Convert to Proper Case
-- =============================================================

SELECT

    account_type AS original_account_type,

    CASE

        WHEN account_type IS NULL
            THEN 'Unknown'

        ELSE INITCAP(TRIM(account_type))

    END AS cleaned_account_type

FROM banking_transactions;



-- =============================================================
-- STEP 5 : Standardize Currency
--
-- Rules
-- • Convert to uppercase
-- • Replace NULL with 'Unknown'
-- =============================================================

SELECT

    currency AS original_currency,

    CASE

        WHEN currency IS NULL
            THEN 'Unknown'

        ELSE UPPER(TRIM(currency))

    END AS cleaned_currency

FROM banking_transactions;
