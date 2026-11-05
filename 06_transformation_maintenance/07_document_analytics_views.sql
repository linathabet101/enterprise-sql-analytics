-- Module 06: Transformation Maintenance
-- Exercise 07: Document Analytics Views
--
-- Business purpose:
-- Add database-level descriptions to reusable analytical views.

COMMENT ON VIEW analytics.vw_policy_details IS
    'Policy-level view enriched with customer attributes.';

COMMENT ON VIEW analytics.vw_customer_portfolio IS
    'Customer-level portfolio metrics, including policy counts and premiums.';

COMMENT ON VIEW analytics.vw_monthly_policy_production IS
    'Monthly policy production and premium metrics.';

COMMENT ON VIEW analytics.vw_policy_quality_exceptions IS
    'Policy records that violate selected analytical quality rules.';