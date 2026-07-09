-- =====================================================
-- Banking Data Analytics Project
-- File: 03_import_data.sql
-- Description: Import raw banking data from CSV
-- Author: Faisal Kader
-- =====================================================

COPY banking_transactions
FROM '/path/to/banking_data.csv'
DELIMITER ','
CSV HEADER;

-- Replace '/path/to/banking_data.csv'
-- with the actual location of your CSV file
-- before executing this script.
