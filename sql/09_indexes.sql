-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 09_indexes.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script creates indexes to improve query performance
-- for frequently searched, filtered, sorted, and grouped
-- columns used throughout the project.
--
-- These indexes are based on the business analysis queries
-- and reporting views developed in this project.
-- =============================================================


-- =============================================================
-- SECTION A : PRIMARY BUSINESS INDEXES
-- =============================================================
--
-- These indexes improve performance for searches
-- and filtering on key business columns.
-- =============================================================


-- Client ID

CREATE INDEX IF NOT EXISTS idx_client_id
ON banking_transactions(client_id);


-- Bank Name

CREATE INDEX IF NOT EXISTS idx_bank_name
ON banking_transactions(bank_name);


-- Account Type

CREATE INDEX IF NOT EXISTS idx_account_type
ON banking_transactions(account_type);


-- Currency

CREATE INDEX IF NOT EXISTS idx_currency
ON banking_transactions(currency);


-- Loan Status

CREATE INDEX IF NOT EXISTS idx_loan_status
ON banking_transactions(loan_status);



-- =============================================================
-- SECTION B : FINANCIAL INDEXES
-- =============================================================
--
-- Improve performance of aggregation,
-- filtering and sorting.
-- =============================================================


CREATE INDEX IF NOT EXISTS idx_transaction_amount
ON banking_transactions(transaction_amount);


CREATE INDEX IF NOT EXISTS idx_interest_rate
ON banking_transactions(interest_rate);


CREATE INDEX IF NOT EXISTS idx_risk_category
ON banking_transactions(risk_category);


CREATE INDEX IF NOT EXISTS idx_interest_classification
ON banking_transactions(interest_classification);



-- =============================================================
-- SECTION C : DATE INDEXES
-- =============================================================
--
-- Improve date filtering and trend analysis.
-- =============================================================


CREATE INDEX IF NOT EXISTS idx_maturity_date
ON banking_transactions(maturity_date);


CREATE INDEX IF NOT EXISTS idx_maturity_status
ON banking_transactions(maturity_status);



-- =============================================================
-- SECTION D : CUSTOMER CONTACT INDEXES
-- =============================================================
--
-- Improve searching customer contact information.
-- =============================================================


CREATE INDEX IF NOT EXISTS idx_email
ON banking_transactions(email);


CREATE INDEX IF NOT EXISTS idx_phone
ON banking_transactions(phone);



-- =============================================================
-- SECTION E : VALIDATION INDEXES
-- =============================================================
--
-- Used during data quality validation.
-- =============================================================


CREATE INDEX IF NOT EXISTS idx_email_check
ON banking_transactions(email_check);


CREATE INDEX IF NOT EXISTS idx_id_missing
ON banking_transactions(id_missing);



-- =============================================================
-- SECTION F : PERFORMANCE TEST
-- =============================================================
--
-- Use EXPLAIN ANALYZE to verify
-- index usage and query performance.
-- =============================================================


EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE bank_name = 'HSBC';



EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE client_id = 70435;



EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE risk_category = 'High';



EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE maturity_status = 'Expired';



EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

ORDER BY transaction_amount DESC

LIMIT 10;



-- =============================================================
-- END OF FILE
-- =============================================================
