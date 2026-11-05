-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Inserting Related Records
-- Purpose: Insert synthetic insurance policies
-- ============================================================

INSERT INTO public.policies (
    policy_number,
    customer_id,
    policy_type,
    status,
    annual_premium,
    insured_amount,
    start_date,
    end_date
)

SELECT
    v.policy_number,
    c.customer_id,
    v.policy_type,
    v.status,
    v.annual_premium,
    v.insured_amount,
    v.start_date,
    v.end_date

FROM (
    VALUES
        (
            'POL-2026-0001',
            'luna.andersson@example.com',
            'HOME',
            'ACTIVE',
            850.00,
            180000.00,
            DATE '2026-01-01',
            DATE '2026-12-31'
        ),
        (
            'POL-2026-0002',
            'luna.andersson@example.com',
            'AUTO',
            'ACTIVE',
            620.50,
            35000.00,
            DATE '2026-02-01',
            DATE '2027-01-31'
        ),
        (
            'POL-2026-0003',
            'kai.tanaka@example.com',
            'HEALTH',
            'ACTIVE',
            1200.00,
            100000.00,
            DATE '2026-01-15',
            DATE '2027-01-14'
        ),
        (
            'POL-2026-0004',
            'kai.tanaka@example.com',
            'TRAVEL',
            'EXPIRED',
            180.00,
            15000.00,
            DATE '2025-01-01',
            DATE '2025-12-31'
        ),
        (
            'POL-2026-0005',
            'zara.kowalski@example.com',
            'AUTO',
            'ACTIVE',
            740.00,
            42000.00,
            DATE '2026-03-01',
            DATE '2027-02-28'
        ),
        (
            'POL-2026-0006',
            'zara.kowalski@example.com',
            'HOME',
            'ACTIVE',
            950.00,
            210000.00,
            DATE '2026-04-01',
            DATE '2027-03-31'
        ),
        (
            'POL-2026-0007',
            'aarav.sharma@example.com',
            'HEALTH',
            'ACTIVE',
            1100.00,
            90000.00,
            DATE '2026-02-01',
            DATE '2027-01-31'
        ),
        (
            'POL-2026-0008',
            'aarav.sharma@example.com',
            'TRAVEL',
            'CANCELLED',
            220.00,
            20000.00,
            DATE '2026-05-01',
            DATE '2027-04-30'
        ),
        (
            'POL-2026-0009',
            'mohammed.alfarsi@example.com',
            'AUTO',
            'ACTIVE',
            680.00,
            38000.00,
            DATE '2026-01-01',
            DATE '2026-12-31'
        ),
        (
            'POL-2026-0010',
            'mohammed.alfarsi@example.com',
            'HOME',
            'ACTIVE',
            1050.00,
            250000.00,
            DATE '2026-06-01',
            DATE '2027-05-31'
        )

) AS v (
    policy_number,
    customer_email,
    policy_type,
    status,
    annual_premium,
    insured_amount,
    start_date,
    end_date
)

INNER JOIN public.customers AS c
    ON c.email = v.customer_email

RETURNING
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    annual_premium;