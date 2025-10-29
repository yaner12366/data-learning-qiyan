# data-learning-qiyan 📊

 
This repository documents my personal learning and practice projects in **data engineering** and **big data processing**.

My goal is to gradually build hands-on experience in:
- Data modelling (Kimball dimensional design, SCD handling…)
- Data quality validation and monitoring
- Distributed data compute (Spark)
- Distributed storage and table formats (Hive)
- Data pipeline orchestration & scheduling

---

## ✅ Current Learning Project

### 1️⃣ SG Checkout Event Data Quality Pipeline ✅
Purpose:
- Practice Spark SQL in Data Suite
- Apply basic data quality rules
- Build a mini DAG workflow with dependencies

Components:
- **Step1** Extract + aggregate metrics  
- **Step2** Derive top records for validation  
- **Step3** Run DQ checks (record ≥ 0, users ≤ records, keys not null)

Status:
✔ Workflow created  
✔ Manual trigger success  
🚧 Next: Daily scheduling with alert

| Screenshot |
|-----------|
| *(To be added – workflow DAG and logs)* |

---

## 🎯 Learning Roadmap

| Topic | Status | Notes |
|------|--------|------|
| Data Suite Spark SQL development | ✅ Started | |
| Basic DQ checks | ✅ Finished v1 | 3 rules implemented |
| Scheduled workflow & alerts | 🔜 Next | Use Task alerting |
| Partitioned Hive table writing | 🔜 | Performance experiment |
| Spark tuning on larger tables | 🔜 | Resource optimization |
| Data modelling: SCD, fact table types | 🧩 Learning | |

---

## 📌 Tracking Progress

Every improvement or new concept learned will be committed here.  
This is a growing portfolio toward becoming a Data Engineer.

Stay tuned. More to come! 🚀
## 📦 Pipeline: checkout_event_dq_pipeline

**Goal:** Build a tiny end-to-end pipeline for checkout events
- Step 1 `build_fact_table.sql`: aggregate day x region metrics into a fact view
- Step 2 `top_level_aggregation.sql`: derive top-N records by volume
- Step 3 `data_quality_checks.sql`: run three basic DQ checks

**Tables (desensitized):**
- Source: `analytics.sample_checkout_events(event_time, user_id, device_id, action_type, region, page_section, target_type)`
- Targets (dev only): 
  - `dev_sandbox.fact_checkout_sample`
  - `dev_sandbox.fact_checkout_sample_top`

**Run order:**
1. Execute `build_fact_table.sql`
2. Execute `top_level_aggregation.sql`
3. Execute `data_quality_checks.sql` (expect all zeros if clean)

**Notes:**
- Date window is hardcoded for demo. Replace with `${start_date}` and `${end_date}` variables when scheduling.
- Namespace `dev_sandbox` is a personal schema placeholder. Change to your own dev schema.
- Safe in dev. No writes to production tables.

