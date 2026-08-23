-- 1. Create the tables
CREATE TABLE dim_customer
(
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);


CREATE TABLE dim_product
(
    product_id VARCHAR(20) PRIMARY KEY,
    product_name TEXT,
    category VARCHAR(50),
    sub_category VARCHAR(50)
);


CREATE TABLE dim_location
(
    location_id VARCHAR(20) PRIMARY KEY,
    country VARCHAR(50),
    region VARCHAR(50),
    state VARCHAR(100),
    city VARCHAR(100),
    postal_code INT
);


CREATE TABLE dim_date
(
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    quarter VARCHAR(10),
    month INT,
    month_name VARCHAR(20)
);


CREATE TABLE fact_sales
(
    sales_id INT PRIMARY KEY,

    order_id VARCHAR(30),

    date_id INT,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    location_id VARCHAR(20),

    ship_mode VARCHAR(50),

    sales NUMERIC(12,2),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2),


    FOREIGN KEY(date_id)
    REFERENCES dim_date(date_id),

    FOREIGN KEY(customer_id)
    REFERENCES dim_customer(customer_id),

    FOREIGN KEY(product_id)
    REFERENCES dim_product(product_id),

    FOREIGN KEY(location_id)
    REFERENCES dim_location(location_id)
);

-- 2) Create Index
CREATE INDEX idx_sales_customer
ON fact_sales(customer_id);


CREATE INDEX idx_sales_product
ON fact_sales(product_id);


CREATE INDEX idx_sales_location
ON fact_sales(location_id);


CREATE INDEX idx_sales_date
ON fact_sales(date_id);
