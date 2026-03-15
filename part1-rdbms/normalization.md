## Anomaly Analysis

The file orders_flat.csv contains information about orders, customers, products, and sales representatives in a single table. Since all the data is stored together, the same customer, product, and sales representative details are repeated in multiple rows. This design can lead to data anomalies such as insert anomaly, update anomaly, and delete anomaly.

## Insert Anomaly

An insert anomaly occurs when new information cannot be inserted into the database without adding other unrelated data.
In this dataset, product details are stored together with order details. If a new product is introduced but no order has been placed yet, it cannot be added to the table because the table requires an order_id and customer information.
For example, if a new product such as a "Keyboard" needs to be added to the system but no customer has ordered it yet, it cannot be inserted into the current table structure.

## Update Anomaly

An update anomaly occurs when the same data is stored in multiple rows and must be updated in many places.
In the dataset, customer information such as customer_name and customer_email appears multiple times for different orders. For example, the customer "Priya Sharma" appears in several rows.
If the email address of this customer changes, every row containing that email must be updated. If one row is missed, the database will contain inconsistent data.

## Delete Anomaly

A delete anomaly occurs when deleting one record also removes other important information from the database.
In this table, product and customer information are stored together with order data. If the only order containing a specific product is deleted, the information about that product may also be lost.
for example, if the only order that includes the product "Webcam" is deleted, the details of that product might disappear from the database even though the product still exists.
