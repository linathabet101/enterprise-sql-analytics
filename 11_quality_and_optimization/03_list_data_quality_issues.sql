SELECT
    severity,
    issue_code,
    entity_type,
    entity_id,
    issue_description
FROM warehouse.vw_data_quality_issues
ORDER BY
    CASE severity
        WHEN 'ERROR' THEN 1
        ELSE 2
    END,
    issue_code,
    entity_id;