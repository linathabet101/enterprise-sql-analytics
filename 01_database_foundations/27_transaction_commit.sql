-- ============================================================
-- Lesson: Transactions - COMMIT
-- File: 27_transaction_commit.sql
-- ============================================================

BEGIN;

CREATE TABLE public.transaction_demo (
    demo_id INTEGER PRIMARY KEY,
    description VARCHAR(100)
);

INSERT INTO public.transaction_demo
VALUES (1, 'Transaction successfully committed');

COMMIT;

SELECT *
FROM public.transaction_demo;

DROP TABLE public.transaction_demo;