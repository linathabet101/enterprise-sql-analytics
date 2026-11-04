
# Enterprise SQL & Analytics Engineering

An end-to-end SQL and analytics engineering project built around a fictional insurance company.

The project demonstrates how to work with relational databases, understand and maintain existing data models, develop advanced SQL transformations, design dimensional data warehouses, implement data quality controls, and build analytical reporting datasets.

The objective is to reproduce realistic database and analytics engineering workflows, from initial database setup to production-oriented reporting.

## 1. Project Objectives

This project covers two complementary professional environments.

### Environment A — Working with Existing Data Models

Simulate joining a team where the database and data models have already been designed by other engineers.

- Explore and understand an existing database schema.
- Identify tables, relationships, keys and constraints.
- Read and understand existing SQL transformations.
- Develop reporting queries on inherited models.
- Maintain and modify existing transformation logic.
- Validate changes and prevent regressions.
- Build reporting datasets for business stakeholders.

### Environment B — Designing an Analytical Data Warehouse

Design and implement an analytical warehouse from business requirements and synthetic operational data.

- Understand source systems and business processes.
- Define analytical requirements and data grain.
- Design fact and dimension tables.
- Implement dimensional models and slowly changing dimensions.
- Develop staging, intermediate and reporting layers.
- Build reliable and reproducible data transformations.
- Implement data quality tests.
- Optimize queries and prepare reporting datasets.

## 2. Business Context

The project uses a fictional insurance company as its business domain.

The synthetic datasets will represent realistic insurance operations, including:

- Customers and policyholders.
- Insurance policies and products.
- Insurance agencies and agents.
- Premiums and payments.
- Claims and claim settlements.
- Policy coverage and guarantees.

All business data will be synthetic. No confidential or personal customer information will be used.

## 3. Technology Stack

| Technology | Purpose |
|---|---|
| PostgreSQL 18.6 | Relational database management system |
| SQL | Data querying and transformation |
| pgAdmin 4 | Graphical database administration |
| Visual Studio Code | SQL development and documentation |
| Git | Version control |
| GitHub | Repository hosting |
| Python | Synthetic data generation and automation |
| dbt Core | Analytics transformations and testing (planned) |
| Power BI | Reporting and visualization (planned) |

Versions and configuration details will be documented as the project evolves.

## 4. Repository Structure

```text
enterprise-sql-analytics/
│
├── README.md
│
├── docs/
│   ├── environment_setup.md
│   ├── architecture.md
│   └── data_dictionary.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── scripts/
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
└── 12_enterprise_reporting/
```

## 5. Learning and Implementation Roadmap

| Module | Subject |
|---|---|
| 01 | Database Foundations |
| 02 | SQL Querying and Relational Operations |
| 03 | Advanced SQL |
| 04 | Understanding Existing Data Models |
| 05 | Reporting on Existing Models |
| 06 | Maintaining Transformation Logic |
| 07 | Dimensional Modeling |
| 08 | Fact and Dimension Design |
| 09 | Slowly Changing Dimensions |
| 10 | Production Data Transformations |
| 11 | Data Quality and Query Optimization |
| 12 | Enterprise Reporting and Analytics |

Each module will combine theoretical explanations, practical SQL implementations, execution results, validation and professional use cases.

## 6. Documentation and Reproducibility

Reproducibility is a core requirement.

Every major implementation will document:

- Prerequisites and software versions.
- Installation and configuration procedures.
- Required database objects and dependencies.
- Exact commands and SQL statements.
- The directory from which commands must be executed.
- Expected outputs and verification procedures.
- Data quality checks and test results.
- Common errors and troubleshooting instructions.

A reader should be able to reproduce the project from a clean Windows environment without relying on undocumented manual steps.

Actual execution results will be distinguished from expected results. No implementation will be described as tested unless it has been executed and verified.

## 7. Database Configuration

Initial local development environment:

| Setting | Value |
|---|---|
| Database engine | PostgreSQL |
| Version | 18.6 |
| Database name | enterprise_insurance |
| Database user | postgres |
| Host | localhost |
| Port | 5432 |
| Encoding | UTF8 |
| Operating system | Windows 64-bit |

Credentials and passwords must never be committed to this repository.

## 8. Project Status

**Current stage:** Initial development environment setup.

Completed:
- PostgreSQL 18.6 installation.
- PostgreSQL Windows service verification.
- Command-line client configuration.
- Successful database connection.
- Creation of the `enterprise_insurance` database.
- Initial repository directory structure.

Upcoming:
- Database environment documentation.
- SQL development configuration in VS Code.
- Database schemas and foundational objects.
- Synthetic insurance data generation.
- First SQL implementations and validation.

## 9. Reproduction

The complete installation, configuration, database creation and execution instructions will be maintained in the `docs/` directory.

Start with:

`docs/environment_setup.md`

This project is developed incrementally. Each implementation will be documented and validated before subsequent modules depend on it.
