-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: 01.2 - Data Insertion
-- Purpose: Insert synthetic international customer records
-- ============================================================

INSERT INTO public.customers (
    first_name,
    last_name,
    email,
    date_of_birth
)
VALUES
    ('Luna', 'Andersson', 'luna.andersson@example.com', '1990-04-15'),
    ('Kai', 'Tanaka', 'kai.tanaka@example.com', '1987-09-22'),
    ('Zara', 'Kowalski', 'zara.kowalski@example.com', '1995-01-08'),
    ('Aarav', 'Sharma', 'aarav.sharma@example.com', '1992-06-11'),
    ('Mohammed', 'Al-Farsi', 'mohammed.alfarsi@example.com', '1994-12-03');