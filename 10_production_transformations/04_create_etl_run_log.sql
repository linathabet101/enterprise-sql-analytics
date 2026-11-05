CREATE TABLE IF NOT EXISTS warehouse.etl_run_log (
    run_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    process_name VARCHAR(150) NOT NULL,
    started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    rows_loaded BIGINT,
    error_message TEXT,
    CONSTRAINT chk_etl_run_status
        CHECK (status IN ('RUNNING', 'SUCCESS', 'FAILED'))
);

CREATE INDEX IF NOT EXISTS idx_etl_run_log_started_at
    ON warehouse.etl_run_log(started_at DESC);