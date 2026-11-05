
# Banking Data Quality Report

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This report presents the data quality assessment and cleaning results of a simulated banking dataset containing 25,500 records.

The SQL workflow involved missing-value assessment, category standardization, numeric and date conversion, validation, and exact duplicate removal.

The final cleaned dataset contains 24,998 records after removing 502 duplicate rows.

## 2. Verified Dataset Summary

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Staging records | 25,500 |
| Duplicate rows removed | 502 |
| Final cleaned records | 24,998 |
| Unique identified clients | 11,676 |

## 3. Initial Data Quality Findings

| Data Quality Issue | Affected Records | Percentage |
|---|---:|---:|
| Missing client IDs | 12,726 | 49.9% |
| Missing transaction amounts | 8,505 | 33.4% |
| Missing bank names | 4,325 | 17.0% |
| Missing maturity dates | 6,380 | 25.0% |

These findings demonstrate the need for data quality checks before financial reporting.

## 4. Data Cleaning Activities

### Missing Values

- Removed unnecessary whitespace.
- Converted blank strings into SQL NULL.
- Preserved missing customer identifiers.
- Preserved missing financial values.
- Assigned Unknown Bank to missing bank names.

### Standardization

Standardized the following fields:

- Customer names
- Bank names
- Account types
- Currency codes
- Loan statuses

### Data Type Conversion

- Converted transaction amounts into NUMERIC(15,2).
- Converted interest rates into NUMERIC(6,2).
- Converted maturity dates into PostgreSQL DATE.

Interest-rate conversion used a documented assumption that embedded spaces represented decimal separators.

## 5. Duplicate Detection and Removal

PostgreSQL ROW_NUMBER() was used to identify duplicate rows across 12 standardized business fields.

Repeated client IDs alone were not treated as duplicates.

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Duplicate rows removed | 502 |
| Final cleaned records | 24,998 |

## 6. Data Validation Results

| Validation Check | Result |
|---|---:|
| Valid transaction amounts in staging | 16,995 |
| Missing transaction amounts in staging | 8,505 |
| Converted interest rates | 12,600 |
| Missing interest rates | 12,900 |
| Unconverted interest rates | 0 |
| Converted maturity dates | 19,120 |
| Missing maturity dates | 6,380 |
| Date representation mismatches | 0 |

## 7. Final Data Quality Results

| Metric | Result |
|---|---:|
| Final cleaned records | 24,998 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Average interest rate | 6.99% |

Missing data was retained where source information was unavailable.

The cleaned dataset is suitable for SQL analytics with these completeness limitations clearly documented.

## 8. Business Value

The completed workflow supports:

- Financial data quality monitoring
- Duplicate detection and removal
- Consistent reporting categories
- Customer identification analysis
- Transaction completeness reporting
- Reusable SQL reporting
- Data-driven business decisions

## 9. Recommendations

- Monitor missing customer identifiers.
- Investigate Unknown Bank records.
- Validate financial values during data import.
- Establish source-system rules for date and interest-rate formats.
- Perform regular duplicate checks.
- Keep monetary reporting separated by currency unless FX conversion is applied.
- Introduce automated data-quality tests.

## 10. Conclusion

The SQL workflow transformed 25,500 raw banking records into 24,998 deduplicated records.

The resulting dataset supports banking analytics while retaining visibility into missing values and other source-data limitations.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4
