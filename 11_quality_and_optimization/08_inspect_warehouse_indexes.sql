SELECT
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'warehouse'
ORDER BY
    tablename,
    indexname;