-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Purpose: Verify the PostgreSQL database connection
-- ============================================================

SELECT
    current_database() AS database_name,
    current_user AS connected_user,
    version() AS postgresql_version;