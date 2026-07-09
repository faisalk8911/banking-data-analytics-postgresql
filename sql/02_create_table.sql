-- =====================================================
-- Banking Data Analytics Project
-- File: 02_create_table.sql
-- Description: Create the main banking transactions table
-- Author: Faisal Kader
-- =====================================================

CREATE TABLE banking_transactions (
    client_id INT,
    client_name VARCHAR(100),
    bank_name VARCHAR(50),
    account_type VARCHAR(30),
    currency VARCHAR(10),
    transaction_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    maturity_date DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    loan_status VARCHAR(20),
    remarks VARCHAR(100)
);
