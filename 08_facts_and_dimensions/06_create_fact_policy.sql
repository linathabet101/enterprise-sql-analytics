-- Module 08: Facts and Dimensions
-- Exercise 06: Create the Policy Fact Table
--
-- Business purpose:
-- Store measurable insurance policy transactions.
--
-- Fact grain:
-- One row per insurance policy.
--
-- Measures:
-- Annual premium and insured amount.

CREATE TABLE IF NOT EXISTS warehouse.fact_policy (
    fact_policy_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    policy_id INTEGER NOT NULL UNIQUE,
    policy_number VARCHAR(100) NOT NULL,

    customer_key BIGINT NOT NULL,
    policy_type_key BIGINT NOT NULL,
    policy_status_key BIGINT NOT NULL,

    start_date_key INTEGER NOT NULL,
    end_date_key INTEGER,

    annual_premium NUMERIC(14, 2) NOT NULL,
    insured_amount NUMERIC(16, 2) NOT NULL,

    loaded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_fact_policy_customer
        FOREIGN KEY (customer_key)
        REFERENCES warehouse.dim_customer(customer_key),

    CONSTRAINT fk_fact_policy_type
        FOREIGN KEY (policy_type_key)
        REFERENCES warehouse.dim_policy_type(policy_type_key),

    CONSTRAINT fk_fact_policy_status
        FOREIGN KEY (policy_status_key)
        REFERENCES warehouse.dim_policy_status(policy_status_key),

    CONSTRAINT fk_fact_policy_start_date
        FOREIGN KEY (start_date_key)
        REFERENCES warehouse.dim_date(date_key),

    CONSTRAINT fk_fact_policy_end_date
        FOREIGN KEY (end_date_key)
        REFERENCES warehouse.dim_date(date_key),

    CONSTRAINT chk_fact_policy_premium
        CHECK (annual_premium >= 0),

    CONSTRAINT chk_fact_policy_insured_amount
        CHECK (insured_amount >= 0)
);

CREATE INDEX IF NOT EXISTS idx_fact_policy_customer_key
    ON warehouse.fact_policy(customer_key);

CREATE INDEX IF NOT EXISTS idx_fact_policy_start_date
    ON warehouse.fact_policy(start_date_key);

COMMENT ON TABLE warehouse.fact_policy IS
    'Policy fact table with one row per policy and references to analytical dimensions.';