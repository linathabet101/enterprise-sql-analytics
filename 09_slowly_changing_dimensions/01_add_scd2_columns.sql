-- Module 09: Slowly Changing Dimensions
-- Exercise 01: Prepare the Customer Dimension for SCD Type 2
--
-- Business purpose:
-- Preserve historical customer attribute versions.
--
-- effective_from:
-- First date on which a version is valid.
--
-- effective_to:
-- Last date on which a version is valid.
--
-- is_current:
-- Identifies the currently active version.

ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS effective_from DATE
NOT NULL DEFAULT DATE '1900-01-01';

ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS effective_to DATE
NOT NULL DEFAULT DATE '9999-12-31';

ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS is_current BOOLEAN
NOT NULL DEFAULT TRUE;

-- Remove a possible UNIQUE constraint on customer_id.
-- SCD Type 2 requires multiple historical rows per customer.

DO $$
DECLARE
    customer_id_attribute SMALLINT;
    constraint_record RECORD;
BEGIN
    SELECT attnum
    INTO customer_id_attribute
    FROM pg_attribute
    WHERE attrelid = 'warehouse.dim_customer'::REGCLASS
      AND attname = 'customer_id'
      AND NOT attisdropped;

    FOR constraint_record IN
        SELECT conname
        FROM pg_constraint
        WHERE conrelid = 'warehouse.dim_customer'::REGCLASS
          AND contype = 'u'
          AND conkey = ARRAY[customer_id_attribute]::SMALLINT[]
    LOOP
        EXECUTE FORMAT(
            'ALTER TABLE warehouse.dim_customer DROP CONSTRAINT %I',
            constraint_record.conname
        );
    END LOOP;
END $$;

CREATE INDEX IF NOT EXISTS idx_dim_customer_history
    ON warehouse.dim_customer(customer_id, effective_from, effective_to);