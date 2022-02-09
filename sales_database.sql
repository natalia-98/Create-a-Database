-- Create sales database 
CREATE DATABASE sales;
USE sales;

-- Create table 1: orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_number_line VARCHAR(45),
    quantity INT,
    price FLOAT,
    sale_total FLOAT, 
    order_date DATETIME,
    quarter INT,
    product_code VARCHAR(45),
    customer_name VARCHAR(45),
    deal_size VARCHAR(45),
    PRIMARY KEY (order_number_line)
    );

-- Create table 2: customers
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customer_name VARCHAR(45),
    phone VARCHAR(45),
    address VARCHAR(100),
    city VARCHAR(45),
    state VARCHAR(45),
    country VARCHAR(45),
    contact_name VARCHAR(45),
    PRIMARY KEY (customer_name)
    );

-- Create table 3: products
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_code VARCHAR(45),
    msrp FLOAT,
    product_line VARCHAR(45),
    PRIMARY KEY (product_code)
    );

-- Create table 4: order_status
DROP TABLE IF EXISTS order_status;
CREATE TABLE order_status (
	order_number_line VARCHAR(45),
    status VARCHAR(45),
    FOREIGN KEY (order_number_line) REFERENCES orders(order_number_line)
    );
  
-- IMPORTANT NOTE: Import data into the empty data tables BEFORE adding foreign key constraints or else an error will occur.

-- Alter table 1: orders to add foreign keys
ALTER TABLE orders
ADD FOREIGN KEY (customer_name) REFERENCES customers(customer_name);

ALTER TABLE orders
ADD FOREIGN KEY (product_code) REFERENCES products(product_code);

