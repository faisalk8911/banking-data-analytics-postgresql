-- =============================================================
-- Banking Data Analytics Project
-- File Name   : 08_analysis_queries.sql
-- Project     : End-to-End Banking Data Analytics using PostgreSQL
-- Author      : Faisal Kader
-- Database    : PostgreSQL
--
-- Description:
-- This script contains 20 business analysis queries used
-- to generate business insights from the cleaned banking dataset.
--
-- Skills Demonstrated:
-- • Aggregate Functions
-- • GROUP BY
-- • ORDER BY
-- • Date Analysis
-- • Business KPIs
-- • Financial Reporting
-- =============================================================


-- =============================================================
-- Query 1 : Total Records
-- =============================================================

SELECT
    COUNT(*) AS total_records
FROM banking_transactions;


-- =============================================================
-- Query 2 : Total Transaction Amount
-- =============================================================

SELECT
    SUM(transaction_amount) AS total_transaction_amount
FROM banking_transactions;


-- =============================================================
-- Query 3 : Average Transaction Amount
-- =============================================================

SELECT
    ROUND(AVG(transaction_amount),2) AS average_transaction
FROM banking_transactions;


-- =============================================================
-- Query 4 : Highest Transaction
-- =============================================================

SELECT
    MAX(transaction_amount) AS highest_transaction
FROM banking_transactions;


-- =============================================================
-- Query 5 : Lowest Transaction
-- =============================================================

SELECT
    MIN(transaction_amount) AS lowest_transaction
FROM banking_transactions;


-- =============================================================
-- Query 6 : Customers by Bank
-- =============================================================

SELECT
    bank_name,
    COUNT(*) AS total_customers
FROM banking_transactions
GROUP BY bank_name
ORDER BY total_customers DESC;


-- =============================================================
-- Query 7 : Transaction Amount by Bank
-- =============================================================

SELECT
    bank_name,
    SUM(transaction_amount) AS total_transaction_amount
FROM banking_transactions
GROUP BY bank_name
ORDER BY total_transaction_amount DESC;


-- =============================================================
-- Query 8 : Customers by Account Type
-- =============================================================

SELECT
    account_type,
    COUNT(*) AS total_customers
FROM banking_transactions
GROUP BY account_type
ORDER BY total_customers DESC;


-- =============================================================
-- Query 9 : Transaction Amount by Account Type
-- =============================================================

SELECT
    account_type,
    SUM(transaction_amount) AS total_transaction_amount
FROM banking_transactions
GROUP BY account_type
ORDER BY total_transaction_amount DESC;


-- =============================================================
-- Query 10 : Average Interest Rate by Bank
-- =============================================================

SELECT
    bank_name,
    ROUND(AVG(interest_rate),2) AS average_interest_rate
FROM banking_transactions
GROUP BY bank_name
ORDER BY average_interest_rate DESC;


-- =============================================================
-- Query 11 : Risk Category Distribution
-- =============================================================

SELECT
    risk_category,
    COUNT(*) AS total_customers
FROM banking_transactions
GROUP BY risk_category
ORDER BY total_customers DESC;


-- =============================================================
-- Query 12 : Loan Status Distribution
-- =============================================================

SELECT
    loan_status,
    COUNT(*) AS total_customers
FROM banking_transactions
GROUP BY loan_status
ORDER BY total_customers DESC;


-- =============================================================
-- Query 13 : Currency Distribution
-- =============================================================

SELECT
    currency,
    COUNT(*) AS total_accounts
FROM banking_transactions
GROUP BY currency
ORDER BY total_accounts DESC;


-- =============================================================
-- Query 14 : Maturity Status Distribution
-- =============================================================

SELECT
    maturity_status,
    COUNT(*) AS total_accounts
FROM banking_transactions
GROUP BY maturity_status
ORDER BY total_accounts DESC;


-- =============================================================
-- Query 15 : Top 10 Highest Transactions
-- =============================================================

SELECT
    client_id,
    client_name,
    bank_name,
    transaction_amount
FROM banking_transactions
ORDER BY transaction_amount DESC
LIMIT 10;


-- =============================================================
-- Query 16 : Monthly Maturity Trend
-- =============================================================

SELECT
    EXTRACT(YEAR FROM maturity_date) AS year,
    EXTRACT(MONTH FROM maturity_date) AS month,
    COUNT(*) AS total_accounts
FROM banking_transactions
WHERE maturity_date IS NOT NULL
GROUP BY year, month
ORDER BY year, month;


-- =============================================================
-- Query 17 : Average Transaction by Bank
-- =============================================================

SELECT
    bank_name,
    ROUND(AVG(transaction_amount),2) AS average_transaction
FROM banking_transactions
GROUP BY bank_name
ORDER BY average_transaction DESC;


-- =============================================================
-- Query 18 : Average Transaction by Account Type
-- =============================================================

SELECT
    account_type,
    ROUND(AVG(transaction_amount),2) AS average_transaction
FROM banking_transactions
GROUP BY account_type
ORDER BY average_transaction DESC;


-- =============================================================
-- Query 19 : High Risk Customers by Bank
-- =============================================================

SELECT
    bank_name,
    COUNT(*) AS high_risk_customers
FROM banking_transactions
WHERE risk_category = 'High'
GROUP BY bank_name
ORDER BY high_risk_customers DESC;


-- =============================================================
-- Query 20 : Executive KPI Dashboard
-- =============================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT client_id) AS unique_clients,
    SUM(transaction_amount) AS total_transaction,
    ROUND(AVG(transaction_amount),2) AS average_transaction,
    MAX(transaction_amount) AS highest_transaction,
    MIN(transaction_amount) AS lowest_transaction,
    ROUND(AVG(interest_rate),2) AS average_interest_rate
FROM banking_transactions;
