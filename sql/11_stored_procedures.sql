-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 11_stored_procedures.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script creates reusable PostgreSQL functions for
-- common business operations and reporting.
--
-- Note:
-- PostgreSQL uses FUNCTIONS to return query results.
-- =============================================================



-- =============================================================
-- FUNCTION 1 : Get Customer Details
-- =============================================================

CREATE OR REPLACE FUNCTION get_customer_details(p_client_id INT)

RETURNS TABLE (

    client_id INT,
    client_name VARCHAR,
    bank_name VARCHAR,
    account_type VARCHAR,
    transaction_amount NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

client_id,
client_name,
bank_name,
account_type,
transaction_amount

FROM banking_transactions

WHERE banking_transactions.client_id = p_client_id;

$$;



-- Example

SELECT * FROM get_customer_details(70435);



-- =============================================================
-- FUNCTION 2 : Total Transaction by Bank
-- =============================================================

CREATE OR REPLACE FUNCTION get_bank_transaction_summary()

RETURNS TABLE (

    bank_name VARCHAR,
    total_transaction NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

bank_name,

SUM(transaction_amount)

FROM banking_transactions

GROUP BY bank_name

ORDER BY SUM(transaction_amount) DESC;

$$;



-- Example

SELECT * FROM get_bank_transaction_summary();



-- =============================================================
-- FUNCTION 3 : High Risk Customer Summary
-- =============================================================

CREATE OR REPLACE FUNCTION get_high_risk_summary()

RETURNS TABLE (

    bank_name VARCHAR,
    total_high_risk BIGINT

)

LANGUAGE SQL

AS $$

SELECT

bank_name,

COUNT(*)

FROM banking_transactions

WHERE risk_category='High'

GROUP BY bank_name

ORDER BY COUNT(*) DESC;

$$;



-- Example

SELECT * FROM get_high_risk_summary();



-- =============================================================
-- FUNCTION 4 : Account Type Summary
-- =============================================================

CREATE OR REPLACE FUNCTION get_account_summary()

RETURNS TABLE (

    account_type VARCHAR,
    total_accounts BIGINT

)

LANGUAGE SQL

AS $$

SELECT

account_type,

COUNT(*)

FROM banking_transactions

GROUP BY account_type

ORDER BY COUNT(*) DESC;

$$;



-- Example

SELECT * FROM get_account_summary();



-- =============================================================
-- FUNCTION 5 : Executive KPI Dashboard
-- =============================================================

CREATE OR REPLACE FUNCTION get_executive_dashboard()

RETURNS TABLE (

    total_records BIGINT,

    total_transaction NUMERIC,

    average_transaction NUMERIC,

    highest_transaction NUMERIC,

    lowest_transaction NUMERIC,

    average_interest_rate NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

COUNT(*),

SUM(transaction_amount),

ROUND(AVG(transaction_amount),2),

MAX(transaction_amount),

MIN(transaction_amount),

ROUND(AVG(interest_rate),2)

FROM banking_transactions;

$$;



-- Example

SELECT * FROM get_executive_dashboard();



-- =============================================================
-- END OF FILE
-- =============================================================
