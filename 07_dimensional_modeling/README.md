# Module 07 — Dimensional Modeling

## Objective

Design a dimensional model for the fictional insurance business.

The purpose is to transform operational data into a structure
that supports analytical queries, reporting, and business intelligence.

## 1. Business process

The selected business process is insurance policy issuance.

The operational source tables are:

- `public.customers`
- `public.policies`

## 2. Fact table grain

The proposed fact table has the following grain:

**One row per insurance policy.**

Each fact record represents one policy issued to one customer.

The source `policy_id` identifies the original policy record.

## 3. Proposed fact table

`warehouse.fact_policy`

Measures:

- Annual premium
- Insured amount
- Policy count (represented by each fact row)

Foreign keys:

- Customer dimension key
- Policy type dimension key
- Policy status dimension key
- Start date key
- End date key

## 4. Proposed dimensions

### dim_customer

Descriptive customer attributes:

- Customer business identifier
- First name
- Last name
- Email

### dim_policy_type

Descriptive insurance product attributes:

- Policy type business identifier
- Policy type name

### dim_policy_status

Descriptive policy lifecycle attributes:

- Status business identifier
- Status name

### dim_date

Calendar attributes:

- Date
- Day
- Month
- Month name
- Quarter
- Year
- Day of week

## 5. Modeling principles

- Define the grain before designing the fact table.
- Separate descriptive dimensions from measurable facts.
- Use surrogate keys for warehouse dimensions.
- Preserve operational business keys for traceability.
- Avoid mixing different grains in one fact table.
- Define how historical dimension changes will be handled.
- Document every source-to-target mapping.

## 6. Star schema

The proposed warehouse follows a star schema.

The fact table is central and references dimensions through
foreign keys.

## 7. Next module

Module 08 implements the physical fact and dimension structures.