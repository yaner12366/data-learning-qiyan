# Experiment: Spark query with group-by and large time range
**Date:** 2025-10-31  
**Environment:** DataSuite (Dev, regdetracking-dev queue)  
**Table:** `traffic.dwd_custom_hi__reg_live`

---

### 🧪 Goal
Test performance and behavior of Spark SQL when scanning a large table (`dwd_custom_hi__reg_live`)
with aggregation (`GROUP BY`) and a wide date range.

---

### ⚙️ Query

```sql
USE dev_traffic_tms;

SELECT
    to_date(local_date) AS dt,
    page_type,
    count(event_id) AS events
FROM traffic.dwd_custom_hi__reg_live
WHERE to_date(local_date) BETWEEN to_date('2025-09-01') AND to_date('2025-09-30')
  AND operation = 'action'
GROUP BY to_date(local_date), page_type
ORDER BY dt, page_type;

🧾 Result / Log Summary

Query failed with error:
Job 2 cancelled because SparkContext was shut down

Detailed message:
Cannot call methods on a stopped SparkContext
Root cause: Spark session was terminated by platform before job completion.

💡 Analysis

The query triggered a wide scan, shuffle, and global sort (ORDER BY).
In Dev environment, long Spark jobs may be auto-killed due to timeout or resource limit.
The source table is large (tracking logs), scanning 30 days is expensive.

✅ Next Actions

Retry with smaller date ranges (1 day → 7 days → 30 days)
Remove ORDER BY to reduce shuffle
Record runtime for each test
Observe Spark log for shuffle and job stage information

🧠 Takeaways

DataSuite Dev queue kills long Spark sessions after a few minutes of heavy workload.
Global sorting (ORDER BY) is highly resource-intensive on distributed data.
Aggregation forces Spark to launch distributed computation (good for tuning practice).
Start small, expand gradually — matches mentor’s suggestion on “hands-on Spark tuning.”
