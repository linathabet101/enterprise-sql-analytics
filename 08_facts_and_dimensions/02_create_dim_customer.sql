-- Module 08: Facts and Dimensions
-- Exercise 02: Create the Customer Dimension
--
-- Business purpose:
-- Store customer attributes for analytical reporting.
--
-- Dimension grain:
-- One row per customer in the initial Type 1 model.
--
-- Important:
-- customer_id is intentionally NOT UNIQUE.
-- Module 09 will implement SCD Type 2 and allow
-- multiple historical versions of each customer.

CREATE TABLE IF NOT EXISTS warehouse.dim_customer (
    customer_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    customer_id INTEGER NOT NULL,

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),

    created_at TIMESTAMP,

    CONSTRAINT chk_dim_customer_id
        CHECK (customer_id > 0)
);

CREATE INDEX IF NOT EXISTS idx_dim_customer_customer_id
    ON warehouse.dim_customer(customer_id);

COMMENT ON TABLE warehouse.dim_customer IS
    'Customer dimension containing customer attributes and warehouse surrogate keys.';