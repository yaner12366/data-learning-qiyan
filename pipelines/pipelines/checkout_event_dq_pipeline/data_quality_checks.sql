-- Purpose: basic DQ checks over the fact view
-- Output is a single row with violation counts

USE dev_sandbox;

WITH base AS (
  SELECT
    dt,
    region,
    records,
    unique_users,
    unique_devices
  FROM dev_sandbox.fact_checkout_sample
)
SELECT
  SUM(CASE WHEN records < 0 THEN 1 ELSE 0 END)                      AS negative_record_cnt,
  SUM(CASE WHEN unique_users > records THEN 1 ELSE 0 END)           AS users_exceed_records_cnt,
  SUM(CASE WHEN dt IS NULL OR region IS NULL THEN 1 ELSE 0 END)     AS null_keys_cnt
FROM base;
