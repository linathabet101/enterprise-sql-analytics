-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 02 - SQL Querying and Relational Operations
-- Lesson: SELECT - Retrieving Specific Columns
-- File: 01_select_specific_columns.sql
--
-- Business question:
-- What are the names and email addresses of our customers?
-- ============================================================

SELECT
    first_name,
    last_name,
    email
FROM public.customers;