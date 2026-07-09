-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 07_reporting_views.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script creates reusable reporting views for business
-- intelligence and dashboard reporting.
--
-- These views simplify analytical queries and improve
-- maintainability.
-- =============================================================



-- =============================================================
-- VIEW 1 : Customer Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_customer_summary AS

SELECT

    client_id,
    client_name,
    bank_name,
    account_type,
    currency,
    transaction_amount,
    interest_rate,
    maturity_date,
    loan_status

FROM banking_transactions;



-- =============================================================
-- VIEW 2 : Bank Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_bank_summary AS

SELECT

    bank_name,

    COUNT(*) AS total_customers,

    SUM(transaction_amount) AS total_transaction_amount,

    ROUND(AVG(transaction_amount),2) AS average_transaction,

    ROUND(AVG(interest_rate),2) AS average_interest_rate

FROM banking_transactions

GROUP BY bank_name;



-- =============================================================
-- VIEW 3 : Account Type Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_account_summary AS

SELECT

    account_type,

    COUNT(*) AS total_accounts,

    SUM(transaction_amount) AS total_transaction_amount,

    ROUND(AVG(transaction_amount),2) AS average_transaction

FROM banking_transactions

GROUP BY account_type;



-- =============================================================
-- VIEW 4 : Risk Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_risk_summary AS

SELECT

    CASE

        WHEN transaction_amount IS NULL THEN 'Unknown'

        WHEN transaction_amount <100000 THEN 'Low'

        WHEN transaction_amount <300000 THEN 'Medium'

        ELSE 'High'

    END AS risk_category,

    COUNT(*) AS total_customers

FROM banking_transactions

GROUP BY risk_category;



-- =============================================================
-- VIEW 5 : Currency Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_currency_summary AS

SELECT

    currency,

    COUNT(*) AS total_accounts

FROM banking_transactions

GROUP BY currency;



-- =============================================================
-- VIEW 6 : Loan Status Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_loan_status_summary AS

SELECT

    loan_status,

    COUNT(*) AS total_accounts

FROM banking_transactions

GROUP BY loan_status;



-- =============================================================
-- VIEW 7 : Maturity Summary
-- =============================================================

CREATE OR REPLACE VIEW vw_maturity_summary AS

SELECT

    CASE

        WHEN maturity_date IS NULL THEN 'Unknown'

        WHEN maturity_date < CURRENT_DATE THEN 'Expired'

        ELSE 'Active'

    END AS maturity_status,

    COUNT(*) AS total_accounts

FROM banking_transactions

GROUP BY maturity_status;
