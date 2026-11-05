# Module 04 — Understanding Existing Data Models

## 1. Introduction

In professional data environments, SQL engineers frequently work with
databases designed by other teams.

Before writing reports, modifying transformations, or changing database
structures, an engineer must understand the existing data model.

This module simulates inheriting an insurance database and performing
a structured technical and business assessment.

## 2. Learning objectives

By the end of this module, you should be able to:

- Discover existing database objects.
- Inspect tables, columns, and data types.
- Identify primary keys and unique constraints.
- Understand foreign-key relationships.
- Inspect check constraints and default values.
- Analyze indexes and identity columns.
- Investigate views, routines, and object dependencies.
- Profile existing business data.
- Identify missing values and potential integrity issues.
- Assess whether an existing model supports reporting requirements.

## 3. Important terminology

### Existing data model
A database structure that already exists and is maintained by another
team or application.

### Schema discovery
The process of identifying database objects and understanding their
structure through metadata.

### Data dictionary
A structured description of database tables, columns, data types,
constraints, and business meaning.

### Primary key
A column or group of columns that uniquely identifies each row.

### Foreign key
A constraint that establishes and enforces a relationship between
tables.

### Index
A database structure that can improve data retrieval performance.

### Database dependency
A relationship in which one database object relies on another object.

### Data profiling
The examination of data to understand its volume, distribution,
completeness, validity, and consistency.

## 4. Inherited insurance database

The current database contains two principal tables:

- `public.customers`: customer information.
- `public.policies`: insurance policy information.

The relationship is:

    customers (1) -------- (many) policies

A customer can have multiple insurance policies.
Each policy references one customer.

## 5. Investigation sequence

| Area | Investigation |
|---|---|
| Database inventory | Identify existing objects |
| Structure | Inspect tables and columns |
| Constraints | Identify keys and validation rules |
| Relationships | Understand foreign-key links |
| Performance | Inspect indexes and storage |
| Dependencies | Investigate views and routines |
| Business data | Profile customers and policies |
| Data quality | Identify missing or inconsistent values |
| Assessment | Document findings and limitations |

## 6. Execution

All SQL exercises in this module are read-only.

After registering the files in the reporting manifest, execute:

    python -m reporting.run_reports --module 04

The reporting engine exports actual PostgreSQL results as CSV and
Markdown files.

## 7. Professional application

These investigation techniques are useful when:

- Joining an organization with an existing database.
- Taking responsibility for inherited SQL transformations.
- Preparing reporting datasets.
- Investigating unexpected dashboard results.
- Assessing data quality before building analytics.
- Documenting dependencies before changing database structures.

## 8. Important principle

Understand the existing model before modifying it.

Never assume that a table, column, relationship, or business rule
means what its name suggests. Verify it against database metadata,
actual data, and business requirements.