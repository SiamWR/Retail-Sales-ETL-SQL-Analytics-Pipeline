--1. Check Table Row Counts
SELECT 
'Customers' AS table_name,
COUNT(*) AS rows

FROM dim_customer;



SELECT

'Products',

COUNT(*)

FROM dim_product;



SELECT

'Locations',

COUNT(*)

FROM dim_location;



SELECT

'Dates',

COUNT(*)

FROM dim_date;



SELECT

'Sales',

COUNT(*)

FROM fact_sales;

--2. Check Duplicate Customer IDs
SELECT

customer_id,

COUNT(*)

FROM dim_customer

GROUP BY customer_id

HAVING COUNT(*) > 1;

--3. Check Duplicate Product IDs
SELECT

product_id,

COUNT(*)

FROM dim_product

GROUP BY product_id

HAVING COUNT(*) > 1;

--4. Check Duplicate Sales IDs
SELECT

sales_id,

COUNT(*)

FROM fact_sales

GROUP BY sales_id

HAVING COUNT(*) > 1;

--5. Missing Customer Relationship
SELECT COUNT(*)

FROM fact_sales f

LEFT JOIN dim_customer c

ON f.customer_id=c.customer_id

WHERE c.customer_id IS NULL

--6. Missing Product Relationship
SELECT COUNT(*)

FROM fact_sales f

LEFT JOIN dim_product p

ON f.product_id=p.product_id

WHERE p.product_id IS NULL;

--7. Missing Date Relationship
SELECT COUNT(*)

FROM fact_sales f

LEFT JOIN dim_date d

ON f.date_id=d.date_id

WHERE d.date_id IS NULL;

--8. Missing Location Relationship
SELECT COUNT(*)

FROM fact_sales f

LEFT JOIN dim_location l

ON f.location_id=l.location_id

WHERE l.location_id IS NULL;

--9. Invalid Sales Values
SELECT *

FROM fact_sales

WHERE sales < 0;

--10. Invalid Quantity
SELECT *

FROM fact_sales

WHERE quantity <=0;

--11. Invalid Discount
SELECT *

FROM fact_sales

WHERE discount < 0

OR discount > 1;

