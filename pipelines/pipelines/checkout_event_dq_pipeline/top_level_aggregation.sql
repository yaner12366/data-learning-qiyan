-- Purpose: derive top-N rows from the fact view

USE dev_sandbox;

CREATE OR REPLACE VIEW dev_sandbox.fact_checkout_sample_top AS
SELECT dt, region, records
FROM dev_sandbox.fact_checkout_sample
ORDER BY records DESC
LIMIT 10;

-- Sanity preview
SELECT dt, region, records
FROM dev_sandbox.fact_checkout_sample_top;
