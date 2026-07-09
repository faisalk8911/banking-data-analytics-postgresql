-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 10_performance_optimization.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script demonstrates query performance analysis using
-- PostgreSQL's EXPLAIN ANALYZE command.
--
-- Objective:
-- Evaluate whether the indexes created in 09_indexes.sql
-- are being utilized effectively.
-- =============================================================


-- =============================================================
-- TEST 1 : Search by Client ID
-- =============================================================

EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE client_id = 70435;



-- =============================================================
-- TEST 2 : Search by Bank Name
-- =============================================================

EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE bank_name = 'HSBC';



-- =============================================================
-- TEST 3 : Filter High Risk Customers
-- =============================================================

EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE risk_category = 'High';



-- =============================================================
-- TEST 4 : Filter Expired Accounts
-- =============================================================

EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE maturity_status = 'Expired';



-- =============================================================
-- TEST 5 : Find Approved Loans
-- =============================================================

EXPLAIN ANALYZE

SELECT *

FROM banking_transactions

WHERE loan_status = 'Approved';



-- =============================================================
-- TEST 6 : Top 10 Highest Transactions
-- =============================================================

EXPLAIN ANALYZE

SELECT

client_id,
client_name,
transaction_amount

FROM banking_transactions

ORDER BY transaction_amount DESC

LIMIT 10;



-- =============================================================
-- TEST 7 : Total Transaction Amount by Bank
-- =============================================================

EXPLAIN ANALYZE

SELECT

bank_name,

SUM(transaction_amount)

FROM banking_transactions

GROUP BY bank_name;



-- =============================================================
-- TEST 8 : Average Interest Rate by Bank
-- =============================================================

EXPLAIN ANALYZE

SELECT

bank_name,

ROUND(AVG(interest_rate),2)

FROM banking_transactions

GROUP BY bank_name;



-- =============================================================
-- TEST 9 : Monthly Trend Analysis
-- =============================================================

EXPLAIN ANALYZE

SELECT

EXTRACT(YEAR FROM maturity_date) AS year,

EXTRACT(MONTH FROM maturity_date) AS month,

COUNT(*)

FROM banking_transactions

WHERE maturity_date IS NOT NULL

GROUP BY year, month

ORDER BY year, month;



-- =============================================================
-- TEST 10 : Executive KPI Query
-- =============================================================

EXPLAIN ANALYZE

SELECT

COUNT(*) AS total_records,

SUM(transaction_amount),

AVG(transaction_amount),

MAX(transaction_amount),

MIN(transaction_amount)

FROM banking_transactions;



-- =============================================================
-- END OF FILE
-- =============================================================
