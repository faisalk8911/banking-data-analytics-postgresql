
# Banking Data Cleaning and Validation Report

**Project:** End-to-End Banking Data Analytics using PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Source:** Simulated Banking Dataset

---

## 1. Executive Summary

This project demonstrates a structured SQL-based data cleaning workflow using PostgreSQL.

The original dataset contained 25,500 banking records with missing values, inconsistent formats, and duplicate transactions.

After data standardization, financial data conversion, validation, and duplicate removal, the final cleaned dataset contains 24,998 records.

## 2. Verified Dataset Summary

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Staging records | 25,500 |
| Duplicate rows removed | 502 |
| Final cleaned records | 24,998 |
| Unique identified clients | 11,676 |
| Valid final transaction amounts | 16,663 |
| Missing final transaction amounts | 8,335 |

## 3. Initial Data Quality Assessment

| Issue | Raw Records Affected |
|---|---:|
| Missing client IDs | 12,726 |
| Missing transaction amounts | 8,505 |
| Missing bank names | 4,325 |
| Missing maturity dates | 6,380 |

Missing values were preserved where the source information was unavailable.

## 4. Data Cleaning Activities

### Text Standardization

- Removed unnecessary leading and trailing spaces.
- Converted empty strings to SQL NULL.
- Standardized bank names.
- Standardized account types and loan statuses.
- Normalized currency codes.
- Assigned Unknown Bank to missing bank names.

### Financial Data Conversion

Transaction amounts were converted from formatted text into NUMERIC(15,2).

Interest rates were converted into NUMERIC(6,2), interpreting embedded spaces as decimal separators under the documented source-format assumption.

### Date Conversion

Converted maturity dates from three formats:

- DD-MM-YYYY
- YYYY.MM.DD
- MM/DD/YYYY

All 19,120 non-missing dates were converted, with zero representation mismatches in the validation check.

## 5. Duplicate Detection

PostgreSQL ROW_NUMBER() was used to identify duplicate records across the 12 standardized source business fields.

Repeated client IDs alone were not treated as duplicate transactions.

**Verified result:**

25,500 original records - 502 duplicate rows = 24,998 cleaned records.

## 6. Final Financial Data Summary

| Metric | Verified Value |
|---|---:|
| Final records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Sum of recorded transaction amounts | 4,170,755,712.00 |
| Average recorded transaction amount | 250,300.41 |
| Average interest rate | 6.99% |

**Important:** Transaction amounts include multiple currencies without foreign-exchange conversion. Combined monetary values should not be interpreted as single-currency financial totals.

## 7. PostgreSQL Tables

| Table | Purpose |
|---|---|
| banking_transactions_raw | Preserve original data |
| banking_transactions_staging | Data cleaning and conversion |
| banking_transactions_clean_v2 | Final reporting dataset |

## 8. Business Value

The completed workflow demonstrates:

- SQL data profiling and quality assessment
- Text and financial data standardization
- Duplicate identification and removal
- Preservation of legitimate transactions
- Reusable reporting datasets
- Financial reporting and data-quality monitoring

## 9. Conclusion

The PostgreSQL workflow transformed 25,500 raw banking records into 24,998 deduplicated analytical records.

The final dataset supports SQL-based bank performance analysis, account portfolio reporting, customer segmentation, and data-quality monitoring.

---

**Author:** Faisal Kader  
**Tools:** PostgreSQL, SQL, pgAdmin 4, GitHub
