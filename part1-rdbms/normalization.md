## Q1.1 Anomaly Analysis
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

## Q1.3 Normalization Justification
Keeping all the data in one single flat table might look easier at first, but it creates several problems as the business grows. My manager's argument that normalization is "over-engineering" is not practical because a flat table leads to data inconsistency and waste of storage space.

Redundancy and Storage Issues:
In the original flat file, every time a customer like 'Rohan Mehta' places a new order, his name, email, and city are repeated. If he places 50 orders, we are storing the same contact information 50 times in our system. By normalizing the data into a separate Customers table, we store his details only once and use a small customer_id to link his orders. This makes the database much lighter and cleaner.

Handling Data Anomalies:
Using specific examples from our dataset, normalization helps us avoid three main issues:

Update Anomaly: If the price of a 'Laptop' changes, in a flat file, we have to manually update the price in every single row where a laptop was ever sold. If we miss even one row, our data becomes inconsistent. In our normalized 3NF schema, we only need to change the price in one row in the Products table.

Deletion Anomaly: If we want to delete a specific order, in a flat file, we might accidentally delete the entire record of that customer if that was their only order in the system. In a normalized design, deleting an order record does not affect the customer's or the product's basic profile.

Insertion Anomaly: We cannot add a new Sales Representative or a new Product to a flat file unless an actual order has already been placed. With our new design, we can add new staff or inventory into their own tables independently at any time.

In conclusion, normalization is necessary for maintaining a "Single Source of Truth." It ensures that our data remains accurate, organized, and easy to manage as the business expands.
