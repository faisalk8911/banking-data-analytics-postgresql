
# Banking Risk Data Readiness and Quality Assessment

**Project:** End-to-End Banking Data Analytics with PostgreSQL  
**Author:** Faisal Kader  
**Database:** banking_analytics  
**Dataset:** Simulated Banking Records

---

## 1. Executive Summary

This report assesses the suitability of the cleaned banking dataset for future customer risk analysis and compliance reporting.

The current analytical dataset contains financial, customer, account, and loan-status information.

However, it does not contain a verified customer risk classification field.

Therefore, this report focuses on data completeness, reporting limitations, and requirements for future risk analytics rather than presenting unsupported customer risk ratings.

## 2. Verified Dataset Summary

| Metric | Result |
|---|---:|
| Original records | 25,500 |
| Final cleaned records | 24,998 |
| Duplicate rows removed | 502 |
| Unique identified clients | 11,676 |
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |

## 3. Available Risk-Relevant Data

The cleaned dataset contains:

- Client ID
- Client name
- Bank name
- Account type
- Currency
- Transaction amount
- Interest rate
- Maturity date
- Loan status
- Email
- Phone
- Remarks

These fields may support future financial risk and data-quality analysis when combined with appropriate additional information.

## 4. Risk Analysis Limitations

The final cleaned dataset does not contain:

- Verified customer risk ratings
- Customer due diligence classifications
- Transaction monitoring alert outcomes
- Sanctions screening results
- Customer income or occupation details
- Verified credit risk scores

Therefore, the current project does not establish whether individual customers are low, medium, or high risk.

Loan status alone must not be interpreted as a customer risk rating.

## 5. Customer Identification Completeness

The original dataset contained 12,726 records with missing client IDs.

Missing identifiers create challenges for:

- Customer-level aggregation
- Relationship analysis
- Historical activity monitoring
- Customer due diligence reporting
- Identification of repeated customer activity

Improving customer identifier completeness would strengthen future risk-related reporting.

## 6. Financial Data Completeness

The final cleaned dataset contains:

| Metric | Result |
|---|---:|
| Valid transaction amounts | 16,663 |
| Missing transaction amounts | 8,335 |
| Average recorded amount | 250,300.41 |

Financial values are recorded in multiple currencies.

For meaningful comparisons, monetary values should be separated by currency or converted using documented foreign-exchange rates.

## 7. Bank Classification Quality

The cleaned dataset contains 4,240 records categorized as Unknown Bank.

This represents a significant data-quality limitation.

Reliable bank identification would be important for future institution-level risk assessment, reporting, and investigation.

## 8. SQL-Based Risk Data Readiness

The current PostgreSQL solution demonstrates techniques useful for preparing risk analytics datasets:

- Missing-value detection
- Duplicate identification
- Customer identifier analysis
- Financial data validation
- Bank classification standardization
- Loan status reporting
- Data-quality aggregation
- Reusable reporting views

These activities improve analytical readiness but do not constitute a complete AML, credit risk, or regulatory compliance system.

## 9. Recommended Future Enhancements

Future risk analytics could incorporate:

1. Verified customer risk classifications.
2. Customer due diligence information.
3. Customer occupation and industry.
4. Transaction dates and counterparties.
5. Country and geographic risk indicators.
6. Screening and monitoring outcomes.
7. Customer risk assessment history.
8. Documented risk-scoring methodology.

Additional data should be validated before developing risk indicators.

## 10. Business Value

This assessment demonstrates the importance of data completeness and reliable source information for:

- Banking analytics
- Risk data preparation
- Customer due diligence support
- Financial data quality monitoring
- Compliance reporting readiness
- Management reporting

## 11. Conclusion

The project demonstrates SQL-based data preparation and quality assessment using 24,998 cleaned banking records.

While the dataset supports customer, account, transaction, and loan-status analysis, it does not support verified customer risk classification.

The existing PostgreSQL workflow establishes a foundation for future risk analytics when suitable risk-related data becomes available.

---

**Author:** Faisal Kader  
**Technologies:** PostgreSQL, SQL, pgAdmin 4

**Repository:** https://github.com/faisalk8911/banking-data-analytics-postgresql
