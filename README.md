# data-learning-qiyan 📊

Hi, I’m Qiyan 👋  
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
