-- Q1.2: Create database and use it
CREATE DATABASE assignment_db;
USE assignment_db;

-- Create Customers table
CREATE TABLE customers(
  customer_id VARCHAR(10) PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  customer_email VARCHAR(100) NOT NULL,
  customer_city VARCHAR(50) NOT NULL
);

-- Insert data into Customers
INSERT INTO customers VALUES
('C001','Priya Sharma','priya@email.com','Mumbai'),
('C002','Rohan Mehta','rohan@email.com','Delhi'),
('C003','Anita Desai','anita@email.com','Mumbai'),
('C004','Vikram Singh','vikram@email.com','Bangalore'),
('C005','Neha Gupta','neha@email.com','Delhi');

-- Create Products table
CREATE TABLE products(
  product_id VARCHAR(10) PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  unit_price INT NOT NULL
);

-- Insert data into Products
INSERT INTO products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',800),
('P003','Keyboard','Electronics',1200),
('P004','Webcam','Electronics',2100),
('P005','Standing Desk','Furniture',22000);

-- Create Sales Reps table
CREATE TABLE sales_reps(
  sales_rep_id VARCHAR(10) PRIMARY KEY,
  sales_rep_name VARCHAR(100) NOT NULL,
  sales_rep_email VARCHAR(100),
  sales_rep_office_address TEXT
);

-- Insert data into Sales Reps
INSERT INTO sales_reps VALUES
('SR01','Ravi Kumar','ravi@email.com','Mumbai'),
('SR02','Anita Desai','anita@email.com','Delhi'),
('SR03','Deepak Joshi','deepak@email.com','Bangalore'),
('SR04','Amit Verma','amit@email.com','Hyderabad'),
('SR05','Kavya Rao','kavya@email.com','Pune');

-- Create Orders table
CREATE TABLE orders(
  order_id VARCHAR(10) PRIMARY KEY,
  customer_id VARCHAR(10),
  product_id VARCHAR(10),
  sales_rep_id VARCHAR(10),
  quantity INT NOT NULL,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Insert data into Orders
INSERT INTO orders VALUES
('ORD101','C001','P001','SR01',1,'2023-05-10'),
('ORD102','C002','P002','SR02',3,'2023-06-12'),
('ORD103','C003','P003','SR03',2,'2023-07-01'),
('ORD104','C004','P004','SR04',1,'2023-07-15'),
('ORD105','C005','P005','SR05',1,'2023-08-01');
