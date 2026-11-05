SELECT
    table_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'warehouse'
ORDER BY
    table_name,
    constraint_type,
    constraint_name;