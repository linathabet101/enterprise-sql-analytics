
# Enterprise SQL Analytics Engineering

A hands-on SQL and data engineering project demonstrating how we can transform an operational insurance database into a structured analytical data warehouse, validate data quality, optimize queries, and produce automated business reports.

Using PostgreSQL and Python, we follow an end-to-end workflow that progresses from relational database fundamentals to enterprise-style analytics and reporting.

---

## 1. What Is This Project About?

Imagine an insurance company that manages thousands of customers and insurance policies.

Its database contains information such as:

- Who its customers are.
- Which insurance policies they hold.
- What type of insurance each policy represents.
- When policies become effective or expire.
- How much premium each policy generates.
- Whether a policy is active, expired, or cancelled.

Storing this information is only the beginning.

The company also needs to answer important business questions:

- How many policies are currently managed?
- How much insurance premium is generated?
- Which customers have the largest portfolios?
- Which insurance products perform best?
- How does business production evolve over time?
- Are the analytical figures consistent with the operational records?
- Can we generate reports repeatedly and reliably?

Throughout this project, we explore the SQL and data engineering processes required to answer these questions.

Starting with a relational database, we progressively develop an analytical environment with staging views, a dimensional data warehouse, historical data management, production transformations, data quality checks, performance optimization, and business reporting.

**The database uses fictional insurance data. No real customer information is included.**

---

## 2. What Will We Build?

By working through this project, we develop an analytical data environment composed of several interconnected components.

| Component | Purpose |
|---|---|
| Operational database | Stores customers, policies, and business information. |
| SQL analytical layer | Uses SQL queries and views to explore and transform business data. |
| Staging layer | Prepares source data for analytical transformations. |
| Data warehouse | Organizes information into dimensions and fact tables. |
| Historical data management | Preserves changes in customer information over time. |
| Production ETL process | Automates the loading and maintenance of warehouse data. |
| Data quality layer | Identifies and summarizes potential data issues. |
| Performance layer | Uses indexes and query analysis to improve database performance. |
| Reporting layer | Produces business reports and key performance indicators. |
| Python reporting engine | Executes selected SQL queries and exports their results. |

Our objective is not simply to write SQL queries. We aim to understand how the different components of a data analytics environment work together.

---

## 3. Project Architecture

The following diagram illustrates the overall data flow we develop throughout the project.

```text
                  OPERATIONAL DATABASE
                  -------------------
                  Customers
                  Policies
                  Policy information
                         |
                         v
                  SQL TRANSFORMATIONS
                  -------------------
                  Data preparation
                  Analytical views
                  Staging views
                         |
                         v
                  DATA WAREHOUSE
                  -------------------
                  Dimension tables
                  Fact tables
                  Historical customer data
                         |
                         v
                  PRODUCTION ETL
                  -------------------
                  Automated transformations
                  Warehouse loading
                  ETL execution logs
                         |
                         v
                  QUALITY & OPTIMIZATION
                  -------------------
                  Data quality checks
                  Reconciliation
                  Indexes
                  Query plans
                         |
                         v
                  ENTERPRISE REPORTING
                  -------------------
                  SQL reports
                  Business KPIs
                  Python execution engine
                         |
                         v
                  REPORT OUTPUTS
                  -------------------
                  CSV files
                  Markdown reports
                  Execution history
```

In practical terms:

1. We begin with operational database records.
2. We use SQL transformations to prepare and organize the source data.
3. We structure the information in a dimensional data warehouse.
4. We develop production ETL processes to load and maintain the warehouse.
5. We implement quality checks and performance analysis to validate the environment.
6. We build reporting structures that turn the data into useful business information.

---

## 4. The 12-Module Learning Journey

The project is organized into 12 modules containing **163 SQL files**.

Each module introduces a new part of the SQL analytics engineering workflow.

### Stage 1 — SQL Foundations

| Module | Name | What We Learn |
|---|---|---|
| 01 | Database Foundations | Database structure, tables, schemas, data types, and foundational SQL operations. |
| 02 | SQL Querying | Retrieving, filtering, sorting, and exploring business data. |
| 03 | Advanced SQL | Joins, aggregations, subqueries, CTEs, window functions, and more advanced analytical queries. |

**Our goal:** Understand how relational databases work and how to retrieve meaningful information from them.

### Stage 2 — Understanding and Transforming Business Data

| Module | Name | What We Learn |
|---|---|---|
| 04 | Existing Data Models | Explore existing business tables and understand their relationships. |
| 05 | Reporting on Existing Models | Build analytical queries and reports using existing database structures. |
| 06 | Transformation Maintenance | Work with analytical views and maintain SQL transformation structures. |

**Our goal:** Move from individual SQL queries toward reusable analytical data structures.

### Stage 3 — Data Warehouse Modeling

| Module | Name | What We Learn |
|---|---|---|
| 07 | Dimensional Modeling | Understand dimensional modeling and organize data for analytical workloads. |
| 08 | Facts and Dimensions | Build fact and dimension structures and understand their relationships. |
| 09 | Slowly Changing Dimensions | Preserve historical changes using Slowly Changing Dimensions, including Type 2 history management. |

**Our goal:** Build a warehouse that supports historical and business-oriented analysis.

### Stage 4 — Production Analytics Engineering

| Module | Name | What We Learn |
|---|---|---|
| 10 | Production Transformations | Develop staging structures, production ETL procedures, and execution logging. |
| 11 | Quality and Optimization | Implement data quality checks, reconciliation, indexes, and query performance analysis. |
| 12 | Enterprise Reporting | Create reusable business reports, customer portfolio analysis, production reports, and enterprise KPIs. |

**Our goal:** Bring the analytical environment closer to a production-oriented workflow.

---

## 5. Technologies Used

| Technology | Role |
|---|---|
| PostgreSQL | Relational database and data warehouse platform. |
| SQL | Data querying, transformation, modeling, validation, and reporting. |
| Python | Automated execution and export of selected SQL reports. |
| psycopg | Python connection to PostgreSQL. |
| python-dotenv | Loading database configuration from an environment file. |
| sqlparse | SQL statement parsing and validation. |
| CSV | Exporting query results and execution logs. |
| Markdown | Human-readable report generation and documentation. |
| Git and GitHub | Version control and project documentation. |

### Development environment

The project was developed using:

- PostgreSQL 18.6.
- Python 3.11.9.
- Visual Studio Code.
- Windows and PowerShell.

Other compatible PostgreSQL and Python versions may work, but the versions above reflect our development environment.

---

## 6. Repository Structure

```text
enterprise-sql-analytics/
│
├── 01_database_foundations/
├── 02_sql_querying/
├── 03_advanced_sql/
├── 04_existing_data_models/
├── 05_reporting_on_existing_models/
├── 06_transformation_maintenance/
├── 07_dimensional_modeling/
├── 08_facts_and_dimensions/
├── 09_slowly_changing_dimensions/
├── 10_production_transformations/
├── 11_quality_and_optimization/
├── 12_enterprise_reporting/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── docs/
│   └── environment_setup.md
│
├── reporting/
│   ├── config/
│   │   └── execution_manifest.csv
│   ├── engine/
│   │   ├── __init__.py
│   │   ├── executor.py
│   │   └── exporter.py
│   ├── __init__.py
│   ├── requirements.txt
│   └── run_reports.py
│
├── reports/
│   ├── execution_log.csv
│   └── module_XX/
│
├── scripts/
│
├── .env.example
├── .gitignore
└── README.md
```

### Understanding the main folders

- `01_database_foundations/` to `12_enterprise_reporting/`: SQL exercises, transformations, validation scripts, and reporting queries, organized by learning module.
- `data/`: Data-related project resources, separated into raw and processed areas.
- `docs/`: Environment and project documentation.
- `reporting/`: Python reporting application and its SQL execution manifest.
- `reports/`: Generated report files and execution history.
- `scripts/`: Supporting project scripts.
- `.env.example`: Example database connection configuration.

The reporting output folders are generated or populated as reports are executed. Not every module necessarily has an output folder.

---

## 7. Getting Started

This section explains how to prepare the project on a Windows computer.

### Prerequisites

We need:

1. Git.
2. PostgreSQL.
3. Python 3.11 or a compatible Python installation.
4. A SQL editor, such as pgAdmin or Visual Studio Code with a PostgreSQL database extension.

Basic familiarity with opening PowerShell and running commands is helpful. No previous data engineering experience is required.

### Step 1 — Clone the repository

Open PowerShell and navigate to the directory where the project should be stored.

```powershell
cd "$HOME\Documents"
```

Clone the repository:

```powershell
git clone https://github.com/linathabet101/enterprise-sql-analytics.git
```

Open the project directory:

```powershell
cd enterprise-sql-analytics
```

### Step 2 — Create a Python virtual environment

Create an isolated Python environment:

```powershell
python -m venv .venv
```

Activate it:

```powershell
.\.venv\Scripts\Activate.ps1
```

If PowerShell blocks activation because of its execution policy, there is no need to change that policy. We can use the virtual environment's Python executable directly in the commands below.

### Step 3 — Install Python dependencies

Install the reporting engine dependencies:

```powershell
& ".\.venv\Scripts\python.exe" -m pip install -r reporting\requirements.txt
```

The dependencies are:

- `psycopg[binary]`: PostgreSQL database connectivity.
- `python-dotenv`: Environment configuration.
- `sqlparse`: SQL statement parsing and validation.

### Step 4 — Create the PostgreSQL database

Open pgAdmin or another PostgreSQL administration tool.

Create a database named:

```text
enterprise_insurance
```

Use the same database consistently throughout the project.

Before executing project SQL files, verify that the SQL editor is connected to the correct database:

```sql
SELECT current_database();
```

Expected result:

```text
enterprise_insurance
```

**Important:** PostgreSQL database selection depends on the client. For example, `\c enterprise_insurance` is a `psql` command, not a regular SQL statement. In pgAdmin or a graphical SQL editor, select the database through the connection interface.

### Step 5 — Configure the database connection

Copy the example environment file:

```powershell
Copy-Item .env.example .env
```

Open `.env` and enter the local PostgreSQL credentials.

Example:

```env
DB_HOST=127.0.0.1
DB_PORT=5432
DB_NAME=enterprise_insurance
DB_USER=postgres
DB_PASSWORD=your_local_password
```

Replace `your_local_password` with the actual local PostgreSQL password.

Do not commit the `.env` file to GitHub. It contains local configuration and potentially sensitive credentials.

### Step 6 — Read the environment setup documentation

Before executing the SQL modules, consult:

```text
docs/environment_setup.md
```

This document provides additional environment configuration information.

---

## 8. How to Execute the SQL Modules

The SQL files are organized by module and numbered to communicate their intended progression.

For example:

```text
10_production_transformations/
│
├── 01_create_staging_schema.sql
├── 02_create_customer_staging_view.sql
├── 03_create_policy_staging_view.sql
├── 04_create_etl_run_log.sql
├── 05_create_production_etl_procedure.sql
├── 06_execute_production_etl.sql
├── 07_validate_production_warehouse.sql
├── 08_inspect_latest_etl_run.sql
└── 09_validate_fact_source_reconciliation.sql
```

### Recommended execution approach

1. Start with Module 01.
2. Execute the SQL files in their numbered order.
3. Read the comments and understand the purpose of each operation.
4. Inspect query results and verify that the expected database objects exist.
5. Continue to the next module when its prerequisites have been satisfied.
6. Keep using the same PostgreSQL database throughout the project.

Some SQL files create tables, schemas, views, indexes, or procedures. Others insert, update, validate, or retrieve data.

**Do not execute every SQL file indiscriminately or assume that every file can be safely executed multiple times.** Some scripts depend on earlier database objects or modify database state.

### Executing a SQL file

For each SQL exercise:

1. Open the PostgreSQL database connection.
2. Open the relevant `.sql` file in the SQL editor.
3. Read the SQL and comments.
4. Execute the script.
5. Review the result and any error messages.
6. Verify the expected database changes before proceeding.

The project uses PostgreSQL-specific SQL features, so PostgreSQL is the intended database platform.

---

## 9. Automated Reporting Engine

In addition to the SQL exercises, we have developed a Python reporting engine.

It provides a repeatable way to execute selected SQL queries, retrieve their results, and export reports.

### How it works

The reporting engine reads:

```text
reporting/config/execution_manifest.csv
```

The manifest contains registered SQL queries and their execution configuration.

Its columns are:

| Column | Description |
|---|---|
| `module_id` | Module associated with the query. |
| `module_name` | Name of the module. |
| `sql_file` | SQL file to execute. |
| `execution_mode` | Declared execution mode. |
| `export_results` | Whether the query results should be exported. |
| `description` | Purpose of the registered query. |

The manifest currently registers **86 selected SQL queries** across the 12 modules.

This is a selected reporting subset, not all 163 SQL files in the repository.

### Run all registered reports

From the project root, execute:

```powershell
& ".\.venv\Scripts\python.exe" -m reporting.run_reports --all
```

### Run reports for one module

For example, to execute the registered reporting queries for Module 10:

```powershell
& ".\.venv\Scripts\python.exe" -m reporting.run_reports --module 10
```

The module identifier is a string, such as `01`, `02`, or `10`.

### What happens during execution?

The reporting engine:

1. Loads the database configuration from `.env`.
2. Reads the execution manifest.
3. Selects the registered queries.
4. Validates that each selected SQL file contains exactly one read-only `SELECT` statement.
5. Executes the query inside a read-only transaction.
6. Retrieves the query results.
7. Exports the results into CSV and Markdown files.
8. Records execution information in the execution log.

The read-only execution checks are designed to prevent the reporting engine from running data-modifying SQL statements.

### Generated outputs

The reporting engine produces:

- CSV files containing query results.
- Markdown files containing readable report summaries.
- An execution log recording query execution status, row counts, and errors.

Report outputs are stored under:

```text
reports/
```

The execution history is stored in:

```text
reports/execution_log.csv
```

---

## 10. Data Warehouse Design

A central part of our project is the development of an analytical warehouse.

Rather than relying exclusively on operational tables, we introduce a dimensional structure designed for reporting and analysis.

The warehouse includes:

| Object | Purpose |
|---|---|
| `warehouse.dim_customer` | Customer information and historical customer versions. |
| `warehouse.dim_policy_type` | Policy type descriptions. |
| `warehouse.dim_policy_status` | Policy status descriptions. |
| `warehouse.dim_date` | Calendar attributes for time-based analysis. |
| `warehouse.fact_policy` | Policy-level analytical records. |

### Fact table grain

The policy fact table is designed at the **one-row-per-policy** level.

This means each fact record represents one policy, with references to the relevant dimension records.

This grain is important because it defines what one row in the fact table represents and helps prevent incorrect aggregation.

### Slowly Changing Dimensions

We also demonstrate historical customer management using Slowly Changing Dimension Type 2.

Instead of simply overwriting an existing customer record when information changes, the warehouse can preserve historical versions.

This involves attributes such as:

- A surrogate key.
- An effective start date.
- An effective end date.
- A current-version indicator.

This allows historical analysis to use the customer information that was valid at the relevant point in time.

---

## 11. Data Quality and Validation

A reliable analytical environment requires more than successful SQL execution.

We implement checks designed to identify inconsistencies and validate the warehouse.

Examples include:

- Identifying missing or inconsistent data.
- Summarizing data quality issues.
- Validating warehouse relationships.
- Checking fact table references.
- Reconciling source records with warehouse records.
- Inspecting database constraints and indexes.
- Reviewing query execution plans.

Our objective is to make analytical results more trustworthy and potential issues easier to investigate.

---

## 12. Production ETL and Execution Monitoring

Module 10 introduces a production-oriented ETL workflow.

ETL stands for:

- **Extract:** Read information from source structures.
- **Transform:** Prepare and organize the information.
- **Load:** Populate the analytical warehouse.

We implement:

- A staging schema.
- Customer and policy staging views.
- An ETL execution log.
- A stored procedure for production warehouse transformations.
- Validation queries.
- Source-to-warehouse reconciliation.

The ETL process can be executed through its dedicated SQL procedure:

```sql
CALL warehouse.run_production_etl();
```

The execution log records information about ETL runs, including their status and execution details.

This makes it possible to inspect previous executions and investigate failures.

---

## 13. Performance and Query Optimization

Module 11 introduces database performance considerations.

We cover:

- Creating warehouse indexes.
- Analyzing warehouse tables.
- Inspecting existing indexes.
- Inspecting database constraints.
- Reviewing query execution plans using `EXPLAIN`.

Indexes can improve query performance when they support the filters, joins, and access patterns used by analytical queries.

However, indexes also have maintenance costs. We design them according to actual query requirements rather than adding them indiscriminately.

---

## 14. Enterprise Reporting

The final module focuses on turning warehouse data into business-oriented information.

We develop reporting structures for:

- Customer portfolios.
- Monthly insurance production.
- Annual insurance production.
- Policy type performance.
- Policy status distribution.
- Largest customer portfolios.
- Enterprise key performance indicators.

These reports demonstrate how a dimensional warehouse can support recurring analytical questions.

Our reporting layer is designed to provide reusable views and queries rather than requiring users to reconstruct complex joins for every business question.

---

## 15. How to Explore the Project

Readers who are new to SQL or data engineering can follow the modules in order.

Readers with existing experience can use the following guide to navigate the repository.

| Objective | Where to Start |
|---|---|
| Understand relational databases | Module 01 |
| Practice SQL queries | Modules 02–03 |
| Explore business database structures | Module 04 |
| Build analytical SQL reports | Modules 05–06 |
| Understand dimensional modeling | Modules 07–08 |
| Learn historical data management | Module 09 |
| Understand production ETL | Module 10 |
| Explore data quality and performance | Module 11 |
| Build enterprise reporting structures | Module 12 |
| Understand automated report execution | `reporting/` |

For a complete learning experience, follow the modules sequentially. Later modules depend on structures and concepts introduced earlier.

---

## 16. Troubleshooting

### PostgreSQL connection errors

Check that:

- PostgreSQL is installed and running.
- The database name is `enterprise_insurance`.
- The host and port are correct.
- The username and password in `.env` are valid.
- The SQL editor is connected to the intended database.

Verify the database connection with:

```sql
SELECT
    current_database(),
    current_user,
    current_schema();
```

### Relation does not exist

An error such as:

```text
relation "warehouse.dim_customer" does not exist
```

usually means that:

- A prerequisite SQL file has not been executed.
- The wrong database is selected.
- The object belongs to a different schema.
- A previous SQL operation failed.

Check the execution order and verify the object in the correct schema before continuing.

### Python dependency errors

Reinstall the project dependencies:

```powershell
& ".\.venv\Scripts\python.exe" -m pip install -r reporting\requirements.txt
```

### Python database connection errors

Check the `.env` file and confirm that its connection values match the local PostgreSQL configuration.

### No matching SQL scripts found in the manifest

The reporting engine only executes SQL files registered in:

```text
reporting/config/execution_manifest.csv
```

Check the module identifier, SQL file path, and manifest entry.

### SQL execution errors

Read the complete PostgreSQL error message.

Check whether the required schema, table, view, or column exists and whether previous module steps were completed successfully.

Do not continue to dependent scripts until the underlying issue is resolved.

---

## 17. Project Scope and Limitations

This repository is a hands-on SQL analytics engineering project built around a fictional insurance business scenario.

We demonstrate database development, analytical modeling, data transformations, validation, optimization, and reporting.

The project is not a complete commercial insurance platform or a fully deployed enterprise data infrastructure.

In particular:

- The database contains fictional project data.
- PostgreSQL is the intended database platform.
- The Python reporting engine executes selected manifest-registered read-only queries.
- The reporting engine does not automatically execute every SQL exercise.
- The project does not claim to provide a cloud deployment, a production scheduler, or a complete enterprise security framework.

These boundaries are intentional: our focus is on understanding and implementing the core SQL and analytics engineering workflow.

---

## 18. Final Objective

Throughout this project, we demonstrate how SQL can be used beyond basic data retrieval.

We bring together relational database fundamentals, analytical SQL, dimensional modeling, historical data management, production transformations, data quality, query optimization, and automated reporting.

By following the project from the first module to the last, we can understand how operational business data becomes structured, validated, and reusable analytical information.

---

**Repository:** https://github.com/linathabet101/enterprise-sql-analytics

**Database:** PostgreSQL

**Primary technology:** PostgreSQL and SQL.

**Supporting technology:** Python, used to automate the execution and export of selected SQL reports.
