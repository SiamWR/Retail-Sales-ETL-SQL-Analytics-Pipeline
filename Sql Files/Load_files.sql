-- Load the files into SQL

COPY dim_customer

FROM 'D:/Retail sales projects/Project project/processed_tables/dim_customer.csv'

DELIMITER ','

CSV HEADER;

COPY dim_date

FROM 'D:/Retail sales projects/Project project/processed_tables/dim_date.csv'

DELIMITER ','

CSV HEADER;

COPY dim_product

FROM 'D:/Retail sales projects/Project project/processed_tables/dim_product.csv'

DELIMITER ','

CSV HEADER;

COPY dim_location

FROM 'D:/Retail sales projects/Project project/processed_tables/dim_location.csv'

DELIMITER ','

CSV HEADER;

COPY fact_sales

FROM 'D:/Retail sales projects/Project project/processed_tables/fact_sales.csv'

DELIMITER ','

CSV HEADER;
