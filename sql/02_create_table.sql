
-- ============================================================
-- Banking Data Analytics Project
-- File: 02_create_table.sql
-- Author: Faisal Kader
-- Database: banking_analytics
-- ============================================================

-- STEP 1: Preserve original banking data

CREATE TABLE IF NOT EXISTS banking_transactions_raw (
    client_id TEXT,
    client_name TEXT,
    bank_name TEXT,
    account_type TEXT,
    currency TEXT,
    transaction_amount TEXT,
    interest_rate TEXT,
    maturity_date TEXT,
    email TEXT,
    phone TEXT,
    loan_status TEXT,
    remarks TEXT
);

-- STEP 2: Create staging table

CREATE TABLE IF NOT EXISTS banking_transactions_staging (
    LIKE banking_transactions_raw
    INCLUDING DEFAULTS
);

-- Add columns for converted values

ALTER TABLE banking_transactions_staging
ADD COLUMN IF NOT EXISTS
    transaction_amount_clean NUMERIC(15,2);

ALTER TABLE banking_transactions_staging
ADD COLUMN IF NOT EXISTS
    interest_rate_clean NUMERIC(6,2);

ALTER TABLE banking_transactions_staging
ADD COLUMN IF NOT EXISTS
    maturity_date_clean DATE;

-- STEP 3: Create final analytics table

CREATE TABLE IF NOT EXISTS banking_transactions_clean_v2 (
    client_id TEXT,
    client_name TEXT,
    bank_name TEXT,
    account_type TEXT,
    currency TEXT,
    transaction_amount NUMERIC(15,2),
    interest_rate NUMERIC(6,2),
    maturity_date DATE,
    email TEXT,
    phone TEXT,
    loan_status TEXT,
    remarks TEXT
);

-- STEP 4: Verify table structures

SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
      'banking_transactions_raw',
      'banking_transactions_staging',
      'banking_transactions_clean_v2'
  )
ORDER BY table_name, ordinal_position;

-- This script creates table structures only.
-- Data importing, cleaning, and deduplication are
-- handled by subsequent SQL scripts.
-- Existing tables and records are not deleted.
