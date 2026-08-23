--1. Overall Business KPIs
SELECT

SUM(sales) AS total_sales,

SUM(profit) AS total_profit,

COUNT(DISTINCT order_id) AS total_orders,

AVG(sales) AS average_sales

FROM fact_sales;

--2. Total Sales by Category
SELECT

p.category,

SUM(f.sales) AS revenue


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.category


ORDER BY revenue DESC;

--3. Profit by Category
SELECT

p.category,

SUM(f.profit) AS profit


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.category;

--4. Sales by Region
SELECT

l.region,

SUM(f.sales) AS revenue


FROM fact_sales f


JOIN dim_location l

ON f.location_id=l.location_id


GROUP BY l.region


ORDER BY revenue DESC;

--5. Profit by Region
SELECT

l.region,

SUM(f.profit) AS profit


FROM fact_sales f


JOIN dim_location l

ON f.location_id=l.location_id


GROUP BY l.region;

--6. Monthly Sales Trend
SELECT

d.year,

d.month,

d.month_name,

SUM(f.sales) AS revenue


FROM fact_sales f


JOIN dim_date d

ON f.date_id=d.date_id


GROUP BY

d.year,

d.month,

d.month_name


ORDER BY

d.year,

d.month;

--7. Top 10 Products
SELECT

p.product_name,

SUM(f.sales) AS revenue


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.product_name


ORDER BY revenue DESC


LIMIT 10;

--8. Top 10 Most Profitable Products
SELECT

p.product_name,

SUM(f.profit) AS profit


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.product_name


ORDER BY profit DESC


LIMIT 10;

--9. Top 10 Customers
SELECT

c.customer_name,

SUM(f.sales) AS revenue


FROM fact_sales f


JOIN dim_customer c

ON f.customer_id=c.customer_id


GROUP BY c.customer_name


ORDER BY revenue DESC


LIMIT 10;

--10. Customer Segment Analysis
SELECT

c.segment,

SUM(f.sales) AS revenue,

SUM(f.profit) AS profit

FROM fact_sales f

JOIN dim_customer c

ON f.customer_id=c.customer_id

GROUP BY c.segment;


--11. Average Order Value
SELECT

SUM(sales) /
COUNT(DISTINCT order_id)

AS average_order_value


FROM fact_sales;


--12. Profit Margin by Category
SELECT

p.category,


ROUND(

SUM(f.profit)
/
SUM(f.sales)
*100

,2)

AS profit_margin


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.category;
--13. Month-over-Month Growth
WITH monthly_sales AS
(

SELECT

d.year,

d.month,

SUM(f.sales) revenue


FROM fact_sales f


JOIN dim_date d

ON f.date_id=d.date_id


GROUP BY

d.year,

d.month

)


SELECT

year,

month,

revenue,


LAG(revenue)

OVER(

ORDER BY year,month

)

AS previous_month


FROM monthly_sales;
--14. Product Ranking
SELECT

p.product_name,


SUM(f.sales) AS revenue,


DENSE_RANK()

OVER(

ORDER BY SUM(f.sales) DESC

)

AS rank


FROM fact_sales f


JOIN dim_product p

ON f.product_id=p.product_id


GROUP BY p.product_name;
--15. Regional Ranking
SELECT

l.region,


SUM(f.sales) revenue,


DENSE_RANK()

OVER(

ORDER BY SUM(f.sales) DESC

)

AS ranking


FROM fact_sales f


JOIN dim_location l

ON f.location_id=l.location_id


GROUP BY l.region;