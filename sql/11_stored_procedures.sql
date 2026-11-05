
-- ============================================================
-- BANKING DATA ANALYTICS PROJECT
-- File: 11_stored_procedures.sql
-- Author: Faisal Kader
-- Database: banking_analytics
--
-- Purpose:
-- Reusable PostgreSQL functions for banking reporting.
--
-- Source table: banking_transactions_clean_v2
-- Verified cleaned records: 24,998
--
-- Currency note:
-- Monetary totals across multiple currencies are
-- unconverted and not single-currency financial KPIs.
-- ============================================================


-- ============================================================
-- FUNCTION 1: CUSTOMER DETAILS
-- ============================================================

CREATE OR REPLACE FUNCTION
get_customer_details_v2(p_client_id TEXT)
RETURNS TABLE (
    client_id TEXT,
    client_name TEXT,
    bank_name TEXT,
    account_type TEXT,
    currency TEXT,
    transaction_amount NUMERIC
)
LANGUAGE SQL
STABLE
AS $$
    SELECT
        t.client_id,
        t.client_name,
        t.bank_name,
        t.account_type,
        t.currency,
        t.transaction_amount
    FROM banking_transactions_clean_v2 AS t
    WHERE t.client_id = p_client_id;
$$;


-- ============================================================
-- FUNCTION 2: BANK FINANCIAL SUMMARY BY CURRENCY
-- ============================================================

CREATE OR REPLACE FUNCTION
get_bank_transaction_summary_v2()
RETURNS TABLE (
    bank_name TEXT,
    currency TEXT,
    total_records BIGINT,
    total_transaction_amount NUMERIC
)
LANGUAGE SQL
STABLE
AS $$
    SELECT
        t.bank_name,
        COALESCE(t.currency, 'Unknown'),
        COUNT(*),
        SUM(t.transaction_amount)
    FROM banking_transactions_clean_v2 AS t
    GROUP BY
        t.bank_name,
        COALESCE(t.currency, 'Unknown')
    ORDER BY t.bank_name, 2;
$$;


-- ============================================================
-- FUNCTION 3: DATA QUALITY SUMMARY BY BANK
-- ============================================================

CREATE OR REPLACE FUNCTION
get_data_quality_summary_v2()
RETURNS TABLE (
    bank_name TEXT,
    total_records BIGINT,
    missing_client_ids BIGINT,
    missing_transaction_amounts BIGINT
)
LANGUAGE SQL
STABLE
AS $$
    SELECT
        t.bank_name,
        COUNT(*),
        COUNT(*) FILTER (
            WHERE t.client_id IS NULL
        ),
        COUNT(*) FILTER (
            WHERE t.transaction_amount IS NULL
        )
    FROM banking_transactions_clean_v2 AS t
    GROUP BY t.bank_name
    ORDER BY t.bank_name;
$$;


-- ============================================================
-- FUNCTION 4: ACCOUNT PORTFOLIO SUMMARY
-- ============================================================

CREATE OR REPLACE FUNCTION
get_account_summary_v2()
RETURNS TABLE (
    account_type TEXT,
    total_records BIGINT,
    unique_clients BIGINT
)
LANGUAGE SQL
STABLE
AS $$
    SELECT
        COALESCE(t.account_type, 'Unknown'),
        COUNT(*),
        COUNT(DISTINCT NULLIF(TRIM(t.client_id), ''))
    FROM banking_transactions_clean_v2 AS t
    GROUP BY COALESCE(t.account_type, 'Unknown')
    ORDER BY total_records DESC;
$$;


-- ============================================================
-- FUNCTION 5: EXECUTIVE KPI SUMMARY
-- ============================================================

CREATE OR REPLACE FUNCTION
get_executive_summary_v2()
RETURNS TABLE (
    total_records BIGINT,
    unique_clients BIGINT,
    valid_transaction_amounts BIGINT,
    missing_transaction_amounts BIGINT,
    sum_of_recorded_amounts NUMERIC,
    average_recorded_amount NUMERIC,
    average_interest_rate NUMERIC
)
LANGUAGE SQL
STABLE
AS $$
    SELECT
        COUNT(*),
        COUNT(DISTINCT NULLIF(TRIM(client_id), '')),
        COUNT(transaction_amount),
        COUNT(*) FILTER (
            WHERE transaction_amount IS NULL
        ),
        ROUND(SUM(transaction_amount), 2),
        ROUND(AVG(transaction_amount), 2),
        ROUND(AVG(interest_rate), 2)
    FROM banking_transactions_clean_v2;
$$;


-- ============================================================
-- TEST THE FUNCTIONS
-- ============================================================

SELECT *
FROM get_customer_details_v2('70435');

SELECT *
FROM get_bank_transaction_summary_v2();

SELECT *
FROM get_data_quality_summary_v2();

SELECT *
FROM get_account_summary_v2();

SELECT *
FROM get_executive_summary_v2();


-- ============================================================
-- EXPECTED EXECUTIVE RESULTS
-- ============================================================

-- Total records: 24,998
-- Unique clients: 11,676
-- Valid transaction amounts: 16,663
-- Missing transaction amounts: 8,335
-- Sum of recorded amounts: 4,170,755,712.00
-- Average recorded amount: 250,300.41
-- Average interest rate: 6.99%
--
-- Financial sums include multiple currencies.
-- ============================================================
