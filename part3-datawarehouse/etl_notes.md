# ETL Process and Data Cleaning Notes

## 1. Identified Issues in retail_transactions.csv
* **Date Formats:** Inconsistent formats like DD/MM/YYYY and YYYY-MM-DD.
* **Casing:** Mixed casing in categories (e.g., 'electronics' and 'Electronics').
* **NULLs:** Missing values in the `store_city` column.

## 2. Transformations Performed
* **Standardized Dates:** Converted all dates to YYYY-MM-DD.
* **Standardized Casing:** Capitalized all category names (e.g., 'Electronics').
* **Handled NULLs:** Filled missing cities based on store names.
* **Schema:** Organized data into a Star Schema (Fact and Dimension tables).