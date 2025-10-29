-- Purpose: build a small fact snapshot by day x region
-- Engine: SparkSQL / ANSI-friendly
-- Safe to run in dev only

-- Source and target namespaces (change to your own dev schema if needed)
USE dev_sandbox;

-- Build view for daily x region metrics
CREATE OR REPLACE VIEW dev_sandbox.fact_checkout_sample AS
SELECT
  TO_DATE(event_time)           AS dt,
  region                        AS region,
  COUNT(1)                      AS records,
  COUNT(DISTINCT user_id)       AS unique_users,
  COUNT(DISTINCT device_id)     AS unique_devices
FROM analytics.sample_checkout_events   -- <== desensitized source table
WHERE
  TO_DATE(event_time) BETWEEN DATE('2025-09-26') AND DATE('2025-09-28')
  AND action_type = 'checkout'
  AND page_section IS NULL
  AND target_type IS NULL
  AND region = 'SG'
GROUP BY
  TO_DATE(event_time), region
;

-- Quick preview
SELECT dt, region, records, unique_users, unique_devices
FROM dev_sandbox.fact_checkout_sample
ORDER BY dt, region
LIMIT 20;

