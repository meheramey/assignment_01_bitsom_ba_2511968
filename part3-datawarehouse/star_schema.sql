-- Task 3.1: Star Schema Design

-- 1. Create Dimension Tables
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(12, 2)
);

CREATE TABLE dim_store (
    store_key INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    quarter INT
);

-- 2. Create Fact Table
CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_key DATE,
    product_key INT,
    store_key INT,
    units_sold INT,
    total_revenue DECIMAL(15, 2),
    -- Foreign Key Relationships
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);

-- 3. INSERT Cleaned Data (Standardized from CSV)
-- Standardizing Casing and Handling NULLs

INSERT INTO dim_product (product_name, category, unit_price) VALUES 
('Speaker', 'Electronics', 49262.78),
('Tablet', 'Electronics', 23226.12),
('Phone', 'Electronics', 48703.39),
('Smartwatch', 'Electronics', 58851.01),
('Atta 10kg', 'Groceries', 52464.00),
('Jeans', 'Clothing', 2317.47),
('Biscuits', 'Groceries', 27469.99);

INSERT INTO dim_store (store_name, store_city) VALUES 
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune');

INSERT INTO dim_date VALUES 
('2023-08-29', 29, 8, 2023, 3),
('2023-12-12', 12, 12, 2023, 4),
('2023-05-02', 2, 5, 2023, 2),
('2023-02-20', 20, 2, 2023, 1),
('2023-01-15', 15, 1, 2023, 1),
('2023-09-08', 8, 9, 2023, 3),
('2023-03-31', 31, 3, 2023, 1),
('2023-10-26', 26, 10, 2023, 4),
('2023-08-12', 12, 8, 2023, 3),
('2023-08-15', 15, 8, 2023, 3);

-- Loading 10 Cleaned Fact Rows
-- Note: Date formats standardized to YYYY-MM-DD
INSERT INTO fact_sales VALUES 
('TXN5000', '2023-08-29', 1, 1, 3, 147788.34),
('TXN5001', '2023-12-12', 2, 1, 11, 255487.32),
('TXN5002', '2023-05-02', 3, 1, 20, 974067.80),
('TXN5003', '2023-02-20', 2, 2, 14, 325165.68),
('TXN5004', '2023-01-15', 4, 1, 10, 588510.10),
('TXN5005', '2023-09-08', 5, 3, 12, 629568.00),
('TXN5006', '2023-03-31', 4, 4, 6, 353106.06),
('TXN5007', '2023-10-26', 6, 4, 16, 37079.52),
('TXN5008', '2023-08-12', 7, 3, 9, 247229.91),
('TXN5009', '2023-08-15', 4, 3, 3, 176553.03);