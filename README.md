# End-to-End Banking Data Analytics with PostgreSQL

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F2027,50:203A43,100:2C5364&height=220&section=header&text=Banking%20Data%20Analytics&fontSize=42&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=End-to-End%20SQL%20Analytics%20Project%20using%20PostgreSQL&descAlignY=58&descSize=18" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-16-336791?logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-Advanced-blue" />
  <img src="https://img.shields.io/badge/Data%20Analytics-Banking-orange" />
  <img src="https://img.shields.io/badge/Project-Completed-success" />
  <img src="https://img.shields.io/badge/License-MIT-green" />
</p>

---

## Project Overview

This project demonstrates a complete end-to-end banking data analytics workflow using PostgreSQL.

The project starts with a raw banking dataset containing customer, bank, account, transaction, loan, risk, maturity, and contact information. The raw data is imported into PostgreSQL, cleaned, validated, deduplicated, transformed into reporting views, analyzed using business-focused SQL queries, and optimized using indexes and execution plan analysis.

The goal of this project is to simulate a real-world SQL analytics workflow commonly used by Data Analysts, Business Intelligence Analysts, Reporting Analysts, and SQL Developers in the banking and financial services industry.

This is not just a collection of SQL queries. It is a structured portfolio project that demonstrates how raw financial data can be transformed into a clean, reliable, and analysis-ready database for business reporting and decision-making.

---

## ⭐ Key Features

* 🏦 End-to-End Banking Data Analytics Project
* 🗄️ PostgreSQL Database Design & Development
* 📥 CSV Data Import into PostgreSQL
* 🧹 Data Cleaning & Standardization
* ✔️ Data Validation & Quality Checks
* 🔍 Duplicate Detection & Removal
* 📊 20 Business-Focused SQL Analysis Queries
* 📈 Reusable SQL Reporting Views
* ⚡ Query Performance Optimization
* 🚀 Index Creation for Faster Query Execution
* ⚙️ Reusable PostgreSQL Functions
* 📚 Professional Project Documentation
* 🌐 GitHub Portfolio Ready

---

## Business Problem

Banks and financial institutions generate large amounts of customer, account, loan, and transaction data every day. However, raw financial data is often messy, duplicated, incomplete, and inconsistent.

Common data issues include:

* Missing customer information
* Duplicate transaction records
* Inconsistent bank names
* Invalid or missing contact details
* Unknown risk categories
* Missing loan statuses
* Unstandardized account types
* Inconsistent maturity information

These problems can negatively affect business reporting, customer segmentation, risk analysis, loan monitoring, transaction summaries, and executive decision-making.

This project solves the problem by building a PostgreSQL-based analytics workflow that cleans, validates, organizes, and analyzes banking data so it can be used for accurate reporting and business intelligence.

---

## Project Objectives

The main objectives of this project are to:

* Design and create a PostgreSQL database
* Import raw banking transaction data from CSV
* Clean missing, inconsistent, and invalid values
* Validate the dataset for reporting accuracy
* Detect and remove duplicate records
* Create reusable SQL reporting views
* Perform business-focused SQL analysis
* Generate key banking KPIs
* Optimize query performance using indexes
* Analyze SQL execution plans using `EXPLAIN` and `EXPLAIN ANALYZE`
* Develop reusable PostgreSQL functions
* Document the project in a professional GitHub portfolio format

---

## Dataset Summary

The dataset contains simulated banking customer and transaction records representing common financial operations in commercial banking.

### Dataset Statistics

| Metric                    |  Value |
| ------------------------- | -----: |
| Original Records          | 25,500 |
| Final Clean Records       | 24,997 |
| Duplicate Records Removed |    503 |
| Unique Clients            | 11,676 |

### Data Domains

The dataset includes the following banking domains:

* Customer information
* Bank information
* Account information
* Financial transactions
* Loan status
* Interest rates
* Risk classification
* Contact information
* Account maturity status

### Main Columns

| Column               | Description                               |
| -------------------- | ----------------------------------------- |
| `client_id`          | Unique customer identifier                |
| `client_name`        | Customer name                             |
| `bank_name`          | Bank name                                 |
| `account_type`       | Type of banking account                   |
| `currency`           | Transaction currency                      |
| `transaction_amount` | Transaction value                         |
| `interest_rate`      | Interest rate associated with the account |
| `risk_category`      | Customer risk classification              |
| `maturity_date`      | Account maturity date                     |
| `maturity_status`    | Account maturity status                   |
| `email`              | Customer email address                    |
| `phone`              | Customer phone number                     |
| `loan_status`        | Loan approval status                      |
| `remarks`            | Additional business remarks               |

---

## Repository Structure

```text
Banking_Data_Analytics_SQL_Project/
│
├── data/
│   ├── raw/
│   │   └── banking_data_raw.csv
│   │
│   └── cleaned/
│       └── banking_data_cleaned.csv
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_create_table.sql
│   ├── 03_import_data.sql
│   ├── 04_data_cleaning.sql
│   ├── 05_data_validation.sql
│   ├── 06_duplicate_removal.sql
│   ├── 07_reporting_views.sql
│   ├── 08_analysis_queries.sql
│   ├── 09_indexes.sql
│   ├── 10_performance_optimization.sql
│   └── 11_stored_procedures.sql
│
├── docs/
│   ├── data_dictionary.md
│   ├── data_cleaning_report.md
│   ├── query_results.md
│   ├── performance_optimization_report.md
│   └── project_summary.md
│
├── images/
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## Project Notes

* All SQL queries are organized into separate SQL files inside the `sql/` folder.
* The README provides the project overview, workflow, selected sample queries, business KPIs, and documentation structure.
* Screenshots, dashboard previews, and additional prepared materials will be added in future updates.
* The final repository link will be updated once the GitHub repository name is confirmed.

---

## Project Workflow

The project follows a structured analytics workflow used in real-world SQL and business intelligence projects.

```text
Raw Banking Dataset
        │
        ▼
Database Creation
        │
        ▼
CSV Data Import
        │
        ▼
Data Cleaning
        │
        ▼
Data Validation
        │
        ▼
Duplicate Detection and Removal
        │
        ▼
Reporting View Creation
        │
        ▼
Business Analysis
        │
        ▼
Indexing and Query Optimization
        │
        ▼
PostgreSQL Function Development
        │
        ▼
Business Reporting
```

---

## Database Architecture

The project is built around one core transactional table in PostgreSQL.

| Table                  | Description                                                                          |
| ---------------------- | ------------------------------------------------------------------------------------ |
| `banking_transactions` | Stores customer, account, transaction, loan, risk, maturity, and contact information |

Although the project uses one main table, the SQL workflow demonstrates practical analytics operations such as data cleaning, validation, duplicate handling, aggregation, reporting views, indexing, execution plan analysis, and reusable function development.

---

## Database Design Approach

The current project uses a central analytics table called `banking_transactions`.

This approach is useful for SQL analytics projects because it keeps the workflow simple, focused, and easy to analyze. It is suitable for data cleaning, validation, aggregation, reporting views, KPI generation, and dashboard preparation.

### Current Analytics Table

| Table                  | Description                                                                                                        |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `banking_transactions` | Stores customer, bank, account, transaction, loan, risk, maturity, and contact information in one analytical table |

### Recommended Production-Level Design

For a more advanced real-world banking system, the database could be normalized into multiple related tables.

| Table           | Description                                                       |
| --------------- | ----------------------------------------------------------------- |
| `customers`     | Stores customer details such as client ID, name, email, and phone |
| `banks`         | Stores bank names and bank-level information                      |
| `accounts`      | Stores account type, currency, maturity date, and maturity status |
| `transactions`  | Stores transaction amount and transaction-related details         |
| `loans`         | Stores loan status and loan-related information                   |
| `risk_profiles` | Stores customer risk categories and risk classification data      |

### Suggested Entity Relationship Structure

```text
customers
    │
    ├── accounts
    │       │
    │       └── transactions
    │
    ├── loans
    │
    └── risk_profiles

banks
    │
    └── accounts
```

### Why This Design Matters

A normalized design would improve:

* Data consistency
* Data integrity
* Scalability
* Relationship management
* Query flexibility
* Long-term database maintenance

However, for this portfolio project, the single-table analytics model is still effective because the main goal is to demonstrate SQL analytics, data cleaning, validation, reporting, optimization, and business insight generation.

---

## SQL Modules

| SQL File                          | Purpose                                           |
| --------------------------------- | ------------------------------------------------- |
| `01_database_setup.sql`           | Creates the PostgreSQL database                   |
| `02_create_table.sql`             | Creates the main banking transactions table       |
| `03_import_data.sql`              | Imports the raw CSV dataset                       |
| `04_data_cleaning.sql`            | Cleans missing, invalid, and inconsistent values  |
| `05_data_validation.sql`          | Performs data quality checks                      |
| `06_duplicate_removal.sql`        | Detects and removes duplicate records             |
| `07_reporting_views.sql`          | Creates reusable reporting views                  |
| `08_analysis_queries.sql`         | Contains 20 business-focused SQL analysis queries |
| `09_indexes.sql`                  | Creates indexes for frequently queried columns    |
| `10_performance_optimization.sql` | Evaluates query performance using execution plans |
| `11_stored_procedures.sql`        | Creates reusable PostgreSQL functions             |

---

## Data Cleaning Process

Raw banking datasets often contain incomplete and inconsistent data. The cleaning process focused on improving data quality while preserving the integrity of the original records.

### Cleaning Tasks Performed

| Task                    | Description                                                      |
| ----------------------- | ---------------------------------------------------------------- |
| Missing value handling  | Identified and handled missing values across key columns         |
| Text standardization    | Standardized bank names, categories, and business fields         |
| Invalid email detection | Identified invalid email formats                                 |
| Missing phone handling  | Replaced missing phone numbers with a consistent placeholder     |
| Unknown bank handling   | Standardized unknown bank values                                 |
| Missing client IDs      | Preserved missing IDs instead of creating artificial identifiers |
| Date validation         | Checked maturity dates for consistency                           |
| Numeric validation      | Verified transaction amounts and interest rates                  |

---

## Data Validation

After cleaning, validation checks were performed to confirm that the dataset was suitable for business analysis and reporting.

Validation checks included:

* NULL value assessment
* Invalid email detection
* Missing phone number detection
* Bank name consistency checks
* Account type validation
* Loan status validation
* Risk category review
* Interest rate validation
* Transaction amount verification
* Maturity date validation

These checks help ensure that the final dataset is reliable for KPI reporting, business analysis, and dashboard development.

---

## Duplicate Detection and Removal

Duplicate records can distort customer counts, transaction totals, loan summaries, risk analysis, and financial KPIs. A duplicate detection and removal process was implemented using PostgreSQL logic.

### Duplicate Removal Summary

| Metric                    |  Value |
| ------------------------- | -----: |
| Original Records          | 25,500 |
| Duplicate Records Removed |    503 |
| Final Clean Records       | 24,997 |

The process removed duplicate records while preserving valid transactional data.

---

## Reporting Views

Reusable SQL views were created to simplify reporting and reduce repetitive query writing.

| View                     | Purpose                            |
| ------------------------ | ---------------------------------- |
| `vw_customer_summary`    | Customer-level reporting           |
| `vw_bank_summary`        | Bank performance reporting         |
| `vw_account_summary`     | Account type analysis              |
| `vw_currency_summary`    | Currency distribution reporting    |
| `vw_risk_summary`        | Risk category analysis             |
| `vw_loan_status_summary` | Loan approval and status reporting |
| `vw_maturity_summary`    | Account maturity reporting         |

These views make the database easier to use for dashboards, reports, and business analysis.

---

## Business Analysis

The project includes 20 business-focused SQL queries designed to answer realistic banking analytics questions.

The analysis covers:

* Overall banking performance
* Customer distribution
* Transaction analysis
* Bank performance
* Account type analysis
* Interest rate analysis
* Currency distribution
* Risk segmentation
* Loan status analysis
* Account maturity analysis
* Monthly account trends
* Executive KPI reporting

---

## Sample SQL Query Preview

All full SQL queries are stored in separate `.sql` files inside the `sql/` folder. Below are selected examples that show the type of SQL logic used in the project.

### 1. Find Duplicate Records

```sql
WITH duplicate_records AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY client_id, bank_name, account_type, transaction_amount, maturity_date
            ORDER BY client_id
        ) AS row_num
    FROM banking_transactions
)
SELECT *
FROM duplicate_records
WHERE row_num > 1;
```

This query uses a window function to detect duplicate banking records based on key business columns.

### 2. Total Transaction Amount by Bank

```sql
SELECT
    bank_name,
    COUNT(*) AS total_customers,
    SUM(transaction_amount) AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount
FROM banking_transactions
GROUP BY bank_name
ORDER BY total_transaction_amount DESC;
```

This query compares bank performance based on customer count and transaction volume.

### 3. High-Risk Customers by Bank

```sql
SELECT
    bank_name,
    COUNT(*) AS high_risk_customers
FROM banking_transactions
WHERE risk_category = 'High'
GROUP BY bank_name
ORDER BY high_risk_customers DESC;
```

This query supports risk analysis by identifying banks with the highest number of high-risk customers.

### 4. Loan Status Distribution

```sql
SELECT
    loan_status,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM banking_transactions
GROUP BY loan_status
ORDER BY total_customers DESC;
```

This query shows the distribution of approved, rejected, pending, and unknown loan statuses.

### 5. Query Performance Analysis

```sql
EXPLAIN ANALYZE
SELECT
    bank_name,
    SUM(transaction_amount) AS total_transaction_amount
FROM banking_transactions
WHERE risk_category = 'High'
GROUP BY bank_name
ORDER BY total_transaction_amount DESC;
```

This query is used to review the execution plan, measure query performance, and evaluate whether indexes improve reporting speed.

---

## Key Business KPIs

| KPI                        |            Value |
| -------------------------- | ---------------: |
| Total Clean Records        |           24,997 |
| Unique Clients             |           11,676 |
| Total Transaction Amount   | 4,170,755,712.00 |
| Average Transaction Amount |       250,300.41 |
| Highest Transaction Amount |       499,972.00 |
| Lowest Transaction Amount  |         1,049.00 |
| Average Interest Rate      |            6.99% |

---

## Bank Performance Insights

### Customer Distribution by Bank

| Bank         | Customers |
| ------------ | --------: |
| Unknown Bank |     4,240 |
| BOFA         |     4,226 |
| CITI         |     4,214 |
| HSBC         |     4,159 |
| CHASE        |     4,144 |
| Wells Fargo  |     4,014 |

### Total Transaction Amount by Bank

| Bank         | Total Transaction Amount |
| ------------ | -----------------------: |
| BOFA         |           728,377,576.00 |
| CITI         |           697,919,368.00 |
| Unknown Bank |           692,871,342.00 |
| CHASE        |           692,329,068.00 |
| Wells Fargo  |           681,074,161.00 |
| HSBC         |           678,184,197.00 |

### Average Interest Rate by Bank

| Bank         | Average Interest Rate |
| ------------ | --------------------: |
| BOFA         |                 7.08% |
| Wells Fargo  |                 6.99% |
| CITI         |                 6.98% |
| CHASE        |                 6.98% |
| Unknown Bank |                 6.97% |
| HSBC         |                 6.95% |

---

## Account Analysis

### Customer Distribution by Account Type

| Account Type | Customers |
| ------------ | --------: |
| Loan         |     6,357 |
| Current      |     6,217 |
| Investment   |     6,213 |
| Savings      |     6,210 |

### Transaction Amount by Account Type

| Account Type | Total Transaction Amount |
| ------------ | -----------------------: |
| Loan         |         1,053,743,923.00 |
| Investment   |         1,051,150,974.00 |
| Current      |         1,035,398,895.00 |
| Savings      |         1,030,461,920.00 |

### Average Transaction Amount by Account Type

| Account Type | Average Transaction Amount |
| ------------ | -------------------------: |
| Current      |                 252,968.21 |
| Savings      |                 251,148.41 |
| Investment   |                 249,146.95 |
| Loan         |                 248,056.48 |

---

## Risk Analysis

### Customer Distribution by Risk Category

| Risk Category | Customers |
| ------------- | --------: |
| Unknown       |     8,334 |
| High          |     6,689 |
| Medium        |     6,623 |
| Low           |     3,351 |

### High-Risk Customers by Bank

| Bank         | High-Risk Customers |
| ------------ | ------------------: |
| BOFA         |               1,160 |
| CITI         |               1,143 |
| Wells Fargo  |               1,115 |
| CHASE        |               1,114 |
| Unknown Bank |               1,085 |
| HSBC         |               1,072 |

---

## Loan Analysis

| Loan Status | Customers |
| ----------- | --------: |
| Rejected    |     6,300 |
| Pending     |     6,256 |
| Approved    |     6,224 |
| Unknown     |     6,217 |

---

## Currency Distribution

| Currency | Accounts |
| -------- | -------: |
| Unknown  |    5,023 |
| BDT      |    5,014 |
| EUR      |    5,004 |
| GBP      |    5,000 |
| USD      |    4,956 |

---

## Account Maturity Analysis

| Maturity Status | Accounts |
| --------------- | -------: |
| Expired         |   18,746 |
| Unknown         |    6,251 |

---

## Dashboard / Reporting Preview

This project is designed to support business intelligence reporting and dashboard development.

Although the main focus of this project is SQL and PostgreSQL, the cleaned dataset and reporting views can be used to create dashboards in tools such as Power BI, Tableau, Excel, or Looker Studio.

Screenshots and dashboard previews will be added in future updates.

### Suggested Dashboard Pages

| Dashboard Page      | Description                                                                                                             |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Executive Overview  | Displays total records, unique clients, total transaction amount, average transaction amount, and average interest rate |
| Bank Performance    | Compares customer count, transaction volume, and average interest rate by bank                                          |
| Account Analysis    | Shows customer distribution and transaction volume by account type                                                      |
| Risk Analysis       | Highlights high-risk customers, unknown risk records, and risk distribution by bank                                     |
| Loan Analysis       | Displays approved, rejected, pending, and unknown loan statuses                                                         |
| Currency Analysis   | Shows account distribution by transaction currency                                                                      |
| Data Quality Report | Tracks duplicate records, missing values, unknown categories, and invalid contact information                           |

### Main Dashboard KPIs

| KPI                        |            Value |
| -------------------------- | ---------------: |
| Total Clean Records        |           24,997 |
| Unique Clients             |           11,676 |
| Duplicate Records Removed  |              503 |
| Total Transaction Amount   | 4,170,755,712.00 |
| Average Transaction Amount |       250,300.41 |
| Highest Transaction Amount |       499,972.00 |
| Lowest Transaction Amount  |         1,049.00 |
| Average Interest Rate      |            6.99% |

This reporting structure helps business users quickly understand banking performance, customer segmentation, loan distribution, transaction activity, and data quality issues.

---

## Performance Optimization

Indexes were created on frequently queried columns to improve filtering, sorting, grouping, and reporting performance.

### Indexed Columns

* `client_id`
* `bank_name`
* `account_type`
* `currency`
* `transaction_amount`
* `loan_status`
* `maturity_date`
* `risk_category`

### Performance Analysis Techniques Used

* `EXPLAIN`
* `EXPLAIN ANALYZE`
* Query cost evaluation
* Execution plan review
* Index utilization analysis

These techniques help identify slow queries, understand how PostgreSQL executes SQL statements, and improve database performance.

---

## PostgreSQL Functions

Reusable PostgreSQL functions were created to simplify reporting and reduce repetitive SQL logic.

The functions support:

* Customer reporting
* Bank summaries
* Account summaries
* Risk reporting
* Transaction summaries

Using functions improves maintainability and makes the SQL project more modular.

---

## Executive Business Insights

The completed analysis generated several useful insights from the banking dataset:

* The cleaned dataset contains 24,997 valid records after removing 503 duplicates.
* The dataset includes 11,676 unique clients.
* Total simulated transaction volume is over 4.17 billion.
* BOFA generated the highest total transaction amount.
* Unknown Bank has the largest number of customer records, showing a data quality improvement opportunity.
* Loan accounts represent the largest account segment.
* 6,689 customers are classified as High Risk.
* 8,334 customers have Unknown Risk classification, highlighting another data quality issue.
* Transaction activity is relatively balanced across major banks.
* SQL views and functions make the reporting workflow reusable and easier to maintain.

---

## Skills Demonstrated

### SQL

* Data querying
* Aggregate functions
* Filtering and sorting
* `CASE` expressions
* Window functions
* Common Table Expressions
* `GROUP BY` and `HAVING`
* Views
* Indexes
* PostgreSQL functions
* Query optimization

### Database Development

* PostgreSQL database setup
* Table creation
* CSV data import
* Data cleaning
* Data validation
* Duplicate removal
* Index creation
* Execution plan analysis
* Performance tuning

### Data Analytics

* Data transformation
* Data quality assessment
* KPI reporting
* Banking analytics
* Customer segmentation
* Risk analysis
* Loan analysis
* Business reporting

### Professional Tools

* PostgreSQL 16
* pgAdmin 4
* SQL
* CSV
* Git
* GitHub

---

## Technologies Used

| Technology    | Purpose                                          |
| ------------- | ------------------------------------------------ |
| PostgreSQL 16 | Relational database management system            |
| SQL           | Data querying, cleaning, analysis, and reporting |
| pgAdmin 4     | Database administration and query execution      |
| CSV           | Source data format                               |
| Git           | Version control                                  |
| GitHub        | Project hosting and documentation                |

---

## Getting Started

### Prerequisites

Install the following tools before running the project:

* PostgreSQL 16 or later
* pgAdmin 4
* Git

### Clone the Repository

```bash
git clone
https://github.com/faisalk8911/banking-data-analytics-postgresql.git
```



### Run the SQL Scripts

Execute the SQL scripts in the following order:

```text
01_database_setup.sql
02_create_table.sql
03_import_data.sql
04_data_cleaning.sql
05_data_validation.sql
06_duplicate_removal.sql
07_reporting_views.sql
08_analysis_queries.sql
09_indexes.sql
10_performance_optimization.sql
11_stored_procedures.sql
```

---

## Project Outcomes

By completing this project, the raw banking dataset was transformed into a clean, structured, and analysis-ready PostgreSQL database.

The project successfully:

* Imported raw banking data into PostgreSQL
* Cleaned and standardized inconsistent records
* Validated data quality
* Removed duplicate records
* Created reusable SQL reporting views
* Generated banking KPIs and business insights
* Improved query performance using indexes
* Analyzed SQL execution plans
* Built reusable PostgreSQL functions
* Produced professional project documentation for GitHub and portfolio use

---

## Future Improvements

Possible future enhancements include:

* Adding project screenshots and query result previews
* Adding dashboard screenshots after Power BI or Excel dashboard development
* Updating the final GitHub repository URL
* Adding more prepared documentation files inside the `docs/` folder
* Creating a normalized database schema with separate customer, bank, account, transaction, loan, and risk tables
* Automating the ETL process using Python
* Adding automated data quality checks
* Deploying the PostgreSQL database to a cloud platform
* Creating a REST API for reporting access
* Expanding the project into a data warehouse model
* Adding customer segmentation using machine learning

---

## License

This project is licensed under the MIT License.

---

## Author

**Faisal Kader**
SQL Developer | Data Analytics Enthusiast | PostgreSQL | Business Intelligence

GitHub: `https://github.com/faisalk8911`

---

## Acknowledgements

This project was created as a portfolio project to demonstrate practical SQL, PostgreSQL, and data analytics skills using a realistic banking dataset.

It showcases the complete process of transforming raw banking data into a clean analytical database with reporting, optimization, and business insight generation.
