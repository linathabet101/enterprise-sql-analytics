CREATE OR REPLACE VIEW warehouse.vw_policy_status_report AS
SELECT
    status,

    COUNT(*) AS total_policies,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM warehouse.vw_policy_reporting_detail

GROUP BY
    status;

COMMENT ON VIEW warehouse.vw_policy_status_report IS
    'Policy counts and financial measures grouped by status.';