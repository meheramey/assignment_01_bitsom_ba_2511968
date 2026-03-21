## Storage Systems

For **Goal 1 — Predict patient readmission risk**, I chose **PostgreSQL** as the 
storage system. Patient data like past diagnoses, treatments, and visit history is 
structured and relational, so a traditional relational database works perfectly here. 
The ML model can pull this historical data in batches to train and run predictions.

For **Goal 2 — Allow doctors to query patient history in plain English**, I chose a 
**Vector Database (Pinecone)**. Patient records and clinical notes are converted into 
vector embeddings using a sentence transformer model. When a doctor types a question 
like "Has this patient had a cardiac event before?", the system converts that question 
into a vector and finds the most semantically similar records. This works much better 
than keyword search because medical language has many variations.

For **Goal 3 — Generate monthly reports**, I chose **Snowflake** as the data 
warehouse. Generating reports like bed occupancy or department-wise costs requires 
running heavy analytical queries on large amounts of historical data. Snowflake is an 
OLAP system built exactly for this — it uses columnar storage which makes these 
aggregation queries very fast.

For **Goal 4 — Stream and store real-time ICU vitals**, I chose **Apache Kafka** 
combined with **TimescaleDB**. Kafka handles the continuous high-speed data stream 
coming from ICU devices without any data loss. TimescaleDB is a time-series database 
that stores this data efficiently and supports fast queries like "show heart rate for 
last 5 minutes."

---

## OLTP vs OLAP Boundary

The OLTP side of the system handles all live, real-time operations. This includes 
patient admissions, doctor queries, ICU device data, and real-time alerts. PostgreSQL, 
Vector DB, Kafka, and TimescaleDB all sit on the OLTP side because they are designed 
for fast, frequent read and write operations on current data.

The OLAP boundary begins at the ETL pipeline. At regular intervals — for example 
every night — cleaned and processed data is moved from PostgreSQL and TimescaleDB 
into the Snowflake data warehouse. Once data crosses this boundary, it is used only 
for analysis and reporting, not for live operations. The BI engine and monthly report 
generation happen entirely on the OLAP side. This separation is important because 
running heavy analytical queries directly on the live PostgreSQL database would slow 
down real patient operations.

---

## Trade-offs

The biggest trade-off in this design is **data duplication across multiple systems**. 
The same patient data exists in three places — PostgreSQL for transactions, the Vector 
DB as embeddings, and Snowflake for analytics. If a patient record is updated or 
corrected in PostgreSQL, the embedding in the Vector DB and the record in Snowflake 
must also be updated. If this sync does not happen properly, different parts of the 
system will show inconsistent results. For example, a doctor's natural language query 
might return outdated information if the Vector DB was not updated after a record 
change.

To mitigate this, I would implement an **event-driven update pipeline using Kafka**. 
Whenever a record is updated in PostgreSQL, a change event is automatically published 
to a Kafka topic. The Vector DB updater and the ETL pipeline both listen to this topic 
and refresh their data accordingly. This keeps all three systems in sync without 
needing manual updates. Additionally, automated data quality checks should run 
periodically to catch any inconsistencies between systems before they affect doctors 
or reports.