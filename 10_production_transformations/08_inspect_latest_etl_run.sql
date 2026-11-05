SELECT
    run_id,
    process_name,
    started_at,
    completed_at,
    status,
    rows_loaded,
    error_message
FROM warehouse.etl_run_log
ORDER BY run_id DESC
LIMIT 10;