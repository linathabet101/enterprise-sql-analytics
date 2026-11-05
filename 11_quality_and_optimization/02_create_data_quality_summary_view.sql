CREATE OR REPLACE VIEW warehouse.vw_data_quality_summary AS
SELECT
    severity,
    issue_code,
    entity_type,
    COUNT(*) AS issue_count
FROM warehouse.vw_data_quality_issues
GROUP BY
    severity,
    issue_code,
    entity_type;

COMMENT ON VIEW warehouse.vw_data_quality_summary IS
    'Aggregated data-quality issues by severity and issue category.';