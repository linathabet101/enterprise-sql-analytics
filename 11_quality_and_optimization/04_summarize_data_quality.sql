SELECT
    severity,
    issue_code,
    entity_type,
    issue_count
FROM warehouse.vw_data_quality_summary
ORDER BY
    severity,
    issue_code;