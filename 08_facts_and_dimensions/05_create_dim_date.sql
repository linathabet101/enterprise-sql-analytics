-- Module 08: Facts and Dimensions
-- Exercise 05: Create the Date Dimension
--
-- Business purpose:
-- Provide calendar attributes for time-based analysis.
--
-- Dimension grain:
-- One row per calendar date.

CREATE TABLE IF NOT EXISTS warehouse.dim_date (
    date_key INTEGER PRIMARY KEY,

    full_date DATE NOT NULL UNIQUE,

    day_number INTEGER NOT NULL,
    month_number INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,

    quarter_number INTEGER NOT NULL,
    year_number INTEGER NOT NULL,

    is_weekend BOOLEAN NOT NULL
);

COMMENT ON TABLE warehouse.dim_date IS
    'Calendar dimension supporting time-based warehouse analysis.';