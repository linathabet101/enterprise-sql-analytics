-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Relationships and Foreign Keys
-- Purpose: Create an insurance policies table
-- ============================================================

CREATE TABLE public.policies (

    -- Unique identifier generated automatically
    policy_id INTEGER GENERATED ALWAYS AS IDENTITY,

    -- Unique business identifier for each policy
    policy_number VARCHAR(30) NOT NULL,

    -- Reference to the customer who owns the policy
    customer_id INTEGER NOT NULL,

    -- Insurance product category
    policy_type VARCHAR(30) NOT NULL,

    -- Current policy status
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    -- Annual premium in the business currency
    annual_premium NUMERIC(12, 2) NOT NULL,

    -- Total insured value
    insured_amount NUMERIC(14, 2) NOT NULL,

    -- Policy validity period
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    -- Record creation timestamp
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Primary key
    CONSTRAINT pk_policies
        PRIMARY KEY (policy_id),

    -- Each policy number must be unique
    CONSTRAINT uq_policies_policy_number
        UNIQUE (policy_number),

    -- Enforce the customer-policy relationship
    CONSTRAINT fk_policies_customers
        FOREIGN KEY (customer_id)
        REFERENCES public.customers (customer_id),

    -- Premium cannot be negative
    CONSTRAINT chk_policies_premium
        CHECK (annual_premium >= 0),

    -- Insured amount must be positive
    CONSTRAINT chk_policies_insured_amount
        CHECK (insured_amount > 0),

    -- End date cannot precede start date
    CONSTRAINT chk_policies_dates
        CHECK (end_date >= start_date),

    -- Only accepted policy statuses are allowed
    CONSTRAINT chk_policies_status
        CHECK (status IN ('ACTIVE', 'EXPIRED', 'CANCELLED'))
);