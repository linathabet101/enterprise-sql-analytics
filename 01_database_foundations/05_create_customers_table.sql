-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: 01.2 - Creating Relational Tables
-- Purpose: Create the customers table
-- ============================================================

CREATE TABLE public.customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE,
    date_of_birth DATE,
    created_at TIMESTAMP WITH TIME ZONE
        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customers
        PRIMARY KEY (customer_id)
);